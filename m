Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46434DCCF7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D3818ED;
	Thu, 17 Mar 2022 18:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D3818ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539660;
	bh=9unt2N52EbKS2HF2tphkjJLDhjfQqpdmrEjnrjDszUo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7rFGiatRpnKdoUQ18F80LUFNoo67G6dRU4TThKNMia2/I1D20XreAdDgHvHOtRgI
	 YvvcAjXeIKcooQ3V0Li2ZqWrvFsU06jx8Z90eXiqQLqRXuhfl8C26SatPzZ0INsfiX
	 K2sl/H/XUyaT7fJzF2+P8xDQw7iBYUV+ljURAJ9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3806F80534;
	Thu, 17 Mar 2022 18:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B466F802DF; Thu, 17 Mar 2022 18:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73E5EF80124
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E5EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AVRrgyAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539508; x=1679075508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9unt2N52EbKS2HF2tphkjJLDhjfQqpdmrEjnrjDszUo=;
 b=AVRrgyAa4DuVN8v8mum76T8lEI+QIv2zp01Klt1awB03SKzuB6yCuaaN
 K2ObjSCZ53tfSH3xHAg0UCuX+TK384XSa88ybePqwnniK072u18CY28XD
 rbAmsyUGKPBjVA5NqJci3pGM7W/+l6MC1UKwtOQPV6ax6cwoTJxYdgrf5
 XnN4L3rwmoTw5qv7oMsMPL7zM1Zjpo0gCY90ni4OtANom+GvH592yIeX3
 oedLet96MV6k5epO1o1dfqKbT3d/IfSsFnrhVPDGLezzmApR8EQP4Dx24
 T2EGT9Xinj4PKsptmjQSfu8aYCu4okiSOrmSn21HB8dqGtinECLKLwFIS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492905"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492905"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431122"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/19] ASoC: SOF: Add IPC3 topology control ops
Date: Thu, 17 Mar 2022 10:50:30 -0700
Message-Id: <20220317175044.1752400-6-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Define the topology control IPC ops for IPC3, implement the
control_notify op and use it.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Makefile        |   2 +-
 sound/soc/sof/control.c       | 144 -------------------------------
 sound/soc/sof/ipc.c           |   6 +-
 sound/soc/sof/ipc3-control.c  | 156 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc3-ops.h      |   1 +
 sound/soc/sof/ipc3-topology.c |   1 +
 sound/soc/sof/sof-audio.h     |   6 +-
 7 files changed, 166 insertions(+), 150 deletions(-)
 create mode 100644 sound/soc/sof/ipc3-control.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 59482903a243..f6d68a3096d9 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -2,7 +2,7 @@
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
-		ipc3-topology.o ipc3.o
+		ipc3-topology.o ipc3.o ipc3-control.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 21ee0545945d..fb2311d880d3 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -526,147 +526,3 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 
 	return 0;
 }
