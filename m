Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EEE75A61
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 00:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 522931F0E;
	Fri, 26 Jul 2019 00:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 522931F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564092419;
	bh=I5gjqj6cRRRZFmljFsfvAGasi9moOQL9eFFDNUrU+rI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmnDi51y3+Opbm0XWGrM6iRFXsmstL3pGotXu67HfmNMQagafPEPLsDvnMKyfIc2v
	 NynNEi7kl03vsfnNhXBgUpqMrZlhFEX90uO32rvLim8htwa9sI2Bna5VUwJE5OW3Cf
	 MKUVIjMpHKIv0quAu6moLWZDRsisXq5+2UhjtQSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31DB7F804FE;
	Fri, 26 Jul 2019 00:03:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E951EF804FF; Fri, 26 Jul 2019 00:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46987F804CB
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 00:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46987F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="vRUeERQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564092187; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTh5425yXCqJXuaiG2LiwB549PtGkNt17YNuvHqHC/0=;
 b=vRUeERQTbUEcJBBZ1i5UD7gFOly4svQz+BjzJb8F8Wi28xvIs5nnGUrtXcjNs/PseSGxPw
 DsNg5L7bVGjc2MI3TKCzHdMwGAkrmdtxj6F4jyn0rjRAQbhnRvEVEO93Gc4srMEC4Ak46F
 xzT0eYXO20oEtKy20FZqPnidIT3YwVg=
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Thu, 25 Jul 2019 18:02:08 -0400
Message-Id: <20190725220215.460-5-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org
Subject: [alsa-devel] [PATCH 04/11] ASoC: jz4740: Drop lb60 board code
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The board now uses the simple-audio-card driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 sound/soc/jz4740/Kconfig   |  25 +--------
 sound/soc/jz4740/Makefile  |   5 --
 sound/soc/jz4740/qi_lb60.c | 106 -------------------------------------
 3 files changed, 2 insertions(+), 134 deletions(-)
 delete mode 100644 sound/soc/jz4740/qi_lb60.c

diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
index 6b757168693e..e72f826062e9 100644
--- a/sound/soc/jz4740/Kconfig
+++ b/sound/soc/jz4740/Kconfig
@@ -1,30 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_JZ4740_SOC
-	tristate "SoC Audio for Ingenic JZ4740 SoC"
-	depends on MIPS || COMPILE_TEST
-	select SND_SOC_GENERIC_DMAENGINE_PCM
-	help
-	  Say Y or M if you want to add support for codecs attached to
-	  the JZ4740 I2S interface. You will also need to select the audio
-	  interfaces to support below.
-
-if SND_JZ4740_SOC
-
 config SND_JZ4740_SOC_I2S
 	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
+	depends on MIPS || COMPILE_TEST
 	depends on HAS_IOMEM
+	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y if you want to use I2S protocol and I2S codec on Ingenic JZ4740
 	  based boards.
-
-config SND_JZ4740_SOC_QI_LB60
-	tristate "SoC Audio support for Qi LB60"
-	depends on HAS_IOMEM
-	depends on JZ4740_QI_LB60 || COMPILE_TEST
-	select SND_JZ4740_SOC_I2S
-    select SND_SOC_JZ4740_CODEC
-	help
-	  Say Y if you want to add support for ASoC audio on the Qi LB60 board
-	  a.k.a Qi Ben NanoNote.
-
-endif
diff --git a/sound/soc/jz4740/Makefile b/sound/soc/jz4740/Makefile
index fb10e9ad9ff7..f8701c9b09fe 100644
--- a/sound/soc/jz4740/Makefile
+++ b/sound/soc/jz4740/Makefile
@@ -5,8 +5,3 @@
 snd-soc-jz4740-i2s-objs := jz4740-i2s.o
 
 obj-$(CONFIG_SND_JZ4740_SOC_I2S) += snd-soc-jz4740-i2s.o
