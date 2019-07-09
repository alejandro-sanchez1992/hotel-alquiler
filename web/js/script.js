$(document).ready(function(){
	$("#dias, #tipo-habitacion").on("keyup change", function(e){
            var dias = $("#dias").val();
            var tipoHabitacion = $("#tipo-habitacion").val();
            e.preventDefault();
            if (dias != "") {
                $.ajax({
                    type : "POST",
                    url : "servlet",
                    data: {
                        tipoHabitacion: tipoHabitacion, 
                        dias: dias
                    },
                    success : function(data) {
                        $(".total").html(data);
                        $(".texto").html("Gracias Por su compra");
                    }
                });
            }
        });
});