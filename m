Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77925638FBC
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1453E1777;
	Fri, 25 Nov 2022 19:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1453E1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400798;
	bh=Dgp5UKKn34407Wm+nhVSWp9+YFRwEGAFRNU5JcCo0sc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fI8X8JjaQ+LDWrsG/BaGny8fveB4P+uRVEgoSPVu+49PhHu++77zFTVAlRhuzKTm4
	 AwIdFDM0Qbb6LLS8MZC0kcfGW6/xf/IzR1Juss08b3x+QTgHqE/Pt1+8PDIpxUJmXw
	 4MPBf0/ITboLimBfQfuDm2YMPH5m54ipIeKfdE7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D6C5F8057F;
	Fri, 25 Nov 2022 19:23:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89B04F80567; Fri, 25 Nov 2022 19:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC133F80558
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC133F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gGyu7DJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400624; x=1700936624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dgp5UKKn34407Wm+nhVSWp9+YFRwEGAFRNU5JcCo0sc=;
 b=gGyu7DJ492vGDtkftqH30d4WEm4kKFbdW6q4ONqvoXpM2i5EDuFC4jbk
 BbSmYE6NjzJ/B5zcRg535yp5s/7Vmf/JKUSY2WcW85h4+XsouAhSIDO40
 BvwSmoT284zBxcB3xY8Os83+wQBgnXngW+whEuquX4W4wc39r4N+/4jrX
 QP3onk7KplpApLrnv03m3zLkvjQg/agVXE1qKmT9m5V22POA3RSx30P2g
 dZr5l0Gp7rR+FR77YP5qEXtlPEeg7fnlIo5EfPiUDZvbn9j6j7SwxJVIO
 RhgCkK0jt5wJam3PLf3HmBL4c1RR1geJGnT8cehR9bAQO7i9cpSKdc8VX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909225"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909225"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005553"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005553"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 07/11] ASoC: Intel: avs: rt286: Refactor jack handling
Date: Fri, 25 Nov 2022 19:40:28 +0100
Message-Id: <20221125184032.2565979-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125184032.2565979-1-cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Use link->exit() rather than pdev->remove() to unassign jack during card
unbind procedure so codec link initialization and exit procedures are
symmetrical.

Also, there is no need to perform search for codec dai in suspend_pre()
and resume_post() ourselves. Use snd_soc_card_get_codec_dai() instead.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt286.c | 33 +++++++++++-------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 7868a2d10cac..8447b37a2a41 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -50,10 +50,9 @@ static struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_rt286_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
-	struct snd_soc_card *card = runtime->card;
 	int num_pins, ret;
 
 	jack = snd_soc_card_get_drvdata(card);
@@ -68,9 +67,12 @@ static int avs_rt286_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
-	snd_soc_component_set_jack(component, jack, NULL);
+	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+}
 
-	return 0;
+static void avs_rt286_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt286_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
@@ -143,6 +145,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
 	dl->init = avs_rt286_codec_init;
+	dl->exit = avs_rt286_codec_exit;
 	dl->be_hw_params_fixup = avs_rt286_be_fixup;
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
@@ -187,30 +190,19 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
 	return 0;
 }
 
-static int avs_card_set_jack(struct snd_soc_card *card, struct snd_soc_jack *jack)
-{
-	struct snd_soc_component *component;
-
-	for_each_card_components(card, component)
-		snd_soc_component_set_jack(component, jack, NULL);
-	return 0;
-}
-
-static int avs_card_remove(struct snd_soc_card *card)
-{
-	return avs_card_set_jack(card, NULL);
-}
-
 static int avs_card_suspend_pre(struct snd_soc_card *card)
 {
-	return avs_card_set_jack(card, NULL);
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, RT286_CODEC_DAI);
+
+	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
 static int avs_card_resume_post(struct snd_soc_card *card)
 {
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, RT286_CODEC_DAI);
 	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
 
-	return avs_card_set_jack(card, jack);
+	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
 }
 
 static int avs_rt286_probe(struct platform_device *pdev)
@@ -248,7 +240,6 @@ static int avs_rt286_probe(struct platform_device *pdev)
 	card->name = "avs_rt286";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->remove = avs_card_remove;
 	card->suspend_pre = avs_card_suspend_pre;
 	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
-- 
2.25.1

