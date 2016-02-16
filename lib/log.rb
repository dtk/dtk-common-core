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
#TODO: bring in a production quality ruby logging capability that gets wrapped here
#TODO: would put this in config
module DTK
  module Log
    Config = Hash.new
    Config[:print_time] = false
    Config[:print_method] = false

    def self.info(msg, out = $stdout)
      out << "info: "
      out << format(msg)
    end
    def self.debug(msg, out = $stdout)
      out << "debug: "
      out << format(msg)
    end
    def self.error(msg, out = $stdout)
      out << "error: "
      out << format(msg)
    end
    def self.info_pp(obj, out = $stdout)
      out << Aux::pp_form(obj)
    end
    def self.debug_pp(obj, out = $stdout)
      out << Aux::pp_form(obj)
      obj
    end
   private
    def self.format(msg)
      ret = String.new
      ret << "#{Time.now}: " if Config[:print_time]
      ret << "in fn: #{this_parent_method}: " if Config[:print_method]
      ret << msg
      ret << "\n"
    end
  end
end
