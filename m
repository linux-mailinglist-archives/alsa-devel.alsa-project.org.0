Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D53EAD64
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 00:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B431F1934;
	Fri, 13 Aug 2021 00:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B431F1934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628808592;
	bh=DxdKR+nkV42B/ZuYXbhclHOT3aelIAyBubWS4frK464=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lpl31DRjDnSZ0t7kKbPa+f0nAAn1FrxtAk4EGO8jdAnC2+lreoYACsR1qS19Vf9UU
	 lu2wUQ8dCNKsDyKDRCcn9zK8CfT3sfFuQzSZMuPJR1OfZyYylPQOwCPrKUtW0j3hek
	 Pm/4L+m7zWAiqDyiRaeScwEhYGxFMRadOdOz6Tas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF41F80520;
	Fri, 13 Aug 2021 00:45:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A017DF80511; Fri, 13 Aug 2021 00:45:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 382C6F804E1
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 00:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 382C6F804E1
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212349765"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="212349765"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="517647204"
Received: from evanklei-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.110])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 15:45:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 7/8] ASoC: Intel: remove device_properties for Atom boards
Date: Thu, 12 Aug 2021 17:44:42 -0500
Message-Id: <20210812224443.170144-8-pierre-louis.bossart@linux.intel.com>
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

Prepare the transition to the software node API by removing device
properties in the probe error handling and .remove callback.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 2 ++
 sound/soc/intel/boards/bytcr_rt5640.c  | 5 ++++-
 sound/soc/intel/boards/bytcr_rt5651.c  | 5 ++++-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 34bdae45da73..5e1d30094250 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -615,6 +615,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	return 0;
 
 err:
+	device_remove_properties(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return ret;
 }
@@ -625,6 +626,7 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_put(priv->speaker_en_gpio);
+	device_remove_properties(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return 0;
 }
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index fbe75c77e4ca..08cc907adf8a 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1483,7 +1483,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	/* Must be called before register_card, also see declaration comment. */
 	ret_val = byt_rt5640_add_codec_device_props(codec_dev, priv);
 	if (ret_val)
-		goto err;
+		goto err_device;
 
 	log_quirks(&pdev->dev);
 
@@ -1586,6 +1586,8 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	return ret_val;
 
 err:
+	device_remove_properties(priv->codec_dev);
+err_device:
 	put_device(priv->codec_dev);
 	return ret_val;
 }
@@ -1595,6 +1597,7 @@ static int snd_byt_rt5640_mc_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
 
+	device_remove_properties(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return 0;
 }
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index c70dd729cdbb..cc1505e53b4f 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -997,7 +997,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	/* Must be called before register_card, also see declaration comment. */
 	ret_val = byt_rt5651_add_codec_device_props(codec_dev);
 	if (ret_val)
-		goto err;
+		goto err_device;
 
 	/* Cherry Trail devices use an external amplifier enable gpio */
 	if (soc_intel_is_cht() && !byt_rt5651_gpios)
@@ -1125,6 +1125,8 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	return ret_val;
 
 err:
+	device_remove_properties(priv->codec_dev);
+err_device:
 	put_device(priv->codec_dev);
 	return ret_val;
 }
@@ -1134,6 +1136,7 @@ static int snd_byt_rt5651_mc_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
 
+	device_remove_properties(priv->codec_dev);
 	put_device(priv->codec_dev);
 	return 0;
 }
-- 
2.25.1

