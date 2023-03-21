Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880DA6C2DD6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 10:28:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D20AF1F4;
	Tue, 21 Mar 2023 10:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D20AF1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679390909;
	bh=MjEYv0CB6BE1IEAnORY/QIqcTvUOMErXevU9RQVjhVY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SnK4fLp2ty2lk888Zccy+T6Nv5Lxazuz5wIJMcbfhbZmH6+s2aD3oTQf80opf02Mz
	 iFRJZAadcGq9Xf4gv3RmEffqxhE15bgOO09Avcn6t1pYpUCw5slAQs+LIHWn7p5JP0
	 taduzgBMXlrNs/tTAkz1uBP8R9MeU8bvutehJRmE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB8BF8027B;
	Tue, 21 Mar 2023 10:26:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D460F80482; Tue, 21 Mar 2023 10:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D858F8027B
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 10:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D858F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WTGYUHex
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679390795; x=1710926795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MjEYv0CB6BE1IEAnORY/QIqcTvUOMErXevU9RQVjhVY=;
  b=WTGYUHexFed8QJ18Dp4misRIswTEOeeGdzYtw87yj8w4270jkfRouodc
   6rtOdVAf9swiN8DYihsglfEUaYehr7SAMc8O/BhAJ8zkN0PPwV2J0w9qJ
   stgsChEtR8apVzejVdAGCiIzinuBATY+qCp2eigK6aubmTwGC6sSdvIOh
   ABwBhl02pgPR9RQdMG6t3k8XF0N03tXg/P0TOE6ki5mUZvEaY5E2NIbbj
   JTZLyC3F6NBKm12xWhfnPWEdYUyw5dnoX5eIPsG8cCFks+OWHTBfvMj5/
   eiFfqKXQ9x2bVLSxQ1mJQ/osc1Am4gH1zEMW7a0zFq6xZbMLddI5Lswik
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401462898"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="401462898"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770559809"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="770559809"
Received: from markusbu-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.60.215])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: ipc4: Add macros for chain-dma message bits
Date: Tue, 21 Mar 2023 11:26:53 +0200
Message-Id: <20230321092654.7292-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
References: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQ5NNS53MQPOXCORMXTSMX3Z7MYICAVC
X-Message-ID-Hash: MQ5NNS53MQPOXCORMXTSMX3Z7MYICAVC
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQ5NNS53MQPOXCORMXTSMX3Z7MYICAVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jyri Sarha <jyri.sarha@intel.com>

In the chained DMA mode, the firmware allocates buffers for the host
and link DMA, and takes care of copying data between host- and
link-DMA buffers in a low-latency thread. This is different to a
regular pipeline, no processing is allowed, and the connection between
host- and link DMA is handled with a dedicated IPC.

This patch exposes the macros needed to create the required IPC messages.

Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 49ff1558a171..78568abe2673 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -196,6 +196,35 @@ enum sof_ipc4_pipeline_state {
 #define SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID_SHIFT	16
 #define SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID(x)	((x) << SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID_SHIFT)
 
+/* chain dma ipc message */
+#define SOF_IPC4_GLB_CHAIN_DMA_HOST_ID_SHIFT	0
+#define SOF_IPC4_GLB_CHAIN_DMA_HOST_ID_MASK	GENMASK(4, 0)
+#define SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(x)	(((x) << SOF_IPC4_GLB_CHAIN_DMA_HOST_ID_SHIFT) & \
+						 SOF_IPC4_GLB_CHAIN_DMA_HOST_ID_MASK)
+
+#define SOF_IPC4_GLB_CHAIN_DMA_LINK_ID_SHIFT	8
+#define SOF_IPC4_GLB_CHAIN_DMA_LINK_ID_MASK	GENMASK(12, 8)
+#define SOF_IPC4_GLB_CHAIN_DMA_LINK_ID(x)	(((x) << SOF_IPC4_GLB_CHAIN_DMA_LINK_ID_SHIFT) & \
+						 SOF_IPC4_GLB_CHAIN_DMA_LINK_ID_MASK)
+
+#define SOF_IPC4_GLB_CHAIN_DMA_ALLOCATE_SHIFT	16
+#define SOF_IPC4_GLB_CHAIN_DMA_ALLOCATE_MASK	BIT(16)
+#define SOF_IPC4_GLB_CHAIN_DMA_ALLOCATE(x)	(((x) & 1) << SOF_IPC4_GLB_CHAIN_DMA_ALLOCATE_SHIFT)
+
+#define SOF_IPC4_GLB_CHAIN_DMA_ENABLE_SHIFT	17
+#define SOF_IPC4_GLB_CHAIN_DMA_ENABLE_MASK	BIT(17)
+#define SOF_IPC4_GLB_CHAIN_DMA_ENABLE(x)	(((x) & 1) << SOF_IPC4_GLB_CHAIN_DMA_ENABLE_SHIFT)
+
+#define SOF_IPC4_GLB_CHAIN_DMA_SCS_SHIFT	18
+#define SOF_IPC4_GLB_CHAIN_DMA_SCS_MASK		BIT(18)
+#define SOF_IPC4_GLB_CHAIN_DMA_SCS(x)		(((x) & 1) << SOF_IPC4_GLB_CHAIN_DMA_SCS_SHIFT)
+
+#define SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE_SHIFT 0
+#define SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE_MASK  GENMASK(24, 0)
+#define SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE(x)	   (((x) << \
+						     SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE_SHIFT) & \
+						    SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE_MASK)
+
 enum sof_ipc4_channel_config {
 	/* one channel only. */
 	SOF_IPC4_CHANNEL_CONFIG_MONO,
-- 
2.40.0

