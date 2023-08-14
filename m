Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671077AF42
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 03:57:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6573E;
	Mon, 14 Aug 2023 03:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6573E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691978276;
	bh=F+QMvzi81yh+mFu9IZknTHoIchA90XpBkgqOg23VMWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fv4X9g8jbSl8732XV/FmjIqYtOdS0W+yJznLPdh22oW1E70Jh/0s9jY5boDtvepSW
	 ndOjqi7gc1VBGuIn51vrU92kLNhmI/TwMlksizaxV992Wc5M3tPGxOk0tSjjrhTEFL
	 7OGkuvswmtAgQeDxCmh9Dv3oxQ75kAbhRazEDyXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C5DCF8025F; Mon, 14 Aug 2023 03:57:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 072FFF80254;
	Mon, 14 Aug 2023 03:57:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB5ABF8025F; Mon, 14 Aug 2023 03:56:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97AEBF800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 03:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97AEBF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F9Mmjt6V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691978209; x=1723514209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+QMvzi81yh+mFu9IZknTHoIchA90XpBkgqOg23VMWs=;
  b=F9Mmjt6VUdgb6d1SoqmHtB+OKR9fNNN5cUbgoqajToHu731zLyKk6hGg
   2CdlIBq1TrEY0oANzKV/NPOHlxkEb3CctELf8cLEKi885VS7BEDcyuO5a
   cTcG/fFWhuQJ9KhEt/WBahM+RgO29bvzd0OOJZWkbDUBpc8bC5JymqGPb
   j8jXyejWiZDAC/Xa3KJBnUbFN/V7sXcGnT8O69o0g4zKdH/1FgWu7rhca
   KjEI0soFEfEJNOKPQwEK1oBf3YUX2c0GQNnmzXfHPdOMRcfMgc0ai4VMC
   dOPmGizRm+RZFQvrdacz/pmZxPm38B8qLPzUkNkAz5vgO1rAcr8DzwYTZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="351544226"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="351544226"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2023 18:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="733290602"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="733290602"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Aug 2023 18:56:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVMou-0009JE-1P;
	Mon, 14 Aug 2023 01:56:36 +0000
Date: Mon, 14 Aug 2023 09:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>, perex@perex.cz,
	tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
	zhangyiqun@phytium.com.cn, peter.ujfalusi@linux.intel.com,
	broonie@kernel.org, chenhuacai@kernel.org,
	cezary.rojewski@intel.com, siyanteng@loongson.cn,
	amadeuszx.slawinski@linux.intel.com, evan.quan@amd.com,
	jasontao@glenfly.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, mkumard@nvidia.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, CobeChen@zhaoxin.com, TimGuo@zhaoxin.com,
	LeoLiu-oc@zhaoxin.com
Subject: Re: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI Codec
 Vendor IDs
Message-ID: <202308140952.khPgynBT-lkp@intel.com>
References: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
Message-ID-Hash: 4MK6WMGJ3NFE3JVDMOW36UUHZPLOPPJU
X-Message-ID-Hash: 4MK6WMGJ3NFE3JVDMOW36UUHZPLOPPJU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MK6WMGJ3NFE3JVDMOW36UUHZPLOPPJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230809]
[cannot apply to tiwai-sound/for-linus linus/master v6.5-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-W-Wang-oc/ALSA-hda-Zhaoxin-Add-HDAC-PCI-IDs-and-HDMI-Codec-Vendor-IDs/20230731-140118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230731055932.4336-1-TonyWWang-oc%40zhaoxin.com
patch subject: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI Codec Vendor IDs
config: mips-randconfig-r073-20230814 (https://download.01.org/0day-ci/archive/20230814/202308140952.khPgynBT-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308140952.khPgynBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308140952.khPgynBT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/pci/hda/hda_controller.c:1051:38: sparse: sparse: cast removes address space '__iomem' of expression
>> sound/pci/hda/hda_controller.c:1051:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got char * @@
   sound/pci/hda/hda_controller.c:1051:66: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/hda/hda_controller.c:1051:66: sparse:     got char *
   sound/pci/hda/hda_controller.c:1053:44: sparse: sparse: cast removes address space '__iomem' of expression
   sound/pci/hda/hda_controller.c:1053:72: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got char * @@
   sound/pci/hda/hda_controller.c:1053:72: sparse:     expected void volatile [noderef] __iomem *mem
   sound/pci/hda/hda_controller.c:1053:72: sparse:     got char *

vim +1051 sound/pci/hda/hda_controller.c

  1046	
  1047	static void azx_rirb_zxdelay(struct azx *chip, int enable)
  1048	{
  1049		if (chip->remap_diu_addr) {
  1050			if (!enable)
> 1051				writel(0x0, (char *)chip->remap_diu_addr + 0x490a8);
  1052			else
  1053				writel(0x1000000, (char *)chip->remap_diu_addr + 0x490a8);
  1054		}
  1055	}
  1056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
