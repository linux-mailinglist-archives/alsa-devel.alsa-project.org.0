Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 961024CB7D3
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:32:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36ABC1A8E;
	Thu,  3 Mar 2022 08:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36ABC1A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646292741;
	bh=NxYN1oordxpdXD0Ik2hAvGSyeoB6n/Vgs9LHQeQsUHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZRv5/7RQOER1sYRI3+ZjBHQVp/mLz8z2QLGTthq6sGeANwa88/IFfefBQkRQ9ECZN
	 Zp8hRncTLaytvR7VLoUnkwMAkGlxfoneUSZ4lCXVIJlwrElRMxdjUz3x0A03O+eh42
	 CRdZFA7jjP+gxx3/18YagjCvgpmrg1gS1j0A7MHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 040D3F80517;
	Thu,  3 Mar 2022 08:30:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42CCCF80256; Thu,  3 Mar 2022 08:30:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45715F80149
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 08:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45715F80149
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfux-0006PU-F4; Thu, 03 Mar 2022 08:30:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfuw-002Un7-4R; Thu, 03 Mar 2022 08:30:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support
Date: Thu,  3 Mar 2022 08:30:28 +0100
Message-Id: <20220303073028.594183-8-s.hauer@pengutronix.de>
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
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Viorel Suman <viorel.suman@nxp.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
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

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

With higher channel counts, we may need higher clock rates.  Starting
with SAI v3.1 (i.MX8MM), we can bypass the divider and get a 1:1
bclk:mclk ratio. Add the necessary support.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 818bb982427f8..0845f50735248 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -347,6 +347,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	int adir = tx ? RX : TX;
 	int dir = tx ? TX : RX;
 	u32 id;
+	bool support_1_1_ratio = sai->verid.version >= 0x0301;
 
 	/* Don't apply to consumer mode */
 	if (sai->is_consumer_mode)
@@ -367,7 +368,11 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 			continue;
 
 		ratio = DIV_ROUND_CLOSEST(clk_rate, freq);
-		if (!ratio || ratio > 512 || ratio & 1)
+		if (!ratio || ratio > 512)
+			continue;
+		if (ratio == 1 && !support_1_1_ratio)
+			continue;
+		else if (ratio & 1)
 			continue;
 
 		diff = abs((long)clk_rate - ratio * freq);
@@ -422,7 +427,15 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 
 	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_MSEL_MASK,
 			   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_DIV_MASK, savediv / 2 - 1);
+
+	if (savediv == 1)
+		regmap_update_bits(sai->regmap, reg,
+				   FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
+				   FSL_SAI_CR2_BYP);
+	else
+		regmap_update_bits(sai->regmap, reg,
+				   FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
+				   savediv / 2 - 1);
 
 	return 0;
 }
-- 
2.30.2

