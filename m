Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F843ECA1B
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 17:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A6321731;
	Sun, 15 Aug 2021 17:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A6321731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629042874;
	bh=IWgMxzk2518p9gpkahXiL48NRMVwhRrKwxcIosw5Hic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bLVHg7dRnZG3fESguvxVnd+Pcy5kvZ5LUxUIhfL7Y7FxXfse3fFlKImJFIeektT8c
	 FlYZMECti/YM9sJukxSKm9l5rizEITVpOfEVOlp0bX1jmuwuc7RgvJ2N4C+PZW7h1U
	 YCpsrNB3cz5rhnZNEh0wKwgpAGuwuxIS1W9lgqso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB514F804ED;
	Sun, 15 Aug 2021 17:51:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 440E3F8026D; Sun, 15 Aug 2021 17:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4EBAF804B0
 for <alsa-devel@alsa-project.org>; Sun, 15 Aug 2021 17:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4EBAF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="O1LVDELM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629042594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKX7Q5QcVcnj11xmWm7HZAb9xqt7Er0kYF4M77xnLw0=;
 b=O1LVDELMBsar+4DLhQHZF/Y5YefcF0TItz/1Hx5KyuLPzUiUcR4mi9UJ/mjuG3utlnow1F
 LbCLCULd24CIsWYSOP4QUL9WvjFGeR3ZqkVp5lsxlUBVFRQ6bhpis1goGKE8GPfE491Qrd
 ALv9kjsLY+O+cBD4Dr+ZKTuQUSXk2Fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-YvGgiCfoNI6iEQLt_eTc1Q-1; Sun, 15 Aug 2021 11:49:50 -0400
X-MC-Unique: YvGgiCfoNI6iEQLt_eTc1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731EB1082921;
 Sun, 15 Aug 2021 15:49:49 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4F1660871;
 Sun, 15 Aug 2021 15:49:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add support for HP Elite Pad
 1000G2 jack-detect
Date: Sun, 15 Aug 2021 17:49:35 +0200
Message-Id: <20210815154935.101178-6-hdegoede@redhat.com>
In-Reply-To: <20210815154935.101178-1-hdegoede@redhat.com>
References: <20210815154935.101178-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

The HP Elitepad 1000 G2 tablet has 2 headset jacks:

1. on the dock which uses the output of the codecs built-in HP-amp +
the standard IN2 input which is always used with the headset-jack.

2. on the tablet itself, this uses the line-out of the codec + an external
HP-amp, which gets enabled by the ALC5642 codec's GPIO1 pin; and IN1 for
the headset-mic.

The codec's GPIO1 is also its only IRQ output pin, so this means that
the codec's IRQ cannot be used on this tablet. Instead the jack-detect
is connected directly to GPIOs on the main SoC. The dock has a helper
chip which also detects if a headset-mic is present or not, so there
are 2 GPIOs for the jack-detect status of the dock. The tablet jack
uses a single GPIO which indicates if a jack is present or not.

Differentiating between between headphones vs a headset on the tablet jack
is done by using the usual mic-bias over-current-detection mechanism.

