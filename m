Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD1501872
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 18:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C2EF173C;
	Thu, 14 Apr 2022 18:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C2EF173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649953524;
	bh=L83iw92Jk+f9PLoigzNtezRjSKBNjf0HhRXPHK+x2zU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7Oe4cDpCxLOWXruw/2lJ2YbrcwR0ivOigZBrO+/+4MHiNS74Pp+HwzsQErooawV/
	 YIfHgVNm/8fYehF/QJFk9qEYukH/hawRuW112FjuJBBZSh1WDxfIcRUG2pe85zC/vK
	 b+dGcOERsCY64auIx6Tz6X0U0yHTw4OvnyUM7t4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AACC7F804CB;
	Thu, 14 Apr 2022 18:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3C79F80162; Thu, 14 Apr 2022 18:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1539F80431
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 18:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1539F80431
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nf2FC-0007Pr-Ps; Thu, 14 Apr 2022 18:22:54 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nf2FD-00312i-93; Thu, 14 Apr 2022 18:22:53 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nf2F9-00Gu8l-AA; Thu, 14 Apr 2022 18:22:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v6 07/21] ASoC: fsl_micfil: drop error messages from failed
 register accesses
Date: Thu, 14 Apr 2022 18:22:35 +0200
Message-Id: <20220414162249.3934543-8-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414162249.3934543-1-s.hauer@pengutronix.de>
References: <20220414162249.3934543-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org,
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

Failed register accesses are really not expected in memory mapped
registers. When it fails then the register access itself is likely not
the reason, so no need to have extra error messages for each regmap
access. Just drop the error messages. This also fixes some places where
a return value is concatenated using 'ret |=' and then returned as
error value.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 53 ++++++++++----------------------------
 1 file changed, 13 insertions(+), 40 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index da4c245c35e62..619e013cf272d 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -170,17 +170,13 @@ static int fsl_micfil_reset(struct device *dev)
 
 	ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
 				MICFIL_CTRL1_MDIS);
-	if (ret) {
-		dev_err(dev, "failed to clear MDIS bit %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
 			      MICFIL_CTRL1_SRES);
-	if (ret) {
-		dev_err(dev, "failed to reset MICFIL: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
@@ -242,18 +238,14 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 		ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
 				MICFIL_CTRL1_DISEL,
 				FIELD_PREP(MICFIL_CTRL1_DISEL, MICFIL_CTRL1_DISEL_DMA));
-		if (ret) {
-			dev_err(dev, "failed to update DISEL bits\n");
+		if (ret)
 			return ret;
-		}
 
 		/* Enable the module */
 		ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
 				      MICFIL_CTRL1_PDMIEN);
-		if (ret) {
-			dev_err(dev, "failed to enable the module\n");
+		if (ret)
 			return ret;
-		}
 
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -262,18 +254,14 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 		/* Disable the module */
 		ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
 					MICFIL_CTRL1_PDMIEN);
-		if (ret) {
-			dev_err(dev, "failed to enable the module\n");
+		if (ret)
 			return ret;
-		}
 
 		ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
 				MICFIL_CTRL1_DISEL,
 				FIELD_PREP(MICFIL_CTRL1_DISEL, MICFIL_CTRL1_DISEL_DISABLE));
-		if (ret) {
-			dev_err(dev, "failed to update DISEL bits\n");
+		if (ret)
 			return ret;
-		}
 		break;
 	default:
 		return -EINVAL;
@@ -293,24 +281,20 @@ static int fsl_set_clock_params(struct device *dev, unsigned int rate)
 			clk_get_rate(micfil->mclk), rate);
 
 	/* set CICOSR */
-	ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
+	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
 				 MICFIL_CTRL2_CICOSR,
 				 FIELD_PREP(MICFIL_CTRL2_CICOSR, MICFIL_CTRL2_CICOSR_DEFAULT));
 	if (ret)
-		dev_err(dev, "failed to set CICOSR in reg 0x%X\n",
-			REG_MICFIL_CTRL2);
+		return ret;
 
 	/* set CLK_DIV */
 	clk_div = get_clk_div(micfil, rate);
 	if (clk_div < 0)
 		ret = -EINVAL;
 
-	ret |= regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
+	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
 				 MICFIL_CTRL2_CLKDIV,
 				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div));
-	if (ret)
-		dev_err(dev, "failed to set CLKDIV in reg 0x%X\n",
-			REG_MICFIL_CTRL2);
 
 	return ret;
 }
@@ -328,19 +312,14 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	/* 1. Disable the module */
 	ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
 				MICFIL_CTRL1_PDMIEN);
-	if (ret) {
-		dev_err(dev, "failed to disable the module\n");
+	if (ret)
 		return ret;
-	}
 
 	/* enable channels */
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
 				 0xFF, ((1 << channels) - 1));
-	if (ret) {
-		dev_err(dev, "failed to enable channels %d, reg 0x%X\n", ret,
-			REG_MICFIL_CTRL1);
+	if (ret)
 		return ret;
-	}
 
 	ret = fsl_set_clock_params(dev, rate);
 	if (ret < 0) {
@@ -362,7 +341,6 @@ static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
 static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
-	struct device *dev = cpu_dai->dev;
 	int ret;
 	int i;
 
@@ -370,11 +348,8 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
 			MICFIL_CTRL2_QSEL,
 			FIELD_PREP(MICFIL_CTRL2_QSEL, MICFIL_QSEL_MEDIUM_QUALITY));
-	if (ret) {
-		dev_err(dev, "failed to set quality mode bits, reg 0x%X\n",
-			REG_MICFIL_CTRL2);
+	if (ret)
 		return ret;
-	}
 
 	/* set default gain to max_gain */
 	regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
@@ -388,10 +363,8 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_FIFO_CTRL,
 			MICFIL_FIFO_CTRL_FIFOWMK,
 			FIELD_PREP(MICFIL_FIFO_CTRL_FIFOWMK, micfil->soc->fifo_depth - 1));
-	if (ret) {
-		dev_err(dev, "failed to set FIFOWMK\n");
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.30.2

