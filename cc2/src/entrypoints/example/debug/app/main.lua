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
["bundle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__Spread = ____lualib.__TS__Spread
local __TS__ArrayFrom = ____lualib.__TS__ArrayFrom
local __TS__ArrayJoin = ____lualib.__TS__ArrayJoin
local __TS__ArrayUnshift = ____lualib.__TS__ArrayUnshift
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayFlat = ____lualib.__TS__ArrayFlat
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__Unpack = ____lualib.__TS__Unpack
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local Map = ____lualib.Map
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__StringSplit = ____lualib.__TS__StringSplit
local ____ = "use strict";
(function()
    local Optional, LuaList
    local ____class_0 = __TS__Class()
    ____class_0.name = "Lua"
    function ____class_0.prototype.____constructor(self)
    end
    function ____class_0.literal(self, luaVersion)
        error(
            __TS__New(
                Error,
                ("Lua.literal(" .. tostring(luaVersion)) .. ") has no Typescript alternative"
            ),
            0
        )
    end
    local Lua = ____class_0
    local _CcPeripheral = __TS__Class()
    _CcPeripheral.name = "_CcPeripheral"
    function _CcPeripheral.prototype.____constructor(self, internalPeripheral)
        self.internalPeripheral = internalPeripheral
    end
    function _CcPeripheral.prototype.get(self)
        return self.internalPeripheral
    end
    function _CcPeripheral.find(self, peripheralName, filter)
        local internalPeripheral = peripheral.find(peripheralName, filter)
        if internalPeripheral == nil then
            error(
                __TS__New(
                    Error,
                    ("No peripheral of type \"" .. tostring(peripheralName)) .. "\" found."
                ),
                0
            )
        end
        return __TS__New(_CcPeripheral, internalPeripheral)
    end
    function _CcPeripheral.getNames(self)
        return peripheral.getNames()
    end
    function _CcPeripheral.isPresent(self, name)
        return peripheral.isPresent(name)
    end
    function _CcPeripheral.getType(self, peripheral)
        return peripheral.getType(peripheral)
    end
    function _CcPeripheral.hasType(self, peripheral, peripheralType)
        return peripheral.hasType(peripheral, peripheralType)
    end
    function _CcPeripheral.getMethods(self, name)
        return peripheral.getMethods(name)
    end
    function _CcPeripheral.getName(self, peripheral)
        return peripheral.getName(peripheral)
    end
    function _CcPeripheral.call(self, name, method, ...)
        return peripheral.call(name, method, ...)
    end
    function _CcPeripheral.wrap(self, name)
        return peripheral.wrap(name)
    end
    function _CcPeripheral.prototype.hasType(self, peripheralType)
        return peripheral.hasType(self.internalPeripheral, peripheralType)
    end
    function _CcPeripheral.prototype.getType(self)
        return peripheral.getType(self.internalPeripheral)
    end
    function _CcPeripheral.prototype.getName(self)
        return peripheral.getName(self.internalPeripheral)
    end
    function _CcPeripheral.prototype.call(self, method, ...)
        return peripheral.call(self.internalPeripheral, method, ...)
    end
    function _CcPeripheral.prototype.getMethods(self)
        return peripheral.getMethods(self.internalPeripheral)
    end
    local CcPeripheral = _CcPeripheral
    local ____class_1 = __TS__Class()
    ____class_1.name = "ChatBox"
    function ____class_1.prototype.____constructor(self)
    end
    function ____class_1.onMessage(self, listener)
        local event = ""
        local username = ""
        local message = ""
        local uuid = ""
        local isHidden = true
        while true do
            local event, username, message, uuid, isHidden = os.pullEvent("chat")
            listener(_G, {
                event = event,
                username = username,
                message = message,
                uuid = uuid,
                isHidden = isHidden
            })
        end
    end
    function ____class_1.sendMessage(self, message, prefix, brackets, bracketColor, range)
        self._internalChatBox:get().sendMessage(message, prefix, brackets, bracketColor, range)
    end
    function ____class_1.sendMessageToPlayer(self, message, username, prefix, brackets, bracketColor, range)
        self._internalChatBox:get().sendMessageToPlayer(message, username, prefix, brackets, bracketColor, range)
    end
    function ____class_1.sendToastToPlayer(self, message, title, username, prefix, brackets, bracketColor, range)
        self._internalChatBox:get().sendToastToPlayer(message, title, username, prefix, brackets, bracketColor, range)
    end
    function ____class_1.sendFormattedMessage(self, json, prefix, brackets, bracketColor, range)
        self._internalChatBox:get().sendFormattedMessage(json, prefix, brackets, bracketColor, range)
    end
    function ____class_1.sendFormattedMessageToPlayer(self, json, username, prefix, brackets, bracketColor, range)
        self._internalChatBox:get().sendFormattedMessageToPlayer(json, username, prefix, brackets, bracketColor, range)
    end
    function ____class_1.sendFormattedToastToPlayer(self, messageJson, titleJson, username, prefix, brackets, bracketColor, range)
        self._internalChatBox:get().sendFormattedToastToPlayer(messageJson, titleJson, username, prefix, brackets, bracketColor, range)
    end
    ____class_1._internalChatBox = CcPeripheral:find("chatBox")
    local ChatBox = ____class_1
    local _Result = __TS__Class()
    _Result.name = "_Result"
    function _Result.prototype.____constructor(self, value, errorMessage)
        if value == nil and errorMessage == nil then
            error(
                __TS__New(Error, "Cannot create a result with both undefined values"),
                0
            )
        end
        self.value = value
        self.errorMessage = errorMessage
    end
    function _Result.of(self, value)
        return __TS__New(_Result, value, nil)
    end
    function _Result.ofError(self, value, errorMessage)
        return __TS__New(_Result, value, errorMessage)
    end
    function _Result.void(self)
        return __TS__New(_Result, "No value", nil)
    end
    function _Result.error(self, errorMessage)
        local ____Result_3 = _Result
        local ____errorMessage_2 = errorMessage
        if ____errorMessage_2 == nil then
            ____errorMessage_2 = "No error message given"
        end
        return __TS__New(____Result_3, nil, ____errorMessage_2)
    end
    function _Result.errorValue(self, value, errorMessage)
        return __TS__New(_Result, value, errorMessage)
    end
    function _Result.prototype.isSuccess(self)
        return self.errorMessage == nil
    end
    function _Result.prototype.isError(self)
        return not self:isSuccess()
    end
    function _Result.prototype.ifSuccess(self, callback)
        if self:isSuccess() then
            callback(_G, self.value)
        end
        return self
    end
    function _Result.prototype.ifError(self, callback)
        if self:isError() then
            callback(_G, self.errorMessage)
        end
        return self
    end
    function _Result.prototype.getValueUnsafe(self, message)
        if not self.value then
            local ____Error_6 = Error
            local ____message_4 = message
            if ____message_4 == nil then
                ____message_4 = self.errorMessage
            end
            local ____message_4_5 = ____message_4
            if ____message_4_5 == nil then
                ____message_4_5 = "Cannot unwrap `Result` value"
            end
            error(
                __TS__New(____Error_6, ____message_4_5),
                0
            )
        end
        return self.value
    end
    function _Result.prototype.getValueOrDefault(self, defaultValue)
        local ____self_value_7 = self.value
        if ____self_value_7 == nil then
            ____self_value_7 = defaultValue
        end
        return ____self_value_7
    end
    function _Result.prototype.getErrorMessage(self)
        return self.errorMessage
    end
    function _Result.prototype.asOptional(self)
        return Optional:of(self.value)
    end
    _Result.prototype["then"] = function(self, callback)
        if not self.value then
            return _Result:error(self.errorMessage)
        end
        return _Result:of(callback(_G, self.value))
    end
    local Result = _Result
    local _Optional = __TS__Class()
    _Optional.name = "_Optional"
    function _Optional.prototype.____constructor(self, value)
        self.value = value
    end
    function _Optional.of(self, value)
        return __TS__New(_Optional, value)
    end
    function _Optional.ofNullable(self, value)
        if value == nil or value == nil then
            return _Optional:empty()
        end
        return _Optional:of(value)
    end
    function _Optional.empty(self)
        return __TS__New(_Optional, nil)
    end
    function _Optional.prototype.isPresent(self)
        return self.value ~= nil
    end
    function _Optional.prototype.isEmpty(self)
        return self.value == nil
    end
    function _Optional.prototype.getValueUnsafe(self, message)
        if not self.value then
            local ____Error_9 = Error
            local ____message_8 = message
            if ____message_8 == nil then
                ____message_8 = "Cannot unwrap `Optional` value!"
            end
            error(
                __TS__New(____Error_9, ____message_8),
                0
            )
        end
        return self.value
    end
    function _Optional.prototype.getValueOrDefault(self, defaultValue)
        local ____self_value_10 = self.value
        if ____self_value_10 == nil then
            ____self_value_10 = defaultValue
        end
        return ____self_value_10
    end
    _Optional.prototype["then"] = function(self, callback)
        if not self.value then
            return _Optional:empty()
        end
        return _Optional:of(callback(_G, self.value))
    end
    function _Optional.prototype.ifPresent(self, callback)
        if self.value then
            callback(_G, self.value)
        end
        return self
    end
    function _Optional.prototype.ifEmpty(self, callback)
        if not self.value then
            callback(_G)
        end
        return self
    end
    _Optional.prototype["or"] = function(self, other)
        local ____table_value_11
        if self.value then
            ____table_value_11 = self
        else
            ____table_value_11 = other
        end
        return ____table_value_11
    end
    function _Optional.prototype.toResult(self, errorMessage)
        if self.value then
            return Result:of(self.value)
        end
        return Result:ofError(self.value, errorMessage)
    end
    Optional = _Optional
    local _LuaSet = __TS__Class()
    _LuaSet.name = "_LuaSet"
    function _LuaSet.prototype.____constructor(self)
        self.elements = __TS__New(Set)
    end
    function _LuaSet.ofArray(self, elements)
        return __TS__New(_LuaSet):addAll(elements)
    end
    function _LuaSet.ofList(self, elements)
        return __TS__New(_LuaSet):addAll(elements)
    end
    function _LuaSet.ofSingleton(self, element)
        return __TS__New(_LuaSet):add(element)
    end
    function _LuaSet.empty(self)
        return __TS__New(_LuaSet)
    end
    function _LuaSet.prototype.addAll(self, elements)
        elements:forEach(function(____, element) return self:add(element) end)
        return self
    end
    function _LuaSet.prototype.removeAll(self, elements)
        elements:forEach(function(____, element) return self:remove(element) end)
        return self
    end
    function _LuaSet.prototype.add(self, element)
        self.elements:add(element)
        return self
    end
    function _LuaSet.prototype.remove(self, element)
        self.elements:delete(element)
        return self
    end
    function _LuaSet.prototype.contains(self, element)
        return self.elements:has(element)
    end
    function _LuaSet.prototype.select(self, selector)
        local result = __TS__New(_LuaSet)
        self.elements:forEach(function(____, element) return result:add(selector(_G, element)) end)
        return result
    end
    function _LuaSet.prototype.where(self, predicate)
        local result = __TS__New(_LuaSet)
        self.elements:forEach(function(____, element)
            if predicate(_G, element) then
                result:add(element)
            end
        end)
        return result
    end
    function _LuaSet.prototype.clear(self)
        self.elements:clear()
        return self
    end
    function _LuaSet.prototype.size(self)
        return self.elements.size
    end
    function _LuaSet.prototype.isEmpty(self)
        return self.elements.size == 0
    end
    function _LuaSet.prototype.isNotEmpty(self)
        return self.elements.size > 0
    end
    function _LuaSet.prototype.forEach(self, action)
        self.elements:forEach(action)
        return self
    end
    function _LuaSet.prototype.toList(self)
        return LuaList:ofSet(self)
    end
    function _LuaSet.prototype.copy(self)
        return __TS__New(_LuaSet):addAll(self)
    end
    function _LuaSet.prototype.union(self, other)
        return __TS__New(_LuaSet):addAll(self):addAll(other)
    end
    function _LuaSet.prototype.intersection(self, other)
        return self:where(other.contains)
    end
    function _LuaSet.prototype.difference(self, other)
        return self:where(function(____, element) return not other:contains(element) end)
    end
    function _LuaSet.prototype.isSubsetOf(self, other)
        return other:difference(self):isEmpty()
    end
    function _LuaSet.prototype.isSupersetOf(self, other)
        return other:isSubsetOf(self)
    end
    function _LuaSet.prototype.isStrictSubsetOf(self, other)
        return self:size() < other:size() and self:isSubsetOf(other)
    end
    function _LuaSet.prototype.isStrictSupersetOf(self, other)
        return self:size() > other:size() and self:isSupersetOf(other)
    end
    function _LuaSet.prototype.toArray(self)
        return {__TS__Spread(self.elements)}
    end
    local LuaSet = _LuaSet
    local ____class_12 = __TS__Class()
    ____class_12.name = "TableUtil"
    function ____class_12.prototype.____constructor(self)
    end
    function ____class_12.fromArray(self, elements)
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
    local TableUtil = ____class_12
    local _LuaList = __TS__Class()
    _LuaList.name = "_LuaList"
    function _LuaList.prototype.____constructor(self, elements)
        self.elements = {}
        self.elements = elements
    end
    function _LuaList.of(self, elements)
        return __TS__New(_LuaList, elements)
    end
    function _LuaList.ofTable(self, elements)
        local newList = __TS__New(_LuaList, {})
        for index, value in ipairs(elements) do
            newList:append(value)
        end
        return newList
    end
    function _LuaList.ofSingleton(self, element)
        return __TS__New(_LuaList, {element})
    end
    function _LuaList.ofRange(self, start, count)
        return __TS__New(
            _LuaList,
            __TS__ArrayFrom(
                {length = count},
                function(____, _, i) return start + i end
            )
        )
    end
    function _LuaList.ofSet(self, set)
        return __TS__New(
            _LuaList,
            set:toArray()
        )
    end
    function _LuaList.empty(self)
        return __TS__New(_LuaList, {})
    end
    function _LuaList.prototype.__tostring(self)
        return ("[" .. __TS__ArrayJoin(self.elements, ", ")) .. "]"
    end
    function _LuaList.prototype.get(self, index)
        return self.elements[index]
    end
    function _LuaList.prototype.append(self, element)
        local ____self_elements_13 = self.elements
        ____self_elements_13[#____self_elements_13 + 1] = element
        return self
    end
    function _LuaList.prototype.appendAll(self, elements)
        elements:forEach(self.append)
        return self
    end
    function _LuaList.prototype.prepend(self, element)
        __TS__ArrayUnshift(self.elements, element)
        return self
    end
    function _LuaList.prototype.set(self, index, element)
        self.elements[index] = element
        return self
    end
    function _LuaList.prototype.removeFirst(self)
        if #self.elements == 0 then
            return Optional:empty()
        end
        return Optional:of(table.remove(self.elements, 1))
    end
    function _LuaList.prototype.removeLast(self)
        if #self.elements == 0 then
            return Optional:empty()
        end
        return Optional:of(table.remove(self.elements))
    end
    function _LuaList.prototype.removeAt(self, index)
        if index < 0 or index >= #self.elements then
            error(
                __TS__New(Error, "Index was out of range"),
                0
            )
        end
        return __TS__ArraySplice(self.elements, index, 1)[1]
    end
    function _LuaList.prototype.remove(self, element)
        local index = __TS__ArrayIndexOf(self.elements, element)
        if index == -1 then
            return self
        end
        __TS__ArraySplice(self.elements, index, 1)
        return self
    end
    function _LuaList.prototype.clear(self)
        __TS__ArraySplice(self.elements, 0)
        return self
    end
    function _LuaList.prototype.contains(self, element)
        return __TS__ArrayIncludes(self.elements, element)
    end
    function _LuaList.prototype.containsAll(self, elements)
        return elements:every(function(____, element) return self:contains(element) end)
    end
    function _LuaList.prototype.containsAny(self, elements)
        return elements:some(function(____, element) return self:contains(element) end)
    end
    function _LuaList.prototype.indexOf(self, element)
        return __TS__ArrayIndexOf(self.elements, element)
    end
    function _LuaList.prototype.isEmpty(self)
        return #self.elements == 0
    end
    function _LuaList.prototype.isNotEmpty(self)
        return #self.elements > 0
    end
    function _LuaList.prototype.reversed(self)
        return __TS__New(
            _LuaList,
            __TS__ArrayReverse(self.elements)
        )
    end
    function _LuaList.prototype.sorted(self, compareFn)
        return __TS__New(
            _LuaList,
            __TS__ArraySort(self.elements, compareFn)
        )
    end
    function _LuaList.prototype.join(self, separator)
        return __TS__ArrayJoin(self.elements, separator)
    end
    function _LuaList.prototype.flatten(self)
        return __TS__New(
            _LuaList,
            __TS__ArrayFlat(self.elements)
        )
    end
    function _LuaList.prototype.size(self)
        return #self.elements
    end
    function _LuaList.prototype.forEach(self, action)
        __TS__ArrayForEach(self.elements, action)
        return self
    end
    function _LuaList.prototype.select(self, selector)
        return __TS__New(
            _LuaList,
            __TS__ArrayMap(self.elements, selector)
        )
    end
    function _LuaList.prototype.where(self, predicate)
        return __TS__New(
            _LuaList,
            __TS__ArrayFilter(self.elements, predicate)
        )
    end
    function _LuaList.prototype.reduce(self, collector, initialValue)
        return __TS__ArrayReduce(self.elements, collector, initialValue)
    end
    function _LuaList.prototype.first(self)
        if #self.elements == 0 then
            return Optional:empty()
        end
        return Optional:of(self.elements[1])
    end
    function _LuaList.prototype.firstOrDefault(self, defaultValue)
        if #self.elements == 0 then
            return defaultValue
        end
        return self.elements[1]
    end
    function _LuaList.prototype.last(self)
        if #self.elements == 0 then
            return Optional:empty()
        end
        return Optional:of(self.elements[#self.elements])
    end
    function _LuaList.prototype.lastOrDefault(self, defaultValue)
        if #self.elements == 0 then
            return defaultValue
        end
        return self.elements[#self.elements]
    end
    function _LuaList.prototype.any(self, predicate)
        return __TS__ArraySome(self.elements, predicate)
    end
    function _LuaList.prototype.all(self, predicate)
        return __TS__ArrayEvery(self.elements, predicate)
    end
    function _LuaList.prototype.sum(self)
        return self:reduce(
            function(____, sum, element) return sum + element end,
            0
        )
    end
    function _LuaList.prototype.average(self)
        if #self.elements == 0 then
            return Optional:empty()
        end
        return Optional:of(self:sum() / #self.elements)
    end
    function _LuaList.prototype.min(self)
        if #self.elements == 0 then
            return Optional:empty()
        end
        return Optional:of(math.min(__TS__Unpack(self.elements)))
    end
    function _LuaList.prototype.minBy(self, selector)
        if #self.elements == 0 then
            return Optional:empty()
        end
        local minElement = self.elements[1]
        local minSelectorValue = selector(_G, self.elements[1])
        do
            local i = 1
            while i < #self.elements do
                local element = self.elements[i + 1]
                local selectorValue = selector(_G, element)
                local ____minSelectorValue_14 = minSelectorValue
                if ____minSelectorValue_14 == nil then
                    ____minSelectorValue_14 = 0
                end
                if selectorValue < ____minSelectorValue_14 then
                    minElement = element
                    minSelectorValue = selectorValue
                end
                i = i + 1
            end
        end
        return Optional:of(minElement)
    end
    function _LuaList.prototype.max(self)
        if #self.elements == 0 then
            return Optional:empty()
        end
        return Optional:of(math.max(__TS__Unpack(self.elements)))
    end
    function _LuaList.prototype.maxBy(self, selector)
        if #self.elements == 0 then
            return Optional:empty()
        end
        local maxElement = self.elements[1]
        local maxSelectorValue = selector(_G, self.elements[1])
        do
            local i = 1
            while i < #self.elements do
                local element = self.elements[i + 1]
                local selectorValue = selector(_G, element)
                local ____maxSelectorValue_15 = maxSelectorValue
                if ____maxSelectorValue_15 == nil then
                    ____maxSelectorValue_15 = 0
                end
                if selectorValue > ____maxSelectorValue_15 then
                    maxElement = element
                    maxSelectorValue = selectorValue
                end
                i = i + 1
            end
        end
        return Optional:of(maxElement)
    end
    function _LuaList.prototype.copy(self)
        return __TS__New(
            _LuaList,
            __TS__ArraySlice(self.elements)
        )
    end
    function _LuaList.prototype.distinct(self)
        return __TS__New(
            _LuaList,
            {__TS__Spread(__TS__New(Set, self.elements))}
        )
    end
    function _LuaList.prototype.skip(self, count)
        return __TS__New(
            _LuaList,
            __TS__ArraySlice(self.elements, count)
        )
    end
    function _LuaList.prototype.take(self, count)
        return __TS__New(
            _LuaList,
            __TS__ArraySlice(self.elements, 0, count)
        )
    end
    function _LuaList.prototype.toSet(self)
        return LuaSet:ofList(self)
    end
    function _LuaList.prototype.toArray(self)
        return self.elements
    end
    function _LuaList.prototype.toTable(self)
        return TableUtil:fromArray(self:toArray())
    end
    LuaList = _LuaList
    local _LuaMapEntry = __TS__Class()
    _LuaMapEntry.name = "_LuaMapEntry"
    function _LuaMapEntry.prototype.____constructor(self, key, value)
        self.key = key
        self.value = value
    end
    function _LuaMapEntry.of(self, key, value)
        return __TS__New(_LuaMapEntry, key, value)
    end
    function _LuaMapEntry.prototype.getKey(self)
        return self.key
    end
    function _LuaMapEntry.prototype.getValue(self)
        return self.value
    end
    local LuaMapEntry = _LuaMapEntry
    local _LuaMap = __TS__Class()
    _LuaMap.name = "_LuaMap"
    function _LuaMap.prototype.____constructor(self)
        self.map = __TS__New(Map)
    end
    function _LuaMap.ofEntries(self, entries)
        return __TS__New(_LuaMap):setAllEntries(entries)
    end
    function _LuaMap.ofSingleton(self, key, value)
        return __TS__New(_LuaMap):set(key, value)
    end
    function _LuaMap.ofSingletonEntry(self, entry)
        return __TS__New(_LuaMap):setEntry(entry)
    end
    function _LuaMap.empty(self)
        return __TS__New(_LuaMap)
    end
    function _LuaMap.prototype.get(self, key)
        if not self.map:has(key) then
            return Optional:empty()
        end
        return Optional:of(self.map:get(key))
    end
    function _LuaMap.prototype.getOrDefault(self, key, defaultValue)
        if not self.map:has(key) then
            return defaultValue
        end
        return self.map:get(key)
    end
    function _LuaMap.prototype.set(self, key, value)
        self.map:set(key, value)
        return self
    end
    function _LuaMap.prototype.setEntry(self, entry)
        return self:set(
            entry:getKey(),
            entry:getValue()
        )
    end
    function _LuaMap.prototype.setAllEntries(self, entries)
        entries:forEach(self.setEntry)
        return self
    end
    function _LuaMap.prototype.remove(self, key)
        if not self.map:has(key) then
            return Optional:empty()
        end
        local value = self.map:get(key)
        self.map:delete(key)
        return Optional:of(value)
    end
    function _LuaMap.prototype.clear(self)
        self.map:clear()
        return self
    end
    function _LuaMap.prototype.containsKey(self, key)
        return self.map:has(key)
    end
    function _LuaMap.prototype.containsValue(self, value)
        for ____, v in __TS__Iterator(self.map:values()) do
            if v == value then
                return true
            end
        end
        return false
    end
    function _LuaMap.prototype.keys(self)
        return LuaList:of({__TS__Spread(self.map:keys())})
    end
    function _LuaMap.prototype.values(self)
        return LuaList:of({__TS__Spread(self.map:values())})
    end
    function _LuaMap.prototype.entries(self)
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
    function _LuaMap.prototype.isEmpty(self)
        return self.map.size == 0
    end
    function _LuaMap.prototype.isNotEmpty(self)
        return self.map.size > 0
    end
    function _LuaMap.prototype.size(self)
        return self.map.size
    end
    function _LuaMap.prototype.forEach(self, action)
        self.map:forEach(function(____, value, key) return action(_G, key, value) end)
        return self
    end
    function _LuaMap.prototype.forEachEntry(self, action)
        self:entries():forEach(action)
        return self
    end
    function _LuaMap.prototype.forEachKey(self, action)
        self:keys():forEach(action)
        return self
    end
    function _LuaMap.prototype.forEachValue(self, action)
        self:values():forEach(action)
        return self
    end
    function _LuaMap.prototype.select(self, transformer)
        local result = __TS__New(_LuaMap)
        self.map:forEach(function(____, value, key)
            result:set(
                key,
                transformer(_G, key, value)
            )
        end)
        return result
    end
    function _LuaMap.prototype.selectKeys(self, transformer)
        local result = __TS__New(_LuaMap)
        self:forEachEntry(function(____, entry)
            result:set(
                transformer(
                    _G,
                    entry:getKey()
                ),
                entry:getValue()
            )
        end)
        return result
    end
    function _LuaMap.prototype.selectValues(self, transformer)
        local result = __TS__New(_LuaMap)
        self:forEachEntry(function(____, entry)
            result:set(
                entry:getKey(),
                transformer(_G, entry)
            )
        end)
        return result
    end
    function _LuaMap.prototype.where(self, predicate)
        local result = __TS__New(_LuaMap)
        self.map:forEach(function(____, value, key)
            if predicate(_G, key, value) then
                result:set(key, value)
            end
        end)
        return result
    end
    function _LuaMap.prototype.whereEntries(self, predicate)
        local result = __TS__New(_LuaMap)
        self:forEachEntry(function(____, entry)
            if predicate(_G, entry) then
                result:setEntry(entry)
            end
        end)
        return result
    end
    function _LuaMap.prototype.whereKeys(self, predicate)
        local result = __TS__New(_LuaMap)
        self.map:forEach(function(____, value, key)
            if predicate(_G, key) then
                result:set(key, value)
            end
        end)
        return result
    end
    function _LuaMap.prototype.whereValues(self, predicate)
        local result = __TS__New(_LuaMap)
        self.map:forEach(function(____, value, key)
            if predicate(_G, value) then
                result:set(key, value)
            end
        end)
        return result
    end
    function _LuaMap.prototype.merge(self, other)
        local result = self:copy()
        other:forEach(function(____, key, value)
            result:set(key, value)
        end)
        return result
    end
    function _LuaMap.prototype.copy(self)
        local newMap = __TS__New(_LuaMap)
        self:forEachEntry(newMap.setEntry)
        return newMap
    end
    local LuaMap = _LuaMap
    local ____class_16 = __TS__Class()
    ____class_16.name = "LogListener"
    function ____class_16.prototype.____constructor(self)
    end
    local LogListener = ____class_16
    local ____class_17 = __TS__Class()
    ____class_17.name = "ConsoleLogListener"
    __TS__ClassExtends(____class_17, LogListener)
    function ____class_17.prototype.getName(self)
        return "ConsoleLogListener"
    end
    function ____class_17.prototype.onLog(self, level, message)
        print((("[" .. tostring(level)) .. "] ") .. tostring(message))
    end
    local ConsoleLogListener = ____class_17
    local ____class_18 = __TS__Class()
    ____class_18.name = "Logger"
    function ____class_18.prototype.____constructor(self)
    end
    function ____class_18.addListener(self, listener)
        self.listeners:set(
            listener:getName(),
            listener
        )
    end
    function ____class_18.clearListeners(self)
        self.listeners:clear()
    end
    function ____class_18.log(self, level, ...)
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
    function ____class_18.debug(self, ...)
        self:log("DEBUG", ...)
    end
    function ____class_18.info(self, ...)
        self:log("INFO", ...)
    end
    function ____class_18.warn(self, ...)
        self:log("WARN", ...)
    end
    function ____class_18.error(self, ...)
        self:log("ERROR", ...)
    end
    ____class_18.level = "DEBUG"
    ____class_18.levelMap = __TS__New(Map, {{"DEBUG", 0}, {"INFO", 1}, {"WARN", 2}, {"ERROR", 3}})
    ____class_18.listeners = LuaMap:ofSingleton(
        __TS__New(ConsoleLogListener):getName(),
        __TS__New(ConsoleLogListener)
    )
    local Logger = ____class_18
    local ____class_19 = __TS__Class()
    ____class_19.name = "ExecutionContext"
    function ____class_19.prototype.____constructor(self)
    end
    ____class_19.commandLineArguments = LuaList:ofTable(COMMAND_LINE_ARGUMENTS)
    local ExecutionContext = ____class_19
    local ____class_20 = __TS__Class()
    ____class_20.name = "FileReadHandle"
    function ____class_20.prototype.____constructor(self, handle)
        self.handle = handle
    end
    function ____class_20.prototype.readBytes(self, count)
        return self.handle.read(count)
    end
    function ____class_20.prototype.readAllContent(self)
        return self.handle.readAll()
    end
    function ____class_20.prototype.readLine(self, includeTrailingNewline)
        if includeTrailingNewline == nil then
            includeTrailingNewline = false
        end
        return self.handle.readLine(includeTrailingNewline)
    end
    function ____class_20.prototype.seekPosition(self, whence, offset)
        if whence == nil then
            whence = "cur"
        end
        if offset == nil then
            offset = 0
        end
        return self.handle.seek(whence, offset)
    end
    function ____class_20.prototype.close(self)
        self.handle.close()
    end
    local FileReadHandle = ____class_20
    local ____class_21 = __TS__Class()
    ____class_21.name = "FileReadWriteHandle"
    function ____class_21.prototype.____constructor(self, handle)
        self.handle = handle
    end
    function ____class_21.prototype.readBytes(self, count)
        return self.handle.read(count)
    end
    function ____class_21.prototype.readAllContent(self)
        return self.handle.readAll()
    end
    function ____class_21.prototype.readLine(self, includeTrailingNewline)
        if includeTrailingNewline == nil then
            includeTrailingNewline = false
        end
        return self.handle.readLine(includeTrailingNewline)
    end
    function ____class_21.prototype.writeContent(self, content)
        self.handle.write(content)
    end
    function ____class_21.prototype.writeLine(self, text)
        self.handle.writeLine(text)
    end
    function ____class_21.prototype.flushBuffers(self)
        self.handle.flush()
    end
    function ____class_21.prototype.seekPosition(self, whence, offset)
        if whence == nil then
            whence = "cur"
        end
        if offset == nil then
            offset = 0
        end
        return self.handle.seek(whence, offset)
    end
    function ____class_21.prototype.close(self)
        self.handle.close()
    end
    local FileReadWriteHandle = ____class_21
    local ____class_22 = __TS__Class()
    ____class_22.name = "FileWriteHandle"
    function ____class_22.prototype.____constructor(self, handle)
        self.handle = handle
    end
    function ____class_22.prototype.writeContent(self, content)
        self.handle.write(content)
    end
    function ____class_22.prototype.writeLine(self, text)
        self.handle.writeLine(text)
    end
    function ____class_22.prototype.flushBuffers(self)
        self.handle.flush()
    end
    function ____class_22.prototype.seekPosition(self, whence, offset)
        if whence == nil then
            whence = "cur"
        end
        if offset == nil then
            offset = 0
        end
        return self.handle.seek(whence, offset)
    end
    function ____class_22.prototype.close(self)
        self.handle.close()
    end
    local FileWriteHandle = ____class_22
    local ____class_23 = __TS__Class()
    ____class_23.name = "CcFs"
    function ____class_23.prototype.____constructor(self)
    end
    function ____class_23.completeFileName(self, path, location, includeFiles, includeDirectories)
        if includeFiles == nil then
            includeFiles = true
        end
        if includeDirectories == nil then
            includeDirectories = true
        end
        return fs.complete(path, location, includeFiles, includeDirectories)
    end
    function ____class_23.findFiles(self, path)
        return fs.find(path)
    end
    function ____class_23.isDriveRootDirectory(self, path)
        return fs.isDriveRoot(path)
    end
    function ____class_23.listDirectory(self, path)
        return fs.list(path)
    end
    function ____class_23.combinePath(self, ...)
        local paths = {...}
        local pathsTable = TableUtil:fromArray(paths)
        return fs.combine(table.unpack(pathsTable))
    end
    function ____class_23.getFileName(self, path)
        return fs.getName(path)
    end
    function ____class_23.getDirectoryName(self, path)
        return fs.getDir(path)
    end
    function ____class_23.getFileSize(self, path)
        return fs.getSize(path)
    end
    function ____class_23.fileExists(self, path)
        return fs.exists(path)
    end
    function ____class_23.isDirectory(self, path)
        return fs.isDir(path)
    end
    function ____class_23.isReadOnly(self, path)
        return fs.isReadOnly(path)
    end
    function ____class_23.createDirectory(self, path)
        fs.makeDir(path)
    end
    function ____class_23.move(self, sourcePath, destinationPath)
        fs.move(sourcePath, destinationPath)
    end
    function ____class_23.copy(self, sourcePath, destinationPath)
        fs.copy(sourcePath, destinationPath)
    end
    function ____class_23.delete(self, path)
        fs.delete(path)
    end
    function ____class_23.openFileForReading(self, path)
        local fileHandle = nil
        local errorMessage = nil
        fileHandle, errorMessage = fs.open(path, 'r')
        if errorMessage then
            return Result:error(errorMessage)
        end
        return Result:of(__TS__New(FileReadHandle, fileHandle))
    end
    function ____class_23.openFileForWriting(self, path)
        local fileHandle = nil
        local errorMessage = nil
        fileHandle, errorMessage = fs.open(path, 'w')
        if errorMessage then
            return Result:error(errorMessage)
        end
        return Result:of(__TS__New(FileWriteHandle, fileHandle))
    end
    function ____class_23.openFileForReadAndWrite(self, path)
        local fileHandle = nil
        local errorMessage = nil
        fileHandle, errorMessage = fs.open(path, 'rw')
        if errorMessage then
            return Result:error(errorMessage)
        end
        return Result:of(__TS__New(FileReadWriteHandle, fileHandle))
    end
    function ____class_23.openFileForAppending(self, path)
        local fileHandle = nil
        local errorMessage = nil
        fileHandle, errorMessage = fs.open(path, 'a')
        if errorMessage then
            return Result:error(errorMessage)
        end
        return Result:of(__TS__New(FileWriteHandle, fileHandle))
    end
    function ____class_23.openFileForBinaryReading(self, path)
        local fileHandle = nil
        local errorMessage = nil
        fileHandle, errorMessage = fs.open(path, 'rb')
        if errorMessage then
            return Result:error(errorMessage)
        end
        return Result:of(__TS__New(FileReadHandle, fileHandle))
    end
    function ____class_23.openFileForBinaryWriting(self, path)
        local fileHandle = nil
        local errorMessage = nil
        fileHandle, errorMessage = fs.open(path, 'wb')
        if errorMessage then
            return Result:error(errorMessage)
        end
        return Result:of(__TS__New(FileWriteHandle, fileHandle))
    end
    function ____class_23.getDriveName(self, path)
        return Optional:ofNullable(fs.getDrive(path))
    end
    function ____class_23.getFreeSpaceOnDrive(self, path)
        return fs.getFreeSpace(path)
    end
    function ____class_23.getDriveCapacity(self, path)
        return Optional:ofNullable(fs.getCapacity(path))
    end
    function ____class_23.getFileAttributes(self, path)
        return fs.attributes(path)
    end
    local CcFs = ____class_23
    local _FileUtil = __TS__Class()
    _FileUtil.name = "_FileUtil"
    function _FileUtil.prototype.____constructor(self)
    end
    function _FileUtil.joinPath(self, ...)
        return CcFs:combinePath(...)
    end
    function _FileUtil.getParentDirectoryPath(self, path)
        return CcFs:getDirectoryName(path)
    end
    function _FileUtil.readText(self, path)
        local file = CcFs:openFileForReading(path)
        if file:isError() then
            return Result:error(file:getErrorMessage())
        end
        local handle = file:getValueUnsafe("EC11 - No file")
        local content = handle:readAllContent()
        handle:close()
        if content == nil then
            return Result:error("Could not read file")
        end
        return Result:of(content)
    end
    function _FileUtil.writeText(self, path, content)
        local directory = self:getParentDirectoryPath(path)
        if not self:exists(directory) then
            self:createDirectory(directory)
        end
        local file = CcFs:openFileForWriting(path)
        if file:isError() then
            return Result:error(file:getErrorMessage())
        end
        local handle = file:getValueUnsafe("EC12 - No file")
        do
            local function ____catch(e)
                local ____Result_error_27 = Result.error
                local ____opt_result_26
                if e ~= nil then
                    ____opt_result_26 = e.message
                end
                return true, ____Result_error_27(Result, ____opt_result_26)
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
    function _FileUtil.appendText(self, path, content)
        if not _FileUtil:exists(path) then
            _FileUtil:writeText(path, content)
            return Result:void()
        end
        local file = CcFs:openFileForAppending(path)
        if file:isError() then
            return Result:error(file:getErrorMessage())
        end
        local handle = file:getValueUnsafe("EC13 - No file")
        do
            local function ____catch(e)
                local ____Result_error_31 = Result.error
                local ____opt_result_30
                if e ~= nil then
                    ____opt_result_30 = e.message
                end
                return true, ____Result_error_31(Result, ____opt_result_30)
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
    function _FileUtil.exists(self, path)
        return CcFs:fileExists(path)
    end
    function _FileUtil.isFile(self, path)
        return self:exists(path) and not CcFs:isDirectory(path)
    end
    function _FileUtil.isDirectory(self, path)
        return self:exists(path) and CcFs:isDirectory(path)
    end
    function _FileUtil.deleteFile(self, path)
        do
            local function ____catch(e)
                local ____Result_error_35 = Result.error
                local ____opt_result_34
                if e ~= nil then
                    ____opt_result_34 = e.message
                end
                return true, ____Result_error_35(Result, ____opt_result_34)
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
    function _FileUtil.copyFile(self, source, destination)
        do
            local function ____catch(e)
                local ____Result_error_39 = Result.error
                local ____opt_result_38
                if e ~= nil then
                    ____opt_result_38 = e.message
                end
                return true, ____Result_error_39(Result, ____opt_result_38)
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
    function _FileUtil.moveFile(self, source, destination)
        do
            local function ____catch(e)
                local ____Result_error_43 = Result.error
                local ____opt_result_42
                if e ~= nil then
                    ____opt_result_42 = e.message
                end
                return true, ____Result_error_43(Result, ____opt_result_42)
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
    function _FileUtil.getFileSize(self, path)
        local ____self_44 = _FileUtil:readText(path)
        return ____self_44["then"](
            ____self_44,
            function(____, content) return content.length end
        )
    end
    function _FileUtil.getFiles(self, path)
        return LuaList:ofTable(CcFs:listDirectory(path)):where(function(____, path2) return _FileUtil:isFile(path2) end)
    end
    function _FileUtil.getDirectories(self, path)
        return LuaList:ofTable(CcFs:listDirectory(path)):where(function(____, path2) return _FileUtil:isDirectory(path2) end)
    end
    function _FileUtil.getAllFilesRecursively(self, path)
        if not self:isDirectory(path) then
            return LuaList:ofSingleton(path)
        end
        local files = LuaList:empty()
        files:appendAll(_FileUtil:getFiles(path))
        _FileUtil:getDirectories(path):forEach(function(____, directory) return files:appendAll(_FileUtil:getAllFilesRecursively(directory)) end)
        return files
    end
    function _FileUtil.getAllDirectoriesRecursively(self, path)
        if not self:isDirectory(path) then
            return LuaList:empty()
        end
        local directories = LuaList:empty()
        _FileUtil:getDirectories(path):forEach(function(____, directory)
            directories:append(directory):appendAll(_FileUtil:getAllDirectoriesRecursively(directory))
        end)
        return directories
    end
    function _FileUtil.createDirectory(self, path)
        do
            local function ____catch(e)
                local ____Result_error_48 = Result.error
                local ____opt_result_47
                if e ~= nil then
                    ____opt_result_47 = e.message
                end
                return true, ____Result_error_48(Result, ____opt_result_47)
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
    function _FileUtil.copyDirectory(self, source, destination)
        do
            local function ____catch(e)
                local ____Result_error_52 = Result.error
                local ____opt_result_51
                if e ~= nil then
                    ____opt_result_51 = e.message
                end
                return true, ____Result_error_52(Result, ____opt_result_51)
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
    function _FileUtil.copyDirectoryContent(self, source, destination)
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
                    file:replace(source, "")
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
                    directory:replace(source, "")
                )
            ):ifError(function(____, newMessage)
                errorMessage = newMessage
                return errorMessage
            end)
        end)
        return Result:ofError(nil, errorMessage)
    end
    function _FileUtil.moveDirectory(self, source, destination)
        do
            local function ____catch(e)
                local ____Result_error_56 = Result.error
                local ____opt_result_55
                if e ~= nil then
                    ____opt_result_55 = e.message
                end
                return true, ____Result_error_56(Result, ____opt_result_55)
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
    function _FileUtil.deleteDirectory(self, path)
        do
            local function ____catch(e)
                local ____Result_error_60 = Result.error
                local ____opt_result_59
                if e ~= nil then
                    ____opt_result_59 = e.message
                end
                return true, ____Result_error_60(Result, ____opt_result_59)
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
    function _FileUtil.deleteDirectoryContent(self, path)
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
    function _FileUtil.removeByteOrderMark(self, path)
        local contentResult = self:readText(path)
        if contentResult:isError() then
            return Result:error(contentResult:getErrorMessage())
        end
        local content = contentResult:getValueUnsafe("EC14 - No file")
        if not content:startsWith("?") then
            return Result:void()
        end
        local newContent = content:substring(1)
        return self:writeText(path, newContent)
    end
    local FileUtil = _FileUtil
    local ____class_61 = __TS__Class()
    ____class_61.name = "CcTextUtils"
    function ____class_61.prototype.____constructor(self)
    end
    function ____class_61.slowWrite(self, text, rate)
        textutils.slowWrite(text, rate)
    end
    function ____class_61.slowPrint(self, text, rate)
        textutils.slowPrint(text, rate)
    end
    function ____class_61.formatTime(self, time, twentyFourHour)
        local result = ""
        result = textutils.formatTime(time, twentyFourHour)
        return result
    end
    function ____class_61.pagedPrint(self, text, freeLines)
        local result = 0
        result = textutils.pagedPrint(text, freeLines)
        return result
    end
    function ____class_61.tabulate(self, ...)
        textutils.tabulate(...)
    end
    function ____class_61.pagedTabulate(self, ...)
        textutils.pagedTabulate(...)
    end
    function ____class_61.serialize(self, obj, opts)
        local result = nil
        local errorMessage = nil
        result, errorMessage = textutils.serialize(obj, opts)
        if errorMessage ~= nil then
            return Result:error(errorMessage)
        end
        return Result:of(result)
    end
    function ____class_61.unserialize(self, str)
        local result = nil
        result = textutils.unserialize(str)
        if result == nil then
            return Result:error("Failed to unserialize")
        end
        return Result:of(result)
    end
    function ____class_61.serializeJSON(self, obj, opts)
        local result = nil
        local errorMessage = nil
        result, errorMessage = textutils.serializeJSON(obj, opts)
        if errorMessage ~= nil then
            return Result:error(errorMessage)
        end
        return Result:of(result)
    end
    function ____class_61.unserializeJSON(self, str, opts)
        local result = nil
        local errorMessage = nil
        result, errorMessage = textutils.unserializeJSON(str, opts)
        if errorMessage ~= nil then
            return Result:error(errorMessage)
        end
        return Result:of(result)
    end
    function ____class_61.urlEncode(self, str)
        local result = ""
        result = textutils.urlEncode(str)
        return result
    end
    function ____class_61.getCompletion(self, searchText, searchTable)
        local result = {}
        result = textutils.complete(searchText, searchTable)
        return result
    end
    ____class_61.empty_json_array = {}
    ____class_61.json_null = {}
    local CcTextUtils = ____class_61
    local _Info = __TS__Class()
    _Info.name = "_Info"
    function _Info.prototype.____constructor(self, model)
        self.version = model.version
        self.name = model.name
        self.description = model.description
        self.startup = model.startup
        self.deployment = model.deployment
        self.logging = model.logging
        self.lifetime = model.lifetime
    end
    function _Info.load(self)
        local contentString = FileUtil:readText(self._path):getValueUnsafe("EC15 - Could not read info.json")
        local content = CcTextUtils:unserializeJSON(contentString):getValueUnsafe("EC16 - Could not parse info.json")
        return __TS__New(_Info, content)
    end
    _Info._path = "info.json"
    local Info = _Info
    local _FileLogListener = __TS__Class()
    _FileLogListener.name = "_FileLogListener"
    __TS__ClassExtends(_FileLogListener, LogListener)
    function _FileLogListener.prototype.getName(self)
        return "FileLogListener"
    end
    function _FileLogListener.prototype.onLog(self, level, message)
        FileUtil:appendText(
            _FileLogListener.LOG_PATH,
            ((("[" .. tostring(level)) .. "] ") .. tostring(message)) .. "\n"
        )
    end
    _FileLogListener.LOG_PATH = "app/logs/main.log"
    local FileLogListener = _FileLogListener
    local ____class_62 = __TS__Class()
    ____class_62.name = "Reflection"
    function ____class_62.prototype.____constructor(self)
    end
    function ____class_62.getFields(self, ____table)
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
    function ____class_62.getField(self, ____table, name)
        if type(table) ~= 'table' then
            return Result:error(("'" .. tostring(____table)) .. "' is not a table")
        end
        local value = table[name]
        if value == nil or value == nil then
            return Result:error(((("'" .. tostring(name)) .. "' is not a field of '") .. tostring(____table)) .. "'")
        end
        return Result:of(value)
    end
    function ____class_62.getMethod(self, ____table, name)
        return self:getMethods(____table):get(name):toResult(((("'" .. tostring(name)) .. "' is not a method of '") .. tostring(____table)) .. "'")
    end
    function ____class_62.getMethods(self, ____table)
        local methods = LuaMap:empty()
        local k = ""
        local function v()
        end
        for k, v in pairs(table) do
            if type(v) == 'function' then
        methods:set(
            k,
            function(____, ...) return v(_G, ____table, ...) end
        )
            end
        end
        return methods
    end
    local Reflection = ____class_62
    local ____class_63 = __TS__Class()
    ____class_63.name = "HttpResponse"
    __TS__ClassExtends(____class_63, FileReadHandle)
    function ____class_63.prototype.getResponseCode(self)
        return self.handle.getResponseCode()
    end
    function ____class_63.prototype.getResponseHeaders(self)
        return self.handle.getResponseHeaders()
    end
    local HttpResponse = ____class_63
    local ____class_64 = __TS__Class()
    ____class_64.name = "CcHttp"
    function ____class_64.prototype.____constructor(self)
    end
    function ____class_64.get(self, urlOrOptions, headers, binary)
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
    function ____class_64.post(self, urlOrOptions, body, headers, binary)
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
    function ____class_64.request(self, urlOrOptions, body, headers, binary)
        http.request(urlOrOptions, body, headers, binary)
    end
    function ____class_64.requestByObject(self, request)
        http.requestByObject(request)
    end
    function ____class_64.checkURLAsync(self, url)
        local isValid = false
        local reason = nil
        isValid, reason = http.checkURLAsync(url)
        return {isValid = isValid, reason = reason}
    end
    function ____class_64.checkURL(self, url)
        local isValid = false
        local reason = nil
        isValid, reason = http.checkURL(url)
        return {isValid = isValid, reason = reason}
    end
    function ____class_64.websocketAsync(self, urlOrOptions, headers)
        http.websocketAsync(urlOrOptions, headers)
    end
    function ____class_64.websocket(self, urlOrOptions, headers)
        local websocket = false
        local errorMessage = nil
        websocket, errorMessage = http.websocket(urlOrOptions, headers)
        if websocket == false then
            local ____Result_error_66 = Result.error
            local ____errorMessage_65 = errorMessage
            if ____errorMessage_65 == nil then
                ____errorMessage_65 = "Unknown error"
            end
            return ____Result_error_66(Result, ____errorMessage_65)
        end
        return Result:of(websocket)
    end
    local CcHttp = ____class_64
    local _DiscordWebhook = __TS__Class()
    _DiscordWebhook.name = "_DiscordWebhook"
    function _DiscordWebhook.prototype.____constructor(self, username, url)
        self._username = username
        self._url = url
    end
    function _DiscordWebhook.fromUrl(self, username, url)
        return __TS__New(_DiscordWebhook, username, url)
    end
    function _DiscordWebhook.prototype.sendWebhookData(self, data)
        CcHttp:post(
            self._url,
            CcTextUtils:serializeJSON(data):getValueUnsafe("EC17 - Could not serialize POST data for Discord webhook")
        )
    end
    function _DiscordWebhook.prototype.sendMessage(self, message)
        local chunks = message:match(__TS__New(
            RegExp,
            (".{1," .. tostring(_DiscordWebhook.DISCORD_MESSAGE_LENGTH_LIMIT)) .. "}",
            "g"
        )) or ({})
        chunks:forEach(function(____, chunk)
            self:sendWebhookData({username = self._username, content = chunk})
        end)
    end
    function _DiscordWebhook.prototype.sendEmbed(self, embeds)
        local ____self_sendWebhookData_69 = self.sendWebhookData
        local ____self__username_68 = self._username
        local ____Array_isArray_result_67
        if __TS__ArrayIsArray(embeds) then
            ____Array_isArray_result_67 = embeds
        else
            ____Array_isArray_result_67 = {embeds}
        end
        ____self_sendWebhookData_69(self, {username = ____self__username_68, embeds = ____Array_isArray_result_67})
    end
    _DiscordWebhook.DISCORD_MESSAGE_LENGTH_LIMIT = 2000
    local DiscordWebhook = _DiscordWebhook
    local ____class_70 = __TS__Class()
    ____class_70.name = "CcOs"
    function ____class_70.prototype.____constructor(self)
    end
    function ____class_70.loadAPI(self, path)
        return os.loadAPI(path)
    end
    function ____class_70.unloadAPI(self, name)
        os.unloadAPI(name)
    end
    function ____class_70.pullEvent(self, filter)
        local eventData = {os.pullEvent(filter)}
        local name = eventData[1]
        local details = eventData:slice(2)
        return {name = name, details = details}
    end
    function ____class_70.pullEventRaw(self, filter)
        local eventData = {os.pullEventRaw(filter)}
        local name = eventData[1]
        local details = eventData:slice(2)
        return {name = name, details = details}
    end
    function ____class_70.sleep(self, time)
        os.sleep(time)
    end
    function ____class_70.version(self)
        return os.version()
    end
    function ____class_70.run(self, env, path, ...)
        local args = {...}
        local argsTable = TableUtil:fromArray(args)
        return os.run(env, path, table.unpack(argsTable))
    end
    function ____class_70.queueEvent(self, name, ...)
        local params = {...}
        local paramsTable = TableUtil:fromArray(params)
        os.queueEvent(name, table.unpack(paramsTable))
    end
    function ____class_70.startTimer(self, time)
        return os.startTimer(time)
    end
    function ____class_70.cancelTimer(self, token)
        os.cancelTimer(token)
    end
    function ____class_70.setAlarm(self, time)
        return os.setAlarm(time)
    end
    function ____class_70.cancelAlarm(self, token)
        os.cancelAlarm(token)
    end
    function ____class_70.shutdown(self)
        os.shutdown()
    end
    function ____class_70.reboot(self)
        os.reboot()
    end
    function ____class_70.getComputerID(self)
        return os.getComputerID()
    end
    function ____class_70.computerID(self)
        return os.computerID()
    end
    function ____class_70.getComputerLabel(self)
        local label = os.getComputerLabel()
        return Optional:ofNullable(label)
    end
    function ____class_70.computerLabel(self)
        local label = label = os.computerLabel()
        return Optional:ofNullable(label)
    end
    function ____class_70.setComputerLabel(self, label)
        os.setComputerLabel(label)
    end
    function ____class_70.clock(self)
        return os.clock()
    end
    function ____class_70.time(self, locale)
        return os.time(locale)
    end
    function ____class_70.day(self, locale)
        return os.day(locale)
    end
    function ____class_70.epoch(self, locale)
        return os.epoch(locale)
    end
    function ____class_70.date(self, format, time)
        if format == "!*t" then
            error(
                __TS__New(Error, "!*t not supported in `date` - use `dateTable` instead"),
                0
            )
        end
        return os.date(format, time)
    end
    function ____class_70.dateTable(self, time)
        return os.date("!*t", time)
    end
    local CcOs = ____class_70
    local ____class_71 = __TS__Class()
    ____class_71.name = "Environment"
    function ____class_71.prototype.____constructor(self)
    end
    function ____class_71.get(self, key)
        local result = self:load():get(key)
        if result:isEmpty() then
            self:set(key, "")
        end
        return result
    end
    function ____class_71.set(self, key, value)
        if not FileUtil:exists(self._path) then
            FileUtil:writeText(self._path, ""):getValueUnsafe("EC6")
        end
        local content = FileUtil:readText(self._path):getValueUnsafe("EC7 - Could not read from .env file")
        content = tostring(content) .. (("\n" .. tostring(key)) .. "=") .. tostring(value)
        FileUtil:writeText(self._path, content):getValueUnsafe("EC8 - Could not write to .env file")
    end
    function ____class_71.load(self)
        local exampleLines = __TS__StringSplit("This is a test\nThis is another Test", "\n")
        print(exampleLines)
        CcOs:sleep(5)
        if not FileUtil:exists(self._path) then
            FileUtil:writeText(self._path, ""):getValueUnsafe("EC9")
        end
        local content = FileUtil:readText(self._path):getValueUnsafe("EC10 - Could not read from .env file")
        local lines = content:split("\n")
        local output = LuaMap:empty()
        lines:forEach(function(____, line)
            if line:startsWith("#") then
                return
            end
            if line:trim() == "" then
                return
            end
            if not line:includes("=") then
                return
            end
            local key, value = __TS__Unpack(line:split("=", 2))
            output:set(key, value)
        end)
        return output
    end
    ____class_71._path = "app/data/.env"
    local Environment = ____class_71
    local _DiscordWebhookLogListener = __TS__Class()
    _DiscordWebhookLogListener.name = "_DiscordWebhookLogListener"
    __TS__ClassExtends(_DiscordWebhookLogListener, LogListener)
    function _DiscordWebhookLogListener.prototype.getName(self)
        return "DiscordWebhookLogListener"
    end
    function _DiscordWebhookLogListener.prototype.onLog(self, level, message)
        _DiscordWebhookLogListener._webhook:sendMessage((("[" .. tostring(level)) .. "] ") .. tostring(message))
    end
    _DiscordWebhookLogListener._webhook = DiscordWebhook:fromUrl(
        "ComputerCraft",
        Environment:get("DISCORD_WEBHOOK_URL"):getValueUnsafe("EC18 - Failed to get `DISCORD_WEBHOOK_URL` from environment")
    )
    local DiscordWebhookLogListener = _DiscordWebhookLogListener
    local ____class_72 = __TS__Class()
    ____class_72.name = "Entrypoint"
    function ____class_72.prototype.____constructor(self)
        self._routes = LuaMap:empty()
    end
    function ____class_72.prototype.run(self)
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
    function ____class_72.prototype.applyInfoConfig(self)
        local info = Info:load()
        local ____opt_73 = info.logging
        if ____opt_73 ~= nil then
            ____opt_73 = ____opt_73.level
        end
        if ____opt_73 then
            Logger.level = info.logging.level
        end
        local ____opt_75 = info.logging
        if ____opt_75 ~= nil then
            ____opt_75 = ____opt_75.writeToFile
        end
        if ____opt_75 then
            Logger:addListener(__TS__New(FileLogListener))
        end
        local ____opt_77 = info.logging
        if ____opt_77 ~= nil then
            ____opt_77 = ____opt_77.writeToDiscord
        end
        if ____opt_77 then
            Logger:addListener(__TS__New(DiscordWebhookLogListener))
        end
    end
    function ____class_72.prototype.registerRoutes(self)
        Reflection:getMethods(self):whereKeys(function(____, key) return key:startsWith("route") end):selectKeys(function(____, key) return key:replace("route", ""):toLowerCase() end):forEach(function(____, name, route) return self:registerRoute(name, route) end)
    end
    function ____class_72.prototype.registerRoute(self, name, callback)
        self._routes:set(name, callback)
    end
    function ____class_72.prototype.dispatchRoute(self)
        local targetRouteName = ExecutionContext.commandLineArguments:first():getValueUnsafe("EC19 - The first command line argument (route name) was not provided")
        self._routes:get(targetRouteName):ifEmpty(function()
            local validRouteNamesString = ("'" .. self._routes:keys():join("', '")) .. "'"
            error(
                __TS__New(
                    Error,
                    (("Unknown route: " .. tostring(targetRouteName)) .. "\nThe first argument must be a valid route name.\nE.g. ") .. validRouteNamesString
                ),
                0
            )
        end):ifPresent(function(____, routeFunction) return routeFunction(_G) end)
    end
    function ____class_72.prototype.onCrash(self, cause)
        error(cause, 0)
    end
    local Entrypoint = ____class_72
    local ____class_79 = __TS__Class()
    ____class_79.name = "ExampleEntrypoint"
    __TS__ClassExtends(____class_79, Entrypoint)
    function ____class_79.prototype.onStart(self)
    end
    function ____class_79.prototype.onStop(self)
    end
    function ____class_79.prototype.routeRun(self)
        Logger:info("First")
        local list = LuaList:ofSingleton(11):append(22):append(44):append(33)
        Logger:debug(list)
        ChatBox:sendMessage("Hello World!")
        Logger:warn("Last")
    end
    local ExampleEntrypoint = ____class_79
    __TS__New(ExampleEntrypoint):run()
end)(_G)
 end,
}
return require("bundle", ...)
