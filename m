Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76A4484540
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 16:52:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 221DD178E;
	Tue,  4 Jan 2022 16:51:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 221DD178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641311556;
	bh=MjkLHo7BeK0GjT4S6Ovg99SzxJ/TFjU22DlBPZbb4nI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIlLNUKhujhkupBNwSuFaZUckV28QkKduR8LJ7N8PNMurwID22lBou01yziAk+k7k
	 1sjEddrIueKVRVcSHJbcuMTxql3DYXr2G0gOYgQDSF+MKSb/qG3P+GIHbW/SpJvbTM
	 GaKNS6qDr94YVtm+WRWy5jjWgzVsb+cAmA1WxBuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BBBCF8032B;
	Tue,  4 Jan 2022 16:51:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CB6EF80089; Tue,  4 Jan 2022 16:51:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A10DF80089
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 16:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A10DF80089
ARC-Seal: i=1; a=rsa-sha256; t=1641311454; cv=none; d=zohomail.eu; s=zohoarc; 
 b=f0PUKeuY93mdp1Wj0wEuiKHwkyE4f7fUFWz5ktx7IQTkdREWqKeGk/T1NCQDx7KLDa/au2fpaKx/POXjkWaGd8QsYes+JzEVkj/EjZ05sX7jZJzjtkV6G9IDrdfT8unlD/BCX5IiK0iOO9PM0kfnjRuvqVkllk3m6lQqD2lfez0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1641311454;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=TXcnacDqWnzruMYn0SfuTu8i7ckqUEsZmvjaT1qUdf4=; 
 b=I7iNkZkpqfVdLaAqNSAdr7qj+TB47CEYTlWf5En7VIW+W2RKsslbiZBsY38YNqk9RIP4OQ2wL4WIrLloxbFN77/beh6GILKRq0/U0UpxlI50e1p5TryFuj7pcYrfQmIHPqFRrG5GfOHXgieGCV3CCA8zBUz2N2benr0lgZ34C/M=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=philipp@uvos.xyz;
 dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-89.unity-media.net [37.201.192.89])
 by mx.zoho.eu with SMTPS id 1641311451526372.0692013479619;
 Tue, 4 Jan 2022 16:50:51 +0100 (CET)
Date: Tue, 4 Jan 2022 16:50:50 +0100
From: Carl Philipp Klemm <philipp@uvos.xyz>
To: inux-omap@vger.kernel.org
Subject: Re: [RFC PATCH 3/3 V2] ASoC: cpcap: add headphone jack plug
 detection support
Message-Id: <20220104165050.76697908d350e1433d934d61@uvos.xyz>
In-Reply-To: <20211228191518.bb4fafff9439d42cf542375a@uvos.xyz>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
 <20211228191104.631d126f13ac0bb09e91ca13@uvos.xyz>
 <20211228191518.bb4fafff9439d42cf542375a@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Cc: tony@atomide.com, alsa-devel@alsa-project.org, merlijn@wizzup.org,
 kuninori.morimoto.gx@renesas.com, sre@kernel.org
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

Implements an interrupt handler that fires when a headphone
is inserted. A jack must be provided to the codec via
snd_soc_component_driver .set_jack

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 sound/soc/codecs/cpcap.c | 104 +++++++++++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 3c2bc98031b5..ed418ac75eca 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -15,6 +15,7 @@
 #include <sound/core.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
+#include <sound/jack.h>
 
 /* Register 512 CPCAP_REG_VAUDIOC --- Audio Regulator and Bias Voltage */
 #define CPCAP_BIT_AUDIO_LOW_PWR           6
