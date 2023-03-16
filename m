Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B616BD30F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:13:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62821111;
	Thu, 16 Mar 2023 16:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62821111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979627;
	bh=ot9yxDfRFTA3uFxKu/8V21Infh9mPLgzlVza07YyVDE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XFXog8PBqXWOYvEEiZAMH8132bEJ23KzDxq8uIjrRHkgomorbBuTntmTE0aBXoz8f
	 pIeExIV0dseNJKuaDoV1js4+YqrSYBzMQK/wAcInlUNwLebAijKEpDxlI61vjLfRUe
	 XQ7b0vgStv3ZOa2MKA6FaLF/whEssA/ihqNdoMq0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B80EAF80551;
	Thu, 16 Mar 2023 16:11:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20888F80542; Thu, 16 Mar 2023 16:11:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED4A6F80425
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:11:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED4A6F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UI6HIU8z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979499; x=1710515499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ot9yxDfRFTA3uFxKu/8V21Infh9mPLgzlVza07YyVDE=;
  b=UI6HIU8zkL2jkLudJAan5yDRijerhmNsf9RVNwUuVy1/V4mqmiu0BNLf
   Mkf3RfdZr6E5cYwnxgpoo13aprXsHnnAhIvDnXxoyljZat3BaFHFT0bVQ
   2FNrBuFpA1QgZdmQnRCwkdAjgaKO1ShVcmn/BVvtF//ROwSgKJPuCUIub
   wTwCJ+e2FSbGCEVXXAxZrUoAix26tzMrVCVYeC+sD0I3VBEuKFrfXTa4n
   QWSes4qNFTpc8GfFFxOzLZXNOWr06Kv8bRV9iEIAIk/Y0Dut9oWECq+un
   9brg5M5ivLZuCZsav9Y7SG3F1+x/BXlKT5oMYcuzihc7ISXphfQQ+Lsn7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335501648"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="335501648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823286509"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="823286509"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/6] ASoC: SOF: ipc4-topology: Add support for base config
 extension
Date: Thu, 16 Mar 2023 17:11:35 +0200
Message-Id: <20230316151137.7598-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
References: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XVRXBR7X3TDRJWKXA4XYFIJ7DFKDYTY2
X-Message-ID-Hash: XVRXBR7X3TDRJWKXA4XYFIJ7DFKDYTY2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 libin.yang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com, jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVRXBR7X3TDRJWKXA4XYFIJ7DFKDYTY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Some processing modules need the audio formats for all their input and
output pins appended to the base config during module init. So add support
for building the base config extension using the available pin formats
from topology.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 147 ++++++++++++++++++++++++++++++----
 sound/soc/sof/ipc4-topology.h |  10 +++
 2 files changed, 142 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 76bd3487bf71..efd53e855601 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -6,6 +6,7 @@
 // Copyright(c) 2022 Intel Corporation. All rights reserved.
 //
 //
+#include <linux/bitfield.h>
 #include <uapi/sound/sof/tokens.h>
 #include <sound/pcm_params.h>
 #include <sound/sof/ext_manifest4.h>
@@ -799,8 +800,8 @@ static void sof_ipc4_widget_free_comp_mixer(struct snd_sof_widget *swidget)
 static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc4_fw_module *fw_module;
 	struct sof_ipc4_process *process;
-	int cfg_size;
 	void *cfg;
 	int ret;
 
@@ -815,26 +816,50 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 	if (ret)
 		goto err;
 
-	cfg_size = sizeof(struct sof_ipc4_base_module_cfg);
+	ret = sof_ipc4_widget_setup_msg(swidget, &process->msg);
+	if (ret)
+		goto err;
 
