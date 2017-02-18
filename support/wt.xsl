<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


  <!--make content for div id="indexDiv"-->
  <xsl:output method="html" indent="yes" encoding="utf-8"/>
  
  <xsl:param name="SortBy">wcn</xsl:param><!-- wcn:WoodTypeCallNumber -->
  <xsl:param name="ShowOnly"/>

  <xsl:param name="wcnDsp">show</xsl:param>
  <xsl:param name="caryNumDsp">show</xsl:param>
  
  <xsl:param name="ClassificationDsp">show</xsl:param>
  <xsl:param name="AppearanceDsp">show</xsl:param>
  <xsl:param name="ManufactureDsp">show</xsl:param>
  <xsl:param name="ArchiveDsp">show</xsl:param>  
  
  <!-- Classification -->
  <xsl:param name="classDsp">show</xsl:param>
  <xsl:param name="subDsp">show</xsl:param>
  <xsl:param name="grpDsp">show</xsl:param>
  <xsl:param name="modDsp">show</xsl:param>
  <xsl:param name="tnameDsp">show</xsl:param>
  <xsl:param name="designDsp">show</xsl:param>
  <xsl:param name="refDsp">show</xsl:param>
  
  <!-- Appearance -->
  <xsl:param name="sizeDsp">show</xsl:param><!-- size: in Lines -->
  <xsl:param name="dimsDsp">show</xsl:param><!-- size: in cm -->
  <xsl:param name="numCharDsp">show</xsl:param>
  <xsl:param name="ucYNDsp">show</xsl:param>
  <xsl:param name="lcYNDsp">show</xsl:param>
  <xsl:param name="numsYNDsp">show</xsl:param>
  <xsl:param name="resDsp">show</xsl:param>
  <xsl:param name="condDsp">show</xsl:param>
  <xsl:param name="notesDsp">show</xsl:param>
  <xsl:param name="prfDsp">show</xsl:param> 
  
  <!-- Manufacture -->
  <xsl:param name="mfgDsp">show</xsl:param>
  <xsl:param name="mfgDateDsp">show</xsl:param>
  <xsl:param name="mfgLocDsp">show</xsl:param>  
  <xsl:param name="methodDsp">show</xsl:param>
  <xsl:param name="mfgMarkDsp">show</xsl:param>
  <xsl:param name="mfgMarkjpgDsp">show</xsl:param>
  
  <!-- Archive -->
  <xsl:param name="areaLocDsp">show</xsl:param>
  <xsl:param name="secLocDsp">show</xsl:param>
  <xsl:param name="caseLocDsp">show</xsl:param>
  <xsl:param name="descLocDsp">show</xsl:param>
  <xsl:param name="acSourceDsp">show</xsl:param>
  <xsl:param name="acDateDsp">show</xsl:param>
  <!--<xsl:param name="photoDsp">show</xsl:param>-->
  <xsl:param name="catDsp">show</xsl:param>
  <xsl:param name="catDateDsp">show</xsl:param>
  
  <xsl:variable name="wcnDspVal">1</xsl:variable>
  <xsl:variable name="caryNumDspVal">1</xsl:variable>
  
  <!-- Classification -->
  <xsl:variable name="classDspVal"><xsl:choose><xsl:when test="$classDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="subDspVal"><xsl:choose><xsl:when test="$subDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="grpDspVal"><xsl:choose><xsl:when test="$grpDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="modDspVal"><xsl:choose><xsl:when test="$modDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="tnameDspVal"><xsl:choose><xsl:when test="$tnameDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
  <xsl:variable name="designDspVal"><xsl:choose><xsl:when test="$designDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
  <xsl:variable name="refDspVal"><xsl:choose><xsl:when test="$refDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  
  <!-- Appearance -->
  <xsl:variable name="sizeDspVal"><xsl:choose><xsl:when test="$sizeDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="dimsDspVal"><xsl:choose><xsl:when test="$dimsDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="numCharDspVal"><xsl:choose><xsl:when test="$numCharDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="ucYNDspVal"><xsl:choose><xsl:when test="$ucYNDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="lcYNDspVal"><xsl:choose><xsl:when test="$lcYNDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
  <xsl:variable name="numsYNDspVal"><xsl:choose><xsl:when test="$numsYNDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="resDspVal"><xsl:choose><xsl:when test="$resDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="condDspVal"><xsl:choose><xsl:when test="$condDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="notesDspVal"><xsl:choose><xsl:when test="$notesDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
  <xsl:variable name="prfDspVal"><xsl:choose><xsl:when test="$prfDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  
  <!-- Manufacture -->
  <xsl:variable name="mfgDspVal"><xsl:choose><xsl:when test="$mfgDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="mfgDateDspVal"><xsl:choose><xsl:when test="$mfgDateDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="mfgLocDspVal"><xsl:choose><xsl:when test="$mfgLocDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="methodDspVal"><xsl:choose><xsl:when test="$methodDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="mfgMarkDspVal"><xsl:choose><xsl:when test="$mfgMarkDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="mfgMarkjpgDspVal"><xsl:choose><xsl:when test="$mfgMarkjpgDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
  
  <!-- Archive -->
  <xsl:variable name="areaLocDspVal"><xsl:choose><xsl:when test="$areaLocDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
  <xsl:variable name="secLocDspVal"><xsl:choose><xsl:when test="$secLocDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="caseLocDspVal"><xsl:choose><xsl:when test="$caseLocDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable> 
  <xsl:variable name="descLocDspVal"><xsl:choose><xsl:when test="$descLocDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="acSourceDspVal"><xsl:choose><xsl:when test="$acSourceDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="acDateDspVal"><xsl:choose><xsl:when test="$acDateDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="catDspVal"><xsl:choose><xsl:when test="$catDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  <xsl:variable name="catDateDspVal"><xsl:choose><xsl:when test="$catDateDsp='show'">1</xsl:when><xsl:otherwise>0</xsl:otherwise></xsl:choose></xsl:variable>
  
  <!-- ====== -->
  <xsl:variable name="numCols">
    <xsl:value-of select="
      $wcnDspVal       + $caryNumDspVal        
      + $classDspVal   + $subDspVal     + $grpDspVal     + $modDspVal     + $tnameDspVal    + $designDspVal     + $refDspVal      
      + $sizeDspVal    + $dimsDspVal    + $numCharDspVal + $ucYNDspVal    + $lcYNDspVal     + $numsYNDspVal     + $resDspVal + $condDspVal + $notesDspVal + $prfDspVal 
      + $mfgDspVal     + $mfgDateDspVal + $mfgLocDspVal  + $methodDspVal  + $mfgMarkDspVal  + $mfgMarkjpgDspVal   
      + $areaLocDspVal + $secLocDspVal  + $caseLocDspVal + $descLocDspVal + $acSourceDspVal + $acDateDspVal     + $catDspVal + $catDateDspVal"      
    />   
  </xsl:variable> 
  
  <xsl:template match="/">

    <xsl:variable name="wcnCol">want</xsl:variable>
    <xsl:variable name="caryNumCol">want</xsl:variable>

    <!-- Classification -->
    <xsl:variable name="classCol"><xsl:choose><xsl:when test="$classDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>   
    <xsl:variable name="subCol"><xsl:choose><xsl:when test="$subDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="grpCol"><xsl:choose><xsl:when test="$grpDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="modCol"><xsl:choose><xsl:when test="$modDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>    
    <xsl:variable name="tnameCol"><xsl:choose><xsl:when test="$tnameDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="designCol"><xsl:choose><xsl:when test="$designDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="refCol"><xsl:choose><xsl:when test="$refDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable> 

    <!-- Appearance -->
    <xsl:variable name="sizeCol"><xsl:choose><xsl:when test="$sizeDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="dimsCol"><xsl:choose><xsl:when test="$dimsDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="numCharCol"><xsl:choose><xsl:when test="$numCharDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="ucYNCol"><xsl:choose><xsl:when test="$ucYNDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="lcYNCol"><xsl:choose><xsl:when test="$lcYNDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="numsYNCol"><xsl:choose><xsl:when test="$numsYNDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable> 
    <xsl:variable name="resCol"><xsl:choose><xsl:when test="$resDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="condCol"><xsl:choose><xsl:when test="$condDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable> 
    <xsl:variable name="notesCol"><xsl:choose><xsl:when test="$notesDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="prfCol"><xsl:choose><xsl:when test="$prfDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    
    <!-- Manufacture-->
    <xsl:variable name="mfgCol"><xsl:choose><xsl:when test="$mfgDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="mfgDateCol"><xsl:choose><xsl:when test="$mfgDateDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="mfgLocCol"><xsl:choose><xsl:when test="$mfgLocDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="methodCol"><xsl:choose><xsl:when test="$methodDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="mfgMarkCol"><xsl:choose><xsl:when test="$mfgMarkDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="mfgMarkjpgCol"><xsl:choose><xsl:when test="$mfgMarkjpgDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    
    <!-- Archive -->
    <xsl:variable name="areaLocCol"><xsl:choose><xsl:when test="$areaLocDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable> 
    <xsl:variable name="secLocCol"><xsl:choose><xsl:when test="$secLocDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable> 
    <xsl:variable name="caseLocCol"><xsl:choose><xsl:when test="$caseLocDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="descLocCol"><xsl:choose><xsl:when test="$descLocDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="acSourceCol"><xsl:choose><xsl:when test="$acSourceDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="acDateCol"><xsl:choose><xsl:when test="$acDateDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>   
    <xsl:variable name="catCol"><xsl:choose><xsl:when test="$catDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    <xsl:variable name="catDateCol"><xsl:choose><xsl:when test="$catDateDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose></xsl:variable>
    
    <!-- start content for div id="indexDiv" -->
    <table class="indexTable">
      
      <!-- construct the colgroup -->
      <colgroup>
        <!-- wcn  --><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element>
        <!-- caryNum --><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element>
  
        <!-- Classification -->
        <xsl:if test="$classCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>   
        <xsl:if test="$subCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>   
        <xsl:if test="$grpCol!=''"><xsl:element name="col"><xsl:attribute name="width">30px</xsl:attribute></xsl:element></xsl:if>   
        <xsl:if test="$modCol!=''"><xsl:element name="col"><xsl:attribute name="width">150px</xsl:attribute></xsl:element></xsl:if>  
        <xsl:if test="$tnameCol!=''"><xsl:element name="col"><xsl:attribute name="width">150px</xsl:attribute></xsl:element></xsl:if> 
        <xsl:if test="$designCol!=''"><xsl:element name="col"><xsl:attribute name="width">150px</xsl:attribute></xsl:element></xsl:if> 
        <xsl:if test="$refCol!=''"><xsl:element name="col"><xsl:attribute name="width">150px</xsl:attribute></xsl:element></xsl:if>   
        
        <!-- Appearance -->
        <xsl:if test="$sizeCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>     
        <xsl:if test="$dimsCol!=''"><xsl:element name="col"><xsl:attribute name="width">100px</xsl:attribute></xsl:element></xsl:if>         
        <xsl:if test="$numCharCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>       
        <xsl:if test="$ucYNCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>     
        <xsl:if test="$lcYNCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>     
        <xsl:if test="$numsYNCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>
        <xsl:if test="$resCol!=''"><xsl:element name="col"><xsl:attribute name="width">150px</xsl:attribute></xsl:element></xsl:if>  
        <xsl:if test="$condCol!=''"><xsl:element name="col"><xsl:attribute name="width">250px</xsl:attribute></xsl:element></xsl:if>         
        <xsl:if test="$notesCol!=''"><xsl:element name="col"><xsl:attribute name="width">250px</xsl:attribute></xsl:element></xsl:if>          
        <xsl:if test="$prfCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>           
    
        <!-- Manufacture -->
        <xsl:if test="$mfgCol!=''"><xsl:element name="col"><xsl:attribute name="width">150px</xsl:attribute></xsl:element></xsl:if> 
        <xsl:if test="$mfgDateCol!=''"><xsl:element name="col"><xsl:attribute name="width">100px</xsl:attribute></xsl:element></xsl:if>
        <xsl:if test="$mfgLocCol!=''"><xsl:element name="col"><xsl:attribute name="width">150px</xsl:attribute></xsl:element></xsl:if>   
        <xsl:if test="$methodCol!=''"><xsl:element name="col"><xsl:attribute name="width">20px</xsl:attribute></xsl:element></xsl:if>   
        <xsl:if test="$mfgMarkCol!=''"><xsl:element name="col"><xsl:attribute name="width">20px</xsl:attribute></xsl:element></xsl:if>
        <xsl:if test="$mfgMarkjpgCol!=''"><xsl:element name="col"><xsl:attribute name="width">100px</xsl:attribute></xsl:element></xsl:if>
        
        <!-- Archive -->
        <xsl:if test="$areaLocCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>
        <xsl:if test="$secLocCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>
        <xsl:if test="$caseLocCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if> 
        <xsl:if test="$descLocCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>   
        <xsl:if test="$acSourceCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>   
        <xsl:if test="$acDateCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if>         
        <xsl:if test="$catCol!=''"><xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element></xsl:if> 
        <xsl:if test="$catDateCol!=''"><xsl:element name="col"><xsl:attribute name="width">100px</xsl:attribute></xsl:element></xsl:if> 
      </colgroup>
           
      <!-- ====== links row, top ====== -->
      
      <tr>
        <xsl:element name="td">
         
          <xsl:if test="$numCols &gt; 1">
            <xsl:attribute name="colspan">
              <xsl:value-of select="$numCols"/>
            </xsl:attribute>          
          </xsl:if>
          <xsl:attribute name="class">thLeft</xsl:attribute>
          <xsl:attribute name="style">padding:10px;</xsl:attribute>
          
          <!-- | <a href="wtMfg.htm" class="colHdEmph">Wood Type Makers</a> -->
          <a href="wtIntro.htm" class="colHdEmph">Wood Type Intro</a>                      
          | <a href="mt.htm" class="colHdEmph">Metal Type Index</a>
          | <a href="usingTheIndexes.htm" target="_blank" class="colHdEmph">Using the Indexes</a>
            
        </xsl:element>
      </tr>
      
      <!-- ====== title row ====== -->

      <tr style="height:50px;">
        <xsl:element name="td">
          <xsl:if test="$numCols &gt; 1">
            <xsl:attribute name="colspan">
              <xsl:value-of select="$numCols"/>
            </xsl:attribute>
          </xsl:if>    
          <xsl:attribute name="class">tdTitle</xsl:attribute>Wood Type Index</xsl:element>
      </tr>

      <!-- ====== index table row - show or hide cols ====== -->
      
      <tr>
        <xsl:element name="td">
          <xsl:if test="$numCols &gt; 1">
            <xsl:attribute name="colspan"><xsl:value-of select="$numCols"/></xsl:attribute>
          </xsl:if>

          <xsl:attribute name="class">thLeft</xsl:attribute>
          <xsl:attribute name="style">line-height:150%;height:60px;vertical-align:middle;</xsl:attribute>
          
          show or hide columns:<br/>
          <!-- 
          <xsl:for-each select="//division">
            <xsl:choose>
              <xsl:when test="@id='Classification' and $ClassificationDsp='show'"></xsl:when>
            </xsl:choose>
            </xsl:for-each>
          -->
          
          <xsl:for-each select="//item">
            <xsl:variable name="localShow">
              <xsl:choose>  
                <xsl:when test="@id='wcn'        and $wcnDsp='show'">-</xsl:when>
                <xsl:when test="@id='caryNum'    and $caryNumDsp='show'">-</xsl:when>
                  
                <xsl:when test="@id='class'      and $classDsp='show'">show</xsl:when>    
                <xsl:when test="@id='sub'        and $subDsp='show'">show</xsl:when>    
                <xsl:when test="@id='grp'        and $grpDsp='show'">show</xsl:when>    
                <xsl:when test="@id='mod'        and $modDsp='show'">show</xsl:when>              
                <xsl:when test="@id='tname'      and $tnameDsp='show'">show</xsl:when>    
                <xsl:when test="@id='design'     and $designDsp='show'">show</xsl:when> 
                <xsl:when test="@id='ref'        and $refDsp='show'">show</xsl:when> 
                                           
                <xsl:when test="@id='size'       and $sizeDsp='show'">show</xsl:when>     
                <xsl:when test="@id='dims'       and $dimsDsp='show'">show</xsl:when>         
                <xsl:when test="@id='numChar'    and $numCharDsp='show'">show</xsl:when> 
                <xsl:when test="@id='ucYN'       and $ucYNDsp='show'">show</xsl:when>   
                <xsl:when test="@id='lcYN'       and $lcYNDsp='show'">show</xsl:when> 
                <xsl:when test="@id='numsYN'     and $numsYNDsp='show'">show</xsl:when> 
                <xsl:when test="@id='res'        and $resDsp='show'">show</xsl:when>                 
                <xsl:when test="@id='cond'       and $condDsp='show'">show</xsl:when> 
                <xsl:when test="@id='notes'      and $notesDsp='show'">show</xsl:when>                               
                <xsl:when test="@id='prf'        and $prfDsp='show'">show</xsl:when>        
                      
                <xsl:when test="@id='mfg'        and $mfgDsp='show'">show</xsl:when>
                <xsl:when test="@id='mfgDate'    and $mfgDateDsp='show'">show</xsl:when>
                <xsl:when test="@id='mfgLoc'     and $mfgLocDsp='show'">show</xsl:when>
                <xsl:when test="@id='method'     and $methodDsp='show'">show</xsl:when>     
                <xsl:when test="@id='mfgMark'    and $mfgMarkDsp='show'">show</xsl:when>
                <xsl:when test="@id='mfgMarkjpg' and $mfgMarkjpgDsp='show'">show</xsl:when>
                
                <xsl:when test="@id='areaLoc'    and $areaLocDsp='show'">show</xsl:when> 
                <xsl:when test="@id='secLoc'     and $secLocDsp='show'">show</xsl:when> 
                <xsl:when test="@id='caseLoc'    and $caseLocDsp='show'">show</xsl:when> 
                <xsl:when test="@id='descLoc'    and $descLocDsp='show'">show</xsl:when>              
                <xsl:when test="@id='acSource'   and $acSourceDsp='show'">show</xsl:when>  
                <xsl:when test="@id='acDate'     and $acDateDsp='show'">show</xsl:when>   

                <!--<xsl:when test="@id='photo'      and $photoDsp='show'">show</xsl:when>-->             

                <xsl:when test="@id='cat'        and $catDsp='show'">show</xsl:when> 
                <xsl:when test="@id='catDate'    and $catDateDsp='show'">show</xsl:when> 
              </xsl:choose>
            </xsl:variable>
            
            <xsl:choose>
              <xsl:when test="@id='class'">
                <xsl:element name="a">
                  <xsl:attribute name="class">colHdEmph</xsl:attribute>
                  <xsl:attribute name="title">click to show only Classification columns</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnShowDivision('Classification');</xsl:attribute>
                Classification:&#160;
                </xsl:element>
              </xsl:when>
              
              <xsl:when test="@id='size'">
                <xsl:element name="a">
                  <xsl:attribute name="class">colHdEmph</xsl:attribute>
                  <xsl:attribute name="title">click to show only Appearance columns</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnShowDivision('Appearance');</xsl:attribute>
                  Appearance:&#160;
                </xsl:element>
              </xsl:when>
              
              <xsl:when test="@id='mfg'">
                <xsl:element name="a">
                  <xsl:attribute name="class">colHdEmph</xsl:attribute>
                  <xsl:attribute name="title">click to show only Manufacturing columns</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnShowDivision('Manufacture');</xsl:attribute>
                  Manufacture:&#160;
                </xsl:element>
              </xsl:when>
              
              <xsl:when test="@id='areaLoc'">
                <xsl:element name="a">
                  <xsl:attribute name="class">colHdEmph</xsl:attribute>
                  <xsl:attribute name="title">click to show only Archive columns</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnShowDivision('Archive');</xsl:attribute>
                  Archive:&#160;
                </xsl:element>
              </xsl:when>       
     
            </xsl:choose>
            
            <xsl:choose>
              <xsl:when test="$localShow='show'">
                <xsl:element name="a">
                  <xsl:attribute name="class">colHdEmph</xsl:attribute>
                  <xsl:attribute name="title">click to hide <xsl:value-of select="@label"/> column</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnHideCol('<xsl:value-of select="@id"/>');</xsl:attribute>
                  
                  <xsl:value-of select="@label"/>
                  <xsl:choose>
                    <xsl:when test="@id='ref' or @id='prf' or @id='mfgMarkjpg'"><br/></xsl:when>
                    <xsl:otherwise><xsl:if test="position()!=last()"><xsl:text> |&#160;</xsl:text></xsl:if></xsl:otherwise>
                  </xsl:choose>                
                </xsl:element>
                <xsl:text>
