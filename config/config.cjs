require('dotenv').config();

module.exports = {
  production: process.env.DATABASE_URL
    ? {
        dialect: 'postgres',
        url: process.env.DATABASE_URL,
      }
    : {
        dialect: 'postgres',
        database: process.env.POSTGRES_DB,
        username: process.env.POSTGRES_USER,
        password: process.env.POSTGRES_PASSWORD,
        port: 5432,
        host: process.env.DATABASE_HOST,
      },
};

