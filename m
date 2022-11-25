Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB497638FB6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:25:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7913E1742;
	Fri, 25 Nov 2022 19:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7913E1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400733;
	bh=k8FXTxKofvG1adoh9TH8d3OGm4rlK/RrlcwV28e5PhY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PV2G2ts8RTrWaseflXN7Hk7FEiZluiWj/tR8pNXIsV6awIRAcJgUJJq+74eD8rh03
	 P1IzHYUIsChqdytK/ZJg6yLOycwNs/cKWYixy94ozO+nSGm1oaj5Wutg/0PGCftWdq
	 GUZFS5v1Uoj2NqxrsOJq9u3U/klTxmcI/tTXR4M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B6DF80571;
	Fri, 25 Nov 2022 19:23:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EAE4F80568; Fri, 25 Nov 2022 19:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1076F8047C
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1076F8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xfux2xgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400617; x=1700936617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k8FXTxKofvG1adoh9TH8d3OGm4rlK/RrlcwV28e5PhY=;
 b=Xfux2xgCuYS3v1Cw6bOnHtECWhGOfgFIesWihb122pA1H2vkWrWVcEzQ
 vYcRbTgxiN0d7HC7KuzG5xRzXmz3pu6AyV6XpIN2ZUs0ADBXD++Ojm6QJ
 u6y4oZpSMOx/y654Qt0fm+mdiDJ3RrLH+EpTnGUYyjYVHpiCxT7pIIKDn
 NdlggfoW1YY1modhudv9266F9faNI1/qmf55lLx4RKXJ6VWkplA27duuD
 OPfZJlw6PlLxRC9sOaYJeA+YYhrQkHRM4USTf7eihFl0DI10aDySMIEXN
 /ujAYHAfU6V9JmsUafQ6sKRQwkXsJ3O/6Jm1Ke2CTSa1pAW4j+RDMFLog A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909217"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909217"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005522"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005522"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 03/11] ASoC: Intel: avs: nau8825: Refactor jack handling
Date: Fri, 25 Nov 2022 19:40:24 +0100
Message-Id: <20221125184032.2565979-4-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/nau8825.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index f76909e9f990..6731d8a49076 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -79,11 +79,9 @@ static struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_nau8825_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
-	struct snd_soc_card *card = runtime->card;
 	int num_pins, ret;
 
 	jack = snd_soc_card_get_drvdata(card);
@@ -108,11 +106,12 @@ static int avs_nau8825_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
-	//snd_soc_component_set_jack(component, jack, NULL);
-	// TODO: Fix nau8825 codec to use .set_jack, like everyone else
-	nau8825_enable_jack_detect(component, jack);
+	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+}
 
-	return 0;
+static void avs_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int
@@ -203,6 +202,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
 	dl->init = avs_nau8825_codec_init;
+	dl->exit = avs_nau8825_codec_exit;
 	dl->be_hw_params_fixup = avs_nau8825_be_fixup;
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
@@ -247,23 +247,11 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
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
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
+
+	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
 static int avs_card_resume_post(struct snd_soc_card *card)
@@ -280,7 +268,7 @@ static int avs_card_resume_post(struct snd_soc_card *card)
 	    codec_dai->playback_widget->active)
 		snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0, SND_SOC_CLOCK_IN);
 
-	return avs_card_set_jack(card, jack);
+	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
 }
 
 static int avs_nau8825_probe(struct platform_device *pdev)
@@ -318,7 +306,6 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 	card->name = "avs_nau8825";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->remove = avs_card_remove;
 	card->suspend_pre = avs_card_suspend_pre;
 	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
-- 
2.25.1

