Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A88D5AAB
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 08:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767CA826;
	Fri, 31 May 2024 08:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767CA826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717137931;
	bh=UG2VPXJmnotgQCGbUJuzOG/RmR6KlipUd0UjDzTFmOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nhIh+a3/7pQ8mHctPcEiUVmzcHfpPBJ01Kaj2BnkLyBQO7RmMxIExnUJQOwBJfXEO
	 62DP59oml4kOXSmQ4Fgb4PFoXBtfEPZ0W3xFqnWuHvY1p1P8UzA3HBR+AtqLsCql5v
	 mmZp5kEV7bKG0sZ5iNR5MT/dqLicv/HnDfOWkfyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9415EF80588; Fri, 31 May 2024 08:44:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0697EF80525;
	Fri, 31 May 2024 08:44:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16461F80149; Fri, 31 May 2024 08:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FA95F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 08:44:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA95F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DBDR8JH5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717137852; x=1748673852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UG2VPXJmnotgQCGbUJuzOG/RmR6KlipUd0UjDzTFmOc=;
  b=DBDR8JH5+FKCo7LP7+HpLQbNI1Wrya+hh6R6LutQhXnOuXIp/xKptPjG
   8FfyoJFlr5U9/KitIL00pNfLvls6QxGo77duraHS6epx3nNP3JywUE+dz
   91kv8BSesD3enrQW8AirG3P/eoBblM2nGi/rSRJkOYtwSivIPkHf3aO2r
   ROqPa9mERfmbEsoupoFFGvsV4ADJd7t6LTv/pmax78Pj6WZ9fRZ5wZpZv
   uWq0Bh/M4h6QpII07Y69XtTDwmPTyowCtjGW+7EMFEHgbJBxPrqS8ornA
   d7eN2butkFYWcJmHS+5omRoSiPoyUueRpA6xdDNzg0Zst/CN79w7VGzr5
   g==;
X-CSE-ConnectionGUID: 0Mq03NWzTNa/DUjP2dcF8A==
X-CSE-MsgGUID: +Musv3YWQGCGJNhsfiG46g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17497241"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000";
   d="scan'208";a="17497241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:44:06 -0700
X-CSE-ConnectionGUID: 3FNSixCJRzeU6SpSydb64Q==
X-CSE-MsgGUID: MIPAgyHVT2ebsdue2tL+gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000";
   d="scan'208";a="36689755"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2024 23:43:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCvzO-000Gd3-2Y;
	Fri, 31 May 2024 06:43:49 +0000
Date: Fri, 31 May 2024 14:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
Message-ID: <202405311428.tzsBMIPs-lkp@intel.com>
References: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
Message-ID-Hash: LGKBZAQXDZW3CER44KXR65KTRYR3MAFU
X-Message-ID-Hash: LGKBZAQXDZW3CER44KXR65KTRYR3MAFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGKBZAQXDZW3CER44KXR65KTRYR3MAFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on shawnguo/for-next rockchip/for-next linus/master v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-codecs-Remove-unused-of_gpio-h/20240531-070350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240530230037.1156253-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
config: i386-buildonly-randconfig-006-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311428.tzsBMIPs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas2781-comlib.c:408:6: error: call to undeclared function 'gpio_is_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     408 |         if (gpio_is_valid(tas_priv->irq_info.irq_gpio))
         |             ^
   sound/soc/codecs/tas2781-comlib.c:408:6: note: did you mean 'uuid_is_valid'?
   include/linux/uuid.h:102:19: note: 'uuid_is_valid' declared here
     102 | bool __must_check uuid_is_valid(const char *uuid);
         |                   ^
>> sound/soc/codecs/tas2781-comlib.c:409:3: error: call to undeclared function 'gpio_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     409 |                 gpio_free(tas_priv->irq_info.irq_gpio);
         |                 ^
   sound/soc/codecs/tas2781-comlib.c:409:3: note: did you mean 'pmd_free'?
   include/asm-generic/pgtable-nopmd.h:63:20: note: 'pmd_free' declared here
      63 | static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
         |                    ^
   2 errors generated.
--
>> sound/soc/codecs/tas2781-i2c.c:664:6: error: call to undeclared function 'gpio_is_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     664 |         if (gpio_is_valid(tas_priv->irq_info.irq_gpio)) {
         |             ^
   sound/soc/codecs/tas2781-i2c.c:664:6: note: did you mean 'uuid_is_valid'?
   include/linux/uuid.h:102:19: note: 'uuid_is_valid' declared here
     102 | bool __must_check uuid_is_valid(const char *uuid);
         |                   ^
>> sound/soc/codecs/tas2781-i2c.c:665:8: error: call to undeclared function 'gpio_request'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     665 |                 rc = gpio_request(tas_priv->irq_info.irq_gpio,
         |                      ^
>> sound/soc/codecs/tas2781-i2c.c:668:4: error: call to undeclared function 'gpio_direction_input'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     668 |                         gpio_direction_input(
         |                         ^
   sound/soc/codecs/tas2781-i2c.c:668:4: note: did you mean 'gpiod_direction_input'?
   include/linux/gpio/consumer.h:110:5: note: 'gpiod_direction_input' declared here
     110 | int gpiod_direction_input(struct gpio_desc *desc);
         |     ^
>> sound/soc/codecs/tas2781-i2c.c:672:5: error: call to undeclared function 'gpio_to_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     672 |                                 gpio_to_irq(tas_priv->irq_info.irq_gpio);
         |                                 ^
   sound/soc/codecs/tas2781-i2c.c:672:5: note: did you mean 'gpiod_to_irq'?
   include/linux/gpio/consumer.h:167:5: note: 'gpiod_to_irq' declared here
     167 | int gpiod_to_irq(const struct gpio_desc *desc);
         |     ^
   4 errors generated.


vim +/gpio_is_valid +408 sound/soc/codecs/tas2781-comlib.c

ef3bcde75d06d6 Shenghao Ding 2023-06-18  405  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  406  void tasdevice_remove(struct tasdevice_priv *tas_priv)
ef3bcde75d06d6 Shenghao Ding 2023-06-18  407  {
ef3bcde75d06d6 Shenghao Ding 2023-06-18 @408  	if (gpio_is_valid(tas_priv->irq_info.irq_gpio))
ef3bcde75d06d6 Shenghao Ding 2023-06-18 @409  		gpio_free(tas_priv->irq_info.irq_gpio);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  410  	mutex_destroy(&tas_priv->codec_lock);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  411  }
ef3bcde75d06d6 Shenghao Ding 2023-06-18  412  EXPORT_SYMBOL_GPL(tasdevice_remove);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  413  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