@@ -252,8 +253,14 @@ enum cpcap_dai {
 };
 
 struct cpcap_audio {
+	struct device *dev;
 	struct snd_soc_component *component;
 	struct regmap *regmap;
+	struct snd_soc_jack *hp_jack;
+
+	struct delayed_work jack_detect_work;
+
+	int hp_irq;
 
 	u16 vendor;
 
@@ -603,6 +610,21 @@ static int cpcap_input_left_mux_put_enum(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static struct snd_soc_jack_pin headset_jack_pins[] = {
+	{
+		.pin = "Headset Right Playback Route",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Left Playback Route",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headphones",
+		.mask = SND_JACK_HEADPHONE,
+	}
+};
+
 static const struct snd_kcontrol_new cpcap_input_left_mux =
 	SOC_DAPM_ENUM_EXT("Input Left", cpcap_input_left_mux_enum,
 			  cpcap_input_left_mux_get_enum,
@@ -1561,8 +1583,6 @@ static int cpcap_dai_mux(struct cpcap_audio *cpcap, bool swap_dai_configuration)
 	u16 voice_mask = BIT(CPCAP_BIT_DIG_AUD_IN);
 	int err;
 
-
-
 	if (!swap_dai_configuration) {
 		/* Codec on DAI0, HiFi on DAI1 */
 		voice_val = 0;
@@ -1586,6 +1606,44 @@ static int cpcap_dai_mux(struct cpcap_audio *cpcap, bool swap_dai_configuration)
 	return 0;
 }
 
+static irqreturn_t cpcap_hp_irq_thread(int irq, void *arg)
+{
+	struct cpcap_audio *cpcap = arg;
+	int val = -1;
+	bool plugged;
+
+	regmap_read(cpcap->regmap, CPCAP_REG_INTS1, &val);
+	plugged = val & (1<<9);
+
+	if (!cpcap->component) {
+		dev_warn(cpcap->dev, "%s called before component is ready.", __func__);
+		return IRQ_HANDLED;
+	}
+
+	if (!cpcap->hp_jack) {
+		dev_warn(cpcap->dev, "%s called before jack is ready.", __func__);
+		return IRQ_HANDLED;
+	}
+
+	snd_soc_jack_report(cpcap->hp_jack, plugged ? 0 : SND_JACK_HEADPHONE, SND_JACK_HEADPHONE);
+
+	return IRQ_HANDLED;
+}
+
+static int cpcap_set_jack_detect(struct snd_soc_component *component,
+	struct snd_soc_jack *hp_jack, void *data)
+{
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
+
+	if (!cpcap->hp_jack) {
+		dev_info(cpcap->dev, "registering jack");
+		cpcap->hp_jack = hp_jack;
+		snd_soc_jack_add_pins(hp_jack, ARRAY_SIZE(headset_jack_pins), headset_jack_pins);
+	}
+
+	return 0;
+}
+
 static int cpcap_audio_reset(struct snd_soc_component *component,
 			     bool swap_dai_configuration)
 {
@@ -1628,13 +1686,9 @@ static int cpcap_audio_reset(struct snd_soc_component *component,
 
 static int cpcap_soc_probe(struct snd_soc_component *component)
 {
-	struct cpcap_audio *cpcap;
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
 	int err;
 
-	cpcap = devm_kzalloc(component->dev, sizeof(*cpcap), GFP_KERNEL);
-	if (!cpcap)
-		return -ENOMEM;
-	snd_soc_component_set_drvdata(component, cpcap);
 	cpcap->component = component;
 
 	cpcap->regmap = dev_get_regmap(component->dev->parent, NULL);
@@ -1657,6 +1711,7 @@ static struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.num_dapm_widgets	= ARRAY_SIZE(cpcap_dapm_widgets),
 	.dapm_routes		= intercon,
 	.num_dapm_routes	= ARRAY_SIZE(intercon),
+	.set_jack = cpcap_set_jack_detect,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
@@ -1665,13 +1720,42 @@ static struct snd_soc_component_driver soc_codec_dev_cpcap = {
 
 static int cpcap_codec_probe(struct platform_device *pdev)
 {
-	struct device_node *codec_node =
-		of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
+	struct cpcap_audio *cpcap;
+	struct device_node *codec_node;
+	int ret;
 
+	codec_node = of_get_child_by_name(pdev->dev.parent->of_node, "audio-codec");
 	pdev->dev.of_node = codec_node;
 
-	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cpcap,
+	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
+	if (!cpcap)
+		return -ENOMEM;
+	dev_set_drvdata(&pdev->dev, cpcap);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cpcap,
 				      cpcap_dai, ARRAY_SIZE(cpcap_dai));
+	if (ret < 0)
+		return ret;
+
+	cpcap->hp_irq = platform_get_irq_byname(pdev, "hpplugged");
+	if (cpcap->hp_irq < 0)
+		return -ENODEV;
+
+	cpcap->dev = &pdev->dev;
+
+	ret = devm_request_threaded_irq(&pdev->dev, cpcap->hp_irq, NULL,
+					  cpcap_hp_irq_thread,
+					  IRQF_TRIGGER_RISING |
+					  IRQF_TRIGGER_FALLING |
+					  IRQF_ONESHOT,
+					  "cpcap-codec-headphone", cpcap);
+	if (ret) {
+		dev_err(&pdev->dev, "could not get irq: %i\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 static struct platform_driver cpcap_codec_driver = {
-- 
2.34.1
