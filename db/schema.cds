namespace com.logali;

using {
    cuid,
    managed,

} from '@sap/cds/common';

context sales {
    entity Orders : cuid, managed {
        Email        : String not null;
        FirstName    : String;
        LastName     : String;
        Country      : localized String;
        CreatedOn    : Date @cds.on.insert : $now;   // <- esto genera la fecha automáticamente
        DeliveryDate : Date;
        OrderStatus  : Integer;
        ImageUrl     : String;
        to_Items     : Composition of many OrderItems
                           on to_Items.to_Orders = $self;

    };

    entity OrderItems : cuid, {
        Name             : String;
        Description      : String;
        ReleaseDate      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Decimal(12, 2);
        Height           : Decimal(15, 3);
        Width            : Decimal(13, 3);
        Depth            : Decimal(12, 2);
        Quantity         : Decimal(16, 2);
        UnitOfMeasure    : String;
        to_Orders        : Association to Orders;
    };
}
