const cds = require('@sap/cds');
require('dotenv').config()

module.exports = class CatalogService extends cds.ApplicationService {

  async init() {

    const { Orders, OrderItems } = this.entities

    //------- READ ------------------------------
    this.on("READ", "Order", async (req) => {
      return await SELECT.from(Orders).columns([
        "*",
        { to_Items: ["*"] } // <- expand explícito
      ]);
    });

    //CREATE DRAFT
    this.before("NEW", Orders.drafts, async (req) => {
      if (!req.data.OrderStatus) {
        req.data.OrderStatus = 1
      }
      console.log(req.data);
    });

    return super.init()
  }
};