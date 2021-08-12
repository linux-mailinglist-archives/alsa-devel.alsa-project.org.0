Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8A3EAD55
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 00:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D99261932;
	Fri, 13 Aug 2021 00:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D99261932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628808421;
	bh=OdUZb2CqdX1vxCKygkyz+EgiMxVx8XwY4tBggro7QLs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqmu/uucssbBHe8cvZXP/+O4VE1hQYe1TCm8puP1L3eFklSqMgpHRFYTVVjMPtxHN
	 N0g6dz5Xo4ktB2fRkje++ONz4NkVonQFv54og7fLGRbzh2ZViwmJ7m88pLKYnJWk0S
	 odAoyca4Z/wEGxMLPnUGm5xvp5JFsb6kJES6zlnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09943F804E2;
	Fri, 13 Aug 2021 00:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF8E9F804E3; Fri, 13 Aug 2021 00:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C35F80245
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 00:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C35F80245
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212349751"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="212349751"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="517647185"
Received: from evanklei-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.110])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/8] ASoC: Intel: boards: harden codec property handling
Date: Thu, 12 Aug 2021 17:44:36 -0500
Message-Id: <20210812224443.170144-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
References: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
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

In current ACPI-based devices, the DSDT does not include any of the
properties required by the codec driver. This is not an ACPI
limitation proper since the _DSD method could be used, as done for
Camera and SoundWire in newer platforms. For legacy devices, there is
unfortunately no other option than using a work-around: we add
properties to the codec device from the machine driver.

To avoid any issues with the codec driver being unbound, we need to
keep a reference to the codec device until the card is removed.

Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 12 ++++++--
 sound/soc/intel/boards/bytcr_rt5640.c  | 41 ++++++++++++++++++--------
 sound/soc/intel/boards/bytcr_rt5651.c  | 37 +++++++++++++++--------
 3 files changed, 62 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index a0af91580184..fcf7c9c04069 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -37,6 +37,7 @@ struct byt_cht_es8316_private {
 	struct clk *mclk;
 	struct snd_soc_jack jack;
 	struct gpio_desc *speaker_en_gpio;
+	struct device *codec_dev;
 	bool speaker_en;
 };
 
@@ -555,7 +556,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		gpiod_get_index(codec_dev, "speaker-enable", 0,
 				/* see comment in byt_cht_es8316_resume */
 				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-	put_device(codec_dev);
+	priv->codec_dev = codec_dev;
 
 	if (IS_ERR(priv->speaker_en_gpio)) {
 		ret = PTR_ERR(priv->speaker_en_gpio);
@@ -567,7 +568,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 			dev_err(dev, "get speaker GPIO failed: %d\n", ret);
 			fallthrough;
 		case -EPROBE_DEFER:
-			return ret;
+			goto err;
 		}
 	}
 
@@ -605,10 +606,14 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
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
+	put_device(priv->codec_dev);
+	return ret;
 }
 
 static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
@@ -617,6 +622,7 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_put(priv->speaker_en_gpio);
+	put_device(priv->codec_dev);
 	return 0;
 }
 
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index d51bd22073df..808bfb7fd81e 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -90,6 +90,7 @@ enum {
 struct byt_rt5640_private {
 	struct snd_soc_jack jack;
 	struct clk *mclk;
+	struct device *codec_dev;
 };
 static bool is_bytcr;
 
@@ -969,16 +970,12 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
  * Note this MUST be called before snd_soc_register_card(), so that the props
  * are in place before the codec component driver's probe function parses them.
  */
-static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name)
+static int byt_rt5640_add_codec_device_props(struct device *i2c_dev,
+					     struct byt_rt5640_private *priv)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
-	struct device *i2c_dev;
 	int ret, cnt = 0;
 
-	i2c_dev = bus_find_device_by_name(&i2c_bus_type, NULL, i2c_dev_name);
-	if (!i2c_dev)
-		return -EPROBE_DEFER;
-
 	switch (BYT_RT5640_MAP(byt_rt5640_quirk)) {
 	case BYT_RT5640_DMIC1_MAP:
 		props[cnt++] = PROPERTY_ENTRY_U32("realtek,dmic1-data-pin",
@@ -1018,7 +1015,6 @@ static int byt_rt5640_add_codec_device_props(const char *i2c_dev_name)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
 
 	ret = device_add_properties(i2c_dev, props);
-	put_device(i2c_dev);
 
 	return ret;
 }
@@ -1367,6 +1363,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
 	struct acpi_device *adev;
+	struct device *codec_dev;
 	bool sof_parent;
 	int ret_val = 0;
 	int dai_index = 0;
@@ -1475,10 +1472,16 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		byt_rt5640_quirk = quirk_override;
 	}
 
