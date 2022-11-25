Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AB3638FB0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:24:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA221754;
	Fri, 25 Nov 2022 19:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA221754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400698;
	bh=lXNxzJekHAHccQxNE23P9RZoETpXM66Z7k1N4K7bmp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JYc8dDFJJKYXNb8ze4sniMTkopj8eFWeWh4O/eO0tIjQXZ17gXRwbc8+c96ggttMM
	 jUKe0w0R114Va72378lHdKLDsLRu6eyO+MWnTqiErfr9Lg/BrujnSO5BvIh04hQR8h
	 GnpJmNqwQqXQXoY7KybzX4kTyptwU5QBhK7Q/rdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5685CF80171;
	Fri, 25 Nov 2022 19:23:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F484F80557; Fri, 25 Nov 2022 19:23:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78E09F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78E09F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fQI/16bv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400615; x=1700936615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lXNxzJekHAHccQxNE23P9RZoETpXM66Z7k1N4K7bmp8=;
 b=fQI/16bvg9np24LdxcZDrDmSlK0Os5Qkw6PBP107rPNgeJ0qk5MQWVwJ
 4OVTDA6gOYP2HP0CA6tte7QbpQPrrWAOOgUQIj5LsH4cSJI6UEPmWLmMm
 46tr7hxf6k9/nrDaDnd04c/ldYjao1IQEIEEvCU4EzRIiwCtxnt5kOHRJ
 D3zSc0NkADFvyboIw751OyXf2helIFVI+mXzliJUJVZX7FkVzfCsMnoC4
 QrRp24Trgd6U+UEA7Ww5+uuYTCXlKPPEUgnPMkDOmes6hfMbg7mGOL6bi
 VrE6CsqAyHBz4GLF9JrlOihY7CWDd4zAtHpWbT+3soF3dl1OgJhG77qry g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909212"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909212"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005514"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005514"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:28 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 01/11] ASoC: Intel: bdw_rt286: Refactor jack handling
Date: Fri, 25 Nov 2022 19:40:22 +0100
Message-Id: <20221125184032.2565979-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125184032.2565979-1-cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
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

Use link->exit() rather than pdev->remove() to unassign jack during card
unbind procedure so codec link initialization and exit procedures are
symmetrical.

Also, there is no need to perform search for codec dai in suspend_pre()
and resume_post() ourselves. Use snd_soc_card_get_codec_dai() instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 55 +++++++++---------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 6b76df0e7c9b..b7687a93a923 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -73,6 +73,13 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 	return snd_soc_component_set_jack(codec, &card_headset, NULL);
 }
 
+static void codec_link_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(codec, NULL, NULL);
+}
+
 static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
@@ -165,6 +172,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.init = codec_link_init,
+		.exit = codec_link_exit,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
@@ -175,43 +183,24 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	},
 };
 
-static void bdw_rt286_disable_jack(struct snd_soc_card *card)
-{
-	struct snd_soc_component *component;
-
-	for_each_card_components(card, component) {
-		if (!strcmp(component->name, "i2c-INT343A:00")) {
-			dev_dbg(component->dev, "disabling jack detect before going to suspend.\n");
-			snd_soc_component_set_jack(component, NULL, NULL);
-			break;
-		}
-	}
-}
-
-static int bdw_rt286_suspend(struct snd_soc_card *card)
+static int card_suspend_pre(struct snd_soc_card *card)
 {
-	bdw_rt286_disable_jack(card);
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, "rt286-aif1");
 
-	return 0;
+	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
-static int bdw_rt286_resume(struct snd_soc_card *card)
+static int card_resume_post(struct snd_soc_card *card)
 {
-	struct snd_soc_component *component;
-
-	for_each_card_components(card, component) {
-		if (!strcmp(component->name, "i2c-INT343A:00")) {
-			dev_dbg(component->dev, "enabling jack detect for resume.\n");
-			snd_soc_component_set_jack(component, &card_headset, NULL);
-			break;
-		}
-	}
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, "rt286-aif1");
 
-	return 0;
+	return snd_soc_component_set_jack(codec_dai->component, &card_headset, NULL);
 }
 
 static struct snd_soc_card bdw_rt286_card = {
 	.owner = THIS_MODULE,
+	.suspend_pre = card_suspend_pre,
+	.resume_post = card_resume_post,
 	.dai_link = card_dai_links,
 	.num_links = ARRAY_SIZE(card_dai_links),
 	.controls = card_controls,
@@ -221,8 +210,6 @@ static struct snd_soc_card bdw_rt286_card = {
 	.dapm_routes = card_routes,
 	.num_dapm_routes = ARRAY_SIZE(card_routes),
 	.fully_routed = true,
-	.suspend_pre = bdw_rt286_suspend,
-	.resume_post = bdw_rt286_resume,
 };
 
 /* Use space before codec name to simplify card ID, and simplify driver name. */
@@ -254,18 +241,8 @@ static int bdw_rt286_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, &bdw_rt286_card);
 }
 
-static int bdw_rt286_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	bdw_rt286_disable_jack(card);
-
-	return 0;
-}
-
 static struct platform_driver bdw_rt286_driver = {
 	.probe = bdw_rt286_probe,
-	.remove = bdw_rt286_remove,
 	.driver = {
 		.name = "bdw_rt286",
 		.pm = &snd_soc_pm_ops
-- 
2.25.1

