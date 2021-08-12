Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FDB3EAD5D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 00:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79EBE18DF;
	Fri, 13 Aug 2021 00:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79EBE18DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628808513;
	bh=+NHDNYYwx2L4IFKd9m9GbRNZUb+ZEfavoiQ/9LlEz4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zzutocq5j1Bon89mbw44wY4nPbHpK64qe3+q2Ht42zq6prhsBWrjM+aH5NJLYZqJs
	 55Jq4vaSiyK26fa0W+mCIEVHxI8oIOiiJv7VTkolWUdc5/ebm+9063vKK+eeXeXVL6
	 9+YMpTm1vDKz0N1gslxkEkh4ICRny3i5Vujae9lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3DA1F80506;
	Fri, 13 Aug 2021 00:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE1E8F804E3; Fri, 13 Aug 2021 00:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC631F8025D
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 00:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC631F8025D
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212349766"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="212349766"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="517647210"
Received: from evanklei-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.110])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 8/8] ASoC: Intel: boards: use software node API in Atom
 boards
Date: Thu, 12 Aug 2021 17:44:43 -0500
Message-Id: <20210812224443.170144-9-pierre-louis.bossart@linux.intel.com>
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

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The function device_add_properties() is going to be removed.
Replacing it with software node API equivalents.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 16 +++++++++++++---
 sound/soc/intel/boards/bytcr_rt5640.c  | 15 ++++++++++++---
 sound/soc/intel/boards/bytcr_rt5651.c  | 23 ++++++++++++++++++-----
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 5e1d30094250..aa45dd6e6f3e 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -462,6 +462,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	const struct dmi_system_id *dmi_id;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_acpi_mach *mach;
+	struct fwnode_handle *fwnode;
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
@@ -548,7 +549,16 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
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
@@ -615,7 +625,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	return 0;
 
 err:
-	device_remove_properties(priv->codec_dev);
+	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return ret;
 }
@@ -626,7 +636,7 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_put(priv->speaker_en_gpio);
-	device_remove_properties(priv->codec_dev);
+	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return 0;
 }
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 08cc907adf8a..3eda3b1eb169 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -974,6 +974,7 @@ static int byt_rt5640_add_codec_device_props(struct device *i2c_dev,
 					     struct byt_rt5640_private *priv)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
 	int ret, cnt = 0;
 
 	switch (BYT_RT5640_MAP(byt_rt5640_quirk)) {
@@ -1014,7 +1015,15 @@ static int byt_rt5640_add_codec_device_props(struct device *i2c_dev,
 	if (byt_rt5640_quirk & BYT_RT5640_JD_NOT_INV)
 		props[cnt++] = PROPERTY_ENTRY_BOOL("realtek,jack-detect-not-inverted");
 
-	ret = device_add_properties(i2c_dev, props);
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode)) {
+		/* put_device() is handled in caller */
+		return PTR_ERR(fwnode);
+	}
+
+	ret = device_add_software_node(i2c_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
 
 	return ret;
 }
@@ -1586,7 +1595,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	return ret_val;
 
 err:
-	device_remove_properties(priv->codec_dev);
+	device_remove_software_node(priv->codec_dev);
 err_device:
 	put_device(priv->codec_dev);
 	return ret_val;
@@ -1597,7 +1606,7 @@ static int snd_byt_rt5640_mc_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
 
-	device_remove_properties(priv->codec_dev);
+	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return 0;
 }
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index cc1505e53b4f..e94c9124d4f4 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -528,10 +528,13 @@ static const struct dmi_system_id byt_rt5651_quirk_table[] = {
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
@@ -548,7 +551,17 @@ static int byt_rt5651_add_codec_device_props(struct device *i2c_dev)
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
+
+	return ret;
 }
 
 static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
@@ -995,7 +1008,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	}
 
 	/* Must be called before register_card, also see declaration comment. */
-	ret_val = byt_rt5651_add_codec_device_props(codec_dev);
+	ret_val = byt_rt5651_add_codec_device_props(codec_dev, priv);
 	if (ret_val)
 		goto err_device;
 
@@ -1125,7 +1138,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	return ret_val;
 
 err:
-	device_remove_properties(priv->codec_dev);
+	device_remove_software_node(priv->codec_dev);
 err_device:
 	put_device(priv->codec_dev);
 	return ret_val;
@@ -1136,7 +1149,7 @@ static int snd_byt_rt5651_mc_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
 
-	device_remove_properties(priv->codec_dev);
+	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return 0;
 }
-- 
2.25.1

