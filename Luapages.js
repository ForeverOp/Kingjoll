// ==========================
// Arquivo: luaPages.js
// Banco de páginas Lua digitáveis
// ==========================

const luaPages = {
    "init.lua1": `-- Página 1 de exemplo
print("Olá, Lua 1!")`,

    "init.lua2": `-- Página 2 de exemplo
print("Olá, Lua 2!")`,

    "init.lua3": `-- Página 3 de exemplo
print("Olá, Lua 3!")`
};

// Função para acessar a página Lua digitável
function getLuaPage(url){
    // url termina com init.luaX
    const pageName = url.split("/").pop();
    if(luaPages[pageName]){
        return luaPages[pageName];
    } else {
        console.warn(`Página ${pageName} não encontrada!`);
        return "";
    }
}

// Exemplo de uso:
// loadstring(getLuaPage("https://raw.githubusercontent.com/ForeverOp/Kingjoll/main/init.lua2"))()
