Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634B39E9AC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E701916A1;
	Tue,  8 Jun 2021 00:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E701916A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623105429;
	bh=usYC0wDWsbJMpvlQbWQVaSzKliOfq8MpuDjOOXfbF88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxNNHt6aZPIKUQO319IjxmqmfZ3HCW2+QLNH9kP626/wepCNmA8qrxXBP7JT8P/f7
	 xAg4xo0n0v4no0aEIXr6+72IkBTa/wZjQtdu5bozVO98Eeppk1oJkeOJejig9pMamY
	 ZxtGeAf4s1vbfMTpCllq6wKOFd6epvVwPIvQSbT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5960F80212;
	Tue,  8 Jun 2021 00:35:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F1EF8032C; Tue,  8 Jun 2021 00:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE16DF800AF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE16DF800AF
IronPort-SDR: vXyk7LScCcOdAG82BIAQu61RDigJzD+bT9oeVpb3ygyEmuaCKqmbTJx7LH4H3MwEM0sXtHN8fT
 jgOdNScsrvzw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="290356237"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="290356237"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:35:15 -0700
IronPort-SDR: vWKgNMrCMK9n9zSb7sPf7CO3wqokRkzq9BZHZdr+S7GNkDk/FyiYHLZLpHKiP9B5qrj1YnjZgZ
 miJpkd3oos/A==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="447659489"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:35:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: boards: use software node API in Atom boards
Date: Mon,  7 Jun 2021 17:35:03 -0500
Message-Id: <20210607223503.584379-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
References: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The function device_add_properties() is going to be removed.
Replacing it with software node API equivalents.

Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 25 ++++++++++++--
 sound/soc/intel/boards/bytcr_rt5640.c  | 42 +++++++++++++++++++----
 sound/soc/intel/boards/bytcr_rt5651.c  | 47 +++++++++++++++++++++-----
 3 files changed, 97 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index a0af91580184..ef8ed3ff53af 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -38,6 +38,7 @@ struct byt_cht_es8316_private {
 	struct snd_soc_jack jack;
 	struct gpio_desc *speaker_en_gpio;
 	bool speaker_en;
+	struct device *codec_dev;
 };
 
 enum {
@@ -461,6 +462,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	const struct dmi_system_id *dmi_id;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_acpi_mach *mach;
+	struct fwnode_handle *fwnode;
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
@@ -543,7 +545,16 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
 
 	if (cnt) {
-		ret = device_add_properties(codec_dev, props);
+		fwnode = fwnode_create_software_node(props, NULL);
+		if (IS_ERR(fwnode)) {
+			put_device(codec_dev);
+			return PTR_ERR(fwnode);
+		}
+
+		ret = device_add_software_node(codec_dev, to_software_node(fwnode));
+
+		fwnode_handle_put(fwnode);
+
 		if (ret) {
 			put_device(codec_dev);
 			return ret;
@@ -556,6 +567,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 				/* see comment in byt_cht_es8316_resume */
 				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	put_device(codec_dev);
+	priv->codec_dev = codec_dev;
 
 	if (IS_ERR(priv->speaker_en_gpio)) {
 		ret = PTR_ERR(priv->speaker_en_gpio);
@@ -567,7 +579,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 			dev_err(dev, "get speaker GPIO failed: %d\n", ret);
 			fallthrough;
 		case -EPROBE_DEFER:
-			return ret;
+			goto err;
 		}
 	}
 
@@ -605,10 +617,15 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	if (ret) {
 		gpiod_put(priv->speaker_en_gpio);
 		dev_err(dev, "snd_soc_register_card failed: %d\n", ret);
-		return ret;
+		goto err;
 	}
 	platform_set_drvdata(pdev, &byt_cht_es8316_card);
 	return 0;
+
+err:
+	device_remove_software_node(priv->codec_dev);
+
+	return ret;
 }
 
 static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
@@ -617,6 +634,8 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_put(priv->speaker_en_gpio);
+	device_remove_software_node(priv->codec_dev);
+
 	return 0;
 }
 
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 91a6d712eb58..b3597b0f6836 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -87,6 +87,7 @@ enum {
 struct byt_rt5640_private {
 	struct snd_soc_jack jack;
 	struct clk *mclk;
+	struct device *codec_dev;
 };
 static bool is_bytcr;
 
@@ -912,9 +913,11 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
  * Note this MUST be called before snd_soc_register_card(), so that the props
  * are in place before the codec component driver's probe function parses them.
  */
-static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name)
+static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name,
+					     struct byt_rt5640_private *priv)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
 	struct device *i2c_dev;
 	int ret, cnt = 0;
 
@@ -960,7 +963,18 @@ static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name)
 	if (byt_rt5640_quirk & BYT_RT5640_JD_NOT_INV)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
 
-	ret = device_add_properties(i2c_dev, props);
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode)) {
+		/* put_device() is not handled in caller */
+		put_device(i2c_dev);
+		return PTR_ERR(fwnode);
+	}
+
+	ret = device_add_software_node(i2c_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
+	priv->codec_dev = i2c_dev;
+
 	put_device(i2c_dev);
 
 	return ret;
@@ -1401,7 +1415,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	}
 
 	/* Must be called before register_card, also see declaration comment. */
-	ret_val = byt_rt5640_add_codec_device_props(byt_rt5640_codec_name);
+	ret_val = byt_rt5640_add_codec_device_props(byt_rt5640_codec_name, priv);
 	if (ret_val)
 		return ret_val;
 
