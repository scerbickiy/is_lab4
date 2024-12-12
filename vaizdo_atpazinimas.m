close all
clear all
clc
%% raidþiø pavyzdþiø nuskaitymas ir poþymiø skaièiavimas
%% read the image with hand-written characters
pavadinimas = 'training.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 8);
%% Atpaþintuvo kûrimas
%% Development of character recognizer
% poþymiai ið celiø masyvo perkeliami á matricà
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teisingø atsakymø matrica: 11 raidþiø, 8 eilutës mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(11), eye(11), eye(11), eye(11), eye(11), eye(11), eye(11), eye(11)];
% sukuriamas SBF tinklas duotiems P ir T sàryðiams
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = newrb(P,T,0,1,13);

%% Tinklo patikra | Test of the network (recognizer)
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,12:22);
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas0 = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
            atsakymas0 = [atsakymas0, 'A'];
        case 2
            atsakymas0 = [atsakymas0, 'B'];
        case 3
            atsakymas0 = [atsakymas0, 'C'];
        case 4
            atsakymas0 = [atsakymas0, 'D'];
        case 5
            atsakymas0 = [atsakymas0, 'E'];
        case 6
            atsakymas0 = [atsakymas0, 'F'];
        case 7
            atsakymas0 = [atsakymas0, 'G'];
        case 8
            atsakymas0 = [atsakymas0, 'H'];
        case 9
            atsakymas0 = [atsakymas0, 'I'];
        case 10
            atsakymas0 = [atsakymas0, 'K'];
        case 11
            atsakymas0 = [atsakymas0, 'J'];
    end
end
% pateikime rezultatà komandiniame lange
% show the result in command window
disp(atsakymas0)
figure, text(0.1,0.5,atsakymas0,'FontSize',38)
%% þodþio "KADA" poþymiø iðskyrimas 
%% Extract features of the test image
pavadinimas = 'test_kebab.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
%% Perform letter/symbol recognition
% poþymiai ið celiø masyvo perkeliami á matricà
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas1 = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas1 = [atsakymas1, 'A'];
        case 2
            atsakymas1 = [atsakymas1, 'B'];
        case 3
            atsakymas1 = [atsakymas1, 'C'];
        case 4
            atsakymas1 = [atsakymas1, 'D'];
        case 5
            atsakymas1 = [atsakymas1, 'E'];
        case 6
            atsakymas1 = [atsakymas1, 'F'];
        case 7
            atsakymas1 = [atsakymas1, 'G'];
        case 8
            atsakymas1 = [atsakymas1, 'H'];
        case 9
            atsakymas1 = [atsakymas1, 'I'];
        case 10
            atsakymas1 = [atsakymas1, 'K'];
        case 11
            atsakymas1 = [atsakymas1, 'J'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure, text(0.1,0.5,atsakymas1,'FontSize',38), axis off
%% þodþio "ABIDE" poþymiø iðskyrimas 
%% extract features for next/another test image
pavadinimas = 'test_abide.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raidþiø atpaþinimas
% poþymiai ið celiø masyvo perkeliami á matricà
P2 = cell2mat(pozymiai_patikrai);
% skaièiuojamas tinklo iðëjimas neþinomiems poþymiams
Y2 = sim(tinklas, P2);
% ieðkoma, kuriame iðëjime gauta didþiausia reikðmë
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskaièiuosime raidþiø skaièiø - poþymiø P2 stulpeliø skaièiø
raidziu_sk = size(P2,2);
% rezultatà saugosime kintamajame 'atsakymas'
atsakymas2 = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas2 = [atsakymas2, 'A'];
        case 2
            atsakymas2 = [atsakymas2, 'B'];
        case 3
            atsakymas2 = [atsakymas2, 'C'];
        case 4
            atsakymas2 = [atsakymas2, 'D'];
        case 5
            atsakymas2 = [atsakymas2, 'E'];
        case 6
            atsakymas2 = [atsakymas2, 'F'];
        case 7
            atsakymas2 = [atsakymas2, 'G'];
        case 8
            atsakymas2 = [atsakymas2, 'H'];
        case 9
            atsakymas2 = [atsakymas2, 'I'];
        case 10
            atsakymas2 = [atsakymas2, 'K'];
        case 11
            atsakymas2 = [atsakymas2, 'J'];
    end
end
% pateikime rezultatà komandiniame lange
% disp(atsakymas)
figure, text(0.1,0.5,atsakymas2,'FontSize',38), axis off
