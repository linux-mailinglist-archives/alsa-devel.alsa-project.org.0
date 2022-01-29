Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 156D74A3EB0
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 09:36:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E3DC1692;
	Mon, 31 Jan 2022 09:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E3DC1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643618202;
	bh=z80gzxIE5mjMEJSVhDhwch8TuPyJOO8fUUTZfZDavuQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O/okQr8fsDt20Sj2EnSn0lxOryzTpunv2hxNAQ5myVKlQAJ1uVK/4XIkM3zYZ++RV
	 w7RO+lXfAm0GuJ9Yyga6aftSxTX34QZ5lrgsOQV7EuorRwjrkq+nbTleWW8QEyT9xN
	 i4Gffi4umZe2CxuhvgiyW+4M2ozdrqJ6ZRSWHKAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE130F800FF;
	Mon, 31 Jan 2022 09:35:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB025F80240; Sat, 29 Jan 2022 01:08:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9771BF8014B
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 01:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9771BF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hT2dRH0H"
Received: by mail-pl1-x633.google.com with SMTP id z5so7605330plg.8
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Td/41ithzVKpswe8xK5kwZkxkMHoqRss+Qzh6LbhuJg=;
 b=hT2dRH0HfBrYRF8j/ZRjrbxwO+FtN2NDyEkJq8yH/cevdEF4p9aTMoVtT7BvvFQ5/L
 i3E+r5I4mHTXR0QomaYweEHJGo0CrP/vr/Lcfar3j1fDui6vrNqpo5IvbbkZWQEqCYRc
 gHFjPchFaaf4EFnBwMY2kJdY1TYuqc/wleAC5OPukBxbYVfq6OGNFSpu96oeg6H+d/qu
 OWh4r6j565dVW3oTAORq6bHZC0/TA5QI2j+8PZASQ9A4t6ogp53aFBrVB891JVURXZEm
 IGd+rQsgwhE/U5ikrxMe7mgXYGyXhxiKgOmw7Hua0uxeekB42zN95og5WTIYrXvrDuRu
 vO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Td/41ithzVKpswe8xK5kwZkxkMHoqRss+Qzh6LbhuJg=;
 b=INa2gGfypv3+j2HPytc8qPnipmY92Z3OFIReHapT3fbZp9+Ob+2C7//H62XxwudxII
 v4aITj68Dd5hO58BH2uNjW90i7jgbl2zPvchfltPkb3Xka/S9QIICV8txI4aDLWFULgR
 3HfZSzpi5HRDpnwjU3bWkLul9qxS4pslPnC0fJgCt8IspfQ1w/4j9C965ALUCIBs4c1R
 Ju+eULrsU88kUZ6bg4c50kHAQ5kvv/H4ktsXi+2ZKmH4b3P4jMKJOLBsOliHelkf+1Qi
 1kUCuvdf3LgWxVE4f4uLW3HhX/IT1w1Xhuwt4al6Zgo1IPAkt7jagA7n8VrE9oYsSEdo
 12bg==
X-Gm-Message-State: AOAM531c01cVDyspoZM15ZCTk8mUMCql1wpjtCuIlvzA1ZNkH69G53Bf
 NFqcDPrYm4DxHPlsuNdQc73xszWrHTvwy1Vq
X-Google-Smtp-Source: ABdhPJzjgbcrvooJAIR+s++uy9Q4g8cs/ti6lbxcmprDN6YsDD75Lm+O4H1U0bzCpX4EcLL455Q+oA==
X-Received: by 2002:a17:903:1104:: with SMTP id
 n4mr11134744plh.10.1643414924689; 
 Fri, 28 Jan 2022 16:08:44 -0800 (PST)
Received: from pop-os.hsd1.ca.comcast.net
 ([2601:647:4203:ee50:91b8:839:1f9a:a66c])
 by smtp.gmail.com with ESMTPSA id f3sm9629396pfe.43.2022.01.28.16.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 16:08:43 -0800 (PST)
From: Curtis Malainey <cujomalainey@gmail.com>
X-Google-Original-From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ASoC: amd: acp: Power on/off the speaker enable gpio
 pin based on DAPM callback."
Date: Fri, 28 Jan 2022 16:08:26 -0800
Message-Id: <20220129000837.6207-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Jan 2022 09:35:34 +0100
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Eric Peers <epeers@google.com>,
 Rob Barnes <robbarnes@google.com>
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

This reverts commit 5c5f08f7fc0bee9a1bc3fbdcb7a21cfd0648ab14.

This commit hard codes GPIO for max98357a drivers at a board specific
level in the machine driver in the kernel itself. When used with a
board that properly defines the GPIO pins in ACPI there is a resource
contention over the GPIO pin and the card fails to probe.

The amplifier driver has handled this pin lookup long before the
this change landed and it the pin should continue to be owned by the
amplifier as it is specific to that component. As a result this should
be reverted.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Rob Barnes <robbarnes@google.com>
Cc: Eric Peers <epeers@google.com>
---
 sound/soc/amd/acp/Kconfig           |  6 +++---
 sound/soc/amd/acp/acp-legacy-mach.c | 19 +++----------------
 sound/soc/amd/acp/acp-mach-common.c | 25 -------------------------
 sound/soc/amd/acp/acp-mach.h        | 10 +---------
 sound/soc/amd/acp/acp-sof-mach.c    | 21 +++------------------
 5 files changed, 10 insertions(+), 71 deletions(-)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index d5838df3064b..154be5e70821 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -32,7 +32,7 @@ config SND_AMD_ASOC_RENOIR
 
 config SND_SOC_AMD_MACH_COMMON
 	tristate