-
-# Jz4740 Machine Support
-snd-soc-qi-lb60-objs := qi_lb60.o
-
-obj-$(CONFIG_SND_JZ4740_SOC_QI_LB60) += snd-soc-qi-lb60.o
diff --git a/sound/soc/jz4740/qi_lb60.c b/sound/soc/jz4740/qi_lb60.c
deleted file mode 100644
index 8ef6f41dcfbe..000000000000
--- a/sound/soc/jz4740/qi_lb60.c
+++ /dev/null
@@ -1,106 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2009, Lars-Peter Clausen <lars@metafoo.de>
- */
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/timer.h>
-#include <linux/interrupt.h>
-#include <linux/platform_device.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-#include <linux/gpio/consumer.h>
-
-struct qi_lb60 {
-	struct gpio_desc *snd_gpio;
-	struct gpio_desc *amp_gpio;
-};
-
-static int qi_lb60_spk_event(struct snd_soc_dapm_widget *widget,
-			     struct snd_kcontrol *ctrl, int event)
-{
-	struct qi_lb60 *qi_lb60 = snd_soc_card_get_drvdata(widget->dapm->card);
-	int on = !SND_SOC_DAPM_EVENT_OFF(event);
-
-	gpiod_set_value_cansleep(qi_lb60->snd_gpio, on);
-	gpiod_set_value_cansleep(qi_lb60->amp_gpio, on);
-
-	return 0;
-}
-
-static const struct snd_soc_dapm_widget qi_lb60_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", qi_lb60_spk_event),
-	SND_SOC_DAPM_MIC("Mic", NULL),
-};
-
-static const struct snd_soc_dapm_route qi_lb60_routes[] = {
-	{"Mic", NULL, "MIC"},
-	{"Speaker", NULL, "LOUT"},
-	{"Speaker", NULL, "ROUT"},
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_CPU("jz4740-i2s")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("jz4740-codec", "jz4740-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("jz4740-i2s")));
-
-static struct snd_soc_dai_link qi_lb60_dai = {
-	.name = "jz4740",
-	.stream_name = "jz4740",
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_CBM_CFM,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static struct snd_soc_card qi_lb60_card = {
-	.name = "QI LB60",
-	.owner = THIS_MODULE,
-	.dai_link = &qi_lb60_dai,
-	.num_links = 1,
-
-	.dapm_widgets = qi_lb60_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(qi_lb60_widgets),
-	.dapm_routes = qi_lb60_routes,
-	.num_dapm_routes = ARRAY_SIZE(qi_lb60_routes),
-	.fully_routed = true,
-};
-
-static int qi_lb60_probe(struct platform_device *pdev)
-{
-	struct qi_lb60 *qi_lb60;
-	struct snd_soc_card *card = &qi_lb60_card;
-
-	qi_lb60 = devm_kzalloc(&pdev->dev, sizeof(*qi_lb60), GFP_KERNEL);
-	if (!qi_lb60)
-		return -ENOMEM;
-
-	qi_lb60->snd_gpio = devm_gpiod_get(&pdev->dev, "snd", GPIOD_OUT_LOW);
-	if (IS_ERR(qi_lb60->snd_gpio))
-		return PTR_ERR(qi_lb60->snd_gpio);
-
-	qi_lb60->amp_gpio = devm_gpiod_get(&pdev->dev, "amp", GPIOD_OUT_LOW);
-	if (IS_ERR(qi_lb60->amp_gpio))
-		return PTR_ERR(qi_lb60->amp_gpio);
-
-	card->dev = &pdev->dev;
-
-	snd_soc_card_set_drvdata(card, qi_lb60);
-
-	return devm_snd_soc_register_card(&pdev->dev, card);
-}
-
-static struct platform_driver qi_lb60_driver = {
-	.driver		= {
-		.name	= "qi-lb60-audio",
-	},
-	.probe		= qi_lb60_probe,
-};
-
-module_platform_driver(qi_lb60_driver);
-
-MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
-MODULE_DESCRIPTION("ALSA SoC QI LB60 Audio support");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:qi-lb60-audio");
-- 
2.21.0.593.g511ec345e18

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
