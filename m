Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 973777D6EE3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 16:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE0E1A4D;
	Wed, 25 Oct 2023 16:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE0E1A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698244798;
	bh=+fvz9wn+ThGlXd6D3D3+Ze5DTgk9mD9SUxhCBFe0nUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Weo/T+85mUz+VWmDm1B41vsy7DG23blLLitgiA72XgEBhpdcbHTwqW+fuwTKFCJtE
	 jnhgj1r/Q/J2OpXW9uKuqvNrNueulyQ+nKKY76j/KWr5eFp5wBdGqxIU0r68Xe0+N0
	 2bABX2lNd+lblLtPvOUo7gu9ZAS83IKXB6Q4/Xp4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E54CF80570; Wed, 25 Oct 2023 16:38:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B6BEF8055C;
	Wed, 25 Oct 2023 16:38:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 568A6F8055B; Wed, 25 Oct 2023 16:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD480F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 16:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD480F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Z5/tVuMG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698244537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jd6VsEQDBmrMSK1/pJj0cTtfdKoEeyUS/E2EUsHJ/uI=;
	b=Z5/tVuMG84fPC+mMroYakbG5iRRR73QKF6uOylNW+KEE4bWM4GLCZZmexS4eUrBJsvNOOp
	WAeI1GF3lHQHxQUXHtJ9BUvvbVq7R+NZJUCNmLtl6SBOxsbw6eVVJWQSOvaRZP06m7o1Jo
	0Qp87Ewut0ga4L4knxlttDF9j5h8oZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-rpceUfBZMoCw6DodoiTAKw-1; Wed, 25 Oct 2023 10:35:24 -0400
X-MC-Unique: rpceUfBZMoCw6DodoiTAKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B82EA101AA68;
	Wed, 25 Oct 2023 14:35:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAFA62026D4C;
	Wed, 25 Oct 2023 14:35:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_SSP2 quirk
Date: Wed, 25 Oct 2023 16:35:10 +0200
Message-ID: <20231025143513.291753-2-hdegoede@redhat.com>
In-Reply-To: <20231025143513.291753-1-hdegoede@redhat.com>
References: <20231025143513.291753-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: S4DAURVVP4HQHF4AEJDISNEELYIBP5ED
X-Message-ID-Hash: S4DAURVVP4HQHF4AEJDISNEELYIBP5ED
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4DAURVVP4HQHF4AEJDISNEELYIBP5ED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the standard intel board file quirk mechanism also used in many
other intel board drivers and add a BYT_WM5102_SSP2 quirk setting
for designs using SSP2 instead of SSP0.

And enable the new BYT_WM5102_SSP2 quirk on Cherry Trail devices
since those always use SSP2.

The logging of the quirks uses dev_info_once() because probe() may run
multiple times because of snd_soc_register_card() returning -EPROBE_DEFER.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 93 +++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index fd7d5fdfd3fd..932a5523b682 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
@@ -37,6 +38,21 @@ struct byt_wm5102_private {
 	struct gpio_desc *spkvdd_en_gpio;
 };
 
+/* Bits 0-15 are reserved for things like an input-map */
+#define BYT_WM5102_SSP2			BIT(16)
+
+static unsigned long quirk;
+
+static int quirk_override = -1;
+module_param_named(quirk, quirk_override, int, 0444);
+MODULE_PARM_DESC(quirk, "Board-specific quirk override");
+
+static void log_quirks(struct device *dev)
+{
+	if (quirk & BYT_WM5102_SSP2)
+		dev_info_once(dev, "quirk SSP2 enabled");
+}
+
 static int byt_wm5102_spkvdd_power_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -166,14 +182,24 @@ static const struct snd_soc_dapm_route byt_wm5102_audio_map[] = {
 	{"Headset Mic", NULL, "MICBIAS1"},
 	{"Headset Mic", NULL, "MICBIAS2"},
 	{"IN1L", NULL, "Headset Mic"},
+};
 
+static const struct snd_soc_dapm_route bytcr_wm5102_ssp0_map[] = {
 	{"AIF1 Playback", NULL, "ssp0 Tx"},
 	{"ssp0 Tx", NULL, "modem_out"},
-
 	{"modem_in", NULL, "ssp0 Rx"},
 	{"ssp0 Rx", NULL, "AIF1 Capture"},
 };
 
