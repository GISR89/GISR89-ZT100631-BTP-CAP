sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/logali/orders/test/integration/pages/OrdersList",
	"com/logali/orders/test/integration/pages/OrdersObjectPage",
	"com/logali/orders/test/integration/pages/OrderItemsObjectPage"
], function (JourneyRunner, OrdersList, OrdersObjectPage, OrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/logali/orders') + '/index.html',
        pages: {
			onTheOrdersList: OrdersList,
			onTheOrdersObjectPage: OrdersObjectPage,
			onTheOrderItemsObjectPage: OrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

