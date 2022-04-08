Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13A4F9429
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:33:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028171A9E;
	Fri,  8 Apr 2022 13:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028171A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417610;
	bh=aE61C61GUeWZuOW6PreFNTnOYXmMO1FD7/gI0p8OoGg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a422Iy0wRHFD0Bvx1RTMIJz/DilZyYJmxS01KI0IoH9VcpSRNE52uG+4SuAjptjGR
	 LzPC8qyEkLJ7OC6zmblf+jEzd53zp5gNsD0Z7YH7kX+PNSKZwri88t8NZWzD4vSaPr
	 jRSQMugjP4MSJoTYr7FqOkXo7wnQjEIwd8/eRNoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFADF80557;
	Fri,  8 Apr 2022 13:30:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1622F80519; Fri,  8 Apr 2022 13:29:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86E66F804B1
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86E66F804B1
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo7-0004uE-8u; Fri, 08 Apr 2022 13:29:39 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo7-001n6V-K9; Fri, 08 Apr 2022 13:29:38 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo3-005ZBd-5u; Fri, 08 Apr 2022 13:29:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 20/21] ASoC: fsl_micfil: fold fsl_set_clock_params() into
 its only user
Date: Fri,  8 Apr 2022 13:29:27 +0200
Message-Id: <20220408112928.1326755-21-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408112928.1326755-1-s.hauer@pengutronix.de>
References: <20220408112928.1326755-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 41 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index a603033daed69..8c7b15dbd1d45 100644
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

