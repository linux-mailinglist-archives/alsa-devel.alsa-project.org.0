Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE132D1121
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 13:56:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CFCB168F;
	Mon,  7 Dec 2020 13:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CFCB168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607345780;
	bh=Jljt51kij+VIcX4wBu6jRB2GPJfxUJVLhbv99gb00dQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N97TPJAEMIfXWt52TOVIMgTl1D5lmNg8xE/B5LE1iRFuqEqX+x++j6G8+uN3KMWHA
	 B2VHbZmQ/CFSO3HLAiqWFSGfri8PxYJ6ppcpm2ZQ5Ve2hnOass+4Mc+Yh1Ao0nzKKu
	 LrKVxhy8P2N/oSs3R6Z8OAcwnkOE4ZifqZaz142g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F9CAF804C2;
	Mon,  7 Dec 2020 13:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6847AF8027C; Mon,  7 Dec 2020 13:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D655CF8021D
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 13:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D655CF8021D
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/5] ASoC: codecs/jz4770: Adjust timeouts for cap-coupled
 outputs
Date: Mon,  7 Dec 2020 12:53:35 +0000
Message-Id: <20201207125338.119397-3-paul@crapouillou.net>
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

When using cap-coupled outputs, the RUP/RDO can take much longer than
the 100ms timeout we used to have. Increase that timeout to one second.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/jz4770.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 002f2300e750..0da966785aee 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -287,7 +287,7 @@ static int jz4770_codec_mute_stream(struct snd_soc_dai *dai, int mute, int direc
 		err = regmap_read_poll_timeout(jz_codec->regmap,
 					       JZ4770_CODEC_REG_IFR,
 					       val, val & gain_bit,
-					       1000, 100 * USEC_PER_MSEC);
+					       1000, 1 * USEC_PER_SEC);
 		if (err) {
 			dev_err(jz_codec->dev,
 				"Timeout while setting digital mute: %d", err);
@@ -381,7 +381,7 @@ static int hpout_event(struct snd_soc_dapm_widget *w,
 		err = regmap_read_poll_timeout(jz_codec->regmap,
 					       JZ4770_CODEC_REG_IFR,
 					       val, val & REG_IFR_RUP,
-					       1000, 100 * USEC_PER_MSEC);
+					       1000, 1 * USEC_PER_SEC);
 		if (err) {
 			dev_err(jz_codec->dev, "RUP timeout: %d", err);
 			return err;
@@ -401,7 +401,7 @@ static int hpout_event(struct snd_soc_dapm_widget *w,
 		err = regmap_read_poll_timeout(jz_codec->regmap,
 					       JZ4770_CODEC_REG_IFR,
 					       val, val & REG_IFR_RDO,
-					       1000, 100 * USEC_PER_MSEC);
+					       1000, 1 * USEC_PER_SEC);
 		if (err) {
 			dev_err(jz_codec->dev, "RDO timeout: %d", err);
 			return err;
@@ -803,7 +803,7 @@ static int jz4770_codec_io_wait(struct jz_codec *codec)
 
 	return readl_poll_timeout(codec->base + ICDC_RGADW_OFFSET, reg,
 				  !(reg & ICDC_RGADW_RGWR),
-				  1000, 10 * USEC_PER_MSEC);
+				  1000, 1 * USEC_PER_SEC);
 }
 
 static int jz4770_codec_reg_read(void *context, unsigned int reg,
-- 
2.29.2

