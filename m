Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28482544DD3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:37:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A3D1AB6;
	Thu,  9 Jun 2022 15:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A3D1AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781852;
	bh=6IST5ir4l2I4tycvBS6qrHv0bIV/cPWBWi5cIKlB+Pw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFLmhRBFNe4GIzA03Gfx8HOc4RcAjqWUGwAK9tEuuNLe9ipFySu4FD5XDW8Vo+qZO
	 72kCGLG1dtI05B91Ec+mihgpNLUoeBt4iIqqI/hi05sGRmu32CbwTSDv4OcWB421uY
	 BjE9BztD8aLsUJXumG2HFF9b7271Q7HLCbD8S0Bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39495F8052D;
	Thu,  9 Jun 2022 15:35:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5ABF80528; Thu,  9 Jun 2022 15:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0BD3F8019D
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0BD3F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jwc07nsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781747; x=1686317747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6IST5ir4l2I4tycvBS6qrHv0bIV/cPWBWi5cIKlB+Pw=;
 b=Jwc07nsUuRYLvvaG5d1YXdI5+GgPUTpV5agXHqvX1C1nJEQY78b7aedg
 xKjiBwrDsp/aMinn08k+yG8I8M/W6islqPZLAM3uiWlpUY/o2t4kmi9VZ
 nybPJx/ARuEOrXsaD4uGLy6xzXqmoS5/i87HLaTQAeSqZORIOdIbkwfpx
 zGRfW+2lpV+yl36oxaVOHnh3z5Xzn/X7EP5L+BXVNrmjqKXYinxUmvrQ0
 Hg2zkbiK54pmOIMSTdsFK1IXHqq5aio76TBpYkyIx3AsYSt7Thh3esdgW
 Kq8Hn5q5mEUEszpJhmn11HSGdYUbpspjkUOILER8iHcyPTWSI00zxR1OE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061388"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061388"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966148"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:42 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/11] ASoC: codecs: rt286: Reorganize jack detect handling
Date: Thu,  9 Jun 2022 15:35:32 +0200
Message-Id: <20220609133541.3984886-3-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/codecs/rt286.c           | 17 ++++++-----------
 sound/soc/codecs/rt286.h           |  2 --
 sound/soc/intel/boards/broadwell.c |  6 +++---
 sound/soc/intel/boards/skl_rt286.c |  2 +-
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index ad8ea1fa7c23..0534a073ee69 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -311,7 +311,8 @@ static void rt286_jack_detect_work(struct work_struct *work)
 		SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
 }
 
-int rt286_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack)
+static int rt286_mic_detect(struct snd_soc_component *component,
+			    struct snd_soc_jack *jack, void *data)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct rt286_priv *rt286 = snd_soc_component_get_drvdata(component);
@@ -335,7 +336,6 @@ int rt286_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *j
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(rt286_mic_detect);
 
 static int is_mclk_mode(struct snd_soc_dapm_widget *source,
 			 struct snd_soc_dapm_widget *sink)
@@ -947,17 +947,11 @@ static int rt286_probe(struct snd_soc_component *component)
 	struct rt286_priv *rt286 = snd_soc_component_get_drvdata(component);
 
 	rt286->component = component;
+	INIT_DELAYED_WORK(&rt286->jack_detect_work, rt286_jack_detect_work);
 
-	if (rt286->i2c->irq) {
-		regmap_update_bits(rt286->regmap,
-					RT286_IRQ_CTRL, 0x2, 0x2);
-
-		INIT_DELAYED_WORK(&rt286->jack_detect_work,
-					rt286_jack_detect_work);
+	if (rt286->i2c->irq)
 		schedule_delayed_work(&rt286->jack_detect_work,
-					msecs_to_jiffies(1250));
-	}
-
+				      msecs_to_jiffies(50));
 	return 0;
 }
 
@@ -1055,6 +1049,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt286 = {
 	.suspend		= rt286_suspend,
 	.resume			= rt286_resume,
 	.set_bias_level		= rt286_set_bias_level,
+	.set_jack		= rt286_mic_detect,
 	.controls		= rt286_snd_controls,
 	.num_controls		= ARRAY_SIZE(rt286_snd_controls),
 	.dapm_widgets		= rt286_dapm_widgets,
diff --git a/sound/soc/codecs/rt286.h b/sound/soc/codecs/rt286.h
index f27a4e71d5b6..4b7a3bd6043d 100644
--- a/sound/soc/codecs/rt286.h
+++ b/sound/soc/codecs/rt286.h
@@ -196,7 +196,5 @@ enum {
 	RT286_AIFS,
 };
 
-int rt286_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack);
-
 #endif /* __RT286_H__ */
 
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index b29d77dfb281..48bf3241b3e6 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -75,7 +75,7 @@ static int broadwell_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	rt286_mic_detect(component, &broadwell_headset);
+	snd_soc_component_set_jack(component, &broadwell_headset, NULL);
 	return 0;
 }
 
@@ -235,7 +235,7 @@ static void broadwell_disable_jack(struct snd_soc_card *card)
 		if (!strcmp(component->name, "i2c-INT343A:00")) {
 
 			dev_dbg(component->dev, "disabling jack detect before going to suspend.\n");
-			rt286_mic_detect(component, NULL);
+			snd_soc_component_set_jack(component, NULL, NULL);
 			break;
 		}
 	}
@@ -255,7 +255,7 @@ static int broadwell_resume(struct snd_soc_card *card){
 		if (!strcmp(component->name, "i2c-INT343A:00")) {
 
 			dev_dbg(component->dev, "enabling jack detect for resume.\n");
-			rt286_mic_detect(component, &broadwell_headset);
+			snd_soc_component_set_jack(component, &broadwell_headset, NULL);
 			break;
 		}
 	}
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index e9f9520dcea4..4f3d655e2bfa 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -133,7 +133,7 @@ static int skylake_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	rt286_mic_detect(component, &skylake_headset);
+	snd_soc_component_set_jack(component, &skylake_headset, NULL);
 
 	snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
 
-- 
2.25.1

