Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E9551572
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213DF18D4;
	Mon, 20 Jun 2022 12:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213DF18D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719770;
	bh=D9v0oE63LYIOGbT9IuQQYJn5o8/o4Z0meXa3U5gxDgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9zrFl1i2hmq43Jfvo3Dp+Ru9nFxQJiVygFK08j38BGiRYZfDl103oE6Ltnw3yLxl
	 lyPSQX98uXm1yxOmyXc5HoOsKR09KxqPrras7X9scRhrQihoICuBb1KyDy9hqqsrQS
	 MjHsxV2h+NqXVhGOHSuONVhgithaSUYiZ0kXJFjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DECF805C0;
	Mon, 20 Jun 2022 12:04:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 158D3F805BE; Mon, 20 Jun 2022 12:04:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FD08F805B3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD08F805B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HJzj3r08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719462; x=1687255462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9v0oE63LYIOGbT9IuQQYJn5o8/o4Z0meXa3U5gxDgc=;
 b=HJzj3r08Kf7fYRN+udZQEeXPOpQwNBlzEg70a2p23d1vo92c0SakTcGc
 PQlGWrp/Sw7tW7aC7fmx3fEA5zLLr6sHBHClYEDTIWqIQtucz7YmRpARn
 iMyJ4ef0lMhGO+UPewFDXjoR6Y/OksitzKT4SaQj7RjTRx/lWo45jL+oJ
 rG4tuaHJeMLcXQVbyK2PHbRMra8t8LosVxb4bAX7SlP1l2aCqeo2bUEkv
 RUGqKqP6KY83eWJGygaQkf0IowHAGuT9EsH0STqMT7Qx5Cn5ZL8UwCI1Z
 rvmLj2PNKtcgTDZS9uvknYUJj1bzc+ViDEUx5qeg/HhSf6oXXTq9GIp93 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180734"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180734"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046434"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 16/17] ASoC: Intel: bdw_rt286: Refactor jack handling
Date: Mon, 20 Jun 2022 12:14:01 +0200
Message-Id: <20220620101402.2684366-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
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

Use link->exit() rather than pdev->remove() to unassign jack during card
unbind procedure so codec link initialization and exit procedures are
synergistic.

Also, there is no need to perform search for codec dai in suspend_pre()
and resume_post() ourselves. Use snd_soc_card_get_codec_dai() instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 55 +++++++++---------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 36f984ff56c5..622f2424ca59 100644
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
@@ -189,6 +196,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.init = codec_link_init,
+		.exit = codec_link_exit,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
@@ -199,43 +207,24 @@ static struct snd_soc_dai_link card_dai_links[] = {
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
@@ -245,8 +234,6 @@ static struct snd_soc_card bdw_rt286_card = {
 	.dapm_routes = card_routes,
 	.num_dapm_routes = ARRAY_SIZE(card_routes),
 	.fully_routed = true,
-	.suspend_pre = bdw_rt286_suspend,
-	.resume_post = bdw_rt286_resume,
 };
 
 /* Use space before codec name to simplify card ID, and simplify driver name. */
@@ -278,18 +265,8 @@ static int bdw_rt286_probe(struct platform_device *pdev)
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

