#include <bits/stdc++.h>

using namespace std;

struct carro {
    string modelo;
    string marca;
    string renavam;
    string cor;
    string cpf_id;

    bool operator<(const carro& item) const
    {
        return cpf_id < item.cpf_id;
    }

} typedef carro;

struct proprietario{
    string nome;
    string cpf;
    int dia, mes, ano;

    bool operator<(const proprietario& item) const
    {
        if (cpf == item.cpf)
            return nome < item.nome;

        return cpf < item.cpf;
    }

    bool operator==(const proprietario& item) const
    {
        return cpf == item.cpf;
    }

} typedef proprietario;

void clear_screen(){
    cout << "\033[2J\033[1;1H";
}

void wait(){
    cout << "Aperte [ENTER] para voltar ao menu inicial . . ." << endl;
                
    cin.ignore(numeric_limits<streamsize>::max(),'\n');
    cin.get();

    clear_screen();
}

void abre(vector<proprietario> &condutores, vector<carro> &carros){

    ifstream file;
    file.open("condutores.txt");
    
    if(file.is_open()){
    string aux;

        while(file >> aux){
            proprietario tmp;

            tmp.nome = aux;

            file >> tmp.cpf;
            file >> tmp.dia >> tmp.mes >> tmp.ano;

            condutores.push_back(tmp);
        
        }
    }

    file.close();

    file.open("carros.txt");
    
    if(file.is_open()){
        string aux;

        while(file >> aux){
            carro tmp;
            
            tmp.modelo = aux;

            file >> tmp.marca >> tmp.cor;
            file >> tmp.renavam >> tmp.cpf_id;
            
            carros.push_back(tmp);
        }
    }

    file.close();
}

void save_data(vector<proprietario> condutores, vector<carro> carros){

    ofstream new_file;
    new_file.open("condutores.txt");

    for(const auto tmp : condutores)
        new_file << tmp.nome << " " << tmp.cpf << " " << tmp.dia << " " << tmp.mes << " " << tmp.ano << endl;

    new_file.close();

    new_file.open("carros.txt");

    for(const auto tmp : carros)
        new_file << tmp.modelo << " " << tmp.marca << " " << tmp.cor << " " << tmp.renavam << " " << tmp.cpf_id << endl;

    clear_screen();
    cout << "Dados salvos nos arquivos com sucesso!\n";

    new_file.close();
}

void show_header(){
    cout << "###################################### SISTEMA DE CADASTRO DE CARROS ######################################" << endl;
    cout << "\n\n\n";
    cout << "Digite a opção desejada e pressione [ENTER]: \n" << endl;
    cout << "1) Cadastrar Novo Condutor\n2) Cadastrar Novo Carro\n3) Exibir Dados\n4) Encerrar sistema\n\n\n\n";
}

void add_conductor(vector<proprietario> &data){
    proprietario driver;

    clear_screen();
    
    cout << "************************************** REGISTRO DE CONDUTORES **************************************" << endl << endl;

    cout << "Nome: ";
    cin >> driver.nome;

    cout << "\nCPF: ";
    cin >> driver.cpf;

    cout << "\nData de Nascimento(DD/MM/AAAA): ";
    scanf("%d/%d/%d", &driver.dia, &driver.mes, &driver.ano);

    cout << endl;

    data.push_back(driver);

    cout << "\nCondutor cadastrado com sucesso!\n\n" << endl;

    wait();
}

void add_car(vector<proprietario> condutores, vector<carro> &carros){


    bool flag = false;
    string query;
    carro tmp;

    clear_screen();
    
    cout << "************************************** REGISTRO DE VEÍCULOS **************************************" << endl << endl;

    cout << "Digite o CPF do proprietário: ";
    cin >> query;

    for (const auto pessoa : condutores)
        if(pessoa.cpf == query){
            flag = true;
            break;
        }

    if(!flag){
        cout << "\n\nNão foi possível encontrar o condutor!" << endl;
        cout << "\nÉ necessário que o condutor já esteja cadastrado no sistema!\n\n" << endl;

        wait();
        
        return;
    }
    cout << "\n";

    cout << "Modelo: ";
    cin >> tmp.modelo;

    cout << "\nMarca: ";
    cin >> tmp.marca;

    cout << "\nCor: ";
    cin >> tmp.cor;

    cout << "\nRENAVAM: ";
    cin >> tmp.renavam;

    tmp.cpf_id = query;

    cout << endl;

    carros.push_back(tmp);

    cout << "\nCarro cadastrado com sucesso\n\n" << endl;

    wait();
}

void show_data(vector<proprietario> condutores, vector<carro> carros){
    string cpf = "-1";

    clear_screen();

    sort(carros.begin(), carros.end());

    cout << "************************************** REGISTROS **************************************\n" << endl;

    for(const auto carro : carros){
        if(cpf != carro.cpf_id){
            
            for(const auto pessoa : condutores){
                if(pessoa.cpf == carro.cpf_id){
                    cpf = carro.cpf_id;

                    if(cpf != "-1")
                        cout << "\n\n" << endl;
                    
                    cout << "Nome: ";
                    cout << pessoa.nome;

                    cout << "\nCPF: ";
                    cout << pessoa.cpf;

                    cout << "\nData de Nascimento(DD/MM/AAAA): ";
                    printf("%d/%d/%d", pessoa.dia, pessoa.mes, pessoa.ano);

                    cout << "\nCARRO(S):";
                }
            }
        }

            if(cpf != "-1"){
                cout << "\n   Modelo: ";
                cout << carro.modelo;

                cout << "\n   Marca: ";
                cout << carro.marca;

                cout << "\n   Cor: ";
                cout << carro.cor;

                cout << "\n   RENAVAM: ";
                cout << carro.renavam;

                cout << endl;
            }
    }

    cout << "\n";
    wait();
}

int main(int argc, char const *argv[])
{
    vector<proprietario> motoristas;
    vector<carro> automoveis;
    int count, option;

    abre(motoristas, automoveis);
    clear_screen();

    while(1){
        show_header();        

        cin >> option;

        if (option >= 4)
            break;

        switch(option){
            case 1:
                add_conductor(motoristas);
                break;

            case 2:
                add_car(motoristas, automoveis);
                break;

            default:
                show_data(motoristas, automoveis);
                break;       
        }
    }

    clear_screen();

    save_data(motoristas, automoveis);

    return 0;
}