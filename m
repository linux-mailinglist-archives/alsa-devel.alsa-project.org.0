Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82E4DC15E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 09:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B399A1941;
	Thu, 17 Mar 2022 09:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B399A1941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647506060;
	bh=CViGqoQsQMjRWbVnHOAb0kWQgVqlyUYIMlkB3ZY5r8E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d87Lj7sEugGW4aiTuuyJfp7J2FRWgyPJQy9ETLBo0S6BJlGRRP7Ed/BtPPJ3im5oq
	 m+eOPMQXR5ejGasbGB6SQFydR7e2czWqaFo4x25krohkx5wd5HERmZ5s0kJQMANesk
	 0skkjrxLXwzg+p0q0Z34jXPnsQM73gP5a5pGTb90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDEBCF80558;
	Thu, 17 Mar 2022 09:29:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFF2CF80551; Thu, 17 Mar 2022 09:29:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B741F8020D
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 09:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B741F8020D
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUo-000699-7y; Thu, 17 Mar 2022 09:28:34 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUn-0027UV-3O; Thu, 17 Mar 2022 09:28:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/19] ASoC: fsl_micfil: fold fsl_set_clock_params() into its
 only user
Date: Thu, 17 Mar 2022 09:28:18 +0100
Message-Id: <20220317082818.503143-20-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220317082818.503143-1-s.hauer@pengutronix.de>
References: <20220317082818.503143-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
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

fsl_set_clock_params() is used only once and easily be folded into its
caller, do so.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_micfil.c | 41 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 99e25761008b1..79f6deb2ba821 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -252,29 +252,6 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int fsl_set_clock_params(struct device *dev, unsigned int rate)
-{
-	struct fsl_micfil *micfil = dev_get_drvdata(dev);
-	int clk_div = 8;
-	int osr = MICFIL_OSR_DEFAULT;
-	int ret;
-
-	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
-	if (ret)
-		return ret;
-
-	ret = micfil_set_quality(micfil);
-	if (ret)
-		return ret;
-
-	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
-				 MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
-				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
-				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 - osr));
-
-	return ret;
-}
-
 static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -282,7 +259,8 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
-	struct device *dev = &micfil->pdev->dev;
+	int clk_div = 8;
+	int osr = MICFIL_OSR_DEFAULT;
 	int ret;
 
 	/* 1. Disable the module */
@@ -297,11 +275,18 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	ret = fsl_set_clock_params(dev, rate);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set clock parameters [%d]\n", ret);
+	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
+	if (ret)
 		return ret;
-	}
+
+	ret = micfil_set_quality(micfil);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
+				 MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
+				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
+				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 - osr));
 
 	micfil->dma_params_rx.peripheral_config = &micfil->sdmacfg;
 	micfil->dma_params_rx.peripheral_size = sizeof(micfil->sdmacfg);
-- 
2.30.2

