Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0CF63C6E8
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 18:59:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389901691;
	Tue, 29 Nov 2022 18:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389901691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669744750;
	bh=7N0rtO2ETluoLvZGJq0ioAx86Onhg18zD+p9BkTo/FU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbrYaEDtYUiMfdSXkUS62KIUCnSBb1Ff4t3L5sYVan5ee3yjMGYxKKwDuF5ZRNxw0
	 x52+OKDPioAeXjAuUQ+0fjSqJ/v+E+UahlcljiPmxuprHh1Y0+u+Khmp7YbmikvXr3
	 Vb5kfRcC2qrjJeHnAVPxjbnEU7cGCxxl8ZFz4Yes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A94F1F80563;
	Tue, 29 Nov 2022 18:57:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A156F8055C; Tue, 29 Nov 2022 18:57:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF57F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 18:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF57F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IOJI4QNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669744649; x=1701280649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7N0rtO2ETluoLvZGJq0ioAx86Onhg18zD+p9BkTo/FU=;
 b=IOJI4QNw6ZhhV8RSas4fzfKt9peqdShuWt3xSBCyVexe2Sko1iwbUIWd
 lMbWqHNcI+QgW071FCaqsh5XeVxCeIfRKXsaqj8PQxZO2CZgKY4OmhOfa
 D+OttGyS/AxgiEXDraWVqYJRKlguJE8wpzC4aaCOH/jMp4V7W9P9Evk1M
 8cEdSSWLFQF2j2DnPLerBJSKx+R68ub2s1IGmJM+rpgmJXjd3vnAdezXH
 H4BMtNXbPhCwwi+IJknh28AZxWmaJkfKY1ILQXp8dZeloZ2w8zYPTpVqI
 QkIxKXSafzZNkLSHqdFKZDn1Awjc5Qd9yd5tKay44zsavPdrxOkM+6a4F g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="377343627"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="377343627"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 09:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="645996101"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="645996101"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2022 09:50:38 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: Intel: avs: rt5682: Refactor jack handling
Date: Tue, 29 Nov 2022 19:07:38 +0100
Message-Id: <20221129180738.2866290-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129180738.2866290-1-cezary.rojewski@intel.com>
References: <20221129180738.2866290-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt5682.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 7c86c8c69dbd..473e9fe5d0bf 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -120,6 +120,11 @@ static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 	return 0;
 };
 
+static void avs_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+}
+
 static int
 avs_rt5682_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
@@ -195,6 +200,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->num_platforms = 1;
 	dl->id = 0;
 	dl->init = avs_rt5682_codec_init;
+	dl->exit = avs_rt5682_codec_exit;
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
@@ -238,30 +244,19 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
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
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, AVS_RT5682_CODEC_DAI_NAME);
+
+	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
 static int avs_card_resume_post(struct snd_soc_card *card)
 {
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, AVS_RT5682_CODEC_DAI_NAME);
 	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
 
-	return avs_card_set_jack(card, jack);
+	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
 }
 
 static int avs_rt5682_probe(struct platform_device *pdev)
@@ -305,7 +300,6 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 	card->name = "avs_rt5682";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->remove = avs_card_remove;
 	card->suspend_pre = avs_card_suspend_pre;
 	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
-- 
2.25.1

