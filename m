Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E6544DD4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:37:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5E6B1ACC;
	Thu,  9 Jun 2022 15:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5E6B1ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781871;
	bh=bDAlvYHEeUUAeWe8+rnRMO2QQto1n8rp+2xEHobkNOQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2Cl8u5MUQk4ENE5qwvYFLDfAmRJEZqHlZZbeDWyUDJyW1ta76plgvLLR+m5hwsID
	 kxcDXHP2T3btwR8TW7rR8c8kztN3gEXazdwJRqz8g3r+R9DDga39X538x+ifWkai12
	 3F6xAav50LlTJcksgWSuF1TxULss93Q+2+MoRkwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91757F80539;
	Thu,  9 Jun 2022 15:35:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0722F8052D; Thu,  9 Jun 2022 15:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BEC6F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BEC6F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mTnhd/RD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781748; x=1686317748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bDAlvYHEeUUAeWe8+rnRMO2QQto1n8rp+2xEHobkNOQ=;
 b=mTnhd/RDWufWyWsgGAWEaMJBqDZuUE0SmpXwnXqRNg5OaLE7MS5oO++O
 eQYxbyd1sNar9s3A+GWjO0hIvMiZCmsYNeHUkUeEFQrgX/Ew/47Y6T9ZB
 Yzr3dhlvgD/SmdFoCAHUCdHT6R0txGYOCn5R6yF0lCHa+4pM5UJ+/VuAr
 40wv2Li2SLbQMkEHXtXgrMt8XbB4qAQs81HDbxHJamyhfoaSw1Y6LBN6n
 O89Dw0oJ9Idw2wr47QMqxOCKlUEvrASdiTX9O5Rmg0B3bKSiKlwS7CaQY
 ZSAItARIIPgtxuusnTt/aRl7GNAiAaEs4fgHSS6dJp9fBAyl9VEHULOVc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061392"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061392"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966151"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:44 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/11] ASoC: codecs: rt298: Reorganize jack detect handling
Date: Thu,  9 Jun 2022 15:35:33 +0200
Message-Id: <20220609133541.3984886-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

Clean up in order to use and expose .set_jack callback.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/codecs/rt298.c           | 17 ++++++-----------
 sound/soc/codecs/rt298.h           |  2 --
 sound/soc/intel/boards/bxt_rt298.c |  2 +-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index c291786dc82d..1a27e5e63289 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -326,7 +326,8 @@ static void rt298_jack_detect_work(struct work_struct *work)
 		SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
 }
 
-int rt298_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack)
+static int rt298_mic_detect(struct snd_soc_component *component,
+			    struct snd_soc_jack *jack, void *data)
 {
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm;
@@ -358,7 +359,6 @@ int rt298_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *j
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(rt298_mic_detect);
 
 static int is_mclk_mode(struct snd_soc_dapm_widget *source,
 			 struct snd_soc_dapm_widget *sink)
@@ -1011,17 +1011,11 @@ static int rt298_probe(struct snd_soc_component *component)
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
 
 	rt298->component = component;
+	INIT_DELAYED_WORK(&rt298->jack_detect_work, rt298_jack_detect_work);
 
-	if (rt298->i2c->irq) {
-		regmap_update_bits(rt298->regmap,
-					RT298_IRQ_CTRL, 0x2, 0x2);
-
-		INIT_DELAYED_WORK(&rt298->jack_detect_work,
-					rt298_jack_detect_work);
+	if (rt298->i2c->irq)
 		schedule_delayed_work(&rt298->jack_detect_work,
-					msecs_to_jiffies(1250));
-	}
-
+				      msecs_to_jiffies(1250));
 	return 0;
 }
 
@@ -1120,6 +1114,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt298 = {
 	.suspend		= rt298_suspend,
 	.resume			= rt298_resume,
 	.set_bias_level		= rt298_set_bias_level,
+	.set_jack		= rt298_mic_detect,
 	.controls		= rt298_snd_controls,
 	.num_controls		= ARRAY_SIZE(rt298_snd_controls),
 	.dapm_widgets		= rt298_dapm_widgets,
diff --git a/sound/soc/codecs/rt298.h b/sound/soc/codecs/rt298.h
index ed2b8fd87f4c..f1be9c135401 100644
--- a/sound/soc/codecs/rt298.h
+++ b/sound/soc/codecs/rt298.h
@@ -207,7 +207,5 @@ enum {
 	RT298_AIFS,
 };
 
-int rt298_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack);
-
 #endif /* __RT298_H__ */
 
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 75995d17597d..4bd93c3ba377 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -176,7 +176,7 @@ static int broxton_rt298_codec_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	rt298_mic_detect(component, &broxton_headset);
+	snd_soc_component_set_jack(component, &broxton_headset, NULL);
 
 	snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
 
-- 
2.25.1

