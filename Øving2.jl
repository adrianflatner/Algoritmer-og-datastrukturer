function traversemax(record)
    max = record.value
    while (record.next != nothing)
        if(max < record.next.value)
            max = record.next.value
        end
        record = record.next
    end
    return max
end
