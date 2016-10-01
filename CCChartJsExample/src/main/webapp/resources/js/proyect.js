/*
 * Autor: Eduardo Alfonso Sanchez
 */


$(document).ready(function () {

    /**
     * Selecciona los div y le da un styli diferente a los par que a los impares
     */
//    d3.selectAll("div").style("background-color", function (d, i) {
//        return i % 2 ? "#1b6d85" : "#269abc";
//    });


    /*
     * Selecciona los div y le da tamaño de letras a cada uno segun el arreglo pasado
     */
//    d3.selectAll("div")
//            .data([4, 8, 15, 16, 23, 42])
//            .style("font-size", function (d) {
//                return d + "px";
//            });

    /**
     * selecciona los parrafros del body, si hay menos p que datas se crear nuevos p (enter)
     */
//    d3.select("body")
//            .selectAll("p")
//            .data([4, 8, 15, 16, 23, 42])
//            .enter().append("p")
//            .text(function (d) {
//                return "I’m number " + d + "!";
//            });


    /*
     * Realiza una transición del fondo del body hacia el negro
     */
//    d3.select("body").transition()
//            .style("background-color", "black");


});
