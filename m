Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D44F3CDE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD01017E6;
	Tue,  5 Apr 2022 19:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD01017E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179977;
	bh=kDz4odTZgDHIyUZM1F1K0HHazfp3FGiBRkXBAq4Nw9o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UIcPBK4bLLGE3+gfWalRht/26e92K491qW+CyswKHYceKWPwV1TcamzrDfuFqTg3a
	 Xp1qTEheLqwNVixc0AJ10oN0itxn2tIOCAJd4Wu9wE8voHvGsyZWg0Wvp0Uqfppr2e
	 4CQrQiy13oVC1Gii4g+EQ9Gm2S5K8vNWfgiMQi/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95DBCF805AB;
	Tue,  5 Apr 2022 19:27:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E33C1F8055B; Tue,  5 Apr 2022 19:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64E95F8016A
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64E95F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lKVWiTLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179664; x=1680715664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kDz4odTZgDHIyUZM1F1K0HHazfp3FGiBRkXBAq4Nw9o=;
 b=lKVWiTLSGA30fk+4jkscV+VVd3L0bhTsdR3qHNjFTzXZKSxAfABy+c7+
 8OThiXTLlAlgBzFvtq+BuSa+O200ohb66Z4csSFnFK2ovMIB03XmQtt0N
 Vr6QUZSru0tCyxBpoT0mqcKFCBdlg3k1vceA+7UVCmkE/tFwUxOkwOgOj
 eLqq2SJ5tSVZxg1R/mU/P61XIhTrBdLgb1mHLHrDkS6/O5BtUip5YE9d/
 SA3STfdvTw/k4RRiu+Zgt0LsmU5NBII+EEDYVUp+AvBe1yomb3y5xb0Pt
 4uYKqphKQgUpLM0lStAvflBcympL2VEGBPL9pFmzwtG0hIRFKrQbAeIDm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986796"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722141026"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:27 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/15] ASoC: SOF: ipc: Move the ipc_set_get_comp_data() local
 to ipc3-control
Date: Tue,  5 Apr 2022 10:27:08 -0700
Message-Id: <20220405172708.122168-16-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The snd_sof_ipc_set_get_comp_data() only used for kcontrol data update
and it is an IPC3 message parsing function.

Move it out from the generic ipc.c to ipc3-control.c and rename it to
better describe it's function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c          | 83 ------------------------------
 sound/soc/sof/ipc3-control.c | 97 ++++++++++++++++++++++++++++++++----
 sound/soc/sof/sof-audio.h    |  5 --
 3 files changed, 88 insertions(+), 97 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 45c487ab8b54..6f8ac3fb195f 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -137,89 +137,6 @@ void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
 }
 EXPORT_SYMBOL(snd_sof_ipc_reply);
 
