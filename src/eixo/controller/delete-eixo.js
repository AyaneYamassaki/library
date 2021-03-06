$(document).ready(function() {

    $('#eixo').on('click', 'button.btn-delete', function(e) {

        e.preventDefault()

        let IDEIXO = `IDEIXO=${$(this).attr('id')}`

        Swal.fire({
            title: 'Library',
            text: 'Deseja realmente excluir esse registro?',
            icon: 'question',
            showCancelButton: true,
            confirmButton: 'Sim',
            cancelButton: 'Não'
        }).then((result => {
            if (result.value) {

                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    assync: true,
                    data: IDEIXO,
                    url: 'src/eixo/model/delete-eixo.php',
                    success: function(dados) {
                        Swal.fire({
                            title: 'Library',
                            text: dados.mensagem,
                            icon: dados.tipo,
                            confirmButtonText: 'OK'
                        })

                        $('#eixo').DataTable().ajax.reload()
                    }
                })
            }
        }))

    })
})