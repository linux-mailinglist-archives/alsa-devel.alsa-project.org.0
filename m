Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F2638FBD
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:26:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 967F8174E;
	Fri, 25 Nov 2022 19:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 967F8174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400816;
	bh=tJP/k0gxeDYUog3Pv6nca7HNKh0zN8GO1U+fqRnNeDM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fKbBCPRLdUVIqxiCPWXOL+JgWChwqPK9PHOipvg4E3oTFS60HrrKsEr3y67N03LIQ
	 5VrJhs6HAq1KpWACY/ESxPYxB4/iMkSG93uiWevW1+vqmKaoABHEnNkKSn6F1zATMt
	 ek2IDK55tS5Yyf5UJd2jwJMFvROPJkILNrlhQoAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA806F805A8;
	Fri, 25 Nov 2022 19:23:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E472F80589; Fri, 25 Nov 2022 19:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41E8FF8056F
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41E8FF8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SHMnoN8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400629; x=1700936629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tJP/k0gxeDYUog3Pv6nca7HNKh0zN8GO1U+fqRnNeDM=;
 b=SHMnoN8rPXWAlbdFB5t5BItHRCepIQo1p86YtD4UjhQpmoAq4lx1Zw9I
 GM9MkqgrXOc2opggeWRnzY4R14TYSw0fC4PcFJk0EUdQpdM1eBeRzL+Jp
 h9dY8eRaR5/JCqRTUbRytYH2jctTz3XxXww6rKpq55nRkXXPuS/5jLUIY
 BoajVlyhK+g0nYC7m0TW0gfUILeAiONZSmPKtiJI4NE1ka7HwLakQsoz4
 RFZy3I+SYIdXXSgMTlKWw8hc5xTdfbyJiJjDX9xpTiM9fNG2ae1qSd5ds
 Ramr30um40Kz0czbPNQRUE1RHPdZrv1BfCsyA7kOGqD68O8S+Wx6kDsuU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909228"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909228"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005574"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005574"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:44 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 09/11] ASoC: Intel: avs: rt298: Refactor jack handling
Date: Fri, 25 Nov 2022 19:40:30 +0100
Message-Id: <20221125184032.2565979-10-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt298.c | 33 +++++++++++-------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 5570949bad8a..bd25f0fde35e 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -61,10 +61,9 @@ static struct snd_soc_jack_pin card_headset_pins[] = {
 
 static int avs_rt298_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_card *card = runtime->card;
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
-	struct snd_soc_card *card = runtime->card;
 	int num_pins, ret;
 
 	jack = snd_soc_card_get_drvdata(card);
@@ -79,9 +78,12 @@ static int avs_rt298_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
-	snd_soc_component_set_jack(component, jack, NULL);
+	return snd_soc_component_set_jack(asoc_rtd_to_codec(runtime, 0)->component, jack, NULL);
+}
 
-	return 0;
+static void avs_rt298_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
 }
 
 static int avs_rt298_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
@@ -163,6 +165,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	else
 		dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
 	dl->init = avs_rt298_codec_init;
+	dl->exit = avs_rt298_codec_exit;
 	dl->be_hw_params_fixup = avs_rt298_be_fixup;
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
@@ -207,30 +210,19 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
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
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, RT298_CODEC_DAI);
+
+	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
 static int avs_card_resume_post(struct snd_soc_card *card)
 {
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, RT298_CODEC_DAI);
 	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
 
-	return avs_card_set_jack(card, jack);
+	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
 }
 
 static int avs_rt298_probe(struct platform_device *pdev)
@@ -268,7 +260,6 @@ static int avs_rt298_probe(struct platform_device *pdev)
 	card->name = "avs_rt298";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->remove = avs_card_remove;
 	card->suspend_pre = avs_card_suspend_pre;
 	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
-- 
2.25.1

