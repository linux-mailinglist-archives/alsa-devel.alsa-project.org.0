Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9869916B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D786CE71;
	Thu, 16 Feb 2023 11:34:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D786CE71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543726;
	bh=chmwk6fvhRVHQOUMI9wp8+JK79x2xomUKtydhXMVBNk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pXr5dV8SDzfxNBWnlV0o5jvLDJuqhLdt+bUtLoRgdZtf18W/vMngX+JpN2RLsAtlt
	 06/PqcJ36oGbfEchQk2BWvD8Q8FEIx3WXndnXSJ/5yhEMkgtSB4PiJoIzsnJLnc8r2
	 gv0JfqAqX1tPWMfDODWduPFuD+/xQ7hatbQLEjNI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1107EF80544;
	Thu, 16 Feb 2023 11:33:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A317F8052D; Thu, 16 Feb 2023 11:33:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AEB8F80171
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AEB8F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=K2RPYHNG
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3333166021B3;
	Thu, 16 Feb 2023 10:33:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543598;
	bh=chmwk6fvhRVHQOUMI9wp8+JK79x2xomUKtydhXMVBNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2RPYHNGQU7Hh5H8meQuL2m1AqCoc6wlevV3gbowTee0sma5Iz18yMKtMQnhBbNXD
	 vyoXOxA0/uEk5iD1UcMBMejewyJTLLuyI3Na7VbeuGpkCMY4vqeNhsEslTIbpg2oiI
	 3vPzGNAF3+ykP7P40XkTlRptFZ+taULqCHJRqLsWisPzUHAEneZUmO09JaeOYoulme
	 Oy35Q5+0pkV7PIxR0HfHMiwuiTpWUCx+fUf6j0xA8gyuM8250GTtzsXAl1TtXBl1Ip
	 vCqEbzU1nqgUTUjfLitF8ce5FxVklFub4wudtugkzPdqr5W6xUBEa4Xa+7ANPa7L1f
	 rSqkR5KpWETGA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 8/9] ASoC: amd: vangogh: Centralize strings definition
Date: Thu, 16 Feb 2023 10:32:59 +0000
Message-Id: <20230216103300.360016-9-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216103300.360016-1-lucas.tanure@collabora.com>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IF7QCCHUDNBGL6AQLQMTJ7CDFQNAXMSS
X-Message-ID-Hash: IF7QCCHUDNBGL6AQLQMTJ7CDFQNAXMSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IF7QCCHUDNBGL6AQLQMTJ7CDFQNAXMSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace occurrences of strings by their definition, avoiding bugs where
the string changed, but not all places have been modified

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 2072151957a6..74c7b267dcfd 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -22,10 +22,13 @@
 
 #define DRV_NAME			"acp5x_mach"
 #define DUAL_CHANNEL			2
-#define ACP5X_NUVOTON_CODEC_DAI		"nau8821-hifi"
 #define VG_JUPITER			1
-#define ACP5X_NUVOTON_BCLK		3072000
-#define ACP5X_NAU8821_FREQ_OUT		12288000
+#define NAU8821_BCLK			3072000
+#define NAU8821_FREQ_OUT		12288000
+#define NAU8821_DAI			"nau8821-hifi"
+#define CS35L41_LNAME			"spi-VLV1776:00"
+#define CS35L41_RNAME			"spi-VLV1776:01"
+#define CS35L41_DAI			"cs35l41-pcm"
 
 static unsigned long acp5x_machine_id;
 static struct snd_soc_jack vg_headset;
