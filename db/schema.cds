namespace sales;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Orders : cuid, managed {
    Email        : String not null;
    FirstName    : String;
    LastName     : String;
    Country      : localized String;
    CreatedOn     : DateTime;
    DeliveryDate : DateTime;
    OrderStatus  : Integer;
    ImageUrl     : String;
    items        : Composition of many OrderItems
                       on items.order = $self;

};

entity OrderItems : cuid, managed {
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
    order            : Association to Orders
};
