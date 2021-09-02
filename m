Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 434983FED36
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 13:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CABC3179B;
	Thu,  2 Sep 2021 13:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CABC3179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630583683;
	bh=6JyxSlFaeNRNyuWXrqfGn10IuIGUhHmsQ+HXIxelzjY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d1Chn8M0ko//XNwZX3MxHN/ELBt+OoIt/lHhefiQw21u3rQ2tUhm+LENVLHXQYWlT
	 qxHKJYiYqD089qbaCEAD1js5lEh3GWTQndR5T0cK6t3OrkqrwFvLZAVoepMYBivmTN
	 rPosZmDlKY1jRWrXJ7Nl8Gl2OxucNBQ5Rorear1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32DC5F8028D;
	Thu,  2 Sep 2021 13:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC9B2F80269; Thu,  2 Sep 2021 13:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B2CAF8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 13:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B2CAF8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="199314406"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="199314406"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 04:53:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="467371114"
Received: from leeyapha-desk2.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.212.83])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 04:53:11 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Handle control change notification from firmware
Date: Thu,  2 Sep 2021 14:53:28 +0300
Message-Id: <20210902115328.28478-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

If the value/data associated with a control changes in SOF it will send a
notification (SOF_IPC_GLB_COMP_MSG with SOF_IPC_COMP_GET_VALUE/DATA).

We have support for binary volatile control type, but we might have
features where enum/switch/volume changes. Re-implementing everything as
volatile as well would be not much of a gain for several reasons:
- volatile controls would do an IPC all the time, regardless if there is a
  need or not.
- We still don't have notification which forces userspace to continuously
  poll.

When such notification arrives we use snd_ctl_notify_one() to signal
userspace about the change.

The kernel is prepared for two types of notification:
- the notification carries the new data for the control (num_elems != 0)
The new value/data is copied to the control's local data

- blank message about a change
The new flag for the scontrol (comp_data_dirty) is set and when next
time user space reads the value via the kcontrol's get callback we will
refresh the control's local data from the firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Tested-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
---
 sound/soc/sof/control.c   | 186 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc.c       |  35 +++++++
 sound/soc/sof/sof-audio.h |   5 +
 3 files changed, 226 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 504500dd4d43..58bb89af4de1 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -65,6 +65,40 @@ static inline u32 ipc_to_mixer(u32 value, u32 *volume_map, int size)
 	return i - 1;
 }
 
+static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	enum sof_ipc_ctrl_type ctrl_type;
+	int ret;
+
+	if (!scontrol->comp_data_dirty)
+		return;
+
+	if (!pm_runtime_active(scomp->dev))
+		return;
+
+	if (scontrol->cmd == SOF_CTRL_CMD_BINARY)
+		ctrl_type = SOF_IPC_COMP_GET_DATA;
+	else
+		ctrl_type = SOF_IPC_COMP_GET_VALUE;
+
+	/* set the ABI header values */
+	cdata->data->magic = SOF_ABI_MAGIC;
+	cdata->data->abi = SOF_ABI_VERSION;
+
+	/* refresh the component data from DSP */
+	scontrol->comp_data_dirty = false;
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, ctrl_type,
+					    SOF_CTRL_TYPE_VALUE_CHAN_GET,
+					    scontrol->cmd, false);
+	if (ret < 0) {
+		dev_err(scomp->dev, "error: failed to get control data: %d\n", ret);
+		/* Set the flag to re-try next time to get the data */
+		scontrol->comp_data_dirty = true;
+	}
+}
+
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -74,6 +108,8 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
 
+	snd_sof_refresh_control(scontrol);
+
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
 		ucontrol->value.integer.value[i] =
@@ -145,6 +181,8 @@ int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
 
+	snd_sof_refresh_control(scontrol);
+
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
 		ucontrol->value.integer.value[i] = cdata->chanv[i].value;
@@ -195,6 +233,8 @@ int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
 
+	snd_sof_refresh_control(scontrol);
+
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
 		ucontrol->value.enumerated.item[i] = cdata->chanv[i].value;
@@ -244,6 +284,8 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size;
 
