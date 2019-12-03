#include <bits/stdc++.h>

using namespace std;

struct {
    string model, brand;
    string renavam, chassi;
    string plate, color;
    string category, fuel;
    int year;
} typedef car;

struct {
    string name;
    string cpf, rg, cnh;
    int day, month, year;
    string mom, dad;

    vector<car> cars;
} typedef person;

void clear_screen(){
    cout << "\033[2J\033[1;1H";
}

void wait(){
    cout << "Aperte [ENTER] para voltar ao menu inicial . . ." << endl;
                
    cin.ignore(numeric_limits<streamsize>::max(),'\n');
    cin.get();

    clear_screen();
}

void recover_data(vector<person> &data){
    int count;

    fstream file;
    file.open("database.txt");
    
    if(!file.is_open()){
        cout << "Não foi possível ler os dados da memória" << endl;
        exit(-1);
    }

    file >> count;

    for(int i = 0; i < count; i++){
        person tmp;
        int n_cars;
        car ctmp;

        file >> tmp.name >> tmp.cpf >> tmp.rg >> tmp.cnh;
        file >> tmp.day >> tmp.month >> tmp.year;
        file >> tmp.mom >> tmp.dad;

        file >> n_cars;

        for (int j = 0; j < n_cars; j++)
        {
            file >> ctmp.model >> ctmp.brand >> ctmp.color >> ctmp.category >> ctmp.fuel;
            file >> ctmp.chassi >> ctmp.renavam;
            file >> ctmp.plate >> ctmp.year;

            tmp.cars.push_back(ctmp);
        }
        
        data.push_back(tmp);
    }

    file.close();
}

void save_data(vector<person> data){
    ofstream new_file;
    new_file.open("database.txt");

    if(!new_file.is_open()){
        cout << "Não foi possível salvar os dados no banco!" << endl;
        exit(-1);
    }
        
    new_file << data.size() << "\n\n";

    for(int i = 0; i < data.size(); i++){
        new_file << data[i].name << " " << data[i].cpf << " " << data[i].rg << " " << data[i].cnh << endl;
        new_file << data[i].day << " " << data[i].month << " " << data[i].year << endl;;
        new_file << data[i].mom << " " << data[i].dad << endl;

        new_file << data[i].cars.size() << endl;

        for (int j = 0; j < data[i].cars.size(); j++)
        {
            new_file << data[i].cars[j].model << " " << data[i].cars[j].brand << " " << data[i].cars[j].color << " " << data[i].cars[j].category << " " << data[i].cars[j].fuel << endl;
            new_file << data[i].cars[j].chassi << " " << data[i].cars[j].renavam << endl;
            new_file << data[i].cars[j].plate << " " << data[i].cars[j].year << endl;
        }
        
        new_file << '\n';
    }

    new_file.close();
}

void show_header(){
    cout << "###################################### SISTEMA DE CADASTRO DE CARROS ######################################" << endl;
    cout << "\n\n\n";
    cout << "Digite a opção desejada e pressione [ENTER]: \n" << endl;
    cout << "1) Cadastrar Novo Condutor\n2) Cadastrar Novo Carro\n3) Exibir Dados\n4) Encerrar sistema\n\n\n\n";
}

void add_conductor(vector<person> &data){
    person driver;

    clear_screen();
    
    cout << "************************************** REGISTRO DE CONDUTORES **************************************" << endl << endl;

    cout << "Nome: ";
    cin >> driver.name;

    cout << "\nCPF: ";
    cin >> driver.cpf;

    cout << "\nRG: ";
    cin >> driver.rg;

    cout << "\nCNH: ";
    cin >> driver.cnh;

    cout << "\nData de Nascimento(DD/MM/AAAA): ";
    scanf("%d/%d/%d", &driver.day, &driver.month, &driver.year);

    cout << "\nNome da Mãe: ";
    cin >> driver.mom;

    cout << "\nNome do Pai: ";
    cin >> driver.dad;

    cout << endl;

    data.push_back(driver);

    cout << "\nCondutor cadastrado com sucesso\n\n" << endl;

    wait();
}

void add_car(vector<person> &data){
    string query;
    int pos = -1;
    car carro;

    clear_screen();
    
    cout << "************************************** REGISTRO DE VEÍCULOS **************************************" << endl << endl;

    cout << "Digite o CPF do proprietário: ";
    cin >> query;

    for (int i = 0; i < data.size(); i++)
        if(data[i].cpf == query)
            pos = i;

    if(pos == -1){
        cout << "\n\nNão foi possível encontrar o condutor!\n\n" << endl;
        wait();
        return;
    }

    cout << "Modelo: ";
    cin >> carro.model;

    cout << "\nMarca: ";
    cin >> carro.brand;

    cout << "\nCor: ";
    cin >> carro.color;

    cout << "\nCategoria: ";
    cin >> carro.category;

    cout << "\nCombustível: ";
    cin >> carro.fuel;

    cout << "\nCHASSI: ";
    cin >> carro.chassi;

    cout << "\nRENAVAM: ";
    cin >> carro.renavam;

    cout << "\nPlaca: ";
    cin >> carro.plate;

    cout << "\nAno: ";
    cin >> carro.year;

    cout << endl;

    data[pos].cars.push_back(carro);

    cout << "\nCarro cadastrado com sucesso\n\n" << endl;

    wait();
}

void show_data(vector<person> data){
    clear_screen();

    cout << "************************************** REGISTROS **************************************" << endl << endl;

    for(int i = 0; i < data.size(); i++){

        cout << "Nome: ";
        cout << data[i].name;

        cout << "\nCPF: ";
        cout << data[i].cpf;

        cout << "\nRG: ";
        cout << data[i].rg;

        cout << "\nCNH: ";
        cout << data[i].cnh;

        cout << "\nData de Nascimento(DD/MM/AAAA): ";
        printf("%d/%d/%d", data[i].day, data[i].month, data[i].year);

        cout << "\nNome da Mãe: ";
        cout << data[i].mom;

        cout << "\nNome do Pai: ";
        cout << data[i].dad;

        cout << "\nCARRO(S):";

        for (int j = 0; j < data[i].cars.size(); j++)
        {
            cout << "\n   Modelo: ";
            cout << data[i].cars[j].model;

            cout << "\n   Marca: ";
            cout << data[i].cars[j].brand;

            cout << "\n   Cor: ";
            cout << data[i].cars[j].color;

            cout << "\n   Categoria: ";
            cout << data[i].cars[j].category;

            cout << "\n   Combustível: ";
            cout << data[i].cars[j].fuel;

            cout << "\n   CHASSI: ";
            cout << data[i].cars[j].chassi;

            cout << "\n   RENAVAM: ";
            cout << data[i].cars[j].renavam;

            cout << "\n   Placa: ";
            cout << data[i].cars[j].plate;

            cout << "\n   Ano: ";
            cout << data[i].cars[j].year;

            cout <<  (j+1 == data[i].cars.size() ? "\n\n" : "\n   ------------------------------------------------------------" );
        }
    }

    wait();
}

int main(int argc, char const *argv[])
{
    vector<person> people;
    int count, option;

    recover_data(people);

    clear_screen();

    while(1){
        show_header();        

        cin >> option;

        if (option >= 4)
            break;

        switch(option){
            case 1:
                add_conductor(people);
                break;

            case 2:
                add_car(people);
                break;

            default:
                show_data(people);
                break;       
        }
    }

    clear_screen();

    save_data(people);

    return 0;
}