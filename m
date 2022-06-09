Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE35441ED
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A5FD2006;
	Thu,  9 Jun 2022 05:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A5FD2006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745420;
	bh=qu9tmBK6u/7yO8vPedvGXJgeHYDFYaF4lQfGQ2EDxC0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+ROG4+nD2YBdf+HmAfPF97ucbyDWHYBF0BcytNmp3ci5I3bQpWsvuYGcmYAGgK+3
	 5MohDaeixEfagof8YcXOZBgsKnsWrOUW8B8qB4ON/rxT6d+0xAz9NP3AeBaHuIudMA
	 1S2R5kPFYTae/2fPIG+p0buijK0LCmSuyVguy/ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41F54F8057D;
	Thu,  9 Jun 2022 05:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24DD3F80578; Thu,  9 Jun 2022 05:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19806F80533
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19806F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="E8ioZqu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745238; x=1686281238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qu9tmBK6u/7yO8vPedvGXJgeHYDFYaF4lQfGQ2EDxC0=;
 b=E8ioZqu5EmLnF7N0kHZv66pvU39AsEX85YcF7fyeR7GTYsh3XfwWoh73
 zGwoqJld6hiadYnqj3Zy1b2n4DQKTyAgAxW+l+fJaRYFAVPX43ULKmUnO
 G/BcGOrn6FqZVbstOEaibvWvBcESLiwT5ljx0z4Cy09F4g8qPs5tgCsyu
 AYd3TmVb4guPlU4KDNYLTNc8KvCjTOFH9kq6t33TmGlTbPuU6WAs67Xp6
 CFlmcW+L8UyICPyGr44BdIZk8eLae+TSqx3JtI59v3jRmVRTBypmToruj
 FUKKS38ULhhdQwupbLjS+CGSIqlZBUejp1XJTFDM0iGeoKCGMFZzBKVYA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219559"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219559"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260242"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/23] ASoC: SOF: ipc4-topology: Add control IO ops
Date: Wed,  8 Jun 2022 20:26:30 -0700
Message-Id: <20220609032643.916882-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Define the kcontrol IO ops for volume type controls for IPC4. Support
for other kcontrol types will be added later.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Makefile        |   2 +-
 sound/soc/sof/ipc4-control.c  | 216 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h     |   1 +
 sound/soc/sof/ipc4-topology.c |   1 +
 4 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/ipc4-control.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 73524fadb3ce..1e15937f2bde 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -4,7 +4,7 @@ snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
 		ipc3-topology.o ipc3-control.o ipc3.o ipc3-pcm.o ipc3-loader.o\
 		ipc3-dtrace.o\
