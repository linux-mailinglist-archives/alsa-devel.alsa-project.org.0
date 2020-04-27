Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD81BAB8B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 19:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A61BE16BA;
	Mon, 27 Apr 2020 19:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A61BE16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588009451;
	bh=BELKh+Sy2qDZDfbxgdHYPvJs7h9p+t4pDeBQBx2r7k0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N69wNvEmDLLMyzBmgPI1y03TbipFLltM/NJuBr7qiwwC5CSw4XOSSRRaWZJCyrKoM
	 ktGvZUAWY3o3pED/ToLxbmm3gFMQrh6v0cN8aJ586/5IrVVmnvDwDrbO3wIv5fNDi0
	 d+WJRj9G3Ga/z+tTS+96FWsuiWU5ntrXR/xvQi90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF40F8027D;
	Mon, 27 Apr 2020 19:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BECB1F8027D; Mon, 27 Apr 2020 19:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A101BF8027D
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 19:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A101BF8027D
IronPort-SDR: mnEv2ljwajyROW4M43tpOi14pzRtd+kx/HwV8vTG6jz3cwT1cOP/4YVwFYnS63TYsC0wk5QIYd
 IMhDG/wESDzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 10:29:40 -0700
IronPort-SDR: 8SAuGUhLQG3OqaJ8h0zWy7T0pbLvCCzLRFhXWrS1fiQdhz6ZSN3cFL/gIUF4ESHKV2gSt7wgSa
 deH5rmFJi5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="458935996"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 10:29:39 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: SOF: topology: send ipc for all found DAIs in
 sof_set_dai_config
Date: Mon, 27 Apr 2020 10:29:36 -0700
Message-Id: <20200427172939.25848-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
References: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We may find more than one DAIs in sof_set_dai_config() and we should
send message to DSP for each DAI we found.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/topology.c | 81 +++++++++-------------------------------
 1 file changed, 18 insertions(+), 63 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e88ffc25025f..0b15b4055f32 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2673,7 +2673,11 @@ static void sof_dai_set_format(struct snd_soc_tplg_hw_config *hw_config,
 	}
 }
 
-/* set config for all DAI's with name matching the link name */
+/*
+ * Send IPC and set the same config for all DAIs with name matching the link
+ * name. Note that the function can only be used for the case that all DAIs
+ * have a common DAI config for now.
+ */
 static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
 			      struct snd_soc_dai_link *link,
 			      struct sof_ipc_dai_config *config)
@@ -2686,6 +2690,19 @@ static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
 			continue;
 
 		if (strcmp(link->name, dai->name) == 0) {
+			struct sof_ipc_reply reply;
+			int ret;
+
+			/* send message to DSP */
+			ret = sof_ipc_tx_message(sdev->ipc,
+						 config->hdr.cmd, config, size,
+						 &reply, sizeof(reply));
+
+			if (ret < 0) {
+				dev_err(sdev->dev, "error: failed to set DAI config for %s index %d\n",
+					dai->name, config->dai_index);
+				return ret;
+			}
 			dai->dai_config = kmemdup(config, size, GFP_KERNEL);
 			if (!dai->dai_config)
 				return -ENOMEM;
@@ -2718,7 +2735,6 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct sof_ipc_reply reply;
 	u32 size = sizeof(*config);
 	int ret;
 
@@ -2767,17 +2783,6 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config->hdr.cmd, config, size, &reply,
-				 sizeof(reply));
-
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: failed to set DAI config for SSP%d\n",
-			config->dai_index);
-		return ret;
-	}
-
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
@@ -2795,7 +2800,6 @@ static int sof_link_sai_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct sof_ipc_reply reply;
 	u32 size = sizeof(*config);
 	int ret;
 
@@ -2835,17 +2839,6 @@ static int sof_link_sai_load(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config->hdr.cmd, config, size, &reply,
-				 sizeof(reply));
-
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: failed to set DAI config for SAI%d\n",
-			config->dai_index);
-		return ret;
-	}
-
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
@@ -2863,7 +2856,6 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct sof_ipc_reply reply;
 	u32 size = sizeof(*config);
 	int ret;
 
@@ -2904,16 +2896,6 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config->hdr.cmd, config, size, &reply,
-				 sizeof(reply));
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: failed to set DAI config for ESAI%d\n",
-			config->dai_index);
-		return ret;
-	}
-
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
@@ -2931,7 +2913,6 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct sof_ipc_reply reply;
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	size_t size = sizeof(*config);
@@ -3007,17 +2988,6 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 	if (SOF_ABI_VER(v->major, v->minor, v->micro) < SOF_ABI_VER(3, 0, 1))
 		config->dmic.fifo_bits_b = config->dmic.fifo_bits;
 
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, size,
-				 &reply, sizeof(reply));
-
-	if (ret < 0) {
-		dev_err(scomp->dev,
-			"error: failed to set DAI config for DMIC%d\n",
-			config->dai_index);
-		goto err;
-	}
-
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
@@ -3142,7 +3112,6 @@ static int sof_link_alh_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct sof_ipc_reply reply;
 	u32 size = sizeof(*config);
 	int ret;
 
@@ -3158,20 +3127,6 @@ static int sof_link_alh_load(struct snd_soc_component *scomp, int index,
 	/* init IPC */
 	config->hdr.size = size;
 
-	dev_dbg(scomp->dev, "ALH config rate %d channels %d\n",
-		config->alh.rate, config->alh.channels);
-
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config->hdr.cmd, config, size, &reply,
-				 sizeof(reply));
-
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: failed to set DAI config for ALH %d\n",
-			config->dai_index);
-		return ret;
-	}
-
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
-- 
2.17.1

