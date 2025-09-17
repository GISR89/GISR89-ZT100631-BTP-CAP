using {CatalogService as service} from '../catalog-service';

annotate service.Orders with @odata.draft.enabled;

annotate service.Orders with {
    Email        @title: 'Email'       @Common.FieldControl: #Mandatory;
    FirstName    @title: 'First Name';
    LastName     @title: 'Last Name';
    Country      @title: 'Country';
    CreatedOn    @title: 'Created On'  @Common.FieldControl: #ReadOnly;
    DeliveryDate @title: 'Delivey Date';
    OrderStatus  @title: 'Order Status';
    ImageUrl     @title: 'Image Url';
};

annotate service.Orders with @UI: {

    HeaderInfo         : {
        TypeName      : '{i18n>Order}',
        TypeNamePlural: '{i18n>Orders}',
        ImageUrl      : ImageUrl,
        Title         : {
            $Type: 'UI.DataField',
            Value: Email
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: DeliveryDate
        }
    },
    PresentationVariant: {
        Text          : 'Default',
        Visualizations: ['@UI.LineItem'],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : Email,
            Descending: true
        }]
    },
    SelectionFields    : [
        OrderStatus,
        DeliveryDate
    ],
    LineItem           : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>ImageUrl}',
            Value: ImageUrl,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Email}',
            Value: Email,
        },
        {
            $Type                : 'UI.DataField',
            Label                : '{i18n>FistName}',
            Value                : FirstName,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem'
            },
        },
        {
            $Type                : 'UI.DataField',
            Label                : '{i18n>LastName}',
            Value                : LastName,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem'
            },
        },
        {
            $Type                : 'UI.DataField',
            Label                : '{i18n>Country}',
            Value                : Country,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem'
            },
        },
        {
            Label      : '{i18n>OrderStatus}',
            Value      : OrderStatus,
            Criticality: OrderStatus
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>CreatedOn}',
            Value: CreatedOn,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>DeliveryDate}',
            Value: DeliveryDate,
        }
    ]
};

annotate service.Orders with {
    ImageUrl @(UI.IsImageURL: true)
};

annotate service.Orders with @UI: {

    FieldGroup #Header: {Data: [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Email}',
            Value: Email,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>FirstName}',
            Value: FirstName,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>LastName}',
            Value: LastName,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Country}',
            Value: Country,
        },
        {
            $Type      : 'UI.DataField',
            Label      : '{i18n>OrderStatus}',
            Value      : OrderStatus,
            Criticality: OrderStatus
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>CreatedOn}',
            Value: CreatedOn,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>DeliveryDate}',
            Value: DeliveryDate,
        },

    ]},

    Facets            : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Orders}',
            ID    : 'Orders',
            Facets: [{ 
                $Type : 'UI.ReferenceFacet',
                ID    : 'DateData',
                Target: '@UI.FieldGroup#Header',
                Label : '{i18n>Dates}'
            }]
        },
        { 
            $Type : 'UI.ReferenceFacet',
            Target: 'to_Items/@UI.LineItem',
            Label : '{i18n>Items}'
        }
    ]
};
