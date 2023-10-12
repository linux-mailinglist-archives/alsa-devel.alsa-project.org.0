Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A510D7C61E1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 02:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B8ADF0;
	Thu, 12 Oct 2023 02:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B8ADF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697071078;
	bh=RdfDVk4Tn/AgFKhnuaA2gNy0l6cyNbUefJRkhBP6c/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GRDffmCRmPYu4GtZ/mWGVLfqaw1A9YGmwpDMvpso56Pe7S6R+VO4A+07LB6jdBUO3
	 DfQi6vFSD5hFB2BGdz9rmOkDhGR5dQVuo90Us8ZWzN1acmkHp+Wp9qsk43Rkc9qlH+
	 Jr9GdTK6DORTvsFvJ7XBQUl3cMshuTcBVO40xsg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E45D9F80558; Thu, 12 Oct 2023 02:37:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D188F8027B;
	Thu, 12 Oct 2023 02:37:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D97BF802BE; Thu, 12 Oct 2023 02:37:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D375F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 02:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D375F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cMmYgL2X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697071013; x=1728607013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RdfDVk4Tn/AgFKhnuaA2gNy0l6cyNbUefJRkhBP6c/w=;
  b=cMmYgL2XDGr/FsZdk7yGuUPEMZJTOrmGXULo0WI0G8Dn917f0w6zfIL/
   bbkmSex14hXIm5HyaLCpAZ7Fmq/HSPGfueVw7Vf8VbTmCUYydinKeeOeN
   DQirSJV0FTqjQ6wdOJthH44hbYzFI3sDSwEF4kWrnJIDYIEdPoB8gLaWa
   4EpydY+iYKYhDBCwCUQ8n6VsqB6IBRLMQi1BCPR6QY5dHRLYIxL1BNYoG
   vuX20MwQ/JPlSJvd6dwgFHDREE36eY9dHf831n+QYdi0Xh1igrf+U2GmC
   riqtA7bAZBNQGHe9VeawHvZQAZ/tBaIpCytWwtqkzYXEzTiUphwV3Zb2g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384657058"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200";
   d="scan'208";a="384657058"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 17:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897869939"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200";
   d="scan'208";a="897869939"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 17:34:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqjgy-0002uH-0P;
	Thu, 12 Oct 2023 00:36:44 +0000
Date: Thu, 12 Oct 2023 08:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 04/16] ASoC: Intel: avs: i2s_test: Validate machine board
 configuration
Message-ID: <202310120853.cfVtZkHx-lkp@intel.com>
References: <20231011121703.363652-5-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011121703.363652-5-amadeuszx.slawinski@linux.intel.com>
Message-ID-Hash: BVHMNIAZX6HN4CQ7OPXII3OOIVQPUKRM
X-Message-ID-Hash: BVHMNIAZX6HN4CQ7OPXII3OOIVQPUKRM
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVHMNIAZX6HN4CQ7OPXII3OOIVQPUKRM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20231011]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amadeusz-S-awi-ski/ASoC-Intel-avs-Only-create-SSP-d-snd_soc_dai_driver-when-requested/20231011-202503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231011121703.363652-5-amadeuszx.slawinski%40linux.intel.com
patch subject: [PATCH 04/16] ASoC: Intel: avs: i2s_test: Validate machine board configuration
config: powerpc-randconfig-003-20231012 (https://download.01.org/0day-ci/archive/20231012/202310120853.cfVtZkHx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120853.cfVtZkHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120853.cfVtZkHx-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_ssp':
>> i2s_test.c:(.text+0x0): multiple definition of `avs_mach_singular_ssp'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x1e80): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_port':
>> i2s_test.c:(.text+0x44): multiple definition of `avs_mach_ssp_port'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x1ec4): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_tdm':
>> i2s_test.c:(.text+0x88): multiple definition of `avs_mach_singular_tdm'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x1f08): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_tdm':
>> i2s_test.c:(.text+0x8c8): multiple definition of `avs_mach_ssp_tdm'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x3214): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_get_ssp_tdm':
>> i2s_test.c:(.text+0x938): multiple definition of `avs_mach_get_ssp_tdm'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x3284): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
