Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA22647DB
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 16:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F89616C7;
	Thu, 10 Sep 2020 16:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F89616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599747536;
	bh=uP1j1rDdfs4WA3LqGBeDpRQhW1w2PIGmYAnZFJWKoNs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YuY/CIg2dX8aqNrArXnrc85bLhl/ZhWnaDh6lWwtUzK8myrpkF21v0o/cSdfwLX5K
	 hdRUHVHtUzZZyEMJuf44DKRs/qz0LcKBNaR/aCPtMrmUB3KZuUO6Ewlgu8nYFn+T3p
	 lqnLcQsIeUHlzc3YwEG16pECNcNG26YfT4D2Xrvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25EECF801F2;
	Thu, 10 Sep 2020 16:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79386F80264; Thu, 10 Sep 2020 16:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F04EF800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 16:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F04EF800E9
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 784D020182C;
 Thu, 10 Sep 2020 16:17:04 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 940D0200788;
 Thu, 10 Sep 2020 16:17:01 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E0D26402CA;
 Thu, 10 Sep 2020 16:16:57 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ak4458: Add DSD support for ak4458 and ak4497
Date: Thu, 10 Sep 2020 22:10:32 +0800
Message-Id: <1599747032-20055-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

ak4458 can't support DSD512 format, but ak4497 can, so add
a new variable in ak4458_drvdata to distinguish these two
platform.

