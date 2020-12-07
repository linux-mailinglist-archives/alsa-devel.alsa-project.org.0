Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3F92D1126
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 13:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935121775;
	Mon,  7 Dec 2020 13:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935121775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607345822;
	bh=I9KcFTWSbzboFi/gjjFr7xEkpPxUN4c6OgipA4TF+8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kok2Yb0YmwdcblndU4k8h6aO7aO7ILsvYw8SowUJfhRcreMvBbvYFAFD5PTfbN1A1
	 Uw2IdoVZc5ll4jArylKhXmMUFWPn5+ifopmOte7U6H6WNrAVeDN6ik0chKnX2BB6K8
	 fgHOeWWM4Oo89huJC8sJMAtqWAGFGb1sUmhZTFvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F332AF804D8;
	Mon,  7 Dec 2020 13:54:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11BD5F804D6; Mon,  7 Dec 2020 13:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBE48F804CA
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 13:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE48F804CA
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/5] ASoC: codecs/jz4770: Add DAPM widget to set HP out to
 cap-less mode
Date: Mon,  7 Dec 2020 12:53:37 +0000
Message-Id: <20201207125338.119397-5-paul@crapouillou.net>
In-Reply-To: <20201207125338.119397-1-paul@crapouillou.net>
References: <20201207125338.119397-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Cercueil <paul@crapouillou.net>, alsa-devel@alsa-project.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
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

Cap-less mode is useful e.g. if the headphones are used as an antenna
for a FM radio, so that the signal is not altered. For everything else,
we want the cap-couple mode.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/jz4770.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 909b70e817b4..c9fe7f72bfcb 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -98,7 +98,7 @@ enum {
 #define REG_CR_HP_MUTE			BIT(7)
 #define REG_CR_HP_LOAD			BIT(6)
 #define REG_CR_HP_SB_OFFSET		4
-#define REG_CR_HP_SB_HPCM		BIT(3)
+#define REG_CR_HP_SB_HPCM_OFFSET	3
 #define REG_CR_HP_SEL_OFFSET		0
 #define REG_CR_HP_SEL_MASK		(0x3 << REG_CR_HP_SEL_OFFSET)
 
@@ -519,6 +519,9 @@ static const struct snd_soc_dapm_widget jz4770_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("MICBIAS", JZ4770_CODEC_REG_CR_MIC,
 			    REG_CR_MIC_BIAS_SB_OFFSET, 1, NULL, 0),
 
+	SND_SOC_DAPM_SUPPLY("Cap-less", JZ4770_CODEC_REG_CR_HP,
+			    REG_CR_HP_SB_HPCM_OFFSET, 1, NULL, 0),
+
 	SND_SOC_DAPM_INPUT("MIC1P"),
 	SND_SOC_DAPM_INPUT("MIC1N"),
 	SND_SOC_DAPM_INPUT("MIC2P"),
@@ -640,7 +643,8 @@ static void jz4770_codec_codec_init_regs(struct snd_soc_component *codec)
 	regmap_set_bits(regmap, JZ4770_CODEC_REG_CR_ADC, REG_CR_ADC_LRSWAP);
 
 	/* default to cap-less mode(0) */
-	regmap_clear_bits(regmap, JZ4770_CODEC_REG_CR_HP, REG_CR_HP_SB_HPCM);
+	regmap_clear_bits(regmap, JZ4770_CODEC_REG_CR_HP,
+			  BIT(REG_CR_HP_SB_HPCM_OFFSET));
 
 	/* Send collected updates. */
 	regcache_cache_only(regmap, false);
-- 
2.29.2