-/*
- * IPC get()/set() for kcontrols.
- */
-int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set)
-{
-	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_ops *iops = sdev->ipc->ops;
-	enum sof_ipc_ctrl_type ctrl_type;
-	struct snd_sof_widget *swidget;
-	bool widget_found = false;
-	u32 ipc_cmd, msg_bytes;
-
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (swidget->comp_id == scontrol->comp_id) {
-			widget_found = true;
-			break;
-		}
-	}
-
-	if (!widget_found) {
-		dev_err(sdev->dev, "%s: can't find widget with id %d\n", __func__,
-			scontrol->comp_id);
-		return -EINVAL;
-	}
-
-	/*
-	 * Volatile controls should always be part of static pipelines and the widget use_count
-	 * would always be > 0 in this case. For the others, just return the cached value if the
-	 * widget is not set up.
-	 */
-	if (!swidget->use_count)
-		return 0;
-
-	/*
-	 * Select the IPC cmd and the ctrl_type based on the ctrl_cmd and the
-	 * direction
-	 * Note: SOF_CTRL_TYPE_VALUE_COMP_* is not used and supported currently
-	 *	 for ctrl_type
-	 */
-	if (cdata->cmd == SOF_CTRL_CMD_BINARY) {
-		ipc_cmd = set ? SOF_IPC_COMP_SET_DATA : SOF_IPC_COMP_GET_DATA;
-		ctrl_type = set ? SOF_CTRL_TYPE_DATA_SET : SOF_CTRL_TYPE_DATA_GET;
-	} else {
-		ipc_cmd = set ? SOF_IPC_COMP_SET_VALUE : SOF_IPC_COMP_GET_VALUE;
-		ctrl_type = set ? SOF_CTRL_TYPE_VALUE_CHAN_SET : SOF_CTRL_TYPE_VALUE_CHAN_GET;
-	}
-
-	cdata->rhdr.hdr.cmd = SOF_IPC_GLB_COMP_MSG | ipc_cmd;
-	cdata->type = ctrl_type;
-	cdata->comp_id = scontrol->comp_id;
-	cdata->msg_index = 0;
-
-	/* calculate header and data size */
-	switch (cdata->type) {
-	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
-	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
-		cdata->num_elems = scontrol->num_channels;
-
-		msg_bytes = scontrol->num_channels *
-			    sizeof(struct sof_ipc_ctrl_value_chan);
-		msg_bytes += sizeof(struct sof_ipc_ctrl_data);
-		break;
-	case SOF_CTRL_TYPE_DATA_GET:
-	case SOF_CTRL_TYPE_DATA_SET:
-		cdata->num_elems = cdata->data->size;
-
-		msg_bytes = cdata->data->size;
-		msg_bytes += sizeof(struct sof_ipc_ctrl_data) +
-			     sizeof(struct sof_abi_hdr);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	cdata->rhdr.hdr.size = msg_bytes;
-	cdata->elems_remaining = 0;
-
-	return iops->set_get_data(sdev, cdata, cdata->rhdr.hdr.size, set);
-}
-EXPORT_SYMBOL(snd_sof_ipc_set_get_comp_data);
-
 int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index 4e647142dc2b..cde9e481f7f2 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -11,6 +11,85 @@
 #include "sof-audio.h"
 #include "ipc3-ops.h"
 
