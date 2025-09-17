using com.logali.sales as logali from '../db/schema';

service CatalogService {
    entity Orders     as projection on logali.Orders;
    entity OrderItems as projection on logali.OrderItems;
};
