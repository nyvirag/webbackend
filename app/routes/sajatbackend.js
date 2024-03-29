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
      database: 'fitnessapp_zarodoga'
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
  
   
//---------TÖRLÉS csevego-------------------
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




//---------TÖRLÉS blog-------------------
app.delete('/torlesblog', (req, res) => {
  kapcsolat()
  connection.query(`DELETE FROM blog WHERE blog_id=${req.body.bevitel1}`, function (err, rows, fields) {
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

app.post('/kaja_kategoriak_noi', (req, res) => {

  kapcsolat()
  connection.query(`SELECT * FROM kaja_noi 
  INNER JOIN suly_mertek ON kaja_noi.suly_mertek=suly_mertek.mertek_id 
  INNER JOIN suly_fajta on kaja_noi.suly_fajta = suly_fajta.suly_id
  WHERE kaja_kategoria =${req.body.bevitel1}`, (err, rows, fields) => {
    if (err) throw err

    console.log(rows)
    res.send(rows)
  })
  connection.end()
});


//-----------ferfi kategoria----------------
app.post('/kaja_kategoriak_ferfi', (req, res) => {

  kapcsolat()
  connection.query(`SELECT * FROM kaja_ferfi
                    INNER JOIN suly_mertek ON kaja_ferfi.suly_mertek = suly_mertek.mertek_id
                    INNER JOIN suly_fajta ON kaja_ferfi.suly_fajta = suly_fajta.suly_id
                   WHERE kaja_kategoria=${req.body.bevitel1}`, (err, rows, fields) => {
    if (err) throw err

    console.log(rows)
    res.send(rows)
  })
  connection.end()
});

//----------üzenetfelvitel-------------------
app.post('/uzenetfelvitel', (req, res) => {
  kapcsolat()
  
      connection.query(`INSERT INTO csevego VALUES (NULL, "${req.body.bevitel1}","${req.body.bevitel2}" )`, (err, rows, fields) => {
          if (err) {
              res.send("HIBA")
              console.log("HIBA")
          }
          else {
              console.log(rows)
              res.send(rows)
          }
  
  
  
      })
      connection.end()

    })

//-------------ujblog------------------------
app.post('/ujblog', (req, res) => {
  kapcsolat()
  
      connection.query(`INSERT INTO blog VALUES (NULL, "${req.body.bevitel1}", "${req.body.bevitel2}", "${req.body.bevitel3}")`, (err, rows, fields) => {
       // connection.query(`INSERT INTO blog (blog_datum, blog_uzenet, blog_nyelv) VALUES ('${bevitel1}', '${bevitel2}', '${bevitel3}')`, (err, rows, fields) => {
          if (err) {
              res.send("HIBA")
              console.log("HIBA", err)
          }
          else {
              console.log(rows)
              res.send(rows)
          }
  
  
  
      })
      connection.end()

    })

//--------------------blog magyar---------------------

app.get('/blog', (req, res) => {
  kapcsolat()
  
  connection.query(`SELECT * FROM blog`, (err, rows, fields) => {
  if (err) throw err
  
  console.log(rows)
  res.send(rows)
  })
  connection.end() 
  })

//--------------------blog angol---------------------

 app.get('/blogAngol', (req, res) => {
  kapcsolat()
  
  connection.query(`SELECT * FROM blog WHERE nyelv=1`, (err, rows, fields) => {
  if (err) throw err
  
  console.log(rows)
  res.send(rows)
  })
  connection.end() 
  })


//------------------------------------------------
app.post('/keresnoikaja', (req, res) => {
  kapcsolat()
  
  connection.query(`SELECT * FROM kaja_noi 
					INNER JOIN kaja_kategoria ON kaja_noi.kaja_kategoria=kaja_kategoria.kategoria_id 
					INNER JOIN suly_mertek ON kaja_noi.suly_mertek=suly_mertek.mertek_id 
					WHERE suly_fajta = ${req.body.bevitel1}`, (err, rows, fields) => {
  if (err) throw err
  
  console.log(rows)
  res.send(rows)
      console.log(req.body.bevitel1)
  })
  connection.end() 
  })




  //------------------------------------------------

  app.post('/keresferfikaja', (req, res) => {
    kapcsolat()
    
    connection.query(`SELECT * FROM kaja_ferfi 
            INNER JOIN kaja_kategoria ON kaja_ferfi.kaja_kategoria=kaja_kategoria.kategoria_id 
            INNER JOIN suly_mertek ON kaja_ferfi.suly_mertek=suly_mertek.mertek_id 
            WHERE suly_fajta = ${req.body.bevitel1}`, (err, rows, fields) => {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
    })
    connection.end() 
    })
  

  //--------------------------------------------------------------------
app.get('/sulyok', (req, res) => {
  kapcsolat()
  
  connection.query(`SELECT * FROM suly_fajta`, (err, rows, fields) => {
  if (err) throw err
  
  console.log(rows)
  res.send(rows)
  })
  connection.end() 
  })



};
