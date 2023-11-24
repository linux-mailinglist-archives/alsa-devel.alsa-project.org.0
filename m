Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B97F7756
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 16:10:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F4EE8F;
	Fri, 24 Nov 2023 16:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F4EE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700838606;
	bh=10zQAPrpkF9y0YqtC/QfVdfBnl4X3to42bmLOqtpYMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cigXRGpU0FZdMnhcbIqyJj89lR2M++XiWtt4ejbGEXTrLr5k91OL0CtYQ2LusZ6UN
	 h8EYCa1wK+hPDNUSamTAwS9m87FmjHUKV7TUq2zoqW3u5u6bHWSQJc6BjcRY8wuuld
	 ybkfbK2YBq7pNa/Jd4fKBwfukBtTN+cL1ipCflUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D600F80607; Fri, 24 Nov 2023 16:08:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD329F80606;
	Fri, 24 Nov 2023 16:08:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8CBF805D3; Fri, 24 Nov 2023 16:08:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 376ADF80310
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 16:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 376ADF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Naq9AkI6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838514; x=1732374514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=10zQAPrpkF9y0YqtC/QfVdfBnl4X3to42bmLOqtpYMc=;
  b=Naq9AkI6Nbdop5vqMNCUTNpCqSFb9gkWUUfKkCpWqrfokJT2RnEJmQWM
   eoa/+tV8PC0jgA6zP30tOJXJ3YiUUx2PU2XCCn1Kb954RBayktY7NllGn
   LY3vODgC6WoJtXOgtBNzRZ22kabO+gfP0Zi1dSYV/wgQXh7UGa+73w0Cb
   3JdJwu7g6y90Uy88E77RfuzUZPIX1Ml/41600qkPEVz9jm3pZejMrBGG3
   pAaRbIz+DvUJvS4A2WnLzF4UHaSvpI+1boebbTRFUEcLXOd1z38l/nEFW
   A8n6A5btC0LnN8GbShXijayqGLCWKSqLT7AaQKnV5UM7bVgU7FeRAn7vM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477065"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="377477065"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915680"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="743915680"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 3/4] ASoC: SOF: ipc4-control: Implement control update for
 switch/enum controls
Date: Fri, 24 Nov 2023 17:08:52 +0200
Message-ID: <20231124150853.18648-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F2OC4RZW57IEFYLD3L2A6UJAHEAUZ2YO
X-Message-ID-Hash: F2OC4RZW57IEFYLD3L2A6UJAHEAUZ2YO
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2OC4RZW57IEFYLD3L2A6UJAHEAUZ2YO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Implement the sof_ipc_tplg_control_ops.update function to support a control
change notification from the firmware on switch or enum control types.

Based on the module notification message content, look up the swidget, then
the scontrol which was the source of the notification then if the message
contains the changed values update the cached values.
If only a notification without values received, marked the control as dirty
and on next read access fetch the new values from the firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 179 +++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 938efaceb81c..3d2a35f27a87 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -240,6 +240,50 @@ sof_ipc4_set_generic_control_data(struct snd_sof_dev *sdev,
 	return ret;
 }
 