-	cfg = kzalloc(cfg_size, GFP_KERNEL);
+	/* parse process init module payload config type from module info */
+	fw_module = swidget->module_info;
+	process->init_config = FIELD_GET(SOF_IPC4_MODULE_INIT_CONFIG_MASK,
+					 fw_module->man4_module_entry.type);
+
+	process->ipc_config_size = sizeof(struct sof_ipc4_base_module_cfg);
+
+	/* allocate memory for base config extension if needed */
+	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
+		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
+		u32 ext_size = struct_size(base_cfg_ext, pin_formats,
+						swidget->num_input_pins + swidget->num_output_pins);
+
+		base_cfg_ext = kzalloc(ext_size, GFP_KERNEL);
+		if (!base_cfg_ext) {
+			ret = -ENOMEM;
+			goto free_available_fmt;
+		}
+
+		base_cfg_ext->num_input_pin_fmts = swidget->num_input_pins;
+		base_cfg_ext->num_output_pin_fmts = swidget->num_output_pins;
+		process->base_config_ext = base_cfg_ext;
+		process->base_config_ext_size = ext_size;
+		process->ipc_config_size += ext_size;
+	}
+
+	cfg = kzalloc(process->ipc_config_size, GFP_KERNEL);
 	if (!cfg) {
 		ret = -ENOMEM;
-		goto free_available_fmt;
+		goto free_base_cfg_ext;
 	}
 
 	process->ipc_config_data = cfg;
-	process->ipc_config_size = cfg_size;
-	ret = sof_ipc4_widget_setup_msg(swidget, &process->msg);
-	if (ret)
-		goto free_cfg_data;
 
 	sof_ipc4_widget_update_kcontrol_module_id(swidget);
 
 	return 0;
-free_cfg_data:
-	kfree(process->ipc_config_data);
-	process->ipc_config_data = NULL;
+free_base_cfg_ext:
+	kfree(process->base_config_ext);
+	process->base_config_ext = NULL;
 free_available_fmt:
 	sof_ipc4_free_audio_fmt(&process->available_fmt);
 err:
@@ -851,6 +876,7 @@ static void sof_ipc4_widget_free_comp_process(struct snd_sof_widget *swidget)
 		return;
 
 	kfree(process->ipc_config_data);
+	kfree(process->base_config_ext);
 	sof_ipc4_free_audio_fmt(&process->available_fmt);
 	kfree(swidget->private);
 	swidget->private = NULL;
@@ -1517,6 +1543,84 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	return 0;
 }
 
