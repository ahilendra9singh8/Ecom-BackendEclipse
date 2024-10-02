<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<style>
body {
	margin: 0;
}

#scichart-root {
	width: 50%;
	height: 50vh;
}

#scichart-root1 {
	width: 50%;
	height: 50vh;
}

#scichart-root2 {
	width: 50%;
	height: 50vh;
}
</style>

<!-- Reference the latest version. Not recommended for production! -->
<script src="https://cdn.jsdelivr.net/npm/scichart/index.min.js"
	crossorigin="anonymous"></script>

<!-- Reference a specific version. Recommended for prod -->
<!--        <script src="https://cdn.jsdelivr.net/npm/scichart@3.2.446/index.min.js" crossorigin="anonymous">
                </script>-->
</head>
<body>
	<h1>Hello World!</h1>

	<div id="chart_div" style="width: 100%; height: 350px;"></div>


	<div id="scichart-root"></div>

	<!--        <hr><hr> comment 
        
                <div id="scichart-root1" ></div>
        
                <hr><hr> comment 
        
                <div id="scichart-root2" ></div>-->
</body>
</html>

<!--scichart-root-->
<script>
    // Create a SciChartSurface in the div 'scichart-root'
    const initSciChart = async (divElementId) => {
        const {
            SciChartSurface,
            NumericAxis,
            FastLineRenderableSeries,
            XyDataSeries,
            EllipsePointMarker,
            SweepAnimation,
            SciChartJsNavyTheme,
            SciChartJSLightTheme,
            NumberRange,
            MouseWheelZoomModifier,
            ZoomPanModifier,
            ZoomExtentsModifier,
            DataPointSelectionModifier,
            TextAnnotation,
            HorizontalLineAnnotation,
            appTheme,
            ELabelPlacement,
            parseColorToUIntArgb,
            ETooltipSelectionModifier,
            ESciChartSurfaceModifier,
            EMultiLineAlignment

        } = SciChart;

        // Tell SciChart where to get webassembly files from.
        SciChartSurface.useWasmFromCDN();
        // Initialize SciChartSurface. Don't forget to await!
        const {sciChartSurface, wasmContext} = await SciChartSurface.create(divElementId, {
            theme: new SciChartJsNavyTheme(),
            title: "SciChart.js First Chart",
            titleStyle: {fontSize: 22}
        });
        // Create an XAxis and YAxis with growBy padding
        const growBy = new NumberRange(0.1, 0.1);
        sciChartSurface.xAxes.add(new NumericAxis(wasmContext, {axisTitle: "X Axis", growBy}));
        sciChartSurface.yAxes.add(new NumericAxis(wasmContext, {axisTitle: "Y Axis", growBy}));

        const dataSeries = new XyDataSeries(wasmContext, {
//            xValues: [0, 1, , 2, 3],
//            yValues: [0, 1, , 2, 3]

            xValues: [0, 1, 2, 3, 4],
            yValues: [0, 1, 2, 3, 4]
        });

        const lineSeries = new FastLineRenderableSeries(wasmContext, {
            stroke: "steelblue",
            strokeThickness: 3,
            dataSeries,
            pointMarker: new EllipsePointMarker(wasmContext, {width: 11, height: 11, fill: "#fff"}),
            dataLabels: {
                style: {
                    fontFamily: "Arial",
                    fontSize: 16,
                    lineSpacing: 4,
                    multiLineAlignment: EMultiLineAlignment.Left
                },
                color: "#EEE"
            },
            animation: new SweepAnimation({duration: 300, fadeEffect: true})
        });

        // Override default dataLabelProvider.getText() function
        // See type DataLabelState for available data
        lineSeries.dataLabelProvider.getText = (dataLabelState) => {
//            alert(dataLabelState.xVal());
            return `Point index ${dataLabelState.index}\n[x: ${dataLabelState.xVal()}, y: ${dataLabelState.yVal()}]`;
        };

//         Create a line series with some initial data
        sciChartSurface.renderableSeries.add(lineSeries);







//        // Add ToolTipModifier to show labels on hover
//        const toolTipModifier = new SciChart.TooltipModifier({
//            executeOn: [SciChart.SciChartSurfaceModifier.MouseMove], 
//            modifierContext: new SciChart.ModifierContext(wasmContext),
//            onDataPointTooltip: (point) => {
//                return `X: ${point.x}, Y: ${point.y}`;
//            }
//        });
//        sciChartSurface.chartModifiers.add(toolTipModifier);

        // Add annotations to show the thresholds
//        const THRESHOLD_HIGH_LEVEL = 0;
//        const THRESHOLD_LOW_LEVEL = -2;
//        const THRESHOLD_LOW_COLOR_ARGB = parseColorToUIntArgb(appTheme.VividPink);
//        const THRESHOLD_HIGH_COLOR_ARGB = parseColorToUIntArgb(appTheme.VividTeal);
//
//        sciChartSurface.annotations.add(
//                new HorizontalLineAnnotation({
////                    stroke: appTheme.VividTeal,
//                    strokeDashArray: [2, 2],
//                    y1: THRESHOLD_HIGH_LEVEL,
//                    labelPlacement: ELabelPlacement.TopRight,
//                    labelText: "High warning", // Add your label text here
////                    axisLabelFill: appTheme.VividTeal,
//                    showLabel: true
//                })
//                );

// Add DataPointSelectionModifier to show coordinates as labels
//        const dataPointSelectionModifier = new DataPointSelectionModifier({
//            tooltipContainer: divElementId,
//            selectionMode: ETooltipSelectionModifier.SelectionMode.MouseOver,
//            showTooltip: true,
//            executeOn: [ESciChartSurfaceModifier.MouseMove]
//        });
//        sciChartSurface.chartModifiers.add(dataPointSelectionModifier);

        // Add some interaction modifiers to show zooming and panning
        sciChartSurface.chartModifiers.add(new MouseWheelZoomModifier(), new ZoomPanModifier(), new ZoomExtentsModifier());


    };
    initSciChart("scichart-root");
