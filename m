Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACE6BD30A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C92410F1;
	Thu, 16 Mar 2023 16:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C92410F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979604;
	bh=zrqAw9lBuUO/86y/2mT01h+niIl2E+66P8cmKynQPDE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RzfKYXjZVkVDc0os3mCdAEIFvdYRF7Mwku2UJO6+QTLc7Vg20l0U1Qudn315R0jZT
	 AvJxR1QEnRNjT2sGBoz9ogc+NpM7b3J+vFUv6o0eMAxAOyRS9qMObK4s2xieIirv3L
	 4tTF8OTXwAoBuknvhAkRdZAYQuD4aPWYVAJyzy6E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D67FF8016C;
	Thu, 16 Mar 2023 16:11:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36698F8052D; Thu, 16 Mar 2023 16:11:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB673F8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB673F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I1S0QUyt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979497; x=1710515497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zrqAw9lBuUO/86y/2mT01h+niIl2E+66P8cmKynQPDE=;
  b=I1S0QUyty50cEw3PzL2FpqfnmBi4i846MGlpcx5/SuaXW5MBZT3xWPMb
   sCsQ8dGiTP9M0qfVsEw3AFBOUtzeK8XVCELJ/l+iEMSpRP+sHF7cRSB1+
   0svZK1MNNgkqIw5FDqSnvZbN7Z9v0QJm270ko+Dmv+im6YHHyuOLBRX5a
   z1wZjnQqOufWp1XMOQ87SyTrjANu2tb0SJffDk/fCDGpezbhTpMJdfTbP
   4i5OBL8pJvGjiL6Bc1YovdPJ/idwq23pHnIbg3ezPcFJpaEvQsf02y/Qg
   pQLw9ICSWG/1irezIBWe8kGC0IRhRx9ErZKAkDnkVLxOLi9suJ55BygTM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335501597"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="335501597"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823286496"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="823286496"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/6] ASoC: SOF: ipc4-topology: add effect widget support
Date: Thu, 16 Mar 2023 17:11:33 +0200
Message-Id: <20230316151137.7598-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
References: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UOFL7ALWWVJ57HOCIZ74N4SR5GXDGIUL
X-Message-ID-Hash: UOFL7ALWWVJ57HOCIZ74N4SR5GXDGIUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOFL7ALWWVJ57HOCIZ74N4SR5GXDGIUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Libin Yang <libin.yang@intel.com>

Add the general support of IPC4 effect widgets.

IPC4 effect widgets, known as process modules,  can be EQFIR,
EQIIR, KEYWORD_DETECT, KPB, CHAN_SELECTOR, SMART_AMP and etc.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 124 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h |  18 +++++
 2 files changed, 142 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index c00df3956c02..76bd3487bf71 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -793,6 +793,69 @@ static void sof_ipc4_widget_free_comp_mixer(struct snd_sof_widget *swidget)
 	swidget->private = NULL;
 }
 
+/*
+ * Add the process modules support. The process modules are defined as snd_soc_dapm_effect modules.
+ */
+static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc4_process *process;
+	int cfg_size;
+	void *cfg;
+	int ret;
+
+	process = kzalloc(sizeof(*process), GFP_KERNEL);
+	if (!process)
+		return -ENOMEM;
+
+	swidget->private = process;
+
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &process->available_fmt,
+				     &process->base_config);
+	if (ret)
+		goto err;
+
+	cfg_size = sizeof(struct sof_ipc4_base_module_cfg);
+
+	cfg = kzalloc(cfg_size, GFP_KERNEL);
+	if (!cfg) {
+		ret = -ENOMEM;
+		goto free_available_fmt;
+	}
+
+	process->ipc_config_data = cfg;
+	process->ipc_config_size = cfg_size;
+	ret = sof_ipc4_widget_setup_msg(swidget, &process->msg);
+	if (ret)
+		goto free_cfg_data;
+
+	sof_ipc4_widget_update_kcontrol_module_id(swidget);
+
+	return 0;
+free_cfg_data:
+	kfree(process->ipc_config_data);
+	process->ipc_config_data = NULL;
+free_available_fmt:
+	sof_ipc4_free_audio_fmt(&process->available_fmt);
+err:
+	kfree(process);
+	swidget->private = NULL;
+	return ret;
+}
+
+static void sof_ipc4_widget_free_comp_process(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_process *process = swidget->private;
+
+	if (!process)
+		return;
+
+	kfree(process->ipc_config_data);
+	sof_ipc4_free_audio_fmt(&process->available_fmt);
+	kfree(swidget->private);
+	swidget->private = NULL;
+}
+
 static void
 sof_ipc4_update_pipeline_mem_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 				   struct sof_ipc4_base_module_cfg *base_config)