In hw_params(), calculate bit clock according to different DSD
format and configure DSD register.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 82 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/ak4458.h |  5 ++-
 2 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 763e6839428f..9054964d5cfa 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -31,11 +31,13 @@ static const char *ak4458_supply_names[AK4458_NUM_SUPPLIES] = {
 struct ak4458_drvdata {
 	struct snd_soc_dai_driver *dai_drv;
 	const struct snd_soc_component_driver *comp_drv;
+	bool  dsd512;	/* DSD512 is supported or not */
 };
 
 /* AK4458 Codec Private Data */
 struct ak4458_priv {
 	struct regulator_bulk_data supplies[AK4458_NUM_SUPPLIES];
+	const struct ak4458_drvdata *drvdata;
 	struct device *dev;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpiod;
@@ -136,6 +138,10 @@ static const char * const ak4458_ats_select_texts[] = {
 /* DIF2 bit Audio Interface Format Setting(BICK fs) */
 static const char * const ak4458_dif_select_texts[] = {"32fs,48fs", "64fs",};
 
+/* DSD input pin select */
+static const char * const ak4497_dsd_input_path_select[] = {
+	"16_17_19pin", "3_4_5pin"};
+
 static const struct soc_enum ak4458_dac1_dem_enum =
 	SOC_ENUM_SINGLE(AK4458_01_CONTROL2, 1,
 			ARRAY_SIZE(ak4458_dem_select_texts),
@@ -175,6 +181,10 @@ static const struct soc_enum ak4458_dif_enum =
 	SOC_ENUM_SINGLE(AK4458_00_CONTROL1, 3,
 			ARRAY_SIZE(ak4458_dif_select_texts),
 			ak4458_dif_select_texts);
+static const struct soc_enum ak4497_dsdp_enum =
+	SOC_ENUM_SINGLE(AK4458_09_DSD2, 2,
+			ARRAY_SIZE(ak4497_dsd_input_path_select),
+			ak4497_dsd_input_path_select);
 
 static int get_digfil(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
@@ -282,6 +292,7 @@ static const struct snd_kcontrol_new ak4497_snd_controls[] = {
 	SOC_ENUM("AK4497 Sound Mode", ak4458_sm_enum),
 	SOC_ENUM("AK4497 Attenuation transition Time Setting",
 		 ak4458_ats_enum),
+	SOC_ENUM("AK4497 DSD Data Input Pin", ak4497_dsdp_enum),
 };
 
 /* ak4497 dapm widgets */
@@ -325,12 +336,54 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 	int pcm_width = max(params_physical_width(params), ak4458->slot_width);
-	int nfs1;
-	u8 format;
+	u8 format, dsdsel0, dsdsel1;
+	int nfs1, dsd_bclk;
 
 	nfs1 = params_rate(params);
 	ak4458->fs = nfs1;
 
+	/* calculate bit clock */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_DSD_U8:
+	case SNDRV_PCM_FORMAT_DSD_U16_LE:
+	case SNDRV_PCM_FORMAT_DSD_U16_BE:
+	case SNDRV_PCM_FORMAT_DSD_U32_LE:
+	case SNDRV_PCM_FORMAT_DSD_U32_BE:
+		dsd_bclk = nfs1 * params_physical_width(params);
+		switch (dsd_bclk) {
+		case 2822400:
+			dsdsel0 = 0;
+			dsdsel1 = 0;
+			break;
+		case 5644800:
+			dsdsel0 = 1;
+			dsdsel1 = 0;
+			break;
+		case 11289600:
+			dsdsel0 = 0;
+			dsdsel1 = 1;
+			break;
+		case 22579200:
+			if (ak4458->drvdata->dsd512) {
+				dsdsel0 = 1;
+				dsdsel1 = 1;
+			} else {
+				dev_err(dai->dev, "DSD512 not supported.\n");
+				return -EINVAL;
+			}
+			break;
+		default:
+			dev_err(dai->dev, "Unsupported dsd bclk.\n");
+			return -EINVAL;
+		}
+
+		snd_soc_component_update_bits(component, AK4458_06_DSD1,
+					      AK4458_DSDSEL_MASK, dsdsel0);
+		snd_soc_component_update_bits(component, AK4458_09_DSD2,
+					      AK4458_DSDSEL_MASK, dsdsel1);
+		break;
+	}
+
 	/* Master Clock Frequency Auto Setting Mode Enable */
 	snd_soc_component_update_bits(component, AK4458_00_CONTROL1, 0x80, 0x80);
 
@@ -355,6 +408,9 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 		case SND_SOC_DAIFMT_DSP_B:
 			format = AK4458_DIF_32BIT_MSB;
 			break;
+		case SND_SOC_DAIFMT_PDM:
+			format = AK4458_DIF_32BIT_MSB;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -393,6 +449,7 @@ static int ak4458_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
+	case SND_SOC_DAIFMT_PDM:
 		ak4458->fmt = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 		break;
 	default:
@@ -401,6 +458,12 @@ static int ak4458_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
+	/* DSD mode */
+	snd_soc_component_update_bits(component, AK4458_02_CONTROL3,
+				      AK4458_DP_MASK,
+				      ak4458->fmt == SND_SOC_DAIFMT_PDM ?
+				      AK4458_DP_MASK : 0);
+
 	ak4458_rstn_control(component, 0);
 	ak4458_rstn_control(component, 1);
 
@@ -472,7 +535,10 @@ static int ak4458_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 
 #define AK4458_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE |\
-			 SNDRV_PCM_FMTBIT_S32_LE)
+			 SNDRV_PCM_FMTBIT_S32_LE |\
+			 SNDRV_PCM_FMTBIT_DSD_U8 |\
+			 SNDRV_PCM_FMTBIT_DSD_U16_LE |\
+			 SNDRV_PCM_FMTBIT_DSD_U32_LE)
 
 static const unsigned int ak4458_rates[] = {
 	8000, 11025,  16000, 22050,
@@ -668,11 +734,13 @@ static const struct regmap_config ak4458_regmap = {
 static const struct ak4458_drvdata ak4458_drvdata = {
 	.dai_drv = &ak4458_dai,
 	.comp_drv = &soc_codec_dev_ak4458,
+	.dsd512 = false,
 };
 
 static const struct ak4458_drvdata ak4497_drvdata = {
 	.dai_drv = &ak4497_dai,
 	.comp_drv = &soc_codec_dev_ak4497,
+	.dsd512 = true,
 };
 
 static const struct dev_pm_ops ak4458_pm = {
@@ -684,7 +752,6 @@ static const struct dev_pm_ops ak4458_pm = {
 static int ak4458_i2c_probe(struct i2c_client *i2c)
 {
 	struct ak4458_priv *ak4458;
-	const struct ak4458_drvdata *drvdata;
 	int ret, i;
 
 	ak4458 = devm_kzalloc(&i2c->dev, sizeof(*ak4458), GFP_KERNEL);
@@ -698,7 +765,7 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 	i2c_set_clientdata(i2c, ak4458);
 	ak4458->dev = &i2c->dev;
 
-	drvdata = of_device_get_match_data(&i2c->dev);
+	ak4458->drvdata = of_device_get_match_data(&i2c->dev);
 
 	ak4458->reset_gpiod = devm_gpiod_get_optional(ak4458->dev, "reset",
 						      GPIOD_OUT_LOW);
@@ -720,8 +787,9 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	ret = devm_snd_soc_register_component(ak4458->dev, drvdata->comp_drv,
-					      drvdata->dai_drv, 1);
+	ret = devm_snd_soc_register_component(ak4458->dev,
+					      ak4458->drvdata->comp_drv,
+					      ak4458->drvdata->dai_drv, 1);
 	if (ret < 0) {
 		dev_err(ak4458->dev, "Failed to register CODEC: %d\n", ret);
 		return ret;
diff --git a/sound/soc/codecs/ak4458.h b/sound/soc/codecs/ak4458.h
index f906215f7e4e..9548c5d78621 100644
--- a/sound/soc/codecs/ak4458.h
+++ b/sound/soc/codecs/ak4458.h
@@ -83,4 +83,7 @@
 #define AK4458_ATS_SHIFT	6
 #define AK4458_ATS_MASK		GENMASK(7, 6)
 
-#endif /* _AK4458_H */
+#define AK4458_DSDSEL_MASK		(0x1 << 0)
+#define AK4458_DP_MASK			(0x1 << 7)
+
+#endif
-- 
2.27.0

