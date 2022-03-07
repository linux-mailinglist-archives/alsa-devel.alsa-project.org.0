Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5734D0620
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:15:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1E41756;
	Mon,  7 Mar 2022 19:14:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1E41756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676936;
	bh=awRSYm/ShBm2AHHz0TLp7CG7IR19eAKuSH9xjSUavE0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTAmc6y6rnXyaH7Z435ldlJNuKbNkJk3hCx5hTiN/MwRb+rJDae+Vl9N8RNlI5/+z
	 nztWv9XfIU/r2kP8pedOkCr43XpRk2OH1LLo9x7LoEj4+CiOZcBKfd5gCpDqLMFGWI
	 cSJkTW6nhzijU3+DZhNlYJFh0zjnRjEF+K89S12M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE913F8055A;
	Mon,  7 Mar 2022 19:11:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7588F80539; Mon,  7 Mar 2022 19:11:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE75BF80132
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE75BF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kBDHrDfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676696; x=1678212696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awRSYm/ShBm2AHHz0TLp7CG7IR19eAKuSH9xjSUavE0=;
 b=kBDHrDfrFoiVQI3HT8PFeKdAZHqY6gI9AZ530rVhstRvEeYHqMMmrmAr
 W81KNYncuZZ6QmHvMoCWzHbb8jbZFZIbw6fy/RsU6AEyAguURd2v6gnow
 LL0ACRNHNSQD5nopSUgCZdPg7bpt0NkDqSannZ/KcH5soFnbycwOUh9XC
 Efaz3HTfO+qWLO4Cpvu91pgp5FfpnNySuXmhiLWiUBrPebzvA/+fP57va
 nE+FP2mw20DjQZUVhRQD4ttTm9i5Seg/MixWXfW0qjl3IkyxBdND/xMQg
 MGdx/Jz6AA17LYZabC/OQPmBU0wX32WAqBbS0BKvUvEvjRxeSiKn+sn2z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401328"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401328"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146673"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:27 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/18] ASoC: SOF: change comp_dai to a pointer in struct
 snd_sof_dai
Date: Mon,  7 Mar 2022 10:11:03 -0800
Message-Id: <20220307181111.49392-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

This will avoid having to add the extended data for DAI components during
sof_widget_setup() as an extra step.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c       |  6 +++---
 sound/soc/sof/sof-audio.c | 18 +++---------------
 sound/soc/sof/sof-audio.h |  2 +-
 sound/soc/sof/topology.c  | 17 +++++------------
 4 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index a312ed855f1a..1d04f75e6d32 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -717,7 +717,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	/* read format from topology */
 	snd_mask_none(fmt);
 
-	switch (dai->comp_dai.config.frame_fmt) {
+	switch (dai->comp_dai->config.frame_fmt) {
 	case SOF_IPC_FRAME_S16_LE:
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 		break;
@@ -752,10 +752,10 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		break;
 	case SOF_DAI_INTEL_DMIC:
 		/* DMIC only supports 16 or 32 bit formats */
-		if (dai->comp_dai.config.frame_fmt == SOF_IPC_FRAME_S24_4LE) {
+		if (dai->comp_dai->config.frame_fmt == SOF_IPC_FRAME_S24_4LE) {
 			dev_err(component->dev,
 				"error: invalid fmt %d for DAI type %d\n",
-				dai->comp_dai.config.frame_fmt,
+				dai->comp_dai->config.frame_fmt,
 				dai->dai_config->type);
 		}
 		break;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e39f18e824b4..b49d8e348077 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -170,7 +170,6 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	struct sof_ipc_cmd_hdr *hdr;
 	struct sof_ipc_comp *comp;
 	struct snd_sof_dai *dai;
-	size_t ipc_size;
 	int ret;
 
 	/* skip if there is no private data */
@@ -192,23 +191,12 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	switch (swidget->id) {
 	case snd_soc_dapm_dai_in:
 	case snd_soc_dapm_dai_out:
-		ipc_size = sizeof(struct sof_ipc_comp_dai) + sizeof(struct sof_ipc_comp_ext);
-		comp = kzalloc(ipc_size, GFP_KERNEL);
-		if (!comp) {
-			ret = -ENOMEM;
-			goto core_put;
-		}
-
 		dai = swidget->private;
+		comp = &dai->comp_dai->comp;
 		dai->configured = false;
-		memcpy(comp, &dai->comp_dai, sizeof(struct sof_ipc_comp_dai));
 
-		/* append extended data to the end of the component */
-		memcpy((u8 *)comp + sizeof(struct sof_ipc_comp_dai), &swidget->comp_ext,
-		       sizeof(swidget->comp_ext));
-
-		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, comp, ipc_size, &r, sizeof(r));
-		kfree(comp);
+		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, dai->comp_dai, comp->hdr.size,
+					 &r, sizeof(r));
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to load widget %s\n",
 				swidget->widget->name);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index feda5793b589..a8eeffc12b24 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -134,7 +134,7 @@ struct snd_sof_dai {
 	struct snd_soc_component *scomp;
 	const char *name;
 
-	struct sof_ipc_comp_dai comp_dai;
+	struct sof_ipc_comp_dai *comp_dai;
 	int number_configs;
 	int current_config;
 	bool configured; /* DAI configured during BE hw_params */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index dd1cc6e26686..41927e99ace2 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1478,7 +1478,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dai tokens failed %d\n",
 			le32_to_cpu(private->size));
-		goto finish;
+		return ret;
 	}
 
 	ret = sof_parse_tokens(scomp, &comp_dai->config, comp_tokens,
@@ -1487,7 +1487,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dai.cfg tokens failed %d\n",
 			private->size);
-		goto finish;
+		return ret;
 	}
 
 	dev_dbg(scomp->dev, "dai %s: type %d index %d\n",
@@ -1496,17 +1496,9 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 
 	if (dai) {
 		dai->scomp = scomp;
-
-		/*
-		 * copy only the sof_ipc_comp_dai to avoid collapsing
-		 * the snd_sof_dai, the extended data is kept in the
-		 * snd_sof_widget.
-		 */
-		memcpy(&dai->comp_dai, comp_dai, sizeof(*comp_dai));
+		dai->comp_dai = comp_dai;
 	}
 
-finish:
-	kfree(comp_dai);
 	return ret;
 }
 
@@ -2429,6 +2421,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 		dai = swidget->private;
 
 		if (dai) {
+			kfree(dai->comp_dai);
 			/* free dai config */
 			kfree(dai->dai_config);
 			list_del(&dai->list);
@@ -2668,7 +2661,7 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 			 * dai_index.
 			 */
 			for (i = 0; i < num_conf; i++)
-				config[i].dai_index = dai->comp_dai.dai_index;
+				config[i].dai_index = dai->comp_dai->dai_index;
 
 			dev_dbg(sdev->dev, "set DAI config for %s index %d\n",
 				dai->name, config[curr_conf].dai_index);
-- 
2.25.1