@@ -33,7 +36,7 @@ static struct snd_soc_jack vg_headset;
 SND_SOC_DAILINK_DEF(platform,  DAILINK_COMP_ARRAY(COMP_PLATFORM("acp5x_i2s_dma.0")));
 SND_SOC_DAILINK_DEF(acp5x_i2s, DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.0")));
 SND_SOC_DAILINK_DEF(acp5x_bt,  DAILINK_COMP_ARRAY(COMP_CPU("acp5x_i2s_playcap.1")));
-SND_SOC_DAILINK_DEF(nau8821,   DAILINK_COMP_ARRAY(COMP_CODEC("i2c-NVTN2020:00", "nau8821-hifi")));
+SND_SOC_DAILINK_DEF(nau8821,   DAILINK_COMP_ARRAY(COMP_CODEC("i2c-NVTN2020:00", NAU8821_DAI)));
 
 static struct snd_soc_jack_pin acp5x_nau8821_jack_pins[] = {
 	{
@@ -119,7 +122,7 @@ static int acp5x_nau8821_hw_params(struct snd_pcm_substream *sub, struct snd_pcm
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(sub);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *dai = snd_soc_card_get_codec_dai(card, ACP5X_NUVOTON_CODEC_DAI);
+	struct snd_soc_dai *dai = snd_soc_card_get_codec_dai(card, NAU8821_DAI);
 	int ret, bclk;
 
 	ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_FLL_BLK, 0, SND_SOC_CLOCK_IN);
@@ -146,7 +149,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcon
 	struct snd_soc_dai *dai;
 	int ret = 0;
 
-	dai = snd_soc_card_get_codec_dai(card, ACP5X_NUVOTON_CODEC_DAI);
+	dai = snd_soc_card_get_codec_dai(card, NAU8821_DAI);
 	if (!dai) {
 		dev_err(card->dev, "Codec dai not found\n");
 		return -EIO;
@@ -162,7 +165,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcon
 		ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_FLL_BLK, 0, SND_SOC_CLOCK_IN);
 		if (ret < 0)
 			dev_err(dai->dev, "can't set BLK clock %d\n", ret);
-		ret = snd_soc_dai_set_pll(dai, 0, 0, ACP5X_NUVOTON_BCLK, ACP5X_NAU8821_FREQ_OUT);
+		ret = snd_soc_dai_set_pll(dai, 0, 0, NAU8821_BCLK, NAU8821_FREQ_OUT);
 		if (ret < 0)
 			dev_err(dai->dev, "can't set FLL: %d\n", ret);
 	}
@@ -213,8 +216,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *sub, struct snd_pcm
 	}
 
 	for_each_rtd_components(rtd, i, comp) {
-		if (!(strcmp(comp->name, "spi-VLV1776:00")) ||
-		    !(strcmp(comp->name, "spi-VLV1776:01"))) {
+		if (!(strcmp(comp->name, CS35L41_LNAME)) || !(strcmp(comp->name, CS35L41_RNAME))) {
 			if (!bclk) {
 				dev_err(comp->dev, "Invalid sample rate: 0x%x\n", rate);
 				return -EINVAL;
@@ -237,17 +239,17 @@ static const struct snd_soc_ops acp5x_cs35l41_play_ops = {
 
 static struct snd_soc_codec_conf cs35l41_conf[] = {
 	{
-		.dlc = COMP_CODEC_CONF("spi-VLV1776:00"),
+		.dlc = COMP_CODEC_CONF(CS35L41_LNAME),
 		.name_prefix = "Left",
 	},
 	{
-		.dlc = COMP_CODEC_CONF("spi-VLV1776:01"),
+		.dlc = COMP_CODEC_CONF(CS35L41_RNAME),
 		.name_prefix = "Right",
 	},
 };
 
-SND_SOC_DAILINK_DEF(cs35l41,   DAILINK_COMP_ARRAY(COMP_CODEC("spi-VLV1776:00", "cs35l41-pcm"),
-						  COMP_CODEC("spi-VLV1776:01", "cs35l41-pcm")));
+SND_SOC_DAILINK_DEF(cs35l41, DAILINK_COMP_ARRAY(COMP_CODEC(CS35L41_LNAME, CS35L41_DAI),
+						COMP_CODEC(CS35L41_RNAME, CS35L41_DAI)));
 
 static struct snd_soc_dai_link acp5x_dai[] = {
 	{
-- 
2.39.2

