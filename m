Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA7674115
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 19:37:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF106C0;
	Thu, 19 Jan 2023 19:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF106C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674153466;
	bh=1PBJY2HxmhqL3ULv3BR0DK9xsDZWMIDSE7ENT7WjC+c=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CJwFcof6w6WlxORRNEL4f4bZsO9m7koxMUjzNiC7qbuEPcCkNl3ov54k8MxSu+NF2
	 G+YKYlHZxPHx5OHGsWpDlp5R+672U1rcXsY+Xfw32tCfeohQCvtJWEEGhv5jkV39Qs
	 TUx0T7Kaz8AopJIz6a8U+UEro8lGpLuSA+99OOeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94E69F804DE;
	Thu, 19 Jan 2023 19:36:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D89C9F8024D; Thu, 19 Jan 2023 19:36:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FB06F800F0
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 19:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB06F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZuIuqOKb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674153400; x=1705689400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1PBJY2HxmhqL3ULv3BR0DK9xsDZWMIDSE7ENT7WjC+c=;
 b=ZuIuqOKbcsPr7pbg1QVZMuKH5tG9uDjbQIFt1t1WgF6GyCMrVxOAe6gB
 RlbY/Z+1uxzZvVcFaI0x8MyrVSUcPoyzVJhDGSruaKBLxhKyMEEoNhKa1
 zPRH0RiWe/oOZlZHBUUmhbJr7OrIgpx1gCyKT+osxZ8PTxlf3RMFLpCoo
 nrGo7iaRGKTnCUCowJJ21ucS0DtrWCsjZDHXt1iyGDB3/alzCEpMbkMlL
 uAZJQyfQdB2paStj6H57Zj5oxYFJCWKZbHMa9Iu4rES3xHUujTzThdkqb
 SgyaYpcle/aKaTvCaKrHTZdGei468NAl5Uoo8PjleMuzDiDBAEayQ5+Hv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="389895182"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="389895182"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 10:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="768345085"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="768345085"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 10:36:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pIZld-0001jQ-1W;
 Thu, 19 Jan 2023 18:36:05 +0000
Date: Fri, 20 Jan 2023 02:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 04/19] soundwire: amd: enable build for AMD soundwire
 master driver
Message-ID: <202301200258.mTFnFc1h-lkp@intel.com>
References: <20230111090222.2016499-5-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111090222.2016499-5-Vijendar.Mukunda@amd.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 llvm@lists.linux.dev, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mario.Limonciello@amd.com, oe-kbuild-all@lists.linux.dev,
 arungopal.kondaveeti@amd.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Vijendar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20230119]
[cannot apply to vkoul-dmaengine/next linus/master v6.2-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-ps-create-platform-devices-based-on-acp-config/20230111-170749
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230111090222.2016499-5-Vijendar.Mukunda%40amd.com
patch subject: [PATCH 04/19] soundwire: amd: enable build for AMD soundwire master driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301200258.mTFnFc1h-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/52f32d2187adf9e16e4d4a3108e8ca47efa26aa2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vijendar-Mukunda/ASoC-amd-ps-create-platform-devices-based-on-acp-config/20230111-170749
        git checkout 52f32d2187adf9e16e4d4a3108e8ca47efa26aa2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/soundwire/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:129:30: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                              ^~~~~
>> drivers/soundwire/amd_master.c:569:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:129:50: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                                         ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
   11 warnings generated.


vim +569 drivers/soundwire/amd_master.c

1e349784c25702 Vijendar Mukunda 2023-01-11  559  
1e349784c25702 Vijendar Mukunda 2023-01-11  560  static u32 amd_sdwc_read_ping_status(struct sdw_bus *bus)
1e349784c25702 Vijendar Mukunda 2023-01-11  561  {
1e349784c25702 Vijendar Mukunda 2023-01-11  562  	struct amd_sdwc_ctrl *ctrl = to_amd_sdw(bus);
1e349784c25702 Vijendar Mukunda 2023-01-11  563  	u64 response;
1e349784c25702 Vijendar Mukunda 2023-01-11  564  	u32 slave_stat = 0;
1e349784c25702 Vijendar Mukunda 2023-01-11  565  
1e349784c25702 Vijendar Mukunda 2023-01-11  566  	response = amd_sdwc_send_cmd_get_resp(ctrl, 0, 0);
1e349784c25702 Vijendar Mukunda 2023-01-11  567  	/* slave status from ping response*/
1e349784c25702 Vijendar Mukunda 2023-01-11  568  	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
1e349784c25702 Vijendar Mukunda 2023-01-11 @569  	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
1e349784c25702 Vijendar Mukunda 2023-01-11  570  	dev_dbg(ctrl->dev, "%s: slave_stat:0x%x\n", __func__, slave_stat);
1e349784c25702 Vijendar Mukunda 2023-01-11  571  	return slave_stat;
1e349784c25702 Vijendar Mukunda 2023-01-11  572  }
1e349784c25702 Vijendar Mukunda 2023-01-11  573  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
