Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CE87CA18
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:41:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A2CE162D;
	Fri, 15 Mar 2024 09:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A2CE162D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492117;
	bh=CdUVWGbGMuKXyPzD6rVECYgj92cUUB8SFzZA8R3teQM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bPV3SXjd2k+7Ox1SkKOQNxEhwrFeKcXnNVLPAcfvEMIwHaDumMx7Po1n52YvVCrvW
	 8K1LWjc5xVxJ1trXI/TG5TDV55asGJ4rxLM8MfT3mesYvDZBV6z/42FzLt4oIW1VBt
	 iu2KyLJihieKHf+mjGc8ex4rA8wi5sXA68UjGd9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E7CCF805BD; Fri, 15 Mar 2024 09:39:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E480FF805BF;
	Fri, 15 Mar 2024 09:39:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9B3DF80579; Fri, 15 Mar 2024 00:23:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D4E7F80579
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D4E7F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=NOqBj4Iq
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 57B23100014;
	Fri, 15 Mar 2024 02:23:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 57B23100014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458584;
	bh=JpPi/mOFnVXfj66BfKe1fDh74tyhvH11HXKdHTzjj5w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=NOqBj4IqQ1b+EsHMXHl4EYsP7fvyGyCwL9a2ayBnjVzTcrYUPYG2etDWMAiL0aRWL
	 jTs+0t0+Smln4ZesJM+wOcipu3mry1SNTySyPcweYWXTUGfSGAN6ZhDXoMR9hmDGOr
	 QY4A75vvLhdPqE8sAQBwF0hGztFd6xmxFXPCETYGV0NkHSMyFImHsk+UE3HwHcsILM
	 m3n5RC22Qr7FNWU29Yz27Pjd4qCXLnvmzVIxWeHBmDBgFznYT5ULnma+gX2hXgvkqD
	 Pkt1GiBg3L+M35x4Ykzc2LNjEvNiVO5IYx/2I5zepRAH7kLh/RP3O1hun6N0bw53tt
	 scMYT8epTmESA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:04 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:03 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
Subject: [PATCH 10/25] ASoC: meson: t9015: prepare to adding new platforms
Date: Fri, 15 Mar 2024 02:21:46 +0300
Message-ID: <20240314232201.2102178-11-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from},
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5B3C227N5JIKY4GMRSUHLROZGGH7HMTI
X-Message-ID-Hash: 5B3C227N5JIKY4GMRSUHLROZGGH7HMTI
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move platform specific code to make the reading of upcoming commit
easier.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 sound/soc/meson/t9015.c | 71 ++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 571f65788c59..48f6767bd858 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -51,6 +51,12 @@ struct t9015 {
 	struct regulator *avdd;
 };
 
+struct t9015_match_data {
+	const struct snd_soc_component_driver *component_drv;
+	struct snd_soc_dai_driver *dai_drv;
+	unsigned int max_register;
+};
+
 static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
@@ -112,6 +118,11 @@ static SOC_ENUM_SINGLE_DECL(dacl_in_enum, BLOCK_EN, DACL_SRC, dacl_in_txt);
 static const char * const mono_txt[] = { "Stereo", "Mono"};
 static SOC_ENUM_SINGLE_DECL(mono_enum, VOL_CTRL1, DAC_MONO, mono_txt);
 
+static const struct snd_kcontrol_new t9015_right_dac_mux =
+	SOC_DAPM_ENUM("Right DAC Source", dacr_in_enum);
+static const struct snd_kcontrol_new t9015_left_dac_mux =
+	SOC_DAPM_ENUM("Left DAC Source", dacl_in_enum);
+
 static const struct snd_kcontrol_new t9015_snd_controls[] = {
 	/* Volume Controls */
 	SOC_ENUM("Playback Channel Mode", mono_enum),
@@ -126,11 +137,6 @@ static const struct snd_kcontrol_new t9015_snd_controls[] = {
 	SOC_SINGLE("Unmute Ramp Switch", VOL_CTRL1, UNMUTE_MODE, 1, 0),
 };
 
-static const struct snd_kcontrol_new t9015_right_dac_mux =
-	SOC_DAPM_ENUM("Right DAC Source", dacr_in_enum);
-static const struct snd_kcontrol_new t9015_left_dac_mux =
-	SOC_DAPM_ENUM("Left DAC Source", dacl_in_enum);
-
 static const struct snd_soc_dapm_widget t9015_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("Right IN", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("Left IN", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -223,7 +229,20 @@ static int t9015_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int t9015_component_probe(struct snd_soc_component *component)
+{
+	/*
+	 * Initialize output polarity:
+	 * ATM the output polarity is fixed but in the future it might useful
+	 * to add DT property to set this depending on the platform needs
+	 */
+	snd_soc_component_write(component, LINEOUT_CFG, 0x1111);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver t9015_codec_driver = {
+	.probe			= t9015_component_probe,
 	.set_bias_level		= t9015_set_bias_level,
 	.controls		= t9015_snd_controls,
 	.num_controls		= ARRAY_SIZE(t9015_snd_controls),
@@ -235,22 +254,25 @@ static const struct snd_soc_component_driver t9015_codec_driver = {
 	.endianness		= 1,
 };
 
-static const struct regmap_config t9015_regmap_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= POWER_CFG,
-};
-
 static int t9015_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct t9015_match_data *data;
 	struct t9015 *priv;
 	void __iomem *regs;
+	struct regmap_config config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+	};
 	struct regmap *regmap;
 	struct clk *pclk;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		dev_err_probe(dev, -ENODEV, "failed to match device\n");
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -276,25 +298,28 @@ static int t9015_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 	}
 
-	regmap = devm_regmap_init_mmio(dev, regs, &t9015_regmap_config);
+	config.max_register = data->max_register;
+	regmap = devm_regmap_init_mmio(dev, regs, &config);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(regmap);
 	}
 
-	/*
-	 * Initialize output polarity:
-	 * ATM the output polarity is fixed but in the future it might useful
-	 * to add DT property to set this depending on the platform needs
-	 */
-	regmap_write(regmap, LINEOUT_CFG, 0x1111);
-
-	return devm_snd_soc_register_component(dev, &t9015_codec_driver,
-					       &t9015_dai, 1);
+	return devm_snd_soc_register_component(dev, data->component_drv,
+					       data->dai_drv, 1);
 }
 
+static const struct t9015_match_data t9015_match_data = {
+	.component_drv = &t9015_codec_driver,
+	.dai_drv = &t9015_dai,
+	.max_register = POWER_CFG,
+};
+
 static const struct of_device_id t9015_ids[] __maybe_unused = {
-	{ .compatible = "amlogic,t9015", },
+	{
+		.compatible = "amlogic,t9015",
+		.data = &t9015_match_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, t9015_ids);
-- 
2.34.1

