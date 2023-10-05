module circuito_equacao (
    input logic [3:0] X,       // Entrada de 4 bits para X
    output logic [6:0] Z 		// Saída de 7 bits para Z
);

	wire [6:0]X_aoquadrado = X*X;
	wire [6:0]X_vezes10 = X*10;

always @ *

	if (X > 6)
	
		Z = 2*X + 5;
	
	else
	
		Z = X_aoquadrado + X_vezes10;
		
endmodule 
		