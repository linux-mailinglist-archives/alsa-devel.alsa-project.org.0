Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3644CB7E4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A90E1AAF;
	Thu,  3 Mar 2022 08:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A90E1AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646292768;
	bh=AfUKihGzydu1DrGY5HHUcoj/7ebxwbArPJp6J0Y4YBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3O7lMLXwajf7rW9ha5yj8JN8/siZ//8VVj9tNiiuFkMTggnJ7JAesH96j8ZM3jiv
	 uHvgtGMuGVDatiWyYEe3Jfwl8hratfkRvNpprgAiPROXYsD2sStay9S+3Dhl5VN4fZ
	 1jTphUj6RVC2Mfa8ZHQXFwp5fM/nJAip+4zxq/RE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817E2F80519;
	Thu,  3 Mar 2022 08:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA0CEF8051D; Thu,  3 Mar 2022 08:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5736F80511
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 08:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5736F80511
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfux-0006PS-Ev; Thu, 03 Mar 2022 08:30:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfuw-002Umz-3G; Thu, 03 Mar 2022 08:30:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: fsl_sai: Use better variable names
Date: Thu,  3 Mar 2022 08:30:26 +0100
Message-Id: <20220303073028.594183-6-s.hauer@pengutronix.de>
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

"ret" is normally used as a variable name for return values. In
fsl_sai_set_bclk() it stores the difference between the desired rate and
the rate we can archieve, so rename it to "diff". Also rename "savesub"
to "bestdiff" as that stores the best difference we have found.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 2544fd363e24d..190f6206023fa 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -343,11 +343,10 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
 	unsigned int reg, ofs = sai->soc_data->reg_offset;
 	unsigned long clk_rate;
-	u32 savediv = 0, ratio, savesub = freq;
+	u32 savediv = 0, ratio, bestdiff = freq;
 	int adir = tx ? RX : TX;
 	int dir = tx ? TX : RX;
 	u32 id;
-	int ret = 0;
 
 	/* Don't apply to consumer mode */
 	if (sai->is_consumer_mode)
@@ -361,19 +360,21 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	id = sai->soc_data->mclk0_is_mclk1 ? 1 : 0;
 
 	for (; id < FSL_SAI_MCLK_MAX; id++) {
+		int diff;
+
 		clk_rate = clk_get_rate(sai->mclk_clk[id]);
 		if (!clk_rate)
 			continue;
 
 		ratio = clk_rate / freq;
 
-		ret = clk_rate - ratio * freq;
+		diff = clk_rate - ratio * freq;
 
 		/*
 		 * Drop the source that can not be
 		 * divided into the required rate.
 		 */
-		if (ret != 0 && clk_rate / ret < 1000)
+		if (diff != 0 && clk_rate / diff < 1000)
 			continue;
 
 		dev_dbg(dai->dev,
@@ -385,13 +386,13 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 		else
 			continue;
 
-		if (ret < savesub) {
+		if (diff < bestdiff) {
 			savediv = ratio;
 			sai->mclk_id[tx] = id;
-			savesub = ret;
+			bestdiff = diff;
 		}
 
-		if (ret == 0)
+		if (diff == 0)
 			break;
 	}
 
@@ -402,7 +403,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	}
 
 	dev_dbg(dai->dev, "best fit: clock id=%d, div=%d, deviation =%d\n",
-			sai->mclk_id[tx], savediv, savesub);
+			sai->mclk_id[tx], savediv, bestdiff);
 
 	/*
 	 * 1) For Asynchronous mode, we must set RCR2 register for capture, and
-- 
2.30.2

