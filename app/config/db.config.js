module.exports = {
  HOST: "localhost",
  USER: "root",
  PASSWORD: "",
  DB: "fitnessapp_zarodoga",
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};
