Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3569918F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:37:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50944E0F;
	Thu, 16 Feb 2023 11:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50944E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543836;
	bh=7uDbcSAZRH22sMPw1Qxd1jKQJY/DJ64A24vTl6X5+nM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mlLZKB9iTI9H4QMH37twSX1iy7GiRRWVCaKmiOlljRNxLxBKe2qCK0c4w1gn3Qoe4
	 aUMVOBS4+Kwk70gn7IQCqvlPnQ5MJ1/C8eYgjIYea2Iw4q0CssMW0gCiePE5qnCfh+
	 ks+CFBGz48UHk847avL2ggSNcLHMuGYtPLmsbLgc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D501BF8053B;
	Thu, 16 Feb 2023 11:35:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02BB2F804B2; Thu, 16 Feb 2023 11:34:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86AA3F804B0
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86AA3F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=R7Ptfz7d
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D55C266021B2;
	Thu, 16 Feb 2023 10:33:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543598;
	bh=7uDbcSAZRH22sMPw1Qxd1jKQJY/DJ64A24vTl6X5+nM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R7Ptfz7dh4964QuANWo5wW+22D45d8lqKL9PheXPJFUXzbeXB/BTBbkMgwdA7QCo3
	 UlENcgKFnUl4ovTztkCRMftFUS4hl0GTTCUEhbb0w0kdWIOwgMJSMqMssVRF01GiIz
	 VXbcvGFp5BeVuJnAl3lRW9W049OnxN1yHHaBw9oDnrRfoDV5jvWU8zdb8gu+6jfhaW
	 fks5ps8ObkNcZqBeDiFsJwYL4RrrWFTfca3KmFuyqm3jO1Iq0paZWyCV++x0BfUOIo
	 NfIUICS2YxBfWv+ZkD+JWtMv2/kOGWKsGxbEGjplz3810QPIDi+NigD+599/305q/z
	 2dXh/gca7Njew==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 7/9] ASoC: amd: vangogh: Move nau8821 and CPU side code up for
 future platform
Date: Thu, 16 Feb 2023 10:32:58 +0000
Message-Id: <20230216103300.360016-8-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216103300.360016-1-lucas.tanure@collabora.com>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PZLMW6UU2DETCDCXKYZHRCG4CIXSKQ55
X-Message-ID-Hash: PZLMW6UU2DETCDCXKYZHRCG4CIXSKQ55
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZLMW6UU2DETCDCXKYZHRCG4CIXSKQ55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move nau8821 and CPU side code up in the source so future platforms can
be added.

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 93 +++++++++++++++---------------
 1 file changed, 47 insertions(+), 46 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7072352389ab..2072151957a6 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -30,6 +30,11 @@
 static unsigned long acp5x_machine_id;
 static struct snd_soc_jack vg_headset;
 
+SND_SOC_DAILINK_DEF(platform,  DAILINK_COMP_ARRAY(COMP_PLATFORM("acp5x_i2s_dma.0")));
+SND_SOC_DAILINK_DEF(acp5x_i2s, DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.0")));
+SND_SOC_DAILINK_DEF(acp5x_bt,  DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.1")));
+SND_SOC_DAILINK_DEF(nau8821,   DAILINK_COMP_ARRAY(COMP_CODEC("i2c-NVTN2020:00", "nau8821-hifi")));
+
 static struct snd_soc_jack_pin acp5x_nau8821_jack_pins[] = {
 	{
 		.pin	= "Headphone",
@@ -134,6 +139,48 @@ static int acp5x_nau8821_hw_params(struct snd_pcm_substream *sub, struct snd_pcm
 	return ret;
 }
 
+static int platform_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dai *dai;
+	int ret = 0;
+
+	dai = snd_soc_card_get_codec_dai(card, ACP5X_NUVOTON_CODEC_DAI);
+	if (!dai) {
+		dev_err(card->dev, "Codec dai not found\n");
+		return -EIO;
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "set sysclk err = %d\n", ret);
+			return -EIO;
+		}
+	} else {
+		ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_FLL_BLK, 0, SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			dev_err(dai->dev, "can't set BLK clock %d\n", ret);
+		ret = snd_soc_dai_set_pll(dai, 0, 0, ACP5X_NUVOTON_BCLK, ACP5X_NAU8821_FREQ_OUT);
+		if (ret < 0)
+			dev_err(dai->dev, "can't set FLL: %d\n", ret);
+	}
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new acp5x_8821_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+};
+
+static const struct snd_soc_ops acp5x_8821_ops = {
+	.startup = acp5x_8821_startup,
+	.hw_params = acp5x_nau8821_hw_params,
+};
+
 static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -183,11 +230,6 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *sub, struct snd_pcm
 	return 0;
 }
 
-static const struct snd_soc_ops acp5x_8821_ops = {
-	.startup = acp5x_8821_startup,
-	.hw_params = acp5x_nau8821_hw_params,
-};
-
 static const struct snd_soc_ops acp5x_cs35l41_play_ops = {
 	.startup = acp5x_cs35l41_startup,
 	.hw_params = acp5x_cs35l41_hw_params,
@@ -204,10 +246,6 @@ static struct snd_soc_codec_conf cs35l41_conf[] = {
 	},
 };
 
-SND_SOC_DAILINK_DEF(platform,  DAILINK_COMP_ARRAY(COMP_PLATFORM("acp5x_i2s_dma.0")));
-SND_SOC_DAILINK_DEF(acp5x_i2s, DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.0")));
-SND_SOC_DAILINK_DEF(acp5x_bt,  DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.1")));
-SND_SOC_DAILINK_DEF(nau8821,   DAILINK_COMP_ARRAY(COMP_CODEC("i2c-NVTN2020:00", "nau8821-hifi")));
 SND_SOC_DAILINK_DEF(cs35l41,   DAILINK_COMP_ARRAY(COMP_CODEC("spi-VLV1776:00", "cs35l41-pcm"),
 						  COMP_CODEC("spi-VLV1776:01", "cs35l41-pcm")));
 
@@ -233,43 +271,6 @@ static struct snd_soc_dai_link acp5x_dai[] = {
 	},
 };
 
-static int platform_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct snd_soc_dai *dai;
-	int ret = 0;
-
-	dai = snd_soc_card_get_codec_dai(card, ACP5X_NUVOTON_CODEC_DAI);
-	if (!dai) {
-		dev_err(card->dev, "Codec dai not found\n");
-		return -EIO;
-	}
-
-	if (SND_SOC_DAPM_EVENT_OFF(event)) {
-		ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-			return -EIO;
-		}
-	} else {
-		ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_FLL_BLK, 0, SND_SOC_CLOCK_IN);
-		if (ret < 0)
-			dev_err(dai->dev, "can't set BLK clock %d\n", ret);
-		ret = snd_soc_dai_set_pll(dai, 0, 0, ACP5X_NUVOTON_BCLK, ACP5X_NAU8821_FREQ_OUT);
-		if (ret < 0)
-			dev_err(dai->dev, "can't set FLL: %d\n", ret);
-	}
-
-	return ret;
-}
-
-static const struct snd_kcontrol_new acp5x_8821_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Int Mic"),
-};
-
 static const struct snd_soc_dapm_widget acp5x_8821_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-- 
2.39.2

