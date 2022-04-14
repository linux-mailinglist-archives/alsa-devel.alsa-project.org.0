Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E9D501878
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 18:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367101801;
	Thu, 14 Apr 2022 18:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367101801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649953618;
	bh=1fW3RtJ1/2oBDZLdF+m0FpUycFs/866vdq6Smzx3n9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OuusbItMuKZVevOcDvLDjYHWjDxUUHojlGhLKQlh0Drgie9rZzbwPoi8clwnYeBfD
	 pvkk6qzfEW12LT2NVxx2FaheyqjUNdgSJ1iLni28cCapNbuTXNlCqk7Bt4dKYWWjvW
	 8LTE+TQ8WEH5RHtsCfhdurMLl0HCSaBNk6/MW/to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F65DF8055B;
	Thu, 14 Apr 2022 18:23:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF29BF80549; Thu, 14 Apr 2022 18:23:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0244DF804FD
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 18:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0244DF804FD
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nf2FC-0007P7-Ed; Thu, 14 Apr 2022 18:22:54 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nf2FC-00312b-US; Thu, 14 Apr 2022 18:22:53 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nf2F9-00GuCc-ML; Thu, 14 Apr 2022 18:22:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v6 16/21] ASoC: fsl_micfil: rework quality setting
Date: Thu, 14 Apr 2022 18:22:44 +0200
Message-Id: <20220414162249.3934543-17-s.hauer@pengutronix.de>
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

For the quality setting the quality setting register values are directly
exposed to the kcontrol and thus to userspace. This is unfortunate
because the register settings contains invalid bit combinations marked
as "N/A". For userspace it doesn't make much sense to be able to set
these just to see that the driver responds with "Please make sure you
select a valid quality." in the kernel log.

Work around this by adding get/set functions for the quality setting.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---

Notes:
    Changes since v3:
    - Leave default quality setting at 'medium'

 sound/soc/fsl/fsl_micfil.c | 109 ++++++++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 31 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 4d8dfb2c22290..aecc8a1bcfcd8 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -31,6 +31,15 @@
 
 #define MICFIL_OSR_DEFAULT	16
 
+enum quality {
+	QUALITY_HIGH,
+	QUALITY_MEDIUM,
+	QUALITY_LOW,
+	QUALITY_VLOW0,
+	QUALITY_VLOW1,
+	QUALITY_VLOW2,
+};
+
 struct fsl_micfil {
 	struct platform_device *pdev;
 	struct regmap *regmap;
@@ -42,7 +51,7 @@ struct fsl_micfil {
 	unsigned int dataline;
 	char name[32];
 	int irq[MICFIL_IRQ_LINES];
-	int quality;	/*QUALITY 2-0 bits */
+	enum quality quality;
 };
 
 struct fsl_micfil_soc_data {
@@ -65,29 +74,73 @@ static const struct of_device_id fsl_micfil_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);
 
-/* Table 5. Quality Modes
- * Medium	0 0 0
- * High		0 0 1
- * Very Low 2	1 0 0
- * Very Low 1	1 0 1
- * Very Low 0	1 1 0
- * Low		1 1 1
- */
 static const char * const micfil_quality_select_texts[] = {
-	"Medium", "High",
-	"N/A", "N/A",
-	"VLow2", "VLow1",
-	"VLow0", "Low",
+	[QUALITY_HIGH] = "High",
+	[QUALITY_MEDIUM] = "Medium",
+	[QUALITY_LOW] = "Low",
+	[QUALITY_VLOW0] = "VLow0",
+	[QUALITY_VLOW1] = "Vlow1",
+	[QUALITY_VLOW2] = "Vlow2",
 };
 
 static const struct soc_enum fsl_micfil_quality_enum =
-	SOC_ENUM_SINGLE(REG_MICFIL_CTRL2,
-			MICFIL_CTRL2_QSEL_SHIFT,
-			ARRAY_SIZE(micfil_quality_select_texts),
-			micfil_quality_select_texts);
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(micfil_quality_select_texts),
+			    micfil_quality_select_texts);
 
 static DECLARE_TLV_DB_SCALE(gain_tlv, 0, 100, 0);
 
+static int micfil_set_quality(struct fsl_micfil *micfil)
+{
+	u32 qsel;
+
+	switch (micfil->quality) {
+	case QUALITY_HIGH:
+		qsel = MICFIL_QSEL_HIGH_QUALITY;
+		break;
+	case QUALITY_MEDIUM:
+		qsel = MICFIL_QSEL_MEDIUM_QUALITY;
+		break;
+	case QUALITY_LOW:
+		qsel = MICFIL_QSEL_LOW_QUALITY;
+		break;
+	case QUALITY_VLOW0:
+		qsel = MICFIL_QSEL_VLOW0_QUALITY;
+		break;
+	case QUALITY_VLOW1:
+		qsel = MICFIL_QSEL_VLOW1_QUALITY;
+		break;
+	case QUALITY_VLOW2:
+		qsel = MICFIL_QSEL_VLOW2_QUALITY;
+		break;
+	}
+
+	return regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
+				  MICFIL_CTRL2_QSEL,
+				  FIELD_PREP(MICFIL_CTRL2_QSEL, qsel));
+}
+
+static int micfil_quality_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.integer.value[0] = micfil->quality;
+
+	return 0;
+}
+
+static int micfil_quality_set(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(cmpnt);
+
+	micfil->quality = ucontrol->value.integer.value[0];
+
+	return micfil_set_quality(micfil);
+}
+
 static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
 			  MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),
@@ -107,7 +160,7 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 			  MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),
 	SOC_ENUM_EXT("MICFIL Quality Select",
 		     fsl_micfil_quality_enum,
-		     snd_soc_get_enum_double, snd_soc_put_enum_double),
+		     micfil_quality_get, micfil_quality_set),
 };
 
 /* The SRES is a self-negated bit which provides the CPU with the
@@ -207,22 +260,21 @@ static int fsl_set_clock_params(struct device *dev, unsigned int rate)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 	int clk_div = 8;
+	int osr = MICFIL_OSR_DEFAULT;
 	int ret;
 
-	ret = clk_set_rate(micfil->mclk, rate * clk_div * MICFIL_OSR_DEFAULT * 8);
+	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
 	if (ret)
 		return ret;
 
-	/* set CICOSR */
-	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
-				 MICFIL_CTRL2_CICOSR,
-				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 - MICFIL_OSR_DEFAULT));
+	ret = micfil_set_quality(micfil);
 	if (ret)
 		return ret;
 
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
-				 MICFIL_CTRL2_CLKDIV,
-				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div));
+				 MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
+				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
+				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 - osr));
 
 	return ret;
 }
@@ -275,12 +327,7 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
 	int ret;
 
-	/* set qsel to medium */
-	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
-			MICFIL_CTRL2_QSEL,
-			FIELD_PREP(MICFIL_CTRL2_QSEL, MICFIL_QSEL_MEDIUM_QUALITY));
-	if (ret)
-		return ret;
+	micfil->quality = QUALITY_MEDIUM;
 
 	/* set default gain to max_gain */
 	regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
-- 
2.30.2

