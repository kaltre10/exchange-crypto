async function getToken(data){

    const query = await fetch('Boleta/get_token');
    const tokenData = await query.json();

		//si se cambia de crypto a crypto se valor en PEN para efectos de SUNAT
		const dataQuery = await getCotizacionDivisaCrypto(data.moneda_recibe);
		if(data.moneda_recibe !== 'PEN' && data.moneda_recibe !== 'USD'){
			data.moneda_recibe = 'PEN';
			data.recibe = dataQuery * data.recibe;
		}
		
    let tipo;
		let tipoMoneda = data.moneda_recibe;
		let dataMonto =  data.recibe;
		
    if(data.tipo == 'COMPRA'){
			tipo = `Compra de ${data.moneda} ${data.monto}`;
    }else{
			tipo = `Venta de ${data.moneda} ${data.monto}`;
    }
    const montoText = numeroALetras(dataMonto,  data.moneda_recibe);
    const montoT = montoText.trim();
    const token = tokenData[0].token;
		
    data = { ...data, montoT, token, tipo, tipoMoneda, dataMonto };
		// console.log(data)
    
    const configData = configJson(data);

    // console.log(configData);

    const queryApi = await fetchApi(configData, token);
    const dataApi = await queryApi.json();
  //  console.log(dataApi)
    return dataApi;
}

function configJson(data){
 
    if(!data.cliente && data.clienteID == 0){
      data.cliente = ["REGULAR"];
    }

    if(!data.cliente && data.clienteID != 0){
      
      data.cliente = [];

      fetch('Clientes/get_cliente_id', {
          method: 'POST',
          headers: {
          'Content-Type': 'application/json',
          },
          body: JSON.stringify(data.clienteID)
        })
      .then(res => res.json())
      .then(res => {
        switch(res[0].doc_cliente){
          case "DNI":
              data.cliente[0] = 1;
              break;
          case "CE":
              data.cliente[0] = 4;
              break;
          case "RUC":
              data.cliente[0] = 6;
              break;
          case "PAS":
              data.cliente[0] = 7;
              break;
        }

        data.cliente[1] = res[0].n_cliente;
        data.cliente[2] = res[0].nom_cliente;
       
      })
    } 

    if(data.cliente.length === 1){
        data.cliente[0] = 0; //codigo o cliente general
        data.cliente[1] = 00000000;
        data.cliente[2] = "CLIENTE";
    }else{
        
        switch(data.cliente[0]){
            case "DNI":
                data.cliente[0] = 1;
                break;
            case "CE":
                data.cliente[0] = 4;
                break;
            case "RUC":
                data.cliente[0] = 6;
                break;
            case "PAS":
              data.cliente[0] = 7;
              break;
        }
    }

    let date = new Date();
   
    // let fechaBoleta = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}T${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`;
    const boletaData = {
        "ublVersion": "2.1",
        "tipoOperacion": "0101",
        "tipoDoc": "03",
        "serie": config.serieBoleta,
        "correlativo": data.correlativo,
        "fechaEmision": new Date("Y-m-dTH:i:s"),
        "formaPago": {
          "moneda": data.tipoMoneda,
          "tipo": "Contado"
        },
        "tipoMoneda": data.tipoMoneda,
        "client": {
          "tipoDoc": String(data.cliente[0]),
          "numDoc": Number(data.cliente[1]),
          "rznSocial": String(data.cliente[2]),
          "address": {
            "direccion": "LIMA",
            "provincia": "LIMA",
            "departamento": "LIMA",
            "distrito": "LIMA",
            "ubigueo": "150101"
          }
        },
        "company": {
          "ruc": config.ruc,
          "razonSocial": config.razonSocial,
          "nombreComercial": config.nombreComercial,
          "address": {
            "direccion": config.direccion,
            "provincia": "LIMA",
            "departamento": "LIMA",
            "distrito": "LIMA",
            "ubigueo": "150101"
          }
        },
        "mtoOperExoneradas": data.dataMonto,
        "mtoIGV": 0,
        "valorVenta": data.dataMonto,
        "totalImpuestos": 0,
        "subTotal": data.dataMonto,
        "mtoImpVenta": data.dataMonto,
        "details": [
          {
            "codProducto": "P001",
            "unidad": "NIU",
            "descripcion": data.tipo,
            "cantidad": 1,
            "mtoValorUnitario": data.dataMonto,
            "mtoValorVenta": data.dataMonto,
            "mtoBaseIgv": data.dataMonto,
            "porcentajeIgv": 0,
            "igv": 0,
            "tipAfeIgv": 20,
            "totalImpuestos": 0,
            "mtoPrecioUnitario": data.dataMonto
          }
        ],
        "legends": [
          {
            "code": "1000",
            "value": data.montoT
          }
        ]
    }
    // console.log(boletaData)
    return boletaData;
}

