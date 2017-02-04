
// relative paths in a .js file:
// Relative paths are relative to the HTML file in which the .js is included (with a <script element
//        e.g. <script type="text/javascript" src="support/poemsBDsp.js"></script>)
// Relative paths are not relative to the .js file itself - Write the paths as if
// the .js file were literally typed into the <head> HTML.

var isFirefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1 ;
//alert("isFirefox is " + isFirefox);

var XSLFile   = '';
var XMLFile   = '';
var targetDiv = '';
var SortBy    = '';
var ShowOnly  = '';

var wcnDsp        = 'show';
var caryNumDsp    = 'show';

var mfgDsp        = '';
var mfgMarkDsp    = '';
var mfgMarkjpgDsp = '';
var mfgDateDsp    = '';
var mfgLocDsp     = '';
var methodDsp     = '';
var sizeDsp       = '';
var dimsDsp       = '';

var classDsp      = 'show';
var subDsp        = 'show';
var grpDsp        = 'show';
var modDsp        = 'show';
var tnameDsp      = 'show';
var designDsp     = 'show';
var refDsp        = 'show';

var numCharDsp    = '';
var ucYNDsp       = '';
var lcYNDsp       = '';
var numsYNDsp     = '';
var areaLocDsp    = '';
var secLocDsp     = '';
var caseLocDsp    = '';
var descLocDsp    = '';
var acSourceDsp   = '';
var acDateDsp     = '';
var resDsp        = '';
var photoDsp      = '';
var prfDsp        = '';
var condDsp       = '';
var notesDsp      = '';
var catDsp        = '';
var catDateDsp    = '';

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

    xsltProcessor.setParameter(null, 'wcnDsp', wcnDsp);
    xsltProcessor.setParameter(null, 'caryNumDsp', caryNumDsp);
    
    xsltProcessor.setParameter(null, 'mfgDsp', mfgDsp);
    xsltProcessor.setParameter(null, 'mfgMarkDsp', mfgMarkDsp);
    xsltProcessor.setParameter(null, 'mfgMarkjpgDsp', mfgMarkjpgDsp);
    xsltProcessor.setParameter(null, 'mfgDateDsp', mfgDateDsp);
    xsltProcessor.setParameter(null, 'mfgLocDsp', mfgLocDsp);
    xsltProcessor.setParameter(null, 'methodDsp', methodDsp);
    
    xsltProcessor.setParameter(null, 'classDsp', classDsp);
    xsltProcessor.setParameter(null, 'subDsp', subDsp);
    xsltProcessor.setParameter(null, 'grpDsp', grpDsp);
    xsltProcessor.setParameter(null, 'modDsp', modDsp);
    xsltProcessor.setParameter(null, 'tnameDsp', tnameDsp);
    xsltProcessor.setParameter(null, 'designDsp', designDsp);
    xsltProcessor.setParameter(null, 'refDsp', refDsp);

    xsltProcessor.setParameter(null, 'sizeDsp', sizeDsp);
    xsltProcessor.setParameter(null, 'dimsDsp', dimsDsp);    
    xsltProcessor.setParameter(null, 'numCharDsp', numCharDsp);
    xsltProcessor.setParameter(null, 'ucYNDsp', ucYNDsp);
    xsltProcessor.setParameter(null, 'lcYNDsp', lcYNDsp);
    xsltProcessor.setParameter(null, 'numsYNDsp', numsYNDsp);
    xsltProcessor.setParameter(null, 'resDsp', resDsp);
    xsltProcessor.setParameter(null, 'condDsp', condDsp);
    xsltProcessor.setParameter(null, 'notesDsp', notesDsp);
    xsltProcessor.setParameter(null, 'prfDsp', prfDsp);
     
    xsltProcessor.setParameter(null, 'areaLocDsp', areaLocDsp);
    xsltProcessor.setParameter(null, 'secLocDsp', secLocDsp);
    xsltProcessor.setParameter(null, 'caseLocDsp', caseLocDsp);
    xsltProcessor.setParameter(null, 'descLocDsp', descLocDsp);
    xsltProcessor.setParameter(null, 'acSourceDsp', acSourceDsp);
    xsltProcessor.setParameter(null, 'acDateDsp', acDateDsp);
    xsltProcessor.setParameter(null, 'catDsp', catDsp);
    xsltProcessor.setParameter(null, 'catDateDsp', catDateDsp);    
   
    xsltProcessor.setParameter(null, 'photoDsp', photoDsp);
   
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
  //bob = fnBrowserType();
  //alert("fnShow " + bob);

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
function fnWtDspStart()
// -----------------
// wt - wood type
// <body onload="javascript:fnWtDspStart();">  XSLFile = 'support/wt.xsl';
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/wt.xml';
    XSLFile = 'support/wt.xsl';

    wcnDsp        = 'show';
    caryNumDsp    = 'show';

    classDsp      = 'show';
    subDsp        = 'show';
    grpDsp        = 'show';
    modDsp        = 'show';
    tnameDsp      = 'show';
    designDsp     = 'show';
    refDsp        = 'show';
    
    sizeDsp       = '';
    dimsDsp       = '';
    numCharDsp    = '';
    ucYNDsp       = '';
    lcYNDsp       = '';
    numsYNDsp     = '';
    resDsp        = '';
    condDsp       = '';
    notesDsp      = '';   
    prfDsp        = ''; 
    
    mfgDsp        = '';
    mfgMarkDsp    = '';
    mfgMarkjpgDsp = '';
    mfgDateDsp    = '';
    mfgLocDsp     = '';
    methodDsp     = '';

    areaLocDsp    = '';
    secLocDsp     = '';
    caseLocDsp    = '';
    descLocDsp    = ''; 
    acSourceDsp   = '';
    acDateDsp     = '';
    catDsp        = '';
    catDateDsp    = '';
    
    photoDsp      = '';
   
    SortBy   = 'class';

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


    fnShow();
}

