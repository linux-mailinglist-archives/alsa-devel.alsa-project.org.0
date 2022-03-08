Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D764D4D1DB0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:46:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792CD181A;
	Tue,  8 Mar 2022 17:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792CD181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758001;
	bh=RZxQZ0AhkFOlP7lSmKwPIyJ/tI3aRv43/ga3K5m4NZA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=epf3rQyY+Oont+K0JNIX16dUQfe8DHZUUsvPDK0IhXmQqYqZlIG0XOjdD1/lnjpM8
	 mYzT6FByxBvY0qni+u/dny2jpxlzpfuwtY1tJHJpaC6UNEp3IFRjkWC5PMrTXGTvNk
	 pIom79rWl4rjvUbWKDXKO4h69HvAtg6u8Z+G7eKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1442DF8051B;
	Tue,  8 Mar 2022 17:44:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C391FF80533; Tue,  8 Mar 2022 17:44:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E59EF80271
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E59EF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B1PgZgcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757848; x=1678293848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZxQZ0AhkFOlP7lSmKwPIyJ/tI3aRv43/ga3K5m4NZA=;
 b=B1PgZgcfX1Q3rZxcZXAbUirz5qlZ+xKL4cmFPVIpq8ThS1sju7FoZRTz
 1feadWdo3vjHo6JW3+mC5ODoyW4bT+xRFaMAe60fhq7WRjkZW6CeRAYGI
 T7jHCSn7ogKgWiNt0K6WPhCCrIhY95JX9e+Mefv75ZXVyvn1eVrNbZ/iG
 G4jJeo4YH0p8wRCp9QHKDA3F+nxnAVtL96n9KLFkrhyApr3CPxNc4hC7A
 NwlnYc+p7uqPZuziYxnzC9/rW2d9+piVDdQfsdJqS4aYBFwl3rn5dttUk
 rW46JrlcgjM62BjA4/hyrJ/gJM8qBBse22jesyvUnHY0z/kL415wDPkRn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="341166849"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="341166849"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633278"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:59 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 17/18] ASoC: SOF: make struct snd_sof_dai IPC agnostic
Date: Tue,  8 Mar 2022 08:43:43 -0800
Message-Id: <20220308164344.577647-18-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

Remove the comp_dai and dai_config members of struct snd_sof_dai and
replace it with a void *private field. Introduce a new struct
sof_dai_private_data that will contain the pointer to these two fields.
The topology parser will populate this structure and save it as part of
the "private" member in snd_sof_dai. Change all users of these fields to
use the private member instead.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai.h       |  5 +++
 sound/soc/sof/intel/hda-dai.c | 27 +++++++++---
 sound/soc/sof/intel/hda.c     | 39 ++++++++++++++----
 sound/soc/sof/pcm.c           | 77 ++++++++++++++++++-----------------
 sound/soc/sof/sof-audio.c     | 30 +++++++++-----
 sound/soc/sof/sof-audio.h     |  3 +-
 sound/soc/sof/topology.c      | 38 ++++++++++++-----
 7 files changed, 143 insertions(+), 76 deletions(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 59ee50ac7705..a818a0f0a226 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -116,4 +116,9 @@ struct sof_ipc_dai_config {
 	};
 } __packed;
 
+struct sof_dai_private_data {
+	struct sof_ipc_comp_dai *comp_dai;
+	struct sof_ipc_dai_config *dai_config;
+};
+
 #endif
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 75063140ed0c..9b78eea8d76b 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -167,6 +167,7 @@ static struct sof_ipc_dai_config *hda_dai_update_config(struct snd_soc_dapm_widg
 							int channel)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
+	struct sof_dai_private_data *private;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
 
