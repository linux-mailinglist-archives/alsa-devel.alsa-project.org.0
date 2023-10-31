Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D63C97DCB77
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 12:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92CF9850;
	Tue, 31 Oct 2023 12:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92CF9850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698750621;
	bh=qvrwnc35erdZoVBiQV02YhA2bWWfgE0gKFuh2GpCkNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dd6fWhaNcMvv+jxozKlGn0x6IsKgXpLdSChL8Zw8Ya5fuPoVQPbg/L5EVCeI03hNN
	 g1Ar8TbVXtYrRxl5KFVAnpQK4axfE13vxmVKaHoaqYX4wHztCXu0lzRRG5/ApLtY1y
	 8Gvdqnm/GVljgn48qwju1kkuQobZ0/9kypo8V86s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5BA2F80537; Tue, 31 Oct 2023 12:09:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FCC6F8016D;
	Tue, 31 Oct 2023 12:09:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3186F8020D; Tue, 31 Oct 2023 12:09:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ED4BF80152
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 12:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ED4BF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zm+AlSuT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698750556; x=1730286556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qvrwnc35erdZoVBiQV02YhA2bWWfgE0gKFuh2GpCkNs=;
  b=Zm+AlSuT35Q8oBUutxiJr0IQ+GZft/k2GgIrLTIrXf2/bnYmdHk5M0g/
   Qhl6rOIR1//K7JtIi2N13N7RsaWjCn2HTpBEW1ZwWHInovH0kk+mD3MP+
   IMy0fsXCyNjxnvmIb6guNx+gZyy3qdqhlKLwu9tS3nFmdQz+dwQSip+fw
   ZNQnULMHdyQwWz4JfUPAAysDoIAPr/mznjvCmopxNcobYXXbLLcdBh2S9
   fmohYI9UNlUQUJsZci9szRExZVm2mw7o6GmgFFvFkhj6i9fkyl0irE7cu
   2ePn99R2LSrxuf7XXCcg4D/vJBjQ2YuFPL0+rMD5HBvLk+3OUzSS0waE6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373316758"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200";
   d="scan'208";a="373316758"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 04:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200";
   d="scan'208";a="8298958"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2023 04:09:08 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxmcL-00007a-1t;
	Tue, 31 Oct 2023 11:09:05 +0000
Date: Tue, 31 Oct 2023 19:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	kevin-lu@ti.com, shenghao-ding@ti.com, baojun.xu@ti.com,
	peeyush@ti.com, navada@ti.com, tiwai@suse.de
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
Message-ID: <202310311857.BgEnJVnO-lkp@intel.com>
References: <20231028092409.96813-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028092409.96813-1-baojun.xu@ti.com>
Message-ID-Hash: Q5B6KEGNKX5657WDXSI3NCUO4DXAMMPM
X-Message-ID-Hash: Q5B6KEGNKX5657WDXSI3NCUO4DXAMMPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5B6KEGNKX5657WDXSI3NCUO4DXAMMPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.6 next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ASoC-tas2783-Add-source-files-for-tas2783-driver/20231028-172643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231028092409.96813-1-baojun.xu%40ti.com
patch subject: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20231031/202310311857.BgEnJVnO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311857.BgEnJVnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311857.BgEnJVnO-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: sound/soc/codecs/tas2783-sdw.o: in function `tas2783_calibration.isra.0':
   tas2783-sdw.c:(.text+0xd48): undefined reference to `efi'
>> nios2-linux-ld: tas2783-sdw.c:(.text+0xd50): undefined reference to `efi'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
