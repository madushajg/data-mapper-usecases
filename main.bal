

type Title record {|
    string \-lang;
    string \#text;
|};

type BookWithStructuredTitle record {|
    string \-category;
    Title title;
    (string|string[]) author;
    string year;
    string price;
    string \-cover?;
|};

type InputWithStructuredTitle record {|
    BookWithStructuredTitle[] books;
|};

type Properties record {|
    Title title;
    (string|string[]) author;
    int year;
|};

type TransformedBookWithProperties record {|
    string category;
    float price;
    int id;
    Properties properties;
|};

type OutputWithProperties record {|
    TransformedBookWithProperties[] items;
|};

function mapDataWithDefaultsViaRecords(InputWithStructuredTitle input) returns OutputWithProperties|error => 
    let BookWithStructuredTitle[] books = input.books in 
    {
        items: from var entry in books.enumerate() 
                    select {
                        category: "book",
                        price: check float:fromString(entry[1].price),
                        id: entry[0],
                        properties: {
                            title: entry[1].title,
                            author: entry[1].author,
                            year: check int:fromString(entry[1].year)
                        }
                    }
    };
    