+	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL, byt_rt5640_codec_name);
+	if (!codec_dev)
+		return -EPROBE_DEFER;
+
+	priv->codec_dev = codec_dev;
+
 	/* Must be called before register_card, also see declaration comment. */
-	ret_val = byt_rt5640_add_codec_device_props(byt_rt5640_codec_name);
+	ret_val = byt_rt5640_add_codec_device_props(codec_dev, priv);
 	if (ret_val)
-		return ret_val;
+		goto err;
 
 	log_quirks(&pdev->dev);
 
@@ -1509,7 +1512,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 			 * for all other errors, including -EPROBE_DEFER
 			 */
 			if (ret_val != -ENOENT)
-				return ret_val;
+				goto err;
 			byt_rt5640_quirk &= ~BYT_RT5640_MCLK_EN;
 		}
 	}
@@ -1553,7 +1556,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5640_card,
 							platform_name);
 	if (ret_val)
-		return ret_val;
+		goto err;
 
 	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
 
@@ -1575,10 +1578,23 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
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
+	put_device(priv->codec_dev);
+	return ret_val;
+}
+
+static int snd_byt_rt5640_mc_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
+
+	put_device(priv->codec_dev);
+	return 0;
 }
 
 static struct platform_driver snd_byt_rt5640_mc_driver = {
@@ -1586,6 +1602,7 @@ static struct platform_driver snd_byt_rt5640_mc_driver = {
 		.name = "bytcr_rt5640",
 	},
 	.probe = snd_byt_rt5640_mc_probe,
+	.remove = snd_byt_rt5640_mc_remove
 };
 
 module_platform_driver(snd_byt_rt5640_mc_driver);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index e13c0c63a949..7033c07f8fd6 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -85,6 +85,7 @@ struct byt_rt5651_private {
 	struct gpio_desc *ext_amp_gpio;
 	struct gpio_desc *hp_detect;
 	struct snd_soc_jack jack;
+	struct device *codec_dev;
 };
 
 static const struct acpi_gpio_mapping *byt_rt5651_gpios;
@@ -993,12 +994,12 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_quirk = quirk_override;
 	}
 
+	priv->codec_dev = codec_dev;
+
 	/* Must be called before register_card, also see declaration comment. */
 	ret_val = byt_rt5651_add_codec_device_props(codec_dev);
-	if (ret_val) {
-		put_device(codec_dev);
-		return ret_val;
-	}
+	if (ret_val)
+		goto err;
 
 	/* Cherry Trail devices use an external amplifier enable gpio */
 	if (soc_intel_is_cht() && !byt_rt5651_gpios)
@@ -1022,8 +1023,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 					ret_val);
 				fallthrough;
 			case -EPROBE_DEFER:
-				put_device(codec_dev);
-				return ret_val;
+				goto err;
 			}
 		}
 		priv->hp_detect = devm_fwnode_gpiod_get(&pdev->dev,
@@ -1042,14 +1042,11 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 					ret_val);
 				fallthrough;
 			case -EPROBE_DEFER:
-				put_device(codec_dev);
-				return ret_val;
+				goto err;
 			}
 		}
 	}
 
-	put_device(codec_dev);
-
 	log_quirks(&pdev->dev);
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP2_AIF2) ||
@@ -1073,7 +1070,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 			 * for all other errors, including -EPROBE_DEFER
 			 */
 			if (ret_val != -ENOENT)
-				return ret_val;
+				goto err;
 			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;
 		}
 	}
@@ -1102,7 +1099,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	ret_val = snd_soc_fixup_dai_links_platform_name(&byt_rt5651_card,
 							platform_name);
 	if (ret_val)
-		return ret_val;
+		goto err;
 
 	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
 
@@ -1124,10 +1121,23 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
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
+	put_device(priv->codec_dev);
+	return ret_val;
+}
+
+static int snd_byt_rt5651_mc_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
+
+	put_device(priv->codec_dev);
+	return 0;
 }
 
 static struct platform_driver snd_byt_rt5651_mc_driver = {
@@ -1135,6 +1145,7 @@ static struct platform_driver snd_byt_rt5651_mc_driver = {
 		.name = "bytcr_rt5651",
 	},
 	.probe = snd_byt_rt5651_mc_probe,
+	.remove = snd_byt_rt5651_mc_remove,
 };
 
 module_platform_driver(snd_byt_rt5651_mc_driver);
-- 
2.25.1

