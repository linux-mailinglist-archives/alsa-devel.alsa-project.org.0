Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75644476045
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030421A6C;
	Wed, 15 Dec 2021 19:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030421A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591784;
	bh=1RSt7/ovSkI4wAmeK+Z04Z4xz7mXz+HnbWqK1c/r5GU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2stRZ4uK5ylW7kjdeo8Cly95oApFKmIuP3wHJshANoV/h2fkC8gD4+Wn05qx+49R
	 a8p3XXTcqgWdny7p30nBXpvW7qxarCixZYXNX8adF4KkXfksSDOMDnvZtQo2zldozm
	 dteaVz0PNSVfdpIunA8n4mo258HxwaY8Psaw5Cc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0295FF8051B;
	Wed, 15 Dec 2021 19:07:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB62FF80516; Wed, 15 Dec 2021 19:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24A66F8027C
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24A66F8027C
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="302670997"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="302670997"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015045"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: SOF: Drop ipc_cmd parameter for
 snd_sof_ipc_set_get_comp_data()
Date: Wed, 15 Dec 2021 10:03:58 -0800
Message-Id: <20211215180404.53254-3-ranjani.sridharan@linux.intel.com>
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

The correct ipc_cmd can be selected based on the `ctrl_cmd` and the `set`
parameters:
if the ctrl_cmd is SOF_CTRL_CMD_BINARY then SOF_IPC_COMP_*_DATA
otherwise SOF_IPC_COMP_*_VALUE.

The SET or GET direction can be selected with the use of `set` parameter.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/control.c   | 15 ++-------------
 sound/soc/sof/ipc.c       |  8 +++++++-
 sound/soc/sof/sof-audio.c |  6 ++----
 sound/soc/sof/sof-audio.h |  1 -
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index bb1dfe4f6d40..299ee466625e 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -69,7 +69,6 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 {
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	u32 ipc_cmd;
 	int ret;
 
 	if (!scontrol->comp_data_dirty)
@@ -78,18 +77,13 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 	if (!pm_runtime_active(scomp->dev))
 		return;
 
-	if (scontrol->cmd == SOF_CTRL_CMD_BINARY)
-		ipc_cmd = SOF_IPC_COMP_GET_DATA;
-	else
-		ipc_cmd = SOF_IPC_COMP_GET_VALUE;
-
 	/* set the ABI header values */
 	cdata->data->magic = SOF_ABI_MAGIC;
 	cdata->data->abi = SOF_ABI_VERSION;
 
 	/* refresh the component data from DSP */
 	scontrol->comp_data_dirty = false;
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, ipc_cmd,
+	ret = snd_sof_ipc_set_get_comp_data(scontrol,
 					    SOF_CTRL_TYPE_VALUE_CHAN_GET,
 					    scontrol->cmd, false);
 	if (ret < 0) {
@@ -143,7 +137,6 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_IPC_COMP_SET_VALUE,
 					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
 					      SOF_CTRL_CMD_VOLUME,
 					      true);
@@ -216,7 +209,6 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_IPC_COMP_SET_VALUE,
 					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
 					      SOF_CTRL_CMD_SWITCH,
 					      true);
@@ -265,7 +257,6 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of enum updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_IPC_COMP_SET_VALUE,
 					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
 					      SOF_CTRL_CMD_ENUM,
 					      true);
@@ -343,7 +334,6 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_IPC_COMP_SET_DATA,
 					      SOF_CTRL_TYPE_DATA_SET,
 					      scontrol->cmd,
 					      true);
@@ -423,7 +413,6 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_IPC_COMP_SET_DATA,
 					      SOF_CTRL_TYPE_DATA_SET,
 					      scontrol->cmd,
 					      true);
@@ -463,7 +452,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	cdata->data->magic = SOF_ABI_MAGIC;
 	cdata->data->abi = SOF_ABI_VERSION;
 	/* get all the component data from DSP */
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, SOF_IPC_COMP_GET_DATA, SOF_CTRL_TYPE_DATA_GET,
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, SOF_CTRL_TYPE_DATA_GET,
 					    scontrol->cmd, false);
 	if (ret < 0)
 		goto out;
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 670d780241a3..bcfe7edee05e 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -817,7 +817,6 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
  * IPC get()/set() for kcontrols.
  */
 int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
-				  u32 ipc_cmd,
 				  enum sof_ipc_ctrl_type ctrl_type,
 				  enum sof_ipc_ctrl_cmd ctrl_cmd, bool set)
 {
@@ -830,6 +829,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 	struct snd_sof_widget *swidget;
 	bool widget_found = false;
 	size_t send_bytes;
+	u32 ipc_cmd;
 	int err;
 
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
@@ -873,6 +873,12 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 		return err;
 	}
 
+	/* Select the IPC cmd based on the ctrl_cmd and the direction */
+	if (ctrl_cmd == SOF_CTRL_CMD_BINARY)
+		ipc_cmd = set ? SOF_IPC_COMP_SET_DATA : SOF_IPC_COMP_GET_DATA;
+	else
+		ipc_cmd = set ? SOF_IPC_COMP_SET_VALUE : SOF_IPC_COMP_GET_VALUE;
+
 	cdata->rhdr.hdr.cmd = SOF_IPC_GLB_COMP_MSG | ipc_cmd;
 	cdata->cmd = ctrl_cmd;
 	cdata->type = ctrl_type;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 58a62bfb16ab..dacc0122c3b4 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -14,7 +14,7 @@
 
 static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
 {
-	int ipc_cmd, ctrl_type;
+	enum sof_ipc_ctrl_type ctrl_type;
 	int ret;
 
 	/* reset readback offset for scontrol */
@@ -25,18 +25,16 @@ static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *
 	case SOF_CTRL_CMD_VOLUME:
 	case SOF_CTRL_CMD_ENUM:
 	case SOF_CTRL_CMD_SWITCH:
-		ipc_cmd = SOF_IPC_COMP_SET_VALUE;
 		ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
 		break;
 	case SOF_CTRL_CMD_BINARY:
-		ipc_cmd = SOF_IPC_COMP_SET_DATA;
 		ctrl_type = SOF_CTRL_TYPE_DATA_SET;
 		break;
 	default:
 		return 0;
 	}
 
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, ipc_cmd, ctrl_type, scontrol->cmd, true);
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, ctrl_type, scontrol->cmd, true);
 	if (ret < 0)
 		dev_err(sdev->dev, "error: failed kcontrol value set for widget: %d\n",
 			scontrol->comp_id);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 1c1d68e220d5..f4316cd742a7 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -240,7 +240,6 @@ static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
  * Mixer IPC
  */
 int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
-				  u32 ipc_cmd,
 				  enum sof_ipc_ctrl_type ctrl_type,
 				  enum sof_ipc_ctrl_cmd ctrl_cmd, bool set);
 
-- 
2.25.1

