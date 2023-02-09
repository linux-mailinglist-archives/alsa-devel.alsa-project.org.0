Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E39690B9D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 15:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58AB3E0E;
	Thu,  9 Feb 2023 15:22:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58AB3E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675952595;
	bh=rHxF4y6OAxE1PvrhuBF1qKXy5Pb2uFMeWDLRXyJJgxA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mQbsBGlllibLOC7c+P2hpLKnTOAZwkSEjMedFkZUw0WimM4E6muEXVEbuaQCz2GJ+
	 rrm9a11vhRwzi8+G/az51UD86hMYBv1nrmi9UpPsw2fsQAq0q5uuIPobbRWmiRuWVZ
	 Qqs8orl3b33+e2vs1q1FyOQiusTNlGWLqdJLEXz0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9455BF80526;
	Thu,  9 Feb 2023 15:21:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E95F1F80527; Thu,  9 Feb 2023 15:21:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3CF9F800B8
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 15:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CF9F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dMRC3uCj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675952484; x=1707488484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rHxF4y6OAxE1PvrhuBF1qKXy5Pb2uFMeWDLRXyJJgxA=;
  b=dMRC3uCjJt+jw9NOMLHq1COwWQx+U0lZ1gn9UDgAoC1gAAgoqN1JP+U8
   RT9MP3aeg4aYZ0tuAGY3JScmHNW81QIBaLHPFP/245qDIm3nI4c31lPCu
   BgCgZ8Qb5rsNhUJcm7WJdyw/4TQVjXllNZeS05xisH53WJN3dreUu/mfN
   y8Wke9OiYbUb0QxdejWWQRWdfWmA3NK0PfN5muKzzC6mlNcAcC4dBSU9F
   idEupVzksKWaqURmWJqK1J8MbvgiI4qi33GZFU1er/avJ/u2iLmfQrKZE
   XxvKOJXR9OOBHamK690AvpydHn/okmqGQtrZ6DFL5l4k2rJQhlHEwBnX6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309763801"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000";
   d="scan'208";a="309763801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 06:21:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756412229"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000";
   d="scan'208";a="756412229"
Received: from borisgol-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.16.232])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 06:21:17 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: set copier sink format
Date: Thu,  9 Feb 2023 16:21:23 +0200
Message-Id: <20230209142123.17193-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209142123.17193-1-peter.ujfalusi@linux.intel.com>
References: <20230209142123.17193-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F3LR4CRGB6RCJ743A33SASWTTEVE7VNJ
X-Message-ID-Hash: F3LR4CRGB6RCJ743A33SASWTTEVE7VNJ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3LR4CRGB6RCJ743A33SASWTTEVE7VNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

MOD_INIT_INSTANCE IPC for a copier only contains the sink format for
output pin 0. Any additional output pins that are used need to have their
sink format set using the LARGE_CONFIG_SET IPC message.
Otherwise, firmware will report error or crash due to NULL format is used.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 71 ++++++++++++++++++++++++++++++++---
 sound/soc/sof/ipc4-topology.h | 46 +++++++++++++++++++++++
 sound/soc/sof/sof-audio.h     |  1 +
 3 files changed, 113 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 02ddc48a1107..3e27c7a48ebd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1742,6 +1742,55 @@ static void sof_ipc4_put_queue_id(struct snd_sof_widget *swidget, int queue_id,
 	ida_free(queue_ida, queue_id);
 }
 
+static int sof_ipc4_set_copier_sink_format(struct snd_sof_dev *sdev,
+					   struct snd_sof_widget *src_widget,
+					   struct snd_sof_widget *sink_widget,
+					   int sink_id)
+{
+	struct sof_ipc4_base_module_cfg *sink_config = sink_widget->private;
+	struct sof_ipc4_base_module_cfg *src_config;
+	struct sof_ipc4_copier_config_set_sink_format format;
+	struct sof_ipc4_fw_module *fw_module;
+	struct sof_ipc4_msg msg = {{ 0 }};
+	u32 header, extension;
+
+	dev_dbg(sdev->dev, "%s set copier sink %d format\n",
+		src_widget->widget->name, sink_id);
+
+	if (WIDGET_IS_DAI(src_widget->id)) {
+		struct snd_sof_dai *dai = src_widget->private;
+
+		src_config = dai->private;
+	} else {
+		src_config = src_widget->private;
+	}
+
+	fw_module = src_widget->module_info;
+
+	format.sink_id = sink_id;
+	memcpy(&format.source_fmt, &src_config->audio_fmt, sizeof(format.source_fmt));
+	memcpy(&format.sink_fmt, &sink_config->audio_fmt, sizeof(format.sink_fmt));
+	msg.data_size = sizeof(format);
+	msg.data_ptr = &format;
+
+	header = fw_module->man4_module_entry.id;
+	header |= SOF_IPC4_MOD_INSTANCE(src_widget->instance_id);
+	header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_LARGE_CONFIG_SET);
+	header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	header |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	extension = SOF_IPC4_MOD_EXT_MSG_SIZE(msg.data_size);
+	extension |=
+		SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_COPIER_MODULE_CFG_PARAM_SET_SINK_FORMAT);
+	extension |= SOF_IPC4_MOD_EXT_MSG_LAST_BLOCK(1);
+	extension |= SOF_IPC4_MOD_EXT_MSG_FIRST_BLOCK(1);
+
+	msg.primary = header;
+	msg.extension = extension;
+
+	return sof_ipc_tx_message(sdev->ipc, &msg, msg.data_size, NULL, 0);
+}
+
 static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
 {
 	struct snd_sof_widget *src_widget = sroute->src_widget;
@@ -1770,6 +1819,17 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 		return sroute->dst_queue_id;
 	}
 
