<?php header("Content-type: application/xml"); ?><StyledLayerDescriptor version="1.1.0" xmlns:gml="http://www.opengis.net/gml" xmlns:ogc="http://www.opengis.net/ogc"
                       xmlns:ows="http://www.opengis.net/ows" xmlns="http://www.opengis.net/sld"
                       xmlns:wms="http://www.opengis.net/ows" xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd"> 
    <NamedLayer> 
        <Name>g_street_lighting.street_lighting</Name>
        <UserStyle>
            <Name>g_street_lighting.street_lighting</Name>
            <FeatureTypeStyle>
                <Rule> 
                    <Name>g_street_lighting.street_lighting</Name> 
                    <ogc:Filter>
                        <ogc:PropertyIsEqualTo> 
                            <ogc:PropertyName>sl_id</ogc:PropertyName> 
                            <ogc:Literal><?php echo $_GET['id']; ?></ogc:Literal> 
                        </ogc:PropertyIsEqualTo> 
                    </ogc:Filter> 
                    <PolygonSymbolizer>
                        <Fill>
                            <CssParameter name="fill">#00FFFF</CssParameter>
                            <CssParameter name="fill-opacity">0.70</CssParameter>
                        </Fill>
                        <Stroke>
                            <CssParameter name="stroke">#0000FF</CssParameter>
                            <CssParameter name="stroke-width">1.00</CssParameter>
                        </Stroke>
                    </PolygonSymbolizer>
                </Rule> 
            </FeatureTypeStyle> 
        </UserStyle> 
    </NamedLayer> 
</StyledLayerDescriptor> 
