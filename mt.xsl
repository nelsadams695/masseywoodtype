<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!--make content for div id="indexDiv"-->
  <xsl:output method="html" indent="yes" encoding="utf-8"/>
  <xsl:param name="SortBy">Name</xsl:param>
  <xsl:param name="ShowOnly"/>

<!-- Dec 2016 stopped showing mID -->
  <!-- mID spec Cab gr pts Name -->
  <!--<xsl:param name="mIDDsp"></xsl:param>  -->
  <xsl:param name="CabDsp">show</xsl:param>
  <xsl:param name="grDsp"></xsl:param>
  <xsl:param name="ptsDsp">show</xsl:param>
  <xsl:param name="NameDsp">show</xsl:param>
  <xsl:param name="specDsp">show</xsl:param>

<!-- 
  <xsl:variable name="mIDDspVal">
    <xsl:choose>
      <xsl:when test="$mIDDsp='show'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  -->

  <xsl:variable name="specDspVal">
    <xsl:choose>
      <xsl:when test="$specDsp='show'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:variable name="CabDspVal">
    <xsl:choose>
      <xsl:when test="$CabDsp='show'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="grDspVal">
    <xsl:choose>
      <xsl:when test="$grDsp='show'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:variable name="ptsDspVal">
    <xsl:choose>
      <xsl:when test="$ptsDsp='show'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="NameDspVal">
    <xsl:choose>
      <xsl:when test="$NameDsp='show'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="numCols"><!--  $mIDDspVal + -->
    <xsl:value-of select="$specDspVal + $CabDspVal + $grDspVal + $ptsDspVal + $NameDspVal " /> 
  </xsl:variable>

  <xsl:template match="/">
    <!-- mID spec Cab gr pts Name -->
<!-- 
    <xsl:variable name="mIDCol">
      <xsl:choose><xsl:when test="$mIDDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose>
    </xsl:variable>
-->
    
    <xsl:variable name="specCol">
      <xsl:choose><xsl:when test="$specDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="CabCol">
      <xsl:choose><xsl:when test="$CabDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose>
    </xsl:variable>

    <xsl:variable name="grCol">
      <xsl:choose><xsl:when test="$grDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="ptsCol">
      <xsl:choose><xsl:when test="$ptsDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="NameCol">
      <xsl:choose><xsl:when test="$NameDsp='show'">want</xsl:when><xsl:otherwise/></xsl:choose>
    </xsl:variable>

    <!-- start content for div id="indexDiv"-->
    <table class="indexTable">
      <!-- construct the colgroup -->
      <!-- mID spec Cab gr pts Name -->

      <colgroup>
        <!-- 
        <xsl:if test="$mIDCol!=''">
          <xsl:element name="col"><xsl:attribute name="width">50px</xsl:attribute></xsl:element>
        </xsl:if>
        -->
        
        <xsl:if test="$specCol!=''">
          <xsl:element name="col"><xsl:attribute name="width">35px</xsl:attribute></xsl:element>
        </xsl:if>
        
        <xsl:if test="$CabCol!=''">
          <xsl:element name="col"><xsl:attribute name="width">55px</xsl:attribute></xsl:element>
        </xsl:if>

        <xsl:if test="$grCol!=''">
          <xsl:element name="col"><xsl:attribute name="width">55px</xsl:attribute></xsl:element>
        </xsl:if>
        
        <xsl:if test="$ptsCol!=''">
          <xsl:element name="col"><xsl:attribute name="width">55px</xsl:attribute></xsl:element>
        </xsl:if>

        <xsl:if test="$NameCol!=''">
          <xsl:element name="col"><xsl:attribute name="width">300px</xsl:attribute></xsl:element>
        </xsl:if>

      </colgroup>
      
      <!-- ====== links row, top ====== -->
      
      <tr>
        <xsl:element name="td">
          <xsl:if test="$numCols &gt; 1"><xsl:attribute name="colspan"><xsl:value-of select="$numCols"/></xsl:attribute></xsl:if>
          <xsl:attribute name="class">thLeft</xsl:attribute>
          <xsl:attribute name="style">padding:10px;line-height:150%;</xsl:attribute>
          
          <!--| <a href="wtMfg.htm" class="colHd">Wood Type Makers</a> -->
          
          <a href="wtIntro.htm" class="colHd">Wood Type Intro</a> 
            | <a href="wt.htm" class="colHd">Wood Type Index</a>        
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
          <xsl:attribute name="class">tdTitle</xsl:attribute>Type Index</xsl:element>
      </tr>

      <!-- 
        ======
        index table row - show or hide cols
        ====== -->
      <!--
      <tr>
        <xsl:element name="td">
          <xsl:if test="$numCols &gt; 1"><xsl:attribute name="colspan"><xsl:value-of select="$numCols"/></xsl:attribute></xsl:if>
          <xsl:attribute name="class">thLeft</xsl:attribute>
          <xsl:attribute name="style">line-height:150%</xsl:attribute>
          
          show or hide columns:&#160;
          <xsl:for-each select="//item">
            <xsl:variable name="localShow">
              <xsl:choose>
                <xsl:when test="@id='mID'  and $mIDDsp='show'">show</xsl:when>
                <xsl:when test="@id='Cab'  and $CabDsp='show'">show</xsl:when>
                <xsl:when test="@id='pts'  and $ptsDsp='show'">show</xsl:when>
                <xsl:when test="@id='Name' and $NameDsp='show'">show</xsl:when>
                <xsl:when test="@id='spec' and $specDsp='show'">show</xsl:when>
              </xsl:choose>
            </xsl:variable>

            <xsl:choose>
              <xsl:when test="$localShow='show'">
                <xsl:element name="a">
                  <xsl:attribute name="class">colHdEmph</xsl:attribute>
                  <xsl:attribute name="title">click to hide <xsl:value-of select="@id"/> column</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnHideCol('<xsl:value-of select="@id"/>');</xsl:attribute>
                  <xsl:value-of select="@label"/>
                </xsl:element>
              </xsl:when>
              <xsl:otherwise>
                <xsl:element name="a">
                  <xsl:attribute name="class">colHd</xsl:attribute>
                  <xsl:attribute name="title">click to show <xsl:value-of select="@id"/> column</xsl:attribute>
                  <xsl:attribute name="href">javascript:fnShowCol('<xsl:value-of select="@id"/>');</xsl:attribute>
                  <xsl:value-of select="@label"/>
                </xsl:element>
              </xsl:otherwise>
            </xsl:choose>

            <xsl:if test="position()!=last()">
              <xsl:text>&#160;
