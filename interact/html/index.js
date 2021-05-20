$(function(){
    function display(bool){
        if(bool){
            $("#container").show()
        }
        else{
            $('#container').hide()
        }
    }

    display(false)

    window.addEventListener('message', (event)=>{
        var item = event.data
        if(item.type === 'ui'){
            if(item.status == true){
                display(true)
            }
            else{
                display(false)
            }
        }
    })

    document.onkeyup = function(data){
        if(data.which == 27){
            $.post("http://interact/exit", JSON.stringify({}))
        }
    }


    $("#close").click(()=>{
        $.post('http://interact/exit', JSON.stringify({}))
    })

    $("#submit").click(()=>{
        let inputValue = $("#input").val()
        $.post('http://interact/main', JSON.stringify({
            text: inputValue
        }))
    })
})