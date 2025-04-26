--- Gather the command line arguments to ensure they are accessible later
--- This is necessary because the rest of the program is inside of transpiled functions and therefore `{...}`
--- would not return command line arguments when used elsewhere
COMMAND_LINE_ARGUMENTS = {...}

--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        local value = nil
        if (select("#", ...) > 0) then value = module(...) else value = module(file) end
        ____moduleCache[file] = { value = value }
        return value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__ArrayAt(self, relativeIndex)
    local absoluteIndex = relativeIndex < 0 and #self + relativeIndex or relativeIndex
    if absoluteIndex >= 0 and absoluteIndex < #self then
        return self[absoluteIndex + 1]
    end
    return nil
end

local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value) == nil)
end

local function __TS__ArrayConcat(self, ...)
    local items = {...}
    local result = {}
    local len = 0
    for i = 1, #self do
        len = len + 1
        result[len] = self[i]
    end
    for i = 1, #items do
        local item = items[i]
        if __TS__ArrayIsArray(item) then
            for j = 1, #item do
                len = len + 1
                result[len] = item[j]
            end
        else
            len = len + 1
            result[len] = item
        end
    end
    return result
end

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        asyncDispose = __TS__Symbol("Symbol.asyncDispose"),
        dispose = __TS__Symbol("Symbol.dispose"),
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

local function __TS__ArrayEvery(self, callbackfn, thisArg)
    for i = 1, #self do
        if not callbackfn(thisArg, self[i], i - 1, self) then
            return false
        end
    end
    return true
end

local function __TS__ArrayFill(self, value, start, ____end)
    local relativeStart = start or 0
    local relativeEnd = ____end or #self
    if relativeStart < 0 then
        relativeStart = relativeStart + #self
    end
    if relativeEnd < 0 then
        relativeEnd = relativeEnd + #self
    end
    do
        local i = relativeStart
        while i < relativeEnd do
            self[i + 1] = value
            i = i + 1
        end
    end
    return self
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local function __TS__ArrayFind(self, predicate, thisArg)
    for i = 1, #self do
        local elem = self[i]
        if predicate(thisArg, elem, i - 1, self) then
            return elem
        end
    end
    return nil
end

local function __TS__ArrayFindIndex(self, callbackFn, thisArg)
    for i = 1, #self do
        if callbackFn(thisArg, self[i], i - 1, self) then
            return i - 1
        end
    end
    return -1
end

local __TS__Iterator
do
    local function iteratorGeneratorStep(self)
        local co = self.____coroutine
        local status, value = coroutine.resume(co)
        if not status then
            error(value, 0)
        end
        if coroutine.status(co) == "dead" then
            return
        end
        return true, value
    end
    local function iteratorIteratorStep(self)
        local result = self:next()
        if result.done then
            return
        end
        return true, result.value
    end
    local function iteratorStringStep(self, index)
        index = index + 1
        if index > #self then
            return
        end
        return index, string.sub(self, index, index)
    end
    function __TS__Iterator(iterable)
        if type(iterable) == "string" then
            return iteratorStringStep, iterable, 0
        elseif iterable.____coroutine ~= nil then
            return iteratorGeneratorStep, iterable
        elseif iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return iteratorIteratorStep, iterator
        else
            return ipairs(iterable)
        end
    end
end