</xsl:text>
            </xsl:if>

          </xsl:for-each>

        </xsl:element>
      </tr>
      -->
      
      <!-- ====== index table row - ShowOnlyLinks, e.g., A B C, for show all/only ====== -->

      <tr>
        <xsl:element name="td">
          <xsl:attribute name="colspan"><xsl:value-of select="$numCols"/></xsl:attribute>
          <xsl:attribute name="class">thLeft</xsl:attribute>    
          <!--  
            <xsl:if test="$SortBy='pts'"><xsl:attribute name="style">line-height:150%;</xsl:attribute></xsl:if>
          -->
          <xsl:call-template name="ShowOnlyLinks"/>
        </xsl:element>
        </tr>

      <!-- ====== spacer row ====== -->
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
              <!-- mID spec Cab gr pts Name -->
              <!-- <xsl:when test="@id='mID'   and $mIDDsp='show'">show</xsl:when> -->
              <xsl:when test="@id='spec'  and $specDsp='show'">show</xsl:when>     
              <xsl:when test="@id='Cab'   and $CabDsp='show'">show</xsl:when>
              <xsl:when test="@id='gr'    and $grDsp='show'">show</xsl:when>
              <xsl:when test="@id='pts'   and $ptsDsp='show'">show</xsl:when>
              <xsl:when test="@id='Name'  and $NameDsp='show'">show</xsl:when>    
            </xsl:choose>
          </xsl:variable>

          <!-- mID spec Cab gr pts Name -->
          <xsl:if test="$localShow='show'">
            <xsl:call-template name="THcell">
              <xsl:with-param name="callerID"><xsl:value-of select="@id"/></xsl:with-param>
              <xsl:with-param name="labelTH"><xsl:value-of select="@labelTH"/></xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>
      </tr>
      
      <!-- ====== index data cells ====== -->
      <!-- mID spec Cab gr pts Name -->

      <xsl:choose>
      <xsl:when test="$SortBy='mID'">
          <xsl:apply-templates select="//Type">
            <xsl:sort select="@mID"/>
          </xsl:apply-templates>
        </xsl:when>
  
        <xsl:when test="$SortBy='spec'">
          <xsl:apply-templates select="//Type">
            <xsl:sort select="@spec"/>
            <xsl:sort select="@Name"/>
          </xsl:apply-templates>
        </xsl:when>
        
        <xsl:when test="$SortBy='Cab'">
          <xsl:choose>
            <xsl:when test="$ShowOnly=''">
              <xsl:apply-templates select="//Type">
                <xsl:sort select="@Cab"/>
                <!-- 
                <xsl:sort select="@Name"/>
                <xsl:sort select="@pts" data-type="number"/>
                -->
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="( //Type[starts-with(@Cab,$ShowOnly)] )">
                <xsl:sort select="@Cab"/>
                <!-- 
                <xsl:sort select="@Name"/>
                <xsl:sort select="@pts" data-type="number"/>
                -->
              </xsl:apply-templates>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
 
        <xsl:when test="$SortBy='gr'">
          <xsl:choose>
            <xsl:when test="$ShowOnly=''">
              <xsl:apply-templates select="//Type">
                <xsl:sort select="@gr"/>
                <xsl:sort select="@Name"/>
                <xsl:sort select="@pts" data-type="number"/>  
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates
                select="( //Type[@gr=$ShowOnly] )">
                <xsl:sort select="@gr"/>
                <xsl:sort select="@Name"/>
                <xsl:sort select="@pts" data-type="number"/>
              </xsl:apply-templates>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        
        <xsl:when test="$SortBy='pts'">
          <xsl:choose>
            <xsl:when test="$ShowOnly=''">
              <xsl:apply-templates select="//Type">
                <xsl:sort select="@pts" data-type="number"/>  
                <xsl:sort select="@Cab"/>
                <xsl:sort select="@Name"/>
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates
                select="( //Type[@pts=$ShowOnly] )">
                <xsl:sort select="@pts" data-type="number"/>
                <xsl:sort select="@Cab"/>
                <xsl:sort select="@Name"/>
              </xsl:apply-templates>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        
        <xsl:when test="$SortBy='Name'">
          <xsl:choose>
            <xsl:when test="$ShowOnly=''">
              <xsl:apply-templates select="//Type">
                <xsl:sort select="@Name"/>
                <xsl:sort select="@pts" data-type="number"/>
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates
                select="( //Type[starts-with(@Name,$ShowOnly)] )">
                <xsl:sort select="@Name"/>
                <xsl:sort select="@pts" data-type="number"/>
              </xsl:apply-templates>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        
      </xsl:choose>
    </table>
    <!--end content for div id="indexDiv"-->
  </xsl:template>

  <xsl:template match="Type">
    <!-- mID spec Cab gr pts Name -->
    <tr>
      <!--  
      <xsl:if test="$mIDDsp='show'">
        <xsl:call-template name="TDcell">
          <xsl:with-param name="callerID">mID</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      -->

      <xsl:if test="$specDsp='show'">
        <xsl:call-template name="TDcell">
          <xsl:with-param name="callerID">spec</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      
      <xsl:if test="$grDsp='show'">
        <xsl:call-template name="TDcell">
          <xsl:with-param name="callerID">gr</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
   
      <xsl:if test="$CabDsp='show'">
        <xsl:call-template name="TDcell">
          <xsl:with-param name="callerID">Cab</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      
      <xsl:if test="$ptsDsp='show'">
        <xsl:call-template name="TDcell">
          <xsl:with-param name="callerID">pts</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="$NameDsp='show'">
        <xsl:call-template name="TDcell">
          <xsl:with-param name="callerID">Name</xsl:with-param>
        </xsl:call-template>
      </xsl:if>

    </tr>
  </xsl:template>

  <xsl:template name="THcell">
    <xsl:param name="callerID"/>
    <xsl:param name="labelTH"/>
    <xsl:element name="td">

      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$callerID=$SortBy">
            <xsl:choose>
              <xsl:when test="$callerID='Name'">thEmphLeft</xsl:when>
              <xsl:otherwise>thEmphCenter</xsl:otherwise>
            </xsl:choose>      
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$callerID='Name'">thBoldLeft</xsl:when>
              <xsl:otherwise>thBoldCenter</xsl:otherwise>
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
            <xsl:attribute name="title">click to sort by <xsl:value-of select="$callerID"/></xsl:attribute>
            <xsl:attribute name="href">javascript:fnSortBy('<xsl:value-of select="$callerID"/>');</xsl:attribute>
            <xsl:value-of select="$labelTH"/>
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <!-- end THcell -->

  <xsl:template name="TDcell">
    <xsl:param name="callerID"/>

    <xsl:variable name="val">
      <xsl:choose>
        <xsl:when test="$callerID='mID'"><xsl:value-of select="@mID"/></xsl:when>   
        <xsl:when test="$callerID='spec'"><xsl:value-of select="@spec"/></xsl:when>   
        <xsl:when test="$callerID='Cab'"><xsl:value-of select="@Cab"/></xsl:when>
        <xsl:when test="$callerID='gr'"><xsl:value-of select="@gr"/></xsl:when>
        <xsl:when test="$callerID='pts'"><xsl:value-of select="@pts"/></xsl:when>
        <xsl:when test="$callerID='Name'"><xsl:value-of select="@Name"/></xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:element name="td">

      <!-- mID spec Cab gr pts Name -->
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$callerID=$SortBy">
            <xsl:choose>
              <xsl:when test="$callerID='Name'">tdEmphLeft</xsl:when>
              <xsl:otherwise>tdEmphCenter</xsl:otherwise>
            </xsl:choose>
          </xsl:when>

          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$callerID='Name'">tdLeft</xsl:when>     
              <xsl:otherwise>tdCenter</xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>

      </xsl:attribute>
      <!--  <xsl:attribute name="style">color:black;font-size:+12px;</xsl:attribute> &#x2714; -->
      <xsl:choose>
        <xsl:when test="$val=''">GEO&#160;</xsl:when>
        <xsl:when test="$callerID='spec'">
          
          <xsl:choose>
            <xsl:when test="$val='x'">&#160;</xsl:when>
            <xsl:otherwise>
              <xsl:element name="a">  
                <xsl:choose>
                  <xsl:when test="$val='S'">
                    <xsl:attribute name="href">SpecimensType/bank.htm</xsl:attribute>                  
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="href">SpecimensType/<xsl:value-of select="$val"/>.htm</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:attribute name="target">_blank</xsl:attribute>
                <xsl:attribute name="style">color:green;</xsl:attribute>
                &#160;&#10004;&#160;
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$val='zz'">&#160;</xsl:when>
        <xsl:otherwise><xsl:value-of select="$val"/></xsl:otherwise>
      </xsl:choose>

    </xsl:element>

  </xsl:template>

  <xsl:template name="ShowOnlyLinks">
    <xsl:param name="callerID">
      <xsl:value-of select="$SortBy"/>
    </xsl:param>
    <xsl:choose>
      <!-- mID Cab pts gr Name spec -->
      <xsl:when test="$SortBy='Name' or $SortBy='Cab'">
        show
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

      <xsl:when test="$SortBy='pts'">
        show
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">6</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">8</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">10</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">11</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">12</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">13</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">14</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">15</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">16</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">17</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">18</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">20</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">21</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">24</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">26</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">27</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">30</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">34</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">36</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">42</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">48</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">52</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">54</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">60</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">72</xsl:with-param></xsl:call-template>
        <!-- when letter is '', will show 'all' -->
        <xsl:call-template name="linkSO"><xsl:with-param name="letter"/></xsl:call-template>
      </xsl:when>
      
      <xsl:when test="$SortBy='gr'">
        show
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Black</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Display</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Ornamented</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Roman</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Sans</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">Script</xsl:with-param></xsl:call-template>
        <xsl:call-template name="linkSO"><xsl:with-param name="letter">zz</xsl:with-param></xsl:call-template>
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

        <xsl:when test="$SortBy='Cab'">
          <xsl:if test="count(//Type[starts-with(@Cab,$letter)])>0">
            <xsl:value-of select="count(//Type[starts-with(@Cab,$letter)])"/>
          </xsl:if>
          
          <!--
          <xsl:choose>
            <xsl:when test="count(//Type[starts-with(@Cab,$letter)])=0">no</xsl:when>
            <xsl:otherwise><xsl:value-of select="count(//Type[starts-with(@Cab,$letter)])"/></xsl:otherwise>
          </xsl:choose>
          -->
        </xsl:when>

        <xsl:when test="$SortBy='gr'">
          <xsl:if test="count(//Type[starts-with(@gr,$letter)])>0">
            <xsl:value-of select="count(//Type[starts-with(@gr,$letter)])"/>
          </xsl:if>     
        </xsl:when> 
        
        <xsl:when test="$SortBy='pts'">
          <xsl:if test="count(//Type[@pts=$letter])>0">
            <xsl:value-of select="count(//Type[@pts=$letter])"/>
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

            <xsl:when test="$SortBy='gr'">Group <xsl:value-of select="$letterDsp"/></xsl:when>
            
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

    <xsl:text><!--&#160; not needed; the newline alone is enough-->
    </xsl:text>
    
  </xsl:template>

</xsl:transform>
