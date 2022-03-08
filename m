Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B84D2191
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F871900;
	Tue,  8 Mar 2022 20:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F871900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767978;
	bh=wFGi6BRru0zkGxuUmc27uhyHXzmyF+yFtfxSIEMV9qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGHrtC4Ow2L3pw2yLkpH8io+mOrm1/G3jWTPH8a9Ooi3D6kAxHt8y0/5dT+kM3ebj
	 8DJnZZszEKJjXQ6uEbMB3dBrsN3mjJUes3gQBiTl5XeDsvb8KqZdTfM4VYXuJUuSCS
	 zRu5IUxSYxO5boi8pUX96xMDW074LeFIAfvIMhY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9D1F805A9;
	Tue,  8 Mar 2022 20:27:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02FDAF8051E; Tue,  8 Mar 2022 20:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86556F80528
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86556F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XJlC0eWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767614; x=1678303614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wFGi6BRru0zkGxuUmc27uhyHXzmyF+yFtfxSIEMV9qg=;
 b=XJlC0eWSE+6AXy25goOOhoorvx1SnelMH3zX1ik5dDIa8Xg7PHuNEJQg
 JD33aN5q+YC5TMOMp3Y4qKeAMK2GWAntknYDUBc0syn5t/PPuxtuntj6Z
 8pMUoOgncCqcBgdNjH2z0ZDUt4+U/XVIiAkcNBO0QlgG0yIy8PD4/2QG5
 wM4U3Qia5dCvqcTQ6p3o6guNZCtItA/t1oFmEbXpBdF/gpfOr8Vqshav5
 lSrZdxY7pDe5xyzSDbBWHwuUlkzs4QHaPpsj3YGEhEc9OMeek0AEhfTZX
 Z9ABzbXXQSxKxT+GRWBtNBTDDX7/NyvArPHA3bYQVAjeoPy6Et58CetGP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363748"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363748"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573994"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/20] ASoC: Intel: sof_es8336: add support for JD inverted
 quirk
Date: Tue,  8 Mar 2022 13:26:07 -0600
Message-Id: <20220308192610.392950-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The codec driver exposes a set of properties that can be set from the
machine driver - as done in bytcht_es8316.c

Start by adding the JD_INVERTED quirk.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 40 ++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index d7dff61c9ba8..932a80e62bc8 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -21,11 +21,15 @@
 #include <sound/soc-acpi.h>
 #include "hda_dsp_common.h"
 
+/* jd-inv + terminating entry */
+#define MAX_NO_PROPS 2
+
 #define SOF_ES8336_SSP_CODEC(quirk)		((quirk) & GENMASK(3, 0))
 #define SOF_ES8336_SSP_CODEC_MASK		(GENMASK(3, 0))
 
 #define SOF_ES8336_TGL_GPIO_QUIRK		BIT(4)
 #define SOF_ES8336_ENABLE_DMIC			BIT(5)
+#define SOF_ES8336_JD_INVERTED			BIT(6)
 
 static unsigned long quirk;
 
@@ -69,6 +73,8 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk DMIC enabled\n");
 	if (quirk & SOF_ES8336_TGL_GPIO_QUIRK)
 		dev_info(dev, "quirk TGL GPIO enabled\n");
+	if (quirk & SOF_ES8336_JD_INVERTED)
+		dev_info(dev, "quirk JD inverted enabled\n");
 }
 
 static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
@@ -461,10 +467,13 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
+	struct property_entry props[MAX_NO_PROPS] = {};
 	struct sof_es8336_private *priv;
+	struct fwnode_handle *fwnode;
 	struct acpi_device *adev;
 	struct snd_soc_dai_link *dai_links;
 	struct device *codec_dev;
+	unsigned int cnt = 0;
 	int dmic_be_num = 0;
 	int hdmi_num = 3;
 	int ret;
@@ -530,6 +539,9 @@ static int sof_es8336_probe(struct platform_device *pdev)
 			 "i2c-%s", acpi_dev_name(adev));
 		put_device(&adev->dev);
 		dai_links[0].codecs->name = codec_name;
+	} else {
+		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
+		return -ENXIO;
 	}
 
 	ret = snd_soc_fixup_dai_links_platform_name(&sof_es8336_card,
@@ -542,6 +554,26 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	priv->codec_dev = get_device(codec_dev);
 
+	if (quirk & SOF_ES8336_JD_INVERTED)
+		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
+
+	if (cnt) {
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
+		if (ret) {
+			put_device(codec_dev);
+			return ret;
+		}
+	}
+
 	/* get speaker enable GPIO */
 	ret = devm_acpi_dev_add_driver_gpios(codec_dev, gpio_mapping);
 	if (ret)
@@ -551,7 +583,7 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->gpio_pa)) {
 		ret = dev_err_probe(dev, PTR_ERR(priv->gpio_pa),
 				    "could not get pa-enable GPIO\n");
-		goto err;
+		goto err_put_codec;
 	}
 
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
@@ -562,12 +594,13 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	if (ret) {
 		gpiod_put(priv->gpio_pa);
 		dev_err(dev, "snd_soc_register_card failed: %d\n", ret);
-		goto err;
+		goto err_put_codec;
 	}
 	platform_set_drvdata(pdev, &sof_es8336_card);
 	return 0;
 
-err:
+err_put_codec:
+	device_remove_software_node(priv->codec_dev);
 	put_device(codec_dev);
 	return ret;
 }
@@ -578,6 +611,7 @@ static int sof_es8336_remove(struct platform_device *pdev)
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_put(priv->gpio_pa);
+	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
 
 	return 0;
-- 
2.30.2

