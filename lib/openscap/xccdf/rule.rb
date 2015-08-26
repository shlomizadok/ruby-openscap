#
# Copyright (c) 2014 Red Hat Inc.
#
# This software is licensed to you under the GNU General Public License,
# version 2 (GPLv2). There is NO WARRANTY for this software, express or
# implied, including the implied warranties of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
# along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
#

require 'openscap/source'
require 'openscap/exceptions'
require 'openscap/xccdf'
require 'openscap/xccdf/ruleresult'
require 'openscap/xccdf/benchmark'

module OpenSCAP
  module Xccdf
    class Rule
      def initialize(arf)
        case arf
          when OpenSCAP::DS::Arf
            @arf = arf
          else
            fail OpenSCAP::OpenSCAPError, "Cannot initialize TestResult with #{arf}"
        end
      end

      def get_arf_benchmark
        sds = @arf.report_request
        bench_source = sds.select_checklist!
        bench = OpenSCAP::Xccdf::Benchmark.new bench_source
        bench
      end
    end
  end
end
