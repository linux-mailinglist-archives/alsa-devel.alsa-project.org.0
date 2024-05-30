Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB98D55E8
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 01:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195CDE0D;
	Fri, 31 May 2024 01:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195CDE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717110158;
	bh=/9NwactfLrDdcsSkAc55CTXJmcNkzXYPFHItVyZLdX0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ocOIG3UCqM+z6ylQb2W8K1cg+iUthiwHh51Fj4c1ZSQo/eFqwtiEqfIGS6jJ0V+bn
	 hsxEEIH3PXJxvl13TJhzl7ZOhleiWtCmGcPP9az8Kuwft6JGt6ad4mKzwfc/Wga2tG
	 2kKXFvvCRWQUyvyiR8dYiPlcs3XpkR+VbJ4Xzefc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC35F80637; Fri, 31 May 2024 01:01:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BBF0F8062F;
	Fri, 31 May 2024 01:01:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79578F805E8; Fri, 31 May 2024 01:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01730F800E9
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 01:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01730F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=al5Gu/zN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717110061; x=1748646061;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/9NwactfLrDdcsSkAc55CTXJmcNkzXYPFHItVyZLdX0=;
  b=al5Gu/zN5e9wYldTeAQiJk0rrOLgzudeUSq8YqwYtS+7+Q5CECggSNk/
   CAcMUVQeCC6P60vyrBcOVanM+e7IDsEhVYzHfvY6kpF12n3R0z7Bp8Geb
   vaNkaUrD5cGOwgh6wKW0hKlXNa+eOaEbPW953m2s/YP3LlLQbQKmn0ZeT
   NnAvYymz4qwJyuC5Fl/MCBUC6cam/GhYLtPjYf1StS1gyHGr0mibuLkwm
   +ssajXJDY/UoOWMD9B9NzGl/5gGwKHmH5dhQhN4IDyzFmdHZWFP45hwlR
   7Mnd2wZwDUVOuDQxdUkBcd/Er+r1d1uryCxUeMfsrsR5TkjME7iH+kcPy
   Q==;
X-CSE-ConnectionGUID: j9gwbUkJRF2Olf3BOyAUUw==
X-CSE-MsgGUID: hIAC5aKaQP2zrNLdFNIp3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24195291"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000";
   d="scan'208";a="24195291"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 16:00:51 -0700
X-CSE-ConnectionGUID: oJBYKXTMS6y/WfORsCy0/A==
X-CSE-MsgGUID: eLPKab+gQAunLOPngcKojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000";
   d="scan'208";a="40895193"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 16:00:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E52A11A3; Fri, 31 May 2024 02:00:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 0/6] ASoC: Drop or replace of_gpio.h
Date: Fri, 31 May 2024 01:58:46 +0300
Message-ID: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YPQQD6POMPC5PFOHJVSWIJNGQ3RGDMUK
X-Message-ID-Hash: YPQQD6POMPC5PFOHJVSWIJNGQ3RGDMUK
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPQQD6POMPC5PFOHJVSWIJNGQ3RGDMUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace or drop the legacy header that is subject to remove.
Not all of them were compile-tested, the series might have
hidden compilation errors.

Andy Shevchenko (6):
  ASoC: codecs: Remove unused of_gpio.h
  ASoC: fsl: Remove unused of_gpio.h
  ASoC: rockchip: Remove unused of_gpio.h
  ASoC: codecs: Replace of_gpio.h by proper one
  ASoC: generic: Replace of_gpio.h by proper one
  ASoC: samsung: Replace of_gpio.h by proper one

 sound/soc/codecs/ak4118.c                           | 1 -
 sound/soc/codecs/ak4458.c                           | 1 -
 sound/soc/codecs/aw88395/aw88395.c                  | 2 +-
 sound/soc/codecs/aw88399.c                          | 1 -
 sound/soc/codecs/cs53l30.c                          | 1 -
 sound/soc/codecs/max98390.c                         | 1 -
 sound/soc/codecs/pcm3168a.c                         | 1 -
 sound/soc/codecs/rk817_codec.c                      | 1 -
 sound/soc/codecs/tas2552.c                          | 1 -
 sound/soc/codecs/tas2764.c                          | 1 -
 sound/soc/codecs/tas2770.c                          | 1 -
 sound/soc/codecs/tas2780.c                          | 1 -
 sound/soc/codecs/tas2781-comlib.c                   | 1 -
 sound/soc/codecs/tas2781-fmwlib.c                   | 1 -
 sound/soc/codecs/tas2781-i2c.c                      | 1 -
 sound/soc/codecs/tlv320adc3xxx.c                    | 1 -
 sound/soc/codecs/tlv320adcx140.c                    | 1 -
 sound/soc/codecs/tlv320aic31xx.c                    | 1 -
 sound/soc/codecs/ts3a227e.c                         | 1 -
 sound/soc/codecs/wsa883x.c                          | 1 -
 sound/soc/fsl/imx-es8328.c                          | 1 -
 sound/soc/fsl/imx-rpmsg.c                           | 2 --
 sound/soc/generic/audio-graph-card2-custom-sample.c | 3 ++-
 sound/soc/rockchip/rockchip_i2s.c                   | 1 -
 sound/soc/rockchip/rockchip_spdif.c                 | 1 -
 sound/soc/samsung/aries_wm8994.c                    | 2 +-
 26 files changed, 4 insertions(+), 27 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

