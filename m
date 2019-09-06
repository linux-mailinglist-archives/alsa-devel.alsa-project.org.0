Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96DAC104
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E025886;
	Fri,  6 Sep 2019 21:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E025886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799691;
	bh=sXnRaKCT4A0yLk0BX/DMBM26nXEZby3rotW0EFGtNN0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SeLKwWJuW/ZhT6dk5y00JW4v8Lq8UIgJkvGhQKnwJyogaiU1TbOyAhAaWal58E6kg
	 yDwW8t2/VJwXBUelZUnOJboxZpKI3YyH6vRTFF7eNHJiNjrgRmfQNaxdUZixz7zGU/
	 ULxwcX2QTRAFNFysGrALGlwjJphjt5dyIK58smlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 556B6F806E7;
	Fri,  6 Sep 2019 21:48:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE021F80676; Fri,  6 Sep 2019 21:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65695F8065D
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65695F8065D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hWeb0IiV"
Received: by mail-pg1-x544.google.com with SMTP id p3so4064233pgb.9
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPzlrVlKug7CDGqubv+4tYMRbelSxU1XKXtPDFFoeTM=;
 b=hWeb0IiV7GSTMHrKPl/jVE2m49foAUp2sKFoPZ+YXUbd/I4TuuwSioQl5XsUYKITzr
 OVJL1FtBGbuIqujfEfRYywRsXfpDRCG1YUg7OQc9MdHxU9A6P9Skwoa4oh246AjZ9zo+
 /jmzjsUtJ6EOIH2aG4pRQAia1a/UyOtk3Y3PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPzlrVlKug7CDGqubv+4tYMRbelSxU1XKXtPDFFoeTM=;
 b=QQTd8Eo6kvtYyASIG6M0UoPhIghe28ZbhA8o2TgGkdg/OfrJ/E4gauLtMZn5dvnhWK
 ClCnugKO58uiCLzRTdO1GpYqdakG/3dbUUDKXDp75GPqycJBypWxfN8ITUE4xSQ/7xIL
 GrxXjI2f+KADFSZIXzSKUigm+iwKqjTFxylMEaoF5NNjqR9z5n3++Sr4fdGgguErjQ9h
 1j+9rrJ8fir7q5QoPQU3YYfO3k+2k0Y3UhXniMVNpSjY2ag9vjzuU7CCujPOJ7rkUQXU
 18Uoyf8PumFyjqGYuGj4nNxfytVi7nO8cobX0v6ySnOsgyrrFctxYskPPP5kriRQfPHU
 8PYQ==
X-Gm-Message-State: APjAAAX69DasqDavIeqcflJ69PtzrjXRvEI8YQYaD2w/QZ5OjT67e0J/
 Zdev6CUkoChTsGI8UPcWWk2C48hy5Q==
X-Google-Smtp-Source: APXvYqw6j6yA+VqPPLXMIS4xGhARu2V2ahow8/ySVzgmT/Nf7EPOAdvNuew3AprcY+OAhQQwxPLz3A==
X-Received: by 2002:a63:3006:: with SMTP id w6mr9534659pgw.440.1567799285094; 
 Fri, 06 Sep 2019 12:48:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id i14sm7659370pfo.50.2019.09.06.12.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:48:04 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:30 -0700
Message-Id: <20190906194636.217881-9-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 08/15] ASoC: rt5677: Use delayed work for DSP
	firmware load
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

From: Ben Zhang <benzh@chromium.org>

Without this patch, the DSP firmware is loaded/unloaded synchronously
in snd_pcm_ops.open/close context. When a hotword stream is opened,
snd_pcm_ops.open/close is called multiple times. Loading firmware
in the open/close context takes too long and makes audio playback
choppy.

This patch moves the firmware load to a delayed work.
snd_pcm_ops.open/close sets a flag to request DSP VAD enable/disable,
and schedules the delayed work.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 57 ++++++++++++++++++++++-----------------
 sound/soc/codecs/rt5677.h |  3 ++-
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 8f5e4882120c..f01fc9d44774 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -692,10 +692,8 @@ static int rt5677_dsp_mode_i2c_read(
 	return ret;
 }
 
-static void rt5677_set_dsp_mode(struct snd_soc_component *component, bool on)
+static void rt5677_set_dsp_mode(struct rt5677_priv *rt5677, bool on)
 {
-	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
-
 	if (on) {
 		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
 			RT5677_PWR_DSP, RT5677_PWR_DSP);
@@ -707,11 +705,8 @@ static void rt5677_set_dsp_mode(struct snd_soc_component *component, bool on)
 	}
 }
 
