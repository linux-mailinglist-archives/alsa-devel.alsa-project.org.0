Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426DDBED1C1
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Oct 2025 16:53:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB8460208;
	Sat, 18 Oct 2025 16:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB8460208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1760799207;
	bh=ss3msW3ez0J0KL/I1/sIxQcqbu/nUB2XvbWyURNEvY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hiV8J0Zt9VjwNr2QFj8FEB/xxgQtG8pUynPfrAs9MkQOsPN1QByoPvHugatSRbMHc
	 RGi+GU1MoxLvMGXurgfGF3BUxVXGp0HpTr615/8PU8HaBXeUdgUL7qvlDxM7/j3SJf
	 K9QIlrucLKdDTzVx+UhKCoIGOcNumTj2RNJT8jnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 404E3F800C1; Sat, 18 Oct 2025 16:52:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 324C9F8051F;
	Sat, 18 Oct 2025 16:52:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7BDEF800C1; Sat, 18 Oct 2025 16:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CF50F80086
	for <alsa-devel@alsa-project.org>; Sat, 18 Oct 2025 16:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CF50F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NZIZ0oKn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760799169; x=1792335169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GH6yt844+jXIfXMA5SG8a+s6Xwg5qdClbehUeU5rSus=;
  b=NZIZ0oKnKjst9XMks8pGBLCbV42OmYUVdT6I0P1zztKdo2GMl+XygH2z
   cmYQ6+Judk6KPaUf1V88GXDn6Y0/bn93ni/Si02zObyqYen+MBryPfQos
   Xqli+0F2fJqJmj8zD5YNV4Kp/cFY9ymj4pMVlnng87RPHMS06RTs8QxLs
   8CGtvF0ra8kcVWxgLqpJfwnT+aJ8c8y5k9eVKWceEX8wxt1LiGWFs0JYS
   vrz4LslNqwFshpu+EdVQoCPWjcf1Q7WJ7nveSpLKctzIE+sP4jCpkmeHB
   c3YudAy1lvEwguUzTKLdzvSY0K6wtf63xi0DOmOH5/lk1i9Ee4UGRvZUa
   g==;
X-CSE-ConnectionGUID: MgQF/D9+Tqmkk5LsjiEUzg==
X-CSE-MsgGUID: NBfLznjnQXG76sptWFoC8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74430671"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000";
   d="scan'208";a="74430671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 07:52:46 -0700
X-CSE-ConnectionGUID: KaEh6rMdSo+wXLsS3EtNfQ==
X-CSE-MsgGUID: ZXa+7TXyTQCgHr6FfSeKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000";
   d="scan'208";a="183380908"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2025 07:52:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA8IN-0008L7-0u;
	Sat, 18 Oct 2025 14:52:36 +0000
Date: Sat, 18 Oct 2025 22:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Oder Chiou <oder_chiou@realtek.com>, broonie@kernel.org,
	lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	flove@realtek.com, shumingf@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH v5 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
Message-ID: <202510182222.lSFRBRdo-lkp@intel.com>
References: <20251015103404.3075684-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015103404.3075684-1-oder_chiou@realtek.com>
Message-ID-Hash: QSVHJLWQJVF2XVQQPNLEZ3K2RK4YK2DG
X-Message-ID-Hash: QSVHJLWQJVF2XVQQPNLEZ3K2RK4YK2DG
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Oder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oder-Chiou/ASoC-dt-bindings-realtek-rt5575-add-bindings-for-ALC5575/20251017-203710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251015103404.3075684-1-oder_chiou%40realtek.com
patch subject: [PATCH v5 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
config: riscv-randconfig-r131-20251018 (https://download.01.org/0day-ci/archive/20251018/202510182222.lSFRBRdo-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182222.lSFRBRdo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182222.lSFRBRdo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/rt5575.c:298:39: sparse: sparse: symbol 'rt5575_soc_component_dev' was not declared. Should it be static?

vim +/rt5575_soc_component_dev +298 sound/soc/codecs/rt5575.c

   297	
 > 298	const struct snd_soc_component_driver rt5575_soc_component_dev = {
   299		.probe = rt5575_probe,
   300		.controls = rt5575_snd_controls,
   301		.num_controls = ARRAY_SIZE(rt5575_snd_controls),
   302		.dapm_widgets = rt5575_dapm_widgets,
   303		.num_dapm_widgets = ARRAY_SIZE(rt5575_dapm_widgets),
   304		.dapm_routes = rt5575_dapm_routes,
   305		.num_dapm_routes = ARRAY_SIZE(rt5575_dapm_routes),
   306		.use_pmdown_time = 1,
   307		.endianness = 1,
   308	};
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
