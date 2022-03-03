Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FCC4CB7D1
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:31:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75601AA7;
	Thu,  3 Mar 2022 08:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75601AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646292708;
	bh=mH5N4bleI/7bj53K3gSf4MHbqmIiw2g+VJHbtuitZz0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OVgHCJUicxGifUPwdyAUm9Ygr2IH1Iymmdun7H/sBV4MMCaH6npqAHpY2yi7ZykNG
	 4iwYKBIwAdMTKaDZFtgDNMQLJ6dspYV7nobi7AqNegFnOPQ5bNHYpJDBZQE2ZJpv/T
	 Bmvu6eI+nbUbYel6cmEw0iEOoeVNM89YCiOptcI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C5DBF80256;
	Thu,  3 Mar 2022 08:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55DB3F80166; Thu,  3 Mar 2022 08:30:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36191F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 08:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36191F800F0
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfux-0006PT-Eq; Thu, 03 Mar 2022 08:30:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfuw-002Un4-3t; Thu, 03 Mar 2022 08:30:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: fsl_sai: use DIV_ROUND_CLOSEST() to calculate
 divider
Date: Thu,  3 Mar 2022 08:30:27 +0100
Message-Id: <20220303073028.594183-7-s.hauer@pengutronix.de>
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
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Shengjiu Wang <shengjiu.wang@gmail.com>
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

In fsl_sai_set_bclk() we want to calculate the divider that gets us
closest to the desired frequency, so use DIV_ROUND_CLOSEST() instead of
just doing a clk_rate/freq.
Also discard invalid ratios earlier.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 190f6206023fa..818bb982427f8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -366,9 +366,11 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 		if (!clk_rate)
 			continue;
 
-		ratio = clk_rate / freq;
+		ratio = DIV_ROUND_CLOSEST(clk_rate, freq);
+		if (!ratio || ratio > 512 || ratio & 1)
+			continue;
 
-		diff = clk_rate - ratio * freq;
+		diff = abs((long)clk_rate - ratio * freq);
 
 		/*
 		 * Drop the source that can not be
@@ -381,10 +383,6 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 			"ratio %d for freq %dHz based on clock %ldHz\n",
 			ratio, freq, clk_rate);
 
-		if (ratio % 2 == 0 && ratio >= 2 && ratio <= 512)
-			ratio /= 2;
-		else
-			continue;
 
 		if (diff < bestdiff) {
 			savediv = ratio;
@@ -424,7 +422,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 
 	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_MSEL_MASK,
 			   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_DIV_MASK, savediv - 1);
+	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_DIV_MASK, savediv / 2 - 1);
 
 	return 0;
 }
-- 
2.30.2

