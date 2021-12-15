Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDA47603E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:08:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF44918B4;
	Wed, 15 Dec 2021 19:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF44918B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591715;
	bh=8iJJwgQeVo2SHzFgF9ReE3Uqu79PDod26TKpu0RKqq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmksiDrdt4uT+beL1llx228tpC/D3i9ARx7Nz0t4VKZEmazxJEyk3I+AzFV+1UdtG
	 yrWDcfJL901QKaRP9ZV4lfg3JsGQcKMnqIjshKvuj87ru5ZQ19FU9jSOi+PLZffPlW
	 2sY3gzhaMAUuHFQlVGXYkFC0YwKD+HlQ52f2+jqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E5DF80248;
	Wed, 15 Dec 2021 19:06:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC33F800B0; Wed, 15 Dec 2021 19:06:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A347F8019D
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A347F8019D
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239519996"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239519996"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015051"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ASoC: SOF: Drop ctrl_cmd parameter for
 snd_sof_ipc_set_get_comp_data()
Date: Wed, 15 Dec 2021 10:04:00 -0800
Message-Id: <20211215180404.53254-5-ranjani.sridharan@linux.intel.com>
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

The scontrol->control_data->cmd has been configured during initialization
to the correct sof_ipc_ctrl_cmd.

No need to pass duplicated information, let's use the already available
one via scontrol.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/control.c   | 26 +++++++-------------------
 sound/soc/sof/ipc.c       |  6 ++----
 sound/soc/sof/sof-audio.c |  2 +-
 sound/soc/sof/sof-audio.h |  3 +--
 4 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 299ee466625e..23a916ea93f8 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -84,8 +84,7 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 	/* refresh the component data from DSP */
 	scontrol->comp_data_dirty = false;
 	ret = snd_sof_ipc_set_get_comp_data(scontrol,
-					    SOF_CTRL_TYPE_VALUE_CHAN_GET,
-					    scontrol->cmd, false);
+					    SOF_CTRL_TYPE_VALUE_CHAN_GET, false);
 	if (ret < 0) {
 		dev_err(scomp->dev, "error: failed to get control data: %d\n", ret);
 		/* Set the flag to re-try next time to get the data */
@@ -137,9 +136,7 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
-					      SOF_CTRL_CMD_VOLUME,
-					      true);
+					      SOF_CTRL_TYPE_VALUE_CHAN_SET, true);
 	return change;
 }
 
@@ -209,9 +206,7 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
-					      SOF_CTRL_CMD_SWITCH,
-					      true);
+					      SOF_CTRL_TYPE_VALUE_CHAN_SET, true);
 
 	return change;
 }
@@ -257,9 +252,7 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of enum updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_VALUE_CHAN_SET,
-					      SOF_CTRL_CMD_ENUM,
-					      true);
+					      SOF_CTRL_TYPE_VALUE_CHAN_SET, true);
 
 	return change;
 }
@@ -334,9 +327,7 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_DATA_SET,
-					      scontrol->cmd,
-					      true);
+					      SOF_CTRL_TYPE_DATA_SET, true);
 
 	return 0;
 }
@@ -413,9 +404,7 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
 		snd_sof_ipc_set_get_comp_data(scontrol,
-					      SOF_CTRL_TYPE_DATA_SET,
-					      scontrol->cmd,
-					      true);
+					      SOF_CTRL_TYPE_DATA_SET, true);
 
 	return 0;
 }
@@ -452,8 +441,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	cdata->data->magic = SOF_ABI_MAGIC;
 	cdata->data->abi = SOF_ABI_VERSION;
 	/* get all the component data from DSP */
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, SOF_CTRL_TYPE_DATA_GET,
-					    scontrol->cmd, false);
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, SOF_CTRL_TYPE_DATA_GET, false);
 	if (ret < 0)
 		goto out;
 
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index bcfe7edee05e..69c8a9964960 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -817,8 +817,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
  * IPC get()/set() for kcontrols.
  */
 int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
-				  enum sof_ipc_ctrl_type ctrl_type,
-				  enum sof_ipc_ctrl_cmd ctrl_cmd, bool set)
+				  enum sof_ipc_ctrl_type ctrl_type, bool set)
 {
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
@@ -874,13 +873,12 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 	}
 
 	/* Select the IPC cmd based on the ctrl_cmd and the direction */
-	if (ctrl_cmd == SOF_CTRL_CMD_BINARY)
+	if (cdata->cmd == SOF_CTRL_CMD_BINARY)
 		ipc_cmd = set ? SOF_IPC_COMP_SET_DATA : SOF_IPC_COMP_GET_DATA;
 	else
 		ipc_cmd = set ? SOF_IPC_COMP_SET_VALUE : SOF_IPC_COMP_GET_VALUE;
 
 	cdata->rhdr.hdr.cmd = SOF_IPC_GLB_COMP_MSG | ipc_cmd;
-	cdata->cmd = ctrl_cmd;
 	cdata->type = ctrl_type;
 	cdata->comp_id = scontrol->comp_id;
 	cdata->msg_index = 0;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index dacc0122c3b4..269eca26eab9 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -34,7 +34,7 @@ static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *
 		return 0;
 	}
 
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, ctrl_type, scontrol->cmd, true);
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, ctrl_type, true);
 	if (ret < 0)
 		dev_err(sdev->dev, "error: failed kcontrol value set for widget: %d\n",
 			scontrol->comp_id);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index f4316cd742a7..5bcc842e4792 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -240,8 +240,7 @@ static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
  * Mixer IPC
  */
 int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
-				  enum sof_ipc_ctrl_type ctrl_type,
-				  enum sof_ipc_ctrl_cmd ctrl_cmd, bool set);
+				  enum sof_ipc_ctrl_type ctrl_type, bool set);
 
 /* DAI link fixup */
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
-- 
2.25.1

