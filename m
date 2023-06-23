Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED3A73AF56
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 06:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B226836;
	Fri, 23 Jun 2023 06:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B226836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687493745;
	bh=pezzVGVqtBDROV1XjDruKDPfTik1gHEt+FcVzS1lrbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fOWeRYSIgVBl90AVsXjQFvV3PxR4N3AvtZOCD1J0+D+qqfUb8iy8TBpzOBojIDjUM
	 ImiIC2gqqKD3M9u0I/CfCYIKj09y/jpB6qw623ix/urdScHwTdNe6XavZ9UQ+kKJ1Z
	 T290a+nJx/mPWjHT3vacZDDVViIcyOKCqn2TZPVE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77EFAF80093; Fri, 23 Jun 2023 06:14:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC5EF80132;
	Fri, 23 Jun 2023 06:14:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0239CF80141; Fri, 23 Jun 2023 06:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 252A9F80093
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 06:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252A9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ioHnPVwW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687493653; x=1719029653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pezzVGVqtBDROV1XjDruKDPfTik1gHEt+FcVzS1lrbs=;
  b=ioHnPVwWEVu5cZbsKe2e++DX10M3p7IcNKxGv1MtlXNKdbC1hlOXI1ve
   EUQnU0II4+0MXLzLNpQtK5dayCRJ0miLn8B14z6zYoK9sTySbAGw/kmJX
   0v2LoSy7ux3fz54NS4zLs4tqVxVmZYRoDlv3R0SwJCXqEl09AwLNVbV6V
   TxX9U4phnyoW6XgTMAIOsL5H1E87y0fZW059jcCLwyWL99CPRRPpWQ1Dp
   ZJ5w+r0582uR3GLFkh5v85Oqe/xSUlOI1LuEGGbO7YsRFyQnH+59E9oTq
   0WpFH4dZMn9KgazkycneLTvBf+u9RKX8SfzImRy02b5CLHVUeNjwDmZ/K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359543352"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200";
   d="scan'208";a="359543352"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="665342239"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200";
   d="scan'208";a="665342239"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Jun 2023 21:13:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCYBH-0007yl-2f;
	Fri, 23 Jun 2023 04:13:55 +0000
Date: Fri, 23 Jun 2023 12:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/12] ASoC: amd: acp: remove the redundant acp
 enable/disable interrupts functions
Message-ID: <202306231233.NynpYomQ-lkp@intel.com>
References: <20230622152406.3709231-9-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622152406.3709231-9-Syed.SabaKareem@amd.com>
Message-ID-Hash: AZJ3LJOJXHQCGBGTOM2QR3S3F2WA4PYP
X-Message-ID-Hash: AZJ3LJOJXHQCGBGTOM2QR3S3F2WA4PYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZJ3LJOJXHQCGBGTOM2QR3S3F2WA4PYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Syed,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.4-rc7 next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-remove-acp-poweroff-function/20230622-233145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230622152406.3709231-9-Syed.SabaKareem%40amd.com
patch subject: [PATCH 05/12] ASoC: amd: acp: remove the redundant acp enable/disable interrupts functions
config: i386-buildonly-randconfig-r006-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231233.NynpYomQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231233.NynpYomQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231233.NynpYomQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acp_enable_interrupts
   >>> referenced by acp-renoir.c:191 (sound/soc/amd/acp/acp-renoir.c:191)
   >>>               sound/soc/amd/acp/acp-renoir.o:(renoir_audio_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: acp_disable_interrupts
   >>> referenced by acp-renoir.c:202 (sound/soc/amd/acp/acp-renoir.c:202)
   >>>               sound/soc/amd/acp/acp-renoir.o:(renoir_audio_remove) in archive vmlinux.a
   pahole: .tmp_vmlinux.btf: Invalid argument
   ld.lld: error: .btf.vmlinux.bin.o: unknown file type

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