+static void sof_ipc4_refresh_generic_control(struct snd_sof_control *scontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_ipc4_control_msg_payload *data;
+	struct sof_ipc4_msg *msg = &cdata->msg;
+	size_t data_size;
+	unsigned int i;
+	int ret;
+
+	if (!scontrol->comp_data_dirty)
+		return;
+
+	if (!pm_runtime_active(scomp->dev))
+		return;
+
+	data_size = struct_size(data, chanv, scontrol->num_channels);
+	data = kmalloc(data_size, GFP_KERNEL);
+	if (!data)
+		return;
+
+	data->id = cdata->index;
+	data->num_elems = scontrol->num_channels;
+	msg->data_ptr = data;
+	msg->data_size = data_size;
+
+	scontrol->comp_data_dirty = false;
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, false, true);
+	msg->data_ptr = NULL;
+	msg->data_size = 0;
+	if (!ret) {
+		for (i = 0; i < scontrol->num_channels; i++) {
+			cdata->chanv[i].channel = data->chanv[i].channel;
+			cdata->chanv[i].value = data->chanv[i].value;
+		}
+	} else {
+		dev_err(scomp->dev, "Failed to read control data for %s\n",
+			scontrol->name);
+		scontrol->comp_data_dirty = true;
+	}
+
+	kfree(data);
+}
+
 static bool sof_ipc4_switch_put(struct snd_sof_control *scontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
@@ -290,6 +334,8 @@ static int sof_ipc4_switch_get(struct snd_sof_control *scontrol,
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	unsigned int i;
 
+	sof_ipc4_refresh_generic_control(scontrol);
+
 	/* read back each channel */
 	for (i = 0; i < scontrol->num_channels; i++)
 		ucontrol->value.integer.value[i] = cdata->chanv[i].value;
@@ -347,6 +393,8 @@ static int sof_ipc4_enum_get(struct snd_sof_control *scontrol,
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	unsigned int i;
 
+	sof_ipc4_refresh_generic_control(scontrol);
+
 	/* read back each channel */
 	for (i = 0; i < scontrol->num_channels; i++)
 		ucontrol->value.enumerated.item[i] = cdata->chanv[i].value;
@@ -601,6 +649,136 @@ sof_ipc4_volsw_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 	return sof_ipc4_set_volume_data(sdev, swidget, scontrol, false);
 }
 
+#define PARAM_ID_FROM_EXTENSION(_ext)	(((_ext) & SOF_IPC4_MOD_EXT_MSG_PARAM_ID_MASK)	\
+					 >> SOF_IPC4_MOD_EXT_MSG_PARAM_ID_SHIFT)
+
+static void sof_ipc4_control_update(struct snd_sof_dev *sdev, void *ipc_message)
+{
+	struct sof_ipc4_msg *ipc4_msg = ipc_message;
+	struct sof_ipc4_notify_module_data *ndata = ipc4_msg->data_ptr;
+	struct sof_ipc4_control_msg_payload *msg_data;
+	struct sof_ipc4_control_data *cdata;
+	struct snd_soc_dapm_widget *widget;
+	struct snd_sof_control *scontrol;
+	struct snd_sof_widget *swidget;
+	struct snd_kcontrol *kc = NULL;
+	bool scontrol_found = false;
+	u32 event_param_id;
+	int i, type;
+
+	if (ndata->event_data_size < sizeof(*msg_data)) {
+		dev_err(sdev->dev,
+			"%s: Invalid event data size for module %u.%u: %u\n",
+			__func__, ndata->module_id, ndata->instance_id,
+			ndata->event_data_size);
+		return;
+	}
+
+	event_param_id = ndata->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_PARAMID_MASK;
+	switch (event_param_id) {
+	case SOF_IPC4_SWITCH_CONTROL_PARAM_ID:
+		type = SND_SOC_TPLG_TYPE_MIXER;
+		break;
+	case SOF_IPC4_ENUM_CONTROL_PARAM_ID:
+		type = SND_SOC_TPLG_TYPE_ENUM;
+		break;
+	default:
+		dev_err(sdev->dev,
+			"%s: Invalid control type for module %u.%u: %u\n",
+			__func__, ndata->module_id, ndata->instance_id,
+			event_param_id);
+		return;
+	}
+
+	/* Find the swidget based on ndata->module_id and ndata->instance_id */
+	swidget = sof_ipc4_find_swidget_by_ids(sdev, ndata->module_id,
+					       ndata->instance_id);
+	if (!swidget) {
+		dev_err(sdev->dev, "%s: Failed to find widget for module %u.%u\n",
+			__func__, ndata->module_id, ndata->instance_id);
+		return;
+	}
+
+	/* Find the scontrol which is the source of the notification */
+	msg_data = (struct sof_ipc4_control_msg_payload *)ndata->event_data;
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
+		if (scontrol->comp_id == swidget->comp_id) {
+			u32 local_param_id;
+
+			cdata = scontrol->ipc_control_data;
+			/*
+			 * The scontrol's param_id is stored in the IPC message
+			 * template's extension
+			 */
+			local_param_id = PARAM_ID_FROM_EXTENSION(cdata->msg.extension);
+			if (local_param_id == event_param_id &&
+			    msg_data->id == cdata->index) {
+				scontrol_found = true;
+				break;
+			}
+		}
+	}
+
+	if (!scontrol_found) {
+		dev_err(sdev->dev,
+			"%s: Failed to find control on widget %s: %u:%u\n",
+			__func__, swidget->widget->name, ndata->event_id & 0xffff,
+			msg_data->id);
+		return;
+	}
+
+	if (msg_data->num_elems) {
+		/*
+		 * The message includes the updated value/data, update the
+		 * control's local cache using the received notification
+		 */
+		for (i = 0; i < msg_data->num_elems; i++) {
+			u32 channel = msg_data->chanv[i].channel;
+
+			if (channel >= scontrol->num_channels) {
+				dev_warn(sdev->dev,
+					 "Invalid channel index for %s: %u\n",
+					 scontrol->name, i);
+
+				/*
+				 * Mark the scontrol as dirty to force a refresh
+				 * on next read
+				 */
+				scontrol->comp_data_dirty = true;
+				break;
+			}
+
+			cdata->chanv[channel].value = msg_data->chanv[i].value;
+		}
+	} else {
+		/*
+		 * Mark the scontrol as dirty because the value/data is changed
+		 * in firmware, forcing a refresh on next read access
+		 */
+		scontrol->comp_data_dirty = true;
+	}
+
+	/*
+	 * Look up the ALSA kcontrol of the scontrol to be able to send a
+	 * notification to user space
+	 */
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
+	snd_ctl_notify_one(swidget->scomp->card->snd_card,
+			   SNDRV_CTL_EVENT_MASK_VALUE, kc, 0);
+}
+
 /* set up all controls for the widget */
 static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
@@ -674,6 +852,7 @@ const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops = {
 	.bytes_ext_put = sof_ipc4_bytes_ext_put,
 	.bytes_ext_get = sof_ipc4_bytes_ext_get,
 	.bytes_ext_volatile_get = sof_ipc4_bytes_ext_volatile_get,
+	.update = sof_ipc4_control_update,
 	.widget_kcontrol_setup = sof_ipc4_widget_kcontrol_setup,
 	.set_up_volume_table = sof_ipc4_set_up_volume_table,
 };
-- 
2.42.1

