Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1E776D8A3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 22:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 671BF1E7;
	Wed,  2 Aug 2023 22:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 671BF1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691007881;
	bh=wNJE+tHOkA2JBFbffGog0gKl+eASCvV9DEWQPDfL5Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rzfTLIwcivkvSmJLd1NHtPKDenLjV0Lk12uFF55M4vwcUTd9MmmTOTw/ueuXJ0TR/
	 oD2WIOwuUym4zK2qXlCAEjbGDC3wwaMl/z+0UduydnhqsNN5Kb4TyBzqgNaa0oyw0J
	 hNs0MLVZR50z9vObwbXnr0V1HQLeuCDEVIHlKr84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D04C2F80425; Wed,  2 Aug 2023 22:23:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14E9EF801D5;
	Wed,  2 Aug 2023 22:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA9B3F8025A; Wed,  2 Aug 2023 22:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29EADF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 22:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29EADF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kt5sVOb3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691007817; x=1722543817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wNJE+tHOkA2JBFbffGog0gKl+eASCvV9DEWQPDfL5Iw=;
  b=kt5sVOb3ELUveFkUGYoE2jT1Xz1uQjIcaUhyEIc+b9QrKvzyaSpP3Aax
   X9uX1TXS55knP+jGkLW6OgVEP7dlm3SJlcz5rpE9lTIoqSoBA+Mi2uQcL
   Se5yUmzFpAjjgay3h9mYShmn4o3PfxowKX2lzWAEC3ohihI4qfaquAXRV
   B4xX0md567/sQjfTeARyNXALKwsO1dYYZUrvMIZ4rU02P5eH8fB8juxOR
   ySCEuKXjee/DntKgMofveBp7ftBIwZDIWFbz7BduFM/ofIJmFViFMgQgO
   IT7CYBRfXYARsERV5n16SRK3VSslYlolF8agouFSy7pDFPMd4SUscpaT1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436007935"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200";
   d="scan'208";a="436007935"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 13:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="975808122"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200";
   d="scan'208";a="975808122"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Aug 2023 13:23:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRINQ-0001Sh-31;
	Wed, 02 Aug 2023 20:23:24 +0000
Date: Thu, 3 Aug 2023 04:23:03 +0800
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
Message-ID: <202308030402.Y1yMDGnZ-lkp@intel.com>
References: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
Message-ID-Hash: NTLCRK22VQPKDWVJ4FC5JLCWENKJKEVD
X-Message-ID-Hash: NTLCRK22VQPKDWVJ4FC5JLCWENKJKEVD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTLCRK22VQPKDWVJ4FC5JLCWENKJKEVD/>
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
[also build test WARNING on next-20230802]
[cannot apply to tiwai-sound/for-linus linus/master v6.5-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-W-Wang-oc/ALSA-hda-Zhaoxin-Add-HDAC-PCI-IDs-and-HDMI-Codec-Vendor-IDs/20230731-140118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230731055932.4336-1-TonyWWang-oc%40zhaoxin.com
patch subject: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI Codec Vendor IDs
config: nios2-randconfig-r093-20230730 (https://download.01.org/0day-ci/archive/20230803/202308030402.Y1yMDGnZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030402.Y1yMDGnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030402.Y1yMDGnZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/hda_controller.c:1051:38: sparse: sparse: cast removes address space '__iomem' of expression
>> sound/pci/hda/hda_controller.c:1051:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got char * @@
   sound/pci/hda/hda_controller.c:1051:66: sparse:     expected void volatile [noderef] __iomem *addr
   sound/pci/hda/hda_controller.c:1051:66: sparse:     got char *
   sound/pci/hda/hda_controller.c:1053:44: sparse: sparse: cast removes address space '__iomem' of expression
   sound/pci/hda/hda_controller.c:1053:72: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got char * @@
   sound/pci/hda/hda_controller.c:1053:72: sparse:     expected void volatile [noderef] __iomem *addr
   sound/pci/hda/hda_controller.c:1053:72: sparse:     got char *

vim +/__iomem +1051 sound/pci/hda/hda_controller.c

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
