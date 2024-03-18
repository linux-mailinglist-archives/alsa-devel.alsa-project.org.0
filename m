Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3287F0EA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 21:08:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770672BAD;
	Mon, 18 Mar 2024 21:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770672BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710792533;
	bh=sMw7esYZrxxW1kATPTh6O4ptDRoE3Q+nZihwtYXZxlg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=atiXbEmGMx9R6EiHZRhcUUGsmNQyWZ+Roybppk3rlASwWZZhMn/JValmt8+UA9f2Z
	 4LUgsbzC/RCzcK/hdaeh0QP68Vl+PCva6DtbI4n3ybc/LjQBjey6AXOE/CiH8QoCUj
	 RtIsFhdyJqx4ZOvrF0hpK4PAldJfcoAUYDuSTHhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DBF1F8057B; Mon, 18 Mar 2024 21:08:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F31A9F802DB;
	Mon, 18 Mar 2024 21:08:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE98CF804E7; Mon, 18 Mar 2024 21:08:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15F85F80088
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 21:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F85F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gi3TtADR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710792495; x=1742328495;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sMw7esYZrxxW1kATPTh6O4ptDRoE3Q+nZihwtYXZxlg=;
  b=gi3TtADReTWRO1ceU0keaA8CG+Pv6xJfyeBznwTdGTX03QZ/99MBQYRQ
   mP0CtzvfjLAtPARzJ1SHk8YqT+oKMoHv7MSJSaT6tSKJTTH1FZxLLfXyu
   NpYs2UNooC7U50SAGob1skpIQ2sxc8GWDIDJkoEGay+EX2aXIezU6TnXU
   THu81mkBmFV/zlWXzLJZmhmEcvSEjdgCXvZjDbHYEXN5i7smEQmxKw0+F
   J4chS2iwD5qJKojzfcu3KhNfmfpM+VQyoNxAFCFlzrhH5/s6NvMi2a0kf
   xtdfLntrWMXajNIpl1zCffVMF4ZmovCeWB1yuH59oEwbaPDhi2kUNaNEj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16354705"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000";
   d="scan'208";a="16354705"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="937060635"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000";
   d="scan'208";a="937060635"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2024 13:08:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 68B82241; Mon, 18 Mar 2024 22:08:06 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
Date: Mon, 18 Mar 2024 22:07:56 +0200
Message-ID: <20240318200804.181516-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ADDYMSP7XI5XI5LKXLRRSD5PJ63PGPJF
X-Message-ID-Hash: ADDYMSP7XI5XI5LKXLRRSD5PJ63PGPJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADDYMSP7XI5XI5LKXLRRSD5PJ63PGPJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This updates the driver to gpiod API, and removes yet another use of
of_get_named_gpio().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed compilation error
 sound/soc/fsl/imx-es8328.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 6f0d031c1d5f..d67b8a149bff 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -3,7 +3,7 @@
 // Copyright 2012 Freescale Semiconductor, Inc.
 // Copyright 2012 Linaro Ltd.
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -23,7 +23,7 @@ struct imx_es8328_data {
 	struct snd_soc_card card;
 	char codec_dai_name[DAI_NAME_SIZE];
 	char platform_name[DAI_NAME_SIZE];
-	int jack_gpio;
+	struct gpio_desc *jack_gpiod;
 };
 
 static struct snd_soc_jack_gpio headset_jack_gpios[] = {
@@ -54,8 +54,8 @@ static int imx_es8328_dai_init(struct snd_soc_pcm_runtime *rtd)
 					struct imx_es8328_data, card);
 	int ret = 0;
 
-	/* Headphone jack detection */
-	if (gpio_is_valid(data->jack_gpio)) {
+	if (data->jack_gpiod) {
+		/* Headphone jack detection */
 		ret = snd_soc_card_jack_new_pins(rtd->card, "Headphone",
 						 SND_JACK_HEADSET | SND_JACK_BTN_0,
 						 &headset_jack,
@@ -64,7 +64,7 @@ static int imx_es8328_dai_init(struct snd_soc_pcm_runtime *rtd)
 		if (ret)
 			return ret;
 
-		headset_jack_gpios[0].gpio = data->jack_gpio;
+		headset_jack_gpios[0].desc = data->jack_gpiod;
 		ret = snd_soc_jack_add_gpios(&headset_jack,
 					     ARRAY_SIZE(headset_jack_gpios),
 					     headset_jack_gpios);
@@ -174,7 +174,11 @@ static int imx_es8328_probe(struct platform_device *pdev)
 
 	data->dev = dev;
 
-	data->jack_gpio = of_get_named_gpio(pdev->dev.of_node, "jack-gpio", 0);
+	data->jack_gpiod = devm_gpiod_get_optional(dev, "jack", GPIOD_IN);
+	if (IS_ERR(data->jack_gpiod)) {
+		ret = PTR_ERR(data->jack_gpiod);
+		goto put_device;
+	}
 
 	/*
 	 * CPU == Platform
-- 
2.43.0.rc1.1.gbec44491f096

