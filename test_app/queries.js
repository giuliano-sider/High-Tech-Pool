
// list of  all the sql queries we need
module.exports = [

    dados_admin_login_attempt:
        (username, password) => 
            'select p.*, ca.username, ca.password' +
            'from Pessoa as p ' +
            '     join Credenciais_Acesso as ca' +
            '          on p.id = ca.id' +
            '     join Gerente as g' +
            '          on g.id = p.id ' +
            'where ca.username = ' + "'" + username + "'" +
            '  and ca.password = ' + "'" + password + "'",

    estado_raia:
        (id_piscina, numero_raia) =>
            'select '

    cabecalho_tipo_treinamento:
        () => 
            'select * from Tipo_Treinamento;',

    sequencia_exercicios_em_tipo_treinamento:
        (id_tipo_treinamento) => 
            'select te.*, st.numero_de_sequencia' +
            'from Tipo_Exercicio as te' +
            '     join Sequencia_Treinamento as st' +
            '          on te.id = st.id_tipo_exercicio' +
            '     join Tipo_Treinamento as tt' +
            '          on tt.id = st.id_tipo_treinamento' +
            'where tt.id = ' + id_tipo_treinamento + ' ' +
            'order by st.numero_de_sequencia;',


];



// retorna uma lista (JSON) de treinamentos disponiveis do BD High Tech Pool
app.get('./treinamentos_disponiveis', (req, res) => {
// PYRAMID OF DOOM. FIX??
    connection.connect(function(err) {
        if (err) throw err;
        connection.query(
            queries['cabecalho_tipo_treinamento'](),
            (err, treinamentos) => {
                if (err) throw err;
                for (var i = 0; i < treinamentos.length; i++) {
                    treinamentos[i].exercicios = [];
                    connection.query(
                        queries['sequencia_exercicios_em_tipo_treinamento'](treinamento.id),
                        (err, exercicios) => {
                            if (err) throw err;
                            treinamentos[i].exercicios = exercicios;
                        }
                    );
                }
                // tem que retornar o json dessa estrutura agora
            }
        );
    });
});