// =================
function fnSortBy(arg)
// -----------------
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/wt.xml';
    XSLFile = 'support/wt.xsl';

    SortBy = arg;
    ShowOnly = '';

    fnShow();
}

// =================
function fnShowOnly(arg)
// -----------------
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/wt.xml';
    XSLFile = 'support/wt.xsl';

    if (arg == "all")
    {
        ShowOnly = '';
    } else
    {
        ShowOnly = arg;
    }

    fnShow();
}

// =================
function fnShowDivision(arg)
// -----------------
// javascript:fnShowDivision('Classification')
// Classification Appearance Manufacture Archive
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/wt.xml';
    XSLFile = 'support/wt.xsl';
    
    classDsp      = '';
    subDsp        = '';
    grpDsp        = '';
    modDsp        = '';
    tnameDsp      = '';
    designDsp     = '';
    refDsp        = '';
    
    sizeDsp       = '';
    dimsDsp       = '';
    numCharDsp    = '';
    ucYNDsp       = '';
    lcYNDsp       = '';
    numsYNDsp     = '';
    resDsp        = '';
    condDsp       = '';
    notesDsp      = '';   
    prfDsp        = ''; 
    
    mfgDsp        = '';
    mfgDateDsp    = '';
    mfgLocDsp     = '';
    methodDsp     = '';
    mfgMarkDsp    = '';
    mfgMarkjpgDsp = '';
    
    areaLocDsp    = '';
    secLocDsp     = '';
    caseLocDsp    = '';
    descLocDsp    = ''; 
    acSourceDsp   = '';
    acDateDsp     = '';
    catDsp        = '';
    catDateDsp    = '';
               
        if (arg == "Classification")
      { 
          //alert('arg is Classification');
          
          classDsp      = 'show';
          subDsp        = 'show';
          grpDsp        = 'show';
          modDsp        = 'show';
          tnameDsp      = 'show';
          designDsp     = 'show';
          refDsp        = 'show';
          
          SortBy        = 'class';
        }
    
        if (arg == "Appearance")
      { 
          //alert('arg is Appearance');
      
          sizeDsp       = 'show';
          dimsDsp       = 'show';
          numCharDsp    = 'show';
          ucYNDsp       = 'show';
          lcYNDsp       = 'show';
          numsYNDsp     = 'show';
          resDsp        = 'show';
          condDsp       = 'show';
          notesDsp      = 'show';   
          prfDsp        = 'show'; 
          
          SortBy        = 'wcn';
      }
    
        if (arg == "Manufacture")
      { 
          //alert('arg is Manufacture');
          
          mfgDsp        = 'show';
          mfgDateDsp    = 'show';
          mfgLocDsp     = 'show';
          methodDsp     = 'show';
          mfgMarkDsp    = 'show';
          mfgMarkjpgDsp = 'show';
          
          SortBy        = 'wcn';      
      }
    
        if (arg == "Archive")
      {
          //alert('arg is Archive');
          
          areaLocDsp    = 'show';
          secLocDsp     = 'show';
          caseLocDsp    = 'show';
          descLocDsp    = 'show'; 
          acSourceDsp   = 'show';
          acDateDsp     = 'show';
          catDsp        = 'show';
          catDateDsp    = 'show';
          
          SortBy        = 'wcn';
      }
      
      fnShow();
}

