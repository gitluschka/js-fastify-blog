require('dotenv').config();

module.exports = {
  production: {
    dialect: 'postgres',
    database: process.env.POSTGRES_DB,
    username: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    port: 5432,
    host: process.env.DATABASE_HOST,
  },
};
