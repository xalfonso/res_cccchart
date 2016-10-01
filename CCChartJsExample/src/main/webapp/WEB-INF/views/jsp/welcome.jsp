<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Spring MVC 4 + Ajax Hello World</title>

        <c:url var="home" value="/" scope="request" />


        <!-- CSS -->
        <spring:url value="/resources/core/css/bootstrap.min.css"
                    var="bootstrapCss" />
        <link href="${bootstrapCss}" rel="stylesheet" />

        <spring:url value="/resources/core/css/tipsy.css" var="tipsyCss" />
        <link href="${tipsyCss}" rel="stylesheet" />

        <spring:url value="/resources/css/proyect.css" var="proyectCss" />
        <link href="${proyectCss}" rel="stylesheet" />
        <!-- END CSS -->


        <!-- JS -->
        <spring:url value="/resources/core/js/jquery-3.0.0.min.js"
                    var="jqueryJs" />
        <script src="${jqueryJs}"></script>


        <spring:url value="/resources/core/js/jquery.tipsy.js"
                    var="jqueryTipsyJs" />
        <script src="${jqueryTipsyJs}"></script>

        <spring:url value="/resources/core/js/protovis.js"
                    var="protovisJs" />
        <script src="${protovisJs}"></script>

        <spring:url value="/resources/core/js/protovis-msie.js"
                    var="protovisMsiJs" />
        <script src="${protovisMsiJs}"></script>

        <spring:url value="/resources/core/js/tipsy.js"
                    var="tipsyJs" />
        <script src="${tipsyJs}"></script>

        <spring:url value="/resources/core/js/def.js"
                    var="defJs" />
        <script src="${defJs}"></script>

        <spring:url value="/resources/core/js/pvc-r2.0.js"
                    var="pvcJs" />
        <script src="${pvcJs}"></script>

        <!-- Data Test -->
        <spring:url value="/resources/js/q01-01.js"
                    var="dataChartJS" />
        <script src="${dataChartJS}"></script>


        <spring:url value="/resources/js/bp.js"
                    var="bpJS" />
        <script src="${bpJS}"></script>

        <!-- END JS -->
    </head>

    <body>
        <div id="bodyDasboardContentDiv">
            <div id="bodyDasboardContentDivRow1" class="divRow">
                <div class="panel panel-primary pull-left divGrafica2">
                    <div class="panel-heading" id="divHeadingGroup1">
                        <span>Grafica 1</span>
                    </div>
                    <div class="panel-body" id="divBodyGroup1">

                    </div>
                </div>

                <div class="panel panel-primary  pull-left divGrafica2">
                    <div class="panel-heading" id="divHeadingGroup2">
                        <span>Grafica 2</span>
                    </div>
                    <div class="panel-body" id="divBodyGroup2">                               

                    </div>
                </div> 
            </div>
            <div id="bodyDasboardContentDivRow2" class="divRow">
                <div class="panel panel-primary pull-left divGrafica">
                    <div class="panel-heading" id="divHeadingGroup3">
                        <span>Grafica 3</span>
                    </div>
                    <div class="panel-body" id="divBodyGroup3">

                    </div>
                </div>
            </div>
            <div id="bodyDasboardContentDivRow3" class="divRow">
                <div class="panel panel-primary pull-left divGrafica2">
                    <div class="panel-heading" id="divHeadingGroup4">
                        <span>Grafica 4</span>
                    </div>
                    <div class="panel-body" id="divBodyGroup4">

                    </div>
                </div>
                <div class="panel panel-primary pull-left divGrafica2">
                    <div class="panel-heading" id="divHeadingGroup5">
                        <span>Grafica 5</span>
                    </div>
                    <div class="panel-body" id="divBodyGroup5">

                    </div>
                </div>
            </div>
            <div id="bodyDasboardContentDivRow4" class="divRow">
                <div class="panel panel-primary pull-left divGrafica">
                    <div class="panel-heading" id="divHeadingGroup6">
                        <span>Grafica 6</span>
                    </div>
                    <div class="panel-body" id="divBodyGroup6">

                    </div>
                </div>
            </div>
        </div>




        <script>
            new pvc.PieChart({
                canvas: 'divBodyGroup1',
                width: 600,
                height: 400,
                // Data source
                crosstabMode: false,
                // Main Plot
                valuesVisible: true,
                valuesLabelStyle: 'inside',
                valuesMask: "{category}",
                valuesOverflow: 'trim',
                valuesOptimizeLegibility: true,
                valuesFont: 'normal 11px "Open Sans"',
                slice_strokeStyle: 'white',
                // Color axes
                colors: [
                    '#333333', '#777777', '#FFC20F', '#FFE085',
                    '#005CA7', '#0086F4', '#39A74A', '#63CA73'
                ],
                // Chart/Interaction
                animate: true,
                selectable: true,
                hoverable: true
            })
                    .setData(relational_03_b)
                    .render();
            /*----------------------------------------------------------------------------------------------------------*/
            new pvc.BarChart({
                canvas: "divBodyGroup2",
                width: 600,
                height: 400,
                title: "Bar Chart with Custom Tooltip",
                animate: true,
                selectable: true,
                hoverable: true,
                legend: true,
                tooltipFormat: function (scene) {
                    var fix = def.html.escape;

                    // Atoms of the first datum
                    var atoms = scene.firstAtoms;
                    return "<div style='text-align:left'>" +
                            "<b>City</b>: " + fix(atoms.city.label) + "<br/>" +
                            "<b>Day</b>: " + fix(atoms.day.label) + "<br/>" +
                            "<b>Count</b>: " + fix(atoms.count.label) +
                            "</div>";
                },
                seriesRole: 'city',
                categoryRole: 'day',
                valueRole: 'count',
                readers: [{names: 'city, day, count'}]
            })
                    .setData(relational_01, {crosstabMode: false})
                    .render();
            /*-------------------------------------------------------------------------------------------------------------------*/
            new pvc.PieChart({
                canvas: 'divBodyGroup3',
                width: 800,
                height: 800,
                // Data source
                crosstabMode: false,
                readers: 'region, brand, quantity, sales',
                // Data
                dimensions: {
                    // Dimension bound to "dataPart" is hidden by default
                    region: {isHidden: false},
                    // Sort brands
                    brand: {comparer: def.ascending},
                    // Notice the currency sign and the /1000 scale factor (the comma beside the dot).
                    sales: {valueType: Number, format: "#,0,.0K"}
                },
                // Visual Roles
                visualRoles: {
                    // Chart
                    dataPart: 'region',
                    // Main pLot
                    value: 'sales',
                    category: 'brand'
                },
                // Plots
                plots: [
                    {
                        // Main plot (outer)
                        name: 'main',
                        dataPart: 'EMEA',
                        valuesLabelStyle: 'inside',
                        valuesOptimizeLegibility: true,
                        valuesFont: 'normal 11px "Open Sans"',
                        slice_innerRadiusEx: '60%',
                        slice_strokeStyle: 'white'
                    },
                    {
                        // Second plot (inner)
                        name: 'inner',
                        type: 'pie',
                        dataPart: 'APAC',
                        valuesLabelStyle: 'inside',
                        valuesOptimizeLegibility: true,
                        valuesFont: 'normal 11px "Open Sans"',
                        slice_strokeStyle: 'white',
                        slice_outerRadius: function () {
                            return 0.5 * this.delegate(); // 50%
                        }
                    }
                ],
                // Panels
                title: "EMEA (outside) vs APAC (inside) Automobile Sales",
                titleFont: 'lighter 20px "Open Sans"',
                legend: true,
                legendShape: 'circle',
                legendFont: 'lighter 14px "Open Sans"',
                legendPosition: 'right',
                legendAlign: 'middle',
                legendMarkerSize: 25,
                // Chart/Interaction
                animate: true,
                selectable: true,
                hoverable: true,
                // Color axes
                colors: [
                    '#333333', '#777777', '#FFC20F', '#FFE085',
                    '#00325b', '#005CA7', '#0086F4', '#39A74A',
                    '#63CA73'
                ]
            })
                    .setData(relational_04b)
                    .render();
            /*--------------------------------------------------------------------------------------------------------------------------------*/
            new pvc.PieChart({
                canvas: 'divBodyGroup4',
                width: 600,
                height: 400,
                // Data source
                crosstabMode: false,
                // Main Plot
                valuesVisible: true,
                valuesFont: 'lighter 11px "Open Sans"',
                explodedSliceIndex: 1,
                explodedSliceRadius: '10%',
                slice_strokeStyle: 'white',
                // Color axes
                colors: [
                    '#333333', '#777777', '#FFC20F', '#FFE085',
                    '#005CA7', '#0086F4', '#39A74A', '#63CA73'
                ],
                // Panels
                title: "Rich Pie",
                titleSize: {width: '100%'},
                titlePaddings: '4%',
                titleFont: 'lighter 30px "Open Sans"',
                title_fillStyle: '#FFFFFF',
                titleLabel_textStyle: '#333333',
                legend: true,
                legendShape: 'circle',
                legendSize: {width: '100%'},
                legendArea_fillStyle: '#FFFFFF',
                legendFont: 'normal 11px "Open Sans"',
                // Chart/Interaction
                animate: false,
                selectable: true,
                hoverable: true
            })
                    .setData(relational_03_b)
                    .render();
            /*---------------------------------------------------------------------------------------------------------------------*/
            new pvc.PieChart({
                canvas: 'divBodyGroup5',
                width: 600,
                height: 400,
                // Data source
                crosstabMode: false,
                // Main plot
                valuesVisible: true,
                valuesFont: 'lighter 11px "Open Sans"',
                explodedSliceRadius: '2%',
                slice_innerRadiusEx: '50%',
                // Panels
                legend: false,
                // Chart/Interaction
                selectable: true,
                hoverable: true,
                tooltipClassName: 'light',
                // Color axes
                colors: [
                    '#333333', '#777777', '#FFC20F', '#FFE085',
                    '#005CA7', '#0086F4', '#39A74A', '#63CA73'
                ]
            })
                    .setData(relational_03_b)
                    .render();
            /*----------------------------------------------------------------------------------------------------------------------------*/
            var pie = new pvc.PieChart({
                canvas: 'divBodyGroup6',
                width: 1200,
                height: 600,
                // Data source
                isMultiValued: true,
                dataMeasuresInColumns: true,
                // Visual roles
                visualRoles: {multiChart: 'category3', category: 'category2'},
                // Main Plot
                slice_strokeStyle: 'white',
                valuesFont: 'lighter 11px "Open Sans"',
                // Panels
                titleFont: 'lighter 20px "Open Sans"',
                smallTitleFont: 'normal 14px "Open Sans"',
                legend: true,
                legendPosition: 'right',
                legendFont: 'normal 11px "Open Sans"',
                // Chart/Interaction
                animate: false,
                selectable: true,
                hoverable: true,
                // Color axes
                colors: [
                    '#333333', '#FFC20F', '#005CA7'
                ]
            })
                    .setData(steelWheels02)
                    .render();
        </script>


    </body>
</html>