-static unsigned int rt5677_set_vad_source(
-	struct snd_soc_component *component)
+static unsigned int rt5677_set_vad_source(struct rt5677_priv *rt5677)
 {
-	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
-
 	/* Mono ADC Capture Switch = unmute (default) */
 	regmap_update_bits(rt5677->regmap, RT5677_MONO_ADC_DIG_VOL,
 			RT5677_L_MUTE, 0);
@@ -894,20 +889,19 @@ static int rt5677_parse_and_load_dsp(struct rt5677_priv *rt5677, const u8 *buf,
 	return ret;
 }
 
-static int rt5677_load_dsp_from_file(struct snd_soc_component *component)
+static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
 {
-	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 	const struct firmware *fwp;
+	struct device *dev = rt5677->component->dev;
 	int ret = 0;
 
 	/* Load dsp firmware from rt5677_elf_vad file */
-	ret = request_firmware(&fwp, "rt5677_elf_vad", component->dev);
+	ret = request_firmware(&fwp, "rt5677_elf_vad", dev);
 	if (ret) {
-		dev_err(component->dev, "Request rt5677_elf_vad failed %d\n",
-			ret);
+		dev_err(dev, "Request rt5677_elf_vad failed %d\n", ret);
 		return ret;
 	}
-	dev_info(component->dev, "Requested rt5677_elf_vad (%zu)\n", fwp->size);
+	dev_info(dev, "Requested rt5677_elf_vad (%zu)\n", fwp->size);
 
 	ret = rt5677_parse_and_load_dsp(rt5677, fwp->data, fwp->size);
 	release_firmware(fwp);
@@ -917,16 +911,27 @@ static int rt5677_load_dsp_from_file(struct snd_soc_component *component)
 static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
-	static bool activity;
-	int ret;
+	rt5677->dsp_vad_en = on;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI))
 		return -ENXIO;
 
-	rt5677->dsp_vad_en = on;
-	dev_info(component->dev, "DSP VAD: on=%d, activity=%d\n", on, activity);
+	schedule_delayed_work(&rt5677->dsp_work, 0);
+	return 0;
+}
+
+static void rt5677_dsp_work(struct work_struct *work)
+{
+	struct rt5677_priv *rt5677 =
+		container_of(work, struct rt5677_priv, dsp_work.work);
+	static bool activity;
+	bool enable = rt5677->dsp_vad_en;
+
 
-	if (on && !activity) {
+	dev_info(rt5677->component->dev, "DSP VAD: enable=%d, activity=%d\n",
+			enable, activity);
+
+	if (enable && !activity) {
 		activity = true;
 
 		/* Before a hotword is detected, GPIO1 pin is configured as IRQ
@@ -939,8 +944,8 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 		 * output if a hotword is detected.
 		 */
 
-		rt5677_set_vad_source(component);
-		rt5677_set_dsp_mode(component, true);
+		rt5677_set_vad_source(rt5677);
+		rt5677_set_dsp_mode(rt5677, true);
 
 		/* Boot the firmware from IRAM instead of SRAM0. */
 		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
@@ -950,11 +955,11 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 		rt5677_dsp_mode_i2c_write_addr(rt5677, RT5677_DSP_BOOT_VECTOR,
 			0x0009, 0x0003);
 
-		ret = rt5677_load_dsp_from_file(component);
+		rt5677_load_dsp_from_file(rt5677);
 
 		/* Set DSP CPU to Run */
 		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x1, 0x0);
-	} else if (!on && activity) {
+	} else if (!enable && activity) {
 		activity = false;
 
 		/* Don't turn off the DSP while handling irqs */
@@ -962,7 +967,8 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 		/* Set DSP CPU to Stop */
 		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
 			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
-		rt5677_set_dsp_mode(component, false);
+
+		rt5677_set_dsp_mode(rt5677, false);
 
 		/* Disable and clear VAD interrupt */
 		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
@@ -973,8 +979,6 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 
 		mutex_unlock(&rt5677->irq_lock);
 	}
-
-	return 0;
 }
 
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -6525, 75, 0);
@@ -4935,6 +4939,8 @@ static void rt5677_remove(struct snd_soc_component *component)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
+	cancel_delayed_work_sync(&rt5677->dsp_work);
+
 	regmap_write(rt5677->regmap, RT5677_RESET, 0x10ec);
 	gpiod_set_value_cansleep(rt5677->pow_ldo2, 0);
 	gpiod_set_value_cansleep(rt5677->reset_pin, 1);
@@ -5507,6 +5513,7 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 
 	rt5677->dev = &i2c->dev;
 	rt5677->set_dsp_vad = rt5677_set_dsp_vad;
+	INIT_DELAYED_WORK(&rt5677->dsp_work, rt5677_dsp_work);
 	i2c_set_clientdata(i2c, rt5677);
 
 	if (i2c->dev.of_node) {
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index ec5be7e01fd1..d18b41da1176 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1846,9 +1846,10 @@ struct rt5677_priv {
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gpio_chip;
 #endif
-	bool dsp_vad_en;
+	bool dsp_vad_en; /* DSP VAD enable/disable request */
 	bool is_dsp_mode;
 	bool is_vref_slow;
+	struct delayed_work dsp_work;
 
 	/* Interrupt handling */
 	struct irq_domain *domain;
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