@@ -175,12 +176,19 @@ static struct sof_ipc_dai_config *hda_dai_update_config(struct snd_soc_dapm_widg
 
 	sof_dai = swidget->private;
 
-	if (!sof_dai || !sof_dai->dai_config) {
-		dev_err(swidget->scomp->dev, "error: No config for DAI %s\n", w->name);
+	if (!sof_dai || !sof_dai->private) {
+		dev_err(swidget->scomp->dev, "%s: No private data for DAI %s\n", __func__,
+			w->name);
 		return NULL;
 	}
 
-	config = &sof_dai->dai_config[sof_dai->current_config];
+	private = sof_dai->private;
+	if (!private->dai_config) {
+		dev_err(swidget->scomp->dev, "%s: No config for DAI %s\n", __func__, w->name);
+		return NULL;
+	}
+
+	config = &private->dai_config[sof_dai->current_config];
 
 	/* update config with stream tag */
 	config->hda.link_dma_ch = channel;
@@ -294,6 +302,7 @@ static int hda_link_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 	struct snd_sof_widget *swidget = w->dobj.private;
 	struct snd_soc_component *component = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_dai_private_data *private;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
 	struct sof_ipc_reply reply;
@@ -301,12 +310,18 @@ static int hda_link_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 
 	sof_dai = swidget->private;
 
-	if (!sof_dai || !sof_dai->dai_config) {
-		dev_err(sdev->dev, "No config for DAI %s\n", w->name);
+	if (!sof_dai || !sof_dai->private) {
+		dev_err(sdev->dev, "%s: No private data for DAI %s\n", __func__, w->name);
+		return -EINVAL;
+	}
+
+	private = sof_dai->private;
+	if (!private->dai_config) {
+		dev_err(sdev->dev, "%s: No config for DAI %s\n", __func__, w->name);
 		return -EINVAL;
 	}
 
-	config = &sof_dai->dai_config[sof_dai->current_config];
+	config = &private->dai_config[sof_dai->current_config];
 
 	/* set PAUSE command flag */
 	config->flags = FIELD_PREP(SOF_DAI_CONFIG_FLAGS_CMD_MASK, SOF_DAI_CONFIG_FLAGS_PAUSE);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a99e6608f0b6..0112097fbba4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -47,14 +47,21 @@ int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w, unsigned int quirk_
 	struct snd_soc_component *component = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_ipc_dai_config *config;
+	struct sof_dai_private_data *private;
 	struct snd_sof_dai *sof_dai;
 	struct sof_ipc_reply reply;
 	int ret;
 
 	sof_dai = swidget->private;
 
-	if (!sof_dai || !sof_dai->dai_config) {
-		dev_err(sdev->dev, "No config for DAI %s\n", w->name);
+	if (!sof_dai || !sof_dai->private) {
+		dev_err(sdev->dev, "%s: No private data for DAI %s\n", __func__, w->name);
+		return -EINVAL;
+	}
+
+	private = sof_dai->private;
+	if (!private->dai_config) {
+		dev_err(sdev->dev, "%s: No config for DAI %s\n", __func__, w->name);
 		return -EINVAL;
 	}
 
@@ -65,7 +72,7 @@ int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w, unsigned int quirk_
 			return ret;
 	}
 
-	config = &sof_dai->dai_config[sof_dai->current_config];
+	config = &private->dai_config[sof_dai->current_config];
 
 	/*
 	 * For static pipelines, the DAI widget would already be set up and calling
@@ -101,6 +108,7 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_f
 	struct snd_sof_widget *swidget = w->dobj.private;
 	struct snd_soc_component *component = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_dai_private_data *private;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
 	struct sof_ipc_reply reply;
@@ -108,8 +116,14 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_f
 
 	sof_dai = swidget->private;
 
-	if (!sof_dai || !sof_dai->dai_config) {
-		dev_err(sdev->dev, "error: No config to free DAI %s\n", w->name);
+	if (!sof_dai || !sof_dai->private) {
+		dev_err(sdev->dev, "%s: No private data for DAI %s\n", __func__, w->name);
+		return -EINVAL;
+	}
+
+	private = sof_dai->private;
+	if (!private->dai_config) {
+		dev_err(sdev->dev, "%s: No config for DAI %s\n", __func__, w->name);
 		return -EINVAL;
 	}
 
@@ -117,7 +131,7 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_f
 	if (!sof_dai->configured)
 		return 0;
 
-	config = &sof_dai->dai_config[sof_dai->current_config];
+	config = &private->dai_config[sof_dai->current_config];
 
 	/* set HW_FREE flag along with any quirks */
 	config->flags = SOF_DAI_CONFIG_FLAGS_HW_FREE |
@@ -154,6 +168,7 @@ static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
 			      int link_id, int alh_stream_id, int dai_id, bool setup)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
+	struct sof_dai_private_data *private;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
 
@@ -164,12 +179,18 @@ static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
 
 	sof_dai = swidget->private;
 
-	if (!sof_dai || !sof_dai->dai_config) {
-		dev_err(sdev->dev, "error: No config for DAI %s\n", w->name);
+	if (!sof_dai || !sof_dai->private) {
+		dev_err(sdev->dev, "%s: No private data for DAI %s\n", __func__, w->name);
+		return -EINVAL;
+	}
+
+	private = sof_dai->private;
+	if (!private->dai_config) {
+		dev_err(sdev->dev, "%s: No config for DAI %s\n", __func__, w->name);
 		return -EINVAL;
 	}
 
-	config = &sof_dai->dai_config[sof_dai->current_config];
+	config = &private->dai_config[sof_dai->current_config];
 
 	/* update config with link and stream ID */
 	config->dai_index = (link_id << 8) | dai_id;
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 1d04f75e6d32..4628bc642fda 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -670,7 +670,9 @@ static void ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char
 		if (!dai->name || strcmp(link_name, dai->name))
 			continue;
 		for (i = 0; i < dai->number_configs; i++) {
-			config = &dai->dai_config[i];
+			struct sof_dai_private_data *private = dai->private;
+
+			config = &private->dai_config[i];
 			if (config->ssp.fsync_rate == params_rate(params)) {
 				dev_dbg(sdev->dev, "DAI config %d matches pcm hw params\n", i);
 				dai->current_config = i;
@@ -693,6 +695,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_dai_private_data *private = dai->private;
 	struct snd_soc_dpcm *dpcm;
 
 	/* no topology exists for this BE, try a common configuration */
@@ -717,7 +720,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	/* read format from topology */
 	snd_mask_none(fmt);
 
-	switch (dai->comp_dai->config.frame_fmt) {
+	switch (private->comp_dai->config.frame_fmt) {
 	case SOF_IPC_FRAME_S16_LE:
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 		break;
@@ -733,15 +736,15 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	}
 
 	/* read rate and channels from topology */
-	switch (dai->dai_config->type) {
+	switch (private->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
 		/* search for config to pcm params match, if not found use default */
 		ssp_dai_config_pcm_params_match(sdev, (char *)rtd->dai_link->name, params);
 
-		rate->min = dai->dai_config[dai->current_config].ssp.fsync_rate;
-		rate->max = dai->dai_config[dai->current_config].ssp.fsync_rate;
-		channels->min = dai->dai_config[dai->current_config].ssp.tdm_slots;
-		channels->max = dai->dai_config[dai->current_config].ssp.tdm_slots;
+		rate->min = private->dai_config[dai->current_config].ssp.fsync_rate;
+		rate->max = private->dai_config[dai->current_config].ssp.fsync_rate;
+		channels->min = private->dai_config[dai->current_config].ssp.tdm_slots;
+		channels->max = private->dai_config[dai->current_config].ssp.tdm_slots;
 
 		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
@@ -752,11 +755,11 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		break;
 	case SOF_DAI_INTEL_DMIC:
 		/* DMIC only supports 16 or 32 bit formats */
-		if (dai->comp_dai->config.frame_fmt == SOF_IPC_FRAME_S24_4LE) {
+		if (private->comp_dai->config.frame_fmt == SOF_IPC_FRAME_S24_4LE) {
 			dev_err(component->dev,
 				"error: invalid fmt %d for DAI type %d\n",
-				dai->comp_dai->config.frame_fmt,
-				dai->dai_config->type);
+				private->comp_dai->config.frame_fmt,
+				private->dai_config->type);
 		}
 		break;
 	case SOF_DAI_INTEL_HDA:
@@ -776,14 +779,14 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		 * Dai could run with different channel count compared with
 		 * front end, so get dai channel count from topology
 		 */
-		channels->min = dai->dai_config->alh.channels;
-		channels->max = dai->dai_config->alh.channels;
+		channels->min = private->dai_config->alh.channels;
+		channels->max = private->dai_config->alh.channels;
 		break;
 	case SOF_DAI_IMX_ESAI:
-		rate->min = dai->dai_config->esai.fsync_rate;
-		rate->max = dai->dai_config->esai.fsync_rate;
-		channels->min = dai->dai_config->esai.tdm_slots;
-		channels->max = dai->dai_config->esai.tdm_slots;
+		rate->min = private->dai_config->esai.fsync_rate;
+		rate->max = private->dai_config->esai.fsync_rate;
+		channels->min = private->dai_config->esai.tdm_slots;
+		channels->max = private->dai_config->esai.tdm_slots;
 
 		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
@@ -792,10 +795,10 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_MEDIATEK_AFE:
-		rate->min = dai->dai_config->afe.rate;
-		rate->max = dai->dai_config->afe.rate;
-		channels->min = dai->dai_config->afe.channels;
-		channels->max = dai->dai_config->afe.channels;
+		rate->min = private->dai_config->afe.rate;
+		rate->max = private->dai_config->afe.rate;
+		channels->min = private->dai_config->afe.channels;
+		channels->max = private->dai_config->afe.channels;
 
 		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
@@ -804,10 +807,10 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_IMX_SAI:
-		rate->min = dai->dai_config->sai.fsync_rate;
-		rate->max = dai->dai_config->sai.fsync_rate;
-		channels->min = dai->dai_config->sai.tdm_slots;
-		channels->max = dai->dai_config->sai.tdm_slots;
+		rate->min = private->dai_config->sai.fsync_rate;
+		rate->max = private->dai_config->sai.fsync_rate;
+		channels->min = private->dai_config->sai.tdm_slots;
+		channels->max = private->dai_config->sai.tdm_slots;
 
 		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
@@ -816,10 +819,10 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_AMD_BT:
-		rate->min = dai->dai_config->acpbt.fsync_rate;
-		rate->max = dai->dai_config->acpbt.fsync_rate;
-		channels->min = dai->dai_config->acpbt.tdm_slots;
-		channels->max = dai->dai_config->acpbt.tdm_slots;
+		rate->min = private->dai_config->acpbt.fsync_rate;
+		rate->max = private->dai_config->acpbt.fsync_rate;
+		channels->min = private->dai_config->acpbt.tdm_slots;
+		channels->max = private->dai_config->acpbt.tdm_slots;
 
 		dev_dbg(component->dev,
 			"AMD_BT rate_min: %d rate_max: %d\n", rate->min, rate->max);
@@ -828,10 +831,10 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_AMD_SP:
-		rate->min = dai->dai_config->acpsp.fsync_rate;
-		rate->max = dai->dai_config->acpsp.fsync_rate;
-		channels->min = dai->dai_config->acpsp.tdm_slots;
-		channels->max = dai->dai_config->acpsp.tdm_slots;
+		rate->min = private->dai_config->acpsp.fsync_rate;
+		rate->max = private->dai_config->acpsp.fsync_rate;
+		channels->min = private->dai_config->acpsp.tdm_slots;
+		channels->max = private->dai_config->acpsp.tdm_slots;
 
 		dev_dbg(component->dev,
 			"AMD_SP rate_min: %d rate_max: %d\n", rate->min, rate->max);
@@ -840,10 +843,10 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_AMD_DMIC:
-		rate->min = dai->dai_config->acpdmic.fsync_rate;
-		rate->max = dai->dai_config->acpdmic.fsync_rate;
-		channels->min = dai->dai_config->acpdmic.tdm_slots;
-		channels->max = dai->dai_config->acpdmic.tdm_slots;
+		rate->min = private->dai_config->acpdmic.fsync_rate;
+		rate->max = private->dai_config->acpdmic.fsync_rate;
+		channels->min = private->dai_config->acpdmic.tdm_slots;
+		channels->max = private->dai_config->acpdmic.tdm_slots;
 
 		dev_dbg(component->dev,
 			"AMD_DMIC rate_min: %d rate_max: %d\n", rate->min, rate->max);
@@ -853,7 +856,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		break;
 	default:
 		dev_err(component->dev, "error: invalid DAI type %d\n",
-			dai->dai_config->type);
+			private->dai_config->type);
 		break;
 	}
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 8fccfbb339a3..15c36a51f89f 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -29,11 +29,12 @@ static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *
 
 static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *dai)
 {
+	struct sof_dai_private_data *private = dai->private;
 	struct sof_ipc_dai_config *config;
 	struct sof_ipc_reply reply;
 	int ret;
 
-	config = &dai->dai_config[dai->current_config];
+	config = &private->dai_config[dai->current_config];
 	if (!config) {
 		dev_err(sdev->dev, "error: no config for DAI %s\n", dai->name);
 		return -EINVAL;
@@ -191,12 +192,16 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	switch (swidget->id) {
 	case snd_soc_dapm_dai_in:
 	case snd_soc_dapm_dai_out:
+	{
+		struct sof_dai_private_data *dai_data;
+
 		dai = swidget->private;
-		comp = &dai->comp_dai->comp;
+		dai_data = dai->private;
+		comp = &dai_data->comp_dai->comp;
 		dai->configured = false;
 
-		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, dai->comp_dai, comp->hdr.size,
-					 &r, sizeof(r));
+		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, dai_data->comp_dai,
+					 comp->hdr.size, &r, sizeof(r));
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to load widget %s\n",
 				swidget->widget->name);
@@ -216,6 +221,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 			return ret;
 		}
 		break;
+	}
 	case snd_soc_dapm_scheduler:
 		pipeline = swidget->private;
 		ret = sof_ipc_tx_message(sdev->ipc, pipeline->hdr.cmd, pipeline,
@@ -620,12 +626,13 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 		/* update DAI config. The IPC will be sent in sof_widget_setup() */
 		if (WIDGET_IS_DAI(swidget->id)) {
 			struct snd_sof_dai *dai = swidget->private;
+			struct sof_dai_private_data *private = dai->private;
 			struct sof_ipc_dai_config *config;
 
-			if (!dai || !dai->dai_config)
+			if (!dai || !private || !private->dai_config)
 				continue;
 
-			config = dai->dai_config;
+			config = private->dai_config;
 			/*
 			 * The link DMA channel would be invalidated for running
 			 * streams but not for streams that were in the PAUSED
@@ -911,18 +918,19 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
+	struct sof_dai_private_data *private = dai->private;
 
 	/* use the tplg configured mclk if existed */
-	if (!dai || !dai->dai_config)
+	if (!dai || !private || !private->dai_config)
 		return 0;
 
-	switch (dai->dai_config->type) {
+	switch (private->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
 		switch (clk_type) {
 		case SOF_DAI_CLK_INTEL_SSP_MCLK:
-			return dai->dai_config->ssp.mclk_rate;
+			return private->dai_config->ssp.mclk_rate;
 		case SOF_DAI_CLK_INTEL_SSP_BCLK:
-			return dai->dai_config->ssp.bclk_rate;
+			return private->dai_config->ssp.bclk_rate;
 		default:
 			dev_err(rtd->dev, "fail to get SSP clk %d rate\n",
 				clk_type);
@@ -932,7 +940,7 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
 	default:
 		/* not yet implemented for platforms other than the above */
 		dev_err(rtd->dev, "DAI type %d not supported yet!\n",
-			dai->dai_config->type);
+			private->dai_config->type);
 		return -EINVAL;
 	}
 }
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 2a1da9e13279..450ee9977c55 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -148,12 +148,11 @@ struct snd_sof_dai {
 	struct snd_soc_component *scomp;
 	const char *name;
 
-	struct sof_ipc_comp_dai *comp_dai;
 	int number_configs;
 	int current_config;
 	bool configured; /* DAI configured during BE hw_params */
-	struct sof_ipc_dai_config *dai_config;
 	struct list_head list;	/* list in sdev dai list */
+	void *private;
 };
 
 /*
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 07edb8d8652c..afd9eda67631 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1495,14 +1495,21 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 			       struct snd_sof_dai *dai)
 {
 	struct snd_soc_tplg_private *private = &tw->priv;
+	struct sof_dai_private_data *dai_data;
 	struct sof_ipc_comp_dai *comp_dai;
 	size_t ipc_size = sizeof(*comp_dai);
 	int ret;
 
+	dai_data = kzalloc(sizeof(*dai_data), GFP_KERNEL);
+	if (!dai_data)
+		return -ENOMEM;
+
 	comp_dai = (struct sof_ipc_comp_dai *)
 		   sof_comp_alloc(swidget, &ipc_size, index);
-	if (!comp_dai)
-		return -ENOMEM;
+	if (!comp_dai) {
+		ret = -ENOMEM;
+		goto free;
+	}
 
 	/* configure dai IPC message */
 	comp_dai->comp.type = SOF_COMP_DAI;
@@ -1514,7 +1521,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dai tokens failed %d\n",
 			le32_to_cpu(private->size));
-		return ret;
+		goto free;
 	}
 
 	ret = sof_parse_tokens(scomp, &comp_dai->config, comp_tokens,
@@ -1523,7 +1530,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dai.cfg tokens failed %d\n",
 			private->size);
-		return ret;
+		goto free;
 	}
 
 	dev_dbg(scomp->dev, "dai %s: type %d index %d\n",
@@ -1532,9 +1539,14 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 
 	if (dai) {
 		dai->scomp = scomp;
-		dai->comp_dai = comp_dai;
+		dai_data->comp_dai = comp_dai;
+		dai->private = dai_data;
 	}
 
+	return 0;
+
+free:
+	kfree(dai_data);
 	return ret;
 }
 
@@ -2456,9 +2468,11 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 		dai = swidget->private;
 
 		if (dai) {
-			kfree(dai->comp_dai);
-			/* free dai config */
-			kfree(dai->dai_config);
+			struct sof_dai_private_data *dai_data = dai->private;
+
+			kfree(dai_data->comp_dai);
+			kfree(dai_data->dai_config);
+			kfree(dai_data);
 			list_del(&dai->list);
 		}
 		break;
@@ -2680,11 +2694,13 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 				    struct sof_ipc_dai_config *config,
 				    int num_conf, int curr_conf)
 {
+	struct sof_dai_private_data *dai_data;
 	struct snd_sof_dai *dai;
 	int found = 0;
 	int i;
 
 	list_for_each_entry(dai, &sdev->dai_list, list) {
+		dai_data = dai->private;
 		if (!dai->name)
 			continue;
 
@@ -2696,15 +2712,15 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 			 * dai_index.
 			 */
 			for (i = 0; i < num_conf; i++)
-				config[i].dai_index = dai->comp_dai->dai_index;
+				config[i].dai_index = dai_data->comp_dai->dai_index;
 
 			dev_dbg(sdev->dev, "set DAI config for %s index %d\n",
 				dai->name, config[curr_conf].dai_index);
 
 			dai->number_configs = num_conf;
 			dai->current_config = curr_conf;
-			dai->dai_config = kmemdup(config, size * num_conf, GFP_KERNEL);
-			if (!dai->dai_config)
+			dai_data->dai_config = kmemdup(config, size * num_conf, GFP_KERNEL);
+			if (!dai_data->dai_config)
 				return -ENOMEM;
 
 			found = 1;
-- 
2.25.1

