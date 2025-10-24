using {CatalogService} from '../../srv/cat-service.cds';

////////////////////////////////////////////////////////////////////////////
//
//	Books Object Page
//
annotate CatalogService.Books with @(UI: {
  HeaderInfo       : {
    TypeName      : '{i18n>Book}',
    TypeNamePlural: '{i18n>Books}',
    Title         : {Value: title},
    Description   : {Value: author}
  },
  HeaderFacets     : [{
    $Type : 'UI.ReferenceFacet',
    Label : '{i18n>Description}',
    Target: '@UI.FieldGroup#Descr'
  }, ],
  Facets           : [{
    $Type : 'UI.ReferenceFacet',
    Label : '{i18n>Details}',
    Target: '@UI.FieldGroup#Price'
  }, 
 
    ],
  FieldGroup #Descr: {Data: [{Value: descr}, ]},
  FieldGroup #Price: {Data: [
    {Value: price},
    {
      Value: currency_code,
      Label: '{i18n>Currency}'
    },
    { Value: ID,
      Label: '{i18n>UserID}' 
    },
    { Value: genre_ID,
      Label: '{i18n>Genre}' 
    },
    { Value: stock,
      Label: '{i18n>Stock}' 
    },
    { Value: author,
      Label: '{i18n>Author}' 
    },
    


  ]},
});

////////////////////////////////////////////////////////////////////////////
//
//	Books List Page
//
annotate CatalogService.Books with @(UI: {
  SelectionFields: [
    ID,
    price,
    currency_code,
    genre.name,
  ],
  LineItem       : [
    {
      Value: ID,
      Label: '{i18n>Title}'
    },
    {
      Value: author,
      Label: '{i18n>Author}'
    },
    {Value: genre.name},
    {Value: price},
//    {Value: currency.symbol},
    {Value: currency_code}
  ]
});
