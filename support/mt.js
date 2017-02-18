
// relative paths in a .js file:
// Relative paths are relative to the HTML file in which the .js is included (with a <script element
//        <script type="text/javascript" src="support/poemsBDsp.js"></script>)
// Relative paths are not relative to the .js file itself - Write the paths as if
// the .js file were literally typed into the <head> HTML.

var isFirefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1 ;
//alert("isFirefox is " + isFirefox);

var XSLFile   = '';
var XMLFile   = '';
var targetDiv = '';
var SortBy    = '';
var ShowOnly  = '';

// <Type mID="m0022" Cab="B" pts="12" Name="Bembo" gr="Modern"/>

var mIDDsp    = '';
var CabDsp    = '';
var ptsDsp    = '';
var NameDsp   = '';
var grDsp     = '';

//
// =================
function fnFireFoxShow()
// -----------------
{
    var xslStylesheet;
    var xsltProcessor = new XSLTProcessor();

    // load XSLT file

    var myXMLHTTPRequest = new XMLHttpRequest();
    myXMLHTTPRequest.open("GET", XSLFile, false);
    myXMLHTTPRequest.send(null);

    xslStylesheet = myXMLHTTPRequest.responseXML;
    xsltProcessor.importStylesheet(xslStylesheet);

    // load XML file

    myXMLHTTPRequest = new XMLHttpRequest();
    myXMLHTTPRequest.open("GET", XMLFile, false);
    myXMLHTTPRequest.send(null);

    // pass in XSLT parameters
    // it is ok to pass in a parameter which is not mentioned in your XSLT.

    xsltProcessor.setParameter(null, 'isFirefox', isFirefox);

    xsltProcessor.setParameter(null, 'SortBy', SortBy);
    xsltProcessor.setParameter(null, 'ShowOnly', ShowOnly);

    xsltProcessor.setParameter(null, 'mIDDsp', mIDDsp);
    xsltProcessor.setParameter(null, 'CabDsp', CabDsp);
    xsltProcessor.setParameter(null, 'ptsDsp', ptsDsp);
    xsltProcessor.setParameter(null, 'NameDsp', NameDsp);
    xsltProcessor.setParameter(null, 'grDsp', grDsp);

    XMLFile = myXMLHTTPRequest.responseXML;
    var newStuff = xsltProcessor.transformToFragment(XMLFile, document);

    // address the innerHTML property of <div id="indexDiv" in HTML in browser
    // first set the innerHTML property to '' to wipe out whatever's there already
    // then append newStuff

    document.getElementById(targetDiv) .innerHTML = "";
    document.getElementById(targetDiv) .appendChild(newStuff);
}

// =================
function fnBrowserType()
// -----------------
{
    var ua = window.navigator.userAgent
    var msie = ua.indexOf("MSIE ")

    if (msie > 0) // is Microsoft Internet Explorer; return version number
    {
        alert("fnBrowserType returning IE");
        return "IE";
    }
    else
    {
        var ns = ua.indexOf("Mozilla")
        //alert("fnBrowserType ns " + ns + " and ua " + ua );

        if (ua != 0)
        {
          //both firefox 11 & Chrome return NS - April 2012
          return "NS";

        } else
        {
            //alert("fnBrowserType returning UN");
            return "UN";
        }
    }
}

// =================
function fnShow()
// -----------------
{
    if (fnBrowserType() == "NS")
    {
        fnFireFoxShow();
    }
    else
    {
        fnIEShow();
    }
}

// =================
function fnMtDspStart()
// -----------------
// Mt - Metal type
// <body onload="javascript:fnMtDspStart();">  XSLFile = 'support/mt.xsl';
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/mt.xml';
    XSLFile = 'support/mt.xsl';

    mIDDsp   = 'show';
    CabDsp   = 'show';
    ptsDsp   = 'show';
    NameDsp  = 'show';
    grDsp    = 'show';

    SortBy   = 'Name';

    fnBrowserType();

    if (fnBrowserType() == "IE")
      // poemsBDspF.css for Firefox, poemsBDspIE.css for IE
      // + same second for both, poemsBDsp.css
      // poemsBDsp.htm has for Firefox
      //   <link rel="stylesheet" href="support/poemsBDspF.css" type="text/css"/>
      // if IE, href="support/poemsBDspF.css" is replaced by support/poemsBDspIE.css:
    {
        document.styleSheets[0].href = 'support/poemsBDspIE.css';
    }

    //alert("fnMtDspStart");
    fnShow();
}

// =================
function fnSortBy(arg)
// -----------------
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/mt.xml';
    XSLFile = 'support/mt.xsl';

    SortBy = arg;
    ShowOnly = '';

    fnShow();
}

// =================
function fnShowOnly(arg)
// -----------------
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/mt.xml';
    XSLFile = 'support/mt.xsl';

    if (arg == "all")
    {
        ShowOnly = '';
    } else
    {
		// alert('showing only ' + arg);
        ShowOnly = arg;
    }

    fnShow();
}

// =================
function fnShowCol(arg)
// -----------------
// javascript:fnShowCol('mcn')
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/mt.xml';
    XSLFile = 'support/mt.xsl';

    if (arg == "mID")
    {
        mIDDsp = 'show';
    }

    if (arg == "Cab")
    {
        CabDsp= 'show';
    }

    if (arg == "pts")
    {
        ptsDsp= 'show';
    }

    if (arg == "Name")
    {
        NameDsp = 'show';
    }

    if (arg == "gr")
    {
        grDsp = 'show';
    }

    fnShow();
}

// =================
function fnHideCol(arg)
// -----------------
// javascript:fnHideCol('mcn')
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/mt.xml';
    XSLFile = 'support/mt.xsl';

    if (arg == "mID")
    {
        mIDDsp = '';
    }

    if (arg == "Cab")
    {
        CabDsp= '';
    }

    if (arg == "pts")
    {
        ptsDsp= '';
    }

    if (arg == "Name")
    {
        NameDsp = '';
    }

    if (arg == "gr")
    {
        grDsp = '';
    }

    fnShow();
}

// =================
function fnSayHello()
// -----------------

{
    alert('hello');
}














