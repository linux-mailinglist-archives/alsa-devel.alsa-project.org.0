Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E526BDCD3
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 00:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2357F1042;
	Fri, 17 Mar 2023 00:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2357F1042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679008855;
	bh=w27aUi7It9h8nbGZhrTxFUQlsPX0IjHEaDxbMAWRWjM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nYTXHLOIhBGEg93uyi7rqsHhe/x0pTBpNjHVsxYJsW+1KzoIsfh2KQWfMvkV/ymfo
	 +ezn0BBnZkNDYPQBmoqedemRmgMWGKh3ax6ikmuTwbDz1QkX0GezYOnyB058QR8OEp
	 rYuRk1prbtBMfWn2yY+53lMAcnkTvHL+OwKfGUoQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB8CBF8032D;
	Fri, 17 Mar 2023 00:20:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C229F80423; Fri, 17 Mar 2023 00:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 153FFF80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 00:19:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 153FFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EahNDIfv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679008794; x=1710544794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w27aUi7It9h8nbGZhrTxFUQlsPX0IjHEaDxbMAWRWjM=;
  b=EahNDIfvteAxqeXpWt6npd1P8f6yxKXlRnnqII23LxRoXyIeqbsiLDB9
   pFnV6Gfntpd0YbBQN8UadmSlZOLa6s2qyVRt3u59JKINdLi+cNOHqO6QH
   vENaA3OuENoMaPwQdjGzOFsjJQpnefXIdK0pbfqrfHAOoLBNK8q1UfkUL
   EpfSqUW6DqWwaA/5U6FhGDy+PiQsKTpeOTTO9mdbkWWNjmY+Y4f3o4dON
   +8irxhnv/usdmyXCb/D3dVH+CAUKPZ2XuvGOfF17WDlAraEZww8KMSWR2
   jWjxy7LWkfq7vdJrN5R9uOm6fZE+YDEawYcV9ktZx6zNhBECxNPTXBq9h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="326501733"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400";
   d="scan'208";a="326501733"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 16:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="744351234"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400";
   d="scan'208";a="744351234"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Mar 2023 16:19:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcwss-0008sg-0H;
	Thu, 16 Mar 2023 23:19:46 +0000
Date: Fri, 17 Mar 2023 07:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Subject: Re: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to
 handle page boundaries
Message-ID: <202303170724.NdbQwtQo-lkp@intel.com>
References: <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
Message-ID-Hash: W4LBALDNHL2GSUQ2KU5FHM7AWSBZCCUS
X-Message-ID-Hash: W4LBALDNHL2GSUQ2KU5FHM7AWSBZCCUS
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4LBALDNHL2GSUQ2KU5FHM7AWSBZCCUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Charles,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc2 next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/soundwire-bus-Update-sdw_nread-nwrite_no_pm-to-handle-page-boundaries/20230317-000005
patch link:    https://lore.kernel.org/r/20230316155734.3191577-2-ckeepax%40opensource.cirrus.com
patch subject: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to handle page boundaries
config: mips-randconfig-r022-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170724.NdbQwtQo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6944d7175bd15a9a16a411c57f200d3bcecd3c00
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Charles-Keepax/soundwire-bus-Update-sdw_nread-nwrite_no_pm-to-handle-page-boundaries/20230317-000005
        git checkout 6944d7175bd15a9a16a411c57f200d3bcecd3c00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/soundwire/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170724.NdbQwtQo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/bus.c:398:10: warning: comparison of distinct pointer types ('typeof (count) *' (aka 'unsigned int *') and 'typeof ((((((int)(sizeof(struct (unnamed struct at drivers/soundwire/bus.c:398:10))))) + (((~(((0UL)))) - ((((1UL))) << (0)) + 1) & (~(((0UL))) >> (32 - 1 - (14))))) + 1) - (addr & ((((int)(sizeof(struct (unnamed struct at drivers/soundwire/bus.c:398:10))))) + (((~(((0UL)))) - ((((1UL))) << (0)) + 1) & (~(((0UL))) >> (32 - 1 - (14))))))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   size = min(count, (SDW_REGADDR + 1) - (addr & SDW_REGADDR));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +398 drivers/soundwire/bus.c

   384	
   385	/*
   386	 * Read/Write IO functions.
   387	 */
   388	
   389	static int sdw_ntransfer_no_pm(struct sdw_slave *slave, u32 addr, u8 flags,
   390				       size_t count, u8 *val)
   391	{
   392		struct sdw_msg msg;
   393		size_t size;
   394		int ret;
   395	
   396		while (count) {
   397			// Only handle bytes up to next page boundary
 > 398			size = min(count, (SDW_REGADDR + 1) - (addr & SDW_REGADDR));
   399	
   400			ret = sdw_fill_msg(&msg, slave, addr, size, slave->dev_num, flags, val);
   401			if (ret < 0)
   402				return ret;
   403	
   404			ret = sdw_transfer(slave->bus, &msg);
   405			if (ret < 0 && !slave->is_mockup_device)
   406				return ret;
   407	
   408			addr += size;
   409			val += size;
   410			count -= size;
   411		}
   412	
   413		return 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
