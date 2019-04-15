%% Prueba Animated Line
function AnimatedLine()
close all;
clc;
%% Ventana de Grafica:
figure('Name', 'Gráfica de Voltaje')
title('Canales Analógicos y Digitales ADC Serial')
xlabel('Muestras (s)')
ylabel('Voltaje V')
grid on;
%% Variables:
i = 1;
s = 300;
Fs = 10;       % Mayor => menos periodos de la señal graficados
a = tic;
Vs = 10;       % Mayor => más 'continua' la graficación
A2 = 1;        % Amplitud CH2
A3 = 1;        % Amplitud CH3
A4 = 0.5;      % Amplitud CH4
%% Ciclo graficar con Animated Line:
h1 = animatedline('Color','b');
h2 = animatedline('Color','r');
h3 = animatedline('Color','g');
h4 = animatedline('Color','y');
while i<=s
    y1 = 10+sin(i/Fs);      % i/Fs afecta cuantos periodos se grafican en el mismo eje  
    y2 = 7+A2*cos(i/Fs);
    y3 = 4+A3*square(i/Fs);
    y4 = 1+A4*square(i/Fs);
    axis([0,s,0,11]);
    addpoints(h1,i,y1)
    addpoints(h2,i,y2)
    addpoints(h3,i,y3)
    addpoints(h4,i,y4)
    i = i + 1;
    b = toc(a);
    if b > (1/Vs)              % 'Velocidad' al graficar y actualizar pantalla
        drawnow                % Update cada 1/Vs segs 
        a = tic;               % Resetea timer luego de update
    end
    if i>=s                    % Cuando llega al final del eje vuelve a 0
        i = 1;
        clearpoints(h1);
        clearpoints(h2);
        clearpoints(h3);
        clearpoints(h4);
    end    
end
end