local Logger = {}

function Logger.info(msg)
    print("[VOX]", msg)
end

function Logger.warn(msg)
    warn("[VOX]", msg)
end

function Logger.error(msg)
    warn("[VOX ERROR]", msg)
    getgenv().VoxFlags.ErrorCount += 1
end

return Logger