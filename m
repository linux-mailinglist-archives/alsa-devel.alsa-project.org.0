Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4464DCD08
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:57:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 341AD1A9A;
	Thu, 17 Mar 2022 18:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 341AD1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539860;
	bh=UFO0mKXc1Pe4BdIkYJ4BmO0PrzhaI/opvkJbUhm0dfI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zf9rg07PGCyj9OCTkXfk5BTIFLCa+TIa0sXxeT6gtjyG2ijOoo7rQTHtyLhCt5I9W
	 9q6eyvrXXEmAiDsW+m5CwRDHiIyaso3wJBc7/Ry78SaWWW7jF3ykAQNg7sgNGm1SDo
	 F3sCt8NZzAQ3pGulbqWgCdKG0PBW/fVlL1C4Q4Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A309F805B2;
	Thu, 17 Mar 2022 18:52:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65453F8051D; Thu, 17 Mar 2022 18:52:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB47F80527
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB47F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AZQdrqEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539519; x=1679075519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UFO0mKXc1Pe4BdIkYJ4BmO0PrzhaI/opvkJbUhm0dfI=;
 b=AZQdrqEtq6KZM8V0ggKoKukvjrOLG+t6cHm2vTEhUi6FmPdlipNH8vCW
 LPzwpNKJ8Rp7UjN1tiZDsXZYG+p/1Nn1J9o5KZ4hY7ukWrdY+/9VRLKWA
 CsM7zVvJXN2I472LSU9VKXh0fXVgzo55NFsFOPs8nANLQ9EAkqH8Q70ND
 IhjKzKI5IcWos75z5qE5NgqMApZRzcUwlAMa4ksK85wj7WqTA04Bq1d3z
 jiAS9xJ+EaUFfzcRRYU2Vn+k7Aoy2G10q7i6Gf8WKfUR9yEOj6ITrrNou
 o0JgXLjug6g+p7WenX9s7j+gmcz3LOFU2azHlzNfvT+acoTb0aupZXvyh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492937"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492937"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431163"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:24 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/19] ASoC: SOF: Add a new dai_get_clk topology IPC op
Date: Thu, 17 Mar 2022 10:50:44 -0700
Message-Id: <20220317175044.1752400-20-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

This will help make the code for getting the mclk and bclk IPC specific.
Add the implementation for IPC3 as well.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 29 +++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.c     | 31 +++++++------------------------
 sound/soc/sof/sof-audio.h     |  6 ++++++
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 3ac65dacc7b9..2f8450a8c0a1 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2252,6 +2252,34 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	return 0;
 }
 
+static int sof_ipc3_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int clk_type)
+{
+	struct sof_dai_private_data *private = dai->private;
+
+	if (!private || !private->dai_config)
+		return 0;
+
+	switch (private->dai_config->type) {
+	case SOF_DAI_INTEL_SSP:
+		switch (clk_type) {
+		case SOF_DAI_CLK_INTEL_SSP_MCLK:
+			return private->dai_config->ssp.mclk_rate;
+		case SOF_DAI_CLK_INTEL_SSP_BCLK:
+			return private->dai_config->ssp.bclk_rate;
+		default:
+			break;
+		}
+		dev_err(sdev->dev, "fail to get SSP clk %d rate\n", clk_type);
+		break;
+	default:
+		/* not yet implemented for platforms other than the above */
+		dev_err(sdev->dev, "DAI type %d not supported yet!\n", private->dai_config->type);
+		break;
+	}
+
+	return -EINVAL;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -2359,6 +2387,7 @@ const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.widget_free = sof_ipc3_widget_free,
 	.widget_setup = sof_ipc3_widget_setup,
 	.dai_config = sof_ipc3_dai_config,
+	.dai_get_clk = sof_ipc3_dai_get_clk,
 	.set_up_all_pipelines = sof_ipc3_set_up_all_pipelines,
 	.tear_down_all_pipelines = sof_ipc3_tear_down_all_pipelines,
 };
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b4ee65cf9841..b2f009a0c5b7 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -628,40 +628,23 @@ struct snd_sof_dai *snd_sof_find_dai(struct snd_soc_component *scomp,
 	return NULL;
 }
 
-#define SOF_DAI_CLK_INTEL_SSP_MCLK	0
-#define SOF_DAI_CLK_INTEL_SSP_BCLK	1
-
 static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
 {
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
-	struct sof_dai_private_data *private = dai->private;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
 	/* use the tplg configured mclk if existed */
-	if (!dai || !private || !private->dai_config)
+	if (!dai)
 		return 0;
 
-	switch (private->dai_config->type) {
-	case SOF_DAI_INTEL_SSP:
-		switch (clk_type) {
-		case SOF_DAI_CLK_INTEL_SSP_MCLK:
-			return private->dai_config->ssp.mclk_rate;
-		case SOF_DAI_CLK_INTEL_SSP_BCLK:
-			return private->dai_config->ssp.bclk_rate;
-		default:
-			dev_err(rtd->dev, "fail to get SSP clk %d rate\n",
-				clk_type);
-			return -EINVAL;
-		}
-		break;
-	default:
-		/* not yet implemented for platforms other than the above */
-		dev_err(rtd->dev, "DAI type %d not supported yet!\n",
-			private->dai_config->type);
-		return -EINVAL;
-	}
+	if (tplg_ops->dai_get_clk)
+		return tplg_ops->dai_get_clk(sdev, dai, clk_type);
+
+	return 0;
 }
 
 /*
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index b9a9956b5baa..7f15b3bc8196 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -30,6 +30,9 @@
 
 #define WIDGET_IS_DAI(id) ((id) == snd_soc_dapm_dai_in || (id) == snd_soc_dapm_dai_out)
 
+#define SOF_DAI_CLK_INTEL_SSP_MCLK	0
+#define SOF_DAI_CLK_INTEL_SSP_BCLK	1
+
 /*
  * Volume fractional word length define to 16 sets
  * the volume linear gain value to use Qx.16 format
@@ -39,6 +42,7 @@
 struct snd_sof_widget;
 struct snd_sof_route;
 struct snd_sof_control;
+struct snd_sof_dai;
 
 struct snd_sof_dai_config_data {
 	int dai_index;
@@ -117,6 +121,7 @@ struct sof_ipc_tplg_widget_ops {
  * @widget_setup: Function pointer for setting up setup in the DSP
  * @widget_free: Function pointer for freeing widget in the DSP
  * @dai_config: Function pointer for sending DAI config IPC to the DSP
+ * @dai_get_clk: Function pointer for getting the DAI clock setting
  * @set_up_all_pipelines: Function pointer for setting up all topology pipelines
  * @tear_down_all_pipelines: Function pointer for tearing down all topology pipelines
  */
@@ -132,6 +137,7 @@ struct sof_ipc_tplg_ops {
 	int (*widget_free)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 	int (*dai_config)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 			  unsigned int flags, struct snd_sof_dai_config_data *data);
+	int (*dai_get_clk)(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int clk_type);
 	int (*set_up_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 	int (*tear_down_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 };
-- 
2.25.1

