Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668412D1122
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 13:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 783A01754;
	Mon,  7 Dec 2020 13:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 783A01754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607345788;
	bh=m5XjRWwjU7iYSHfBqXYcMV/ykL5vkCq1eOgZ75If754=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txiGBG07NpY/99D+naoOL4winN+zx4ye/G/d+f8bo0YLUFMBH65Lpne/hfY/ZGAcD
	 /mLPzm4T6wEE6PdIkIUNbQiVgK5vqrAyb84b+gsY+nAIUxF8WTcAhj8ATve7t/LQuJ
	 ehFeCbsztx/iF6lVUEkHo0/f1CcAhTLhDlArkn1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3858DF804CB;
	Mon,  7 Dec 2020 13:54:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5E87F804CA; Mon,  7 Dec 2020 13:54:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DCD8F8021D
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 13:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DCD8F8021D
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/5] ASoC: codecs/jz4770: Don't change cap-couple setting in
 HP PMU/PMD
Date: Mon,  7 Dec 2020 12:53:36 +0000
Message-Id: <20201207125338.119397-4-paul@crapouillou.net>
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

There is simply no reason to do that.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/jz4770.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 0da966785aee..909b70e817b4 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -371,9 +371,9 @@ static int hpout_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		/* set cap-less, unmute HP */
+		/* unmute HP */
 		regmap_clear_bits(jz_codec->regmap, JZ4770_CODEC_REG_CR_HP,
-				  REG_CR_HP_SB_HPCM | REG_CR_HP_MUTE);
+				  REG_CR_HP_MUTE);
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
@@ -394,9 +394,9 @@ static int hpout_event(struct snd_soc_dapm_widget *w,
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
-		/* set cap-couple, mute HP */
+		/* mute HP */
 		regmap_set_bits(jz_codec->regmap, JZ4770_CODEC_REG_CR_HP,
-				REG_CR_HP_SB_HPCM | REG_CR_HP_MUTE);
+				REG_CR_HP_MUTE);
 
 		err = regmap_read_poll_timeout(jz_codec->regmap,
 					       JZ4770_CODEC_REG_IFR,
-- 
2.29.2