+/* IPC set()/get() for kcontrols. */
+static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool set)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scontrol->scomp);
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	const struct sof_ipc_ops *iops = sdev->ipc->ops;
+	enum sof_ipc_ctrl_type ctrl_type;
+	struct snd_sof_widget *swidget;
+	bool widget_found = false;
+	u32 ipc_cmd, msg_bytes;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (swidget->comp_id == scontrol->comp_id) {
+			widget_found = true;
+			break;
+		}
+	}
+
+	if (!widget_found) {
+		dev_err(sdev->dev, "%s: can't find widget with id %d\n", __func__,
+			scontrol->comp_id);
+		return -EINVAL;
+	}
+
+	/*
+	 * Volatile controls should always be part of static pipelines and the widget use_count
+	 * would always be > 0 in this case. For the others, just return the cached value if the
+	 * widget is not set up.
+	 */
+	if (!swidget->use_count)
+		return 0;
+
+	/*
+	 * Select the IPC cmd and the ctrl_type based on the ctrl_cmd and the
+	 * direction
+	 * Note: SOF_CTRL_TYPE_VALUE_COMP_* is not used and supported currently
+	 *	 for ctrl_type
+	 */
+	if (cdata->cmd == SOF_CTRL_CMD_BINARY) {
+		ipc_cmd = set ? SOF_IPC_COMP_SET_DATA : SOF_IPC_COMP_GET_DATA;
+		ctrl_type = set ? SOF_CTRL_TYPE_DATA_SET : SOF_CTRL_TYPE_DATA_GET;
+	} else {
+		ipc_cmd = set ? SOF_IPC_COMP_SET_VALUE : SOF_IPC_COMP_GET_VALUE;
+		ctrl_type = set ? SOF_CTRL_TYPE_VALUE_CHAN_SET : SOF_CTRL_TYPE_VALUE_CHAN_GET;
+	}
+
+	cdata->rhdr.hdr.cmd = SOF_IPC_GLB_COMP_MSG | ipc_cmd;
+	cdata->type = ctrl_type;
+	cdata->comp_id = scontrol->comp_id;
+	cdata->msg_index = 0;
+
+	/* calculate header and data size */
+	switch (cdata->type) {
+	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
+	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
+		cdata->num_elems = scontrol->num_channels;
+
+		msg_bytes = scontrol->num_channels *
+			    sizeof(struct sof_ipc_ctrl_value_chan);
+		msg_bytes += sizeof(struct sof_ipc_ctrl_data);
+		break;
+	case SOF_CTRL_TYPE_DATA_GET:
+	case SOF_CTRL_TYPE_DATA_SET:
+		cdata->num_elems = cdata->data->size;
+
+		msg_bytes = cdata->data->size;
+		msg_bytes += sizeof(struct sof_ipc_ctrl_data) +
+			     sizeof(struct sof_abi_hdr);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cdata->rhdr.hdr.size = msg_bytes;
+	cdata->elems_remaining = 0;
+
+	return iops->set_get_data(sdev, cdata, cdata->rhdr.hdr.size, set);
+}
+
 static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
 {
 	if (value >= size)
@@ -49,7 +128,7 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 
 	/* refresh the component data from DSP */
 	scontrol->comp_data_dirty = false;
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
+	ret = sof_ipc3_set_get_kcontrol_data(scontrol, false);
 	if (ret < 0) {
 		dev_err(scomp->dev, "Failed to get control data: %d\n", ret);
 
@@ -97,7 +176,7 @@ static bool sof_ipc3_volume_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev)) {
-		int ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
+		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
 
 		if (ret < 0) {
 			dev_err(scomp->dev, "Failed to set mixer updates for %s\n",
@@ -145,7 +224,7 @@ static bool sof_ipc3_switch_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev)) {
-		int ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
+		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
 
 		if (ret < 0) {
 			dev_err(scomp->dev, "Failed to set mixer updates for %s\n",
@@ -193,7 +272,7 @@ static bool sof_ipc3_enum_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of enum updates */
 	if (pm_runtime_active(scomp->dev)) {
-		int ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
+		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
 
 		if (ret < 0) {
 			dev_err(scomp->dev, "Failed to set enum updates for %s\n",
@@ -265,7 +344,7 @@ static int sof_ipc3_bytes_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
-		return snd_sof_ipc_set_get_comp_data(scontrol, true);
+		return sof_ipc3_set_get_kcontrol_data(scontrol, true);
 
 	return 0;
 }
@@ -379,7 +458,7 @@ static int sof_ipc3_bytes_ext_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
-		return snd_sof_ipc_set_get_comp_data(scontrol, true);
+		return sof_ipc3_set_get_kcontrol_data(scontrol, true);
 
 	return 0;
 }
@@ -409,7 +488,7 @@ static int sof_ipc3_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
 	cdata->data->abi = SOF_ABI_VERSION;
 
 	/* get all the component data from DSP */
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
+	ret = sof_ipc3_set_get_kcontrol_data(scontrol, false);
 	if (ret < 0)
 		return ret;
 
@@ -588,7 +667,7 @@ static int sof_ipc3_widget_kcontrol_setup(struct snd_sof_dev *sdev,
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
 		if (scontrol->comp_id == swidget->comp_id) {
 			/* set kcontrol data in DSP */
-			ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
+			ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
 			if (ret < 0) {
 				dev_err(sdev->dev,
 					"kcontrol %d set up failed for widget %s\n",
@@ -605,7 +684,7 @@ static int sof_ipc3_widget_kcontrol_setup(struct snd_sof_dev *sdev,
 			if (swidget->dynamic_pipeline_widget)
 				continue;
 
-			ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
+			ret = sof_ipc3_set_get_kcontrol_data(scontrol, false);
 			if (ret < 0)
 				dev_warn(sdev->dev,
 					 "kcontrol %d read failed for widget %s\n",
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index c85461dbe945..0898f4dbe29f 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -431,11 +431,6 @@ static inline void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstre
 static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
 #endif
 
-/*
- * Mixer IPC
- */
-int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set);
-
 /* DAI link fixup */
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 
-- 
2.25.1

