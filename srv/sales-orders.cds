using sales from '../db/schema';

service SalesOrders {
    entity Orders     as projection on sales.Orders;
    entity OrderItems as projection on sales.OrderItems;
}