Add support for this unique setup, this support gets enabled on this
tablet through a new BYT_RT5640_JD_HP_ELITEP_1000G2 quirk.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213415
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 146 +++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index fecccff76caf..369642c07a5d 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -18,6 +18,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/input.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
@@ -76,6 +78,7 @@ enum {
 #define BYT_RT5640_LINEOUT		BIT(25)
 #define BYT_RT5640_LINEOUT_AS_HP2	BIT(26)
 #define BYT_RT5640_HSMIC2_ON_IN1	BIT(27)
+#define BYT_RT5640_JD_HP_ELITEP_1000G2	BIT(28)
 
 #define BYTCR_INPUT_DEFAULTS				\
 	(BYT_RT5640_IN3_MAP |				\
@@ -89,6 +92,8 @@ enum {
 
 struct byt_rt5640_private {
 	struct snd_soc_jack jack;
+	struct snd_soc_jack jack2;
+	struct gpio_desc *hsmic_detect;
 	struct clk *mclk;
 	struct device *codec_dev;
 };
@@ -141,6 +146,8 @@ static void log_quirks(struct device *dev)
 	}
 	if (byt_rt5640_quirk & BYT_RT5640_JD_NOT_INV)
 		dev_info(dev, "quirk JD_NOT_INV enabled\n");
+	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2)
+		dev_info(dev, "quirk JD_HP_ELITEPAD_1000G2 enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER)
 		dev_info(dev, "quirk MONO_SPEAKER enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS)
@@ -438,6 +445,76 @@ static struct snd_soc_jack_pin rt5640_pins[] = {
 	},
 };
 
+static struct snd_soc_jack_pin rt5640_pins2[] = {
+	{
+		/* The 2nd headset jack uses lineout with an external HP-amp */
+		.pin	= "Line Out",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		/* BYT_RT5640_HSMIC2_ON_IN1 uses byt_rt5640_intmic_in1_map */
+		.pin	= "Internal Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+};
+
+struct snd_soc_jack_gpio rt5640_jack_gpio = {
+	.name = "hp-detect",
+	.report = SND_JACK_HEADSET,
+	.invert = true,
+	.debounce_time = 200,
+};
+
+struct snd_soc_jack_gpio rt5640_jack2_gpio = {
+	.name = "hp2-detect",
+	.report = SND_JACK_HEADSET,
+	.invert = true,
+	.debounce_time = 200,
+};
+
+static const struct acpi_gpio_params acpi_gpio0 = { 0, 0, false };
+static const struct acpi_gpio_params acpi_gpio1 = { 1, 0, false };
+static const struct acpi_gpio_params acpi_gpio2 = { 2, 0, false };
+
+static const struct acpi_gpio_mapping byt_rt5640_hp_elitepad_1000g2_gpios[] = {
+	{ "hp-detect-gpios", &acpi_gpio0, 1, },
+	{ "headset-mic-detect-gpios", &acpi_gpio1, 1, },
+	{ "hp2-detect-gpios", &acpi_gpio2, 1, },
+	{ },
+};
+
+int byt_rt5640_hp_elitepad_1000g2_jack1_check(void *data)
+{
+	struct byt_rt5640_private *priv = data;
+	int jack_status, mic_status;
+
+	jack_status = gpiod_get_value_cansleep(rt5640_jack_gpio.desc);
+	if (jack_status)
+		return 0;
+
+	mic_status = gpiod_get_value_cansleep(priv->hsmic_detect);
+	if (mic_status)
+		return SND_JACK_HEADPHONE;
+	else
+		return SND_JACK_HEADSET;
+}
+
+int byt_rt5640_hp_elitepad_1000g2_jack2_check(void *data)
+{
+	struct snd_soc_component *component = data;
+	int jack_status, report;
+
+	jack_status = gpiod_get_value_cansleep(rt5640_jack2_gpio.desc);
+	if (jack_status)
+		return 0;
+
+	rt5640_enable_micbias1_for_ovcd(component);
+	report = rt5640_detect_headset(component, rt5640_jack2_gpio.desc);
+	rt5640_disable_micbias1_for_ovcd(component);
+
+	return report;
+}
+
 static int byt_rt5640_aif1_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
@@ -649,7 +726,8 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_MCLK_EN |
 					BYT_RT5640_LINEOUT |
 					BYT_RT5640_LINEOUT_AS_HP2 |
-					BYT_RT5640_HSMIC2_ON_IN1),
+					BYT_RT5640_HSMIC2_ON_IN1 |
+					BYT_RT5640_JD_HP_ELITEP_1000G2),
 	},
 	{	/* HP Pavilion x2 10-k0XX, 10-n0XX */
 		.matches = {
@@ -1172,9 +1250,60 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 		snd_soc_component_set_jack(component, &priv->jack, NULL);
 	}
 
+	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
+		ret = snd_soc_card_jack_new(card, "Headset",
+					    SND_JACK_HEADSET,
+					    &priv->jack, rt5640_pins,
+					    ARRAY_SIZE(rt5640_pins));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_card_jack_new(card, "Headset 2",
+					    SND_JACK_HEADSET,
+					    &priv->jack2, rt5640_pins2,
+					    ARRAY_SIZE(rt5640_pins2));
+		if (ret)
+			return ret;
+
+		acpi_dev_add_driver_gpios(ACPI_COMPANION(priv->codec_dev),
+					  byt_rt5640_hp_elitepad_1000g2_gpios);
+
+		rt5640_jack_gpio.data = priv;
+		rt5640_jack_gpio.gpiod_dev = priv->codec_dev;
+		rt5640_jack_gpio.jack_status_check = byt_rt5640_hp_elitepad_1000g2_jack1_check;
+		ret = snd_soc_jack_add_gpios(&priv->jack, 1, &rt5640_jack_gpio);
+		if (ret) {
+			acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
+			return ret;
+		}
+
+		rt5640_set_ovcd_params(component);
+		rt5640_jack2_gpio.data = component;
+		rt5640_jack2_gpio.gpiod_dev = priv->codec_dev;
+		rt5640_jack2_gpio.jack_status_check = byt_rt5640_hp_elitepad_1000g2_jack2_check;
+		ret = snd_soc_jack_add_gpios(&priv->jack2, 1, &rt5640_jack2_gpio);
+		if (ret) {
+			snd_soc_jack_free_gpios(&priv->jack, 1, &rt5640_jack_gpio);
+			acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
+static void byt_rt5640_exit(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_card *card = runtime->card;
+	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
+
+	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
+		snd_soc_jack_free_gpios(&priv->jack2, 1, &rt5640_jack2_gpio);
+		snd_soc_jack_free_gpios(&priv->jack, 1, &rt5640_jack_gpio);
+		acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
+	}
+}
+
 static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_pcm_hw_params *params)
 {
@@ -1287,6 +1416,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = byt_rt5640_init,
+		.exit = byt_rt5640_exit,
 		.ops = &byt_rt5640_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
@@ -1490,6 +1620,20 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	priv->codec_dev = get_device(codec_dev);
 
+	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
+		acpi_dev_add_driver_gpios(ACPI_COMPANION(priv->codec_dev),
+					  byt_rt5640_hp_elitepad_1000g2_gpios);
+		priv->hsmic_detect = devm_fwnode_gpiod_get(&pdev->dev, codec_dev->fwnode,
+							   "headset-mic-detect", GPIOD_IN,
+							   "headset-mic-detect");
+		acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
+		if (IS_ERR(priv->hsmic_detect)) {
+			ret_val = PTR_ERR(priv->hsmic_detect);
+			dev_err_probe(&pdev->dev, ret_val, "getting hsmic-detect GPIO\n");
+			goto err_device;
+		}
+	}
+
 	/* Must be called before register_card, also see declaration comment. */
 	ret_val = byt_rt5640_add_codec_device_props(codec_dev, priv);
 	if (ret_val)
-- 
2.31.1

