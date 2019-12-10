Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D3117CAF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:52:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB781661;
	Tue, 10 Dec 2019 01:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB781661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575939177;
	bh=A9d3v2+1TxQU8eipygbnT5TjSuOikCN9dLM2waYAunQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iyOA0DZHj3JIykgy1kHls0ae1gplpVzSCYfZykWD2thzSOTWFkMILQFAm6C5/ByY6
	 L9qrQmXRsuIw6uW/zCBfS/GM5ylIIUxaUaYNSDbItQxGX3wKBY8x8W+4R2DOZ7FQfW
	 M7aHEEkGyQ30vjRj2vdvVwGLJ3wX8oyEHeKpN2lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4541F80269;
	Tue, 10 Dec 2019 01:49:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 616FCF80256; Tue, 10 Dec 2019 01:49:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83AAAF8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83AAAF8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 16:49:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="215398956"
Received: from sneuhier-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.188.78])
 by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 16:49:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 18:48:50 -0600
Message-Id: <20191210004854.16845-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
References: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Slawomir Blauciak <slawomir.blauciak@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/8] ASoC: SOF: ipc: channel map structures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Slawomir Blauciak <slawomir.blauciak@linux.intel.com>

This change adds stream map and channel map structures
used for channel re-routing and stream aggregation.

Signed-off-by: Slawomir Blauciak <slawomir.blauciak@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/channel_map.h | 61 +++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 include/sound/sof/channel_map.h

diff --git a/include/sound/sof/channel_map.h b/include/sound/sof/channel_map.h
new file mode 100644
index 000000000000..21044eb5f377
--- /dev/null
+++ b/include/sound/sof/channel_map.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __IPC_CHANNEL_MAP_H__
+#define __IPC_CHANNEL_MAP_H__
+
+#include <uapi/sound/sof/header.h>
+#include <sound/sof/header.h>
+
+/**
+ * \brief Channel map, specifies transformation of one-to-many or many-to-one.
+ *
+ * In case of one-to-many specifies how the output channels are computed out of
+ * a single source channel,
+ * in case of many-to-one specifies how a single target channel is computed
+ * from a multichannel input stream.
+ *
+ * Channel index specifies position of the channel in the stream on the 'one'
+ * side.
+ *
+ * Ext ID is the identifier of external part of the transformation. Depending
+ * on the context, it may be pipeline ID, dai ID, ...
+ *
+ * Channel mask describes which channels are taken into account on the "many"
+ * side. Bit[i] set to 1 means that i-th channel is used for computation
+ * (either as source or as a target).
+ *
+ * Channel mask is followed by array of coefficients in Q2.30 format,
+ * one per each channel set in the mask (left to right, LS bit set in the
+ * mask corresponds to ch_coeffs[0]).
+ */
+struct sof_ipc_channel_map {
+	uint32_t ch_index;
+	uint32_t ext_id;
+	uint32_t ch_mask;
+	uint32_t reserved;
+	int32_t ch_coeffs[0];
+} __packed;
+
+/**
+ * \brief Complete map for each channel of a multichannel stream.
+ *
+ * num_ch_map Specifies number of items in the ch_map.
+ * More than one transformation per a single channel is allowed (in case
+ * multiple external entities are transformed).
+ * A channel may be skipped in the transformation list, then it is filled
+ * with 0's by the transformation function.
+ */
+struct sof_ipc_stream_map {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t num_ch_map;
+	uint32_t reserved[3];
+	struct sof_ipc_channel_map ch_map[0];
+} __packed;
+
+#endif /* __IPC_CHANNEL_MAP_H__ */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
