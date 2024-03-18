Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43587F0AE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 20:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5EAA265E;
	Mon, 18 Mar 2024 20:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5EAA265E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710791973;
	bh=BQx6VNvTlzK5oQIvrUO32TBVz9kFRTi0gekP4j1rY5I=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PqnnM22YYRmUgStPQ1dvuBH+Zsqj72C1sgHSra8q3tavoM0UgN/CKqb38e6vkDuUf
	 UoraVP21zmm8JXDFH8W+8oIKZp/pVsQnZn8sdRsUEpknAGjVmdsSAi/i/rEJeRmyEP
	 N0JdRVxd2ZEZzKQx5WsCM1LqlyKHXZSLvQRGlAho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9DF6F805AB; Mon, 18 Mar 2024 20:59:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20529F805A0;
	Mon, 18 Mar 2024 20:59:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EE33F804E7; Mon, 18 Mar 2024 20:58:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2856BF8010B
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 20:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2856BF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AhqWEDHz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710791929; x=1742327929;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BQx6VNvTlzK5oQIvrUO32TBVz9kFRTi0gekP4j1rY5I=;
  b=AhqWEDHzRnUNVvZqNpOg+YIn1ll8CmhZous6IQkkABsElxgR0rbsTqGu
   z+fllKmiqicD31XxXNV82Eb8KsXLA+091me1pk8bRT0cXL70a6FhKrzmV
   YaX0G6cC5zIy62j/bDVyftwAT8YwhTH2GsZvQrbtVtJnDO1Hh5zh19886
   zRz5xElldGkxPrw23d2XHlEWB8C1GhXbmd0eQbtRNMCJxbm/b3ERTORsA
   30OYepY9cueeH36F1+APqS7m27bu/ivJT16fCnkQncbTajATx6Fja2DeM
   84+8uaTYkb4r9oga5Z0dOLbEvj5luxOErEQpXGMDkBctg5NddhBzk9+03
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16776149"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000";
   d="scan'208";a="16776149"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="937060632"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000";
   d="scan'208";a="937060632"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2024 12:58:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C6F03815; Mon, 18 Mar 2024 21:58:38 +0200 (EET)
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
Subject: [PATCH v1 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
Date: Mon, 18 Mar 2024 21:58:37 +0200
Message-ID: <20240318195837.180069-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C7OGJJXYOSKVX3PU45AZ5ZMEFV3NFB2U
X-Message-ID-Hash: C7OGJJXYOSKVX3PU45AZ5ZMEFV3NFB2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7OGJJXYOSKVX3PU45AZ5ZMEFV3NFB2U/>
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
 sound/soc/fsl/imx-es8328.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 6f0d031c1d5f..ad915c55cc35 100644
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
+	data->jack_gpiod = devm_gpiod_get_optional(dev, "jack");
+	if (IS_ERR(data->jack_gpiod)) {
+		ret = PTR_ERR(data->jack_gpiod);
+		goto put_device;
+	}
 
 	/*
 	 * CPU == Platform
-- 
2.43.0.rc1.1.gbec44491f096

