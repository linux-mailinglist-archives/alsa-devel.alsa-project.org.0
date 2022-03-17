Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5484DC169
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 09:35:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25961A45;
	Thu, 17 Mar 2022 09:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25961A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647506130;
	bh=QSkTNSMwEyyZOa8i+H6QeR+KjqycKGq+mI+RBoJF7F0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hTu/l8Xtg14NPGGrP6M1+MzqMvYEmrM73X0lp2bECg5o6T0P5VriOb7jB1+uDJ1rL
	 8rGo1yKMxElM2kP/wgyPoxMESiJdokYWK8iM13eEx3UwjlL56ljVkFDkhoLLcOrpe1
	 5LvCARgzbUvZf1stAPVt1v3YMnLSksyMDkTydGxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D48F805C2;
	Thu, 17 Mar 2022 09:29:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 798F9F805BF; Thu, 17 Mar 2022 09:29:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0047CF805B2
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 09:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0047CF805B2
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUo-000694-7r; Thu, 17 Mar 2022 09:28:34 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUn-0027UG-0J; Thu, 17 Mar 2022 09:28:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/19] ASoC: fsl_micfil: simplify clock setting
Date: Thu, 17 Mar 2022 09:28:13 +0100
Message-Id: <20220317082818.503143-15-s.hauer@pengutronix.de>
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

The reference manual has this for calculating the micfil internal clock
divider:

         MICFIL Clock rate
clkdiv = -----------------
         8 * OSR * outrate

(with OSR == Oversampling Rate, outrate == output sample rate)

The driver first sets the MICFIL Clock rate to (outrate * 1024) and then
calculates back the clkdiv value from the above calculation.

Simplify this by using a fixed clkdiv value of 8 and set the MICFIL
Clock rate to (outrate * clkdiv * OSR * 8).

While at it drop disabling the clock before setting its rate. The MICFIL
module is disabled when the rate is changed and it is also resetted
before it is started again, so I doubt it's necessary to disable the
clock.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_micfil.c | 45 ++++----------------------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 8dadb824a94ff..7975ae6f3fb4f 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -110,19 +110,6 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 		     snd_soc_get_enum_double, snd_soc_put_enum_double),
 };
 
-static inline int get_clk_div(struct fsl_micfil *micfil,
-			      unsigned int rate)
-{
-	long mclk_rate;
-	int clk_div;
-
-	mclk_rate = clk_get_rate(micfil->mclk);
-
-	clk_div = mclk_rate / (rate * micfil->osr * 8);
-
-	return clk_div;
-}
-
 /* The SRES is a self-negated bit which provides the CPU with the
  * capability to initialize the PDM Interface module through the
  * slave-bus interface. This bit always reads as zero, and this
@@ -146,24 +133,6 @@ static int fsl_micfil_reset(struct device *dev)
 	return 0;
 }
 
-static int fsl_micfil_set_mclk_rate(struct fsl_micfil *micfil,
-				    unsigned int freq)
-{
-	struct device *dev = &micfil->pdev->dev;
-	int ret;
-
-	clk_disable_unprepare(micfil->mclk);
-
-	ret = clk_set_rate(micfil->mclk, freq * 1024);
-	if (ret)
-		dev_warn(dev, "failed to set rate (%u): %d\n",
-			 freq * 1024, ret);
-
-	clk_prepare_enable(micfil->mclk);
-
-	return ret;
-}
-
 static int fsl_micfil_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
@@ -237,13 +206,12 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 static int fsl_set_clock_params(struct device *dev, unsigned int rate)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
-	int clk_div;
+	int clk_div = 8;
 	int ret;
 
-	ret = fsl_micfil_set_mclk_rate(micfil, rate);
-	if (ret < 0)
-		dev_err(dev, "failed to set mclk[%lu] to rate %u\n",
-			clk_get_rate(micfil->mclk), rate);
+	ret = clk_set_rate(micfil->mclk, rate * clk_div * micfil->osr * 8);
+	if (ret)
+		return ret;
 
 	/* set CICOSR */
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
@@ -252,11 +220,6 @@ static int fsl_set_clock_params(struct device *dev, unsigned int rate)
 	if (ret)
 		return ret;
 
-	/* set CLK_DIV */
-	clk_div = get_clk_div(micfil, rate);
-	if (clk_div < 0)
-		ret = -EINVAL;
-
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
 				 MICFIL_CTRL2_CLKDIV,
 				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div));
-- 
2.30.2

