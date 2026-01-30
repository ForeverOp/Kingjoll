function useEditorScript(){
    const text = document.getElementById("scriptEditor").value.trim()

    if(!text){
        alert("Editor vazio")
        return
    }

    currentScript = text

    show("loadstring")
    updateLoadstring()
}