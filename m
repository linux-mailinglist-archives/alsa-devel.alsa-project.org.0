Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF18FD9C3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 00:17:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26407E66;
	Thu,  6 Jun 2024 00:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26407E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717625844;
	bh=dwECkwwPLF86p2uDLyCcd8vztQ4JautCXDJYA3o9rvk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i1NywSApb6P5bNSi1fU9qgSoNKiyRUGD/QQE1wVWes0HblwFdSvDM12OR831wfJEw
	 Voly4Rj45VWcee4Me1J3uFJfFdNhC69Kc+BzoOipuHhpjG1aiqIBkUOQ+3LjUNqJft
	 rIgKgXux7oKPFaZQ358UgkfPj5B28qmJGsnCwPJw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAD67F8067F; Thu,  6 Jun 2024 00:15:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D077BF80682;
	Thu,  6 Jun 2024 00:15:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A177EF8025A; Thu,  6 Jun 2024 00:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE251F80496
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 00:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE251F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J2gkU69E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717625706; x=1749161706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dwECkwwPLF86p2uDLyCcd8vztQ4JautCXDJYA3o9rvk=;
  b=J2gkU69EeT1iLeSWlaMviK2Pz0GjyfBEJirK39jO0b4M0XyW96ptQZ5P
   42Qjx9219XMlwoJmQcXrQL31w8SDfWULQd54Ddyk18KU9r1ypWfS8MHTA
   g0hav9HYiLJ2SSV+7xw5hHERqnU7sCU6D20UaPfeHJk0mqo6L54b1BUL2
   E+P1bG3V2DyAmrzCFJfZhh1Gh6+3L7cks+y/fsKBL/ZJcFTizQtimbZwF
   LB+eGg0Zyb1bHzzBPXWNs5d5oCZYidk7glOv4I40Pi+wtt3lnB+BfgCk8
   KvFw/XmicyuK1gG0RmpZMUZRBfQKf41rY5zkzD+qrt/RtpVGLP46DX4ru
   g==;
X-CSE-ConnectionGUID: DneNphLVSSae2rxfONWu7g==
X-CSE-MsgGUID: PzExcPJSQ9W2TFqQ0eDsng==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14218700"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="14218700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 15:14:57 -0700
X-CSE-ConnectionGUID: JP45dUK1TdW/fW9g0ksUVQ==
X-CSE-MsgGUID: zMDwYyHVQI2ocTPWwtYvvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="37621427"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2024 15:14:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 975E024D; Thu, 06 Jun 2024 01:14:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
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
Subject: [PATCH v2 0/6] ASoC: Drop or replace of_gpio.h
Date: Thu,  6 Jun 2024 00:27:23 +0300
Message-ID: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QHYUVYBC2B4QEVF27IQFVXTKIHYON75A
X-Message-ID-Hash: QHYUVYBC2B4QEVF27IQFVXTKIHYON75A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHYUVYBC2B4QEVF27IQFVXTKIHYON75A/>
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

In v3:
- moved aw88399 from the "Remove ..." patch to the "Replace ..." (LKP)

In v2:
- added tags (Kuninori, Charles)
- ripped out TAS2781 (it's a mess from GPIO handling perspective)

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
 sound/soc/codecs/aw88399.c                          | 2 +-
 sound/soc/codecs/cs53l30.c                          | 1 -
 sound/soc/codecs/max98390.c                         | 1 -
 sound/soc/codecs/pcm3168a.c                         | 1 -
 sound/soc/codecs/rk817_codec.c                      | 1 -
 sound/soc/codecs/tas2552.c                          | 1 -
 sound/soc/codecs/tas2764.c                          | 1 -
 sound/soc/codecs/tas2770.c                          | 1 -
 sound/soc/codecs/tas2780.c                          | 1 -
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
 23 files changed, 5 insertions(+), 24 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