local __TS__ArrayFrom
do
    local function arrayLikeStep(self, index)
        index = index + 1
        if index > self.length then
            return
        end
        return index, self[index]
    end
    local function arrayLikeIterator(arr)
        if type(arr.length) == "number" then
            return arrayLikeStep, arr, 0
        end
        return __TS__Iterator(arr)
    end
    function __TS__ArrayFrom(arrayLike, mapFn, thisArg)
        local result = {}
        if mapFn == nil then
            for ____, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = v
            end
        else
            local i = 0
            for ____, v in arrayLikeIterator(arrayLike) do
                local ____mapFn_3 = mapFn
                local ____thisArg_1 = thisArg
                local ____v_2 = v
                local ____i_0 = i
                i = ____i_0 + 1
                result[#result + 1] = ____mapFn_3(____thisArg_1, ____v_2, ____i_0)
            end
        end
        return result
    end
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k + 1, len do
        if self[i] == searchElement then
            return true
        end
    end
    return false
end

local function __TS__ArrayIndexOf(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    if len == 0 then
        return -1
    end
    if fromIndex >= len then
        return -1
    end
    if fromIndex < 0 then
        fromIndex = len + fromIndex
        if fromIndex < 0 then
            fromIndex = 0
        end
    end
    for i = fromIndex + 1, len do
        if self[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

local function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local parts = {}
    for i = 1, #self do
        parts[i] = tostring(self[i])
    end
    return table.concat(parts, separator)
end

local function __TS__ArrayMap(self, callbackfn, thisArg)
    local result = {}
    for i = 1, #self do
        result[i] = callbackfn(thisArg, self[i], i - 1, self)
    end
    return result
end

local function __TS__ArrayPush(self, ...)
    local items = {...}
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__ArrayPushArray(self, items)
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__ArrayReduce(self, callbackFn, ...)
    local len = #self
    local k = 0
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, len do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReduceRight(self, callbackFn, ...)
    local len = #self
    local k = len - 1
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, 1, -1 do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReverse(self)
    local i = 1
    local j = #self
    while i < j do
        local temp = self[j]
        self[j] = self[i]
        self[i] = temp
        i = i + 1
        j = j - 1
    end
    return self
end

local function __TS__ArrayUnshift(self, ...)
    local items = {...}
    local numItemsToInsert = #items
    if numItemsToInsert == 0 then
        return #self
    end
    for i = #self, 1, -1 do
        self[i + numItemsToInsert] = self[i]
    end
    for i = 1, numItemsToInsert do
        self[i] = items[i]
    end
    return #self
end

local function __TS__ArraySort(self, compareFn)
    if compareFn ~= nil then
        table.sort(
            self,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(self)
    end
    return self
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    first = first or 0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    last = last or len
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local function __TS__ArraySome(self, callbackfn, thisArg)
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            return true
        end
    end
    return false
end

local function __TS__ArraySplice(self, ...)
    local args = {...}
    local len = #self
    local actualArgumentCount = __TS__CountVarargs(...)
    local start = args[1]
    local deleteCount = args[2]
    if start < 0 then
        start = len + start
        if start < 0 then
            start = 0
        end
    elseif start > len then
        start = len
    end
    local itemCount = actualArgumentCount - 2
    if itemCount < 0 then
        itemCount = 0
    end
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - start
    else
        actualDeleteCount = deleteCount or 0
        if actualDeleteCount < 0 then
            actualDeleteCount = 0
        end
        if actualDeleteCount > len - start then
            actualDeleteCount = len - start
        end
    end
    local out = {}
    for k = 1, actualDeleteCount do
        local from = start + k
        if self[from] ~= nil then
            out[k] = self[from]
        end
    end
    if itemCount < actualDeleteCount then
        for k = start + 1, len - actualDeleteCount do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
        for k = len - actualDeleteCount + itemCount + 1, len do
            self[k] = nil
        end
    elseif itemCount > actualDeleteCount then
        for k = len - actualDeleteCount, start + 1, -1 do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
    end
    local j = start + 1
    for i = 3, actualArgumentCount do
        self[j] = args[i]
        j = j + 1
    end
    for k = #self, len - actualDeleteCount + itemCount + 1, -1 do
        self[k] = nil
    end
    return out
end

local function __TS__ArrayToObject(self)
    local object = {}
    for i = 1, #self do
        object[i - 1] = self[i]
    end
    return object
end

local function __TS__ArrayFlat(self, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = self[i]
        if depth > 0 and __TS__ArrayIsArray(value) then
            local toAdd
            if depth == 1 then
                toAdd = value
            else
                toAdd = __TS__ArrayFlat(value, depth - 1)
            end
            for j = 1, #toAdd do
                local val = toAdd[j]
                len = len + 1
                result[len] = val
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArrayFlatMap(self, callback, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = callback(thisArg, self[i], i - 1, self)
        if __TS__ArrayIsArray(value) then
            for j = 1, #value do
                len = len + 1
                result[len] = value[j]
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArraySetLength(self, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    for i = length + 1, #self do
        self[i] = nil
    end
    return length
end

local __TS__Unpack = table.unpack or unpack

local function __TS__ArrayToReversed(self)
    local copy = {__TS__Unpack(self)}
    __TS__ArrayReverse(copy)
    return copy
end

local function __TS__ArrayToSorted(self, compareFn)
    local copy = {__TS__Unpack(self)}
    __TS__ArraySort(copy, compareFn)
    return copy
end

local function __TS__ArrayToSpliced(self, start, deleteCount, ...)
    local copy = {__TS__Unpack(self)}
    __TS__ArraySplice(copy, start, deleteCount, ...)
    return copy
end

local function __TS__ArrayWith(self, index, value)
    local copy = {__TS__Unpack(self)}
    copy[index + 1] = value
    return copy
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local __TS__Promise
do
    local function makeDeferredPromiseFactory()
        local resolve
        local reject
        local function executor(____, res, rej)
            resolve = res
            reject = rej
        end
        return function()
            local promise = __TS__New(__TS__Promise, executor)
            return promise, resolve, reject
        end
    end
    local makeDeferredPromise = makeDeferredPromiseFactory()
    local function isPromiseLike(value)
        return __TS__InstanceOf(value, __TS__Promise)
    end
    local function doNothing(self)
    end
    local ____pcall = _G.pcall
    __TS__Promise = __TS__Class()
    __TS__Promise.name = "__TS__Promise"
    function __TS__Promise.prototype.____constructor(self, executor)
        self.state = 0
        self.fulfilledCallbacks = {}
        self.rejectedCallbacks = {}
        self.finallyCallbacks = {}
        local success, ____error = ____pcall(
            executor,
            nil,
            function(____, v) return self:resolve(v) end,
            function(____, err) return self:reject(err) end
        )
        if not success then
            self:reject(____error)
        end
    end
    function __TS__Promise.resolve(value)
        if __TS__InstanceOf(value, __TS__Promise) then
            return value
        end
        local promise = __TS__New(__TS__Promise, doNothing)
        promise.state = 1
        promise.value = value
        return promise
    end
    function __TS__Promise.reject(reason)
        local promise = __TS__New(__TS__Promise, doNothing)
        promise.state = 2
        promise.rejectionReason = reason
        return promise
    end
    __TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
        local promise, resolve, reject = makeDeferredPromise()
        self:addCallbacks(
            onFulfilled and self:createPromiseResolvingCallback(onFulfilled, resolve, reject) or resolve,
            onRejected and self:createPromiseResolvingCallback(onRejected, resolve, reject) or reject
        )
        return promise
    end
    function __TS__Promise.prototype.addCallbacks(self, fulfilledCallback, rejectedCallback)
        if self.state == 1 then
            return fulfilledCallback(nil, self.value)
        end
        if self.state == 2 then
            return rejectedCallback(nil, self.rejectionReason)
        end
        local ____self_fulfilledCallbacks_0 = self.fulfilledCallbacks
        ____self_fulfilledCallbacks_0[#____self_fulfilledCallbacks_0 + 1] = fulfilledCallback
        local ____self_rejectedCallbacks_1 = self.rejectedCallbacks
        ____self_rejectedCallbacks_1[#____self_rejectedCallbacks_1 + 1] = rejectedCallback
    end
    function __TS__Promise.prototype.catch(self, onRejected)
        return self["then"](self, nil, onRejected)
    end
    function __TS__Promise.prototype.finally(self, onFinally)
        if onFinally then
            local ____self_finallyCallbacks_2 = self.finallyCallbacks
            ____self_finallyCallbacks_2[#____self_finallyCallbacks_2 + 1] = onFinally
            if self.state ~= 0 then
                onFinally(nil)
            end
        end
        return self
    end
    function __TS__Promise.prototype.resolve(self, value)
        if isPromiseLike(value) then
            return value:addCallbacks(
                function(____, v) return self:resolve(v) end,
                function(____, err) return self:reject(err) end
            )
        end
        if self.state == 0 then
            self.state = 1
            self.value = value
            return self:invokeCallbacks(self.fulfilledCallbacks, value)
        end
    end
    function __TS__Promise.prototype.reject(self, reason)
        if self.state == 0 then
            self.state = 2
            self.rejectionReason = reason
            return self:invokeCallbacks(self.rejectedCallbacks, reason)
        end
    end
    function __TS__Promise.prototype.invokeCallbacks(self, callbacks, value)
        local callbacksLength = #callbacks
        local finallyCallbacks = self.finallyCallbacks
        local finallyCallbacksLength = #finallyCallbacks
        if callbacksLength ~= 0 then
            for i = 1, callbacksLength - 1 do
                callbacks[i](callbacks, value)
            end
            if finallyCallbacksLength == 0 then
                return callbacks[callbacksLength](callbacks, value)
            end
            callbacks[callbacksLength](callbacks, value)
        end
        if finallyCallbacksLength ~= 0 then
            for i = 1, finallyCallbacksLength - 1 do
                finallyCallbacks[i](finallyCallbacks)
            end
            return finallyCallbacks[finallyCallbacksLength](finallyCallbacks)
        end
    end
    function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
        return function(____, value)
            local success, resultOrError = ____pcall(f, nil, value)
            if not success then
                return reject(nil, resultOrError)
            end
            return self:handleCallbackValue(resultOrError, resolve, reject)
        end
    end
    function __TS__Promise.prototype.handleCallbackValue(self, value, resolve, reject)
        if isPromiseLike(value) then
            local nextpromise = value
            if nextpromise.state == 1 then
                return resolve(nil, nextpromise.value)
            elseif nextpromise.state == 2 then
                return reject(nil, nextpromise.rejectionReason)
            else
                return nextpromise:addCallbacks(resolve, reject)
            end
        else
            return resolve(nil, value)
        end
    end
end

local __TS__AsyncAwaiter, __TS__Await
do
    local ____coroutine = _G.coroutine or ({})
    local cocreate = ____coroutine.create
    local coresume = ____coroutine.resume
    local costatus = ____coroutine.status
    local coyield = ____coroutine.yield
    function __TS__AsyncAwaiter(generator)
        return __TS__New(
            __TS__Promise,
            function(____, resolve, reject)
                local fulfilled, step, resolved, asyncCoroutine
                function fulfilled(self, value)
                    local success, resultOrError = coresume(asyncCoroutine, value)
                    if success then
                        return step(resultOrError)
                    end
                    return reject(nil, resultOrError)
                end
                function step(result)
                    if resolved then
                        return
                    end
                    if costatus(asyncCoroutine) == "dead" then
                        return resolve(nil, result)
                    end
                    return __TS__Promise.resolve(result):addCallbacks(fulfilled, reject)
                end
                resolved = false
                asyncCoroutine = cocreate(generator)
                local success, resultOrError = coresume(
                    asyncCoroutine,
                    function(____, v)
                        resolved = true
                        return __TS__Promise.resolve(v):addCallbacks(resolve, reject)
                    end
                )
                if success then
                    return step(resultOrError)
                else
                    return reject(nil, resultOrError)
                end
            end
        )
    end
    function __TS__Await(thing)
        return coyield(thing)
    end
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local function __TS__CloneDescriptor(____bindingPattern0)
    local value
    local writable
    local set
    local get
    local configurable
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    configurable = ____bindingPattern0.configurable
    get = ____bindingPattern0.get
    set = ____bindingPattern0.set
    writable = ____bindingPattern0.writable
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = get ~= nil or set ~= nil
    local hasValueOrWritableAttribute = writable ~= nil or value ~= nil
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

local function __TS__Decorate(self, originalValue, decorators, context)
    local result = originalValue
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator ~= nil then
                local ____decorator_result_0 = decorator(self, result, context)
                if ____decorator_result_0 == nil then
                    ____decorator_result_0 = result
                end
                result = ____decorator_result_0
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end

local function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

local __TS__DescriptorGet
do
    local getmetatable = _G.getmetatable
    local ____rawget = _G.rawget
    function __TS__DescriptorGet(self, metatable, key)
        while metatable do
            local rawResult = ____rawget(metatable, key)
            if rawResult ~= nil then
                return rawResult
            end
            local descriptors = ____rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor ~= nil then
                    if descriptor.get then
                        return descriptor.get(self)
                    end
                    return descriptor.value
                end
            end
            metatable = getmetatable(metatable)
        end
    end
end

local __TS__DescriptorSet
do
    local getmetatable = _G.getmetatable
    local ____rawget = _G.rawget
    local rawset = _G.rawset
    function __TS__DescriptorSet(self, metatable, key, value)
        while metatable do
            local descriptors = ____rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor ~= nil then
                    if descriptor.set then
                        descriptor.set(self, value)
                    else
                        if descriptor.writable == false then
                            error(
                                ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                                0
                            )
                        end
                        descriptor.value = value
                    end
                    return
                end
            end
            metatable = getmetatable(metatable)
        end
        rawset(self, key, value)
    end
end

local __TS__SetDescriptor
do
    local getmetatable = _G.getmetatable
    local function descriptorIndex(self, key)
        return __TS__DescriptorGet(
            self,
            getmetatable(self),
            key
        )
    end
    local function descriptorNewIndex(self, key, value)
        return __TS__DescriptorSet(
            self,
            getmetatable(self),
            key,
            value
        )
    end
    function __TS__SetDescriptor(target, key, desc, isPrototype)
        if isPrototype == nil then
            isPrototype = false
        end
        local ____isPrototype_0
        if isPrototype then
            ____isPrototype_0 = target
        else
            ____isPrototype_0 = getmetatable(target)
        end
        local metatable = ____isPrototype_0
        if not metatable then
            metatable = {}
            setmetatable(target, metatable)
        end
        local value = rawget(target, key)
        if value ~= nil then
            rawset(target, key, nil)
        end
        if not rawget(metatable, "_descriptors") then
            metatable._descriptors = {}
        end
        metatable._descriptors[key] = __TS__CloneDescriptor(desc)
        metatable.__index = descriptorIndex
        metatable.__newindex = descriptorNewIndex
    end
end

local function __TS__DecorateLegacy(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator ~= nil then
                local oldResult = result
                if key == nil then
                    result = decorator(nil, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(nil, target, key, descriptor) or descriptor
                    local isSimpleValue = desc.configurable == true and desc.writable == true and not desc.get and not desc.set
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(nil, target, key, desc)
                else
                    result = decorator(nil, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(nil, target, key, paramIndex) end
end

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        if debug == nil then
            return nil
        end
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        elseif _VERSION == "Lua 5.1" then
            return string.sub(
                debug.traceback("", level),
                2
            )
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0")
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (description .. "\n") .. tostring(self.stack)
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_1 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, __TS__New)
        local metatable = getmetatable(self)
        if metatable and not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        return self.message ~= "" and (self.name .. ": ") .. self.message or self.name
    end
    Error = ____initErrorClass_1(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_3 = initErrorClass
        local ____class_2 = __TS__Class()
        ____class_2.name = ____class_2.name
        __TS__ClassExtends(____class_2, Error)
        function ____class_2.prototype.____constructor(self, ...)
            ____class_2.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_3(nil, ____class_2, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

local function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

local function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(__TS__StringAccess(iterable, index))
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

local function __TS__FunctionBind(fn, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        __TS__ArrayUnshift(
            args,
            __TS__Unpack(boundArgs)
        )
        return fn(__TS__Unpack(args))
    end
end

local __TS__Generator
do
    local function generatorIterator(self)
        return self
    end
    local function generatorNext(self, ...)
        local co = self.____coroutine
        if coroutine.status(co) == "dead" then
            return {done = true}
        end
        local status, value = coroutine.resume(co, ...)
        if not status then
            error(value, 0)
        end
        return {
            value = value,
            done = coroutine.status(co) == "dead"
        }
    end
    function __TS__Generator(fn)
        return function(...)
            local args = {...}
            local argsLength = __TS__CountVarargs(...)
            return {
                ____coroutine = coroutine.create(function() return fn(__TS__Unpack(args, 1, argsLength)) end),
                [Symbol.iterator] = generatorIterator,
                next = generatorNext
            }
        end
    end
end

local function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

local function __TS__LuaIteratorSpread(self, state, firstKey)
    local results = {}
    local key, value = self(state, firstKey)
    while key do
        results[#results + 1] = {key, value}
        key, value = self(state, key)
    end
    return __TS__Unpack(results)
end

local Map
do
    Map = __TS__Class()
    Map.name = "Map"
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            for ____, kvp in ipairs(array) do
                self:set(kvp[1], kvp[2])
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[key]
            local previous = self.previousKey[key]
            if next ~= nil and previous ~= nil then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next ~= nil then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous ~= nil then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[key] = nil
            self.previousKey[key] = nil
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return self.nextKey[key] ~= nil or self.lastKey == key
    end
    function Map.prototype.set(self, key, value)
        local isNewValue = not self:has(key)
        if isNewValue then
            self.size = self.size + 1
        end
        self.items[key] = value
        if self.firstKey == nil then
            self.firstKey = key
            self.lastKey = key
        elseif isNewValue then
            self.nextKey[self.lastKey] = key
            self.previousKey[key] = self.lastKey
            self.lastKey = key
        end
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, items[key]}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.values(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = items[key]}
                key = nextKey[key]
                return result
            end
        }
    end
    Map[Symbol.species] = Map
end

local function __TS__MapGroupBy(items, keySelector)
    local result = __TS__New(Map)
    local i = 0
    for ____, item in __TS__Iterator(items) do
        local key = keySelector(nil, item, i)
        if result:has(key) then
            local ____temp_0 = result:get(key)
            ____temp_0[#____temp_0 + 1] = item
        else
            result:set(key, {item})
        end
        i = i + 1
    end
    return result
end

local __TS__Match = string.match

local __TS__MathAtan2 = math.atan2 or math.atan

local __TS__MathModf = math.modf

local function __TS__NumberIsNaN(value)
    return value ~= value
end

local function __TS__MathSign(val)
    if __TS__NumberIsNaN(val) or val == 0 then
        return val
    end
    if val < 0 then
        return -1
    end
    return 1
end

local function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local function __TS__MathTrunc(val)
    if not __TS__NumberIsFinite(val) or val == 0 then
        return val
    end
    return val > 0 and math.floor(val) or math.ceil(val)
end

local function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return value and 1 or 0
    else
        return 0 / 0
    end
end

local function __TS__NumberIsInteger(value)
    return __TS__NumberIsFinite(value) and math.floor(value) == value
end

local function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = __TS__Match(numberString, "^%s*-?0[xX]")
            if hexMatch ~= nil then
                base = 16
                numberString = (__TS__Match(hexMatch, "-")) and "-" .. __TS__StringSubstring(numberString, #hexMatch) or __TS__StringSubstring(numberString, #hexMatch)
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local allowedDigits = base <= 10 and __TS__StringSubstring(parseIntBasePattern, 0, base) or __TS__StringSubstring(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
        local number = tonumber((__TS__Match(numberString, pattern)), base)
        if number == nil then
            return 0 / 0
        end
        if number >= 0 then
            return math.floor(number)
        else
            return math.ceil(number)
        end
    end
end

local function __TS__ParseFloat(numberString)
    local infinityMatch = __TS__Match(numberString, "^%s*(-?Infinity)")
    if infinityMatch ~= nil then
        return __TS__StringAccess(infinityMatch, 0) == "-" and -math.huge or math.huge
    end
    local number = tonumber((__TS__Match(numberString, "^%s*(-?%d+%.?%d*)")))
    return number or 0 / 0
end

local __TS__NumberToString
do
    local radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
    function __TS__NumberToString(self, radix)
        if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
            return tostring(self)
        end
        radix = math.floor(radix)
        if radix < 2 or radix > 36 then
            error("toString() radix argument must be between 2 and 36", 0)
        end
        local integer, fraction = __TS__MathModf(math.abs(self))
        local result = ""
        if radix == 8 then
            result = string.format("%o", integer)
        elseif radix == 16 then
            result = string.format("%x", integer)
        else
            repeat
                do
                    result = __TS__StringAccess(radixChars, integer % radix) .. result
                    integer = math.floor(integer / radix)
                end
            until not (integer ~= 0)
        end
        if fraction ~= 0 then
            result = result .. "."
            local delta = 1e-16
            repeat
                do
                    fraction = fraction * radix
                    delta = delta * radix
                    local digit = math.floor(fraction)
                    result = result .. __TS__StringAccess(radixChars, digit)
                    fraction = fraction - digit
                end
            until not (fraction >= delta)
        end
        if self < 0 then
            result = "-" .. result
        end
        return result
    end
end

local function __TS__NumberToFixed(self, fractionDigits)
    if math.abs(self) >= 1e+21 or self ~= self then
        return tostring(self)
    end
    local f = math.floor(fractionDigits or 0)
    if f < 0 or f > 99 then
        error("toFixed() digits argument must be between 0 and 99", 0)
    end
    return string.format(
        ("%." .. tostring(f)) .. "f",
        self
    )
end

local function __TS__ObjectDefineProperty(target, key, desc)
    local luaKey = type(key) == "number" and key + 1 or key
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = desc.get ~= nil or desc.set ~= nil
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        local ____desc_set_4 = desc.set
        local ____desc_get_5 = desc.get
        local ____desc_configurable_0 = desc.configurable
        if ____desc_configurable_0 == nil then
            ____desc_configurable_0 = valueExists
        end
        local ____desc_enumerable_1 = desc.enumerable
        if ____desc_enumerable_1 == nil then
            ____desc_enumerable_1 = valueExists
        end
        local ____desc_writable_2 = desc.writable
        if ____desc_writable_2 == nil then
            ____desc_writable_2 = valueExists
        end
        local ____temp_3
        if desc.value ~= nil then
            ____temp_3 = desc.value
        else
            ____temp_3 = value
        end
        descriptor = {
            set = ____desc_set_4,
            get = ____desc_get_5,
            configurable = ____desc_configurable_0,
            enumerable = ____desc_enumerable_1,
            writable = ____desc_writable_2,
            value = ____temp_3
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

local function __TS__ObjectEntries(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = {key, obj[key]}
    end
    return result
end

local function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

local function __TS__ObjectGroupBy(items, keySelector)
    local result = {}
    local i = 0
    for ____, item in __TS__Iterator(items) do
        local key = keySelector(nil, item, i)
        if result[key] ~= nil then
            local ____result_key_0 = result[key]
            ____result_key_0[#____result_key_0 + 1] = item
        else
            result[key] = {item}
        end
        i = i + 1
    end
    return result
end

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

local function __TS__ObjectValues(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = obj[key]
    end
    return result
end

local function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = item.value
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = item
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = data
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        reject(nil, reason)
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == 2 then
                results[i + 1] = {status = "rejected", reason = item.rejectionReason}
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = {status = "fulfilled", value = item}
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = {status = "fulfilled", value = data}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                rejections[#rejections + 1] = item.rejectionReason
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    if #pending == 0 then
        return __TS__Promise.reject("No promises to resolve with .any()")
    end
    local numResolved = 0
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, data)
                        resolve(nil, data)
                    end,
                    function(____, reason)
                        rejections[#rejections + 1] = reason
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(nil, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, value) return resolve(nil, value) end,
                    function(____, reason) return reject(nil, reason) end
                )
            end
        end
    )
end

local Set
do
    Set = __TS__Class()
    Set.name = "Set"
    function Set.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "Set"
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local array = values
            for ____, value in ipairs(array) do
                self:add(value)
            end
        end
    end
    function Set.prototype.add(self, value)
        local isNewValue = not self:has(value)
        if isNewValue then
            self.size = self.size + 1
        end
        if self.firstKey == nil then
            self.firstKey = value
            self.lastKey = value
        elseif isNewValue then
            self.nextKey[self.lastKey] = value
            self.previousKey[value] = self.lastKey
            self.lastKey = value
        end
        return self
    end
    function Set.prototype.clear(self)
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Set.prototype.delete(self, value)
        local contains = self:has(value)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[value]
            local previous = self.previousKey[value]
            if next ~= nil and previous ~= nil then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next ~= nil then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous ~= nil then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[value] = nil
            self.previousKey[value] = nil
        end
        return contains
    end
    function Set.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return self.nextKey[value] ~= nil or self.lastKey == value
    end
    Set.prototype[Symbol.iterator] = function(self)
        return self:values()
    end
    function Set.prototype.entries(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, key}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.values(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.union(self, other)
        local result = __TS__New(Set, self)
        for ____, item in __TS__Iterator(other) do
            result:add(item)
        end
        return result
    end
    function Set.prototype.intersection(self, other)
        local result = __TS__New(Set)
        for ____, item in __TS__Iterator(self) do
            if other:has(item) then
                result:add(item)
            end
        end
        return result
    end
    function Set.prototype.difference(self, other)
        local result = __TS__New(Set, self)
        for ____, item in __TS__Iterator(other) do
            result:delete(item)
        end
        return result
    end
    function Set.prototype.symmetricDifference(self, other)
        local result = __TS__New(Set, self)
        for ____, item in __TS__Iterator(other) do
            if self:has(item) then
                result:delete(item)
            else
                result:add(item)
            end
        end
        return result
    end
    function Set.prototype.isSubsetOf(self, other)
        for ____, item in __TS__Iterator(self) do
            if not other:has(item) then
                return false
            end
        end
        return true
    end
    function Set.prototype.isSupersetOf(self, other)
        for ____, item in __TS__Iterator(other) do
            if not self:has(item) then
                return false
            end
        end
        return true
    end
    function Set.prototype.isDisjointFrom(self, other)
        for ____, item in __TS__Iterator(self) do
            if other:has(item) then
                return false
            end
        end
        return true
    end
    Set[Symbol.species] = Set
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

local WeakMap
do
    WeakMap = __TS__Class()
    WeakMap.name = "WeakMap"
    function WeakMap.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "WeakMap"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self.items[value[1]] = value[2]
            end
        else
            for ____, kvp in ipairs(entries) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function WeakMap.prototype.delete(self, key)
        local contains = self:has(key)
        self.items[key] = nil
        return contains
    end
    function WeakMap.prototype.get(self, key)
        return self.items[key]
    end
    function WeakMap.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function WeakMap.prototype.set(self, key, value)
        self.items[key] = value
        return self
    end
    WeakMap[Symbol.species] = WeakMap
end

local WeakSet
do
    WeakSet = __TS__Class()
    WeakSet.name = "WeakSet"
    function WeakSet.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "WeakSet"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self.items[result.value] = true
            end
        else
            for ____, value in ipairs(values) do
                self.items[value] = true
            end
        end
    end
    function WeakSet.prototype.add(self, value)
        self.items[value] = true
        return self
    end
    function WeakSet.prototype.delete(self, value)
        local contains = self:has(value)
        self.items[value] = nil
        return contains
    end
    function WeakSet.prototype.has(self, value)
        return self.items[value] == true
    end
    WeakSet[Symbol.species] = WeakSet
end

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            elseif __TS__StringIncludes(_VERSION, "Lua 5.0") then
                trace = originalTraceback((("[Level " .. tostring(level)) .. "] ") .. tostring(message))
            else
                trace = originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            local function stringReplacer(____, file, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local chunkName = (__TS__Match(file, "%[string \"([^\"]+)\"%]"))
                    local sourceName = string.gsub(chunkName, ".lua$", ".ts")
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (sourceName .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return stringReplacer(nil, file, line) end
            )
            return result
        end
    end
end

local function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        for i = 0, #iterable - 1 do
            arr[i + 1] = __TS__StringAccess(iterable, i)
        end
    else
        local len = 0
        for ____, item in __TS__Iterator(iterable) do
            len = len + 1
            arr[len] = item
        end
    end
    return __TS__Unpack(arr)
end

local function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

local function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or 0 / 0
end

local function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

local function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return self .. string.sub(
        fillString,
        1,
        math.floor(maxLength)
    )
end

local function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return string.sub(
        fillString,
        1,
        math.floor(maxLength)
    ) .. self
end

local __TS__StringReplace
do
    local sub = string.sub
    function __TS__StringReplace(source, searchValue, replaceValue)
        local startPos, endPos = string.find(source, searchValue, nil, true)
        if not startPos then
            return source
        end
        local before = sub(source, 1, startPos - 1)
        local replacement = type(replaceValue) == "string" and replaceValue or replaceValue(nil, searchValue, startPos - 1, source)
        local after = sub(source, endPos + 1)
        return (before .. replacement) .. after
    end
end

local __TS__StringSplit
do
    local sub = string.sub
    local find = string.find
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local result = {}
        local resultIndex = 1
        if separator == nil or separator == "" then
            for i = 1, #source do
                result[resultIndex] = sub(source, i, i)
                resultIndex = resultIndex + 1
            end
        else
            local currentPos = 1
            while resultIndex <= limit do
                local startPos, endPos = find(source, separator, currentPos, true)
                if not startPos then
                    break
                end
                result[resultIndex] = sub(source, currentPos, startPos - 1)
                resultIndex = resultIndex + 1
                currentPos = endPos + 1
            end
            if resultIndex <= limit then
                result[resultIndex] = sub(source, currentPos)
            end
        end
        return result
    end
end

local __TS__StringReplaceAll
do
    local sub = string.sub
    local find = string.find
    function __TS__StringReplaceAll(source, searchValue, replaceValue)
        if type(replaceValue) == "string" then
            local concat = table.concat(
                __TS__StringSplit(source, searchValue),
                replaceValue
            )
            if #searchValue == 0 then
                return (replaceValue .. concat) .. replaceValue
            end
            return concat
        end
        local parts = {}
        local partsIndex = 1
        if #searchValue == 0 then
            parts[1] = replaceValue(nil, "", 0, source)
            partsIndex = 2
            for i = 1, #source do
                parts[partsIndex] = sub(source, i, i)
                parts[partsIndex + 1] = replaceValue(nil, "", i, source)
                partsIndex = partsIndex + 2
            end
        else
            local currentPos = 1
            while true do
                local startPos, endPos = find(source, searchValue, currentPos, true)
                if not startPos then
                    break
                end
                parts[partsIndex] = sub(source, currentPos, startPos - 1)
                parts[partsIndex + 1] = replaceValue(nil, searchValue, startPos - 1, source)
                partsIndex = partsIndex + 2
                currentPos = endPos + 1
            end
            parts[partsIndex] = sub(source, currentPos)
        end
        return table.concat(parts)
    end
end

local function __TS__StringSlice(self, start, ____end)
    if start == nil or start ~= start then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if length ~= length or length <= 0 then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

local function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

local __TS__SymbolRegistryFor, __TS__SymbolRegistryKeyFor
do
    local symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not symbolRegistry[key] then
            symbolRegistry[key] = __TS__Symbol(key)
        end
        return symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(symbolRegistry) do
            if symbolRegistry[key] == sym then
                return key
            end
        end
        return nil
    end
end

local function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

local function __TS__Using(self, cb, ...)
    local args = {...}
    local thrownError
    local ok, result = xpcall(
        function() return cb(__TS__Unpack(args)) end,
        function(err)
            thrownError = err
            return thrownError
        end
    )
    local argArray = {__TS__Unpack(args)}
    do
        local i = #argArray - 1
        while i >= 0 do
            local ____self_0 = argArray[i + 1]
            ____self_0[Symbol.dispose](____self_0)
            i = i - 1
        end
    end
    if not ok then
        error(thrownError, 0)
    end
    return result
end

local function __TS__UsingAsync(self, cb, ...)
    local args = {...}
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local thrownError
        local ok, result = xpcall(
            function() return cb(
                nil,
                __TS__Unpack(args)
            ) end,
            function(err)
                thrownError = err
                return thrownError
            end
        )
        local argArray = {__TS__Unpack(args)}
        do
            local i = #argArray - 1
            while i >= 0 do
                if argArray[i + 1][Symbol.dispose] ~= nil then
                    local ____self_0 = argArray[i + 1]
                    ____self_0[Symbol.dispose](____self_0)
                end
                if argArray[i + 1][Symbol.asyncDispose] ~= nil then
                    local ____self_1 = argArray[i + 1]
                    __TS__Await(____self_1[Symbol.asyncDispose](____self_1))
                end
                i = i - 1
            end
        end
        if not ok then
            error(thrownError, 0)
        end
        return ____awaiter_resolve(nil, result)
    end)
end

return {
  __TS__ArrayAt = __TS__ArrayAt,
  __TS__ArrayConcat = __TS__ArrayConcat,
  __TS__ArrayEntries = __TS__ArrayEntries,
  __TS__ArrayEvery = __TS__ArrayEvery,
  __TS__ArrayFill = __TS__ArrayFill,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__ArrayFindIndex = __TS__ArrayFindIndex,
  __TS__ArrayFrom = __TS__ArrayFrom,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayIndexOf = __TS__ArrayIndexOf,
  __TS__ArrayIsArray = __TS__ArrayIsArray,
  __TS__ArrayJoin = __TS__ArrayJoin,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayPush = __TS__ArrayPush,
  __TS__ArrayPushArray = __TS__ArrayPushArray,
  __TS__ArrayReduce = __TS__ArrayReduce,
  __TS__ArrayReduceRight = __TS__ArrayReduceRight,
  __TS__ArrayReverse = __TS__ArrayReverse,
  __TS__ArrayUnshift = __TS__ArrayUnshift,
  __TS__ArraySort = __TS__ArraySort,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__ArraySome = __TS__ArraySome,
  __TS__ArraySplice = __TS__ArraySplice,
  __TS__ArrayToObject = __TS__ArrayToObject,
  __TS__ArrayFlat = __TS__ArrayFlat,
  __TS__ArrayFlatMap = __TS__ArrayFlatMap,
  __TS__ArraySetLength = __TS__ArraySetLength,
  __TS__ArrayToReversed = __TS__ArrayToReversed,
  __TS__ArrayToSorted = __TS__ArrayToSorted,
  __TS__ArrayToSpliced = __TS__ArrayToSpliced,
  __TS__ArrayWith = __TS__ArrayWith,
  __TS__AsyncAwaiter = __TS__AsyncAwaiter,
  __TS__Await = __TS__Await,
  __TS__Class = __TS__Class,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__CloneDescriptor = __TS__CloneDescriptor,
  __TS__CountVarargs = __TS__CountVarargs,
  __TS__Decorate = __TS__Decorate,
  __TS__DecorateLegacy = __TS__DecorateLegacy,
  __TS__DecorateParam = __TS__DecorateParam,
  __TS__Delete = __TS__Delete,
  __TS__DelegatedYield = __TS__DelegatedYield,
  __TS__DescriptorGet = __TS__DescriptorGet,
  __TS__DescriptorSet = __TS__DescriptorSet,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__FunctionBind = __TS__FunctionBind,
  __TS__Generator = __TS__Generator,
  __TS__InstanceOf = __TS__InstanceOf,
  __TS__InstanceOfObject = __TS__InstanceOfObject,
  __TS__Iterator = __TS__Iterator,
  __TS__LuaIteratorSpread = __TS__LuaIteratorSpread,
  Map = Map,
  __TS__MapGroupBy = __TS__MapGroupBy,
  __TS__Match = __TS__Match,
  __TS__MathAtan2 = __TS__MathAtan2,
  __TS__MathModf = __TS__MathModf,
  __TS__MathSign = __TS__MathSign,
  __TS__MathTrunc = __TS__MathTrunc,
  __TS__New = __TS__New,
  __TS__Number = __TS__Number,
  __TS__NumberIsFinite = __TS__NumberIsFinite,
  __TS__NumberIsInteger = __TS__NumberIsInteger,
  __TS__NumberIsNaN = __TS__NumberIsNaN,
  __TS__ParseInt = __TS__ParseInt,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__NumberToString = __TS__NumberToString,
  __TS__NumberToFixed = __TS__NumberToFixed,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ObjectDefineProperty = __TS__ObjectDefineProperty,
  __TS__ObjectEntries = __TS__ObjectEntries,
  __TS__ObjectFromEntries = __TS__ObjectFromEntries,
  __TS__ObjectGetOwnPropertyDescriptor = __TS__ObjectGetOwnPropertyDescriptor,
  __TS__ObjectGetOwnPropertyDescriptors = __TS__ObjectGetOwnPropertyDescriptors,
  __TS__ObjectGroupBy = __TS__ObjectGroupBy,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ObjectRest = __TS__ObjectRest,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Promise = __TS__Promise,
  __TS__PromiseAll = __TS__PromiseAll,
  __TS__PromiseAllSettled = __TS__PromiseAllSettled,
  __TS__PromiseAny = __TS__PromiseAny,
  __TS__PromiseRace = __TS__PromiseRace,
  Set = Set,
  __TS__SetDescriptor = __TS__SetDescriptor,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread,
  WeakMap = WeakMap,
  WeakSet = WeakSet,
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Spread = __TS__Spread,
  __TS__StringAccess = __TS__StringAccess,
  __TS__StringCharAt = __TS__StringCharAt,
  __TS__StringCharCodeAt = __TS__StringCharCodeAt,
  __TS__StringEndsWith = __TS__StringEndsWith,
  __TS__StringIncludes = __TS__StringIncludes,
  __TS__StringPadEnd = __TS__StringPadEnd,
  __TS__StringPadStart = __TS__StringPadStart,
  __TS__StringReplace = __TS__StringReplace,
  __TS__StringReplaceAll = __TS__StringReplaceAll,
  __TS__StringSlice = __TS__StringSlice,
  __TS__StringSplit = __TS__StringSplit,
  __TS__StringStartsWith = __TS__StringStartsWith,
  __TS__StringSubstr = __TS__StringSubstr,
  __TS__StringSubstring = __TS__StringSubstring,
  __TS__StringTrim = __TS__StringTrim,
  __TS__StringTrimEnd = __TS__StringTrimEnd,
  __TS__StringTrimStart = __TS__StringTrimStart,
  __TS__Symbol = __TS__Symbol,
  Symbol = Symbol,
  __TS__SymbolRegistryFor = __TS__SymbolRegistryFor,
  __TS__SymbolRegistryKeyFor = __TS__SymbolRegistryKeyFor,
  __TS__TypeOf = __TS__TypeOf,
  __TS__Unpack = __TS__Unpack,
  __TS__Using = __TS__Using,
  __TS__UsingAsync = __TS__UsingAsync
}
 end,
["preBuild.src.lua.lua"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
____exports.Lua = __TS__Class()
local Lua = ____exports.Lua
Lua.name = "Lua"
function Lua.prototype.____constructor(self)
end
function Lua.literal(self, luaVersion)
    error(
        __TS__New(Error, ("Lua.literal(" .. luaVersion) .. ") has no Typescript alternative"),
        0
    )
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccPeripheral"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A wrapper for the ComputerCraft `peripheral` API.
-- Provides utilities to find, call, and inspect peripherals attached to a computer.
-- Based on documentation from: https://tweaked.cc/module/peripheral.html
____exports.CcPeripheral = __TS__Class()
local CcPeripheral = ____exports.CcPeripheral
CcPeripheral.name = "CcPeripheral"
function CcPeripheral.prototype.____constructor(self, internalPeripheral)
    self.internalPeripheral = internalPeripheral
end
function CcPeripheral.prototype.get(self)
    return self.internalPeripheral
end
function CcPeripheral.find(self, peripheralName, filter)
    local internalPeripheral = peripheral.find(peripheralName, filter)
    if internalPeripheral == nil then
        error(
            __TS__New(Error, ("No peripheral of type \"" .. peripheralName) .. "\" found."),
            0
        )
    end
    return __TS__New(____exports.CcPeripheral, internalPeripheral)
end
function CcPeripheral.getNames(self)
    return peripheral.getNames()
end
function CcPeripheral.isPresent(self, name)
    return peripheral.isPresent(name)
end
function CcPeripheral.getType(self, peripheral)
    return peripheral.getType(peripheral)
end
function CcPeripheral.hasType(self, peripheral, peripheralType)
    return peripheral.hasType(peripheral, peripheralType)
end
function CcPeripheral.getMethods(self, name)
    return peripheral.getMethods(name)
end
function CcPeripheral.getName(self, peripheral)
    return peripheral.getName(peripheral)
end
function CcPeripheral.call(self, name, method, ...)
    return peripheral.call(name, method, ...)
end
function CcPeripheral.wrap(self, name)
    return peripheral.wrap(name)
end
function CcPeripheral.prototype.hasType(self, peripheralType)
    return peripheral.hasType(self.internalPeripheral, peripheralType)
end
function CcPeripheral.prototype.getType(self)
    return peripheral.getType(self.internalPeripheral)
end
function CcPeripheral.prototype.getName(self)
    return peripheral.getName(self.internalPeripheral)
end
function CcPeripheral.prototype.call(self, method, ...)
    return peripheral.call(self.internalPeripheral, method, ...)
end
function CcPeripheral.prototype.getMethods(self)
    return peripheral.getMethods(self.internalPeripheral)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.chatBox"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the ChatBox peripheral from the Advanced Peripherals mod.
-- Allows reading and writing to the Minecraft in-game chat, including sending messages,
-- toasts, and formatted components globally or to specific players.
____exports.ChatBox = __TS__Class()
local ChatBox = ____exports.ChatBox
ChatBox.name = "ChatBox"
function ChatBox.prototype.____constructor(self)
end
function ChatBox.onMessage(self, listener)
    local event = ""
    local username = ""
    local message = ""
    local uuid = ""
    local isHidden = true
    while true do
        local event, username, message, uuid, isHidden = os.pullEvent("chat")
        listener(nil, {
            event = event,
            username = username,
            message = message,
            uuid = uuid,
            isHidden = isHidden
        })
    end
end
function ChatBox.sendMessage(self, message, prefix, brackets, bracketColor, range)
    self._internalChatBox:get().sendMessage(message, prefix, brackets, bracketColor, range)
end
function ChatBox.sendMessageToPlayer(self, message, username, prefix, brackets, bracketColor, range)
    self._internalChatBox:get().sendMessageToPlayer(message, username, prefix, brackets, bracketColor, range)
end
function ChatBox.sendToastToPlayer(self, message, title, username, prefix, brackets, bracketColor, range)
    self._internalChatBox:get().sendToastToPlayer(message, title, username, prefix, brackets, bracketColor, range)
end
function ChatBox.sendFormattedMessage(self, json, prefix, brackets, bracketColor, range)
    self._internalChatBox:get().sendFormattedMessage(json, prefix, brackets, bracketColor, range)
end
function ChatBox.sendFormattedMessageToPlayer(self, json, username, prefix, brackets, bracketColor, range)
    self._internalChatBox:get().sendFormattedMessageToPlayer(json, username, prefix, brackets, bracketColor, range)
end
function ChatBox.sendFormattedToastToPlayer(self, messageJson, titleJson, username, prefix, brackets, bracketColor, range)
    self._internalChatBox:get().sendFormattedToastToPlayer(messageJson, titleJson, username, prefix, brackets, bracketColor, range)
end
ChatBox._internalChatBox = CcPeripheral:find("chatBox")
return ____exports
 end,
["preBuild.src.util.types.result"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
____exports.Result = __TS__Class()
local Result = ____exports.Result
Result.name = "Result"
function Result.prototype.____constructor(self, value, errorMessage)
    if value == nil and errorMessage == nil then
        error(
            __TS__New(Error, "Cannot create a result with both undefined values"),
            0
        )
    end
    self.value = value
    self.errorMessage = errorMessage
end
function Result.of(self, value)
    return __TS__New(____exports.Result, value, nil)
end
function Result.ofError(self, value, errorMessage)
    return __TS__New(____exports.Result, value, errorMessage)
end
function Result.void(self)
    return __TS__New(____exports.Result, "No value", nil)
end
function Result.error(self, errorMessage)
    return __TS__New(____exports.Result, nil, errorMessage or "No error message given")
end
function Result.errorValue(self, value, errorMessage)
    return __TS__New(____exports.Result, value, errorMessage)
end
function Result.prototype.isSuccess(self)
    return self.errorMessage == nil
end
function Result.prototype.isError(self)
    return not self:isSuccess()
end
function Result.prototype.ifSuccess(self, callback)
    if self:isSuccess() then
        callback(nil, self.value)
    end
    return self
end
function Result.prototype.ifError(self, callback)
    if self:isError() then
        callback(nil, self.errorMessage)
    end
    return self
end
function Result.prototype.getValueUnsafe(self, message)
    if not self.value then
        error(
            __TS__New(Error, message or self.errorMessage or "Cannot unwrap `Result` value"),
            0
        )
    end
    return self.value
end
function Result.prototype.getValueOrDefault(self, defaultValue)
    local ____self_value_0 = self.value
    if ____self_value_0 == nil then
        ____self_value_0 = defaultValue
    end
    return ____self_value_0
end
function Result.prototype.getErrorMessage(self)
    return self.errorMessage
end
function Result.prototype.asOptional(self)
    return Optional:of(self.value)
end
Result.prototype["then"] = function(self, callback)
    if not self.value then
        return ____exports.Result:error(self.errorMessage)
    end
    return ____exports.Result:of(callback(nil, self.value))
end
return ____exports
 end,
["preBuild.src.util.types.optional"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
____exports.Optional = __TS__Class()
local Optional = ____exports.Optional
Optional.name = "Optional"
function Optional.prototype.____constructor(self, value)
    self.value = value
end
function Optional.of(self, value)
    return __TS__New(____exports.Optional, value)
end
function Optional.ofNullable(self, value)
    if value == nil or value == nil then
        return ____exports.Optional:empty()
    end
    return ____exports.Optional:of(value)
end
function Optional.empty(self)
    return __TS__New(____exports.Optional, nil)
end
function Optional.prototype.isPresent(self)
    return self.value ~= nil
end
function Optional.prototype.isEmpty(self)
    return self.value == nil
end
function Optional.prototype.getValueUnsafe(self, message)
    if not self.value then
        error(
            __TS__New(Error, message or "Cannot unwrap `Optional` value!"),
            0
        )
    end
    return self.value
end
function Optional.prototype.getValueOrDefault(self, defaultValue)
    local ____self_value_0 = self.value
    if ____self_value_0 == nil then
        ____self_value_0 = defaultValue
    end
    return ____self_value_0
end
Optional.prototype["then"] = function(self, callback)
    if not self.value then
        return ____exports.Optional:empty()
    end
    return ____exports.Optional:of(callback(nil, self.value))
end
function Optional.prototype.ifPresent(self, callback)
    if self.value then
        callback(nil, self.value)
    end
    return self
end
function Optional.prototype.ifEmpty(self, callback)
    if not self.value then
        callback(nil)
    end
    return self
end
Optional.prototype["or"] = function(self, other)
    local ____table_value_1
    if self.value then
        ____table_value_1 = self
    else
        ____table_value_1 = other
    end
    return ____table_value_1
end
function Optional.prototype.toResult(self, errorMessage)
    if self.value then
        return Result:of(self.value)
    end
    return Result:ofError(self.value, errorMessage)
end
return ____exports
 end,
["preBuild.src.util.types.collection.luaSet"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local ____exports = {}
local ____luaList = require("preBuild.src.util.types.collection.luaList")
local LuaList = ____luaList.LuaList
____exports.LuaSet = __TS__Class()
local LuaSet = ____exports.LuaSet
LuaSet.name = "LuaSet"
function LuaSet.prototype.____constructor(self)
    self.elements = __TS__New(Set)
end
function LuaSet.ofArray(self, elements)
    return __TS__New(____exports.LuaSet):addAll(elements)
end
function LuaSet.ofList(self, elements)
    return __TS__New(____exports.LuaSet):addAll(elements)
end
function LuaSet.ofSingleton(self, element)
    return __TS__New(____exports.LuaSet):add(element)
end
function LuaSet.empty(self)
    return __TS__New(____exports.LuaSet)
end
function LuaSet.prototype.addAll(self, elements)
    __TS__ArrayForEach(
        elements,
        function(____, element) return self:add(element) end
    )
    return self
end
function LuaSet.prototype.removeAll(self, elements)
    __TS__ArrayForEach(
        elements,
        function(____, element) return self:remove(element) end
    )
    return self
end
function LuaSet.prototype.add(self, element)
    self.elements:add(element)
    return self
end
function LuaSet.prototype.remove(self, element)
    self.elements:delete(element)
    return self
end
function LuaSet.prototype.contains(self, element)
    return self.elements:has(element)
end
function LuaSet.prototype.select(self, selector)
    local result = __TS__New(____exports.LuaSet)
    self.elements:forEach(function(____, element) return result:add(selector(nil, element)) end)
    return result
end
function LuaSet.prototype.where(self, predicate)
    local result = __TS__New(____exports.LuaSet)
    self.elements:forEach(function(____, element)
        if predicate(nil, element) then
            result:add(element)
        end
    end)
    return result
end
function LuaSet.prototype.clear(self)
    self.elements:clear()
    return self
end
function LuaSet.prototype.size(self)
    return self.elements.size
end
function LuaSet.prototype.isEmpty(self)
    return self.elements.size == 0
end
function LuaSet.prototype.isNotEmpty(self)
    return self.elements.size > 0
end
function LuaSet.prototype.forEach(self, action)
    self.elements:forEach(action)
    return self
end
function LuaSet.prototype.toList(self)
    return LuaList:ofSet(self)
end
function LuaSet.prototype.copy(self)
    return __TS__New(____exports.LuaSet):addAll(self)
end
function LuaSet.prototype.union(self, other)
    return __TS__New(____exports.LuaSet):addAll(self):addAll(other)
end
function LuaSet.prototype.intersection(self, other)
    return self:where(other.contains)
end
function LuaSet.prototype.difference(self, other)
    return self:where(function(____, element) return not other:contains(element) end)
end
function LuaSet.prototype.isSubsetOf(self, other)
    return other:difference(self):isEmpty()
end
function LuaSet.prototype.isSupersetOf(self, other)
    return other:isSubsetOf(self)
end
function LuaSet.prototype.isStrictSubsetOf(self, other)
    return self:size() < other:size() and self:isSubsetOf(other)
end
function LuaSet.prototype.isStrictSupersetOf(self, other)
    return self:size() > other:size() and self:isSupersetOf(other)
end
function LuaSet.prototype.toArray(self)
    return {__TS__Spread(self.elements)}
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.lua.table"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.lua.tableUtil"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
____exports.TableUtil = __TS__Class()
local TableUtil = ____exports.TableUtil
TableUtil.name = "TableUtil"
function TableUtil.prototype.____constructor(self)
end
function TableUtil.fromArray(self, elements)
    local result = {}
    if elements == nil then
        return result
    end
    local length = #elements
    do
        local i = 0
        while i < length do
            local luaIndex = i + 1
            result[luaIndex] = elements[luaIndex]
            i = i + 1
        end
    end
    return result
end
return ____exports
 end,
["preBuild.src.util.types.collection.luaList"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFrom = ____lualib.__TS__ArrayFrom
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayUnshift = ____lualib.__TS__ArrayUnshift
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayFlat = ____lualib.__TS__ArrayFlat
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local Set = ____lualib.Set
local __TS__Spread = ____lualib.__TS__Spread
local ____exports = {}
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____luaSet = require("preBuild.src.util.types.collection.luaSet")
local LuaSet = ____luaSet.LuaSet
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
____exports.LuaList = __TS__Class()
local LuaList = ____exports.LuaList
LuaList.name = "LuaList"
function LuaList.prototype.____constructor(self, elements)
    self.elements = {}
    self.elements = elements
end
function LuaList.of(self, elements)
    return __TS__New(____exports.LuaList, elements)
end
function LuaList.ofTable(self, elements)
    local newList = __TS__New(____exports.LuaList, {})
    for index, value in ipairs(elements) do
        newList:append(value)
    end
    return newList
end
function LuaList.ofSingleton(self, element)
    return __TS__New(____exports.LuaList, {element})
end
function LuaList.ofRange(self, start, count)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArrayFrom(
            {length = count},
            function(____, _, i) return start + i end
        )
    )
end
function LuaList.ofSet(self, set)
    return __TS__New(
        ____exports.LuaList,
        set:toArray()
    )
end
function LuaList.empty(self)
    return __TS__New(____exports.LuaList, {})
end
function LuaList.prototype.__tostring(self)
    return ("[" .. __TS__ArrayJoin(self.elements, ", ")) .. "]"
end
function LuaList.prototype.get(self, index)
    return self.elements[index + 1]
end
function LuaList.prototype.append(self, element)
    local ____self_elements_0 = self.elements
    ____self_elements_0[#____self_elements_0 + 1] = element
    return self
end
function LuaList.prototype.appendAll(self, elements)
    __TS__ArrayForEach(elements, self.append)
    return self
end
function LuaList.prototype.prepend(self, element)
    __TS__ArrayUnshift(self.elements, element)
    return self
end
function LuaList.prototype.set(self, index, element)
    self.elements[index + 1] = element
    return self
end
function LuaList.prototype.removeFirst(self)
    if #self.elements == 0 then
        return Optional:empty()
    end
    return Optional:of(table.remove(self.elements, 1))
end
function LuaList.prototype.removeLast(self)
    if #self.elements == 0 then
        return Optional:empty()
    end
    return Optional:of(table.remove(self.elements))
end
function LuaList.prototype.removeAt(self, index)
    if index < 0 or index >= #self.elements then
        error(
            __TS__New(Error, "Index was out of range"),
            0
        )
    end
    return __TS__ArraySplice(self.elements, index, 1)[1]
end
function LuaList.prototype.remove(self, element)
    local index = __TS__ArrayIndexOf(self.elements, element)
    if index == -1 then
        return self
    end
    __TS__ArraySplice(self.elements, index, 1)
    return self
end
function LuaList.prototype.clear(self)
    __TS__ArraySplice(self.elements, 0)
    return self
end
function LuaList.prototype.contains(self, element)
    return __TS__ArrayIncludes(self.elements, element)
end
function LuaList.prototype.containsAll(self, elements)
    return __TS__ArrayEvery(
        elements,
        function(____, element) return self:contains(element) end
    )
end
function LuaList.prototype.containsAny(self, elements)
    return __TS__ArraySome(
        elements,
        function(____, element) return self:contains(element) end
    )
end
function LuaList.prototype.indexOf(self, element)
    return __TS__ArrayIndexOf(self.elements, element)
end
function LuaList.prototype.isEmpty(self)
    return #self.elements == 0
end
function LuaList.prototype.isNotEmpty(self)
    return #self.elements > 0
end
function LuaList.prototype.reversed(self)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArrayReverse(self.elements)
    )
end
function LuaList.prototype.sorted(self, compareFn)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArraySort(self.elements, compareFn)
    )
end
function LuaList.prototype.join(self, separator)
    return __TS__ArrayJoin(self.elements, separator)
end
function LuaList.prototype.flatten(self)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArrayFlat(self.elements)
    )
end
function LuaList.prototype.size(self)
    return #self.elements
end
function LuaList.prototype.forEach(self, action)
    __TS__ArrayForEach(self.elements, action)
    return self
end
function LuaList.prototype.select(self, selector)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArrayMap(self.elements, selector)
    )
end
function LuaList.prototype.where(self, predicate)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArrayFilter(self.elements, predicate)
    )
end
function LuaList.prototype.reduce(self, collector, initialValue)
    return __TS__ArrayReduce(self.elements, collector, initialValue)
end
function LuaList.prototype.first(self)
    if #self.elements == 0 then
        return Optional:empty()
    end
    return Optional:of(self.elements[1])
end
function LuaList.prototype.firstOrDefault(self, defaultValue)
    if #self.elements == 0 then
        return defaultValue
    end
    return self.elements[1]
end
function LuaList.prototype.last(self)
    if #self.elements == 0 then
        return Optional:empty()
    end
    return Optional:of(self.elements[#self.elements])
end
function LuaList.prototype.lastOrDefault(self, defaultValue)
    if #self.elements == 0 then
        return defaultValue
    end
    return self.elements[#self.elements]
end
function LuaList.prototype.any(self, predicate)
    return __TS__ArraySome(self.elements, predicate)
end
function LuaList.prototype.all(self, predicate)
    return __TS__ArrayEvery(self.elements, predicate)
end
function LuaList.prototype.sum(self)
    return self:reduce(
        function(____, sum, element) return sum + element end,
        0
    )
end
function LuaList.prototype.average(self)
    if #self.elements == 0 then
        return Optional:empty()
    end
    return Optional:of(self:sum() / #self.elements)
end
function LuaList.prototype.min(self)
    if #self.elements == 0 then
        return Optional:empty()
    end
    return Optional:of(math.min(__TS__Unpack(self.elements)))
end
function LuaList.prototype.minBy(self, selector)
    if #self.elements == 0 then
        return Optional:empty()
    end
    local minElement = self.elements[1]
    local minSelectorValue = selector(nil, self.elements[1])
    do
        local i = 1
        while i < #self.elements do
            local element = self.elements[i + 1]
            local selectorValue = selector(nil, element)
            if selectorValue < (minSelectorValue or 0) then
                minElement = element
                minSelectorValue = selectorValue
            end
            i = i + 1
        end
    end
    return Optional:of(minElement)
end
function LuaList.prototype.max(self)
    if #self.elements == 0 then
        return Optional:empty()
    end
    return Optional:of(math.max(__TS__Unpack(self.elements)))
end
function LuaList.prototype.maxBy(self, selector)
    if #self.elements == 0 then
        return Optional:empty()
    end
    local maxElement = self.elements[1]
    local maxSelectorValue = selector(nil, self.elements[1])
    do
        local i = 1
        while i < #self.elements do
            local element = self.elements[i + 1]
            local selectorValue = selector(nil, element)
            if selectorValue > (maxSelectorValue or 0) then
                maxElement = element
                maxSelectorValue = selectorValue
            end
            i = i + 1
        end
    end
    return Optional:of(maxElement)
end
function LuaList.prototype.copy(self)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArraySlice(self.elements)
    )
end
function LuaList.prototype.distinct(self)
    return __TS__New(
        ____exports.LuaList,
        {__TS__Spread(__TS__New(Set, self.elements))}
    )
end
function LuaList.prototype.skip(self, count)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArraySlice(self.elements, count)
    )
end
function LuaList.prototype.take(self, count)
    return __TS__New(
        ____exports.LuaList,
        __TS__ArraySlice(self.elements, 0, count)
    )
end
function LuaList.prototype.toSet(self)
    return LuaSet:ofList(self)
end
function LuaList.prototype.toArray(self)
    return self.elements
end
function LuaList.prototype.toTable(self)
    return TableUtil:fromArray(self:toArray())
end
return ____exports
 end,
["preBuild.src.util.types.collection.luaMapEntry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
____exports.LuaMapEntry = __TS__Class()
local LuaMapEntry = ____exports.LuaMapEntry
LuaMapEntry.name = "LuaMapEntry"
function LuaMapEntry.prototype.____constructor(self, key, value)
    self.key = key
    self.value = value
end
function LuaMapEntry.of(self, key, value)
    return __TS__New(____exports.LuaMapEntry, key, value)
end
function LuaMapEntry.prototype.getKey(self)
    return self.key
end
function LuaMapEntry.prototype.getValue(self)
    return self.value
end
return ____exports
 end,
["preBuild.src.util.types.collection.luaMap"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__Spread = ____lualib.__TS__Spread
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local ____exports = {}
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____luaList = require("preBuild.src.util.types.collection.luaList")
local LuaList = ____luaList.LuaList
local ____luaMapEntry = require("preBuild.src.util.types.collection.luaMapEntry")
local LuaMapEntry = ____luaMapEntry.LuaMapEntry
____exports.LuaMap = __TS__Class()
local LuaMap = ____exports.LuaMap
LuaMap.name = "LuaMap"
function LuaMap.prototype.____constructor(self)
    self.map = __TS__New(Map)
end
function LuaMap.ofEntries(self, entries)
    return __TS__New(____exports.LuaMap):setAllEntries(entries)
end
function LuaMap.ofSingleton(self, key, value)
    return __TS__New(____exports.LuaMap):set(key, value)
end
function LuaMap.ofSingletonEntry(self, entry)
    return __TS__New(____exports.LuaMap):setEntry(entry)
end
function LuaMap.empty(self)
    return __TS__New(____exports.LuaMap)
end
function LuaMap.prototype.get(self, key)
    if not self.map:has(key) then
        return Optional:empty()
    end
    return Optional:of(self.map:get(key))
end
function LuaMap.prototype.getOrDefault(self, key, defaultValue)
    if not self.map:has(key) then
        return defaultValue
    end
    return self.map:get(key)
end
function LuaMap.prototype.set(self, key, value)
    self.map:set(key, value)
    return self
end
function LuaMap.prototype.setEntry(self, entry)
    return self:set(
        entry:getKey(),
        entry:getValue()
    )
end
function LuaMap.prototype.setAllEntries(self, entries)
    __TS__ArrayForEach(entries, self.setEntry)
    return self
end
function LuaMap.prototype.remove(self, key)
    if not self.map:has(key) then
        return Optional:empty()
    end
    local value = self.map:get(key)
    self.map:delete(key)
    return Optional:of(value)
end
function LuaMap.prototype.clear(self)
    self.map:clear()
    return self
end
function LuaMap.prototype.containsKey(self, key)
    return self.map:has(key)
end
function LuaMap.prototype.containsValue(self, value)
    for ____, v in __TS__Iterator(self.map:values()) do
        if v == value then
            return true
        end
    end
    return false
end
function LuaMap.prototype.keys(self)
    return LuaList:of({__TS__Spread(self.map:keys())})
end
function LuaMap.prototype.values(self)
    return LuaList:of({__TS__Spread(self.map:values())})
end
function LuaMap.prototype.entries(self)
    return LuaList:of(__TS__ArrayMap(
        {__TS__Spread(self.map:entries())},
        function(____, ____bindingPattern0)
            local value
            local key
            key = ____bindingPattern0[1]
            value = ____bindingPattern0[2]
            return LuaMapEntry:of(key, value)
        end
    ))
end
function LuaMap.prototype.isEmpty(self)
    return self.map.size == 0
end
function LuaMap.prototype.isNotEmpty(self)
    return self.map.size > 0
end
function LuaMap.prototype.size(self)
    return self.map.size
end
function LuaMap.prototype.forEach(self, action)
    self.map:forEach(function(____, value, key) return action(nil, key, value) end)
    return self
end
function LuaMap.prototype.forEachEntry(self, action)
    self:entries():forEach(action)
    return self
end
function LuaMap.prototype.forEachKey(self, action)
    self:keys():forEach(action)
    return self
end
function LuaMap.prototype.forEachValue(self, action)
    self:values():forEach(action)
    return self
end
function LuaMap.prototype.select(self, transformer)
    local result = __TS__New(____exports.LuaMap)
    self.map:forEach(function(____, value, key)
        result:set(
            key,
            transformer(nil, key, value)
        )
    end)
    return result
end
function LuaMap.prototype.selectKeys(self, transformer)
    local result = __TS__New(____exports.LuaMap)
    self:forEachEntry(function(____, entry)
        result:set(
            transformer(
                nil,
                entry:getKey()
            ),
            entry:getValue()
        )
    end)
    return result
end
function LuaMap.prototype.selectValues(self, transformer)
    local result = __TS__New(____exports.LuaMap)
    self:forEachEntry(function(____, entry)
        result:set(
            entry:getKey(),
            transformer(nil, entry)
        )
    end)
    return result
end
function LuaMap.prototype.where(self, predicate)
    local result = __TS__New(____exports.LuaMap)
    self.map:forEach(function(____, value, key)
        if predicate(nil, key, value) then
            result:set(key, value)
        end
    end)
    return result
end
function LuaMap.prototype.whereEntries(self, predicate)
    local result = __TS__New(____exports.LuaMap)
    self:forEachEntry(function(____, entry)
        if predicate(nil, entry) then
            result:setEntry(entry)
        end
    end)
    return result
end
function LuaMap.prototype.whereKeys(self, predicate)
    local result = __TS__New(____exports.LuaMap)
    self.map:forEach(function(____, value, key)
        if predicate(nil, key) then
            result:set(key, value)
        end
    end)
    return result
end
function LuaMap.prototype.whereValues(self, predicate)
    local result = __TS__New(____exports.LuaMap)
    self.map:forEach(function(____, value, key)
        if predicate(nil, value) then
            result:set(key, value)
        end
    end)
    return result
end
function LuaMap.prototype.merge(self, other)
    local result = self:copy()
    other:forEach(function(____, key, value)
        result:set(key, value)
    end)
    return result
end
function LuaMap.prototype.copy(self)
    local newMap = __TS__New(____exports.LuaMap)
    self:forEachEntry(newMap.setEntry)
    return newMap
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.logging.logLevel"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Enumeration for logging levels.
-- 
-- Provides predefined log levels representing the severity or urgency of log messages.
-- 
-- - DEBUG: Used for detailed debug information, typically of interest only during development.
-- - INFO: Used for informational messages that highlight the progress of the application.
-- - WARN: Used for potentially harmful situations or warnings that do not disrupt the program.
-- - ERROR: Used for error events that might still allow the application to continue running.
____exports.LogLevel = LogLevel or ({})
____exports.LogLevel.DEBUG = "DEBUG"
____exports.LogLevel.INFO = "INFO"
____exports.LogLevel.WARN = "WARN"
____exports.LogLevel.ERROR = "ERROR"
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.logging.logListener"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
____exports.LogListener = __TS__Class()
local LogListener = ____exports.LogListener
LogListener.name = "LogListener"
function LogListener.prototype.____constructor(self)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.logging.listeners.consoleLogListener"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____logListener = require("preBuild.src.util.computer.api.tier2.logging.logListener")
local LogListener = ____logListener.LogListener
____exports.ConsoleLogListener = __TS__Class()
local ConsoleLogListener = ____exports.ConsoleLogListener
ConsoleLogListener.name = "ConsoleLogListener"
__TS__ClassExtends(ConsoleLogListener, LogListener)
function ConsoleLogListener.prototype.getName(self)
    return "ConsoleLogListener"
end
function ConsoleLogListener.prototype.onLog(self, level, message)
    print((("[" .. level) .. "] ") .. message)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.logging.logger"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____logLevel = require("preBuild.src.util.computer.api.tier2.logging.logLevel")
local LogLevel = ____logLevel.LogLevel
local ____consoleLogListener = require("preBuild.src.util.computer.api.tier2.logging.listeners.consoleLogListener")
local ConsoleLogListener = ____consoleLogListener.ConsoleLogListener
local ____luaMap = require("preBuild.src.util.types.collection.luaMap")
local LuaMap = ____luaMap.LuaMap
____exports.Logger = __TS__Class()
local Logger = ____exports.Logger
Logger.name = "Logger"
function Logger.prototype.____constructor(self)
end
function Logger.addListener(self, listener)
    self.listeners:set(
        listener:getName(),
        listener
    )
end
function Logger.clearListeners(self)
    self.listeners:clear()
end
function Logger.log(self, level, ...)
    local args = {...}
    if (self.levelMap:get(level) or 0) < (self.levelMap:get(self.level) or 0) then
        return
    end
    local message = table.concat(
        __TS__ArrayMap(
            args,
            function(____, arg) return tostring(arg) end
        ),
        " "
    )
    self.listeners:forEachValue(function(____, listener)
        listener:onLog(level, message)
    end)
end
function Logger.debug(self, ...)
    self:log(LogLevel.DEBUG, ...)
end
function Logger.info(self, ...)
    self:log(LogLevel.INFO, ...)
end
function Logger.warn(self, ...)
    self:log(LogLevel.WARN, ...)
end
function Logger.error(self, ...)
    self:log(LogLevel.ERROR, ...)
end
Logger.level = LogLevel.DEBUG
Logger.levelMap = __TS__New(Map, {{LogLevel.DEBUG, 0}, {LogLevel.INFO, 1}, {LogLevel.WARN, 2}, {LogLevel.ERROR, 3}})
Logger.listeners = LuaMap:ofSingleton(
    __TS__New(ConsoleLogListener):getName(),
    __TS__New(ConsoleLogListener)
)
return ____exports
 end,
["preBuild.src.util.computer.executionContext"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____luaList = require("preBuild.src.util.types.collection.luaList")
local LuaList = ____luaList.LuaList
--- Represents the execution context for a script or program, including relevant
-- properties and methods for managing its state and resources.
-- s
-- This class provides functionality to handle context-specific data, such as
-- command-line arguments available when the program executes.
____exports.ExecutionContext = __TS__Class()
local ExecutionContext = ____exports.ExecutionContext
ExecutionContext.name = "ExecutionContext"
function ExecutionContext.prototype.____constructor(self)
end
ExecutionContext.commandLineArguments = LuaList:ofTable(COMMAND_LINE_ARGUMENTS)
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.config.infoModel"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.files.fileReadHandle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A utility class for read-handle operations
-- Based on the documentation: https://tweaked.cc/module/fs.html#ty:ReadHandle
____exports.FileReadHandle = __TS__Class()
local FileReadHandle = ____exports.FileReadHandle
FileReadHandle.name = "FileReadHandle"
function FileReadHandle.prototype.____constructor(self, handle)
    self.handle = handle
end
function FileReadHandle.prototype.readBytes(self, count)
    return self.handle.read(count)
end
function FileReadHandle.prototype.readAllContent(self)
    return self.handle.readAll()
end
function FileReadHandle.prototype.readLine(self, includeTrailingNewline)
    if includeTrailingNewline == nil then
        includeTrailingNewline = false
    end
    return self.handle.readLine(includeTrailingNewline)
end
function FileReadHandle.prototype.seekPosition(self, whence, offset)
    if whence == nil then
        whence = "cur"
    end
    if offset == nil then
        offset = 0
    end
    return self.handle.seek(whence, offset)
end
function FileReadHandle.prototype.close(self)
    self.handle.close()
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.files.fileReadWriteHandle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A utility class for read-write handle operations
-- Based on the documentation: https://tweaked.cc/module/fs.html#ty:ReadWriteHandle
____exports.FileReadWriteHandle = __TS__Class()
local FileReadWriteHandle = ____exports.FileReadWriteHandle
FileReadWriteHandle.name = "FileReadWriteHandle"
function FileReadWriteHandle.prototype.____constructor(self, handle)
    self.handle = handle
end
function FileReadWriteHandle.prototype.readBytes(self, count)
    return self.handle.read(count)
end
function FileReadWriteHandle.prototype.readAllContent(self)
    return self.handle.readAll()
end
function FileReadWriteHandle.prototype.readLine(self, includeTrailingNewline)
    if includeTrailingNewline == nil then
        includeTrailingNewline = false
    end
    return self.handle.readLine(includeTrailingNewline)
end
function FileReadWriteHandle.prototype.writeContent(self, content)
    self.handle.write(content)
end
function FileReadWriteHandle.prototype.writeLine(self, text)
    self.handle.writeLine(text)
end
function FileReadWriteHandle.prototype.flushBuffers(self)
    self.handle.flush()
end
function FileReadWriteHandle.prototype.seekPosition(self, whence, offset)
    if whence == nil then
        whence = "cur"
    end
    if offset == nil then
        offset = 0
    end
    return self.handle.seek(whence, offset)
end
function FileReadWriteHandle.prototype.close(self)
    self.handle.close()
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.files.fileWriteHandle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A utility class for write-handle operations
-- Based on the documentation: https://tweaked.cc/module/fs.html#ty:WriteHandle
____exports.FileWriteHandle = __TS__Class()
local FileWriteHandle = ____exports.FileWriteHandle
FileWriteHandle.name = "FileWriteHandle"
function FileWriteHandle.prototype.____constructor(self, handle)
    self.handle = handle
end
function FileWriteHandle.prototype.writeContent(self, content)
    self.handle.write(content)
end
function FileWriteHandle.prototype.writeLine(self, text)
    self.handle.writeLine(text)
end
function FileWriteHandle.prototype.flushBuffers(self)
    self.handle.flush()
end
function FileWriteHandle.prototype.seekPosition(self, whence, offset)
    if whence == nil then
        whence = "cur"
    end
    if offset == nil then
        offset = 0
    end
    return self.handle.seek(whence, offset)
end
function FileWriteHandle.prototype.close(self)
    self.handle.close()
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccFs"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____fileReadHandle = require("preBuild.src.util.computer.api.tier1.types.files.fileReadHandle")
local FileReadHandle = ____fileReadHandle.FileReadHandle
local ____fileReadWriteHandle = require("preBuild.src.util.computer.api.tier1.types.files.fileReadWriteHandle")
local FileReadWriteHandle = ____fileReadWriteHandle.FileReadWriteHandle
local ____fileWriteHandle = require("preBuild.src.util.computer.api.tier1.types.files.fileWriteHandle")
local FileWriteHandle = ____fileWriteHandle.FileWriteHandle
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- Types for the `fs` api in ComputerCraft
-- Based on the documentation: https://tweaked.cc/module/fs.html
-- <br>
-- Features:
-- 1. Clearer TypeScript method and parameter names for available functions
-- 2. Docs included with each function
-- 3. Separation of complex functions into multiple where needed
____exports.CcFs = __TS__Class()
local CcFs = ____exports.CcFs
CcFs.name = "CcFs"
function CcFs.prototype.____constructor(self)
end
function CcFs.completeFileName(self, path, location, includeFiles, includeDirectories)
    if includeFiles == nil then
        includeFiles = true
    end
    if includeDirectories == nil then
        includeDirectories = true
    end
    return fs.complete(path, location, includeFiles, includeDirectories)
end
function CcFs.findFiles(self, path)
    return fs.find(path)
end
function CcFs.isDriveRootDirectory(self, path)
    return fs.isDriveRoot(path)
end
function CcFs.listDirectory(self, path)
    return fs.list(path)
end
function CcFs.combinePath(self, ...)
    local paths = {...}
    local pathsTable = TableUtil:fromArray(paths)
    return fs.combine(table.unpack(pathsTable))
end
function CcFs.getFileName(self, path)
    return fs.getName(path)
end
function CcFs.getDirectoryName(self, path)
    return fs.getDir(path)
end
function CcFs.getFileSize(self, path)
    return fs.getSize(path)
end
function CcFs.fileExists(self, path)
    return fs.exists(path)
end
function CcFs.isDirectory(self, path)
    return fs.isDir(path)
end
function CcFs.isReadOnly(self, path)
    return fs.isReadOnly(path)
end
function CcFs.createDirectory(self, path)
    fs.makeDir(path)
end
function CcFs.move(self, sourcePath, destinationPath)
    fs.move(sourcePath, destinationPath)
end
function CcFs.copy(self, sourcePath, destinationPath)
    fs.copy(sourcePath, destinationPath)
end
function CcFs.delete(self, path)
    fs.delete(path)
end
function CcFs.openFileForReading(self, path)
    local fileHandle = nil
    local errorMessage = nil
    fileHandle, errorMessage = fs.open(path, 'r')
    if errorMessage then
        return Result:error(errorMessage)
    end
    return Result:of(__TS__New(FileReadHandle, fileHandle))
end
function CcFs.openFileForWriting(self, path)
    local fileHandle = nil
    local errorMessage = nil
    fileHandle, errorMessage = fs.open(path, 'w')
    if errorMessage then
        return Result:error(errorMessage)
    end
    return Result:of(__TS__New(FileWriteHandle, fileHandle))
end
function CcFs.openFileForReadAndWrite(self, path)
    local fileHandle = nil
    local errorMessage = nil
    fileHandle, errorMessage = fs.open(path, 'rw')
    if errorMessage then
        return Result:error(errorMessage)
    end
    return Result:of(__TS__New(FileReadWriteHandle, fileHandle))
end
function CcFs.openFileForAppending(self, path)
    local fileHandle = nil
    local errorMessage = nil
    fileHandle, errorMessage = fs.open(path, 'a')
    if errorMessage then
        return Result:error(errorMessage)
    end
    return Result:of(__TS__New(FileWriteHandle, fileHandle))
end
function CcFs.openFileForBinaryReading(self, path)
    local fileHandle = nil
    local errorMessage = nil
    fileHandle, errorMessage = fs.open(path, 'rb')
    if errorMessage then
        return Result:error(errorMessage)
    end
    return Result:of(__TS__New(FileReadHandle, fileHandle))
end
function CcFs.openFileForBinaryWriting(self, path)
    local fileHandle = nil
    local errorMessage = nil
    fileHandle, errorMessage = fs.open(path, 'wb')
    if errorMessage then
        return Result:error(errorMessage)
    end
    return Result:of(__TS__New(FileWriteHandle, fileHandle))
end
function CcFs.getDriveName(self, path)
    return Optional:ofNullable(fs.getDrive(path))
end
function CcFs.getFreeSpaceOnDrive(self, path)
    return fs.getFreeSpace(path)
end
function CcFs.getDriveCapacity(self, path)
    return Optional:ofNullable(fs.getCapacity(path))
end
function CcFs.getFileAttributes(self, path)
    return fs.attributes(path)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.fileUtil"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local ____exports = {}
local ____ccFs = require("preBuild.src.util.computer.api.tier1.globals.ccFs")
local CcFs = ____ccFs.CcFs
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____luaList = require("preBuild.src.util.types.collection.luaList")
local LuaList = ____luaList.LuaList
____exports.FileUtil = __TS__Class()
local FileUtil = ____exports.FileUtil
FileUtil.name = "FileUtil"
function FileUtil.prototype.____constructor(self)
end
function FileUtil.joinPath(self, ...)
    return CcFs:combinePath(...)
end
function FileUtil.getParentDirectoryPath(self, path)
    return CcFs:getDirectoryName(path)
end
function FileUtil.readText(self, path)
    local file = CcFs:openFileForReading(path)
    if file:isError() then
        return Result:error(file:getErrorMessage())
    end
    local handle = file:getValueUnsafe("EC8 - " .. "No file")
    local content = handle:readAllContent()
    handle:close()
    if content == nil then
        return Result:error("Could not read file")
    end
    return Result:of(content)
end
function FileUtil.writeText(self, path, content)
    local directory = self:getParentDirectoryPath(path)
    if not self:exists(directory) then
        self:createDirectory(directory)
    end
    local file = CcFs:openFileForWriting(path)
    if file:isError() then
        return Result:error(file:getErrorMessage())
    end
    local handle = file:getValueUnsafe("EC9 - " .. "No file")
    do
        local function ____catch(e)
            local ____Result_3 = Result
            local ____Result_error_4 = Result.error
            local ____opt_result_2
            if e ~= nil then
                ____opt_result_2 = e.message
            end
            return true, ____Result_error_4(____Result_3, ____opt_result_2)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            handle:writeContent(content)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        do
            handle:close()
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:void()
end
function FileUtil.appendText(self, path, content)
    if not ____exports.FileUtil:exists(path) then
        ____exports.FileUtil:writeText(path, content)
        return Result:void()
    end
    local file = CcFs:openFileForAppending(path)
    if file:isError() then
        return Result:error(file:getErrorMessage())
    end
    local handle = file:getValueUnsafe("EC10 - " .. "No file")
    do
        local function ____catch(e)
            local ____Result_8 = Result
            local ____Result_error_9 = Result.error
            local ____opt_result_7
            if e ~= nil then
                ____opt_result_7 = e.message
            end
            return true, ____Result_error_9(____Result_8, ____opt_result_7)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            handle:writeContent(content)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        do
            handle:close()
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:void()
end
function FileUtil.exists(self, path)
    return CcFs:fileExists(path)
end
function FileUtil.isFile(self, path)
    return self:exists(path) and not CcFs:isDirectory(path)
end
function FileUtil.isDirectory(self, path)
    return self:exists(path) and CcFs:isDirectory(path)
end
function FileUtil.deleteFile(self, path)
    do
        local function ____catch(e)
            local ____Result_13 = Result
            local ____Result_error_14 = Result.error
            local ____opt_result_12
            if e ~= nil then
                ____opt_result_12 = e.message
            end
            return true, ____Result_error_14(____Result_13, ____opt_result_12)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            CcFs:delete(path)
            return true, Result:void()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function FileUtil.copyFile(self, source, destination)
    do
        local function ____catch(e)
            local ____Result_18 = Result
            local ____Result_error_19 = Result.error
            local ____opt_result_17
            if e ~= nil then
                ____opt_result_17 = e.message
            end
            return true, ____Result_error_19(____Result_18, ____opt_result_17)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            CcFs:copy(source, destination)
            return true, Result:void()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function FileUtil.moveFile(self, source, destination)
    do
        local function ____catch(e)
            local ____Result_23 = Result
            local ____Result_error_24 = Result.error
            local ____opt_result_22
            if e ~= nil then
                ____opt_result_22 = e.message
            end
            return true, ____Result_error_24(____Result_23, ____opt_result_22)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            CcFs:move(source, destination)
            return true, Result:void()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function FileUtil.getFileSize(self, path)
    local ____self_25 = ____exports.FileUtil:readText(path)
    return ____self_25["then"](
        ____self_25,
        function(____, content) return #content end
    )
end
function FileUtil.getFiles(self, path)
    return LuaList:ofTable(CcFs:listDirectory(path)):where(function(____, path) return ____exports.FileUtil:isFile(path) end)
end
function FileUtil.getDirectories(self, path)
    return LuaList:ofTable(CcFs:listDirectory(path)):where(function(____, path) return ____exports.FileUtil:isDirectory(path) end)
end
function FileUtil.getAllFilesRecursively(self, path)
    if not self:isDirectory(path) then
        return LuaList:ofSingleton(path)
    end
    local files = LuaList:empty()
    files:appendAll(____exports.FileUtil:getFiles(path))
    ____exports.FileUtil:getDirectories(path):forEach(function(____, directory) return files:appendAll(____exports.FileUtil:getAllFilesRecursively(directory)) end)
    return files
end
function FileUtil.getAllDirectoriesRecursively(self, path)
    if not self:isDirectory(path) then
        return LuaList:empty()
    end
    local directories = LuaList:empty()
    ____exports.FileUtil:getDirectories(path):forEach(function(____, directory)
        directories:append(directory):appendAll(____exports.FileUtil:getAllDirectoriesRecursively(directory))
    end)
    return directories
end
function FileUtil.createDirectory(self, path)
    do
        local function ____catch(e)
            local ____Result_29 = Result
            local ____Result_error_30 = Result.error
            local ____opt_result_28
            if e ~= nil then
                ____opt_result_28 = e.message
            end
            return true, ____Result_error_30(____Result_29, ____opt_result_28)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            CcFs:createDirectory(path)
            return true, Result:void()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function FileUtil.copyDirectory(self, source, destination)
    do
        local function ____catch(e)
            local ____Result_34 = Result
            local ____Result_error_35 = Result.error
            local ____opt_result_33
            if e ~= nil then
                ____opt_result_33 = e.message
            end
            return true, ____Result_error_35(____Result_34, ____opt_result_33)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            CcFs:copy(source, destination)
            return true, Result:void()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function FileUtil.copyDirectoryContent(self, source, destination)
    if not self:isDirectory(source) then
        return Result:error("Source is not a directory")
    end
    if not self:isDirectory(destination) then
        self:createDirectory(destination)
    end
    local errorMessage = nil
    self:getFiles(source):forEach(function(____, file)
        self:copyFile(
            file,
            self:joinPath(
                destination,
                __TS__StringReplace(file, source, "")
            )
        ):ifError(function(____, newMessage)
            errorMessage = newMessage
            return errorMessage
        end)
    end)
    self:getDirectories(source):forEach(function(____, directory)
        self:copyDirectory(
            directory,
            self:joinPath(
                destination,
                __TS__StringReplace(directory, source, "")
            )
        ):ifError(function(____, newMessage)
            errorMessage = newMessage
            return errorMessage
        end)
    end)
    return Result:ofError(nil, errorMessage)
end
function FileUtil.moveDirectory(self, source, destination)
    do
        local function ____catch(e)
            local ____Result_39 = Result
            local ____Result_error_40 = Result.error
            local ____opt_result_38
            if e ~= nil then
                ____opt_result_38 = e.message
            end
            return true, ____Result_error_40(____Result_39, ____opt_result_38)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            CcFs:move(source, destination)
            return true, Result:void()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function FileUtil.deleteDirectory(self, path)
    do
        local function ____catch(e)
            local ____Result_44 = Result
            local ____Result_error_45 = Result.error
            local ____opt_result_43
            if e ~= nil then
                ____opt_result_43 = e.message
            end
            return true, ____Result_error_45(____Result_44, ____opt_result_43)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            CcFs:delete(path)
            return true, Result:void()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function FileUtil.deleteDirectoryContent(self, path)
    if not self:isDirectory(path) then
        return Result:error("Path is not a directory")
    end
    local errorMessage = nil
    self:getFiles(path):forEach(function(____, file)
        self:deleteFile(file):ifError(function(____, newMessage)
            errorMessage = newMessage
            return errorMessage
        end)
    end)
    self:getDirectories(path):forEach(function(____, directory)
        self:deleteDirectory(directory):ifError(function(____, newMessage)
            errorMessage = newMessage
            return errorMessage
        end)
    end)
    return Result:ofError(nil, errorMessage)
end
function FileUtil.removeByteOrderMark(self, path)
    local contentResult = self:readText(path)
    if contentResult:isError() then
        return Result:error(contentResult:getErrorMessage())
    end
    local content = contentResult:getValueUnsafe("EC11 - " .. "No file")
    if not __TS__StringStartsWith(content, "?") then
        return Result:void()
    end
    local newContent = __TS__StringSubstring(content, 1)
    return self:writeText(path, newContent)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccTextUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
--- Adapter for the textutils module, providing text manipulation and formatting utilities.
-- This includes functions for serialization, JSON handling, text formatting, and tabulated output.
-- Based on ComputerCraft's textutils API: https://tweaked.cc/module/textutils.html
____exports.CcTextUtils = __TS__Class()
local CcTextUtils = ____exports.CcTextUtils
CcTextUtils.name = "CcTextUtils"
function CcTextUtils.prototype.____constructor(self)
end
function CcTextUtils.slowWrite(self, text, rate)
    textutils.slowWrite(text, rate)
end
function CcTextUtils.slowPrint(self, text, rate)
    textutils.slowPrint(text, rate)
end
function CcTextUtils.formatTime(self, time, twentyFourHour)
    local result = ""
    result = textutils.formatTime(time, twentyFourHour)
    return result
end
function CcTextUtils.pagedPrint(self, text, freeLines)
    local result = 0
    result = textutils.pagedPrint(text, freeLines)
    return result
end
function CcTextUtils.tabulate(self, ...)
    textutils.tabulate(...)
end
function CcTextUtils.pagedTabulate(self, ...)
    textutils.pagedTabulate(...)
end
function CcTextUtils.serialize(self, obj, opts)
    local result = nil
    local errorMessage = nil
    result, errorMessage = textutils.serialize(obj, opts)
    if errorMessage ~= nil then
        return Result:error(errorMessage)
    end
    return Result:of(result)
end
function CcTextUtils.unserialize(self, str)
    local result = nil
    result = textutils.unserialize(str)
    if result == nil then
        return Result:error("Failed to unserialize")
    end
    return Result:of(result)
end
function CcTextUtils.serializeJSON(self, obj, opts)
    local result = nil
    local errorMessage = nil
    result, errorMessage = textutils.serializeJSON(obj, opts)
    if errorMessage ~= nil then
        return Result:error(errorMessage)
    end
    return Result:of(result)
end
function CcTextUtils.unserializeJSON(self, str, opts)
    local result = nil
    local errorMessage = nil
    result, errorMessage = textutils.unserializeJSON(str, opts)
    if errorMessage ~= nil then
        return Result:error(errorMessage)
    end
    return Result:of(result)
end
function CcTextUtils.urlEncode(self, str)
    local result = ""
    result = textutils.urlEncode(str)
    return result
end
function CcTextUtils.getCompletion(self, searchText, searchTable)
    local result = {}
    result = textutils.complete(searchText, searchTable)
    return result
end
CcTextUtils.empty_json_array = {}
CcTextUtils.json_null = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.config.info"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____fileUtil = require("preBuild.src.util.computer.api.tier2.fileUtil")
local FileUtil = ____fileUtil.FileUtil
local ____ccTextUtils = require("preBuild.src.util.computer.api.tier1.globals.ccTextUtils")
local CcTextUtils = ____ccTextUtils.CcTextUtils
--- This allows access to the readonly information stored in `info.json`
____exports.Info = __TS__Class()
local Info = ____exports.Info
Info.name = "Info"
function Info.prototype.____constructor(self, model)
    self.version = model.version
    self.name = model.name
    self.description = model.description
    self.startup = model.startup
    self.deployment = model.deployment
    self.logging = model.logging
    self.lifetime = model.lifetime
end
function Info.load(self)
    local contentString = FileUtil:readText(self._path):getValueUnsafe("EC15 - " .. "Could not read info.json")
    local content = CcTextUtils:unserializeJSON(contentString):getValueUnsafe("EC16 - " .. "Could not parse info.json")
    return __TS__New(____exports.Info, content)
end
Info._path = "info.json"
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.logging.listeners.fileLogListener"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____fileUtil = require("preBuild.src.util.computer.api.tier2.fileUtil")
local FileUtil = ____fileUtil.FileUtil
local ____logListener = require("preBuild.src.util.computer.api.tier2.logging.logListener")
local LogListener = ____logListener.LogListener
____exports.FileLogListener = __TS__Class()
local FileLogListener = ____exports.FileLogListener
FileLogListener.name = "FileLogListener"
__TS__ClassExtends(FileLogListener, LogListener)
function FileLogListener.prototype.getName(self)
    return "FileLogListener"
end
function FileLogListener.prototype.onLog(self, level, message)
    FileUtil:appendText(____exports.FileLogListener.LOG_PATH, ((("[" .. level) .. "] ") .. message) .. "\n")
end
FileLogListener.LOG_PATH = "app/logs/main.log"
return ____exports
 end,
["preBuild.src.util.reflection"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____luaMap = require("preBuild.src.util.types.collection.luaMap")
local LuaMap = ____luaMap.LuaMap
____exports.Reflection = __TS__Class()
local Reflection = ____exports.Reflection
Reflection.name = "Reflection"
function Reflection.prototype.____constructor(self)
end
function Reflection.getFields(self, ____table)
    local fields = LuaMap:empty()
    local k = ""
    local v = nil
    for k, v in pairs(table) do
        if type(v) ~= 'function' then
            fields[k] = v
        end
    end
    return fields
end
function Reflection.getField(self, ____table, name)
    if type(table) ~= 'table' then
        return Result:error(("'" .. tostring(____table)) .. "' is not a table")
    end
    local value = table[name]
    if value == nil or value == nil then
        return Result:error(((("'" .. name) .. "' is not a field of '") .. tostring(____table)) .. "'")
    end
    return Result:of(value)
end
function Reflection.getMethod(self, ____table, name)
    return self:getMethods(____table):get(name):toResult(((("'" .. name) .. "' is not a method of '") .. tostring(____table)) .. "'")
end
function Reflection.getMethods(self, ____table)
    local methods = LuaMap:empty()
    local k = ""
    local function v()
    end
    for k, v in pairs(table) do
        if type(v) == 'function' then
    methods:set(
        k,
        function(____, ...) return v(nil, ____table, ...) end
    )
        end
    end
    return methods
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.http.request.httpRequestOptions"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.http.urlCheckResult"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.http.websocket"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.http.response.httpResponseCode"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.http.response.httpResponseHeaders"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.http.response.httpResponse"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____fileReadHandle = require("preBuild.src.util.computer.api.tier1.types.files.fileReadHandle")
local FileReadHandle = ____fileReadHandle.FileReadHandle
--- Represents an HTTP response in ComputerCraft.
-- Extends FileReadHandle to provide access to the response body data.
____exports.HttpResponse = __TS__Class()
local HttpResponse = ____exports.HttpResponse
HttpResponse.name = "HttpResponse"
__TS__ClassExtends(HttpResponse, FileReadHandle)
function HttpResponse.prototype.getResponseCode(self)
    return self.handle.getResponseCode()
end
function HttpResponse.prototype.getResponseHeaders(self)
    return self.handle.getResponseHeaders()
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.http.request.httpRequest"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccHttp"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____httpResponse = require("preBuild.src.util.computer.api.tier1.types.http.response.httpResponse")
local HttpResponse = ____httpResponse.HttpResponse
--- Adapter for the http module
-- 
-- This class provides a wrapper around the http module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/http.html#ty:Request
____exports.CcHttp = __TS__Class()
local CcHttp = ____exports.CcHttp
CcHttp.name = "CcHttp"
function CcHttp.prototype.____constructor(self)
end
function CcHttp.get(self, urlOrOptions, headers, binary)
    local successResponse = nil
    local errorMessage = nil
    local errorResponse = nil
    successResponse, errorMessage, errorResponse = http.get(urlOrOptions, headers, binary)
    if successResponse == nil then
        return Result:errorValue(
            __TS__New(HttpResponse, errorResponse),
            errorMessage or "Unknown error"
        )
    end
    return Result:of(__TS__New(HttpResponse, successResponse))
end
function CcHttp.post(self, urlOrOptions, body, headers, binary)
    local successResponse = nil
    local errorMessage = nil
    local errorResponse = nil
    successResponse, errorMessage, errorResponse = http.post(urlOrOptions, body, headers, binary)
    if successResponse == nil then
        return Result:errorValue(
            __TS__New(HttpResponse, errorResponse),
            errorMessage or "Unknown error"
        )
    end
    return Result:of(__TS__New(HttpResponse, successResponse))
end
function CcHttp.request(self, urlOrOptions, body, headers, binary)
    http.request(urlOrOptions, body, headers, binary)
end
function CcHttp.requestByObject(self, request)
    http.requestByObject(request)
end
function CcHttp.checkURLAsync(self, url)
    local isValid = false
    local reason = nil
    isValid, reason = http.checkURLAsync(url)
    return {isValid = isValid, reason = reason}
end
function CcHttp.checkURL(self, url)
    local isValid = false
    local reason = nil
    isValid, reason = http.checkURL(url)
    return {isValid = isValid, reason = reason}
end
function CcHttp.websocketAsync(self, urlOrOptions, headers)
    http.websocketAsync(urlOrOptions, headers)
end
function CcHttp.websocket(self, urlOrOptions, headers)
    local websocket = false
    local errorMessage = nil
    websocket, errorMessage = http.websocket(urlOrOptions, headers)
    if websocket == false then
        return Result:error(errorMessage or "Unknown error")
    end
    return Result:of(websocket)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.externalApi.discord.discordWebhook"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local ____exports = {}
local ____ccHttp = require("preBuild.src.util.computer.api.tier1.globals.ccHttp")
local CcHttp = ____ccHttp.CcHttp
local ____ccTextUtils = require("preBuild.src.util.computer.api.tier1.globals.ccTextUtils")
local CcTextUtils = ____ccTextUtils.CcTextUtils
____exports.DiscordWebhook = __TS__Class()
local DiscordWebhook = ____exports.DiscordWebhook
DiscordWebhook.name = "DiscordWebhook"
function DiscordWebhook.prototype.____constructor(self, username, url)
    self._username = username
    self._url = url
end
function DiscordWebhook.fromUrl(self, username, url)
    return __TS__New(____exports.DiscordWebhook, username, url)
end
function DiscordWebhook.prototype.sendWebhookData(self, data)
    CcHttp:post(
        self._url,
        CcTextUtils:serializeJSON(data):getValueUnsafe("EC17 - " .. "Could not serialize POST data for Discord webhook")
    )
end
function DiscordWebhook.prototype.sendMessage(self, message)
end
function DiscordWebhook.prototype.sendEmbed(self, embeds)
    local ____self_sendWebhookData_2 = self.sendWebhookData
    local ____self__username_1 = self._username
    local ____Array_isArray_result_0
    if __TS__ArrayIsArray(embeds) then
        ____Array_isArray_result_0 = embeds
    else
        ____Array_isArray_result_0 = {embeds}
    end
    ____self_sendWebhookData_2(self, {username = ____self__username_1, embeds = ____Array_isArray_result_0})
end
DiscordWebhook.DISCORD_MESSAGE_LENGTH_LIMIT = 2000
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.environment"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local ____exports = {}
local ____luaMap = require("preBuild.src.util.types.collection.luaMap")
local LuaMap = ____luaMap.LuaMap
local ____fileUtil = require("preBuild.src.util.computer.api.tier2.fileUtil")
local FileUtil = ____fileUtil.FileUtil
--- Represents an environment that manages and interacts with environment
-- variables in ComputerCraft. This utility can be used to
-- handle operations concerning environmental properties or variables
-- within a specific execution context.
____exports.Environment = __TS__Class()
local Environment = ____exports.Environment
Environment.name = "Environment"
function Environment.prototype.____constructor(self)
end
function Environment.get(self, key)
    local result = self:load():get(key)
    if result:isEmpty() then
        self:set(key, "")
    end
    return result
end
function Environment.set(self, key, value)
    if not FileUtil:exists(self._path) then
        FileUtil:writeText(self._path, ""):getValueUnsafe("EC3")
    end
    local content = FileUtil:readText(self._path):getValueUnsafe("EC4 - " .. "Could not read from .env file")
    content = content .. (("\n" .. key) .. "=") .. value
    FileUtil:writeText(self._path, content):getValueUnsafe("EC5 - " .. "Could not write to .env file")
end
function Environment.load(self)
    if not FileUtil:exists(self._path) then
        FileUtil:writeText(self._path, ""):getValueUnsafe("EC6")
    end
    local content = FileUtil:readText(self._path):getValueUnsafe("EC7 - " .. "Could not read from .env file")
    local lines = __TS__StringSplit(content, "\n")
    local output = LuaMap:empty()
    __TS__ArrayForEach(
        lines,
        function(____, line)
            if __TS__StringStartsWith(line, "#") then
                return
            end
            if __TS__StringTrim(line) == "" then
                return
            end
            if not __TS__StringIncludes(line, "=") then
                return
            end
            local key, value = __TS__Unpack(__TS__StringSplit(line, "=", 2))
            output:set(key, value)
        end
    )
    return output
end
Environment._path = "app/data/.env"
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.logging.listeners.discordWebhookLogListener"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____logListener = require("preBuild.src.util.computer.api.tier2.logging.logListener")
local LogListener = ____logListener.LogListener
local ____discordWebhook = require("preBuild.src.util.computer.api.tier2.externalApi.discord.discordWebhook")
local DiscordWebhook = ____discordWebhook.DiscordWebhook
local ____environment = require("preBuild.src.util.computer.api.tier2.environment")
local Environment = ____environment.Environment
____exports.DiscordWebhookLogListener = __TS__Class()
local DiscordWebhookLogListener = ____exports.DiscordWebhookLogListener
DiscordWebhookLogListener.name = "DiscordWebhookLogListener"
__TS__ClassExtends(DiscordWebhookLogListener, LogListener)
function DiscordWebhookLogListener.prototype.getName(self)
    return "DiscordWebhookLogListener"
end
function DiscordWebhookLogListener.prototype.onLog(self, level, message)
    ____exports.DiscordWebhookLogListener._webhook:sendMessage((("[" .. level) .. "] ") .. message)
end
DiscordWebhookLogListener._webhook = DiscordWebhook:fromUrl(
    "ComputerCraft",
    Environment:get("DISCORD_WEBHOOK_URL"):getValueUnsafe("EC18 - " .. "Failed to get `DISCORD_WEBHOOK_URL` from environment")
)
return ____exports
 end,
["preBuild.src.util.computer.entrypoint.entrypoint"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
local ____luaMap = require("preBuild.src.util.types.collection.luaMap")
local LuaMap = ____luaMap.LuaMap
local ____logger = require("preBuild.src.util.computer.api.tier2.logging.logger")
local Logger = ____logger.Logger
local ____executionContext = require("preBuild.src.util.computer.executionContext")
local ExecutionContext = ____executionContext.ExecutionContext
local ____info = require("preBuild.src.util.computer.api.tier2.config.info")
local Info = ____info.Info
local ____fileLogListener = require("preBuild.src.util.computer.api.tier2.logging.listeners.fileLogListener")
local FileLogListener = ____fileLogListener.FileLogListener
local ____reflection = require("preBuild.src.util.reflection")
local Reflection = ____reflection.Reflection
local ____discordWebhookLogListener = require("preBuild.src.util.computer.api.tier2.logging.listeners.discordWebhookLogListener")
local DiscordWebhookLogListener = ____discordWebhookLogListener.DiscordWebhookLogListener
--- Abstract base class representing an application entry point.
-- Provides functionality for registering and dispatching routes, as well as lifecycle hooks for application startup, shutdown, and error handling.
-- Classes extending this should implement abstract methods and optionally override other lifecycle methods to define specific behavior.
____exports.Entrypoint = __TS__Class()
local Entrypoint = ____exports.Entrypoint
Entrypoint.name = "Entrypoint"
function Entrypoint.prototype.____constructor(self)
    self._routes = LuaMap:empty()
end
function Entrypoint.prototype.run(self)
    self:applyInfoConfig()
    self:registerRoutes()
    self:onStart()
    do
        local function ____catch(cause)
            self:onCrash(cause)
        end
        local ____try, ____hasReturned = pcall(function()
            self:dispatchRoute()
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    self:onStop()
end
function Entrypoint.prototype.applyInfoConfig(self)
    local info = Info:load()
    local ____opt_0 = info.logging
    if ____opt_0 and ____opt_0.level then
        Logger.level = info.logging.level
    end
    local ____opt_2 = info.logging
    if ____opt_2 and ____opt_2.writeToFile then
        Logger:addListener(__TS__New(FileLogListener))
    end
    local ____opt_4 = info.logging
    if ____opt_4 and ____opt_4.writeToDiscord then
        Logger:addListener(__TS__New(DiscordWebhookLogListener))
    end
end
function Entrypoint.prototype.registerRoutes(self)
    Reflection:getMethods(self):whereKeys(function(____, key) return __TS__StringStartsWith(key, "route") end):selectKeys(function(____, key) return string.lower(__TS__StringReplace(key, "route", "")) end):forEach(function(____, name, route) return self:registerRoute(name, route) end)
end
function Entrypoint.prototype.registerRoute(self, name, callback)
    self._routes:set(name, callback)
end
function Entrypoint.prototype.dispatchRoute(self)
    local targetRouteName = ExecutionContext.commandLineArguments:first():getValueUnsafe("EC19 - " .. "The first command line argument (route name) was not provided")
    self._routes:get(targetRouteName):ifEmpty(function()
        local validRouteNamesString = ("'" .. self._routes:keys():join("', '")) .. "'"
        error(
            __TS__New(Error, (("Unknown route: " .. targetRouteName) .. "\nThe first argument must be a valid route name.\nE.g. ") .. validRouteNamesString),
            0
        )
    end):ifPresent(function(____, routeFunction) return routeFunction(nil) end)
end
function Entrypoint.prototype.onCrash(self, cause)
    error(cause, 0)
end
return ____exports
 end,
["preBuild.src.entrypoints.example.entrypoint"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____chatBox = require("preBuild.src.util.computer.api.tier1.advancedPeripherals.chatBox")
local ChatBox = ____chatBox.ChatBox
local ____luaList = require("preBuild.src.util.types.collection.luaList")
local LuaList = ____luaList.LuaList
local ____entrypoint = require("preBuild.src.util.computer.entrypoint.entrypoint")
local Entrypoint = ____entrypoint.Entrypoint
local ____logger = require("preBuild.src.util.computer.api.tier2.logging.logger")
local Logger = ____logger.Logger
____exports.ExampleEntrypoint = __TS__Class()
local ExampleEntrypoint = ____exports.ExampleEntrypoint
ExampleEntrypoint.name = "ExampleEntrypoint"
__TS__ClassExtends(ExampleEntrypoint, Entrypoint)
function ExampleEntrypoint.prototype.onStart(self)
end
function ExampleEntrypoint.prototype.onStop(self)
end
function ExampleEntrypoint.prototype.routeRun(self)
    Logger:info("First")
    local list = LuaList:ofSingleton(11):append(22):append(44):append(33)
    Logger:debug(list)
    ChatBox:sendMessage("Hello World!")
    Logger:warn("Last")
end
__TS__New(____exports.ExampleEntrypoint):run()
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccShell"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- The shell API provides access to CraftOS's command line interface.
-- 
-- Based on the documentation: https://tweaked.cc/module/shell.html
____exports.CcShell = __TS__Class()
local CcShell = ____exports.CcShell
CcShell.name = "CcShell"
function CcShell.prototype.____constructor(self)
end
function CcShell.execute(self, command, ...)
    local args = {...}
    local argsTable = TableUtil:fromArray(args)
    local success = false
    success = shell.execute(command, table.unpack(argsTable))
    return Result:of(success)
end
function CcShell.run(self, command, ...)
    local args = {...}
    local argsTable = TableUtil:fromArray(args)
    local success = false
    success = shell.run(command, table.unpack(argsTable))
    return Result:of(success)
end
function CcShell.exit(self)
    shell.exit()
end
function CcShell.getCurrentWorkingDirectory(self)
    local currentDir = ""
    currentDir = shell.dir()
    return currentDir
end
function CcShell.setCurrentWorkingDirectory(self, dir)
    local success = true
    local errorMessage = nil
    local success, errorMessage = pcall(function()
        shell.setDir(dir)
    end)
    local ____success_0
    if success then
        ____success_0 = Result:void()
    else
        ____success_0 = Result:error(errorMessage or "Unknown error")
    end
    return ____success_0
end
function CcShell.getPath(self)
    local currentPath = ""
    currentPath = shell.path()
    return currentPath
end
function CcShell.setPath(self, path)
    shell.setPath(path)
end
function CcShell.getAbsolutePath(self, path)
    local resolvedPath = ""
    resolvedPath = shell.resolve(path)
    return resolvedPath
end
function CcShell.resolveProgramPath(self, command)
    local programPath
    programPath = shell.resolveProgram(command)
    return Optional:ofNullable(programPath)
end
function CcShell.getProgramList(self, includeHidden)
    local programs = {}
    local progs = shell.programs(includeHidden)
    for i = 1, #progs do
        programs[i] = progs[i]
    end
    return programs
end
function CcShell.getCompletions(self, sLine)
    local completions = shell.complete(sLine)
    return Optional:ofNullable(completions):getValueOrDefault({})
end
function CcShell.getCompletionsForProgramName(self, program)
    local completions = {}
    local comps = shell.completeProgram(program)
    for i = 1, #comps do
        completions[i] = comps[i]
    end
    return completions
end
function CcShell.setCompletionFunction(self, program, complete)
    shell.setCompletionFunction(program, complete)
end
function CcShell.getCompletionInfo(self)
    local info = {}
    local compInfo = shell.getCompletionInfo()
    for k,v in pairs(compInfo) do
        info[k] = v
    end
    return info
end
function CcShell.getPathToRunningProgram(self)
    local programPath = ""
    programPath = shell.getRunningProgram()
    return programPath
end
function CcShell.setAlias(self, command, program)
    shell.setAlias(command, program)
end
function CcShell.clearAlias(self, command)
    shell.clearAlias(command)
end
function CcShell.aliases(self)
    local aliases = {}
    local als = shell.aliases()
    for k,v in pairs(als) do
        aliases[k] = v
    end
    return aliases
end
function CcShell.openTab(self, command, ...)
    local args = {...}
    local argsTable = TableUtil:fromArray(args)
    local tabId = nil
    tabId = shell.openTab(command, table.unpack(argsTable))
    local ____temp_1
    if tabId ~= nil then
        ____temp_1 = Result:of(tabId)
    else
        ____temp_1 = Result:error("Failed to open tab")
    end
    return ____temp_1
end
function CcShell.switchTab(self, id)
    shell.switchTab(id)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier2.config.config"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____fileUtil = require("preBuild.src.util.computer.api.tier2.fileUtil")
local FileUtil = ____fileUtil.FileUtil
local ____ccTextUtils = require("preBuild.src.util.computer.api.tier1.globals.ccTextUtils")
local CcTextUtils = ____ccTextUtils.CcTextUtils
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
____exports.Config = __TS__Class()
local Config = ____exports.Config
Config.name = "Config"
function Config.prototype.____constructor(self, data)
    self.data = data
end
function Config.load(self)
    if not FileUtil:exists(self._configPath) then
        FileUtil:writeText(self._configPath, "{}")
    end
    local contentString = FileUtil:readText(self._configPath)
    if contentString:isError() then
        return Result:error(contentString:getErrorMessage())
    end
    local content = CcTextUtils:unserializeJSON(contentString:getValueUnsafe("EC12 - " .. "Could not read config.json"))
    if content:isError() then
        error(
            __TS__New(
                Error,
                content:getErrorMessage()
            ),
            0
        )
    end
    return Result:of(__TS__New(
        ____exports.Config,
        content:getValueUnsafe("EC13 - " .. "Could not parse config.json")
    ))
end
function Config.create(self, data)
    local config = __TS__New(____exports.Config, data)
    local saved = config:save()
    if saved:isError() then
        return Result:error(saved:getErrorMessage())
    end
    return Result:of(config)
end
function Config.prototype.save(self)
    local contentString = CcTextUtils:serializeJSON(self.data)
    if contentString:isError() then
        return Result:error(contentString:getErrorMessage())
    end
    local result = FileUtil:writeText(
        ____exports.Config._configPath,
        contentString:getValueUnsafe("EC14 - " .. "Could not serialize config.json")
    )
    if result:isError() then
        return Result:error(result:getErrorMessage())
    end
    return Result:void()
end
Config._configPath = "app/data/config.json"
return ____exports
 end,
["preBuild.src.entrypoints.gps.gpsConfig"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.entrypoints.gps.entrypoint"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____ccShell = require("preBuild.src.util.computer.api.tier1.globals.ccShell")
local CcShell = ____ccShell.CcShell
local ____config = require("preBuild.src.util.computer.api.tier2.config.config")
local Config = ____config.Config
local ____entrypoint = require("preBuild.src.util.computer.entrypoint.entrypoint")
local Entrypoint = ____entrypoint.Entrypoint
local ____logger = require("preBuild.src.util.computer.api.tier2.logging.logger")
local Logger = ____logger.Logger
local GpsEntrypoint = __TS__Class()
GpsEntrypoint.name = "GpsEntrypoint"
__TS__ClassExtends(GpsEntrypoint, Entrypoint)
function GpsEntrypoint.prototype.onStart(self)
end
function GpsEntrypoint.prototype.onStop(self)
end
function GpsEntrypoint.prototype.routeRun(self)
    Logger:debug("Running GPS entrypoint 'run' route")
    local config = Config:load():getValueUnsafe("EC1")
    Logger:debug("Extracting key values from config")
    local ____opt_0 = config.data
    local x = ____opt_0 and ____opt_0.x or 0
    local ____opt_2 = config.data
    local y = ____opt_2 and ____opt_2.y or 0
    local ____opt_4 = config.data
    local z = ____opt_4 and ____opt_4.z or 0
    Logger:debug((((("Config for 'run' route: x=" .. tostring(x)) .. ", y=") .. tostring(y)) .. ", z=") .. tostring(z))
    CcShell:run(
        "gps",
        "host",
        x,
        y,
        z
    )
    Logger:debug("GPS entrypoint 'run' route finished")
end
__TS__New(GpsEntrypoint):run()
return ____exports
 end,
["preBuild.src.util.computer.test.assert"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
____exports.Assert = __TS__Class()
local Assert = ____exports.Assert
Assert.name = "Assert"
function Assert.prototype.____constructor(self)
end
function Assert.fail(self, message)
    error(
        __TS__New(Error, message),
        0
    )
end
function Assert.pass(self, reason)
end
return ____exports
 end,
["preBuild.src.util.computer.test.testInfo"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.test.testResult"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.test.test"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local ____exports = {}
local ____reflection = require("preBuild.src.util.reflection")
local Reflection = ____reflection.Reflection
local ____logger = require("preBuild.src.util.computer.api.tier2.logging.logger")
local Logger = ____logger.Logger
____exports.Test = __TS__Class()
local Test = ____exports.Test
Test.name = "Test"
function Test.prototype.____constructor(self)
end
function Test.prototype.run(self)
    local name = self:getTestInfo().name
    Logger:info((" * Running '" .. name) .. "'...'")
    Logger:debug("   - Before All")
    self:beforeAll()
    Logger:debug("   - Running Tests")
    local results = self:gatherTestCases():entries():select(function(____, entry) return self:runTestCase(
        entry:getKey(),
        entry:getValue()
    ) end)
    Logger:debug("   - After All")
    self:afterAll()
    local passed = results:where(function(____, result) return not result.passed end)
    local failed = results:where(function(____, result) return result.passed end)
    Logger:info((((((" * '" .. name) .. "' ") .. tostring(passed:size())) .. "/") .. tostring(results:size())) .. " passed")
    passed:forEach(function(____, result) return Logger:debug((("PASS " .. result.name) .. ": ") .. result.message) end)
    failed:forEach(function(____, result) return Logger:error((("FAIL " .. result.name) .. ": ") .. result.message) end)
    return results
end
function Test.prototype.gatherTestCases(self)
    return Reflection:getMethods(self):whereKeys(function(____, key) return __TS__StringStartsWith(key, "test") end):selectKeys(function(____, key) return string.lower(__TS__StringReplace(key, "test", "")) end)
end
function Test.prototype.runTestCase(self, name, test)
    self:beforeEach()
    do
        local function ____catch(cause)
            print((("Test \"" .. name) .. "\" failed: ") .. tostring(cause))
            return true, {
                name = name,
                passed = false,
                message = tostring(cause)
            }
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            test(nil)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    self:afterEach()
    return {name = name, passed = true, message = "All checks passed"}
end
function Test.prototype.beforeAll(self)
end
function Test.prototype.afterAll(self)
end
function Test.prototype.beforeEach(self)
end
function Test.prototype.afterEach(self)
end
return ____exports
 end,
["preBuild.src.entrypoints.tests.tests.exampleTest"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____assert = require("preBuild.src.util.computer.test.assert")
local Assert = ____assert.Assert
local ____test = require("preBuild.src.util.computer.test.test")
local Test = ____test.Test
____exports.ExampleTest = __TS__Class()
local ExampleTest = ____exports.ExampleTest
ExampleTest.name = "ExampleTest"
__TS__ClassExtends(ExampleTest, Test)
function ExampleTest.prototype.getTestInfo(self)
    return {name = "ExampleTest", description = "An example of how tests could be defined"}
end
function ExampleTest.prototype.testFirstExample(self)
    print("First example test running!")
    Assert:fail("This test should fail")
end
function ExampleTest.prototype.testSecondExampleShouldPass(self)
    print("Second example test running!")
    Assert:pass("This test should pass as it does nothing and is an example.")
end
return ____exports
 end,
["preBuild.src.entrypoints.tests.entrypoint"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____exampleTest = require("preBuild.src.entrypoints.tests.tests.exampleTest")
local ExampleTest = ____exampleTest.ExampleTest
local ____entrypoint = require("preBuild.src.util.computer.entrypoint.entrypoint")
local Entrypoint = ____entrypoint.Entrypoint
local ____luaList = require("preBuild.src.util.types.collection.luaList")
local LuaList = ____luaList.LuaList
local ____logger = require("preBuild.src.util.computer.api.tier2.logging.logger")
local Logger = ____logger.Logger
local TestsEntrypoint = __TS__Class()
TestsEntrypoint.name = "TestsEntrypoint"
__TS__ClassExtends(TestsEntrypoint, Entrypoint)
function TestsEntrypoint.prototype.____constructor(self, ...)
    Entrypoint.prototype.____constructor(self, ...)
    self._tests = LuaList:of({__TS__New(ExampleTest)})
end
function TestsEntrypoint.prototype.onStart(self)
end
function TestsEntrypoint.prototype.onStop(self)
end
function TestsEntrypoint.prototype.routeRun(self)
    Logger:info("Running Tests...")
    local results = self._tests:select(function(____, test) return test:run() end):flatten()
    local passed = results:where(function(____, result) return result.passed end)
    local failed = results:where(function(____, result) return not result.passed end)
    Logger:info("\n\nTests Finished")
    Logger:info("--------------------")
    Logger:info("Total  :  " .. tostring(results:size()))
    Logger:info("Pass   :  " .. tostring(passed:size()))
    Logger:info("Fail   :  " .. tostring(failed:size()))
end
__TS__New(TestsEntrypoint):run()
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.arController"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the AR Controller peripheral from the Advanced Peripherals mod.
-- Controls AR Goggles to display overlays in the player's view.
____exports.ArController = __TS__Class()
local ArController = ____exports.ArController
ArController.name = "ArController"
function ArController.prototype.____constructor(self)
end
function ArController.clear(self)
    return ArController._internalController.clear()
end
function ArController.clearElement(self, id)
    return ArController._internalController.clearElement(id)
end
function ArController.horizontalLine(self, minX, maxX, y, color)
    return ArController._internalController.horizontalLine(minX, maxX, y, color)
end
function ArController.horizontalLineWithId(self, id, minX, maxX, y, color)
    return ArController._internalController.horizontalLineWithId(id, minX, maxX, y, color)
end
function ArController.verticalLine(self, x, minY, maxY, color)
    return ArController._internalController.verticalLine(x, minY, maxY, color)
end
function ArController.verticalLineWithId(self, id, x, minY, maxY, color)
    return ArController._internalController.verticalLineWithId(id, x, minY, maxY, color)
end
function ArController.drawString(self, text, x, y, color)
    return ArController._internalController.drawString(text, x, y, color)
end
function ArController.drawStringWithId(self, id, text, x, y, color)
    return ArController._internalController.drawStringWithId(id, text, x, y, color)
end
function ArController.drawCenteredString(self, text, x, y, color)
    return ArController._internalController.drawCenteredString(text, x, y, color)
end
function ArController.drawCenteredStringWithId(self, id, text, x, y, color)
    return ArController._internalController.drawCenteredStringWithId(id, text, x, y, color)
end
function ArController.drawRightboundString(self, text, x, y, color)
    return ArController._internalController.drawRightboundString(text, x, y, color)
end
function ArController.drawRightboundStringWithId(self, id, text, x, y, color)
    return ArController._internalController.drawRightboundStringWithId(id, text, x, y, color)
end
function ArController.drawItemIcon(self, itemId, x, y)
    return ArController._internalController.drawItemIcon(itemId, x, y)
end
function ArController.drawItemIconWithId(self, id, itemId, x, y)
    return ArController._internalController.drawItemIconWithId(id, itemId, x, y)
end
function ArController.drawCircle(self, x, y, radius, color)
    return ArController._internalController.drawCircle(x, y, radius, color)
end
function ArController.drawCircleWithId(self, id, x, y, radius, color)
    return ArController._internalController.drawCircleWithId(id, x, y, radius, color)
end
function ArController.fill(self, minX, minY, maxX, maxY, color)
    return ArController._internalController.fill(minX, minY, maxX, maxY, color)
end
function ArController.fillWithId(self, id, minX, minY, maxX, maxY, color)
    return ArController._internalController.fillWithId(id, minX, minY, maxX, maxY, color)
end
function ArController.fillCircle(self, x, y, radius, color)
    return ArController._internalController.fillCircle(x, y, radius, color)
end
function ArController.fillCircleWithId(self, id, x, y, radius, color)
    return ArController._internalController.fillCircleWithId(id, x, y, radius, color)
end
function ArController.fillGradient(self, minX, minY, maxX, maxY, colorFrom, colorTo)
    return ArController._internalController.fillGradient(minX, minY, maxX, maxY, colorFrom, colorTo)
end
function ArController.fillGradientWithId(self, id, minX, minY, maxX, maxY, colorFrom, colorTo)
    return ArController._internalController.fillGradientWithId(id, minX, minY, maxX, maxY, colorFrom, colorTo)
end
function ArController.isRelativeMode(self)
    return ArController._internalController.isRelativeMode()
end
function ArController.setRelativeMode(self, enabled, virtualScreenWidth, virtualScreenHeight)
    return ArController._internalController.setRelativeMode(enabled, virtualScreenWidth, virtualScreenHeight)
end
ArController._internalController = CcPeripheral:find("arController")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.colonyIntegrator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Colony Integrator peripheral from the Advanced Peripherals mod.
-- Provides interaction with MineColonies colony functionality.
____exports.ColonyIntegrator = __TS__Class()
local ColonyIntegrator = ____exports.ColonyIntegrator
ColonyIntegrator.name = "ColonyIntegrator"
function ColonyIntegrator.prototype.____constructor(self)
end
function ColonyIntegrator.getCitizens(self)
    return ColonyIntegrator._internalIntegrator.getCitizens()
end
function ColonyIntegrator.getBuildings(self)
    return ColonyIntegrator._internalIntegrator.getBuildings()
end
function ColonyIntegrator.getId(self)
    return ColonyIntegrator._internalIntegrator.getColonyID()
end
function ColonyIntegrator.getName(self)
    return ColonyIntegrator._internalIntegrator.getColonyName()
end
function ColonyIntegrator.isActive(self)
    return ColonyIntegrator._internalIntegrator.isActive()
end
function ColonyIntegrator.isUnderAttack(self)
    return ColonyIntegrator._internalIntegrator.isUnderAttack()
end
function ColonyIntegrator.isInColony(self)
    return ColonyIntegrator._internalIntegrator.isInColony()
end
function ColonyIntegrator.getCitizenCount(self)
    return ColonyIntegrator._internalIntegrator.amountOfCitizens()
end
function ColonyIntegrator.getMaxCitizens(self)
    return ColonyIntegrator._internalIntegrator.maxOfCitizens()
end
ColonyIntegrator._internalIntegrator = CcPeripheral:find("colonyIntegrator")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.environmentDetector"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Environment Detector peripheral from the Advanced Peripherals mod.
-- Allows querying environmental data like biome, light levels, moon phase, weather, dimension info, and more.
____exports.EnvironmentDetector = __TS__Class()
local EnvironmentDetector = ____exports.EnvironmentDetector
EnvironmentDetector.name = "EnvironmentDetector"
function EnvironmentDetector.prototype.____constructor(self)
end
function EnvironmentDetector.getBiome(self)
    return EnvironmentDetector._internalDetector.getBiome()
end
function EnvironmentDetector.getBlockLightLevel(self)
    return EnvironmentDetector._internalDetector.getBlockLightLevel()
end
function EnvironmentDetector.getDayLightLevel(self)
    return EnvironmentDetector._internalDetector.getDayLightLevel()
end
function EnvironmentDetector.getSkyLightLevel(self)
    return EnvironmentDetector._internalDetector.getSkyLightLevel()
end
function EnvironmentDetector.getDimensionName(self)
    return EnvironmentDetector._internalDetector.getDimensionName()
end
function EnvironmentDetector.getDimensionPaN(self)
    return EnvironmentDetector._internalDetector.getDimensionPaN()
end
function EnvironmentDetector.getDimensionProvider(self)
    return EnvironmentDetector._internalDetector.getDimensionProvider()
end
function EnvironmentDetector.getMoonId(self)
    return EnvironmentDetector._internalDetector.getMoonId()
end
function EnvironmentDetector.getMoonName(self)
    return EnvironmentDetector._internalDetector.getMoonName()
end
function EnvironmentDetector.getTime(self)
    return EnvironmentDetector._internalDetector.getTime()
end
function EnvironmentDetector.getRadiation(self)
    return EnvironmentDetector._internalDetector.getRadiation()
end
function EnvironmentDetector.getRadiationRaw(self)
    return EnvironmentDetector._internalDetector.getRadiationRaw()
end
function EnvironmentDetector.isDimension(self, dimension)
    return Lua:literal(("EnvironmentDetector._internalDetector.isDimension(\"" .. dimension) .. "\")")
end
function EnvironmentDetector.isMoon(self, moonPhaseId)
    return Lua:literal(("EnvironmentDetector._internalDetector.isMoon(" .. tostring(moonPhaseId)) .. ")")
end
function EnvironmentDetector.isRaining(self)
    return EnvironmentDetector._internalDetector.isRaining()
end
function EnvironmentDetector.isSunny(self)
    return EnvironmentDetector._internalDetector.isSunny()
end
function EnvironmentDetector.isThunder(self)
    return EnvironmentDetector._internalDetector.isThunder()
end
function EnvironmentDetector.isSlimeChunk(self)
    return EnvironmentDetector._internalDetector.isSlimeChunk()
end
function EnvironmentDetector.listDimensions(self)
    return EnvironmentDetector._internalDetector.listDimensions()
end
function EnvironmentDetector.scanEntities(self, range)
    return Lua:literal(("EnvironmentDetector._internalDetector.scanEntities(" .. tostring(range)) .. ")")
end
EnvironmentDetector._internalDetector = CcPeripheral:find("environmentDetector")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.geoScanner"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Geo Scanner peripheral from the Advanced Peripherals mod.
-- Provides information about blocks and ores in the surrounding area and chunk.
____exports.GeoScanner = __TS__Class()
local GeoScanner = ____exports.GeoScanner
GeoScanner.name = "GeoScanner"
function GeoScanner.prototype.____constructor(self)
end
function GeoScanner.getFuelLevel(self)
    return GeoScanner._internalScanner.getFuelLevel()
end
function GeoScanner.getMaxFuelLevel(self)
    return GeoScanner._internalScanner.getMaxFuelLevel()
end
function GeoScanner.cost(self, radius)
    return GeoScanner._internalScanner.cost(radius)
end
function GeoScanner.scan(self, radius)
    return GeoScanner._internalScanner.scan(radius)
end
function GeoScanner.getScanCooldown(self)
    return GeoScanner._internalScanner.getScanCooldown()
end
function GeoScanner.chunkAnalyze(self)
    return GeoScanner._internalScanner.chunkAnalyze()
end
GeoScanner._internalScanner = CcPeripheral:find("geoScanner")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.inventoryManager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Inventory Manager peripheral from the Advanced Peripherals mod.
-- Manages player inventory interactions and provides inventory information.
____exports.InventoryManager = __TS__Class()
local InventoryManager = ____exports.InventoryManager
InventoryManager.name = "InventoryManager"
function InventoryManager.prototype.____constructor(self)
end
function InventoryManager.addItemToPlayer(self, direction, item)
    return InventoryManager._internalManager.addItemToPlayer(direction, item)
end
function InventoryManager.removeItemFromPlayer(self, direction, item)
    return InventoryManager._internalManager.removeItemFromPlayer(direction, item)
end
function InventoryManager.getArmor(self)
    return InventoryManager._internalManager.getArmor()
end
function InventoryManager.getItems(self)
    return InventoryManager._internalManager.getItems()
end
function InventoryManager.getOwner(self)
    return InventoryManager._internalManager.getOwner()
end
function InventoryManager.isPlayerEquipped(self)
    return InventoryManager._internalManager.isPlayerEquipped()
end
function InventoryManager.isWearing(self, slot)
    return InventoryManager._internalManager.isWearing(slot)
end
function InventoryManager.getItemInHand(self)
    return InventoryManager._internalManager.getItemInHand()
end
function InventoryManager.getItemInOffHand(self)
    return InventoryManager._internalManager.getItemInOffHand()
end
function InventoryManager.getFreeSlot(self)
    return InventoryManager._internalManager.getFreeSlot()
end
function InventoryManager.isSpaceAvailable(self)
    return InventoryManager._internalManager.isSpaceAvailable()
end
function InventoryManager.getEmptySpace(self)
    return InventoryManager._internalManager.getEmptySpace()
end
InventoryManager._internalManager = CcPeripheral:find("inventoryManager")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.playerDetector"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Player Detector peripheral from the Advanced Peripherals mod.
-- Detects player presence, position, and interaction within range or defined coordinates.
____exports.PlayerDetector = __TS__Class()
local PlayerDetector = ____exports.PlayerDetector
PlayerDetector.name = "PlayerDetector"
function PlayerDetector.prototype.____constructor(self)
end
function PlayerDetector.onPlayerClick(self, listener)
    local event = ""
    local username = ""
    local deviceName = ""
    while true do
        local event, username, deviceName = os.pullEvent("playerClick")
        listener(nil, {event = event, username = username, deviceName = deviceName})
    end
end
function PlayerDetector.onPlayerJoin(self, listener)
    local event = ""
    local username = ""
    local dimension = ""
    while true do
        local event, username, dimension = os.pullEvent("playerJoin")
        listener(nil, {event = event, username = username, dimension = dimension})
    end
end
function PlayerDetector.onPlayerLeave(self, listener)
    local event = ""
    local username = ""
    local dimension = ""
    while true do
        local event, username, dimension = os.pullEvent("playerLeave")
        listener(nil, {event = event, username = username, dimension = dimension})
    end
end
function PlayerDetector.onPlayerChangedDimension(self, listener)
    local event = ""
    local username = ""
    local fromDimension = ""
    local toDimension = ""
    while true do
        local event, username, fromDimension, toDimension = os.pullEvent("playerChangedDimension")
        listener(nil, {event = event, username = username, fromDimension = fromDimension, toDimension = toDimension})
    end
end
function PlayerDetector.getPlayerInfo(self, username)
    return PlayerDetector._internalDetector.getPlayerPos(username)
end
function PlayerDetector.getOnlinePlayers(self)
    return PlayerDetector._internalDetector.getOnlinePlayers()
end
function PlayerDetector.getPlayersInRange(self, range)
    return PlayerDetector._internalDetector.getPlayersInRange(range)
end
function PlayerDetector.getPlayersInCoords(self, posOne, posTwo)
    return PlayerDetector._internalDetector.getPlayersInCoords(posOne, posTwo)
end
function PlayerDetector.getPlayersInCubic(self, width, height, depth)
    return PlayerDetector._internalDetector.getPlayersInCubic(width, height, depth)
end
function PlayerDetector.isPlayerInRange(self, range, username)
    return PlayerDetector._internalDetector.isPlayerInRange(range, username)
end
function PlayerDetector.isPlayerInCoords(self, posOne, posTwo, username)
    return PlayerDetector._internalDetector.isPlayerInCoords(posOne, posTwo, username)
end
function PlayerDetector.isPlayerInCubic(self, width, height, depth, username)
    return PlayerDetector._internalDetector.isPlayerInCubic(width, height, depth, username)
end
function PlayerDetector.isPlayersInRange(self, range)
    return PlayerDetector._internalDetector.isPlayersInRange(range)
end
function PlayerDetector.isPlayersInCoords(self, posOne, posTwo)
    return PlayerDetector._internalDetector.isPlayersInCoords(posOne, posTwo)
end
function PlayerDetector.isPlayersInCubic(self, width, height, depth)
    return PlayerDetector._internalDetector.isPlayersInCubic(width, height, depth)
end
PlayerDetector._internalDetector = CcPeripheral:find("playerDetector")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.advancedPeripherals.redstoneIntegrator"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Redstone Integrator peripheral from the Advanced Peripherals mod.
-- Provides methods to interact with redstone signals on different sides of the block.
____exports.RedstoneIntegrator = __TS__Class()
local RedstoneIntegrator = ____exports.RedstoneIntegrator
RedstoneIntegrator.name = "RedstoneIntegrator"
function RedstoneIntegrator.prototype.____constructor(self)
end
function RedstoneIntegrator.getInput(self, side)
    return RedstoneIntegrator._internalIntegrator.getInput(side)
end
function RedstoneIntegrator.getOutput(self, side)
    return RedstoneIntegrator._internalIntegrator.getOutput(side)
end
function RedstoneIntegrator.getAnalogInput(self, side)
    return RedstoneIntegrator._internalIntegrator.getAnalogInput(side)
end
function RedstoneIntegrator.getAnalogOutput(self, side)
    return RedstoneIntegrator._internalIntegrator.getAnalogOutput(side)
end
function RedstoneIntegrator.setOutput(self, side, powered)
    RedstoneIntegrator._internalIntegrator.setOutput(side, powered)
end
function RedstoneIntegrator.setAnalogOutput(self, side, power)
    RedstoneIntegrator._internalIntegrator.setAnalogOutput(side, power)
end
RedstoneIntegrator._internalIntegrator = CcPeripheral:find("redstoneIntegrator")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.item.basicItemDetail"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.item.listedItemDetail"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.item.inventoryContent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.item.detailedItemDetail"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.genericPeripherals.ccInventory"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing a generic inventory peripheral.
-- Allows interaction with inventories, including reading/writing items and pushing/pulling items between inventories.
-- 
-- Based on the documentation: https://tweaked.cc/generic_peripheral/inventory.html
____exports.CcInventory = __TS__Class()
local CcInventory = ____exports.CcInventory
CcInventory.name = "CcInventory"
function CcInventory.prototype.____constructor(self, peripheralName)
    self._internalInventory = CcPeripheral:find(peripheralName)
end
function CcInventory.create(self, peripheralName)
    local inventory = __TS__New(____exports.CcInventory, peripheralName)
    if inventory._internalInventory == nil or inventory._internalInventory == nil then
        return Optional:empty()
    end
    return Optional:of(inventory)
end
function CcInventory.prototype.getSize(self)
    return self._internalInventory:size()
end
function CcInventory.prototype.listItems(self)
    return self._internalInventory:list()
end
function CcInventory.prototype.getItemDetail(self, slot)
    local result
    result = self._internalInventory.getItemDetail(slot)
    return Optional:ofNullable(result)
end
function CcInventory.prototype.getItemLimit(self, slot)
    return self._internalInventory:getItemLimit(slot)
end
function CcInventory.prototype.pushItems(self, toName, fromSlot, limit, toSlot)
    return self._internalInventory:pushItems(toName, fromSlot, limit, toSlot)
end
function CcInventory.prototype.pullItems(self, fromName, fromSlot, limit, toSlot)
    return self._internalInventory:pullItems(fromName, fromSlot, limit, toSlot)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccColours"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- Adapter for the colours module
-- 
-- This class provides a wrapper around the colours module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/colors.html
____exports.CcColours = __TS__Class()
local CcColours = ____exports.CcColours
CcColours.name = "CcColours"
function CcColours.prototype.____constructor(self)
    self.values = {
        white = colours.white,
        orange = colours.orange,
        magenta = colours.magenta,
        lightBlue = colours.lightBlue,
        yellow = colours.yellow,
        lime = colours.lime,
        pink = colours.pink,
        gray = colours.gray,
        lightGray = colours.lightGray,
        cyan = colours.cyan,
        purple = colours.purple,
        blue = colours.blue,
        brown = colours.brown,
        green = colours.green,
        red = colours.red,
        black = colours.black
    }
end
function CcColours.prototype.combine(self, ...)
    local colours = {...}
    local coloursTable = TableUtil:fromArray(colours)
    return colors.combine(table.unpack(coloursTable))
end
function CcColours.prototype.subtract(self, colours, ...)
    local toSubtract = {...}
    local toSubtractTable = TableUtil:fromArray(toSubtract)
    return colors.subtract(colours, table.unpack(toSubtractTable))
end
function CcColours.prototype.test(self, colours, colour)
    return colors.test(colours, colour)
end
function CcColours.prototype.packRGB(self, r, g, b)
    return colors.packRGB(r, g, b)
end
function CcColours.prototype.unpackRGB(self, rgb)
    local r = 0
    local g = 0
    local b = 0
    r, g, b = colors.unpackRGB(rgb)
    return {r, g, b}
end
function CcColours.prototype.toBlit(self, colour)
    return colors.toBlit(colour)
end
function CcColours.prototype.fromBlit(self, hex)
    return colors.fromBlit(hex)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccGlobals"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSplit = ____lualib.__TS__StringSplit
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- Adapter for ComputerCraft global functions and variables
-- 
-- Based on the documentation: https://tweaked.cc/module/_G.html
____exports.CcGlobals = __TS__Class()
local CcGlobals = ____exports.CcGlobals
CcGlobals.name = "CcGlobals"
function CcGlobals.prototype.____constructor(self)
end
function CcGlobals.getHost(self)
    local hostString = _HOST
    local hostParts = __TS__StringSplit(hostString, " ")
    local computerCraftVersion = hostParts[1]
    local minecraftVersion = hostParts[2]
    return {computerCraftVersion = computerCraftVersion, minecraftVersion = minecraftVersion}
end
function CcGlobals.getDefaultSettings(self)
    local settingsString = _CC_DEFAULT_SETTINGS
    local settingsParts = __TS__StringSplit(settingsString, ",")
    local settings = __TS__New(Map)
    for ____, setting in ipairs(settingsParts) do
        local settingParts = __TS__StringSplit(setting, "=")
        local key = settingParts[1]
        local value = settingParts[2]
        settings:set(key, value)
    end
    return settings
end
function CcGlobals.setDefaultSetting(self, settings)
    local segments = {}
    for ____, ____value in __TS__Iterator(settings:entries()) do
        local key = ____value[1]
        local value = ____value[2]
        segments[#segments + 1] = (key .. "=") .. value
    end
    local settingsString = table.concat(segments, ",")
    Lua:literal(("_CC_DEFAULT_SETTINGS = \"" .. settingsString) .. "\"")
end
function CcGlobals.sleep(self, time)
    sleep(time)
end
function CcGlobals.write(self, text)
    return write(text)
end
function CcGlobals.print(self, ...)
    local values = {...}
    local valuesTable = TableUtil:fromArray(values)
    return print(table.unpack(valuesTable))
end
function CcGlobals.printError(self, ...)
    local values = {...}
    local valuesTable = TableUtil:fromArray(values)
    printError(table.unpack(valuesTable))
end
function CcGlobals.read(self, options)
    return read(options.replaceChar, options.history, options.completeFn, options.default)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccGps"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
--- Adapter for the gps module
-- 
-- This class provides a wrapper around the gps module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/gps.html
____exports.CcGps = __TS__Class()
local CcGps = ____exports.CcGps
CcGps.name = "CcGps"
function CcGps.prototype.____constructor(self)
end
function CcGps.locate(self, timeout, ____debug)
    local x = nil
    local y = nil
    local z = nil
    x, y, z = gps.locate(timeout, debug)
    if x == nil or y == nil or z == nil then
        return Result:error("Could not establish position")
    end
    return Result:of({x, y, z})
end
CcGps.CHANNEL_GPS = 65534
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccHelp"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- Adapter for the help module
-- 
-- This class provides a wrapper around the help module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/help.html
____exports.CcHelp = __TS__Class()
local CcHelp = ____exports.CcHelp
CcHelp.name = "CcHelp"
function CcHelp.prototype.____constructor(self)
end
function CcHelp.path(self)
    local path = ""
    path = help.path()
    return path
end
function CcHelp.setPath(self, newPath)
    help.setPath(newPath)
end
function CcHelp.lookup(self, topic)
    local path = nil
    path = help.lookup(topic)
    return path
end
function CcHelp.topics(self)
    local topics = {}
    topics = help.topics()
    return topics
end
function CcHelp.completeTopic(self, prefix)
    local completions = {}
    completions = help.completeTopic(prefix)
    return completions
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccIo"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- Adapter for the io module
-- 
-- This class provides a wrapper around ComputerCraft's io module
-- 
-- Based on documentation from: https://tweaked.cc/module/io.html
____exports.CcIo = __TS__Class()
local CcIo = ____exports.CcIo
CcIo.name = "CcIo"
function CcIo.prototype.____constructor(self)
end
function CcIo.input(self, file)
    local handle = nil
    local ____error = nil
    handle, error = io.input(file)
    if handle == nil then
        return Result:error(____error or "Unknown error")
    end
    return Result:of(handle)
end
function CcIo.output(self, file)
    local handle = nil
    local ____error = nil
    handle, error = io.output(file)
    if handle == nil then
        return Result:error(____error or "Unknown error")
    end
    return Result:of(handle)
end
function CcIo.open(self, filename, mode)
    local handle = nil
    local ____error = nil
    handle, error = io.open(filename, mode)
    if handle == nil then
        return Result:error(____error or "Unknown error")
    end
    return Result:of(handle)
end
function CcIo.read(self, ...)
    local formats = {...}
    local formatsTable = TableUtil:fromArray(formats)
    local result = {}
    result = {io.read(table.unpack(formatsTable))}
    return result
end
function CcIo.write(self, ...)
    local values = {...}
    local valuesTable = TableUtil:fromArray(values)
    io.write(table.unpack(valuesTable))
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccKeys"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- Provides access to ComputerCraft keyboard key codes and utilities
-- This class allows interaction with the ComputerCraft keys API
____exports.CcKeys = __TS__Class()
local CcKeys = ____exports.CcKeys
CcKeys.name = "CcKeys"
function CcKeys.prototype.____constructor(self)
end
function CcKeys.getName(self, code)
    local name
    name = keys.getName(code)
    return name
end
CcKeys.codes = {
    space = keys.space,
    apostrophe = keys.apostrophe,
    comma = keys.comma,
    minus = keys.minus,
    period = keys.period,
    slash = keys.slash,
    zero = keys.zero,
    one = keys.one,
    two = keys.two,
    three = keys.three,
    four = keys.four,
    five = keys.five,
    six = keys.six,
    seven = keys.seven,
    eight = keys.eight,
    nine = keys.nine,
    semicolon = keys.semicolon,
    equals = keys.equals,
    a = keys.a,
    b = keys.b,
    c = keys.c,
    d = keys.d,
    e = keys.e,
    f = keys.f,
    g = keys.g,
    h = keys.h,
    i = keys.i,
    j = keys.j,
    k = keys.k,
    l = keys.l,
    m = keys.m,
    n = keys.n,
    o = keys.o,
    p = keys.p,
    q = keys.q,
    r = keys.r,
    s = keys.s,
    t = keys.t,
    u = keys.u,
    v = keys.v,
    w = keys.w,
    x = keys.x,
    y = keys.y,
    z = keys.z,
    leftBracket = keys.leftBracket,
    backslash = keys.backslash,
    rightBracket = keys.rightBracket,
    grave = keys.grave,
    enter = keys.enter,
    tab = keys.tab,
    backspace = keys.backspace,
    insert = keys.insert,
    delete = keys.delete,
    right = keys.right,
    left = keys.left,
    down = keys.down,
    up = keys.up,
    pageUp = keys.pageUp,
    pageDown = keys.pageDown,
    home = keys.home,
    capsLock = keys.capsLock,
    scrollLock = keys.scrollLock,
    numLock = keys.numLock,
    printScreen = keys.printScreen,
    pause = keys.pause,
    f1 = keys.f1,
    f2 = keys.f2,
    f3 = keys.f3,
    f4 = keys.f4,
    f5 = keys.f5,
    f6 = keys.f6,
    f7 = keys.f7,
    f8 = keys.f8,
    f9 = keys.f9,
    f10 = keys.f10,
    f11 = keys.f11,
    f12 = keys.f12,
    f13 = keys.f13,
    f14 = keys.f14,
    f15 = keys.f15,
    f16 = keys.f16,
    f17 = keys.f17,
    f18 = keys.f18,
    f19 = keys.f19,
    f20 = keys.f20,
    f21 = keys.f21,
    f22 = keys.f22,
    f23 = keys.f23,
    f24 = keys.f24,
    f25 = keys.f25,
    numPad0 = keys.numPad0,
    numPad1 = keys.numPad1,
    numPad2 = keys.numPad2,
    numPad3 = keys.numPad3,
    numPad4 = keys.numPad4,
    numPad5 = keys.numPad5,
    numPad6 = keys.numPad6,
    numPad7 = keys.numPad7,
    numPad8 = keys.numPad8,
    numPad9 = keys.numPad9,
    numPadDecimal = keys.numPadDecimal,
    numPadDivide = keys.numPadDivide,
    numPadMultiply = keys.numPadMultiply,
    numPadSubtract = keys.numPadSubtract,
    numPadAdd = keys.numPadAdd,
    numPadEnter = keys.numPadEnter,
    numPadEqual = keys.numPadEqual,
    leftShift = keys.leftShift,
    leftCtrl = keys.leftCtrl,
    leftAlt = keys.leftAlt,
    leftSuper = keys.leftSuper,
    rightShift = keys.rightShift,
    rightCtrl = keys.rightCtrl,
    rightAlt = keys.rightAlt,
    menu = keys.menu
}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccMultishell"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- Allows multiple programs to be run at the same time.
-- When multiple programs are running, it displays a tab bar at the top of the screen,
-- which allows you to switch between programs.
-- 
-- Based on the documentation: https://tweaked.cc/module/multishell.html
____exports.CcMultishell = __TS__Class()
local CcMultishell = ____exports.CcMultishell
CcMultishell.name = "CcMultishell"
function CcMultishell.prototype.____constructor(self)
end
function CcMultishell.getFocus(self)
    local focus = 0
    focus = multishell.getFocus()
    return focus
end
function CcMultishell.setFocus(self, n)
    local success = false
    success = multishell.setFocus(n)
    return success
end
function CcMultishell.getTitle(self, n)
    local title = nil
    title = multishell.getTitle(n)
    return title
end
function CcMultishell.setTitle(self, n, title)
    multishell.setTitle(n, title)
end
function CcMultishell.getCurrent(self)
    local current = 0
    current = multishell.getCurrent()
    return current
end
function CcMultishell.launch(self, env, programPath, ...)
    local args = {...}
    local argsTable = TableUtil:fromArray(args)
    local processId = 0
    processId = multishell.launch(env, programPath, table.unpack(argsTable))
    return processId
end
function CcMultishell.getCount(self)
    local count = 0
    count = multishell.getCount()
    return count
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccOs"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- Provides access to ComputerCraft OS functionality
____exports.CcOs = __TS__Class()
local CcOs = ____exports.CcOs
CcOs.name = "CcOs"
function CcOs.prototype.____constructor(self)
end
function CcOs.loadAPI(self, path)
    return os.loadAPI(path)
end
function CcOs.unloadAPI(self, name)
    os.unloadAPI(name)
end
function CcOs.pullEvent(self, filter)
    local eventData = {os.pullEvent(filter)}
    local name = eventData[1]
    local details = eventData:slice(2)
    return {name = name, details = details}
end
function CcOs.pullEventRaw(self, filter)
    local eventData = {os.pullEventRaw(filter)}
    local name = eventData[1]
    local details = eventData:slice(2)
    return {name = name, details = details}
end
function CcOs.sleep(self, time)
    os.sleep(time)
end
function CcOs.version(self)
    return os.version()
end
function CcOs.run(self, env, path, ...)
    local args = {...}
    local argsTable = TableUtil:fromArray(args)
    return os.run(env, path, table.unpack(argsTable))
end
function CcOs.queueEvent(self, name, ...)
    local params = {...}
    local paramsTable = TableUtil:fromArray(params)
    os.queueEvent(name, table.unpack(paramsTable))
end
function CcOs.startTimer(self, time)
    return os.startTimer(time)
end
function CcOs.cancelTimer(self, token)
    os.cancelTimer(token)
end
function CcOs.setAlarm(self, time)
    return os.setAlarm(time)
end
function CcOs.cancelAlarm(self, token)
    os.cancelAlarm(token)
end
function CcOs.shutdown(self)
    os.shutdown()
end
function CcOs.reboot(self)
    os.reboot()
end
function CcOs.getComputerID(self)
    return os.getComputerID()
end
function CcOs.computerID(self)
    return os.computerID()
end
function CcOs.getComputerLabel(self)
    local label = os.getComputerLabel()
    return Optional:ofNullable(label)
end
function CcOs.computerLabel(self)
    local label = os.computerLabel()
    return Optional:ofNullable(label)
end
function CcOs.setComputerLabel(self, label)
    os.setComputerLabel(label)
end
function CcOs.clock(self)
    return os.clock()
end
function CcOs.time(self, locale)
    return os.time(locale)
end
function CcOs.day(self, locale)
    return os.day(locale)
end
function CcOs.epoch(self, locale)
    return os.epoch(locale)
end
function CcOs.date(self, format, time)
    if format == "!*t" then
        error(
            __TS__New(Error, "!*t not supported in `date` - use `dateTable` instead"),
            0
        )
    end
    return os.date(format, time)
end
function CcOs.dateTable(self, time)
    return os.date("!*t", time)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccPaintutils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
--- Adapter for the paintutils module
-- 
-- This class provides a wrapper around the paintutils module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/paintutils.html
____exports.CcPaintutils = __TS__Class()
local CcPaintutils = ____exports.CcPaintutils
CcPaintutils.name = "CcPaintutils"
function CcPaintutils.prototype.____constructor(self)
end
function CcPaintutils.parseImage(self, image)
    local result = {}
    result = paintutils.parseImage(image)
    return result
end
function CcPaintutils.loadImage(self, path)
    local image = nil
    image = paintutils.loadImage(path)
    if image == nil then
        return Result:error("Failed to load image")
    end
    return Result:of(image)
end
function CcPaintutils.drawPixel(self, xPos, yPos, colour)
    paintutils.drawPixel(xPos, yPos, colour)
end
function CcPaintutils.drawLine(self, startX, startY, endX, endY, colour)
    paintutils.drawLine(startX, startY, endX, endY, colour)
end
function CcPaintutils.drawBox(self, startX, startY, endX, endY, colour)
    paintutils.drawBox(startX, startY, endX, endY, colour)
end
function CcPaintutils.drawFilledBox(self, startX, startY, endX, endY, colour)
    paintutils.drawFilledBox(startX, startY, endX, endY, colour)
end
function CcPaintutils.drawImage(self, image, xPos, yPos)
    paintutils.drawImage(image, xPos, yPos)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccParallel"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- An adapter for the parallel API in ComputerCraft
-- This class provides methods for running multiple functions concurrently
____exports.CcParallel = __TS__Class()
local CcParallel = ____exports.CcParallel
CcParallel.name = "CcParallel"
function CcParallel.prototype.____constructor(self)
end
function CcParallel.waitForAny(self, ...)
    local functions = {...}
    local functionsTable = TableUtil:fromArray(functions)
    parallel.waitForAny(table.unpack(functionsTable))
end
function CcParallel.waitForAll(self, ...)
    local functions = {...}
    local functionsTable = TableUtil:fromArray(functions)
    parallel.waitForAll(table.unpack(functionsTable))
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccPocket"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
--- Adapter for the pocket module
-- 
-- This class provides a wrapper around the pocket module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/pocket.html
____exports.CcPocket = __TS__Class()
local CcPocket = ____exports.CcPocket
CcPocket.name = "CcPocket"
function CcPocket.prototype.____constructor(self)
end
function CcPocket.equipBack(self)
    local success = false
    local reason = nil
    success, reason = pocket.equipBack()
    if not success then
        return Result:error(reason or "Unknown error")
    end
    return Result:of(success)
end
function CcPocket.unequipBack(self)
    local success = false
    local reason = nil
    success, reason = pocket.unequipBack()
    if not success then
        return Result:error(reason or "Unknown error")
    end
    return Result:of(success)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccRednet"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
--- Adapter for the rednet module
-- 
-- This class provides a wrapper around the rednet module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/rednet.html
____exports.CcRednet = __TS__Class()
local CcRednet = ____exports.CcRednet
CcRednet.name = "CcRednet"
function CcRednet.prototype.____constructor(self)
end
function CcRednet.open(self, modem)
    rednet.open(modem)
end
function CcRednet.close(self, modem)
    rednet.close(modem)
end
function CcRednet.isOpen(self, modem)
    return rednet.isOpen(modem)
end
function CcRednet.send(self, recipient, message, protocol)
    return rednet.send(recipient, message, protocol)
end
function CcRednet.broadcast(self, message, protocol)
    rednet.broadcast(message, protocol)
end
function CcRednet.receive(self, protocolFilter, timeout)
    local senderId = nil
    local message = nil
    local protocol = nil
    senderId, message, protocol = rednet.receive(protocolFilter, timeout)
    if senderId == nil then
        return Result:error("Timeout or no message received")
    end
    return Result:of({senderId = senderId, message = message, protocol = protocol or nil})
end
function CcRednet.host(self, protocol, hostname)
    rednet.host(protocol, hostname)
end
function CcRednet.unhost(self, protocol)
    rednet.unhost(protocol)
end
function CcRednet.lookup(self, protocol)
    local result = nil
    result = {rednet.lookup(protocol)}
    local ____temp_0
    if result == nil then
        ____temp_0 = {}
    else
        ____temp_0 = result
    end
    return ____temp_0
end
function CcRednet.lookupByHostname(self, protocol, hostname)
    local result = nil
    result = rednet.lookup(protocol, hostname)
    return Optional:ofNullable(result)
end
CcRednet.CHANNEL_BROADCAST = 65535
CcRednet.CHANNEL_REPEAT = 65533
CcRednet.MAX_ID_CHANNELS = 65500
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.consts.side"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Side = Side or ({})
____exports.Side.LEFT = "left"
____exports.Side.RIGHT = "right"
____exports.Side.BACK = "back"
____exports.Side.FRONT = "front"
____exports.Side.TOP = "top"
____exports.Side.BOTTOM = "bottom"
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccRedstone"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- Adapter for the redstone module
-- 
-- This class provides a wrapper around the redstone module, allowing it to be used from TypeScript
-- 
-- Based on the documentation: https://tweaked.cc/module/redstone.html
____exports.CcRedstone = __TS__Class()
local CcRedstone = ____exports.CcRedstone
CcRedstone.name = "CcRedstone"
function CcRedstone.prototype.____constructor(self)
end
function CcRedstone.getSides(self)
    local sides = {}
    sides = redstone.getSides()
    return sides
end
function CcRedstone.setOutput(self, side, on)
    redstone.setOutput(side, on)
end
function CcRedstone.getOutput(self, side)
    local output = false
    output = redstone.getOutput(side)
    return output
end
function CcRedstone.getInput(self, side)
    local input = false
    input = redstone.getInput(side)
    return input
end
function CcRedstone.setAnalogOutput(self, side, value)
    redstone.setAnalogOutput(side, value)
end
function CcRedstone.getAnalogOutput(self, side)
    local strength = 0
    strength = redstone.getAnalogOutput(side)
    return strength
end
function CcRedstone.getAnalogInput(self, side)
    local strength = 0
    strength = redstone.getAnalogInput(side)
    return strength
end
function CcRedstone.setBundledOutput(self, side, output)
    redstone.setBundledOutput(side, output)
end
function CcRedstone.getBundledOutput(self, side)
    local output = 0
    output = redstone.getBundledOutput(side)
    return output
end
function CcRedstone.getBundledInput(self, side)
    local input = 0
    input = redstone.getBundledInput(side)
    return input
end
function CcRedstone.testBundledInput(self, side, mask)
    local result = false
    result = redstone.testBundledInput(side, mask)
    return result
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccSettings"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
--- Adapter for the settings module
-- 
-- This class provides a wrapper around the settings module, allowing reading and writing of configuration options
-- for CraftOS and programs.
-- 
-- Based on the documentation: https://tweaked.cc/module/settings.html
____exports.CcSettings = __TS__Class()
local CcSettings = ____exports.CcSettings
CcSettings.name = "CcSettings"
function CcSettings.prototype.____constructor(self)
end
function CcSettings.define(self, name, options)
    settings.define(name, options)
end
function CcSettings.undefine(self, name)
    settings.undefine(name)
end
function CcSettings.set(self, name, value)
    local success = true
    success = settings.set(name, value))
    if not success then
        return Result:error("Failed to set setting value")
    end
    return Result:void()
end
function CcSettings.get(self, name, defaultValue)
    return settings.get(name, defaultValue)
end
function CcSettings.getDetails(self, name)
    return settings.getDetails(name)
end
function CcSettings.unset(self, name)
    settings.unset(name)
end
function CcSettings.clear(self)
    settings.clear()
end
function CcSettings.getNames(self)
    return settings.getNames()
end
function CcSettings.load(self, path)
    if path == nil then
        path = ".settings"
    end
    local success = false
    success = settings.load(path)
    if not success then
        return Result:error("Failed to load settings")
    end
    return Result:void()
end
function CcSettings.save(self, path)
    if path == nil then
        path = ".settings"
    end
    local success = false
    success = settings.save(path)
    if not success then
        return Result:error("Failed to save settings")
    end
    return Result:void()
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.blockInspectionResult"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccTurtle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
--- Provides access to ComputerCraft turtle functionality.
-- Turtles are robotic devices that can move, break/place blocks, attack mobs and store items.
-- They have an internal inventory of 16 slots and require fuel for movement.
____exports.CcTurtle = __TS__Class()
local CcTurtle = ____exports.CcTurtle
CcTurtle.name = "CcTurtle"
function CcTurtle.prototype.____constructor(self)
end
function CcTurtle.craft(self, limit)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.craft(limit)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.forward(self)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.forward()
    return Result:ofError(success, errorMessage)
end
function CcTurtle.back(self)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.back()
    return Result:ofError(success, errorMessage)
end
function CcTurtle.up(self)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.up()
    return Result:ofError(success, errorMessage)
end
function CcTurtle.down(self)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.down()
    return Result:ofError(success, errorMessage)
end
function CcTurtle.turnLeft(self)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.turnLeft()
    return Result:ofError(success, errorMessage)
end
function CcTurtle.turnRight(self)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.turnRight()
    return Result:ofError(success, errorMessage)
end
function CcTurtle.dig(self, side)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.dig(side)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.digUp(self, side)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.digUp(side)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.digDown(self, side)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.digDown(side)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.place(self, text)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.place(text)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.placeUp(self, text)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.placeUp(text)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.placeDown(self, text)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.placeDown(text)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.drop(self, count)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.drop(count)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.dropUp(self, count)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.dropUp(count)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.dropDown(self, count)
    local success = false
    local errorMessage = nil
    success, errorMessage = turtle.dropDown(count)
    return Result:ofError(success, errorMessage)
end
function CcTurtle.select(self, slot)
    if slot < 1 or slot > 16 then
        return Result:error(("slot '" .. tostring(slot)) .. "' must be between 1 and 16")
    end
    do
        local function ____catch(e)
            return true, Result:ofError(false, e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            turtle.select(slot)
            return true, Result:of(true)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function CcTurtle.getItemCount(self, slot)
    if slot ~= nil and (slot < 1 or slot > 16) then
        return Result:error(("slot '" .. tostring(slot)) .. "' must be between 1 and 16")
    end
    local count = 0
    local errorMessage = nil
    do
        local function ____catch(e)
            errorMessage = e.message
        end
        local ____try, ____hasReturned = pcall(function()
            count = turtle.getItemCount(slot)
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    return Result:ofError(count, errorMessage)
end
function CcTurtle.getItemSpace(self, slot)
    if slot ~= nil and (slot < 1 or slot > 16) then
        return Result:error(("slot '" .. tostring(slot)) .. "' must be between 1 and 16")
    end
    local count = 0
    local errorMessage = nil
    do
        local function ____catch(e)
            errorMessage = e.message
        end
        local ____try, ____hasReturned = pcall(function()
            count = turtle.getItemSpace(slot)
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    return Result:ofError(count, errorMessage)
end
function CcTurtle.detect(self)
    return turtle.detect()
end
function CcTurtle.detectUp(self)
    return turtle.detectUp()
end
function CcTurtle.detectDown(self)
    return turtle.detectDown()
end
function CcTurtle.compare(self)
    return turtle.compare()
end
function CcTurtle.compareUp(self)
    return turtle.compareUp()
end
function CcTurtle.compareDown(self)
    return turtle.compareDown()
end
function CcTurtle.attack(self, side)
    local success = false
    local reason = nil
    success, reason = turtle.attack(side)
    return Result:ofError(success, reason)
end
function CcTurtle.attackUp(self, side)
    local success = false
    local reason = nil
    success, reason = turtle.attackUp(side)
    return Result:ofError(success, reason)
end
function CcTurtle.attackDown(self, side)
    local success = false
    local reason = nil
    success, reason = turtle.attackDown(side)
    return Result:ofError(success, reason)
end
function CcTurtle.suck(self, count)
    local success = false
    local reason = nil
    success, reason = turtle.suck(side)
    return Result:ofError(success, reason)
end
function CcTurtle.suckUp(self, count)
    local success = false
    local reason = nil
    success, reason = turtle.suckUp(side)
    return Result:ofError(success, reason)
end
function CcTurtle.suckDown(self, count)
    local success = false
    local reason = nil
    success, reason = turtle.suckDown(side)
    return Result:ofError(success, reason)
end
function CcTurtle.getFuelLevel(self)
    return turtle.getFuelLevel()
end
function CcTurtle.refuel(self, count)
    local refueled = false
    local message = nil
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            refueled, message = turtle.refuel(count)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:ofError(refueled, message)
end
function CcTurtle.compareTo(self, slot)
    if slot < 1 or slot > 16 then
        return Result:error(("slot '" .. tostring(slot)) .. "' must be between 1 and 16")
    end
    local result = false
    local message = nil
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            result, message = turtle.compareTo(slot)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:ofError(result, message)
end
function CcTurtle.transferTo(self, slot, count)
    if slot < 1 or slot > 16 then
        return Result:error(("slot '" .. tostring(slot)) .. "' must be between 1 and 16")
    end
    local result = false
    local message = nil
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            result, message = turtle.transferTo(slot, count)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:ofError(result, message)
end
function CcTurtle.getSelectedSlot(self)
    return turtle.getSelectedSlot()
end
function CcTurtle.getFuelLimit(self)
    return turtle.getFuelLimit()
end
function CcTurtle.equipLeft(self)
    local success = false
    local reason = nil
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            success, reason = turtle.equipLeft()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:ofError(success, reason)
end
function CcTurtle.equipRight(self)
    local success = false
    local reason = nil
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            success, reason = turtle.equipRight()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:ofError(success, reason)
end
function CcTurtle.getEquippedLeft(self)
    return turtle.getEquippedLeft()
end
function CcTurtle.getEquippedRight(self)
    return turtle.getEquippedRight()
end
function CcTurtle.inspect(self)
    local success = false
    local value = "No value was returned by `turtle.inspect()`"
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            success, value = turtle.inspect()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    if not success then
        return Result:error(value)
    end
    return Result:of(value)
end
function CcTurtle.inspectUp(self)
    local success = false
    local value = "No value was returned by `turtle.inspectUp()`"
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            success, value = turtle.inspectUp()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    if not success then
        return Result:error(value)
    end
    return Result:of(value)
end
function CcTurtle.inspectDown(self)
    local success = false
    local value = "No value was returned by `turtle.inspectDown()`"
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            success, value = turtle.inspectDown()
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    if not success then
        return Result:error(value)
    end
    return Result:of(value)
end
function CcTurtle.getBasicItemDetail(self, slot)
    if slot ~= nil and (slot < 1 or slot > 16) then
        return Result:error(("slot '" .. tostring(slot)) .. "' must be between 1 and 16")
    end
    local result = nil
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            result = turtle.getItemDetail(slot, false)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:of(Optional:ofNullable(result))
end
function CcTurtle.getDetailedItemDetail(self, slot)
    if slot ~= nil and (slot < 1 or slot > 16) then
        return Result:error(("slot '" .. tostring(slot)) .. "' must be between 1 and 16")
    end
    local result = nil
    do
        local function ____catch(e)
            return true, Result:error(e.message)
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            result = turtle.getItemDetail(slot, true)
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return Result:of(Optional:ofNullable(result))
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccVector"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A 3-dimensional vector implementation wrapper.
-- Suitable for representing both position and directional vectors.
-- 
-- Based on the documentation: https://tweaked.cc/module/vector.html
____exports.CcVector = __TS__Class()
local CcVector = ____exports.CcVector
CcVector.name = "CcVector"
function CcVector.prototype.____constructor(self, x, y, z)
    self.vector = Vector.new(x, y, z)
end
function CcVector.of(self, x, y, z)
    return __TS__New(____exports.CcVector, x, y, z)
end
function CcVector.prototype.add(self, other)
    local result = self.vector:add(other.vector)
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.subtract(self, other)
    local result = self.vector:sub(other.vector)
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.multiply(self, factor)
    local result = self.vector:mul(factor)
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.divide(self, factor)
    local result = self.vector:div(factor)
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.negate(self)
    local result = self.vector:unm()
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.dotProduct(self, other)
    return self.vector:dot(other.vector)
end
function CcVector.prototype.crossProduct(self, other)
    local result = self.vector:cross(other.vector)
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.length(self)
    return self.vector:length()
end
function CcVector.prototype.normalize(self)
    local result = self.vector:normalize()
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.round(self, tolerance)
    local result = self.vector:round(tolerance)
    return ____exports.CcVector:of(result.x, result.y, result.z)
end
function CcVector.prototype.__tostring(self)
    return tostring(self.vector)
end
function CcVector.prototype.equals(self, other)
    return self.vector:equals(other.vector)
end
function CcVector.prototype.getX(self)
    return self.vector.x
end
function CcVector.prototype.getY(self)
    return self.vector.y
end
function CcVector.prototype.getZ(self)
    return self.vector.z
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.globals.ccWindow"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A terminal redirect occupying a smaller area of an existing terminal.
-- Allows defining spaces within the display that can be written/drawn to, then later redrawn/repositioned/etc.
-- Windows are considered terminal objects and have access to nearly all commands in the term API.
-- Each window has a "parent" terminal object and retains memory of everything rendered through them.
-- 
-- Based on the documentation: https://tweaked.cc/module/window.html
____exports.CcWindow = __TS__Class()
local CcWindow = ____exports.CcWindow
CcWindow.name = "CcWindow"
function CcWindow.prototype.____constructor(self, window)
    self.window = window
end
function CcWindow.create(self, parent, x, y, width, height, startVisible)
    if startVisible == nil then
        startVisible = true
    end
    return __TS__New(
        ____exports.CcWindow,
        window.create(parent, x, y, width, height, startVisible
    )
end
function CcWindow.prototype.write(self, text)
    self.window.write(text)
end
function CcWindow.prototype.blit(self, text, textColor, backgroundColor)
    self.window.blit(text, textColor, backgroundColor)
end
function CcWindow.prototype.clear(self)
    self.window.clear()
end
function CcWindow.prototype.clearLine(self)
    self.window.clearLine()
end
function CcWindow.prototype.getCursorPos(self)
    local x = 0
    local y = 0
    x, y = self.window.getCursorPos()
    return {x = x, y = y}
end
function CcWindow.prototype.setCursorPos(self, x, y)
    self.window.setCursorPos(x, y)
end
function CcWindow.prototype.setCursorBlink(self, blink)
    self.window.setCursorBlink(blink)
end
function CcWindow.prototype.getCursorBlink(self)
    local blink = false
    blink = self.window.getCursorBlink()
    return blink
end
function CcWindow.prototype.isColor(self)
    local color = false
    color = self.window.isColor()
    return color
end
function CcWindow.prototype.isColour(self)
    local colour = false
    colour = self.window.isColour()
    return colour
end
function CcWindow.prototype.setTextColor(self, color)
    self.window.setTextColor(color)
end
function CcWindow.prototype.setTextColour(self, color)
    self.window.setTextColour(color)
end
function CcWindow.prototype.setPaletteColor(self, color, r, g, b)
    self.window.setPaletteColor(color, r, g, b)
end
function CcWindow.prototype.setPaletteColour(self, color, r, g, b)
    self.window.setPaletteColour(color, r, g, b)
end
function CcWindow.prototype.getPaletteColor(self, color)
    local r = 0
    local g = 0
    local b = 0
    r, g, b = self.window.getPaletteColor(color)
    return {r, g, b}
end
function CcWindow.prototype.getPaletteColour(self, color)
    local r = 0
    local g = 0
    local b = 0
    r, g, b = self.window.getPaletteColour(color)
    return {r, g, b}
end
function CcWindow.prototype.setBackgroundColor(self, color)
    self.window.setBackgroundColor(color)
end
function CcWindow.prototype.setBackgroundColour(self, color)
    self.window.setBackgroundColour(color)
end
function CcWindow.prototype.getDimensions(self)
    local width = 0
    local height = 0
    width, height = self.window.getSize()
    return {width = width, height = height}
end
function CcWindow.prototype.scroll(self, n)
    self.window.scroll(n)
end
function CcWindow.prototype.getTextColour(self)
    local colour = 0
    colour = self.window.getTextColour()
    return colour
end
function CcWindow.prototype.getBackgroundColour(self)
    local colour = 0
    colour = self.window.getBackgroundColour()
    return colour
end
function CcWindow.prototype.getLine(self, y)
    local text = ""
    local textColor = ""
    local bgColor = ""
    text, textColor, bgColor = self.window.getLine(y)
    return {text, textColor, bgColor}
end
function CcWindow.prototype.setVisible(self, visible)
    self.window.setVisible(visible)
end
function CcWindow.prototype.isVisible(self)
    local visible = false
    visible = self.window.isVisible()
    return visible
end
function CcWindow.prototype.redraw(self)
    self.window.redraw()
end
function CcWindow.prototype.restoreCursor(self)
    self.window.restoreCursor()
end
function CcWindow.prototype.getPosition(self)
    local x = 0
    local y = 0
    x, y = self.window.getPosition()
    return {x = x, y = y}
end
function CcWindow.prototype.reposition(self, newX, newY, newWidth, newHeight, newParent)
    self.window.reposition(newX, newY, newWidth, newHeight, newParent)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccAudioDfpwm"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local dfpwm = require("cc.audio.dfpwm")
--- The CcAudioDfpwm class provides methods for working with the DFPWM audio format.
-- It allows encoding PCM audio to DFPWM and decoding DFPWM back to PCM.
-- 
-- Based on the documentation: https://tweaked.cc/library/cc.audio.dfpwm.html
____exports.CcAudioDfpwm = __TS__Class()
local CcAudioDfpwm = ____exports.CcAudioDfpwm
CcAudioDfpwm.name = "CcAudioDfpwm"
function CcAudioDfpwm.prototype.____constructor(self)
end
function CcAudioDfpwm.makeEncoder(self)
    return dfpwm.make_encoder()
end
function CcAudioDfpwm.makeDecoder(self)
    return dfpwm.make_decoder()
end
function CcAudioDfpwm.encode(self, input)
    return dfpwm.encode(input)
end
function CcAudioDfpwm.decode(self, input)
    return dfpwm.decode(input)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccCompletion"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local completion = require("cc.completion")
--- The CcCompletion class provides methods for working with input completion.
-- Based on the documentation: https://tweaked.cc/library/cc.completion.html
____exports.CcCompletion = __TS__Class()
local CcCompletion = ____exports.CcCompletion
CcCompletion.name = "CcCompletion"
function CcCompletion.prototype.____constructor(self)
end
function CcCompletion.choice(self, text, choices, addSpace)
    return completion.choice(text, choices, addSpace)
end
function CcCompletion.peripheral(self, text, addSpace)
    return completion.peripheral(text, addSpace)
end
function CcCompletion.side(self, text, addSpace)
    return completion.side(text, addSpace)
end
function CcCompletion.setting(self, text, addSpace)
    return completion.setting(text, addSpace)
end
function CcCompletion.command(self, text, addSpace)
    return completion.command(text, addSpace)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccExpect"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
local expect = require("cc.expect")
--- The CcExpect class provides helper functions for verifying that function arguments
-- are well-formed and of the correct type.
-- 
-- Based on the documentation: https://tweaked.cc/library/cc.expect.html
____exports.CcExpect = __TS__Class()
local CcExpect = ____exports.CcExpect
CcExpect.name = "CcExpect"
function CcExpect.prototype.____constructor(self)
end
function CcExpect.expect(self, index, value, ...)
    local types = {...}
    local typesTable = TableUtil:fromArray(types)
    return expect(index, value, table.unpack(typesTable))
end
function CcExpect.field(self, tbl, index, ...)
    local types = {...}
    local typesTable = TableUtil:fromArray(types)
    return expect.field(tbl, index, table.unpack(typesTable))
end
function CcExpect.range(self, num, min, max)
    if min == nil then
        min = -math.huge
    end
    if max == nil then
        max = math.huge
    end
    return expect.range(num, min, max)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccImageNft"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
local nft = require("cc.image.nft")
--- The CcImageNft class provides methods for working with NFT (Nitrogen Fingers Text) images.
-- NFT is a file format for drawing basic images that supports colored text and pixels.
-- 
-- Based on the documentation: https://tweaked.cc/library/cc.image.nft.html
____exports.CcImageNft = __TS__Class()
local CcImageNft = ____exports.CcImageNft
CcImageNft.name = "CcImageNft"
function CcImageNft.prototype.____constructor(self)
end
function CcImageNft.parse(self, image)
    return nft.parse(image)
end
function CcImageNft.load(self, path)
    local image = nil
    local ____error = nil
    image, error = nft.load(path)
    return Result:ofError(image, ____error)
end
function CcImageNft.draw(self, image, xPos, yPos, target)
    return nft.draw(image, xPos, yPos, target)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccPretty"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local pretty = require("cc.pretty")
--- The CcPretty class provides methods for rendering data structures in an aesthetically pleasing manner.
-- It allows building and manipulating documents for formatted output.
-- 
-- Based on the documentation: https://tweaked.cc/module/cc.pretty.html
____exports.CcPretty = __TS__Class()
local CcPretty = ____exports.CcPretty
CcPretty.name = "CcPretty"
function CcPretty.prototype.____constructor(self)
end
function CcPretty.text(self, text, colour)
    return pretty.text(text, colour)
end
function CcPretty.concat(self, ...)
    return pretty.concat(...)
end
function CcPretty.nest(self, depth, doc)
    return pretty.nest(depth, doc)
end
function CcPretty.group(self, doc)
    return pretty.group(doc)
end
function CcPretty.write(self, doc, ribbonFrac)
    if ribbonFrac == nil then
        ribbonFrac = 0.6
    end
    pretty.write(doc, ribbonFrac)
end
function CcPretty.print(self, doc, ribbonFrac)
    if ribbonFrac == nil then
        ribbonFrac = 0.6
    end
    pretty.print(doc, ribbonFrac)
end
function CcPretty.render(self, doc, width, ribbonFrac)
    if ribbonFrac == nil then
        ribbonFrac = 0.6
    end
    return pretty.render(doc, width, ribbonFrac)
end
function CcPretty.pretty(self, obj, options)
    return pretty.pretty(obj, options)
end
function CcPretty.prettyPrint(self, obj, options, ribbonFrac)
    if ribbonFrac == nil then
        ribbonFrac = 0.6
    end
    pretty.pretty_print(obj, options, ribbonFrac)
end
CcPretty.empty = pretty.empty
CcPretty.space = pretty.space
CcPretty.line = pretty.line
CcPretty.spaceLine = pretty.space_line
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccRequire"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local require = require("cc.require")
--- The CcRequire class provides methods for working with Lua's require function and package library.
-- It allows creating custom environments with their own require implementation.
-- 
-- Based on the documentation: https://tweaked.cc/module/cc.require.html
____exports.CcRequire = __TS__Class()
local CcRequire = ____exports.CcRequire
CcRequire.name = "CcRequire"
function CcRequire.prototype.____constructor(self)
end
function CcRequire.make(self, env, dir)
    local requireFunction
    local packageLibrary
    requireFunction, packageLibrary = require.make(env, dir)
    return {requireFunction = requireFunction, packageLibrary = packageLibrary}
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccShellCompletion"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local completion = require("cc.shell.completion")
--- The CcShellCompletion class provides methods for working with shell completion.
-- Most programs may be completed using the build helper method, rather than manually switching on the argument index.
-- 
-- Based on the documentation: https://tweaked.cc/library/cc.shell.completion.html
____exports.CcShellCompletion = __TS__Class()
local CcShellCompletion = ____exports.CcShellCompletion
CcShellCompletion.name = "CcShellCompletion"
function CcShellCompletion.prototype.____constructor(self)
end
function CcShellCompletion.file(self, shell, text)
    return completion.file(shell, text)
end
function CcShellCompletion.dir(self, shell, text)
    return completion.dir(shell, text)
end
function CcShellCompletion.dirOrFile(self, shell, text, previous, addSpace)
    return completion.dirOrFile(shell, text, previous, add_space)
end
function CcShellCompletion.program(self, shell, text)
    return completion.program(shell, text)
end
function CcShellCompletion.programWithArgs(self, shell, text, previous, starting)
    return completion.programWithArgs(shell, text, previous, starting)
end
function CcShellCompletion.build(self, ...)
    return completion.build(...)
end
CcShellCompletion.help = completion.help
CcShellCompletion.choice = completion.choice
CcShellCompletion.peripheral = completion.peripheral
CcShellCompletion.side = completion.side
CcShellCompletion.setting = completion.setting
CcShellCompletion.command = completion.command
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.modules.ccStrings"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local strings = require("cc.strings")
--- The CcStrings class provides utilities for working with strings and text.
-- 
-- Based on the documentation: https://tweaked.cc/library/cc.strings.html
____exports.CcStrings = __TS__Class()
local CcStrings = ____exports.CcStrings
CcStrings.name = "CcStrings"
function CcStrings.prototype.____constructor(self)
end
function CcStrings.wrap(self, text, width)
    return strings.wrap(text, width)
end
function CcStrings.ensureWidth(self, line, width)
    return strings.ensure_width(line, width)
end
function CcStrings.split(self, str, deliminator, plain, limit)
    if plain == nil then
        plain = false
    end
    return strings.split(str, deliminator, plain, limit)
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccCommandBlock"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
--- A class representing the Command Block peripheral.
-- Allows interaction with command blocks by getting/setting commands and executing them.
____exports.CcCommandBlock = __TS__Class()
local CcCommandBlock = ____exports.CcCommandBlock
CcCommandBlock.name = "CcCommandBlock"
function CcCommandBlock.prototype.____constructor(self)
end
function CcCommandBlock.getCommand(self)
    return self._internalCommandBlock:get().getCommand()
end
function CcCommandBlock.setCommand(self, command)
    self._internalCommandBlock:get().setCommand(command)
end
function CcCommandBlock.runCommand(self)
    local success = false
    local errorMessage
    success, errorMessage = self._internalCommandBlock:get().runCommand()
    return Result:ofError(success, errorMessage)
end
CcCommandBlock._internalCommandBlock = CcPeripheral:find("command")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccComputer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Computer peripheral.
-- Allows for basic interaction with adjacent computers.
____exports.CcComputer = __TS__Class()
local CcComputer = ____exports.CcComputer
CcComputer.name = "CcComputer"
function CcComputer.prototype.____constructor(self)
end
function CcComputer.turnOn(self)
    self._internalComputer:get().turnOn()
end
function CcComputer.shutdown(self)
    self._internalComputer:get().shutdown()
end
function CcComputer.reboot(self)
    self._internalComputer:get().reboot()
end
function CcComputer.getID(self)
    return self._internalComputer:get().getID()
end
function CcComputer.isOn(self)
    return self._internalComputer:get().isOn()
end
function CcComputer.getLabel(self)
    return self._internalComputer:get().getLabel()
end
CcComputer._internalComputer = CcPeripheral:find("computer")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccDrive"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____result = require("preBuild.src.util.types.result")
local Result = ____result.Result
--- A class representing the Disk Drive peripheral.
-- Allows interaction with floppy disks and other mountable media, including reading/writing data and playing audio.
-- 
-- Based on the documentation: https://tweaked.cc/peripheral/drive.html
____exports.CcDrive = __TS__Class()
local CcDrive = ____exports.CcDrive
CcDrive.name = "CcDrive"
function CcDrive.prototype.____constructor(self)
end
function CcDrive.isDiskPresent(self)
    return self._internalDrive:get().isDiskPresent()
end
function CcDrive.getDiskLabel(self)
    return Optional:ofNullable(self._internalDrive:get().getDiskLabel())
end
function CcDrive.setDiskLabel(self, label)
    self._internalDrive:get().setDiskLabel(label)
end
function CcDrive.hasData(self)
    return self._internalDrive:get().hasData()
end
function CcDrive.getMountPath(self)
    return Optional:ofNullable(self._internalDrive:get().getMountPath())
end
function CcDrive.hasAudio(self)
    return self._internalDrive:get().hasAudio()
end
function CcDrive.getAudioTitle(self)
    local result = self._internalDrive:get().getAudioTitle()
    if result == false then
        return Result:error("No disk inserted")
    end
    if result == nil or result == nil then
        return Result:error("Disk has no audio")
    end
    return Result:of(result)
end
function CcDrive.playAudio(self)
    self._internalDrive:get().playAudio()
end
function CcDrive.stopAudio(self)
    self._internalDrive:get().stopAudio()
end
function CcDrive.ejectDisk(self)
    self._internalDrive:get().ejectDisk()
end
function CcDrive.getDiskID(self)
    return Optional:ofNullable(self._internalDrive:get().getDiskID())
end
CcDrive._internalDrive = CcPeripheral:find("drive")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccModem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
local ____tableUtil = require("preBuild.src.util.computer.api.tier1.lua.tableUtil")
local TableUtil = ____tableUtil.TableUtil
--- A class representing the Modem peripheral from ComputerCraft.
-- Allows sending and receiving messages between computers over channels.
-- 
-- Based on the documentation: https://tweaked.cc/peripheral/modem.html
____exports.CcModem = __TS__Class()
local CcModem = ____exports.CcModem
CcModem.name = "CcModem"
function CcModem.prototype.____constructor(self)
end
function CcModem.open(self, channel)
    self._internalModem:get().open(channel)
end
function CcModem.isOpen(self, channel)
    local isOpen = false
    isOpen = self._internalModem:get().isOpen(channel)
    return isOpen
end
function CcModem.close(self, channel)
    self._internalModem:get().close(channel)
end
function CcModem.closeAll(self)
    self._internalModem:get().closeAll()
end
function CcModem.transmit(self, channel, replyChannel, payload)
    self._internalModem:get().transmit(channel, replyChannel, payload)
end
function CcModem.isWireless(self)
    local isWireless = false
    isWireless = self._internalModem:get().isWireless()
    return isWireless
end
function CcModem.getNamesRemote(self)
    local names = {}
    names = self._internalModem:get().getNamesRemote()
    return names
end
function CcModem.isPresentRemote(self, name)
    local isPresent = false
    isPresent = self._internalModem:get().isPresentRemote(name)
    return isPresent
end
function CcModem.getTypeRemote(self, name)
    local ____type
    type = self._internalModem:get().getTypeRemote(name)
    return Optional:ofNullable(____type)
end
function CcModem.hasTypeRemote(self, name, ____type)
    local hasType
    hasType = self._internalModem:get().hasTypeRemote(name, type)
    return Optional:ofNullable(hasType)
end
function CcModem.getMethodsRemote(self, name)
    local methods = {}
    methods = self._internalModem:get().getMethodsRemote(name)
    return Optional:ofNullable(methods)
end
function CcModem.callRemote(self, remoteName, method, ...)
    local args = {...}
    local argsTable = TableUtil:fromArray(args)
    local result
    result = self._internalModem:get().callRemote(remoteName, method, table.unpack(argsTable))
    return result
end
function CcModem.getNameLocal(self)
    local name
    name = self._internalModem:get().getNameLocal()
    return Optional:ofNullable(name)
end
CcModem._internalModem = CcPeripheral:find("modem")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccMonitor"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Monitor peripheral.
-- Allows interaction with ComputerCraft monitors by writing text, changing colors,
-- handling touch events, and managing display properties.
____exports.CcMonitor = __TS__Class()
local CcMonitor = ____exports.CcMonitor
CcMonitor.name = "CcMonitor"
function CcMonitor.prototype.____constructor(self)
end
function CcMonitor.write(self, text)
    self._internalMonitor:get().write(text)
end
function CcMonitor.scroll(self, y)
    self._internalMonitor:get().scroll(y)
end
function CcMonitor.getCursorPos(self)
    local x = 0
    local y = 0
    x, y = self._internalMonitor:get().getCursorPos()
    return {x, y}
end
function CcMonitor.setCursorPos(self, x, y)
    self._internalMonitor:get().setCursorPos(x, y)
end
function CcMonitor.getCursorBlink(self)
    return return self._internalMonitor:get().getCursorBlink()
end
function CcMonitor.setCursorBlink(self, blink)
    self._internalMonitor:get().setCursorBlink(blink)
end
function CcMonitor.getSize(self)
    local width = 0
    local height = 0
    width, height = self._internalMonitor:get().getSize()
    return {width, height}
end
function CcMonitor.clear(self)
    self._internalMonitor:get().clear()
end
function CcMonitor.clearLine(self)
    self._internalMonitor:get().clearLine()
end
function CcMonitor.setTextScale(self, scale)
    self._internalMonitor:get().setTextScale(scale)
end
function CcMonitor.getTextScale(self)
    return return self._internalMonitor:get().getTextScale()
end
function CcMonitor.onResize(self, listener)
    local event = ""
    local side = ""
    while true do
        local event, side = os.pullEvent("monitor_resize")
        listener(nil, {event = event, side = side})
    end
end
function CcMonitor.onTouch(self, listener)
    local event = ""
    local side = ""
    local x = 0
    local y = 0
    while true do
        local event, side, x, y = os.pullEvent("monitor_touch")
        listener(nil, {event = event, side = side, x = x, y = y})
    end
end
CcMonitor._internalMonitor = CcPeripheral:find("monitor")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccPrinter"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- A class representing the Printer peripheral from ComputerCraft.
-- Allows printing text onto pages which can be crafted into printed pages or books.
-- Requires ink (colored dyes) and paper to function.
____exports.CcPrinter = __TS__Class()
local CcPrinter = ____exports.CcPrinter
CcPrinter.name = "CcPrinter"
function CcPrinter.prototype.____constructor(self)
end
function CcPrinter.write(self, text)
    self._internalPrinter:get().write(text)
end
function CcPrinter.getCursorPos(self)
    local x = 0
    local y = 0
    x, y = self._internalPrinter:get().getCursorPos()
    return {x = x, y = y}
end
function CcPrinter.setCursorPos(self, x, y)
    self._internalPrinter:get().setCursorPos(x, y)
end
function CcPrinter.getPageSize(self)
    local width = 0
    local height = 0
    width, height = self._internalPrinter:get().getPageSize()
    return {width = width, height = height}
end
function CcPrinter.newPage(self)
    local success = false
    success = self._internalPrinter:get().newPage()
    return success
end
function CcPrinter.endPage(self)
    local success = false
    success = self._internalPrinter:get().endPage()
    return success
end
function CcPrinter.setPageTitle(self, title)
    self._internalPrinter:get().setPageTitle(title)
end
function CcPrinter.getInkLevel(self)
    local level = 0
    level = self._internalPrinter:get().getInkLevel()
    return level
end
function CcPrinter.getPaperLevel(self)
    local level = 0
    level = self._internalPrinter:get().getPaperLevel()
    return level
end
CcPrinter._internalPrinter = CcPeripheral:find("printer")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccRedstoneRelay"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- The redstone relay is a peripheral that allows reading and outputting redstone signals.
-- While this is not very useful on its own (as computers have the same functionality built-in),
-- this can be used with wired modems to interact with multiple redstone signals from the same computer.
____exports.CcRedstoneRelay = __TS__Class()
local CcRedstoneRelay = ____exports.CcRedstoneRelay
CcRedstoneRelay.name = "CcRedstoneRelay"
function CcRedstoneRelay.prototype.____constructor(self)
end
function CcRedstoneRelay.setOutput(self, side, on)
    self._internalRelay:get().setOutput(side, on)
end
function CcRedstoneRelay.getOutput(self, side)
    return return self._internalRelay:get().getOutput(side)
end
function CcRedstoneRelay.getInput(self, side)
    return return self._internalRelay:get().getInput(side)
end
function CcRedstoneRelay.setAnalogOutput(self, side, value)
    self._internalRelay:get().setAnalogOutput(side, value)
end
function CcRedstoneRelay.setAnalogueOutput(self, side, value)
    self._internalRelay:get().setAnalogueOutput(side, value)
end
function CcRedstoneRelay.getAnalogOutput(self, side)
    return return self._internalRelay:get().getAnalogOutput(side)
end
function CcRedstoneRelay.getAnalogueOutput(self, side)
    return return self._internalRelay:get().getAnalogueOutput(side)
end
function CcRedstoneRelay.getAnalogInput(self, side)
    return return self._internalRelay:get().getAnalogInput(side)
end
function CcRedstoneRelay.getAnalogueInput(self, side)
    return return self._internalRelay:get().getAnalogueInput(side)
end
function CcRedstoneRelay.setBundledOutput(self, side, output)
    self._internalRelay:get().setBundledOutput(side, output)
end
function CcRedstoneRelay.getBundledOutput(self, side)
    return return self._internalRelay:get().getBundledOutput(side)
end
function CcRedstoneRelay.getBundledInput(self, side)
    return return self._internalRelay:get().getBundledInput(side)
end
function CcRedstoneRelay.testBundledInput(self, side, mask)
    return return self._internalRelay:get().testBundledInput(side, mask)
end
CcRedstoneRelay._internalRelay = CcPeripheral:find("redstone_relay")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.peripherals.ccSpeaker"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____ccPeripheral = require("preBuild.src.util.computer.api.tier1.globals.ccPeripheral")
local CcPeripheral = ____ccPeripheral.CcPeripheral
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- The `CcSpeaker` class provides a static API for interacting with a connected Computercraft speaker peripheral.
-- It allows playing note block notes, Minecraft sounds, streaming audio data, and stopping audio playback.
-- 
-- Based on the documentation: https://tweaked.cc/peripheral/speaker.html
____exports.CcSpeaker = __TS__Class()
local CcSpeaker = ____exports.CcSpeaker
CcSpeaker.name = "CcSpeaker"
function CcSpeaker.prototype.____constructor(self)
end
function CcSpeaker.playNote(self, instrument, volume, pitch)
    local success = false
    success = self._internalSpeaker:get().playNote(instrument, volume, pitch)
    return success
end
function CcSpeaker.playSound(self, name, volume, pitch)
    local success = false
    success = self._internalSpeaker:get().playSound(name, volume, pitch)
    return success
end
function CcSpeaker.playAudio(self, audio, volume)
    local success = false
    success = self._internalSpeaker:get().playAudio(audio, volume)
    return success
end
function CcSpeaker.stop(self)
    self._internalSpeaker:get().stop()
end
CcSpeaker._internalSpeaker = CcPeripheral:find("speaker")
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.consts.events"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Events = Events or ({})
____exports.Events.ALARM = "alarm"
____exports.Events.CHAR = "char"
____exports.Events.COMPUTER_COMMAND = "computer_command"
____exports.Events.DISK = "disk"
____exports.Events.DISK_EJECT = "disk_eject"
____exports.Events.FILE_TRANSFER = "file_transfer"
____exports.Events.HTTP_CHECK = "http_check"
____exports.Events.HTTP_FAILURE = "http_failure"
____exports.Events.HTTP_SUCCESS = "http_success"
____exports.Events.KEY = "key"
____exports.Events.KEY_UP = "key_up"
____exports.Events.MODEM_MESSAGE = "modem_message"
____exports.Events.MONITOR_RESIZE = "monitor_resize"
____exports.Events.MONITOR_TOUCH = "monitor_touch"
____exports.Events.MOUSE_CLICK = "mouse_click"
____exports.Events.MOUSE_DRAG = "mouse_drag"
____exports.Events.MOUSE_SCROLL = "mouse_scroll"
____exports.Events.MOUSE_UP = "mouse_up"
____exports.Events.PASTE = "paste"
____exports.Events.PERIPHERAL = "peripheral"
____exports.Events.PERIPHERAL_DETACH = "peripheral_detach"
____exports.Events.REDNET_MESSAGE = "rednet_message"
____exports.Events.REDSTONE = "redstone"
____exports.Events.SPEAKER_AUDIO_EMPTY = "speaker_audio_empty"
____exports.Events.TASK_COMPLETE = "task_complete"
____exports.Events.TERM_RESIZE = "term_resize"
____exports.Events.TERMINATE = "terminate"
____exports.Events.TIMER = "timer"
____exports.Events.TURTLE_INVENTORY = "turtle_inventory"
____exports.Events.WEBSOCKET_CLOSED = "websocket_closed"
____exports.Events.WEBSOCKET_FAILURE = "websocket_failure"
____exports.Events.WEBSOCKET_MESSAGE = "websocket_message"
____exports.Events.WEBSOCKET_SUCCESS = "websocket_success"
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.consts.keys"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____ccKeys = require("preBuild.src.util.computer.api.tier1.globals.ccKeys")
local CcKeys = ____ccKeys.CcKeys
____exports.Keys = CcKeys.codes
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.consts.mouseButton"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Enum representing mouse buttons.
-- 
-- This enumeration provides identifiers for commonly used mouse buttons, such as left, right, and middle buttons.
-- 
-- Enum values:
-- - `LEFT`: Represents the left mouse button, with a numeric value of 1.
-- - `RIGHT`: Represents the right mouse button, with a numeric value of 2.
-- - `MIDDLE`: Represents the middle mouse button, typically the scroll wheel button, with a numeric value of 3.
-- 
-- Use this enum to handle mouse button inputs in a consistent and readable manner.
____exports.MouseButton = MouseButton or ({})
____exports.MouseButton.LEFT = 1
____exports.MouseButton[____exports.MouseButton.LEFT] = "LEFT"
____exports.MouseButton.RIGHT = 2
____exports.MouseButton[____exports.MouseButton.RIGHT] = "RIGHT"
____exports.MouseButton.MIDDLE = 3
____exports.MouseButton[____exports.MouseButton.MIDDLE] = "MIDDLE"
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.consts.scrollDirection"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Represents the direction of a scrolling action.
-- 
-- This enum provides two possible values for scrolling direction:
-- UP for scrolling upwards and DOWN for scrolling downwards.
-- 
-- Each direction is associated with a numeric value:
-- - UP corresponds to -1.
-- - DOWN corresponds to 1.
____exports.ScrollDirection = ScrollDirection or ({})
____exports.ScrollDirection.UP = -1
____exports.ScrollDirection[____exports.ScrollDirection.UP] = "UP"
____exports.ScrollDirection.DOWN = 1
____exports.ScrollDirection[____exports.ScrollDirection.DOWN] = "DOWN"
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.alarmEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.charEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.computerCommandEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.files.transferredFileReadHandle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____fileReadHandle = require("preBuild.src.util.computer.api.tier1.types.files.fileReadHandle")
local FileReadHandle = ____fileReadHandle.FileReadHandle
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
--- Represents a read-only handle to access a transferred file. This class extends the `FileReadHandle` class and provides
-- functionality specific to handling files that have been transferred between systems or contexts.
-- 
-- Use this class to interact with transferred files in a read-only manner. The primary method provided is for
-- retrieving the name of the file associated with this handle.
-- 
-- This class assumes the presence of a `handle` object with methods that are invoked to interact with the underlying file.
-- It is not intended for writing or modifying the file's contents.
-- 
-- Methods:
-- - `getName`: Retrieves the name of the transferred file as a string.
-- 
-- Based on the documentation: https://tweaked.cc/event/file_transfer.html
____exports.TransferredFileReadHandle = __TS__Class()
local TransferredFileReadHandle = ____exports.TransferredFileReadHandle
TransferredFileReadHandle.name = "TransferredFileReadHandle"
__TS__ClassExtends(TransferredFileReadHandle, FileReadHandle)
function TransferredFileReadHandle.prototype.getName(self)
    return self.handle.getName()
end
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.fileTransferEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.modemMessageEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.pasteEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.rednetMessageEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.redstoneEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.speakerAudioEmptyEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.taskCompleteEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.terminalResizeEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.terminateEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.timerEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.turtleInventoryChangeEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.disk.diskEjectEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.disk.diskEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.http.httpCheckEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.http.httpFailureEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.http.httpSuccessEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.key.keyDownEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.key.keyUpEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.monitor.monitorResizeEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.monitor.monitorTouchEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.mouse.mouseClickEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.mouse.mouseClickReleaseEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.mouse.mouseDragEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.mouse.mouseScrollEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.peripheral.peripheralAttachEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.peripheral.peripheralDetachEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.websocket.websocketClosedEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.websocket.websocketFailureEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.websocket.websocketMessageEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.computer.api.tier1.types.events.websocket.websocketSuccessEvent"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["preBuild.src.util.types.collection.luaTableList"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__Symbol = ____lualib.__TS__Symbol
local Symbol = ____lualib.Symbol
local ____exports = {}
local ____lua = require("preBuild.src.lua.lua")
local Lua = ____lua.Lua
local ____optional = require("preBuild.src.util.types.optional")
local Optional = ____optional.Optional
---
-- @deprecated Use LuaList instead
____exports.LuaTableList = __TS__Class()
local LuaTableList = ____exports.LuaTableList
LuaTableList.name = "LuaTableList"
function LuaTableList.prototype.____constructor(self)
    self._table = {}
end
function LuaTableList.of(self, elements)
    local result = __TS__New(____exports.LuaTableList)
    for ____, element in ipairs(elements) do
        result:add(element)
    end
    return result
end
function LuaTableList.ofSingleton(self, element)
    return __TS__New(____exports.LuaTableList):add(element)
end
function LuaTableList.empty(self)
    return __TS__New(____exports.LuaTableList)
end
function LuaTableList.prototype.toArray(self)
    local result = {}
    for ____, element in __TS__Iterator(self) do
        result[#result + 1] = element
    end
    return result
end
function LuaTableList.prototype.__tostring(self)
    local body = self:select(function(____, element) return tostring(element) end):join(", ")
    return ("[" .. body) .. "]"
end
function LuaTableList.prototype.size(self)
    return #self._table
end
function LuaTableList.prototype.add(self, element)
    self._table[#self._table + 1] = element
    return self
end
function LuaTableList.prototype.insert(self, element, index)
    table.insert(self._table, index, element)
    return self
end
function LuaTableList.prototype.get(self, index)
    return self._table[index]
end
function LuaTableList.prototype.remove(self, element)
    local index = self:indexOf(element)
    if index:isEmpty() then
        return Optional:empty()
    end
    local indexValue = index:getValueOrDefault(0)
    return Optional:of(table.remove(self._table, indexValue))
end
function LuaTableList.prototype.removeAt(self, index)
    return table.remove(self._table, index)
end
function LuaTableList.prototype.indexOf(self, element)
    for index, value in ipairs(self._table) do
        if value == element then
            return Optional:of(index)
        end
    end
    return Optional:of(nil)
end
LuaTableList.prototype[Symbol.iterator] = function(self)
    local index = 0
    local size = self:size()
    return {next = function()
        index = index + 1
        if index <= size then
            return {
                done = false,
                value = self:get(index)
            }
        end
        return {done = true, value = nil}
    end}
end
function LuaTableList.prototype.forEach(self, callback)
    for ____, element in __TS__Iterator(self) do
        callback(nil, element)
    end
    return self
end
function LuaTableList.prototype.select(self, callback)
    local result = __TS__New(____exports.LuaTableList)
    for ____, element in __TS__Iterator(self) do
        result:add(callback(nil, element))
    end
    return result
end
function LuaTableList.prototype.where(self, callback)
    local result = __TS__New(____exports.LuaTableList)
    for ____, element in __TS__Iterator(self) do
        if callback(nil, element) then
            result:add(element)
        end
    end
    return result
end
function LuaTableList.prototype.join(self, separator)
    local stringElements = self:select(function(____, element) return tostring(element) end)
    local result = ""
    local size = stringElements:size()
    local index = 0
    for ____, stringElement in __TS__Iterator(stringElements) do
        index = index + 1
        result = result .. stringElement
        if index < size then
            result = result .. separator
        end
    end
    return result
end
return ____exports
 end,
["preBuild.src.util.types.minecraft.vector2D"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
____exports.Vector2D = __TS__Class()
local Vector2D = ____exports.Vector2D
Vector2D.name = "Vector2D"
function Vector2D.prototype.____constructor(self, x, y)
    self.x = x
    self.y = y
end
function Vector2D.zero(self)
    return __TS__New(____exports.Vector2D, 0, 0)
end
function Vector2D.from(self, vector)
    return __TS__New(____exports.Vector2D, vector.x, vector.y)
end
function Vector2D.prototype.add(self, other)
    return __TS__New(____exports.Vector2D, self.x + other.x, self.y + other.y)
end
function Vector2D.prototype.subtract(self, other)
    return __TS__New(____exports.Vector2D, self.x - other.x, self.y - other.y)
end
function Vector2D.prototype.scale(self, factor)
    return __TS__New(____exports.Vector2D, self.x * factor, self.y * factor)
end
function Vector2D.prototype.length(self)
    return math.sqrt(self.x * self.x + self.y * self.y)
end
function Vector2D.prototype.normalize(self)
    local len = self:length()
    if len == 0 then
        return ____exports.Vector2D:zero()
    end
    return self:scale(1 / len)
end
function Vector2D.prototype.__tostring(self)
    return ((("Vector2D(" .. tostring(self.x)) .. ", ") .. tostring(self.y)) .. ")"
end
return ____exports
 end,
["preBuild.src.util.types.minecraft.vector3D"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
____exports.Vector3D = __TS__Class()
local Vector3D = ____exports.Vector3D
Vector3D.name = "Vector3D"
function Vector3D.prototype.____constructor(self, x, y, z)
    self.x = x
    self.y = y
    self.z = z
end
function Vector3D.prototype.add(self, other)
    return __TS__New(____exports.Vector3D, self.x + other.x, self.y + other.y, self.z + other.z)
end
function Vector3D.prototype.subtract(self, other)
    return __TS__New(____exports.Vector3D, self.x - other.x, self.y - other.y, self.z - other.z)
end
function Vector3D.prototype.length(self)
    return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end
function Vector3D.prototype.normalize(self)
    local len = self:length()
    if len == 0 then
        return __TS__New(____exports.Vector3D, 0, 0, 0)
    end
    return __TS__New(____exports.Vector3D, self.x / len, self.y / len, self.z / len)
end
return ____exports
 end,
}
return require("preBuild.src.entrypoints.example.entrypoint", ...)