</script>

<!--scichart-root1-->
<!--<script>
    async function simpleLineChart(divElementId) {
        // #region ExampleA
        // Demonstrates how to create a line chart with SciChart.js
        const {
            SciChartSurface,
            NumericAxis,
            FastLineRenderableSeries,
            XyDataSeries,
            SciChartJsNavyTheme
        } = SciChart;
        // or, for npm, import { SciChartSurface, ... } from "scichart"

        const {wasmContext, sciChartSurface} = await SciChartSurface.create(divElementId, {
            theme: new SciChartJsNavyTheme()
        });
        sciChartSurface.xAxes.add(new NumericAxis(wasmContext));
        sciChartSurface.yAxes.add(new NumericAxis(wasmContext));
        const xValues = [];
        const yValues = [];
        for (let i = 0; i < 100; i++) {
            xValues.push(i);
            yValues.push(0.2 * Math.sin(i * 0.1) - Math.cos(i * 0.01));
        }

        const xyDataSeries = new XyDataSeries(wasmContext, {
            xValues,
            yValues,
        });
        const lineSeries = new FastLineRenderableSeries(wasmContext, {
            stroke: "#FF6600",
            strokeThickness: 5,
            dataSeries: xyDataSeries
        });
        sciChartSurface.renderableSeries.add(lineSeries);
        // #endregion

        // Optional: add zooming, panning for the example
        const {MouseWheelZoomModifier, ZoomPanModifier, ZoomExtentsModifier} = SciChart;
        sciChartSurface.chartModifiers.add(new MouseWheelZoomModifier(), new ZoomPanModifier, new ZoomExtentsModifier());
    }
    ;
    simpleLineChart("scichart-root1");</script>

scichart-root2
<script>
    async function builderExample(divElementId) {
        // #region ExampleB
        // Demonstrates how to create a line chart with SciChart.js using the Builder API
        const {
            chartBuilder,
            ESeriesType,
            EThemeProviderType
        } = SciChart;
        // or, for npm, import { chartBuilder, ... } from "scichart"

        const {wasmContext, sciChartSurface} = await chartBuilder.build2DChart(divElementId, {
            surface: {theme: {type: EThemeProviderType.Dark}},
            series: [
                {
                    type: ESeriesType.LineSeries,
                    xyData: {
                        xValues: [0, 1, 2, 3, 4, 5, 6, 7, 8],
                        yValues: [2.5, 3.5, 3.7, 4.0, 5.0, 5.5, 5.0, 4.0, 3.0]
                    },
                    options: {
                        stroke: "#0066FF",
                        strokeThickness: 5,
                    }
                }
            ]
        });
        // #endregion
    }
    ;
// Uncomment this to use the builder example
    builderExample("scichart-root2");
</script>-->


<!--  
<script type="text/javascript">

        google.charts.load("current", {packages: ['corechart']});
        google.charts.setOnLoadCallback(drawChart);


        function drawChart() {
            var data = google.visualization.arrayToDataTable
                    ([['X', 'Y'],
                        [1, 3],
                        [2, 2.5],
                        [3, 3],
                        [4, 4],
                        [5, 4],
                        [6, 3],
                        [7, 2.5],
                        [8, 3]
                    ]);
            var options = {
                legend: 'none',
                hAxis: {minValue: 0, maxValue: 9},
                colors: ['#795548'],
                pointSize: 20,
                pointShape: 'square',
                explorer: {
                    actions: ['dragToZoom', 'rightClickToReset'],
                    axis: 'horizontal',
                    keepInBounds: true,
                    maxZoomIn: 4.0
                }

            };


            var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
            chart.draw(data, options);

            var labels = data.getDistinctValues(1);
            var view = new google.visualization.DataView(data);
            var layout = chart.getChartLayoutInterface();

            for (var i = 0; i < labels.length; i++) {
                view.setRows(data.getFilteredRows([{column: 1, value: labels[i]}]));

                var rowIndex = view.getTable().getFilteredRows([{column: 1, value: labels[i]}])[0];
                var point = layout.getBoundingBox('point#' + rowIndex);

                var label = document.createElementNS('http://www.w3.org/2000/svg', 'text');
                label.setAttribute('x', point.left + point.width / 2);
                label.setAttribute('y', point.top - 5); // Adjust the vertical position as needed
                label.setAttribute('fill', '#795548');
                label.setAttribute('font-size', '12');
                label.setAttribute('font-weight', 'bold');
                label.setAttribute('text-anchor', 'middle');
                label.textContent = data.getValue(rowIndex, 1).toString();

                chart.getContainer().getElementsByTagName('svg')[0].appendChild(label);
            }
        }

    </script>
-->


