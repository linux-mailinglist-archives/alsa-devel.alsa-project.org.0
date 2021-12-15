Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B747603F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:08:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526B01A5F;
	Wed, 15 Dec 2021 19:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526B01A5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591717;
	bh=TXpUUwkPi8G+fnBapTsoRj8xXg5+8ZaPDteo+SGtjO8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyMrhd+WVk6kTaN2EYTJ+/BjNtPw61WXHj0fDmuFnVAoKygcemgtzv5a8VM0BM55s
	 kNVvyXu9aW9oD6UVf4PReKlOeLlrUHzCQATjlwyS39QtfH+a2po/CGuQiu6QJ8/vxj
	 qMGIiUBdIfu6XuNGgkv8LsrBoG/iaL2wJMl/4vEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 898A6F80310;
	Wed, 15 Dec 2021 19:06:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A866F80238; Wed, 15 Dec 2021 19:06:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EE61F8014C
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE61F8014C
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239520003"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239520003"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015062"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ASoC: SOF: Drop ctrl_type parameter for
 snd_sof_ipc_set_get_comp_data()
Date: Wed, 15 Dec 2021 10:04:03 -0800
Message-Id: <20211215180404.53254-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
References: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The SOF_CTRL_TYPE_VALUE_COMP_* type is not used by the firmware nor in the
kernel side.
It is also not clear what action should be taken for such type.

With this in mind:
The correct ipc_cmd can be selected based on the `ctrl_cmd` and the `set`
parameters:
if the ctrl_cmd is SOF_CTRL_CMD_BINARY then SOF_CTRL_TYPE_DATA_*
otherwise SOF_CTRL_TYPE_VALUE_CHAN_*.

The SET or GET direction can be selected with the use of `set` parameter.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/control.c   | 20 +++++++-------------
 sound/soc/sof/ipc.c       | 30 +++++++++++++-----------------
 sound/soc/sof/sof-audio.c | 17 +----------------
 sound/soc/sof/sof-audio.h |  3 +--
 4 files changed, 22 insertions(+), 48 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index dac0b630b6a0..ef61936dad59 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -83,8 +83,7 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 
 	/* refresh the component data from DSP */
 	scontrol->comp_data_dirty = false;
-	ret = snd_sof_ipc_set_get_comp_data(scontrol,
-					    SOF_CTRL_TYPE_VALUE_CHAN_GET, false);
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
 	if (ret < 0) {
 		dev_err(scomp->dev, "error: failed to get control data: %d\n", ret);
 		/* Set the flag to re-try next time to get the data */
@@ -135,8 +134,7 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_VALUE_CHAN_SET, true);
+		snd_sof_ipc_set_get_comp_data(scontrol, true);
 	return change;
 }
 
@@ -205,8 +203,7 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_VALUE_CHAN_SET, true);
+		snd_sof_ipc_set_get_comp_data(scontrol, true);
 
 	return change;
 }
@@ -251,8 +248,7 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 
 	/* notify DSP of enum updates */
 	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_VALUE_CHAN_SET, true);
+		snd_sof_ipc_set_get_comp_data(scontrol, true);
 
 	return change;
 }
@@ -326,8 +322,7 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_DATA_SET, true);
+		snd_sof_ipc_set_get_comp_data(scontrol, true);
 
 	return 0;
 }
@@ -403,8 +398,7 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_DATA_SET, true);
+		snd_sof_ipc_set_get_comp_data(scontrol, true);
 
 	return 0;
 }