-
-static void snd_sof_update_control(struct snd_sof_control *scontrol,
-				   struct sof_ipc_ctrl_data *cdata)
-{
-	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *local_cdata;
-	int i;
-
-	local_cdata = scontrol->ipc_control_data;
-
-	if (cdata->cmd == SOF_CTRL_CMD_BINARY) {
-		if (cdata->num_elems != local_cdata->data->size) {
-			dev_err(scomp->dev,
-				"error: cdata binary size mismatch %u - %u\n",
-				cdata->num_elems, local_cdata->data->size);
-			return;
-		}
-
-		/* copy the new binary data */
-		memcpy(local_cdata->data, cdata->data, cdata->num_elems);
-	} else if (cdata->num_elems != scontrol->num_channels) {
-		dev_err(scomp->dev,
-			"error: cdata channel count mismatch %u - %d\n",
-			cdata->num_elems, scontrol->num_channels);
-	} else {
-		/* copy the new values */
-		for (i = 0; i < cdata->num_elems; i++)
-			local_cdata->chanv[i].value = cdata->chanv[i].value;
-	}
-}
-
-void snd_sof_control_notify(struct snd_sof_dev *sdev,
-			    struct sof_ipc_ctrl_data *cdata)
-{
-	struct snd_soc_dapm_widget *widget;
-	struct snd_sof_control *scontrol;
-	struct snd_sof_widget *swidget;
-	struct snd_kcontrol *kc = NULL;
-	struct soc_mixer_control *sm;
-	struct soc_bytes_ext *be;
-	size_t expected_size;
-	struct soc_enum *se;
-	bool found = false;
-	int i, type;
-
-	if (cdata->type == SOF_CTRL_TYPE_VALUE_COMP_GET ||
-	    cdata->type == SOF_CTRL_TYPE_VALUE_COMP_SET) {
-		dev_err(sdev->dev,
-			"Component data is not supported in control notification\n");
-		return;
-	}
-
-	/* Find the swidget first */
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (swidget->comp_id == cdata->comp_id) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found)
-		return;
-
-	/* Translate SOF cmd to TPLG type */
-	switch (cdata->cmd) {
-	case SOF_CTRL_CMD_VOLUME:
-	case SOF_CTRL_CMD_SWITCH:
-		type = SND_SOC_TPLG_TYPE_MIXER;
-		break;
-	case SOF_CTRL_CMD_BINARY:
-		type = SND_SOC_TPLG_TYPE_BYTES;
-		break;
-	case SOF_CTRL_CMD_ENUM:
-		type = SND_SOC_TPLG_TYPE_ENUM;
-		break;
-	default:
-		dev_err(sdev->dev, "error: unknown cmd %u\n", cdata->cmd);
-		return;
-	}
-
-	widget = swidget->widget;
-	for (i = 0; i < widget->num_kcontrols; i++) {
-		/* skip non matching types or non matching indexes within type */
-		if (widget->dobj.widget.kcontrol_type[i] == type &&
-		    widget->kcontrol_news[i].index == cdata->index) {
-			kc = widget->kcontrols[i];
-			break;
-		}
-	}
-
-	if (!kc)
-		return;
-
-	switch (cdata->cmd) {
-	case SOF_CTRL_CMD_VOLUME:
-	case SOF_CTRL_CMD_SWITCH:
-		sm = (struct soc_mixer_control *)kc->private_value;
-		scontrol = sm->dobj.private;
-		break;
-	case SOF_CTRL_CMD_BINARY:
-		be = (struct soc_bytes_ext *)kc->private_value;
-		scontrol = be->dobj.private;
-		break;
-	case SOF_CTRL_CMD_ENUM:
-		se = (struct soc_enum *)kc->private_value;
-		scontrol = se->dobj.private;
-		break;
-	default:
-		return;
-	}
-
-	expected_size = sizeof(struct sof_ipc_ctrl_data);
-	switch (cdata->type) {
-	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
-	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
-		expected_size += cdata->num_elems *
-				 sizeof(struct sof_ipc_ctrl_value_chan);
-		break;
-	case SOF_CTRL_TYPE_DATA_GET:
-	case SOF_CTRL_TYPE_DATA_SET:
-		expected_size += cdata->num_elems + sizeof(struct sof_abi_hdr);
-		break;
-	default:
-		return;
-	}
-
-	if (cdata->rhdr.hdr.size != expected_size) {
-		dev_err(sdev->dev, "error: component notification size mismatch\n");
-		return;
-	}
-
-	if (cdata->num_elems)
-		/*
-		 * The message includes the updated value/data, update the
-		 * control's local cache using the received notification
-		 */
-		snd_sof_update_control(scontrol, cdata);
-	else
-		/* Mark the scontrol that the value/data is changed in SOF */
-		scontrol->comp_data_dirty = true;
-
-	snd_ctl_notify_one(swidget->scomp->card->snd_card,
-			   SNDRV_CTL_EVENT_MASK_VALUE, kc, 0);
-}
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 46a989be9a82..af0ae137842b 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -470,6 +470,7 @@ EXPORT_SYMBOL(snd_sof_ipc_reply);
 
 static void ipc_comp_notification(struct snd_sof_dev *sdev, void *msg_buf)
 {
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 	struct sof_ipc_cmd_hdr *hdr = msg_buf;
 	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
 
@@ -482,7 +483,8 @@ static void ipc_comp_notification(struct snd_sof_dev *sdev, void *msg_buf)
 		return;
 	}
 
