Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419814CD76A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:12:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9A91F31;
	Fri,  4 Mar 2022 16:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9A91F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646406762;
	bh=ClaJ0enDAj8p31bYpSmtlEYXYNl15CQANev4YczkdGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bw0TrBSwaJoY6RT7PALfwuOMaJL7cZ30ir7qnL3mq4itp4dMYrR+QXsFkwHbkSoUV
	 lU4YVwTBNF0sdNElZBrl8N6OwgG5QxWa6YyWBi69hIgRmVIUpq9vfhrSYEU48TuUkU
	 hhPH7bVjSsYzU3mD9UeBs6v5CuTEuVWonFQ94/QQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C98DF8052E;
	Fri,  4 Mar 2022 16:07:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26474F80549; Fri,  4 Mar 2022 16:07:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B380FF80515
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B380FF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pOqhD1kv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2244w2hM013723;
 Fri, 4 Mar 2022 09:07:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=E6zE4kJJ6mmhLvb/1c8MY9p34vno5gUVar36QNCV3K0=;
 b=pOqhD1kvACw2kp1J3Od4m1qDghpcpxqd3rejrSIYwvK/8Yy0XErTUg2ir1qhP6hXP2ni
 p3UuqKjKpk/xzFTyFIg4hvZ/6chl4LvleKS9YZFClDTZaYmsa70J7TDoOT79vMGdeCUW
 ppe2+uBUFFKUr/gcy8xtiilUc01obong9v3UsZryFrQ64iguFRetdIfdya0tz25AKcHQ
 jssxknohv4xQ/4kWoF1+ogxeESM0ZHs0AkYEg3OpPhpCL1JvuSoaSf1QF9I6muihrqnM
 hLbsEq6inqwgTI5AqPBJI+zuiHr5Xg/EKHXR/43/LHT9iYYxZ58rcsFMIqFgbXAzXsZe cQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h414-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 09:07:32 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:07:30 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 15:07:30 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4B850B1A;
 Fri,  4 Mar 2022 15:07:30 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 19/20] ASoC: cs35l41: Support external boost
Date: Fri, 4 Mar 2022 15:07:20 +0000
Message-ID: <20220304150721.3802-20-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hoZk7hD7eayUCL_HIhXNznfaW-k8TKG5
X-Proofpoint-ORIG-GUID: hoZk7hD7eayUCL_HIhXNznfaW-k8TKG5
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

Add support for external boost voltage, where
GPIO1 must control a switch to isolate CS35L41
from the external Boost Voltage

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  4 +--
 sound/soc/codecs/cs35l41-lib.c |  5 ++--
 sound/soc/codecs/cs35l41.c     | 49 +++++++++++++++++++++++++---------
 3 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 2b2d1d17e552..dad05d57cd74 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -701,6 +701,8 @@
 #define CS35L41_GPIO1_CTRL_SHIFT	16
 #define CS35L41_GPIO2_CTRL_MASK		0x07000000
 #define CS35L41_GPIO2_CTRL_SHIFT	24
+#define CS35L41_GPIO_LVL_SHIFT		15
+#define CS35L41_GPIO_LVL_MASK		BIT(CS35L41_GPIO_LVL_SHIFT)
 #define CS35L41_GPIO_POL_MASK		0x1000
 #define CS35L41_GPIO_POL_SHIFT		12
 
@@ -796,8 +798,6 @@ int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsign
 int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 			 unsigned int tx_num, unsigned int *tx_slot,
 			 unsigned int rx_num, unsigned int *rx_slot);
-int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind, int boost_cap,
-			 int boost_ipk);
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 91270047bf35..e206970876fe 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -954,8 +954,8 @@ static const unsigned char cs35l41_bst_slope_table[4] = {
 	0x75, 0x6B, 0x3B, 0x28
 };
 