+	snd_sof_refresh_control(scontrol);
+
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(scomp->dev,
 				    "error: data max %d exceeds ucontrol data array size\n",
@@ -475,6 +517,8 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 		(struct snd_ctl_tlv __user *)binary_data;
 	size_t data_size;
 
+	snd_sof_refresh_control(scontrol);
+
 	/*
 	 * Decrement the limit by ext bytes header size to
 	 * ensure the user space buffer is not exceeded.
@@ -511,3 +555,145 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 
 	return 0;
 }
+
+static void snd_sof_update_control(struct snd_sof_control *scontrol,
+				   struct sof_ipc_ctrl_data *cdata)
+{
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_ipc_ctrl_data *local_cdata;
+	int i;
+
+	local_cdata = scontrol->control_data;
+
+	if (cdata->cmd == SOF_CTRL_CMD_BINARY) {
+		if (cdata->num_elems != local_cdata->data->size) {
+			dev_err(scomp->dev,
+				"error: cdata binary size mismatch %u - %u\n",
+				cdata->num_elems, local_cdata->data->size);
+			return;
+		}
+
+		/* copy the new binary data */
+		memcpy(local_cdata->data, cdata->data, cdata->num_elems);
+	} else if (cdata->num_elems != scontrol->num_channels) {
+		dev_err(scomp->dev,
+			"error: cdata channel count mismatch %u - %d\n",
+			cdata->num_elems, scontrol->num_channels);
+	} else {
+		/* copy the new values */
+		for (i = 0; i < cdata->num_elems; i++)
+			local_cdata->chanv[i].value = cdata->chanv[i].value;
+	}
+}
+
+void snd_sof_control_notify(struct snd_sof_dev *sdev,
+			    struct sof_ipc_ctrl_data *cdata)
+{
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
+		dev_err(sdev->dev, "error: unknown cmd %u\n", cdata->cmd);
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
+	case SOF_CTRL_TYPE_VALUE_COMP_GET:
+	case SOF_CTRL_TYPE_VALUE_COMP_SET:
+		expected_size += cdata->num_elems *
+				 sizeof(struct sof_ipc_ctrl_value_comp);
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
+		dev_err(sdev->dev, "error: component notification size mismatch\n");
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
+	snd_ctl_notify_one(swidget->scomp->card->snd_card,
+			   SNDRV_CTL_EVENT_MASK_VALUE, kc, 0);
+}
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index c2d07b783f60..6260f4ba5618 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -369,6 +369,39 @@ void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
 }
 EXPORT_SYMBOL(snd_sof_ipc_reply);
 
+static void ipc_comp_notification(struct snd_sof_dev *sdev,
+				  struct sof_ipc_cmd_hdr *hdr)
+{
+	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
+	struct sof_ipc_ctrl_data *cdata;
+	int ret;
+
+	switch (msg_type) {
+	case SOF_IPC_COMP_GET_VALUE:
+	case SOF_IPC_COMP_GET_DATA:
+		cdata = kmalloc(hdr->size, GFP_KERNEL);
+		if (!cdata)
+			return;
+
+		/* read back full message */
+		ret = snd_sof_ipc_msg_data(sdev, NULL, cdata, hdr->size);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: failed to read component event: %d\n", ret);
+			goto err;
+		}
+		break;
+	default:
+		dev_err(sdev->dev, "error: unhandled component message %#x\n", msg_type);
+		return;
+	}
+
+	snd_sof_control_notify(sdev, cdata);
+
+err:
+	kfree(cdata);
+}
+
 /* DSP firmware has sent host a message  */
 void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 {
@@ -404,7 +437,9 @@ void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 	case SOF_IPC_GLB_COMPOUND:
 	case SOF_IPC_GLB_TPLG_MSG:
 	case SOF_IPC_GLB_PM_MSG:
+		break;
 	case SOF_IPC_GLB_COMP_MSG:
+		ipc_comp_notification(sdev, &hdr);
 		break;
 	case SOF_IPC_GLB_STREAM_MSG:
 		/* need to pass msg id into the function */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index dc274e63ed9a..9a8d005e75a0 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -75,6 +75,9 @@ struct snd_sof_control {
 	struct list_head list;	/* list in sdev control list */
 
 	struct snd_sof_led_control led_ctl;
+
+	/* if true, the control's data needs to be updated from Firmware */
+	bool comp_data_dirty;
 };
 
 /* ASoC SOF DAPM widget */
@@ -148,6 +151,8 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 			  unsigned int size);
 int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int __user *binary_data,
 				   unsigned int size);
+void snd_sof_control_notify(struct snd_sof_dev *sdev,
+			    struct sof_ipc_ctrl_data *cdata);
 
 /*
  * Topology.
-- 
2.33.0

