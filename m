Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF5A1A3B0B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:03:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0481696;
	Thu,  9 Apr 2020 22:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0481696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462636;
	bh=9OlZxfe8+OMEdL2eNJCyWNdbCXCU82MkmbsvZQb8UU0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXaNYYgWGckeHeZHEc+POdB8HgJZwNV7yQGvQBK0bAZwSK0xMAxo9JMOGE7M9YfFr
	 7mV2B4JzP8ctxO6+QMmJIvG8/nojSY5WRBQqmC+PcHVDESgUYaw2DjYbtudNM04Wt/
	 J3NwzqD7H7Qk2HkOA2LwxHeWO9A0+RMRBmT4p1vM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D3ABF802BD;
	Thu,  9 Apr 2020 21:59:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E01AF8028A; Thu,  9 Apr 2020 21:59:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE77EF801F9
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE77EF801F9
IronPort-SDR: OC9YB8qGfwpWVC1abKVGbgNQi0obC4ybrENpkGNDvzicgHwRCdPpf27HZUgqeuoXEQVfrT9UAd
 IOK3Fxwyl0OA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:05 -0700
IronPort-SDR: Xm4qqKX+D50Bu8qrr8/HRy9uXDhGIjH2KH56eGzv88z6EOX7KEXPqJSN6ShC5Eqj8Pmv/EKVGC
 nCNOLyANLT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745310"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 03/16] ASoC: Intel: sof-pcm512x: use gpiod for LED
Date: Thu,  9 Apr 2020 14:58:28 -0500
Message-Id: <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Matthias Reichl <hias@horus.com>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Remove direct regmap access, use gpios exposed by PCM512x codec
Keep the codec_init function, this will be used in following patches

The gpios handling is done with an explicit lookup table. We cannot
use ACPI-based mappings since we don't have an ACPI device for the
machine driver, and the gpiochip is created during the probe of the
PCM512x driver.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_pcm512x.c | 45 ++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index fb7811899999..dcd769b352fa 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -10,6 +10,8 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/module.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 #include <sound/core.h>
@@ -43,6 +45,7 @@ struct sof_hdmi_pcm {
 struct sof_card_private {
 	struct list_head hdmi_pcm_list;
 	bool idisp_codec;
+	struct gpio_desc *gpio_4;
 };
 
 static int sof_pcm512x_quirk_cb(const struct dmi_system_id *id)
@@ -84,23 +87,16 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
-
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_EN, 0x08, 0x08);
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_OUTPUT_4, 0x0f, 0x02);
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
-				      0x08, 0x08);
-
 	return 0;
 }
 
 static int aif1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
-				      0x08, 0x08);
+	/* Turn LED on */
+	gpiod_set_value(ctx->gpio_4, 1);
 
 	return 0;
 }
@@ -108,10 +104,10 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 static void aif1_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
-				      0x08, 0x00);
+	/* Turn LED off */
+	gpiod_set_value(ctx->gpio_4, 0);
 }
 
 static const struct snd_soc_ops sof_pcm512x_ops = {
@@ -354,6 +350,14 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	return NULL;
 }
 
+static struct gpiod_lookup_table pcm512x_gpios_table = {
+	/* .dev_id set during probe */
+	.table = {
+		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
@@ -413,6 +417,21 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(&sof_audio_card_pcm512x, ctx);
 
+	/*
+	 * Enable GPIO4 for LED
+	 */
+	pcm512x_gpios_table.dev_id = dev_name(&pdev->dev);
+	gpiod_add_lookup_table(&pcm512x_gpios_table);
+
+	ctx->gpio_4 = devm_gpiod_get(&pdev->dev, "PCM512x-GPIO4",
+				     GPIOD_OUT_LOW);
+
+	if (IS_ERR(ctx->gpio_4)) {
+		dev_err(&pdev->dev, "gpio4 not found\n");
+		ret = PTR_ERR(ctx->gpio_4);
+		return ret;
+	}
+
 	return devm_snd_soc_register_card(&pdev->dev,
 					  &sof_audio_card_pcm512x);
 }
-- 
2.20.1

