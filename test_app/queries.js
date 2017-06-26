
// list of  all the sql queries we need
queries = [
    cabecalho_tipo_treinamento:
        () => 'select * from Tipo_Treinamento;',

    sequencia_exercicios_em_tipo_treinamento:
        (id_tipo_treinamento) => 'select te.*' +
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