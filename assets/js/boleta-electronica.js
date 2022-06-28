async function getToken(data){

    const query = await fetch('Boleta/get_token');
    const tokenData = await query.json();

    let cantidad;
    let tipo;
  
    if(data.tipo == 'COMPRA'){
        tipo = `Compra de ${data.moneda}`;
    }else{
        tipo = `Venta de ${data.moneda}`;
    }
   
    const montoText = numeroALetras(data.recibe);
    const montoT = montoText.trim();
    const token = tokenData[0].token;
  
    data = { ...data, montoT, token, tipo };
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
    console.log(data)
    const boletaData = {
        "ublVersion": "2.1",
        "tipoOperacion": "0101",
        "tipoDoc": "03",
        "serie": "B001",
        "correlativo": data.correlativo,
        "fechaEmision": "2022-06-07T14:00:04-05:00",
        "formaPago": {
          "moneda": data.moneda,
          "tipo": "Contado"
        },
        "tipoMoneda": data.moneda_recibe,
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
          "ruc": 20609364212,
          "razonSocial": "EWFOREX",
          "nombreComercial": "EWFOREX",
          "address": {
            "direccion": "Av del Ejército 768, Miraflores",
            "provincia": "LIMA",
            "departamento": "LIMA",
            "distrito": "LIMA",
            "ubigueo": "150101"
          }
        },
        "mtoOperExoneradas": data.recibe,
        "mtoIGV": 0,
        "valorVenta": data.recibe,
        "totalImpuestos": 0,
        "subTotal": data.recibe,
        "mtoImpVenta": data.recibe,
        "details": [
          {
            "codProducto": "P001",
            "unidad": "NIU",
            "descripcion": data.tipo,
            "cantidad": data.monto,
            "mtoValorUnitario": data.cotizacion,
            "mtoValorVenta": data.recibe,
            "mtoBaseIgv": data.recibe,
            "porcentajeIgv": 0,
            "igv": 0,
            "tipAfeIgv": 20,
            "totalImpuestos": 0,
            "mtoPrecioUnitario": data.cotizacion
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
  return fetch('https://facturacion.apisperu.com/api/v1/voided/send', {
      method: 'POST',
      headers: {
      'Content-Type': 'application/json',
      'Authorization': token
      },
      body: JSON.stringify(data)
  })
}

async function sendBaja(id, fecha){

  const query = await fetch('Boleta/get_token');
  const tokenData = await query.json();
  const token = tokenData[0].token;

  let date = new Date(fecha);
  let fechaBoleta = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}T00:00:00-22:00`;
  
  const JSONBaja = {
    "correlativo": id,
    "fecGeneracion": fechaBoleta,
    "fecComunicacion": fechaBoleta,
    "company": {
      "ruc": 20609364212,
      "razonSocial": "EWFOREX",
      "nombreComercial": "EWFOREX",
      "address": {
        "direccion": "Av del Ejército 768, Miraflores",
        "provincia": "LIMA",
        "departamento": "LIMA",
        "distrito": "LIMA",
        "ubigueo": "150101"
      }
    },
    "details": [
      {
        "tipoDoc": "01",
        "serie": "F001",
        "correlativo": id,
        "desMotivoBaja": "ANULADO"
      },
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

  // console.log(data, token);

  let tipo;
  if(data.tip_operacion == 'COMPRA'){
    tipo = `Compra de ${data.div_operacion}`;
  }else{
    tipo = `Venta de ${data.div_operacion}`;
  }
  
  const montoText = numeroALetras(data.rec_operacion);
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
    "serie": "B001",
    "correlativo": data.correlative_sunat,
    "fechaEmision": `${year}-${mes}-${dia}T${hora}:${minutos}:${segundos}-05:00`,
    "formaPago": {
      "moneda": data.div_operacion,
      "tipo": "Contado"
    },
    "tipoMoneda": data.mon_rec_operacion,
    "client": {
      "tipoDoc": data.cliente[0],
      "numDoc": data.cliente[1],
      "rznSocial": data.cliente[2],
      "address": {
        "direccion": "LIMA",
        "provincia": "LIMA",
        "departamento": "LIMA",
        "distrito": "LIMA",
        "ubigueo": "150101"
      }
    },
    "company": {
      "ruc": 20609364212,
      "razonSocial": "EWFOREX",
      "nombreComercial": "EWFOREX",
      "address": {
        "direccion": "Av del Ejército 768, Miraflores",
        "provincia": "LIMA",
        "departamento": "LIMA",
        "distrito": "LIMA",
        "ubigueo": "150101"
      }
    },
    "mtoOperExoneradas": data.rec_operacion,
    "mtoIGV": 0,
    "valorVenta": data.rec_operacion,
    "totalImpuestos": 0,
    "subTotal": data.rec_operacion,
    "mtoImpVenta": data.rec_operacion,
    "details": [
      {
        "codProducto": "P001",
        "unidad": "NIU",
        "descripcion": tipo,
        "cantidad": data.mon_operacion,
        "mtoValorUnitario": data.cot_operacion,
        "mtoValorVenta": data.rec_operacion,
        "mtoBaseIgv": data.rec_operacion,
        "porcentajeIgv": 0,
        "igv": 0,
        "tipAfeIgv": 20,
        "totalImpuestos": 0,
        "mtoPrecioUnitario": data.cot_operacion
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