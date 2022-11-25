Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1EF638FB2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:25:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C3D175D;
	Fri, 25 Nov 2022 19:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C3D175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400719;
	bh=Ohc2bX2PjrZkMypbz1IESeN5JhbEma4pwXDsy77W1CM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvlRjhBbz+DC6OSEyf9eJo2Zsb8sxJMDSC29dF9G02doI/iE2IzJeqS/E3w/l4eJz
	 Ez/YcxHv44XtxXa98bvxa0QkqVC4LexXpTJjithngK0AstPYQIBi/o0QkGfGz4XE2I
	 swq5+DR2b436biAV1uUsgCDaN3AHC7QmyfuIyu/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AEBEF80564;
	Fri, 25 Nov 2022 19:23:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 195C6F80557; Fri, 25 Nov 2022 19:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A39F80171
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A39F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KL74TFJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400616; x=1700936616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ohc2bX2PjrZkMypbz1IESeN5JhbEma4pwXDsy77W1CM=;
 b=KL74TFJLruP+R1+zITUnv/K0y9pCCfjLV68TTpK0epZu8610DkcbAaww
 hYxXPyJHxGoXTD9Wz4x4Zgv8H29LpMTYY7PjU5s6Byxb/Y1to2k5KerW0
 QG7MToLaad8b0/QdWhVDZajShycNRSEOUOYyi4f2EdZw1PmVqs+yLj0nf
 Ir8n0rx0Nit4iNJtiBpxeZuFgMwyN8lJ+OZ7HYMA+B2GP1Ku75I6+x4Ap
 0FgnDNLsSNWKTSZgzUVTF8ITMZt2ujfDX3aW1KSDCVgkAiwep03jWlBrd
 WatL1w/5PYD+WS8uMQByx8hUa4mG1w+4C2DZScoblmAQa03cnlZJSK6Jd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909215"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909215"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005517"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005517"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:30 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/11] ASoC: Intel: avs: da7219: Refactor jack handling
Date: Fri, 25 Nov 2022 19:40:23 +0100
Message-Id: <20221125184032.2565979-3-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/da7219.c | 34 +++++++++++------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index ad86cef101cc..acd43b6108e9 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -72,10 +72,10 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 
 static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack *jack;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
 	int clk_freq;
 	int ret;
 
@@ -109,9 +109,12 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 
-	snd_soc_component_set_jack(component, jack, NULL);
+	return snd_soc_component_set_jack(component, jack, NULL);
+}
 
-	return 0;
+static void avs_da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
@@ -146,6 +149,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
 	dl->init = avs_da7219_codec_init;
+	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
 	dl->dpcm_capture = 1;
@@ -188,30 +192,19 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
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
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
+
+	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
 static int avs_card_resume_post(struct snd_soc_card *card)
 {
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
 	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
 
-	return avs_card_set_jack(card, jack);
+	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
 }
 
 static int avs_da7219_probe(struct platform_device *pdev)
@@ -249,7 +242,6 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	card->name = "avs_da7219";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->remove = avs_card_remove;
 	card->suspend_pre = avs_card_suspend_pre;
 	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
-- 
2.25.1

