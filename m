Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D3720AA8
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:59:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092CBAEA;
	Fri,  2 Jun 2023 22:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092CBAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739582;
	bh=gS9F1eL0V1y42/VkrY8wmNE50BJpgQlMvZoq+CTpZg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bjV88omw+Aw2KQsraQMhrd1GqAYPqNQsn13yzsMm+M2bAq7sJQ9gd3kL7DyIlr+pH
	 ZugwMIm4o7fX717Y6fveNqq/zA/rS2hSb24bdK2sezmztjB+TQQK2GUQ9hUV+GedPB
	 vg9/m9K5TEkAZVdrj4d3eIPMwAkpH5iETwg+aX74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE70F805B3; Fri,  2 Jun 2023 22:57:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2840F805BE;
	Fri,  2 Jun 2023 22:57:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D5D2F80553; Fri,  2 Jun 2023 22:56:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0003F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0003F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FWWSn6vi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739402; x=1717275402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gS9F1eL0V1y42/VkrY8wmNE50BJpgQlMvZoq+CTpZg4=;
  b=FWWSn6vidn4hdF7cQjB1lUgZpOcRO6NuniwdCspgKt4A3p+RSlFr+vzw
   svbv+NiH4enWMmyz5rJsmJftN3GgkP3Zod44nWhFBhWTkQgxVmAUP4Lx5
   R3i9oKsjFtrW8zzBi+/8YYsJSAYMdPLQIRLuj6DLBf1LWw68vHVw93E/d
   KHzCVJkUhUr37Im0kMLHt/G1wlrXWdqMQham4H7bF5JOv9oAyXrjOkcqd
   KWW/h/3CIvBTwpPWEZcjxbpzoU5JtrB2/weGcrqeU60jBU0PFtP6J6PAY
   WbFVv8gHEqGL9LFicx9cK2RgeXbkoqdT5X8kS/KsyUxayRFlKX22+NsNA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272104"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272104"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092714"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092714"
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
Subject: [PATCH 6/9] ASoC: SOF: ipc4-topology: introduce DMA config TLV
Date: Fri,  2 Jun 2023 15:56:17 -0500
Message-Id: <20230602205620.310879-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7JOFQ75PKN37WTMJYLG7RFNY6EZ4OLKO
X-Message-ID-Hash: 7JOFQ75PKN37WTMJYLG7RFNY6EZ4OLKO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JOFQ75PKN37WTMJYLG7RFNY6EZ4OLKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Starting with LunarLake, the DMIC/SSP/SoundWire audio interfaces will
use the HDaudio DMA. This patch adds the DMA configuration structure
to be passed as a TLV appended at the end of each gateway
configuration.

This patch only provides the definitions for now, the TLV will be
added in the actual blobs separately for each interface.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.h | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 6b59434fbd60..f1d26b5c21d7 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -242,6 +242,44 @@ struct sof_ipc4_dma_stream_ch_map {
 	struct sof_ipc4_dma_device_stream_ch_map mapping[SOF_IPC4_DMA_DEVICE_MAX_COUNT];
 } __packed;
 
+#define SOF_IPC4_DMA_METHOD_HDA   1
+#define SOF_IPC4_DMA_METHOD_GPDMA 2 /* defined for consistency but not used */
+
+/**
+ * struct sof_ipc4_dma_config: DMA configuration
+ * @dma_method: HDAudio or GPDMA
+ * @pre_allocated_by_host: 1 if host driver allocates DMA channels, 0 otherwise
+ * @dma_channel_id: for HDaudio defined as @stream_id - 1
+ * @stream_id: HDaudio stream tag
+ * @dma_stream_channel_map: array of device/channel mappings
+ * @dma_priv_config_size: currently not used
+ * @dma_priv_config: currently not used
+ */
+struct sof_ipc4_dma_config {
+	uint8_t dma_method;
+	uint8_t pre_allocated_by_host;
+	uint16_t rsvd;
+	uint32_t dma_channel_id;
+	uint32_t stream_id;
+	struct sof_ipc4_dma_stream_ch_map dma_stream_channel_map;
+	uint32_t dma_priv_config_size;
+	uint8_t dma_priv_config[];
+} __packed;
+
+#define SOF_IPC4_GTW_DMA_CONFIG_ID 0x1000
+
+/**
+ * struct sof_ipc4_dma_config: DMA configuration
+ * @type: set to SOF_IPC4_GTW_DMA_CONFIG_ID
+ * @length: sizeof(struct sof_ipc4_dma_config) + dma_config.dma_priv_config_size
+ * @dma_config: actual DMA configuration
+ */
+struct sof_ipc4_dma_config_tlv {
+	uint32_t type;
+	uint32_t length;
+	struct sof_ipc4_dma_config dma_config;
+} __packed;
+
 /** struct sof_ipc4_alh_configuration_blob: ALH blob
  * @gw_attr: Gateway attributes
  * @alh_cfg: ALH configuration data
-- 
2.37.2