@@ -1454,6 +1517,38 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	return 0;
 }
 
+static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
+					   struct snd_pcm_hw_params *fe_params,
+					   struct snd_sof_platform_stream_params *platform_params,
+					   struct snd_pcm_hw_params *pipeline_params, int dir)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_process *process = swidget->private;
+	struct sof_ipc4_available_audio_format *available_fmt = &process->available_fmt;
+	void *cfg = process->ipc_config_data;
+	int ret;
+
+	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &process->base_config,
+				      pipeline_params, available_fmt,
+				      available_fmt->input_pin_fmts,
+				      available_fmt->num_input_formats);
+	if (ret < 0)
+		return ret;
+
+	/* update pipeline memory usage */
+	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &process->base_config);
+
+	/*
+	 * ipc_config_data is composed of the base_config, optional output formats followed
+	 * by the data required for module init in that order.
+	 */
+	memcpy(cfg, &process->base_config, sizeof(struct sof_ipc4_base_module_cfg));
+	cfg += sizeof(struct sof_ipc4_base_module_cfg);
+
+	return 0;
+}
+
 static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
 {
 	struct sof_ipc4_control_data *control_data;
@@ -1652,6 +1747,22 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg = &src->msg;
 		break;
 	}
+	case snd_soc_dapm_effect:
+	{
+		struct sof_ipc4_process *process = swidget->private;
+
+		if (!process->ipc_config_size) {
+			dev_err(sdev->dev, "module %s has no config data!\n",
+				swidget->widget->name);
+			return -EINVAL;
+		}
+
+		ipc_size = process->ipc_config_size;
+		ipc_data = process->ipc_config_data;
+
+		msg = &process->msg;
+		break;
+	}
 	default:
 		dev_err(sdev->dev, "widget type %d not supported", swidget->id);
 		return -EINVAL;
@@ -2257,6 +2368,14 @@ static enum sof_tokens src_token_list[] = {
 	SOF_COMP_EXT_TOKENS,
 };
 
+static enum sof_tokens process_token_list[] = {
+	SOF_COMP_TOKENS,
+	SOF_AUDIO_FMT_NUM_TOKENS,
+	SOF_IN_AUDIO_FORMAT_TOKENS,
+	SOF_OUT_AUDIO_FORMAT_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+};
+
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
 				  common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
@@ -2294,6 +2413,11 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				src_token_list, ARRAY_SIZE(src_token_list),
 				NULL, sof_ipc4_prepare_src_module,
 				NULL},
+	[snd_soc_dapm_effect] = {sof_ipc4_widget_setup_comp_process,
+				sof_ipc4_widget_free_comp_process,
+				process_token_list, ARRAY_SIZE(process_token_list),
+				NULL, sof_ipc4_prepare_process_module,
+				NULL},
 };
 
 const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index fad7a628f782..9fcb978ebc63 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -347,4 +347,22 @@ struct sof_ipc4_src {
 	struct sof_ipc4_msg msg;
 };
 
+/**
+ * struct sof_ipc4_process - process config data
+ * @base_config: IPC base config data
+ * @output_format: Output audio format
+ * @available_fmt: Available audio format
+ * @ipc_config_data: Process module config data
+ * @ipc_config_size: Size of process module config data
+ * @msg: IPC4 message struct containing header and data info
+ */
+struct sof_ipc4_process {
+	struct sof_ipc4_base_module_cfg base_config;
+	struct sof_ipc4_audio_format output_format;
+	struct sof_ipc4_available_audio_format available_fmt;
+	void *ipc_config_data;
+	uint32_t ipc_config_size;
+	struct sof_ipc4_msg msg;
+};
+
 #endif
-- 
2.39.2

