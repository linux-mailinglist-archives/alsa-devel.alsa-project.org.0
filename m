Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6966B523B5A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 19:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F094A1AB4;
	Wed, 11 May 2022 19:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F094A1AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652289551;
	bh=pCGbaPgKQY6Wo597Ab8cPIrEHe85QbL3zekp2mjDHxY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9NSy4oHEMdg+mgSccAg54AS8BfSsFCxPJu6S40+bLZaQ4FtXRnKBqNCStnLDNulI
	 6REWgCaLwUMSbsCFLd4Y5nx7OjhyabuYvM3wUs/gwko/T60oWUdPMsmke8bP+yD8Ju
	 cw7RcyNJs8+K3MW3aiCF8uTGCqI0pc9FhrAVWdpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D694F8015B;
	Wed, 11 May 2022 19:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B969F80529; Wed, 11 May 2022 19:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10ACDF80212
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 19:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10ACDF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OybKEyw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652289428; x=1683825428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pCGbaPgKQY6Wo597Ab8cPIrEHe85QbL3zekp2mjDHxY=;
 b=OybKEyw0nfG0m8f5ynCOT4XTpv/tne7L0ArJKnw1NTHTrIQThzwOJXJ7
 ZiYp9q9AJoI4g3+eGOrza8rFQLaqSPjEGf4cW4wBxMq0nKXA8fA1xW7Ov
 SP5uUR9+SX0bnZb/ebzScfLcPJRknQEJ6jHgdnO46zG9gOrM2sMXLXTAk
 RC7AMQJwm8prRewQHJsDF95+82qH+8i085H3C5gUmb9v512AKPFZztuUc
 EdQHv75XuGhhed0vqW5mOLA8gAtE+0JfbQIWN7SdfGb9Cpu83l2fBPaD+
 Amr6fvMTM52I94tGKyqag87rGxwgvsNT6Jrin8JM/hqLA93QFosEEo+QM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269431634"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269431634"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="697663176"
Received: from sjbrune-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.32.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:54 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: SOF: Add header for IPC4 manifest
Date: Wed, 11 May 2022 10:16:46 -0700
Message-Id: <20220511171648.1622993-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
References: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add the header for the IPC4 manifest.

Co-developed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof/ext_manifest4.h | 119 ++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 include/sound/sof/ext_manifest4.h

diff --git a/include/sound/sof/ext_manifest4.h b/include/sound/sof/ext_manifest4.h
new file mode 100644
index 000000000000..ec97edcbbfc3
--- /dev/null
+++ b/include/sound/sof/ext_manifest4.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ */
+
+/*
+ * Extended manifest is a place to store metadata about firmware, known during
+ * compilation time - for example firmware version or used compiler.
+ * Given information are read on host side before firmware startup.
+ * This part of output binary is not signed.
+ */
+
+#ifndef __SOF_FIRMWARE_EXT_MANIFEST4_H__
+#define __SOF_FIRMWARE_EXT_MANIFEST4_H__
+
+#include <linux/uuid.h>
+
+/* In ASCII  $AE1 */
+#define SOF_EXT_MAN4_MAGIC_NUMBER	0x31454124
+
+#define MAX_MODULE_NAME_LEN		8
+#define MAX_FW_BINARY_NAME		8
+#define DEFAULT_HASH_SHA256_LEN		32
+#define SOF_MAN4_FW_HDR_OFFSET		0x2000
+#define SOF_MAN4_FW_HDR_OFFSET_CAVS_1_5	0x284
+
+/*********************************************************************
+ *	extended manifest		(struct sof_ext_manifest4_hdr)
+ *-------------------
+ *	css_manifest hdr
+ *-------------------
+ *	offset reserved for future
+ *-------------------
+ *	fw_hdr				(struct sof_man4_fw_binary_header)
+ *-------------------
+ *	module_entry[0]			(struct sof_man4_module)
+ *-------------------
+ *	module_entry[1]
+ *-------------------
+ *	...
+ *-------------------
+ *	module_entry[n]
+ *-------------------
+ *	module_config[0]		(struct sof_man4_module_config)
+ *-------------------
+ *	module_config[1]
+ *-------------------
+ *	...
+ *-------------------
+ *	module_config[m]
+ *-------------------
+ *	FW content
+ *-------------------
+ *********************************************************************/
+
+struct sof_ext_manifest4_hdr {
+	uint32_t id;
+	uint32_t len; /* length of extension manifest */
+	uint16_t version_major; /* header version */
+	uint16_t version_minor;
+	uint32_t num_module_entries;
+} __packed;
+
+struct sof_man4_fw_binary_header {
+	/* This part must be unchanged to be backward compatible with SPT-LP ROM */
+	uint32_t id;
+	uint32_t len; /* sizeof(sof_man4_fw_binary_header) in bytes */
+	uint8_t name[MAX_FW_BINARY_NAME];
+	uint32_t preload_page_count; /* number of pages of preloaded image */
+	uint32_t fw_image_flags;
+	uint32_t feature_mask;
+	uint16_t major_version; /* Firmware version */
+	uint16_t minor_version;
+	uint16_t hotfix_version;
+	uint16_t build_version;
+	uint32_t num_module_entries;
+
+	/* This part may change to contain any additional data for BaseFw that is skipped by ROM */
+	uint32_t hw_buf_base_addr;
+	uint32_t hw_buf_length;
+	uint32_t load_offset; /* This value is used by ROM */
+} __packed;
+
+struct sof_man4_segment_desc {
+	uint32_t flags;
+	uint32_t v_base_addr;
+	uint32_t file_offset;
+} __packed;
+
+struct sof_man4_module {
+	uint32_t id;
+	uint8_t name[MAX_MODULE_NAME_LEN];
+	guid_t uuid;
+	uint32_t type;
+	uint8_t hash[DEFAULT_HASH_SHA256_LEN];
+	uint32_t entry_point;
+	uint16_t cfg_offset;
+	uint16_t cfg_count;
+	uint32_t affinity_mask;
+	uint16_t instance_max_count;
+	uint16_t instance_stack_size;
+	struct sof_man4_segment_desc	segments[3];
+} __packed;
+
+struct sof_man4_module_config {
+	uint32_t par[4];	/* module parameters */
+	uint32_t is_bytes;	/* actual size of instance .bss (bytes) */
+	uint32_t cps;		/* cycles per second */
+	uint32_t ibs;		/* input buffer size (bytes) */
+	uint32_t obs;		/* output buffer size (bytes) */
+	uint32_t module_flags;	/* flags, reserved for future use */
+	uint32_t cpc;		/* cycles per single run */
+	uint32_t obls;		/* output block size, reserved for future use */
+} __packed;
+
+#endif /* __SOF_FIRMWARE_EXT_MANIFEST4_H__ */
-- 
2.25.1

