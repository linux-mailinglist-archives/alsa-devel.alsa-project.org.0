Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C102699181
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:36:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8AB2DEF;
	Thu, 16 Feb 2023 11:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8AB2DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543809;
	bh=43yrk27ebZVqNfPcof4HKNkZsJxttOq3JVVqD2Lme4I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=guLULxmijMmpL6Ftc3g65DqKg39SNnkAQ4WAiI/o9h4nFS+b82GfKKQXWF8/rql8Z
	 9KVduy1pnIWH+17qcjl9t+PxJcJpME8A2os2/BU/ukh4UIDxKvLsVMuPtSD88aohPf
	 vxmc/CgtFTOJSwjTPKeG+7RB2VvHfqhtcm9+fAFg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD63EF804B0;
	Thu, 16 Feb 2023 11:35:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79190F80525; Thu, 16 Feb 2023 11:34:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 200BBF804B2
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 200BBF804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=X3p7b9WG
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 509D366021AC;
	Thu, 16 Feb 2023 10:33:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543597;
	bh=43yrk27ebZVqNfPcof4HKNkZsJxttOq3JVVqD2Lme4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X3p7b9WGXkiLWV7Vk9OC51TdwgqNL/CwWbd5k4+W9YpiZEn0bjZ8Dv8PPvvHPt7Jh
	 LoXlY1EoPY0Ve6K84AdXLnmLcAZ/A/7S5s2gQtHnChWz0W99O2J1ny6KMnGWOCE8lx
	 fwCZi0nQ/FL2t8DaPx0fzDS0C5naLKNlIZ1Swu608UizlNXtRcWm3SY0GslPNTSi/q
	 J43hRDM8d0YpzhsG8xVllEW2f/CDoaHn1eNjT+WYklwnuNOVd3NNc6YeLxhNXPB0Er
	 dHW3UjXUwFN+8B1F6HcITHKHeZzoZLC34oEGefsgYJR+pJr3M/C6CFMfQLQlR35DtH
	 +jc1hL79vuXQA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 5/9] ASoC: amd: vangogh: use for_each_rtd_components instead
 of for
Date: Thu, 16 Feb 2023 10:32:56 +0000
Message-Id: <20230216103300.360016-6-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216103300.360016-1-lucas.tanure@collabora.com>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4EVOTS7R43ZNC2VFFVMR2RGY47IT77TV
X-Message-ID-Hash: 4EVOTS7R43ZNC2VFFVMR2RGY47IT77TV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EVOTS7R43ZNC2VFFVMR2RGY47IT77TV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To iterate over components use for_each_rtd_components
And compare to component name, so asoc_rtd_to_codec and the dai code can
be removed

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 40 +++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 841b79fa6af5..e7a7558f70ae 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -146,35 +146,35 @@ static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *sub, struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(sub);
-	unsigned int num_codecs = rtd->dai_link->num_codecs;
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *dai;
-	unsigned int bclk_val;
+	unsigned int bclk, rate = params_rate(params);
+	struct snd_soc_component *comp;
 	int ret, i;
 
-	ret = 0;
-	for (i = 0; i < num_codecs; i++) {
-		dai = asoc_rtd_to_codec(rtd, i);
-		if (strcmp(dai->name, "cs35l41-pcm") == 0) {
-			switch (params_rate(params)) {
-			case 48000:
-				bclk_val = 1536000;
-				break;
-			default:
-				dev_err(card->dev, "Invalid Samplerate:0x%x\n",
-					params_rate(params));
+	switch (rate) {
+	case 48000:
+		bclk = 1536000;
+		break;
+	default:
+		bclk = 0;
+		break;
+	}
+
+	for_each_rtd_components(rtd, i, comp) {
+		if (!(strcmp(comp->name, "spi-VLV1776:00")) ||
+		    !(strcmp(comp->name, "spi-VLV1776:01"))) {
+			if (!bclk) {
+				dev_err(comp->dev, "Invalid sample rate: 0x%x\n", rate);
 				return -EINVAL;
 			}
-			ret = snd_soc_component_set_sysclk(dai->component,
-							   0, 0, bclk_val, SND_SOC_CLOCK_IN);
-			if (ret < 0) {
-				dev_err(card->dev, "failed to set sysclk for CS35l41 dai\n");
+			ret = snd_soc_component_set_sysclk(comp, 0, 0, bclk, SND_SOC_CLOCK_IN);
+			if (ret) {
+				dev_err(comp->dev, "failed to set SYSCLK: %d\n", ret);
 				return ret;
 			}
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_ops acp5x_8821_ops = {
-- 
2.39.2