function fetchApi(data, token){
    return fetch('https://facturacion.apisperu.com/api/v1/invoice/send', {
        method: 'POST',
        headers: {
        'Content-Type': 'application/json',
        'Authorization': token
        },
        body: JSON.stringify(data)
    })
}

function fetcBaja(data, token){
  return fetch('https://facturacion.apisperu.com/api/v1/summary/send', {
      method: 'POST',
      headers: {
      'Content-Type': 'application/json',
      'Authorization': token
      },
      body: JSON.stringify(data)
  })
}

async function sendBaja(id, correlativo, fecha, mon_recibe, recibe, docCliente, numCliente){

  const query = await fetch('Boleta/get_token');
  const tokenData = await query.json();
  const token = tokenData[0].token;
  let date = new Date(fecha);
  let fechaBoleta = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}T00:00:00-22:00`;
	
	//si se cambia de crypto a crypto se valor en PEN para efectos de SUNAT
	const dataQuery = await getCotizacionDivisaCrypto(mon_recibe);
	if(mon_recibe !== 'PEN' && mon_recibe !== 'USD'){
		mon_recibe = 'PEN';
		recibe = dataQuery * recibe;
	}

	//data cliente
	if(docCliente === ''){
		docCliente = 0;
	}else{
		switch(docCliente){
			case "DNI":
					docCliente = 1;
					break;
			case "CE":
					docCliente = 4;
					break;
			case "RUC":
					docCliente = 6;
					break;
			case "PAS":
					docCliente = 7;
					break;
		}
	
	}
	
	let tipoMoneda = mon_recibe;
	let dataMonto =  recibe;

  const JSONBaja = {
		"fecGeneracion": fechaBoleta,
		"fecResumen": fechaBoleta,
		"correlativo": correlativo,
		"moneda": tipoMoneda,
		"company": {
			"ruc": config.ruc,
			"razonSocial": config.razonSocial,
			"nombreComercial": config.nombreComercial,
			"address": {
				"direccion": config.direccion,
				"provincia": "LIMA",
				"departamento": "LIMA",
				"distrito": "LIMA",
				"ubigueo": "150101"
			}
		},
		"details": [
			{
				"tipoDoc": "03",
				"serieNro": `${config.serieBoleta}-${correlativo}`,
				"estado": "3",
				"clienteTipo": String(docCliente),
				"clienteNro": String(numCliente),
				"total": parseFloat(dataMonto),
				"mtoOperGravadas": 0,
				"mtoOperInafectas": 0,
				"mtoOperExoneradas": 0,
				"mtoOperExportacion": 0,
				"mtoOtrosCargos": 0,
				"mtoIGV": 0
			}
		]
  }
  return fetcBaja(JSONBaja, token);
}

async function configJsonPdf(data){

  //obteniendo el token
  const query = await fetch('Boleta/get_token');
  const tokenData = await query.json();
  const token = tokenData[0].token;
  data.cliente = [];

  //si el cliente es generico
  if(data.cli_operacion == 0){

      data.cliente[0] = 0;
      data.cliente[1] = 00000000;
      data.cliente[2] = "CLIENTE";

  }else{
    //obteniendo el cliente
    const queryCustomer = await fetch('Clientes/get_cliente_id', {
      method: 'POST',
      headers: {
      'Content-Type': 'application/json',
      },
      body: JSON.stringify(data.cli_operacion)
    });
    const customer = await queryCustomer.json();
    
    switch(customer[0].doc_cliente){
          case "DNI":
              data.cliente[0] = 1;
              break;
          case "CE":
              data.cliente[0] = 4;
              break;
          case "RUC":
              data.cliente[0] = 6;
              break;
          case "PAS":
            data.cliente[0] = 7;
            break;
    }
    data.cliente[1] = customer[0].n_cliente;
    data.cliente[2] = customer[0].nom_cliente;
  }

	//si se cambia de crypto a crypto se valor en PEN para efectos de SUNAT
	const dataQuery = await getCotizacionDivisaCrypto(data.mon_rec_operacion);
	if(data.mon_rec_operacion !== 'PEN' && data.mon_rec_operacion !== 'USD'){
		data.mon_rec_operacion = 'PEN';
		data.rec_operacion = dataQuery * data.rec_operacion;
	}

  // console.log(data, token);
	let tipoMoneda = data.mon_rec_operacion;
	let dataMonto =  data.rec_operacion;
  let tipo;

  if(data.tip_operacion == 'COMPRA'){
    tipo = `Compra de ${data.div_operacion} ${data.mon_operacion}`;
  }else{
    tipo = `Venta de ${data.div_operacion} ${data.mon_operacion}`;
  }
  
  const montoText = numeroALetras(dataMonto, data.mon_rec_operacion);
  const montoT = montoText.trim();

  //ajuste fecha y hora
  let date = new Date(data.fec_operacion);
  let year = date.getFullYear();
  let mes = date.getMonth() + 1;
  let dia = date.getDate();
  let hora = date.getHours('11');
  let minutos = date.getMinutes() >= 10 ? date.getMinutes() : `0${date.getMinutes()}`;
  let segundos = date.getSeconds();
  // let fechaBoleta = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}T${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`;
  // console.log(`${year}-${mes}-${dia}T${hora}:${minutos}:${segundos}-05:00`)
  
  const boletaData = {
    "ublVersion": "2.1",
    "tipoOperacion": "0101",
    "tipoDoc": "03",
    "serie": config.serieBoleta,
    "correlativo": data.correlative_sunat,
    "fechaEmision": `${year}-${mes}-${dia}T${hora}:${minutos}:${segundos}-05:00`,
    "formaPago": {
      "moneda": tipoMoneda,
      "tipo": "Contado"
    },
    "tipoMoneda": tipoMoneda,
    "client": {
      "tipoDoc": String(data.cliente[0]),
      "numDoc": Number(data.cliente[1]),
      "rznSocial": String(data.cliente[2]),
      "address": {
        "direccion": "LIMA",
        "provincia": "LIMA",
        "departamento": "LIMA",
        "distrito": "LIMA",
        "ubigueo": "150101"
      }
    },
    "company": {
      "ruc": config.ruc,
				"razonSocial": config.razonSocial,
				"nombreComercial": config.nombreComercial,
				"address": {
					"direccion": config.direccion,
        "provincia": "LIMA",
        "departamento": "LIMA",
        "distrito": "LIMA",
        "ubigueo": "150101"
      }
    },
    "mtoOperExoneradas": 0,
    "mtoIGV": 0,
    "valorVenta": dataMonto,
    "totalImpuestos": 0,
    "subTotal": dataMonto,
    "mtoImpVenta": dataMonto,
    "details": [
      {
        "codProducto": "P001",
        "unidad": "NIU",
        "descripcion": tipo,
        "cantidad": 1,
        "mtoValorUnitario": dataMonto,
        "mtoValorVenta": dataMonto,
        "mtoBaseIgv": 0,
        "porcentajeIgv": 0,
        "igv": 0,
        "tipAfeIgv": 0,
        "totalImpuestos": 0,
        "mtoPrecioUnitario": dataMonto
      }
    ],
    "legends": [
      {
        "code": "1000",
        "value": montoT
      }
    ]
}
  // console.log(boletaData)
  return apiPdf(boletaData, token);
}

function apiPdf(data, token){
  return fetch('https://facturacion.apisperu.com/api/v1/invoice/pdf', {
      method: 'POST',
      headers: {
      'Content-Type': 'application/json',
      'Authorization': token
      },
      body: JSON.stringify(data)
  })
}

function formatDate(dateOperation){

  let date = new Date(dateOperation);

  let fechaBoleta = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}T${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`;

  return fechaBoleta;
}

//Obtener divisas para calcular el equivalente en usd mayor a 5000
const getCotizacionDivisaCrypto = async (divisa) => {
	const query = await fetch('Operaciones/get_divisas');
	const dataDivisas = await query.json();
	const cotizacion = dataDivisas.filter(d => d.cod_divisa === divisa)[0];
	return cotizacion.com_divisa;
}

const config = {
	ruc: 10012345678,
	razonSocial: "CARDENAS RAMOS MARI LUZ TRIGIDIA",
  nombreComercial: "El Fiel Test",
  direccion: "Avenida Tomás Marsano 2819 - Urbanización Higuereta. Santiago de Surco, Lima.",
	telefono: "000 000 000",
	serieBoleta: 'B001',
	regimen: "General"
}