+	/* Pin 0 format is already set during copier module init */
+	if (sroute->src_queue_id > 0 && WIDGET_IS_COPIER(src_widget->id)) {
+		ret = sof_ipc4_set_copier_sink_format(sdev, src_widget, sink_widget,
+						      sroute->src_queue_id);
+		if (ret < 0) {
+			dev_err(sdev->dev, "failed to set sink format for %s source queue ID %d\n",
+				src_widget->widget->name, sroute->src_queue_id);
+			goto out;
+		}
+	}
+
 	dev_dbg(sdev->dev, "bind %s:%d -> %s:%d\n",
 		src_widget->widget->name, sroute->src_queue_id,
 		sink_widget->widget->name, sroute->dst_queue_id);
@@ -1793,14 +1853,15 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 		dev_err(sdev->dev, "failed to bind modules %s:%d -> %s:%d\n",
 			src_widget->widget->name, sroute->src_queue_id,
 			sink_widget->widget->name, sroute->dst_queue_id);
-
-		sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id,
-				      SOF_PIN_TYPE_SOURCE);
-		sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id,
-				      SOF_PIN_TYPE_SINK);
+		goto out;
 	}
 
 	return ret;
+
+out:
+	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_SOURCE);
+	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_SINK);
+	return ret;
 }
 
 static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index ee5d31e68a77..72529179ac22 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -66,6 +66,52 @@
 /* A magic number from FW */
 #define ALH_MULTI_GTW_COUNT	8
 
+enum sof_ipc4_copier_module_config_params {
+/*
+ * Use LARGE_CONFIG_SET to initialize timestamp event. Ipc mailbox must
+ * contain properly built CopierConfigTimestampInitData struct.
+ */
+	SOF_IPC4_COPIER_MODULE_CFG_PARAM_TIMESTAMP_INIT = 1,
+/*
+ * Use LARGE_CONFIG_SET to initialize copier sink. Ipc mailbox must contain
+ * properly built CopierConfigSetSinkFormat struct.
+ */
+	SOF_IPC4_COPIER_MODULE_CFG_PARAM_SET_SINK_FORMAT,
+/*
+ * Use LARGE_CONFIG_SET to initialize and enable on Copier data segment
+ * event. Ipc mailbox must contain properly built DataSegmentEnabled struct.
+ */
+	SOF_IPC4_COPIER_MODULE_CFG_PARAM_DATA_SEGMENT_ENABLED,
+/*
+ * Use LARGE_CONFIG_GET to retrieve Linear Link Position (LLP) value for non
+ * HD-A gateways.
+ */
+	SOF_IPC4_COPIER_MODULE_CFG_PARAM_LLP_READING,
+/*
+ * Use LARGE_CONFIG_GET to retrieve Linear Link Position (LLP) value for non
+ * HD-A gateways and corresponding total processed data
+ */
+	SOF_IPC4_COPIER_MODULE_CFG_PARAM_LLP_READING_EXTENDED,
+/*
+ * Use LARGE_CONFIG_SET to setup attenuation on output pins. Data is just uint32_t.
+ * note Config is only allowed when output pin is set up for 32bit and source
+ * is connected to Gateway
+ */
+	SOF_IPC4_COPIER_MODULE_CFG_ATTENUATION,
+};
+
+struct sof_ipc4_copier_config_set_sink_format {
+/* Id of sink */
+	u32 sink_id;
+/*
+ * Input format used by the source
+ * attention must be the same as present if already initialized.
+ */
+	struct sof_ipc4_audio_format source_fmt;
+/* Output format used by the sink */
+	struct sof_ipc4_audio_format sink_fmt;
+} __packed __aligned(4);
+
 /**
  * struct sof_ipc4_pipeline - pipeline config data
  * @priority: Priority of this pipeline
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index d3104941e83e..e0579af9d281 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -42,6 +42,7 @@
 #define WIDGET_IS_DAI(id) ((id) == snd_soc_dapm_dai_in || (id) == snd_soc_dapm_dai_out)
 #define WIDGET_IS_AIF(id) ((id) == snd_soc_dapm_aif_in || (id) == snd_soc_dapm_aif_out)
 #define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
+#define WIDGET_IS_COPIER(id) (WIDGET_IS_AIF_OR_DAI(id) || (id) == snd_soc_dapm_buffer)
 
 #define SOF_DAI_CLK_INTEL_SSP_MCLK	0
 #define SOF_DAI_CLK_INTEL_SSP_BCLK	1
-- 
2.39.1