+static const struct snd_soc_dapm_route bytcr_wm5102_ssp2_map[] = {
+	{"AIF1 Playback", NULL, "ssp2 Tx"},
+	{"ssp2 Tx", NULL, "codec_out0"},
+	{"ssp2 Tx", NULL, "codec_out1"},
+	{"codec_in0", NULL, "ssp2 Rx"},
+	{"codec_in1", NULL, "ssp2 Rx"},
+	{"ssp2 Rx", NULL, "AIF1 Capture"},
+};
+
 static const struct snd_kcontrol_new byt_wm5102_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -202,7 +228,8 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_card *card = runtime->card;
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
-	int ret, jack_type;
+	const struct snd_soc_dapm_route *custom_map = NULL;
+	int ret, jack_type, num_routes = 0;
 
 	card->dapm.idle_bias_off = true;
 
@@ -213,6 +240,17 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
+	if (quirk & BYT_WM5102_SSP2) {
+		custom_map = bytcr_wm5102_ssp2_map;
+		num_routes = ARRAY_SIZE(bytcr_wm5102_ssp2_map);
+	} else {
+		custom_map = bytcr_wm5102_ssp0_map;
+		num_routes = ARRAY_SIZE(bytcr_wm5102_ssp0_map);
+	}
+	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	if (ret)
+		return ret;
+
 	/*
 	 * The firmware might enable the clock at boot (this information
 	 * may or may not be reflected in the enable clock register).
@@ -253,7 +291,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 						      SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 							  SNDRV_PCM_HW_PARAM_CHANNELS);
-	int ret;
+	int ret, bits;
 
 	/* The DSP will convert the FE rate to 48k, stereo */
 	rate->min = 48000;
@@ -261,8 +299,15 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 
-	/* set SSP0 to 16-bit */
-	params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
+	if (quirk & BYT_WM5102_SSP2) {
+		/* set SSP2 to 24-bit */
+		params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+		bits = 24;
+	} else {
+		/* set SSP0 to 16-bit */
+		params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
+		bits = 16;
+	}
 
 	/*
 	 * Default mode for SSP configuration is TDM 4 slot, override config
@@ -278,7 +323,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret) {
 		dev_err(rtd->dev, "Error setting I2S config: %d\n", ret);
 		return ret;
@@ -345,12 +390,9 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		/* back ends */
 	{
 		/*
-		 * This must be named SSP2-Codec even though this machine driver
-		 * always uses SSP0. Most machine drivers support both and dynamically
-		 * update the dailink to point to SSP0 or SSP2, while keeping the name
-		 * as "SSP2-Codec". The SOF tplg files hardcode the "SSP2-Codec" even
-		 * in the byt-foo-ssp0.tplg versions because the other machine-drivers
-		 * use "SSP2-Codec" even when SSP0 is used.
+		 * This dailink is updated dynamically to point to SSP0 or SSP2.
+		 * Yet its name is always kept as "SSP2-Codec" because the SOF
+		 * tplg files hardcode "SSP2-Codec" even in byt-foo-ssp0.tplg.
 		 */
 		.name = "SSP2-Codec",
 		.id = 0,
@@ -393,8 +435,9 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
+	int dai_index = 0;
 	bool sof_parent;
-	int ret;
+	int i, ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -441,6 +484,26 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "getting spkvdd-GPIO\n");
 	}
 
+	if (soc_intel_is_cht()) {
+		/* On CHT default to SSP2 */
+		quirk = BYT_WM5102_SSP2;
+	}
+	if (quirk_override != -1) {
+		dev_info_once(dev, "Overriding quirk 0x%lx => 0x%x\n",
+			      quirk, quirk_override);
+		quirk = quirk_override;
+	}
+	log_quirks(dev);
+
+	/* find index of codec dai */
+	for (i = 0; i < ARRAY_SIZE(byt_wm5102_dais); i++) {
+		if (!strcmp(byt_wm5102_dais[i].codecs->name,
+			    "wm5102-codec")) {
+			dai_index = i;
+			break;
+		}
+	}
+
 	/* override platform name, if required */
 	byt_wm5102_card.dev = dev;
 	platform_name = mach->mach_params.platform;
@@ -448,6 +511,10 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_put_gpio;
 
+	/* override SSP port, if required */
+	if (quirk & BYT_WM5102_SSP2)
+		byt_wm5102_dais[dai_index].cpus->dai_name = "ssp2-port";
+
 	/* set card and driver name and pm-ops */
 	sof_parent = snd_soc_acpi_sof_parent(dev);
 	if (sof_parent) {
-- 
2.41.0