-	snd_sof_control_notify(sdev, msg_buf);
+	if (tplg_ops->control->update)
+		tplg_ops->control->update(sdev, msg_buf);
 }
 
 /* DSP firmware has sent host a message  */
@@ -1031,7 +1033,7 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 	ipc->ops = &ipc3_ops;
 
 	/* check for mandatory ops */
-	if (!ipc->ops->tplg || !ipc->ops->tplg->widget) {
+	if (!ipc->ops->tplg || !ipc->ops->tplg->widget || !ipc->ops->tplg->control) {
 		dev_err(sdev->dev, "Invalid topology IPC ops\n");
 		return NULL;
 	}
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
new file mode 100644
index 000000000000..d4086e805c18
--- /dev/null
+++ b/sound/soc/sof/ipc3-control.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+//
+
+#include "sof-priv.h"
+#include "sof-audio.h"
+#include "ipc3-ops.h"
+
+static void snd_sof_update_control(struct snd_sof_control *scontrol,
+				   struct sof_ipc_ctrl_data *cdata)
+{
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_ipc_ctrl_data *local_cdata;
+	int i;
+
+	local_cdata = scontrol->ipc_control_data;
+
+	if (cdata->cmd == SOF_CTRL_CMD_BINARY) {
+		if (cdata->num_elems != local_cdata->data->size) {
+			dev_err(scomp->dev, "cdata binary size mismatch %u - %u\n",
+				cdata->num_elems, local_cdata->data->size);
+			return;
+		}
+
+		/* copy the new binary data */
+		memcpy(local_cdata->data, cdata->data, cdata->num_elems);
+	} else if (cdata->num_elems != scontrol->num_channels) {
+		dev_err(scomp->dev, "cdata channel count mismatch %u - %d\n",
+			cdata->num_elems, scontrol->num_channels);
+	} else {
+		/* copy the new values */
+		for (i = 0; i < cdata->num_elems; i++)
+			local_cdata->chanv[i].value = cdata->chanv[i].value;
+	}
+}
+
+static void sof_ipc3_control_update(struct snd_sof_dev *sdev, void *ipc_control_message)
+{
+	struct sof_ipc_ctrl_data *cdata = ipc_control_message;
+	struct snd_soc_dapm_widget *widget;
+	struct snd_sof_control *scontrol;
+	struct snd_sof_widget *swidget;
+	struct snd_kcontrol *kc = NULL;
+	struct soc_mixer_control *sm;
+	struct soc_bytes_ext *be;
+	size_t expected_size;
+	struct soc_enum *se;
+	bool found = false;
+	int i, type;
+
+	if (cdata->type == SOF_CTRL_TYPE_VALUE_COMP_GET ||
+	    cdata->type == SOF_CTRL_TYPE_VALUE_COMP_SET) {
+		dev_err(sdev->dev, "Component data is not supported in control notification\n");
+		return;
+	}
+
+	/* Find the swidget first */
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (swidget->comp_id == cdata->comp_id) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found)
+		return;
+
+	/* Translate SOF cmd to TPLG type */
+	switch (cdata->cmd) {
+	case SOF_CTRL_CMD_VOLUME:
+	case SOF_CTRL_CMD_SWITCH:
+		type = SND_SOC_TPLG_TYPE_MIXER;
+		break;
+	case SOF_CTRL_CMD_BINARY:
+		type = SND_SOC_TPLG_TYPE_BYTES;
+		break;
+	case SOF_CTRL_CMD_ENUM:
+		type = SND_SOC_TPLG_TYPE_ENUM;
+		break;
+	default:
+		dev_err(sdev->dev, "Unknown cmd %u in %s\n", cdata->cmd, __func__);
+		return;
+	}
+
+	widget = swidget->widget;
+	for (i = 0; i < widget->num_kcontrols; i++) {
+		/* skip non matching types or non matching indexes within type */
+		if (widget->dobj.widget.kcontrol_type[i] == type &&
+		    widget->kcontrol_news[i].index == cdata->index) {
+			kc = widget->kcontrols[i];
+			break;
+		}
+	}
+
+	if (!kc)
+		return;
+
+	switch (cdata->cmd) {
+	case SOF_CTRL_CMD_VOLUME:
+	case SOF_CTRL_CMD_SWITCH:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		scontrol = sm->dobj.private;
+		break;
+	case SOF_CTRL_CMD_BINARY:
+		be = (struct soc_bytes_ext *)kc->private_value;
+		scontrol = be->dobj.private;
+		break;
+	case SOF_CTRL_CMD_ENUM:
+		se = (struct soc_enum *)kc->private_value;
+		scontrol = se->dobj.private;
+		break;
+	default:
+		return;
+	}
+
+	expected_size = sizeof(struct sof_ipc_ctrl_data);
+	switch (cdata->type) {
+	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
+	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
+		expected_size += cdata->num_elems *
+				 sizeof(struct sof_ipc_ctrl_value_chan);
+		break;
+	case SOF_CTRL_TYPE_DATA_GET:
+	case SOF_CTRL_TYPE_DATA_SET:
+		expected_size += cdata->num_elems + sizeof(struct sof_abi_hdr);
+		break;
+	default:
+		return;
+	}
+
+	if (cdata->rhdr.hdr.size != expected_size) {
+		dev_err(sdev->dev, "Component notification size mismatch\n");
+		return;
+	}
+
+	if (cdata->num_elems)
+		/*
+		 * The message includes the updated value/data, update the
+		 * control's local cache using the received notification
+		 */
+		snd_sof_update_control(scontrol, cdata);
+	else
+		/* Mark the scontrol that the value/data is changed in SOF */
+		scontrol->comp_data_dirty = true;
+
+	snd_ctl_notify_one(swidget->scomp->card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, kc, 0);
+}
+
+const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
+	.update = sof_ipc3_control_update,
+};
diff --git a/sound/soc/sof/ipc3-ops.h b/sound/soc/sof/ipc3-ops.h
index 5d8cab92c1a4..f3d6010d0b77 100644
--- a/sound/soc/sof/ipc3-ops.h
+++ b/sound/soc/sof/ipc3-ops.h
@@ -15,5 +15,6 @@
 
 extern const struct sof_ipc_tplg_ops ipc3_tplg_ops;
 extern const struct sof_ipc_ops ipc3_ops;