@@ -1434,7 +1448,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 			 * for all other errors, including -EPROBE_DEFER
 			 */
 			if (ret_val != -ENOENT)
-				return ret_val;
+				goto err;
 			byt_rt5640_quirk &= ~BYT_RT5640_MCLK_EN;
 		}
 	}
@@ -1467,7 +1481,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5640_card,
 							platform_name);
 	if (ret_val)
-		return ret_val;
+		goto err;
 
 	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
 
@@ -1489,10 +1503,25 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	if (ret_val) {
 		dev_err(&pdev->dev, "devm_snd_soc_register_card failed %d\n",
 			ret_val);
-		return ret_val;
+		goto err;
 	}
 	platform_set_drvdata(pdev, &byt_rt5640_card);
 	return ret_val;
+
+err:
+	device_remove_software_node(priv->codec_dev);
+
+	return ret_val;
+}
+
+static int snd_byt_rt5640_mc_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
+
+	device_remove_software_node(priv->codec_dev);
+
+	return 0;
 }
 
 static struct platform_driver snd_byt_rt5640_mc_driver = {
@@ -1500,6 +1529,7 @@ static struct platform_driver snd_byt_rt5640_mc_driver = {
 		.name = "bytcr_rt5640",
 	},
 	.probe = snd_byt_rt5640_mc_probe,
+	.remove = snd_byt_rt5640_mc_remove
 };
 
 module_platform_driver(snd_byt_rt5640_mc_driver);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index e13c0c63a949..3066d00f3466 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -85,6 +85,7 @@ struct byt_rt5651_private {
 	struct gpio_desc *ext_amp_gpio;
 	struct gpio_desc *hp_detect;
 	struct snd_soc_jack jack;
+	struct device *codec_dev;
 };
 
 static const struct acpi_gpio_mapping *byt_rt5651_gpios;
@@ -527,10 +528,13 @@ static const struct dmi_system_id byt_rt5651_quirk_table[] = {
  * Note this MUST be called before snd_soc_register_card(), so that the props
  * are in place before the codec component driver's probe function parses them.
  */
-static int byt_rt5651_add_codec_device_props(struct device *i2c_dev)
+static int byt_rt5651_add_codec_device_props(struct device *i2c_dev,
+					     struct byt_rt5651_private *priv)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
 	int cnt = 0;
+	int ret;
 
 	props[cnt++] = PROPERTY_ENTRY_U32("realtek,jack-detect-source",
 				BYT_RT5651_JDSRC(byt_rt5651_quirk));
@@ -547,7 +551,18 @@ static int byt_rt5651_add_codec_device_props(struct device *i2c_dev)
 	if (byt_rt5651_quirk & BYT_RT5651_JD_NOT_INV)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
 
-	return device_add_properties(i2c_dev, props);
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode)) {
+		/* put_device(i2c_dev) is handled in caller */
+		return PTR_ERR(fwnode);
+	}
+
+	ret = device_add_software_node(i2c_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
+	priv->codec_dev = i2c_dev;
+
+	return ret;
 }
 
 static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
@@ -994,7 +1009,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	}
 
 	/* Must be called before register_card, also see declaration comment. */
-	ret_val = byt_rt5651_add_codec_device_props(codec_dev);
+	ret_val = byt_rt5651_add_codec_device_props(codec_dev, priv);
 	if (ret_val) {
 		put_device(codec_dev);
 		return ret_val;
@@ -1023,7 +1038,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 				fallthrough;
 			case -EPROBE_DEFER:
 				put_device(codec_dev);
-				return ret_val;
+				goto err;
 			}
 		}
 		priv->hp_detect = devm_fwnode_gpiod_get(&pdev->dev,
@@ -1043,7 +1058,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 				fallthrough;
 			case -EPROBE_DEFER:
 				put_device(codec_dev);
-				return ret_val;
+				goto err;
 			}
 		}
 	}
@@ -1073,7 +1088,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 			 * for all other errors, including -EPROBE_DEFER
 			 */
 			if (ret_val != -ENOENT)
-				return ret_val;
+				goto err;
 			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;
 		}
 	}
@@ -1102,7 +1117,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5651_card,
 							platform_name);
 	if (ret_val)
-		return ret_val;
+		goto err;
 
 	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
 
@@ -1124,10 +1139,25 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	if (ret_val) {
 		dev_err(&pdev->dev, "devm_snd_soc_register_card failed %d\n",
 			ret_val);
-		return ret_val;
+		goto err;
 	}
 	platform_set_drvdata(pdev, &byt_rt5651_card);
 	return ret_val;
+
+err:
+	device_remove_software_node(priv->codec_dev);
+
+	return ret_val;
+}
+
+static int snd_byt_rt5651_mc_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
+
+	device_remove_software_node(priv->codec_dev);
+
+	return 0;
 }
 
 static struct platform_driver snd_byt_rt5651_mc_driver = {
@@ -1135,6 +1165,7 @@ static struct platform_driver snd_byt_rt5651_mc_driver = {
 		.name = "bytcr_rt5651",
 	},
 	.probe = snd_byt_rt5651_mc_probe,
+	.remove = snd_byt_rt5651_mc_remove,
 };
 
 module_platform_driver(snd_byt_rt5651_mc_driver);
-- 
2.25.1

