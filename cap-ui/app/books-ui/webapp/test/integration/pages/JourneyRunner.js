sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"booksui/test/integration/pages/ListOfBooksList",
	"booksui/test/integration/pages/ListOfBooksObjectPage",
	"booksui/test/integration/pages/Books_textsObjectPage"
], function (JourneyRunner, ListOfBooksList, ListOfBooksObjectPage, Books_textsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('booksui') + '/test/flp.html#app-preview',
        pages: {
			onTheListOfBooksList: ListOfBooksList,
			onTheListOfBooksObjectPage: ListOfBooksObjectPage,
			onTheBooks_textsObjectPage: Books_textsObjectPage
        },
        async: true
    });

    return runner;
});

