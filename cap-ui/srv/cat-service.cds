using {sap.capire.bookshop as my} from '../db/schema';

service CatalogService {

  /** For displaying lists of Books */
  @readonly
  entity ListOfBooks as
    projection on my.Books{
    ID,
    title,
    author.name as authorName,         
    genre,
    price,
    stock,
    currency
  };

  /** For display in details pages */
  @readonly
  entity Books       as
    projection on my.Books {
      *,
      author.name as authorName, 
      @Common.ValueList.entity: 'CatalogService.Authors'
      genre,
      price
      
      
    }
    excluding {
      createdBy,
      modifiedBy
    };

   
  @requires: 'authenticated-user'
  action submitOrder(book : Books : ID  @mandatory,
                     quantity : Integer @mandatory
  ) returns {
    stock                         : Integer
  };

  event OrderedBook : {
    book     : Books : ID;
    quantity : Integer;
    buyer    : String
  };
}

