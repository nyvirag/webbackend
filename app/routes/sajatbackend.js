const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  
  var connection
  function kapcsolat(){
    var mysql = require('mysql')

    connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'web_zarodoga'
    })
    
    connection.connect()
    
  }
  
  
  app.get('/film', (req, res) => {
    kapcsolat()
    connection.query('SELECT * from film', function (err, rows, fields) {
      if (err) throw err
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()
  })


  app.post('/szavazatfelvitel', (req, res) => {
    kapcsolat()
    connection.query('insert into szavazat values (null,'+req.body.bevitel1+')', function (err, rows, fields) {
      if (err) {
        console.log("Hiba!")
        res.send("Hiba!")
      }
      else {
      console.log("Szavazatát rögzítettük!")
      res.send("Szavazatát rögzítettük!")
    }
    })
    connection.end()
  })

app.post('/keres', (req, res) => {
  kapcsolat()    
    let parancs='SELECT * from film where film_cim like "%'+req.body.bevitel1+'%"'
    connection.query(parancs, function (err, rows, fields) {
      if (err) {
        console.log("Hiba")
      }
    else{
      console.log(rows)
      res.send(rows)
    }
     
    })
    
    connection.end()
 })
 
  //sajat backend vegpont--------------------------------------------------------------------
  app.get('/gyakorlatok', (req, res) => {

    kapcsolat()
    connection.query('SELECT * FROM gyakorlatok', (err, rows, fields) => {
      if (err) throw err
  
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  });
  

  //------------izomcsoportok keresése--------------------
app.get('/izomcsoportok', (req, res) => {

  kapcsolat()
  connection.query('SELECT * FROM izomcsoportok', (err, rows, fields) => {
    if (err) throw err

    console.log(rows)
    res.send(rows)
  })
  connection.end()
});




app.post('/keresszoveg', (req, res) => {
  kapcsolat()
  
  connection.query(`SELECT * FROM gyakorlatok INNER JOIN izomcsoportok ON gyakorlatok.izomcsoport=izomcsoportok.izomcsoport_id WHERE izomcsoportok.izomcsoport_id = ${req.body.bevitel1}`, (err, rows, fields) => {
  if (err) throw err
  
  console.log(rows)
  res.send(rows)
  })
  connection.end() 
  })
  
 
  //-----------------------------------------------------------------------
  app.get('/diagram', (req, res) => {

    kapcsolat()
    connection.query(`SELECT film.film_cim, COUNT(*) AS darabszam FROM szavazat INNER JOIN film ON film.film_id = szavazat.szavazat_film GROUP BY film_id;`, (err, rows, fields) => {
      if (err) throw err
  
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  });

  //-----------csevego--------------
  app.get('/csevegole', (req, res) => {
    kapcsolat()
    
    connection.query(`SELECT * FROM csevego`, (err, rows, fields) => {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
    })
    connection.end() 
    })
  
   
//---------TÖRLÉS-------------------
app.delete('/torles', (req, res) => {
  kapcsolat()
  connection.query(`DELETE FROM csevego WHERE csevego_id=${req.body.bevitel1}`, function (err, rows, fields) {
    if (err) {
      console.log("Hiba!")
      res.send("Hiba!")
    }
    else {
    console.log("A törlés sikeres")
    res.send("A törlés sikeres")
  }
  })
  connection.end()
})

};
