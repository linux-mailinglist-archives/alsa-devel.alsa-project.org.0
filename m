Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06E87A5FB8
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FC3AEA2;
	Tue, 19 Sep 2023 12:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FC3AEA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119713;
	bh=CK3a1unOvMUGDdfuujjAYkHvNuWQooHuBjxLRNExYpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HAvgBoIVTOdYc99AtRiRbsVT7wjBBrBzRhdmwLrlf6G0Zsi+j1+Xtrvz+X46mslBN
	 1rHQpyJmlfJsSV1gMJlihnmWh9LMLeh0eI+c1x1L7wkCJzRwm+eTWjeAXk0CDRQQLs
	 KhBflPNEtYxXITwgm5u/r8Y08YZqfpadxfE9twkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932E5F805F5; Tue, 19 Sep 2023 12:31:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9997F805EE;
	Tue, 19 Sep 2023 12:31:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4AD2F805BE; Tue, 19 Sep 2023 12:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03A39F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03A39F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AtDSwwBq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695119479; x=1726655479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CK3a1unOvMUGDdfuujjAYkHvNuWQooHuBjxLRNExYpE=;
  b=AtDSwwBqG0lpdJG6xcwHvhqn6YyLqcNhWmVoR8meejzYfD4wJad0z6Mr
   emjbI8c7fujH0szumGxQ3gVNqvOOAdZqnjiLNlTRiD+NYY+kHilayWc4i
   5KoFxCLS487PkKn0BcRUy/J36sqJPk8UWge3X0o4FgRtw4R+rHYr8H7AW
   obvJyt+lwbkLq36whJtul11o+scW0v5cNkvCbwt8TF2Bxr6otshda+3Tc
   /32mabPMzcvXtQovwpb8byJy2NvrQx7YDNR5cvKsJPq2eZk2t8fqHkvOz
   5Kc6WCEZiF7RIPMlnPW2UwDY+kJS0MIoV8hPMjuDxayve7X3pIHOzFnTf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443990515"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="443990515"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861486883"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861486883"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: ipc4-control: Add support for ALSA enum
 control
Date: Tue, 19 Sep 2023 13:31:15 +0300
Message-ID: <20230919103115.30783-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
References: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VU466TYK65PXZY3RJM7CC6HHUA5BYPSA
X-Message-ID-Hash: VU466TYK65PXZY3RJM7CC6HHUA5BYPSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VU466TYK65PXZY3RJM7CC6HHUA5BYPSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enum controls use generic param_id and a generic struct where the data
is passed to the firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c  | 64 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.c | 33 ++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index cabdd891c644..938efaceb81c 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -297,6 +297,63 @@ static int sof_ipc4_switch_get(struct snd_sof_control *scontrol,
 	return 0;
 }
 
+static bool sof_ipc4_enum_put(struct snd_sof_control *scontrol,
+			      struct snd_ctl_elem_value *ucontrol)
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
+		value = ucontrol->value.enumerated.item[i];
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
+static int sof_ipc4_enum_get(struct snd_sof_control *scontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+	unsigned int i;
+
+	/* read back each channel */
+	for (i = 0; i < scontrol->num_channels; i++)
+		ucontrol->value.enumerated.item[i] = cdata->chanv[i].value;
+
+	return 0;
+}
+
 static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 				       struct snd_sof_control *scontrol,
 				       bool set, bool lock)
@@ -562,6 +619,11 @@ static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_s
 				ret = sof_ipc4_set_get_bytes_data(sdev, scontrol,
 								  true, false);
 				break;
+			case SND_SOC_TPLG_CTL_ENUM:
+			case SND_SOC_TPLG_CTL_ENUM_VALUE:
+				ret = sof_ipc4_set_generic_control_data(sdev, swidget,
+									scontrol, false);
+				break;
 			default:
 				break;
 			}
@@ -605,6 +667,8 @@ const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops = {
 	.volume_get = sof_ipc4_volume_get,
 	.switch_put = sof_ipc4_switch_put,
 	.switch_get = sof_ipc4_switch_get,
+	.enum_put = sof_ipc4_enum_put,
+	.enum_get = sof_ipc4_enum_get,
 	.bytes_put = sof_ipc4_bytes_put,
 	.bytes_get = sof_ipc4_bytes_get,
 	.bytes_ext_put = sof_ipc4_bytes_ext_put,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index ef18379e0f19..bf91c8786162 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2128,6 +2128,36 @@ static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof
 	return 0;
 }
 
+static int sof_ipc4_control_load_enum(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
+{
+	struct sof_ipc4_control_data *control_data;
+	struct sof_ipc4_msg *msg;
+	int i;
+
+	scontrol->size = struct_size(control_data, chanv, scontrol->num_channels);
+
+	/* scontrol->ipc_control_data will be freed in sof_control_unload */
+	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	if (!scontrol->ipc_control_data)
+		return -ENOMEM;
+
+	control_data = scontrol->ipc_control_data;
+	control_data->index = scontrol->index;
+
+	msg = &control_data->msg;
+	msg->primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_LARGE_CONFIG_SET);
+	msg->primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg->primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_ENUM_CONTROL_PARAM_ID);
+
+	/* Default, initial value for enums: first enum entry is selected (0) */
+	for (i = 0; i < scontrol->num_channels; i++)
+		control_data->chanv[i].channel = i;
+
+	return 0;
+}
+
 static int sof_ipc4_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
 {
 	struct sof_ipc4_control_data *control_data;
@@ -2202,6 +2232,9 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 		return sof_ipc4_control_load_volume(sdev, scontrol);
 	case SND_SOC_TPLG_CTL_BYTES:
 		return sof_ipc4_control_load_bytes(sdev, scontrol);
+	case SND_SOC_TPLG_CTL_ENUM:
+	case SND_SOC_TPLG_CTL_ENUM_VALUE:
+		return sof_ipc4_control_load_enum(sdev, scontrol);
 	default:
 		break;
 	}
-- 
2.42.0