-	depends on X86 && PCI && I2C && GPIOLIB
+	depends on X86 && PCI && I2C
 	select CLK_FIXED_FCH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
@@ -44,14 +44,14 @@ config SND_SOC_AMD_MACH_COMMON
 
 config SND_SOC_AMD_LEGACY_MACH
 	tristate "AMD Legacy Machine Driver Support"
-	depends on X86 && PCI && I2C && GPIOLIB
+	depends on X86 && PCI && I2C
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables legacy sound card support for ACP audio.
 
 config SND_SOC_AMD_SOF_MACH
 	tristate "AMD SOF Machine Driver Support"
-	depends on X86 && PCI && I2C && GPIOLIB
+	depends on X86 && PCI && I2C
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables SOF sound card support for ACP audio.
diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 0ad1cf41b308..de0f8024e2fb 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -27,7 +27,6 @@ static struct acp_card_drvdata rt5682_rt1019_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = NONE,
-	.gpio_spkr_en = EN_SPKR_GPIO_GB,
 };
 
 static const struct snd_kcontrol_new acp_controls[] = {
@@ -42,16 +41,15 @@ static const struct snd_kcontrol_new acp_controls[] = {
 static const struct snd_soc_dapm_widget acp_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Left Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Right Spk", event_spkr_handler),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static int acp_asoc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = NULL;
 	struct device *dev = &pdev->dev;
-	unsigned int spkr_gpio;
 	int ret;
 
 	if (!pdev->id_entry)
@@ -69,20 +67,9 @@ static int acp_asoc_probe(struct platform_device *pdev)
 	card->controls = acp_controls;
 	card->num_controls = ARRAY_SIZE(acp_controls);
 	card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
-	spkr_gpio = ((struct acp_card_drvdata *)(card->drvdata))->gpio_spkr_en;
 
 	acp_legacy_dai_links_create(card);
 
-	if (gpio_is_valid(spkr_gpio)) {
-		ret = devm_gpio_request(dev, spkr_gpio, "spkren");
-		if (ret) {
-			dev_err(dev, "(%s) gpio request failed: %d\n",
-				__func__, ret);
-			return ret;
-		}
-		gpio_direction_output(spkr_gpio, 0);
-	}
-
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev,
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index c9caade5cb74..7386e5bb61b5 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -71,31 +71,6 @@ static const struct snd_soc_dapm_route rt5682_map[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-int event_spkr_handler(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct acp_card_drvdata *drvdata = snd_soc_card_get_drvdata(card);
-
-	if (!gpio_is_valid(drvdata->gpio_spkr_en))
-		return 0;
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		gpio_set_value(drvdata->gpio_spkr_en, 1);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
-		gpio_set_value(drvdata->gpio_spkr_en, 0);
-		break;
-	default:
-		dev_warn(card->dev, "%s invalid setting\n", __func__);
-		break;
-	}
-	return 0;
-}
-EXPORT_SYMBOL_NS_GPL(event_spkr_handler, SND_SOC_AMD_MACH);
-
 /* Define card ops for RT5682 CODEC */
 static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index fd6299844ebe..5dc47cfbff10 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -17,12 +17,6 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-
-#define EN_SPKR_GPIO_GB                0x11F
-#define EN_SPKR_GPIO_NK                0x146
-#define EN_SPKR_GPIO_NONE      -EINVAL
 
 enum be_id {
 	HEADSET_BE_ID = 0,
@@ -55,11 +49,9 @@ struct acp_card_drvdata {
 	unsigned int dai_fmt;
 	struct clk *wclk;
 	struct clk *bclk;
-	unsigned int gpio_spkr_en;
 };
 
 int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
 int acp_legacy_dai_links_create(struct snd_soc_card *card);
-int event_spkr_handler(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int event);
+
 #endif
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index c1d9650fc222..dc2786cc81ef 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -27,7 +27,6 @@ static struct acp_card_drvdata sof_rt5682_rt1019_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_GB,
 };
 
 static struct acp_card_drvdata sof_rt5682_max_data = {
@@ -37,7 +36,6 @@ static struct acp_card_drvdata sof_rt5682_max_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NK,
 };
 
 static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
@@ -56,7 +54,6 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NK,
 };
 
 static const struct snd_kcontrol_new acp_controls[] = {
@@ -70,16 +67,15 @@ static const struct snd_kcontrol_new acp_controls[] = {
 static const struct snd_soc_dapm_widget acp_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Left Spk", event_spkr_handler),
-	SND_SOC_DAPM_SPK("Right Spk", event_spkr_handler),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static int acp_sof_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = NULL;
 	struct device *dev = &pdev->dev;
-	unsigned int spkr_gpio;
 	int ret;
 
 	if (!pdev->id_entry)
@@ -97,20 +93,9 @@ static int acp_sof_probe(struct platform_device *pdev)
 	card->controls = acp_controls;
 	card->num_controls = ARRAY_SIZE(acp_controls);
 	card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
-	spkr_gpio = ((struct acp_card_drvdata *)(card->drvdata))->gpio_spkr_en;
 
 	acp_sofdsp_dai_links_create(card);
 
-	if (gpio_is_valid(spkr_gpio)) {
-		ret = devm_gpio_request(dev, spkr_gpio, "spkren");
-		if (ret) {
-			dev_err(dev, "(%s) gpio request failed: %d\n",
-				__func__, ret);
-			return ret;
-		}
-		gpio_direction_output(spkr_gpio, 0);
-	}
-
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
2.32.0

