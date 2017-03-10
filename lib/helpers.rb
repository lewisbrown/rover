module Membership
  refine Object do
    def member?(enumerable)
      enumerable.include? self
    end
  end
end

module Constantize
  refine String do
    def constantize(mod)
      mod.const_get self
    rescue Exception => e
      mod.class.const_get self
    end

    alias to_const constantize
  end

  refine Symbol do
    def constantize(mod)
      mod.const_get self 
    rescue Exception
      mod.class.const_get self
    end

    alias to_const constantize
  end
end

def assert(value, message="Assertion failed")
  raise Exception, message, caller unless value
end
