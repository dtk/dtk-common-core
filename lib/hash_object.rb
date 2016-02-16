#
# Copyright (C) 2010-2016 dtk contributors
#
# This file is part of the dtk project.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
module DTK
  module Common
    class SimpleHashObject < Hash
      def initialize(initial_val=nil,&block)
        block ? super(&block) : super()
        if initial_val
          replace(initial_val)
        end
      end
    end

    # require 'active_support/ordered_hash'
    # class SimpleOrderedHash < ::ActiveSupport::OrderedHash
    class SimpleOrderedHash < Hash
      def initialize(elements=[])
        super()
        elements = [elements] unless elements.kind_of?(Array)
        elements.each{|el|self[el.keys.first] = el.values.first}
      end
    
      #set unless value is nill
      def set_unless_nil(k,v)
        self[k] = v unless v.nil?
      end
    end

    class PrettyPrintHash < SimpleOrderedHash
      #field with '?' suffix means optioanlly add depending on whether name present and non-null in source
      #if block is given then apply to source[name] rather than returning just source[name]
      def add(model_object,*keys,&block)
        keys.each do |key|
          #if marked as optional skip if not present
          if key.to_s =~ /(^.+)\?$/
            key = $1.to_sym
            next unless model_object[key]
          end
          #special treatment of :id
          val = (key == :id ? model_object.id : model_object[key]) 
          self[key] = (block ? block.call(val) : val)
        end
        self
      end

      def slice(*keys)
        keys.inject(self.class.new){|h,k|h.merge(k => self[k])}
      end
    end
  end
end