+extern const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops;
 
 #endif
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index bf0cf38f4524..55be97ee816b 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2155,6 +2155,7 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 
 const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.widget = tplg_ipc3_widget_ops,
+	.control = &tplg_ipc3_control_ops,
 	.route_setup = sof_ipc3_route_setup,
 	.control_setup = sof_ipc3_control_setup,
 	.control_free = sof_ipc3_control_free,
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index d241dd84e708..bcd38c882078 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -46,9 +46,9 @@ struct snd_sof_dai_config_data {
 };
 
 /**
- * struct ipc_tplg_control_ops - IPC-specific ops for topology kcontrol IO
+ * struct sof_ipc_tplg_control_ops - IPC-specific ops for topology kcontrol IO
  */
-struct ipc_tplg_control_ops {
+struct sof_ipc_tplg_control_ops {
 	bool (*volume_put)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
 	int (*volume_get)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
 	bool (*switch_put)(struct snd_sof_control *scontrol, struct snd_ctl_elem_value *ucontrol);
@@ -103,7 +103,7 @@ struct sof_ipc_tplg_widget_ops {
  */
 struct sof_ipc_tplg_ops {
 	const struct sof_ipc_tplg_widget_ops *widget;
-	const struct ipc_tplg_control_ops *control;
+	const struct sof_ipc_tplg_control_ops *control;
 	int (*route_setup)(struct snd_sof_dev *sdev, struct snd_sof_route *sroute);
 	const struct sof_token_info *token_list;
 	int (*control_setup)(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol);
-- 
2.25.1

