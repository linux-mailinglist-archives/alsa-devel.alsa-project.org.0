Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2C4F2657
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 10:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D0217A8;
	Tue,  5 Apr 2022 10:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D0217A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649145869;
	bh=SBX9+s3TOqS9GqxOKHIZ7Ia+8jp4XwIwyZPprJrGkFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OfD4S+TZwokxwTc5AqYp4ixukj0juNEoBEVapBCSDk9HlTQGsGfeocIH4acwad8vC
	 ShBnhKY9h4kiL5HwXAUIFa51x+QNLHRD+0R8cukEO0yH4wyDPIHzCO8rv1cUt/n0MO
	 itmmnfaqlBBi8UiYkyi8gsrBEvrsrNEXq1Tx3+io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67548F80526;
	Tue,  5 Apr 2022 10:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D985CF80549; Tue,  5 Apr 2022 10:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 998EEF804AA
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 10:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 998EEF804AA
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6f-0003bL-Pj; Tue, 05 Apr 2022 10:00:05 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6f-001BH5-Sb; Tue, 05 Apr 2022 10:00:04 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6b-00BXaK-5u; Tue, 05 Apr 2022 10:00:01 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 15/20] ASoC: fsl_micfil: simplify clock setting
Date: Tue,  5 Apr 2022 09:59:54 +0200
Message-Id: <20220405075959.2744803-16-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405075959.2744803-1-s.hauer@pengutronix.de>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
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
index 8335646a84d17..fd3b168a38661 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -111,19 +111,6 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
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
@@ -147,24 +134,6 @@ static int fsl_micfil_reset(struct device *dev)
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
@@ -238,13 +207,12 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
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
@@ -253,11 +221,6 @@ static int fsl_set_clock_params(struct device *dev, unsigned int rate)
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

