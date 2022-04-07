Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D014F7A69
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 10:52:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ADCF17FD;
	Thu,  7 Apr 2022 10:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ADCF17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649321549;
	bh=irAe6OkE1r0OyAJm3DkktjlWehzgbvgE2n7yeqekBL0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dka9LB6x/I/4SysB2KiDkviS+j0xrkqS2EtVr+uBORDYdZnlpcSXPE7EBfuJHcy1H
	 IPtYK/bse8XkaiIdO5sysbJC7Mvjjeh9/K0i97ym2fZztoPbuophwy9k+sPQWfZ1nj
	 QLpvsuCVV44eGIBF39LPwC/Z6XFxveU/nOGl7U5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDDAF80539;
	Thu,  7 Apr 2022 10:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9709F8026A; Thu,  7 Apr 2022 10:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB838F80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 10:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB838F80054
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncNpq-0003cx-1d; Thu, 07 Apr 2022 10:49:46 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncNpq-001Zqt-Hk; Thu, 07 Apr 2022 10:49:45 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncNpm-000w4j-SC; Thu, 07 Apr 2022 10:49:42 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 16/21] ASoC: fsl_micfil: rework quality setting
Date: Thu,  7 Apr 2022 10:49:31 +0200
Message-Id: <20220407084936.223075-17-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407084936.223075-1-s.hauer@pengutronix.de>
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
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

For the quality setting the quality setting register values are directly
exposed to the kcontrol and thus to userspace. This is unfortunate
because the register settings contains invalid bit combinations marked
as "N/A". For userspace it doesn't make much sense to be able to set
these just to see that the driver responds with "Please make sure you
select a valid quality." in the kernel log.

Work around this by adding get/set functions for the quality setting.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v3:
    - Leave default quality setting at 'medium'

 sound/soc/fsl/fsl_micfil.c | 109 ++++++++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 31 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 4d8dfb2c22290..e71f799fc4c67 100644
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
+			     struct snd_ctl_elem_value *ucontrol)
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