</xsl:text>
              </xsl:when>
              <xsl:when test="$localShow='-'"></xsl:when>
              <xsl:otherwise>
                <xsl:element name="a">
                  <xsl:attribute name="class">colHd</xsl:attribute>
                  <xsl:attribute name="title">click to show <xsl:value-of select="@label"/> column</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnShowCol('<xsl:value-of select="@id"/>');</xsl:attribute>
                  
                  <xsl:value-of select="@label"/>
                  <xsl:choose>
                    <xsl:when test="@id='ref' or @id='prf' or @id='mfgMarkjpg'"><br/></xsl:when>
                    <xsl:otherwise><xsl:if test="position()!=last()"><xsl:text> |&#160;</xsl:text></xsl:if></xsl:otherwise>
                  </xsl:choose>               
                </xsl:element>
                <xsl:text>
</xsl:text>
              </xsl:otherwise>
            </xsl:choose>           
          </xsl:for-each>

        </xsl:element>
      </tr>
      <!-- ====== index table row - ShowOnlyLinks, e.g., A B C, for show all/only ====== -->
     
     <xsl:if test="x=y">
       <tr>
         <xsl:element name="td">
           <xsl:attribute name="colspan"><xsl:value-of select="$numCols"/></xsl:attribute>
           <xsl:attribute name="class">thLeft</xsl:attribute>        
           <xsl:call-template name="ShowOnlyLinks"/>
         </xsl:element>
       </tr>
     </xsl:if>
      
      <!-- ====== spacer ====== -->
      <tr>
        <xsl:element name="td">
          <xsl:attribute name="colspan"><xsl:value-of select="$numCols"/></xsl:attribute>
          &#160;
        </xsl:element>
      </tr>

      <!-- ====== index table row - column headers ====== -->
      <tr>
        <xsl:for-each select="//item">
          <xsl:variable name="localShow">
            <xsl:choose>
              <xsl:when test="@id='wcn'        and $wcnDsp='show'">show</xsl:when>
              <xsl:when test="@id='caryNum'    and $caryNumDsp='show'">show</xsl:when>    

              <xsl:when test="@id='class'      and $classDsp='show'">show</xsl:when> 
              <xsl:when test="@id='sub'        and $subDsp='show'">show</xsl:when> 
              <xsl:when test="@id='grp'        and $grpDsp='show'">show</xsl:when> 
              <xsl:when test="@id='mod'        and $modDsp='show'">show</xsl:when> 
              <xsl:when test="@id='tname'      and $tnameDsp='show'">show</xsl:when>    
              <xsl:when test="@id='design'     and $designDsp='show'">show</xsl:when>   
              <xsl:when test="@id='ref'        and $refDsp='show'">show</xsl:when>   
              
              <xsl:when test="@id='size'       and $sizeDsp='show'">show</xsl:when> 
              <xsl:when test="@id='dims'       and $dimsDsp='show'">show</xsl:when>                     
              <xsl:when test="@id='numChar'    and $numCharDsp='show'">show</xsl:when>   
              <xsl:when test="@id='ucYN'       and $ucYNDsp='show'">show</xsl:when>  
              <xsl:when test="@id='lcYN'       and $lcYNDsp='show'">show</xsl:when> 
              <xsl:when test="@id='numsYN'     and $numsYNDsp='show'">show</xsl:when>           
              <xsl:when test="@id='res'        and $resDsp='show'">show</xsl:when>   
              <xsl:when test="@id='cond'       and $condDsp='show'">show</xsl:when> 
              <xsl:when test="@id='notes'      and $notesDsp='show'">show</xsl:when> 
              <xsl:when test="@id='prf'        and $prfDsp='show'">show</xsl:when>              
              
              <xsl:when test="@id='mfgMark'    and $mfgMarkDsp='show'">show</xsl:when>
              <xsl:when test="@id='mfgMarkjpg' and $mfgMarkjpgDsp='show'">show</xsl:when>
              <xsl:when test="@id='mfg'        and $mfgDsp='show'">show</xsl:when>
              <xsl:when test="@id='mfgDate'    and $mfgDateDsp='show'">show</xsl:when>
              <xsl:when test="@id='mfgLoc'     and $mfgLocDsp='show'">show</xsl:when> 
              <xsl:when test="@id='method'     and $methodDsp='show'">show</xsl:when>   
              
              <xsl:when test="@id='areaLoc'    and $areaLocDsp='show'">show</xsl:when> 
              <xsl:when test="@id='secLoc'     and $secLocDsp='show'">show</xsl:when> 
              <xsl:when test="@id='caseLoc'    and $caseLocDsp='show'">show</xsl:when> 
              <xsl:when test="@id='descLoc'    and $descLocDsp='show'">show</xsl:when> 
              <xsl:when test="@id='acSource'   and $acSourceDsp='show'">show</xsl:when> 
              <xsl:when test="@id='acDate'     and $acDateDsp='show'">show</xsl:when> 
              <xsl:when test="@id='cat'        and $catDsp='show'">show</xsl:when> 
              <xsl:when test="@id='catDate'    and $catDateDsp='show'">show</xsl:when>  
              
            </xsl:choose>
          </xsl:variable>

          <xsl:if test="$localShow='show'">
            <xsl:call-template name="THcell">
              <xsl:with-param name="callerID"><xsl:value-of select="@id"/></xsl:with-param>
              <xsl:with-param name="labelTH"><xsl:value-of select="@labelTH"/></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>
      </tr>
      
      <!-- ====== index data cells ====== -->

      <xsl:choose>

        <xsl:when test="$SortBy='wcn'"><xsl:apply-templates select="//Type"><xsl:sort select="@wcn"/> </xsl:apply-templates></xsl:when>
        <xsl:when test="$SortBy='caryNum'"><xsl:apply-templates select="//Type"><xsl:sort select="@caryNum"/></xsl:apply-templates></xsl:when>      
        
        <xsl:when test="$SortBy='mfg'"><xsl:apply-templates select="//Type"><xsl:sort select="@mfg"/></xsl:apply-templates></xsl:when>       
        <xsl:when test="$SortBy='mfgMark'"><xsl:apply-templates select="//Type"><xsl:sort select="@mfgMark"/></xsl:apply-templates></xsl:when>
        <xsl:when test="$SortBy='mfgMarkjpg'"><xsl:apply-templates select="//Type"><xsl:sort select="@mfgMarkjpg"/></xsl:apply-templates></xsl:when>
        
        <xsl:when test="$SortBy='mfgDate'"><xsl:apply-templates select="//Type"><xsl:sort select="@mfgDate"/></xsl:apply-templates></xsl:when>             
        <xsl:when test="$SortBy='mfgLoc'"><xsl:apply-templates select="//Type"><xsl:sort select="@mfgLoc"/></xsl:apply-templates></xsl:when>  
        
        <!--  
        <xsl:when test="$SortBy='mfgMarkjpg'">
          <xsl:choose>
            <xsl:when test="$ShowOnly=''">
              <xsl:apply-templates select="//Type">
                <xsl:sort select="@mfgMarkjpg" />
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates
                select="( //Type[starts-with(@mfgMarkjpg,$ShowOnly)] )">
                <xsl:sort select="@mfgMarkjpg"/>
                <xsl:sort select="@mfgMark"/>
              </xsl:apply-templates>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        -->
        <xsl:when test="$SortBy='method'"><xsl:apply-templates select="//Type"><xsl:sort select="@method"/></xsl:apply-templates></xsl:when>    
        <xsl:when test="$SortBy='size'"><xsl:apply-templates select="//Type"><xsl:sort select="@size" data-type="number"/></xsl:apply-templates></xsl:when>   
        <xsl:when test="$SortBy='dims'"><xsl:apply-templates select="//Type"><xsl:sort select="@dims" /></xsl:apply-templates></xsl:when>  
        
        <xsl:when test="$SortBy='class'">
          <xsl:apply-templates select="//Type">
            <xsl:sort select="@class"/>
            <xsl:sort select="@sub"/>
            <xsl:sort select="@grp"/>
            <xsl:sort select="@mod"/>
            <xsl:sort select="@size" data-type="number"/>
          </xsl:apply-templates>
        </xsl:when>  
        
        <xsl:when test="$SortBy='sub'">
          <xsl:apply-templates select="//Type">
            <xsl:sort select="@sub"/>
            <xsl:sort select="@grp"/>
            <xsl:sort select="@mod"/>
            <xsl:sort select="@size" data-type="number"/>
          </xsl:apply-templates>
        </xsl:when>  

        <xsl:when test="$SortBy='grp'">
          <xsl:apply-templates select="//Type">
            <xsl:sort select="@grp"/>
            <xsl:sort select="@mod"/>
            <xsl:sort select="@size" data-type="number"/>
          </xsl:apply-templates>
        </xsl:when> 
        
        <xsl:when test="$SortBy='mod'">
          <xsl:apply-templates select="//Type">
            <xsl:sort select="@mod"/>
            <xsl:sort select="@size" data-type="number"/>
          </xsl:apply-templates>
        </xsl:when>  

        <xsl:when test="$SortBy='tname'"><xsl:apply-templates select="//Type"><xsl:sort select="@tname"/></xsl:apply-templates></xsl:when> 
        
        <xsl:when test="$SortBy='design'">
          <xsl:apply-templates select="//Type">
            <xsl:sort select="@design"/>
            <xsl:sort select="@size" data-type="number"/>
          </xsl:apply-templates>
        </xsl:when>
        
        <xsl:when test="$SortBy='ref'"><xsl:apply-templates select="//Type"><xsl:sort select="@ref"/></xsl:apply-templates></xsl:when>  
        
        <xsl:when test="$SortBy='numChar'"><xsl:apply-templates select="//Type"><xsl:sort select="@numChar" data-type="number"/></xsl:apply-templates></xsl:when>  
        <xsl:when test="$SortBy='ucYN'"><xsl:apply-templates select="//Type"><xsl:sort select="@ucYN"/></xsl:apply-templates></xsl:when>  
        <xsl:when test="$SortBy='lcYN'"><xsl:apply-templates select="//Type"><xsl:sort select="@lcYN"/></xsl:apply-templates></xsl:when> 
        <xsl:when test="$SortBy='numsYN'"><xsl:apply-templates select="//Type"><xsl:sort select="@numsYN"/></xsl:apply-templates></xsl:when>
        <xsl:when test="$SortBy='res'"><xsl:apply-templates select="//Type"><xsl:sort select="@res"/></xsl:apply-templates></xsl:when>     
        <xsl:when test="$SortBy='cond'"><xsl:apply-templates select="//Type"><xsl:sort select="@cond"/></xsl:apply-templates></xsl:when>  
        <xsl:when test="$SortBy='notes'"><xsl:apply-templates select="//Type"><xsl:sort select="@notes"/></xsl:apply-templates></xsl:when>  
        <xsl:when test="$SortBy='prf'"><xsl:apply-templates select="//Type"><xsl:sort select="@prf"/></xsl:apply-templates></xsl:when>
        
        <xsl:when test="$SortBy='areaLoc'"><xsl:apply-templates select="//Type"><xsl:sort select="@areaLoc"/></xsl:apply-templates></xsl:when> 
        <xsl:when test="$SortBy='secLoc'"><xsl:apply-templates select="//Type"><xsl:sort select="@secLoc"/></xsl:apply-templates></xsl:when> 
        <xsl:when test="$SortBy='caseLoc'"><xsl:apply-templates select="//Type"><xsl:sort select="@caseLoc" data-type="number"/></xsl:apply-templates></xsl:when>
        <xsl:when test="$SortBy='descLoc'"><xsl:apply-templates select="//Type"><xsl:sort select="@descLoc"/></xsl:apply-templates></xsl:when>  
 
        <xsl:when test="$SortBy='acSource'"><xsl:apply-templates select="//Type"><xsl:sort select="@acSource"/></xsl:apply-templates></xsl:when> 
        <xsl:when test="$SortBy='acDate'"><xsl:apply-templates select="//Type"><xsl:sort select="@acDate"/></xsl:apply-templates></xsl:when>   
        <xsl:when test="$SortBy='cat'"><xsl:apply-templates select="//Type"><xsl:sort select="@cat"/></xsl:apply-templates></xsl:when>  
        <xsl:when test="$SortBy='catDate'"><xsl:apply-templates select="//Type"><xsl:sort select="@catDate"/></xsl:apply-templates></xsl:when>  
        
      </xsl:choose>
    </table>
    <!--end content for div id="indexDiv"-->
  </xsl:template>

  <xsl:template match="Type">
    <tr>
      <xsl:if test="$wcnDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">wcn</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$caryNumDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">caryNum</xsl:with-param></xsl:call-template></xsl:if>

      <!-- Classification --> 
      <xsl:if test="$classDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">class</xsl:with-param></xsl:call-template></xsl:if> 
      <xsl:if test="$subDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">sub</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$grpDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">grp</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$modDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">mod</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$tnameDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">tname</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$designDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">design</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$refDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">ref</xsl:with-param></xsl:call-template></xsl:if>   
      
      <!-- Appearance --> 
      <xsl:if test="$sizeDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">size</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$dimsDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">dims</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$numCharDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">numChar</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$ucYNDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">ucYN</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$lcYNDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">lcYN</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$numsYNDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">numsYN</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$resDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">res</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$condDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">cond</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$notesDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">notes</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$prfDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">prf</xsl:with-param></xsl:call-template></xsl:if>
            
      <!-- Manufacture --> 
      <xsl:if test="$mfgDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">mfg</xsl:with-param></xsl:call-template></xsl:if> 
      <xsl:if test="$mfgDateDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">mfgDate</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$mfgLocDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">mfgLoc</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$methodDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">method</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$mfgMarkDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">mfgMark</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$mfgMarkjpgDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">mfgMarkjpg</xsl:with-param></xsl:call-template></xsl:if>
      
      <!-- Archive --> 
      <xsl:if test="$areaLocDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">areaLoc</xsl:with-param></xsl:call-template></xsl:if>    
      <xsl:if test="$secLocDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">secLoc</xsl:with-param></xsl:call-template></xsl:if> 
      <xsl:if test="$caseLocDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">caseLoc</xsl:with-param></xsl:call-template></xsl:if>    
      <xsl:if test="$descLocDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">descLoc</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$acSourceDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">acSource</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$acDateDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">acDate</xsl:with-param></xsl:call-template></xsl:if> 
      <xsl:if test="$catDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">cat</xsl:with-param></xsl:call-template></xsl:if>
      <xsl:if test="$catDateDsp='show'"><xsl:call-template name="TDcell"><xsl:with-param name="callerID">catDate</xsl:with-param></xsl:call-template></xsl:if>
    </tr>
  </xsl:template>

  <xsl:template name="THcell">
    <xsl:param name="callerID"/>
    <xsl:param name="labelTH"/>
    
    <xsl:element name="td">

      <xsl:attribute name="class">
        <xsl:variable name="horiz">
          <xsl:choose>
            <xsl:when test="$callerID='numChar' or $callerID='size'">right</xsl:when>
            
            <xsl:when test="$callerID='caryNum' or $callerID='ucYN' or $callerID='lcYN' 
                         or $callerID='numsYN'  or $callerID='acDate' 
                         or $callerID='catDate'">center</xsl:when>
            
            <xsl:otherwise>left</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
          <xsl:when test="$horiz='right'">
            <xsl:choose>
            <xsl:when test="$callerID=$SortBy">thEmphRight</xsl:when>
              <xsl:otherwise>thBoldRight</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          
          <xsl:when test="$horiz='center'">
            <xsl:choose>
              <xsl:when test="$callerID=$SortBy">thEmphCenter</xsl:when>
              <xsl:otherwise>thBoldCenter</xsl:otherwise>
            </xsl:choose>  
          </xsl:when>
          
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$callerID=$SortBy">thEmphLeft</xsl:when>
              <xsl:otherwise>thBoldLeft</xsl:otherwise>
            </xsl:choose>              
          </xsl:otherwise>
        </xsl:choose>
        
      </xsl:attribute>
      
      <xsl:choose>
        <xsl:when test="$callerID=$SortBy">
          <xsl:value-of select="$labelTH"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="a">
            <xsl:attribute name="class">thA</xsl:attribute>
            <xsl:attribute name="title">click to sort by <xsl:value-of select="$labelTH"/></xsl:attribute>         
            <xsl:attribute name="href">javascript:fnSortBy('<xsl:value-of select="$callerID"/>');</xsl:attribute>
            <xsl:value-of select="$labelTH"/>
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:element><!-- element name="td" -->
  </xsl:template>
  <!-- end template name="THcell" -->

  <xsl:template name="TDcell">
    <xsl:param name="callerID"/>

    <xsl:variable name="val">
      <xsl:choose>
        <xsl:when test="$callerID='wcn'"><xsl:value-of select="@wcn"/></xsl:when>
        <xsl:when test="$callerID='caryNum'"><xsl:value-of select="@caryNum"/></xsl:when>

        <!-- Classification -->
        <xsl:when test="$callerID='class'"><xsl:value-of select="@class"/></xsl:when>
        <xsl:when test="$callerID='sub'"><xsl:value-of select="@sub"/></xsl:when>
        <xsl:when test="$callerID='grp'"><xsl:value-of select="@grp"/></xsl:when>
        <xsl:when test="$callerID='mod'"><xsl:value-of select="@mod"/></xsl:when>      
        <xsl:when test="$callerID='tname'"><xsl:value-of select="@tname"/></xsl:when>
        <xsl:when test="$callerID='design'"><xsl:value-of select="@design"/></xsl:when>
        <xsl:when test="$callerID='ref'"><xsl:value-of select="@ref"/></xsl:when>
        
        <!-- Appearance -->
        <xsl:when test="$callerID='dims'"><xsl:value-of select="@dims"/></xsl:when>
        <xsl:when test="$callerID='numChar'"><xsl:value-of select="@numChar"/></xsl:when>     
        <xsl:when test="$callerID='ucYN'"><xsl:value-of select="@ucYN"/></xsl:when>
        <xsl:when test="$callerID='lcYN'"><xsl:value-of select="@lcYN"/></xsl:when>
        <xsl:when test="$callerID='numsYN'"><xsl:value-of select="@numsYN"/></xsl:when>
        <xsl:when test="$callerID='res'"><xsl:value-of select="@res"/></xsl:when>
        <xsl:when test="$callerID='cond'"><xsl:value-of select="@cond"/></xsl:when>
        <xsl:when test="$callerID='notes'"><xsl:value-of select="@notes"/></xsl:when> 

        <xsl:when test="$callerID='prf'">  
          <xsl:choose>
            <xsl:when test="@prf='-'">-</xsl:when>
            <xsl:otherwise>    
              <xsl:variable name="filename">  
                <xsl:value-of select='substring-before(@prf,".jpg")'></xsl:value-of>         
              </xsl:variable><xsl:value-of select="$filename"/>      
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        
        <!-- Manufacture -->
        <xsl:when test="$callerID='mfg'"><xsl:value-of select="@mfg"/></xsl:when>
        <xsl:when test="$callerID='mfgDate'"><xsl:value-of select="@mfgDate"/></xsl:when>
        <xsl:when test="$callerID='mfgLoc'"><xsl:value-of select="@mfgLoc"/></xsl:when>
        <xsl:when test="$callerID='method'"><xsl:value-of select="@method"/></xsl:when>
        <xsl:when test="$callerID='size'"><xsl:value-of select="@size"/></xsl:when>
        <xsl:when test="$callerID='mfgMark'"><xsl:value-of select="@mfgMark"/></xsl:when>
        <xsl:when test="$callerID='mfgMarkjpg'"><xsl:value-of select="@mfgMarkjpg"/></xsl:when>    
        
        <!-- Archive -->
        <xsl:when test="$callerID='areaLoc'"><xsl:value-of select="@areaLoc"/></xsl:when>
        <xsl:when test="$callerID='secLoc'"><xsl:value-of select="@secLoc"/></xsl:when>
        <xsl:when test="$callerID='caseLoc'"><xsl:value-of select="@caseLoc"/></xsl:when>
        <xsl:when test="$callerID='descLoc'"><xsl:value-of select="@descLoc"/></xsl:when>
        <xsl:when test="$callerID='acSource'"><xsl:value-of select="@acSource"/></xsl:when>
        <xsl:when test="$callerID='acDate'"><xsl:value-of select="@acDate"/></xsl:when>
        <xsl:when test="$callerID='cat'"><xsl:value-of select="@cat"/></xsl:when>
        <xsl:when test="$callerID='catDate'"><xsl:value-of select="substring(@catDate,1,10)"/></xsl:when>  

      </xsl:choose>
    </xsl:variable>

    <xsl:element name="td">
        
      <xsl:attribute name="class">     
       
        <xsl:variable name="horiz">
          <xsl:choose>
            <xsl:when test="$callerID='numChar' or $callerID='size'">right</xsl:when>
            <xsl:when test="$callerID='size'    or $callerID='caryNum' or $callerID='ucYN'   or $callerID='lcYN' 
                         or $callerID='numsYN'  or $callerID='areaLoc' or $callerID='secLoc' or $callerID='caseLoc'
                         or $callerID='acDate' or $callerID='catDate'">center</xsl:when>
            <xsl:otherwise>left</xsl:otherwise></xsl:choose></xsl:variable>
        
        <xsl:choose>
          <xsl:when test="$horiz='right'">
            <xsl:choose>
              <xsl:when test="$callerID=$SortBy">tdEmphRight</xsl:when>
              <xsl:otherwise>tdRight</xsl:otherwise>
            </xsl:choose>
            </xsl:when>
          
          <xsl:when test="$horiz='center'">  
            <xsl:choose>
              <xsl:when test="$callerID=$SortBy">tdEmphCenter</xsl:when>
              <xsl:otherwise>tdCenter</xsl:otherwise>
            </xsl:choose>
          </xsl:when>      
           
          <xsl:when test="$horiz='left'">  
            <xsl:choose>
              <xsl:when test="$callerID=$SortBy">tdEmphLeft</xsl:when>
              <xsl:otherwise>tdLeft</xsl:otherwise>
            </xsl:choose>
          </xsl:when>        
        </xsl:choose>
      </xsl:attribute>
      
      <xsl:choose>
        <xsl:when test="$callerID='mfgMarkjpg'"> 
          <xsl:choose>
            <xsl:when test="$val='-'">&#160;</xsl:when>
            <xsl:when test="contains($val, ' ')">
              <xsl:variable name="before"><xsl:value-of select="substring-before($val,' ')"/></xsl:variable>
              <xsl:variable name="after"><xsl:value-of select="substring-after($val,' ')"/></xsl:variable>
              <br/>
              <xsl:element name="img">
                <xsl:attribute name="src">mfgMarkjpg/<xsl:value-of select="$before"/></xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute></xsl:element>
              <br/>
              <xsl:value-of select="$before"/>
              <br/><br/>
              <xsl:element name="img">
                <xsl:attribute name="src">mfgMarkjpg/<xsl:value-of select="$after"/></xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute></xsl:element>         
              <br/> 
              <xsl:value-of select="$after"/><br/>
              <br/>
            </xsl:when>
            <xsl:otherwise>
              <br/>
              <xsl:element name="img">
                <xsl:attribute name="src">mfgMarkjpg/<xsl:value-of select="$val"/></xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute></xsl:element>
              <br/><xsl:value-of select="$val"/><br/>
              <br/>
              </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        
        <xsl:when test="$callerID='prf'">
          <xsl:choose>
          <xsl:when test="$val=''">&#160;</xsl:when>
          <xsl:when test="$val='-'">&#160;</xsl:when>
            <xsl:otherwise>
              <xsl:element name="a"> 
                <xsl:attribute name="href">specimens/<xsl:value-of select="$val"/>.htm</xsl:attribute>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:value-of select="$val"/>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
          
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$val=''">&#160;</xsl:when>
            <xsl:when test="$val='-'">&#160;</xsl:when>
            <xsl:otherwise><xsl:value-of select="$val"/></xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
        
      </xsl:choose>
      
     </xsl:element>

  </xsl:template>

  <xsl:template name="ShowOnlyLinks">
    <xsl:param name="callerID"><xsl:value-of select="$SortBy"/></xsl:param>
    
    <xsl:choose>
      <!-- wcn mfgMark mfgMarkjpg Group sp -->
      <xsl:when test="$SortBy='mfgMark'">
        show only
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">A</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">B</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">C</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">D</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">E</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">F</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">G</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">H</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">I</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">J</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">K</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">L</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">M</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">N</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">O</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">P</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Q</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">R</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">S</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">T</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">U</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">V</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">W</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">X</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Y</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Z</xsl:with-param></xsl:call-template>
        <!-- when letter is '', will show 'all' -->
        <xsl:call-template name="linkSO"><xsl:with-param name="letter"/></xsl:call-template>
      </xsl:when>

      <xsl:otherwise>&#160;</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="linkSO">
    <!--links in the ShowOnly bar across the top-->
    <xsl:param name="letter"/>
    <xsl:variable name="letterDsp"><xsl:value-of select="$letter"/></xsl:variable>
    
    <xsl:variable name="localCount">
      <xsl:choose>

        <xsl:when test="$letter=''">
          <xsl:choose>
            <xsl:when test="count(//Type)=0">FOOB</xsl:when>
            <xsl:otherwise><xsl:value-of select="count(//text)"/></xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <xsl:when test="$SortBy='Name'">
          <xsl:if test="count(//Type[starts-with(@Name,$letter)])>0">
            <xsl:value-of select="count(//Type[starts-with(@Name,$letter)])"/>
          </xsl:if>
          <!--
          <xsl:choose>
            <xsl:when test="count(//Type[starts-with(@Name,$letter)])=0">no</xsl:when>
            <xsl:otherwise><xsl:value-of select="count(//Type[starts-with(@Name,$letter)])"/></xsl:otherwise>
          </xsl:choose>
          -->
        </xsl:when>

        <xsl:when test="$SortBy='mfgMark'">
          <xsl:if test="count(//Type[starts-with(@mfgMark,$letter)])>0">
            <xsl:value-of select="count(//Type[starts-with(@mfgMark,$letter)])"/>
          </xsl:if>
        </xsl:when>

        <xsl:when test="$SortBy='mfgMarkjpg'">
          <xsl:if test="count(//Type[starts-with(@mfgMarkjpg,$letter)])>0">
            <xsl:value-of select="count(//Type[starts-with(@mfgMarkjpg,$letter)])"/>
          </xsl:if>

        </xsl:when>

      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="s">
      <xsl:choose>
        <xsl:when test="$localCount=1"/>
        <xsl:otherwise>s</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="localToolTip">
      <xsl:choose>
        <xsl:when test="$letter=''"></xsl:when>
         
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="$SortBy='Name' and $localCount>0">        
              <xsl:value-of select="$localCount"/> font<xsl:value-of
                select="$s"/> with font name starting with <xsl:value-of select="$letter"/></xsl:when>

            <xsl:when test="$SortBy='Cab'">Cabinet <xsl:value-of select="$letterDsp"/></xsl:when>

            <xsl:when test="$SortBy='pts'"><xsl:value-of select="$letter"/>pt font<xsl:value-of
                 select="$s"/>: <xsl:value-of select="$localCount"/></xsl:when>

          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$localCount>0">
        <xsl:choose>
          <xsl:when test="$letter=$ShowOnly">
            <xsl:value-of select="$letterDsp"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:element name="a">
              <xsl:attribute name="class">colHd</xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="$localToolTip"/>
              </xsl:attribute>
              <xsl:attribute name="href">javascript:fnShowOnly('<xsl:value-of select="$letter"/>')</xsl:attribute>
              <xsl:value-of select="$letterDsp"/>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <xsl:when test="$letter='' and $ShowOnly!=''">    
        <xsl:element name="a">
          <xsl:attribute name="class">colHd</xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="$localToolTip"/>
          </xsl:attribute>
          <xsl:attribute name="href">javascript:fnShowOnly('')</xsl:attribute>all</xsl:element>
      </xsl:when>
      
      <!-- <xsl:otherwise></xsl:otherwise> -->
      
    </xsl:choose>

    <xsl:text><!-- '&#160;' is not needed; the newline alone is enough -->
    </xsl:text>
    
  </xsl:template>

</xsl:stylesheet>