@@ -441,7 +435,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	cdata->data->magic = SOF_ABI_MAGIC;
 	cdata->data->abi = SOF_ABI_VERSION;
 	/* get all the component data from DSP */
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, SOF_CTRL_TYPE_DATA_GET, false);
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
 	if (ret < 0)
 		goto out;
 
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 69c8a9964960..8a1eacc7ec5f 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -721,11 +721,6 @@ static int sof_get_ctrl_copy_params(enum sof_ipc_ctrl_type ctrl_type,
 		sparams->src = (u8 *)src->chanv;
 		sparams->dst = (u8 *)dst->chanv;
 		break;
-	case SOF_CTRL_TYPE_VALUE_COMP_GET:
-	case SOF_CTRL_TYPE_VALUE_COMP_SET:
-		sparams->src = (u8 *)src->compv;
-		sparams->dst = (u8 *)dst->compv;
-		break;
 	case SOF_CTRL_TYPE_DATA_GET:
 	case SOF_CTRL_TYPE_DATA_SET:
 		sparams->src = (u8 *)src->data->data;
@@ -816,8 +811,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 /*
  * IPC get()/set() for kcontrols.
  */
-int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
-				  enum sof_ipc_ctrl_type ctrl_type, bool set)
+int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set)
 {
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
@@ -825,6 +819,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_ctrl_data_params sparams;
+	enum sof_ipc_ctrl_type ctrl_type;
 	struct snd_sof_widget *swidget;
 	bool widget_found = false;
 	size_t send_bytes;
@@ -872,11 +867,19 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 		return err;
 	}
 
-	/* Select the IPC cmd based on the ctrl_cmd and the direction */
-	if (cdata->cmd == SOF_CTRL_CMD_BINARY)
+	/*
+	 * Select the IPC cmd and the ctrl_type based on the ctrl_cmd and the
+	 * direction
+	 * Note: SOF_CTRL_TYPE_VALUE_COMP_* is not used and supported currently
+	 *	 for ctrl_type
+	 */
+	if (cdata->cmd == SOF_CTRL_CMD_BINARY) {
 		ipc_cmd = set ? SOF_IPC_COMP_SET_DATA : SOF_IPC_COMP_GET_DATA;
-	else
+		ctrl_type = set ? SOF_CTRL_TYPE_DATA_SET : SOF_CTRL_TYPE_DATA_GET;
+	} else {
 		ipc_cmd = set ? SOF_IPC_COMP_SET_VALUE : SOF_IPC_COMP_GET_VALUE;
+		ctrl_type = set ? SOF_CTRL_TYPE_VALUE_CHAN_SET : SOF_CTRL_TYPE_VALUE_CHAN_GET;
+	}
 
 	cdata->rhdr.hdr.cmd = SOF_IPC_GLB_COMP_MSG | ipc_cmd;
 	cdata->type = ctrl_type;
@@ -892,13 +895,6 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 		sparams.hdr_bytes = sizeof(struct sof_ipc_ctrl_data);
 		sparams.elems = scontrol->num_channels;
 		break;
-	case SOF_CTRL_TYPE_VALUE_COMP_GET:
-	case SOF_CTRL_TYPE_VALUE_COMP_SET:
-		sparams.msg_bytes = scontrol->num_channels *
-			sizeof(struct sof_ipc_ctrl_value_comp);
-		sparams.hdr_bytes = sizeof(struct sof_ipc_ctrl_data);
-		sparams.elems = scontrol->num_channels;
-		break;
 	case SOF_CTRL_TYPE_DATA_GET:
 	case SOF_CTRL_TYPE_DATA_SET:
 		sparams.msg_bytes = cdata->data->size;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 4530c6ed34e0..735fbc5fe1bd 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -14,27 +14,12 @@
 
 static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
 {
-	enum sof_ipc_ctrl_type ctrl_type;
 	int ret;
 
 	/* reset readback offset for scontrol */
 	scontrol->readback_offset = 0;
 
-	/* notify DSP of kcontrol values */
-	switch (scontrol->control_data->cmd) {
-	case SOF_CTRL_CMD_VOLUME:
-	case SOF_CTRL_CMD_ENUM:
-	case SOF_CTRL_CMD_SWITCH:
-		ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
-		break;
-	case SOF_CTRL_CMD_BINARY:
-		ctrl_type = SOF_CTRL_TYPE_DATA_SET;
-		break;
-	default:
-		return 0;
-	}
-
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, ctrl_type, true);
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
 	if (ret < 0)
 		dev_err(sdev->dev, "error: failed kcontrol value set for widget: %d\n",
 			scontrol->comp_id);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 84a8ebe3b1c3..f3009e6b91a1 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -238,8 +238,7 @@ static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
 /*
  * Mixer IPC
  */
-int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
-				  enum sof_ipc_ctrl_type ctrl_type, bool set);
+int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set);
 
 /* DAI link fixup */
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
-- 
2.25.1

