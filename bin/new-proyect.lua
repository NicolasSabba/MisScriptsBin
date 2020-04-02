#!/usr/bin/env lua

local phat = '~/Templates'

local function help()
    print([[
    
    🤓 Help 🤓

        New proyect crea nuevos proyectos con una linea sola.
        Opciones:
            -h : Imprime esta ayuda 🤓
        Templates:
            -love     : Nuevo proyecto de tipo love2d
            -lua      : Nuevo script de tipo lua
            -p5js     : Nuevo proyecto de tipo p5js
            -bash     : Nuevo script de tipo bash
            -sh       : Nuevo script de tipo sh
            -sveltejs : Nuevo proyecto de tipo sveltejs
            -angular  : Nuevo proyecto de angular
            -stack    : Nuevo proyecto de stack/haskell
            -rust     : Nuevo proyecto de rust
	Argumentos:
            [Opciones | Template]: Opcion de template
            Nombre: Nombre del pryecto.
    ]])
end
-- Chequeo que el directorio no existe
local function check(path)
    local ok, err, code = os.rename(path, path)
    return (ok or (code == 13))
end

-- Chequeo la cantidad de argumentos
if #arg < 1 then help(); print('Sin argumentos 😢'); return 1 end
-- Si piden ayuda
if arg[1] == '-h' then help(); return 0 end
-- Si no pidieron ayuda y no dieron aggumentos suficientes
if #arg == 1 then help(); print('Faltan argumentos 🤕');    return 2 end
-- Si se pasaron de mambo
if #arg > 2 then help(); print('Demaciados argumentos 😤'); return 3 end
-- Si ya existe el directorio
if check(arg[2]) then print('El directorio ya existe 😓');  return 4 end

-- Creo un nuevo template
if arg[1] == '-love' then
    os.execute('cp -rv ' .. phat .. '/love ./' .. arg[2])
elseif arg[1] == '-lua' then
    os.execute('cp -v ' .. phat .. '/lua ./' .. arg[2] .. '.lua')
elseif arg[1] == '-p5js' then 
    os.execute('cp -rv ' .. phat .. '/p5js ./' .. arg[2])
elseif arg[1] == '-bash' then
    os.execute('cp -v ' .. phat .. '/bash ./' .. arg[2] .. '.sh')
elseif arg[1] == '-sh' then
    os.execute('cp -v ' .. phat .. '/sh ./' .. arg[2] .. '.sh')
elseif arg[1] == '-sveltejs' then
    os.execute('npx degit sveltejs/template ./' .. arg[2])
elseif arg[1] == '-angular' then
    os.execute('ng new ' .. arg[2])
elseif arg[1] == '-stack' then
    os.execute('stack new ' .. arg[2])
elseif arg[1] == '-rust' then
    os.execute('cargo new ' .. arg[2])
else help(); print('El template '.. arg[1] ..' no existe'); return 5 end

print('El proyecto ' .. arg[2] .. ' fue creado 👼')
return 0