-		ipc4.o ipc4-loader.o ipc4-topology.o
+		ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
new file mode 100644
index 000000000000..95ee121dd3cf
--- /dev/null
+++ b/sound/soc/sof/ipc4-control.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+//
+
+#include "sof-priv.h"
+#include "sof-audio.h"
+#include "ipc4-priv.h"
+#include "ipc4-topology.h"
+
+static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool set)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_ops *iops = sdev->ipc->ops;
+	struct sof_ipc4_msg *msg = &cdata->msg;
+	struct snd_sof_widget *swidget;
+	bool widget_found = false;
+
+	/* find widget associated with the control */
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (swidget->comp_id == scontrol->comp_id) {
+			widget_found = true;
+			break;
+		}
+	}
+
+	if (!widget_found) {
+		dev_err(scomp->dev, "Failed to find widget for kcontrol %s\n", scontrol->name);
+		return -ENOENT;
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
+	msg->primary &= ~SOF_IPC4_MOD_INSTANCE_MASK;
+	msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
+
+	return iops->set_get_data(sdev, msg, msg->data_size, set);
+}
+
+static int
+sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
+			 struct snd_sof_control *scontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct sof_ipc4_gain *gain = swidget->private;
+	struct sof_ipc4_msg *msg = &cdata->msg;
+	struct sof_ipc4_gain_data data;
+	bool all_channels_equal = true;
+	u32 value;
+	int ret, i;
+
+	/* check if all channel values are equal */
+	value = cdata->chanv[0].value;
+	for (i = 1; i < scontrol->num_channels; i++) {
+		if (cdata->chanv[i].value != value) {
+			all_channels_equal = false;
+			break;
+		}
+	}
+
+	/*
+	 * notify DSP with a single IPC message if all channel values are equal. Otherwise send
+	 * a separate IPC for each channel.
+	 */
+	for (i = 0; i < scontrol->num_channels; i++) {
+		if (all_channels_equal) {
+			data.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
+			data.init_val = cdata->chanv[0].value;
+		} else {
+			data.channels = cdata->chanv[i].channel;
+			data.init_val = cdata->chanv[i].value;
+		}
+
+		/* set curve type and duration from topology */
+		data.curve_duration = gain->data.curve_duration;
+		data.curve_type = gain->data.curve_type;
+
+		msg->data_ptr = &data;
+		msg->data_size = sizeof(data);
+
+		ret = sof_ipc4_set_get_kcontrol_data(scontrol, true);
+		msg->data_ptr = NULL;
+		msg->data_size = 0;
+		if (ret < 0) {
+			dev_err(sdev->dev, "Failed to set volume update for %s\n",
+				scontrol->name);
+			return ret;
+		}
+
+		if (all_channels_equal)
+			break;
+	}
+
+	return 0;
+}
+
+static bool sof_ipc4_volume_put(struct snd_sof_control *scontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	unsigned int channels = scontrol->num_channels;
+	struct snd_sof_widget *swidget;
+	bool widget_found = false;
+	bool change = false;
+	unsigned int i;
+	int ret;
+
+	/* update each channel */
+	for (i = 0; i < channels; i++) {
+		u32 value = mixer_to_ipc(ucontrol->value.integer.value[i],
+					 scontrol->volume_table, scontrol->max + 1);
+
+		change = change || (value != cdata->chanv[i].value);
+		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
+	}
+
+	if (!pm_runtime_active(scomp->dev))
+		return change;
+
+	/* find widget associated with the control */
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (swidget->comp_id == scontrol->comp_id) {
+			widget_found = true;
+			break;
+		}
+	}
+
+	if (!widget_found) {
+		dev_err(scomp->dev, "Failed to find widget for kcontrol %s\n", scontrol->name);
+		return -ENOENT;
+	}
+
+	ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol);
+	if (ret < 0)
+		return false;
+
+	return change;
+}
+
+static int sof_ipc4_volume_get(struct snd_sof_control *scontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	unsigned int channels = scontrol->num_channels;
+	unsigned int i;
+
+	for (i = 0; i < channels; i++)
+		ucontrol->value.integer.value[i] = ipc_to_mixer(cdata->chanv[i].value,
+								scontrol->volume_table,
+								scontrol->max + 1);
+
+	return 0;
+}
+
+/* set up all controls for the widget */
+static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct snd_sof_control *scontrol;
+	int ret;
+
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+		if (scontrol->comp_id == swidget->comp_id) {
+			ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol);
+			if (ret < 0) {
+				dev_err(sdev->dev, "%s: kcontrol %d set up failed for widget %s\n",
+					__func__, scontrol->comp_id, swidget->widget->name);
+				return ret;
+			}
+		}
+
+	return 0;
+}
+
+static int
+sof_ipc4_set_up_volume_table(struct snd_sof_control *scontrol, int tlv[SOF_TLV_ITEMS], int size)
+{
+	int i;
+
+	/* init the volume table */
+	scontrol->volume_table = kcalloc(size, sizeof(u32), GFP_KERNEL);
+	if (!scontrol->volume_table)
+		return -ENOMEM;
+
+	/* populate the volume table */
+	for (i = 0; i < size ; i++) {
+		u32 val = vol_compute_gain(i, tlv);
+		u64 q31val = ((u64)val) << 15; /* Can be over Q1.31, need to saturate */
+
+		scontrol->volume_table[i] = q31val > SOF_IPC4_VOL_ZERO_DB ?
+						SOF_IPC4_VOL_ZERO_DB : q31val;
+	}
+
+	return 0;
+}
+
+const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops = {
+	.volume_put = sof_ipc4_volume_put,
+	.volume_get = sof_ipc4_volume_get,
+	.widget_kcontrol_setup = sof_ipc4_widget_kcontrol_setup,
+	.set_up_volume_table = sof_ipc4_set_up_volume_table,
+};
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 5388b888fefa..d0b110811aeb 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -41,5 +41,6 @@ struct sof_ipc4_fw_module {
 
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
 extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
+extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
 
 #endif
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 0c36b7cb6e79..3cebd6fe7cd1 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1157,4 +1157,5 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.widget = tplg_ipc4_widget_ops,
 	.token_list = ipc4_token_list,
 	.control_setup = sof_ipc4_control_setup,
+	.control = &tplg_ipc4_control_ops,
 };
-- 
2.25.1