+static int
+sof_ipc4_process_set_pin_formats(struct snd_sof_widget *swidget, int pin_type)
+{
+	struct sof_ipc4_process *process = swidget->private;
+	struct sof_ipc4_base_module_cfg_ext *base_cfg_ext = process->base_config_ext;
+	struct sof_ipc4_available_audio_format *available_fmt = &process->available_fmt;
+	struct sof_ipc4_pin_format *pin_format, *format_list_to_search;
+	struct snd_soc_component *scomp = swidget->scomp;
+	int num_pins, format_list_count;
+	int pin_format_offset = 0;
+	int i, j;
+
+	/* set number of pins, offset of pin format and format list to search based on pin type */
+	if (pin_type == SOF_PIN_TYPE_INPUT) {
+		num_pins = swidget->num_input_pins;
+		format_list_to_search = available_fmt->input_pin_fmts;
+		format_list_count = available_fmt->num_input_formats;
+	} else {
+		num_pins = swidget->num_output_pins;
+		pin_format_offset = swidget->num_input_pins;
+		format_list_to_search = available_fmt->output_pin_fmts;
+		format_list_count = available_fmt->num_output_formats;
+	}
+
+	for (i = pin_format_offset; i < num_pins + pin_format_offset; i++) {
+		pin_format = &base_cfg_ext->pin_formats[i];
+
+		/* Pin 0 audio formats are derived from the base config input/output format */
+		if (i == pin_format_offset) {
+			if (pin_type == SOF_PIN_TYPE_INPUT) {
+				pin_format->buffer_size = process->base_config.ibs;
+				pin_format->audio_fmt = process->base_config.audio_fmt;
+			} else {
+				pin_format->buffer_size = process->base_config.obs;
+				pin_format->audio_fmt = process->output_format;
+			}
+			continue;
+		}
+
+		/*
+		 * For all other pins, find the pin formats from those set in topology. If there
+		 * is more than one format specified for a pin, this will pick the first available
+		 * one.
+		 */
+		for (j = 0; j < format_list_count; j++) {
+			struct sof_ipc4_pin_format *pin_format_item = &format_list_to_search[j];
+
+			if (pin_format_item->pin_index == i - pin_format_offset) {
+				*pin_format = *pin_format_item;
+				break;
+			}
+		}
+
+		if (j == format_list_count) {
+			dev_err(scomp->dev, "%s pin %d format not found for %s\n",
+				(pin_type == SOF_PIN_TYPE_INPUT) ? "input" : "output",
+				i - pin_format_offset, swidget->widget->name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int sof_ipc4_process_add_base_cfg_extn(struct snd_sof_widget *swidget)
+{
+	int ret, i;
+
+	/* copy input and output pin formats */
+	for (i = 0; i <= SOF_PIN_TYPE_OUTPUT; i++) {
+		ret = sof_ipc4_process_set_pin_formats(swidget, i);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 					   struct snd_pcm_hw_params *fe_params,
 					   struct snd_sof_platform_stream_params *platform_params,
@@ -1536,16 +1640,29 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	/* copy Pin 0 output format */
+	if (available_fmt->num_output_formats && ret < available_fmt->num_output_formats &&
+	    !available_fmt->output_pin_fmts[ret].pin_index)
+		memcpy(&process->output_format, &available_fmt->output_pin_fmts[ret].audio_fmt,
+		       sizeof(struct sof_ipc4_audio_format));
+
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &process->base_config);
 
-	/*
-	 * ipc_config_data is composed of the base_config, optional output formats followed
-	 * by the data required for module init in that order.
-	 */
+	/* ipc_config_data is composed of the base_config followed by an optional extension */
 	memcpy(cfg, &process->base_config, sizeof(struct sof_ipc4_base_module_cfg));
 	cfg += sizeof(struct sof_ipc4_base_module_cfg);
 
+	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
+		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext = process->base_config_ext;
+
+		ret = sof_ipc4_process_add_base_cfg_extn(swidget);
+		if (ret < 0)
+			return ret;
+
+		memcpy(cfg, base_cfg_ext, process->base_config_ext_size);
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 97264454b8a6..015027b23588 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -26,6 +26,10 @@
 #define SOF_IPC4_MODULE_LL		BIT(5)
 #define SOF_IPC4_MODULE_DP		BIT(6)
 #define SOF_IPC4_MODULE_LIB_CODE		BIT(7)
+#define SOF_IPC4_MODULE_INIT_CONFIG_MASK	GENMASK(11, 8)
+
+#define SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG		0
+#define SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT	1
 
 #define SOF_IPC4_MODULE_INSTANCE_LIST_ITEM_SIZE 12
 #define SOF_IPC4_PIPELINE_OBJECT_SIZE 448
@@ -367,19 +371,25 @@ struct sof_ipc4_base_module_cfg_ext {
 /**
  * struct sof_ipc4_process - process config data
  * @base_config: IPC base config data
+ * @base_config_ext: Base config extension data for module init
  * @output_format: Output audio format
  * @available_fmt: Available audio format
  * @ipc_config_data: Process module config data
  * @ipc_config_size: Size of process module config data
  * @msg: IPC4 message struct containing header and data info
+ * @base_config_ext_size: Size of the base config extension data in bytes
+ * @init_config: Module init config type (SOF_IPC4_MODULE_INIT_CONFIG_TYPE_*)
  */
 struct sof_ipc4_process {
 	struct sof_ipc4_base_module_cfg base_config;
+	struct sof_ipc4_base_module_cfg_ext *base_config_ext;
 	struct sof_ipc4_audio_format output_format;
 	struct sof_ipc4_available_audio_format available_fmt;
 	void *ipc_config_data;
 	uint32_t ipc_config_size;
 	struct sof_ipc4_msg msg;
+	u32 base_config_ext_size;
+	u32 init_config;
 };
 
 #endif
-- 
2.39.2

