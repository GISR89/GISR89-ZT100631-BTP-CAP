using {CatalogService as service} from '../catalog-service';

annotate service.OrderItems with {
  Name             @title: 'Name';
  Description      @title: 'Description';
  ReleaseDate      @title: 'Release Date';
  DiscontinuedDate @title: 'Discontinued Date';
  Price            @title: 'Price';
  Height           @title: 'Height';
  Width            @title: 'Width';
  Depth            @title: 'Depth';
  Quantity         @title: 'Quantity';
  UnitOfMeasure    @title: 'Unit Of Measure';
};

annotate service.OrderItems with @UI: {
  Identification : [{Value: Name}],
  HeaderInfo     : {
    TypeName      : '{i18n>Items}',
    TypeNamePlural: '{i18n>Items}',
    Title         : {Value: Name},
    Description   : {
      $Type: 'UI.DataField',
      Value: '{i18n>ID}'
    }
  },

  SelectionFields: [],
  LineItem       : [
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Name}',
      Value: Name,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Description}',
      Value: Description,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>ReleaseDate}',
      Value: ReleaseDate,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>DiscontinuedDate}',
      Value: DiscontinuedDate,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Price}',
      Value: Price,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Height}',
      Value: Height,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Width}',
      Value: Width,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Depth}',
      Value: Depth,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Quantity}',
      Value: Quantity,
    },
     {
      $Type: 'UI.DataField',
      Label: '{i18n>UnitOfMeasure}',
      Value: UnitOfMeasure
    }
  ]
};

annotate service.OrderItems with @UI: {
  FieldGroup #General: {Data: [
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Name}',
      Value: Name
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Description}',
      Value: Description
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Price}',
      Value: Price
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Height}',
      Value: Height,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Width}',
      Value: Width,
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Depth}',
      Value: Depth
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>Quantity}',
      Value: Quantity
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>ReleaseDate}',
      Value: ReleaseDate
    },
    {
      $Type: 'UI.DataField',
      Label: '{i18n>DiscontinuedDate}',
      Value: DiscontinuedDate
    },
     {
      $Type: 'UI.DataField',
      Label: '{i18n>UnitOfMeasure}',
      Value: UnitOfMeasure
    }
  ]},

  Facets             : [{
    $Type : 'UI.ReferenceFacet',
    Label : '{i18n>GeneralData}',
    Target: '@UI.FieldGroup#General'
  }]
};
