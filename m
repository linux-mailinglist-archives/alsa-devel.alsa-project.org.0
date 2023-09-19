Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7717A5FA1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9259CE72;
	Tue, 19 Sep 2023 12:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9259CE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119588;
	bh=xBlWiOhVkuC26i8NTKj4MmiVn7+syUPmpRf+tKJQeYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mEOOFELQo3ctKJT24RbiVTUElDk//wQXOm3z0bHIFS8SXF0p7c8UnVO53yA2xkucW
	 gWJfflYa/SQjZ9tPEOhjCF7FbIe/89OWSGtQLlQ+TJ+WF0h3JxdsRzXzA10UmEI+UN
	 yeEyg2WzorxI8oLvF1PVAddxlKFjJl6OC2LwF2NQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A8A3F8057B; Tue, 19 Sep 2023 12:31:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2BDCF8056F;
	Tue, 19 Sep 2023 12:31:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34518F8055C; Tue, 19 Sep 2023 12:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD27BF8025A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD27BF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C69l46DL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695119477; x=1726655477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xBlWiOhVkuC26i8NTKj4MmiVn7+syUPmpRf+tKJQeYU=;
  b=C69l46DLRLgiLVwomvjW4PjJr3PEvkNBRbBcO1O9hCMW63XZIlYq1A8W
   v3ls00Xj/DEbIsStQIuQ3Pv5AB2PvtCnYkgZ3nVVN+nWfNqW8SfUz8zyc
   0aiLY1dEyewZRBt7kBRfNWR+tIffQHZBq7bBCSBp/U5pgutVrAVMWgjpu
   JyMOeg/Oz93c3hKgN8x5gpY5D/yh2uIUyF6Xvy7ORjmWZZ2ho8nDuHwtM
   AVUJgOUUg36L/fJgpWQdJaEF4zVpr6r/Bg9XeuSine1G6rFZux5hAW8Gh
   HT9iGkDS5wdltbb/ay1kyxhZztI3kdIUH3Cj0gSy600Htu6GkimhVmDI2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443990509"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="443990509"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861486867"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861486867"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: ipc4-control: Add support for ALSA switch
 control
Date: Tue, 19 Sep 2023 13:31:14 +0300
Message-ID: <20230919103115.30783-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
References: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GCGB3U2EJ2TFH7A7K6WZOGA5TA7XMHUQ
X-Message-ID-Hash: GCGB3U2EJ2TFH7A7K6WZOGA5TA7XMHUQ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCGB3U2EJ2TFH7A7K6WZOGA5TA7XMHUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Volume controls with a max value of 1 are switches.
Switch controls use generic param_id and a generic struct where the data
is passed to the firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c  | 111 +++++++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.c |  16 ++++-
 2 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index c6d404d44097..cabdd891c644 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -201,6 +201,102 @@ static int sof_ipc4_volume_get(struct snd_sof_control *scontrol,
 	return 0;
 }
 
