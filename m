Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D914CB7EC
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C7E1AD7;
	Thu,  3 Mar 2022 08:32:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C7E1AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646292785;
	bh=4kLvybi2kffivdG0ZzYly+g+kalfyehRlxKwtNg4X7g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9MHDYI4MEXWqJNy0Dt+dN4uKGyFNejHxWEDX1uEDLoLkvpGt49W6xz+tu1Tz0m8S
	 fqvGt6RkyDaaIdO9Pl7gM4kddvF0YBb/aJUBMu7nH2yrvPfYwLuOXOd+JTyv8htInS
	 TIsJ480oBFtaRu2QOmIoI7wWfdXPVyUMaKX7HLew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10236F8051B;
	Thu,  3 Mar 2022 08:30:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2422F80516; Thu,  3 Mar 2022 08:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC1AFF80516
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 08:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC1AFF80516
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfux-0006PP-El; Thu, 03 Mar 2022 08:30:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfuw-002Umd-25; Thu, 03 Mar 2022 08:30:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ASoC: fsl_sai: simplify register poking in
 fsl_sai_set_bclk
Date: Thu,  3 Mar 2022 08:30:24 +0100
Message-Id: <20220303073028.594183-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303073028.594183-1-s.hauer@pengutronix.de>
References: <20220303073028.594183-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

Depending on SAI synchronization mode, the same value is either
written to FSL_SAI_TCR2 or FSL_SAI_RCR2 or nothing is written at all.

As the computation is the same either way, factor it out to make it
clearer what the difference is. No functional change.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 56311a0f23b95..5f627ccd172b2 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -341,7 +341,7 @@ static int fsl_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
-	unsigned int ofs = sai->soc_data->reg_offset;
+	unsigned int reg, ofs = sai->soc_data->reg_offset;
 	unsigned long clk_rate;
 	u32 savediv = 0, ratio, savesub = freq;
 	int adir = tx ? RX : TX;
@@ -401,6 +401,9 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 		return -EINVAL;
 	}
 
+	dev_dbg(dai->dev, "best fit: clock id=%d, div=%d, deviation =%d\n",
+			sai->mclk_id[tx], savediv, savesub);
+
 	/*
 	 * 1) For Asynchronous mode, we must set RCR2 register for capture, and
 	 *    set TCR2 register for playback.
@@ -411,22 +414,16 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	 * 4) For Tx and Rx are both Synchronous with another SAI, we just
 	 *    ignore it.
 	 */
-	if (fsl_sai_dir_is_synced(sai, adir)) {
-		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(!tx, ofs),
-				   FSL_SAI_CR2_MSEL_MASK,
-				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(!tx, ofs),
-				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
-	} else if (!sai->synchronous[dir]) {
-		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
-				   FSL_SAI_CR2_MSEL_MASK,
-				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-		regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
-				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
-	}
+	if (fsl_sai_dir_is_synced(sai, adir))
+		reg = FSL_SAI_xCR2(!tx, ofs);
+	else if (!sai->synchronous[dir])
+		reg = FSL_SAI_xCR2(tx, ofs);
+	else
+		return 0;
 
-	dev_dbg(dai->dev, "best fit: clock id=%d, div=%d, deviation =%d\n",
-			sai->mclk_id[tx], savediv, savesub);
+	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_MSEL_MASK,
+			   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
+	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_DIV_MASK, savediv - 1);
 
 	return 0;
 }
-- 
2.30.2

