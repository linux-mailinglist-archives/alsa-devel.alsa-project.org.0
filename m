Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDCB8063A9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 01:51:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2521C857;
	Wed,  6 Dec 2023 01:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2521C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701823917;
	bh=Lxsl+6fT6wBQtU2JGMUWcGLlxUsdJ/uMypPUri2+hVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3LxW83/V/UaUf0re43VSuYTTRfN9vtbK9MjGDzV7m6xzpR2KSBjWMY3KLEuw0QPi
	 IVfvqBUbOqyNDYxNcTwZnQCU6MA3bF46zEihBzkSgKMUuXH78MVc1czMAIBV9xspcR
	 JkonhfsfAMwA1E0eAwVR94etXpKbh3f06zufTtgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E75F8055C; Wed,  6 Dec 2023 01:51:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D290F80570;
	Wed,  6 Dec 2023 01:51:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B13ABF8024E; Wed,  6 Dec 2023 01:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B35BCF800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 01:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B35BCF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jQhJ7c4Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701823871; x=1733359871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lxsl+6fT6wBQtU2JGMUWcGLlxUsdJ/uMypPUri2+hVs=;
  b=jQhJ7c4ZlUVeZSf0XC4ZSYbsLyUq8WSznDExVQLGCYAVZeG/hJb6ZSOb
   j7KMN5tvMbnb1Hl1zx8jDV+zhxFdmDKXhV/KW+vNV2vmpiAlirLhKz2SV
   gJtvX0RlJtI94MXJHevjeDcHHLmhmz0/oHZMApblrfAsFyuAePyjNAvvP
   NATKLHv5vEN9N1o4+XbKvb3PLDXB9b03WuUaDCfQNmPFaH4Sf/JB5g6cw
   B222WYTMXsKoLur6zioJyVpqgraejJpeCG+BYezzQagVXI2kVx3s3qvvD
   sqshPxzaJsWJGPoMzpUaGv+3pAy0DXAf3FRz0y+0FYe1PsCS479NjeKro
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12698979"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600";
   d="scan'208";a="12698979"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841652266"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600";
   d="scan'208";a="841652266"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 16:51:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAg7v-0009yt-18;
	Wed, 06 Dec 2023 00:50:59 +0000
Date: Wed, 6 Dec 2023 08:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski@linaro.org,
	broonie@kernel.org, agross@kernel.org, andersson@kernel.org,
	quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	quic_phaniu@quicinc.com, quic_avangala@quicinc.com
Cc: oe-kbuild-all@lists.linux.dev,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
Message-ID: <202312060830.GFAdSK3t-lkp@intel.com>
References: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
Message-ID-Hash: MO5RU77T3LMSPDSR7ITBKISEU7275FTB
X-Message-ID-Hash: MO5RU77T3LMSPDSR7ITBKISEU7275FTB
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MO5RU77T3LMSPDSR7ITBKISEU7275FTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/ASoC-codecs-wcd937x-Add-wcd937x-codec-driver/20231205-203631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231205123400.6353-1-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312060830.GFAdSK3t-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060830.GFAdSK3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060830.GFAdSK3t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wcd937x-sdw.c:1117:12: warning: 'wcd937x_sdw_runtime_resume' defined but not used [-Wunused-function]
    1117 | static int wcd937x_sdw_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/wcd937x-sdw.c:1105:12: warning: 'wcd937x_sdw_runtime_suspend' defined but not used [-Wunused-function]
    1105 | static int wcd937x_sdw_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/wcd937x_sdw_runtime_resume +1117 sound/soc/codecs/wcd937x-sdw.c

  1104	
> 1105	static int wcd937x_sdw_runtime_suspend(struct device *dev)
  1106	{
  1107		struct wcd937x_sdw_priv *wcd = dev_get_drvdata(dev);
  1108	
  1109		if (wcd->regmap) {
  1110			regcache_cache_only(wcd->regmap, true);
  1111			regcache_mark_dirty(wcd->regmap);
  1112		}
  1113	
  1114		return 0;
  1115	}
  1116	
> 1117	static int wcd937x_sdw_runtime_resume(struct device *dev)
  1118	{
  1119		struct wcd937x_sdw_priv *wcd = dev_get_drvdata(dev);
  1120	
  1121		if (wcd->regmap) {
  1122			regcache_cache_only(wcd->regmap, false);
  1123			regcache_sync(wcd->regmap);
  1124		}
  1125	
  1126		pm_runtime_mark_last_busy(dev);
  1127	
  1128		return 0;
  1129	}
  1130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
