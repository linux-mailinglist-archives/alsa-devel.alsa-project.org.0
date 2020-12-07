Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A431E2D111E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 13:55:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB549176A;
	Mon,  7 Dec 2020 13:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB549176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607345737;
	bh=ZfFmXiUV2hzTQ91OQ/B5qZ8uvdRAuDnwEbZIGgTmHJM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ozonfvu8pPT/gH63CLYGVu01AwNSqI8PBHK+BEAJ8pOdJMKrVMdKY5zhHp0LH+Mxx
	 jcRUoNGXqR+CCzrem3zUfONRsd6aUuMTN6gAPGhKPDWdLSgdDgBGglnHP2BAC3tR97
	 AY3qpoVYHIG6iVWF/wxTNV8uKclto4OG7OlPGMOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C72DF80264;
	Mon,  7 Dec 2020 13:54:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D87DAF8021D; Mon,  7 Dec 2020 13:54:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5BADF8020D
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 13:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5BADF8020D
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/5] ASoC: codecs/jz4770: Reset interrupt flags in bias PREPARE
Date: Mon,  7 Dec 2020 12:53:34 +0000
Message-Id: <20201207125338.119397-2-paul@crapouillou.net>
In-Reply-To: <20201207125338.119397-1-paul@crapouillou.net>
References: <20201207125338.119397-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Cercueil <paul@crapouillou.net>, alsa-devel@alsa-project.org,
 od@zcrc.me, Christophe Branchereau <cbranchereau@gmail.com>,
 linux-kernel@vger.kernel.org
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

From: Christophe Branchereau <cbranchereau@gmail.com>

In case a poll for RUP times out, we might be left with some IRQ flags
that should be cleared before the next power on.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/jz4770.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index c6b2043f31a9..002f2300e750 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -190,6 +190,9 @@ static int jz4770_codec_set_bias_level(struct snd_soc_component *codec,
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
+		/* Reset all interrupt flags. */
+		regmap_write(regmap, JZ4770_CODEC_REG_IFR, REG_IFR_ALL_MASK);
+
 		regmap_clear_bits(regmap, JZ4770_CODEC_REG_CR_VIC,
 				  REG_CR_VIC_SB);
 		msleep(250);
@@ -642,9 +645,6 @@ static void jz4770_codec_codec_init_regs(struct snd_soc_component *codec)
 	/* Send collected updates. */
 	regcache_cache_only(regmap, false);
 	regcache_sync(regmap);
-
-	/* Reset all interrupt flags. */
-	regmap_write(regmap, JZ4770_CODEC_REG_IFR, REG_IFR_ALL_MASK);
 }
 
 static int jz4770_codec_codec_probe(struct snd_soc_component *codec)
-- 
2.29.2