// =================
function fnShowCol(arg)
// -----------------
// javascript:fnShowCol('wcn')
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/wt.xml';
    XSLFile = 'support/wt.xsl';

    if (arg == "wcn")
    { wcnDsp = 'show'; }

    if (arg == "mfgMark")
    { mfgMarkDsp= 'show'; }

    if (arg == "mfgMarkjpg")
    { mfgMarkjpgDsp= 'show'; }

    if (arg == "mfg")
    { mfgDsp = 'show'; }

    if (arg == "mfgDate")
    { mfgDateDsp = 'show'; }

    if (arg == "mfgLoc")
    { mfgLocDsp = 'show'; }

    if (arg == "method")
    { methodDsp = 'show'; }

    if (arg == "size")
    { sizeDsp = 'show'; }

    if (arg == "dims")
    { dimsDsp = 'show'; }

    if (arg == "class")
    { classDsp = 'show'; }

     if (arg == "sub")
    { subDsp = 'show'; }

     if (arg == "grp")
    { grpDsp = 'show'; }

     if (arg == "mod")
    { modDsp = 'show'; }

    if (arg == "caryNum")
    { caryNumDsp = 'show'; }

    if (arg == "tname")
    { tnameDsp = 'show'; }

    if (arg == "design")
    { designDsp = 'show'; }

    if (arg == "numChar")
    { numCharDsp = 'show'; }

    if (arg == "ucYN")
    { ucYNDsp = 'show'; }

    if (arg == "lcYN")
    { lcYNDsp = 'show'; }

    if (arg == "numsYN")
    { numsYNDsp = 'show'; }

    if (arg == "areaLoc")
    { areaLocDsp = 'show'; }

    if (arg == "secLoc")
    { secLocDsp = 'show'; }

    if (arg == "caseLoc")
    { caseLocDsp = 'show'; }

    if (arg == "descLoc")
    { descLocDsp = 'show'; }

    if (arg == "acSource")
    { acSourceDsp = 'show'; }

    if (arg == "acDate")
    { acDateDsp = 'show'; }
    
    if (arg == "ref")
    { refDsp = 'show'; }

    if (arg == "res")
    { resDsp = 'show'; }
    
    if (arg == "photo")
    { photoDsp = 'show'; }

    if (arg == "prf")
    { prfDsp = 'show'; }
    
    if (arg == "cond")
    { condDsp = 'show'; }

    if (arg == "notes")
    { notesDsp = 'show'; }
    
    if (arg == "cat")
    { catDsp = 'show'; }
    
    if (arg == "catDate")
    { catDateDsp = 'show'; }
    
    fnShow();
}

// =================
function fnHideCol(arg)
// -----------------
// javascript:fnHideCol('wcn')
{
    targetDiv = 'indexDiv';

    XMLFile = 'support/wt.xml';
    XSLFile = 'support/wt.xsl';

    if (arg == "wcn")
    { wcnDsp = ''; }

    if (arg == "mfg")
    { mfgDsp = ''; }

    if (arg == "mfgMark")
    { mfgMarkDsp= ''; }

    if (arg == "mfgMarkjpg")
    { mfgMarkjpgDsp= ''; }

    if (arg == "mfgDate")
    { mfgDateDsp = ''; }

    if (arg == "mfgLoc")
    { mfgLocDsp = ''; }

    if (arg == "method")
    { methodDsp = ''; }

    if (arg == "size")
    { sizeDsp = ''; }

    if (arg == "dims")
    { dimsDsp = ''; }

    if (arg == "class")
    { classDsp = ''; }

     if (arg == "sub")
    { subDsp = ''; }

     if (arg == "grp")
    { grpDsp = ''; }

     if (arg == "mod")
    { modDsp = ''; }

     if (arg == "caryNum")
    { caryNumDsp = ''; }

    if (arg == "tname")
    { tnameDsp = ''; }

    if (arg == "design")
    { designDsp = ''; }

    if (arg == "numChar")
    { numCharDsp = ''; }

    if (arg == "ucYN")
    { ucYNDsp = ''; }

    if (arg == "lcYN")
    { lcYNDsp = ''; }

    if (arg == "numsYN")
    { numsYNDsp = ''; }

    if (arg == "areaLoc")
    { areaLocDsp = ''; }

    if (arg == "secLoc")
    { secLocDsp = ''; }

    if (arg == "caseLoc")
    { caseLocDsp = ''; }

    if (arg == "descLoc")
    { descLocDsp = ''; }

    if (arg == "acSource")
    { acSourceDsp = ''; }

    if (arg == "acDate")
    { acDateDsp = ''; }

    if (arg == "ref")
    { refDsp = ''; }
    
    if (arg == "res")
    { resDsp = ''; }

    if (arg == "photo")
    { photoDsp = ''; }
    
    if (arg == "prf")
    { prfDsp = ''; }
    
    if (arg == "cond")
    { condDsp = ''; }

    if (arg == "notes")
    { notesDsp = ''; }

    if (arg == "cat")
    { catDsp = ''; }

    if (arg == "catDate")
    { catDateDsp = ''; }
    
    fnShow();
}

// =================
function fnSayHello()
// -----------------

{
    alert('hello');
}














