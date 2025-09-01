const cds = require('@sap/cds');
const { orders } = cds.entities("SalesOrders");

module.exports = (srv) => {
    srv.before("*", (req) => {
        console.log(`Method: ${req.method}`);
        console.log(`Target: ${req.target}`);
    });

    //*******READ***/
    srv.on("READ", "Orders", async (req) => {
        if (req.data.Email !== undefined) {
            return await SELECT.from('sales.Orders').where({ Email: req.data.Email });
        }
        return await SELECT.from(Orders);
    });

    srv.after("READ", "Orders", (data) => {
        return data.map((order) => (order.Reviewed = true));
    });

    //*******CREATE***/
    srv.on("CREATE", "Orders", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run(
                INSERT.into(Orders).entries({
                    Email: req.data.Email,
                    FirstName: req.data.FirstName,
                    LastName: req.data.LastName,
                    Country: req.data.Country,
                    CreatedOn: req.data.CreatedOn,
                    DeliveryDate: req.data.DeliveryDate,
                    OrderStatus: req.data.OrderStatus,
                    ImageUrl: req.data.ImageUrl,
                })
            )
            .then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== "undefined") {
                    return req.data;
                } else {
                    req.error(409, "Record Not Insert");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });

    srv.before("CREATE", "Orders", (req) => {
        req.data.CreatedOn = new Date().toISOString().slice(0, 10);
        return req;
    });

    //*******UPDATE***/
    srv.on("UPDATE", "Orders", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run([
                UPDATE(Orders, req.data.Email).set({
                    FirstName: req.data.FirstName,
                    LastName: req.data.LastName,
                    Country: req.data.Country,
                    DeliveryDate: req.data.DeliveryDate,
                    OrderStatus: req.data.OrderStatus,
                })
            ])
            .then((resolve, reject) => {
                console.log("Resolve:", resolve);
                console.log("Reject:", reject);

                if (resolve[0] == 0) {
                    req.error(409, "Record Not Found");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });

    //*******DELETE***/
    srv.on("DELETE", "Orders", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run(
                DELETE.from(Orders).where({
                    ClientEmail: req.data.Email
                })
            )
            .then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (resolve !== 1) {
                    req.error(409, "Record Not Found");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return await returnData;
    });

};
