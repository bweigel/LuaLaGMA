function send_to_midi(col, row)
    local offset = 48
    
    local commands = {["lamp_on"] = 1, ["lamp_off"] = 0, ["lamb_blink"] = 2}
    
    local execute_command = "Midicontrol " .. col .. "." .. (row + offset)  
    gma.cmd(execute_command .. commands["lamp_on"]) -- Midicontrol channel.controller value
    gma.sleep(0.2)
    gma.cmd(execute_command .. commands["lamp_off"])
    
    return "Switching " .. execute_command
end

function loop_matrix(n_col, n_row) 
    for col = 0, n_col-1 do
        for row = 0, n_row-1 do
            print(send_to_midi(col, row))
            -- print("["  .. col .. "," .. row .. "]")
        end
    end
end

function init() 
    print("Looping ... ")
    local n = 10
    for i = 0, 10 do
        loop_matrix(2,4)
    end
end

function exit () 
end

init()

return init, exit