-int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind,
-			 int boost_cap, int boost_ipk)
+static int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind,
+				int boost_cap, int boost_ipk)
 {
 	unsigned char bst_lbst_val, bst_cbst_range, bst_ipk_scaled;
 	int ret;
@@ -1040,7 +1040,6 @@ int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_in
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(cs35l41_boost_config);
 
 static const struct reg_sequence cs35l41_safe_to_reset[] = {
 	{ 0x00000040,			0x00000055 },
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index d25689fe0c60..912196f45648 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -578,15 +578,10 @@ static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
 						cs35l41_pup_patch,
 						ARRAY_SIZE(cs35l41_pup_patch));
 
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
-				   CS35L41_GLOBAL_EN_MASK,
-				   1 << CS35L41_GLOBAL_EN_SHIFT);
-
-		usleep_range(1000, 1100);
+		cs35l41_global_enable(cs35l41->regmap, cs35l41->hw_cfg.bst_type, 1);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
-				   CS35L41_GLOBAL_EN_MASK, 0);
+		cs35l41_global_enable(cs35l41->regmap, cs35l41->hw_cfg.bst_type, 0);
 
 		ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
 					       val, val &  CS35L41_PDN_DONE_MASK,
@@ -1001,13 +996,13 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 	if (!hw_cfg->valid)
 		return -EINVAL;
 
+	if (hw_cfg->bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+		return -EINVAL;
+
 	/* Required */
-	ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
-				   hw_cfg->bst_ind, hw_cfg->bst_cap, hw_cfg->bst_ipk);
-	if (ret) {
-		dev_err(cs35l41->dev, "Error in Boost DT config: %d\n", ret);
+	ret = cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, hw_cfg);
+	if (ret)
 		return ret;
-	}
 
 	/* Optional */
 	if (hw_cfg->dout_hiz <= CS35L41_ASP_DOUT_HIZ_MASK && hw_cfg->dout_hiz >= 0)
@@ -1017,9 +1012,31 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 	return 0;
 }
 
+static const struct snd_soc_dapm_route cs35l41_ext_bst_routes[] = {
+	{"Main AMP", NULL, "VSPK"},
+};
+
+static const struct snd_soc_dapm_widget cs35l41_ext_bst_widget[] = {
+	SND_SOC_DAPM_SUPPLY("VSPK", CS35L41_GPIO1_CTRL1, CS35L41_GPIO_LVL_SHIFT, 0, NULL, 0),
+};
+
 static int cs35l41_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	int ret;
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST) {
+		ret = snd_soc_dapm_new_controls(dapm, cs35l41_ext_bst_widget,
+						ARRAY_SIZE(cs35l41_ext_bst_widget));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(dapm, cs35l41_ext_bst_routes,
+					      ARRAY_SIZE(cs35l41_ext_bst_routes));
+		if (ret)
+			return ret;
+	}
 
 	return wm_adsp2_component_probe(&cs35l41->dsp, component);
 }
@@ -1084,6 +1101,10 @@ static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cf
 	unsigned int val;
 	int ret;
 
+	ret = device_property_read_u32(dev, "cirrus,boost-type", &val);
+	if (ret >= 0)
+		hw_cfg->bst_type = val;
+
 	ret = device_property_read_u32(dev, "cirrus,boost-peak-milliamp", &val);
 	if (ret >= 0)
 		hw_cfg->bst_ipk = val;
@@ -1376,6 +1397,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 
 	wm_adsp2_remove(&cs35l41->dsp);
 err:
+	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 	regulator_bulk_disable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
 	gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 
@@ -1390,6 +1412,7 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
 
 	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
 	wm_adsp2_remove(&cs35l41->dsp);
+	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 
 	pm_runtime_put_noidle(cs35l41->dev);
 
@@ -1409,6 +1432,7 @@ static int __maybe_unused cs35l41_runtime_suspend(struct device *dev)
 
 	dev_dbg(cs35l41->dev, "Enter hibernate\n");
 
+	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 	regmap_write(cs35l41->regmap, CS35L41_WAKESRC_CTL, 0x0088);
 	regmap_write(cs35l41->regmap, CS35L41_WAKESRC_CTL, 0x0188);
 
@@ -1505,6 +1529,7 @@ static int __maybe_unused cs35l41_runtime_resume(struct device *dev)
 		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
 		return ret;
 	}
+	cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41->hw_cfg);
 
 	return 0;
 }
-- 
2.35.1

