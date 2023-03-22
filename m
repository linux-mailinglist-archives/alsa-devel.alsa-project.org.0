Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B84796C4CCC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 15:03:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29AFE7F;
	Wed, 22 Mar 2023 15:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29AFE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679493810;
	bh=MjEYv0CB6BE1IEAnORY/QIqcTvUOMErXevU9RQVjhVY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nj6QRt2gJ15IHZIYCENsDl4H+6ImmsZry6hFr7dXYOUPDq+T9l0bs7lOCBWcepiYv
	 jnks+TbEgK2XFoMSn/9vYlxHXDdcWxtg86vth2mqpIH0iA8oD4f10NMn51T1/xt8Om
	 V4et1MpwDGt+LP+k7v0HhDuNelYyhFOL5I7FAdHk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 859C2F80567;
	Wed, 22 Mar 2023 15:01:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53BEFF8051B; Wed, 22 Mar 2023 15:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F00BF80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 15:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F00BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cWPpaNd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679493652; x=1711029652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MjEYv0CB6BE1IEAnORY/QIqcTvUOMErXevU9RQVjhVY=;
  b=cWPpaNd055zFWVV1sQ2NGJrQKTKxc3KcczqVqYU1FvkeN/gSSg2d96o/
   bw5dkweA3TIbE+P7Y2jbHhMad/hhPZEPiBUgIFIjXm05KY4NsqrR8H9tK
   mEBQktlbzWCHi7ljc+pBpwEBuRerV8lWc/nY+CS99F+/tUPnm/LUZ4GJW
   5J8DswjMPyjyvZzPwfKXV+zj2/fwgoDSNTqonwOCBhCGroqsYtHa4HIvt
   sicF4uO+q3qy7iaiqoCkWmF+BC8FEJZ4YCBDXH+7wa2hfk3+BhvJclP8H
   JWdXdN7ALYs86d2yyuca/7fZRWG6V9IEapi2y8bz+0H3Iz8ZOCo8pqtT1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341576120"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="341576120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659197962"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="659197962"
Received: from cmelen-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.142])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:59:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 2/3] ASoC: SOF: ipc4: Add macros for chain-dma message bits
Date: Wed, 22 Mar 2023 15:59:26 +0200
Message-Id: <20230322135927.7668-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
References: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OZIKIRYN6SYVSJYFQSUFENHGFLTR4RRT
X-Message-ID-Hash: OZIKIRYN6SYVSJYFQSUFENHGFLTR4RRT
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com, error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZIKIRYN6SYVSJYFQSUFENHGFLTR4RRT/>
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