+static int
+sof_ipc4_set_generic_control_data(struct snd_sof_dev *sdev,
+				  struct snd_sof_widget *swidget,
+				  struct snd_sof_control *scontrol, bool lock)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct sof_ipc4_control_msg_payload *data;
+	struct sof_ipc4_msg *msg = &cdata->msg;
+	size_t data_size;
+	unsigned int i;
+	int ret;
+
+	data_size = struct_size(data, chanv, scontrol->num_channels);
+	data = kzalloc(data_size, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->id = cdata->index;
+	data->num_elems = scontrol->num_channels;
+	for (i = 0; i < scontrol->num_channels; i++) {
+		data->chanv[i].channel = cdata->chanv[i].channel;
+		data->chanv[i].value = cdata->chanv[i].value;
+	}
+
+	msg->data_ptr = data;
+	msg->data_size = data_size;
+
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, true, lock);
+	msg->data_ptr = NULL;
+	msg->data_size = 0;
+	if (ret < 0)
+		dev_err(sdev->dev, "Failed to set control update for %s\n",
+			scontrol->name);
+
+	kfree(data);
+
+	return ret;
+}
+
+static bool sof_ipc4_switch_put(struct snd_sof_control *scontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_widget *swidget;
+	bool widget_found = false;
+	bool change = false;
+	unsigned int i;
+	u32 value;
+	int ret;
+
+	/* update each channel */
+	for (i = 0; i < scontrol->num_channels; i++) {
+		value = ucontrol->value.integer.value[i];
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
+		return false;
+	}
+
+	ret = sof_ipc4_set_generic_control_data(sdev, swidget, scontrol, true);
+	if (ret < 0)
+		return false;
+
+	return change;
+}
+
+static int sof_ipc4_switch_get(struct snd_sof_control *scontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	unsigned int i;
+
+	/* read back each channel */
+	for (i = 0; i < scontrol->num_channels; i++)
+		ucontrol->value.integer.value[i] = cdata->chanv[i].value;
+
+	return 0;
+}
+
 static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 				       struct snd_sof_control *scontrol,
 				       bool set, bool lock)
@@ -438,6 +534,16 @@ static int sof_ipc4_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
 	return _sof_ipc4_bytes_ext_get(scontrol, binary_data, size, true);
 }
 
+static int
+sof_ipc4_volsw_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
+		     struct snd_sof_control *scontrol)
+{
+	if (scontrol->max == 1)
+		return sof_ipc4_set_generic_control_data(sdev, swidget, scontrol, false);
+
+	return sof_ipc4_set_volume_data(sdev, swidget, scontrol, false);
+}
+
 /* set up all controls for the widget */
 static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
@@ -450,8 +556,7 @@ static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_s
 			case SND_SOC_TPLG_CTL_VOLSW:
 			case SND_SOC_TPLG_CTL_VOLSW_SX:
 			case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
-				ret = sof_ipc4_set_volume_data(sdev, swidget,
-							       scontrol, false);
+				ret = sof_ipc4_volsw_setup(sdev, swidget, scontrol);
 				break;
 			case SND_SOC_TPLG_CTL_BYTES:
 				ret = sof_ipc4_set_get_bytes_data(sdev, scontrol,
@@ -498,6 +603,8 @@ sof_ipc4_set_up_volume_table(struct snd_sof_control *scontrol, int tlv[SOF_TLV_I
 const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops = {
 	.volume_put = sof_ipc4_volume_put,
 	.volume_get = sof_ipc4_volume_get,
+	.switch_put = sof_ipc4_switch_put,
+	.switch_get = sof_ipc4_switch_get,
 	.bytes_put = sof_ipc4_bytes_put,
 	.bytes_get = sof_ipc4_bytes_get,
 	.bytes_ext_put = sof_ipc4_bytes_ext_put,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3e3d39e3ba8a..ef18379e0f19 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2107,12 +2107,22 @@ static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof
 	msg->primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	msg->primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
 
-	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_GAIN_PARAM_ID);
+	/* volume controls with range 0-1 (off/on) are switch controls */
+	if (scontrol->max == 1)
+		msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_SWITCH_CONTROL_PARAM_ID);
+	else
+		msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_GAIN_PARAM_ID);
 
-	/* set default volume values to 0dB in control */
 	for (i = 0; i < scontrol->num_channels; i++) {
 		control_data->chanv[i].channel = i;
-		control_data->chanv[i].value = SOF_IPC4_VOL_ZERO_DB;
+		/*
+		 * Default, initial values:
+		 * - 0dB for volume controls
+		 * - off (0) for switch controls - value already zero after
+		 *				   memory allocation
+		 */
+		if (scontrol->max > 1)
+			control_data->chanv[i].value = SOF_IPC4_VOL_ZERO_DB;
 	}
 
 	return 0;
-- 
2.42.0

