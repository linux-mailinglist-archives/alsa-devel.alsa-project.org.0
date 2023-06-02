Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E630720AA7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D386843;
	Fri,  2 Jun 2023 22:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D386843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739562;
	bh=I/s0eU8o1u/lubpKORrmfzpHfeThvB9lDiwxcFrLQBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CcM+2XHpegSQBP2q9EI7veG90gZIuEymB7q39+U89+mpnAaHDey1e54CoEZcvmSM+
	 k7XkBpeXiSLgLfZ8SWKPNkvjp6GabVbL0NZRAdw2kXs+h+UggEUi5rL1p77LBzWKa9
	 6JiqYZcYsOT7U0UwGzpPHcuqaslyLNexwK6KhvoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A40FCF805BB; Fri,  2 Jun 2023 22:56:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE1CF805AD;
	Fri,  2 Jun 2023 22:56:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E490F800BD; Fri,  2 Jun 2023 22:56:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C267F800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C267F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZwyiI4I6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739401; x=1717275401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/s0eU8o1u/lubpKORrmfzpHfeThvB9lDiwxcFrLQBk=;
  b=ZwyiI4I63iAp9mOW3mJ0MsJ7rWKf1cYPf7RmykxxtmvRhEGp+q0Otw5V
   UKODRqJ4gsv1I874pVm1E9nSGmSm6N1+c/+Ti3EioQTEkelleyDSKBAQv
   sHczWxhnq6sNab3wOL67iCE41/MXz5KKtSh/t5ZHGIu0Nogg2+6nGbD8K
   ra7z4phyQhGelzclf8xxXd8MMdR0Vc+UG9h56pVIc4yb0l9Aq7+iyu78w
   H6NcQ4YHOLp1W+BoapitKC/GozidgsLWrJ11xGVTbgtqMiPXkXwNN3Wsx
   j8ynrHvfNXGZ2ETkTyX1N1Lvd524smmbvI3j3UsKv4sbj02BZm8yATZCp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272098"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272098"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092711"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092711"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 5/9] ASoC: SOF: ipc4-topology: extend ALH-specific data
 structure
Date: Fri,  2 Jun 2023 15:56:16 -0500
Message-Id: <20230602205620.310879-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E4UEXLWK6IHBMGLDEDLX6FL7ZK2S2VLQ
X-Message-ID-Hash: E4UEXLWK6IHBMGLDEDLX6FL7ZK2S2VLQ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4UEXLWK6IHBMGLDEDLX6FL7ZK2S2VLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

LunarLake introduces a new TLV blob passed to the firmware for DMA
configuration. This TLV structure is directly inspired by the ALH
multi-gateway structure used so far. This patch suggest a transition
to the more abstract structure with no references to ALH.

This is an iso-functionality redefinition of structure, the TLV will
be added in a follow-up patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 10 +++++-----
 sound/soc/sof/ipc4-topology.h | 34 +++++++++++++++++++++-------------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index db64e0cb8663..31a97a4248f4 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -559,7 +559,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 			    strcmp(w->widget->sname, swidget->widget->sname))
 				continue;
 
-			blob->alh_cfg.count++;
+			blob->alh_cfg.device_count++;
 		}
 
 		ipc4_copier->copier_config = (uint32_t *)blob;
@@ -1225,7 +1225,7 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 			unsigned int group_id;
 
 			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
-			if (blob->alh_cfg.count > 1) {
+			if (blob->alh_cfg.device_count > 1) {
 				group_id = SOF_IPC4_NODE_INDEX(ipc4_copier->data.gtw_cfg.node_id) -
 					   ALH_MULTI_GTW_BASE;
 				ida_free(&alh_group_ida, group_id);
@@ -1609,7 +1609,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				ch_map >>= 4;
 			}
 
-			step = ch_count / blob->alh_cfg.count;
+			step = ch_count / blob->alh_cfg.device_count;
 			mask =  GENMASK(step - 1, 0);
 			/*
 			 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
@@ -1624,7 +1624,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				dai = w->private;
 				alh_copier = (struct sof_ipc4_copier *)dai->private;
 				alh_data = &alh_copier->data;
-				blob->alh_cfg.mapping[i].alh_id = alh_data->gtw_cfg.node_id;
+				blob->alh_cfg.mapping[i].device = alh_data->gtw_cfg.node_id;
 				/*
 				 * Set the same channel mask for playback as the audio data is
 				 * duplicated for all speakers. For capture, split the channels
@@ -1643,7 +1643,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 				i++;
 			}
-			if (blob->alh_cfg.count > 1) {
+			if (blob->alh_cfg.device_count > 1) {
 				int group_id;
 
 				group_id = ida_alloc_max(&alh_group_ida, ALH_MULTI_GTW_COUNT - 1,
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index cf007282867b..6b59434fbd60 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -55,7 +55,7 @@
 #define SOF_IPC4_GAIN_ALL_CHANNELS_MASK 0xffffffff
 #define SOF_IPC4_VOL_ZERO_DB	0x7fffffff
 
-#define ALH_MAX_NUMBER_OF_GTW   16
+#define SOF_IPC4_DMA_DEVICE_MAX_COUNT 16
 
 #define SOF_IPC4_INVALID_NODE_ID	0xffffffff
 
@@ -220,18 +220,26 @@ struct sof_ipc4_gtw_attributes {
 	uint32_t rsvd : 30;
 };
 
-/** struct sof_ipc4_alh_multi_gtw_cfg: ALH gateway cfg data
- * @count: Number of streams (valid items in mapping array)
- * @alh_id: ALH stream id of a single ALH stream aggregated
- * @channel_mask: Channel mask
- * @mapping: ALH streams
+/**
+ * struct sof_ipc4_dma_device_stream_ch_map: abstract representation of
+ * channel mapping to DMAs
+ * @device: representation of hardware device address or FIFO
+ * @channel_mask: channels handled by @device. Channels are expected to be
+ * contiguous
  */
-struct sof_ipc4_alh_multi_gtw_cfg {
-	uint32_t count;
-	struct {
-		uint32_t alh_id;
-		uint32_t channel_mask;
-	} mapping[ALH_MAX_NUMBER_OF_GTW];
+struct sof_ipc4_dma_device_stream_ch_map {
+	uint32_t device;
+	uint32_t channel_mask;
+};
+
+/**
+ * struct sof_ipc4_dma_stream_ch_map: DMA configuration data
+ * @device_count: Number valid items in mapping array
+ * @mapping: device address and channel mask
+ */
+struct sof_ipc4_dma_stream_ch_map {
+	uint32_t device_count;
+	struct sof_ipc4_dma_device_stream_ch_map mapping[SOF_IPC4_DMA_DEVICE_MAX_COUNT];
 } __packed;
 
 /** struct sof_ipc4_alh_configuration_blob: ALH blob
@@ -240,7 +248,7 @@ struct sof_ipc4_alh_multi_gtw_cfg {
  */
 struct sof_ipc4_alh_configuration_blob {
 	struct sof_ipc4_gtw_attributes gw_attr;
-	struct sof_ipc4_alh_multi_gtw_cfg alh_cfg;
+	struct sof_ipc4_dma_stream_ch_map alh_cfg;
 };
 
 /**
-- 
2.37.2

