Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4A11DBA71
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 19:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B831805;
	Wed, 20 May 2020 19:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B831805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589994125;
	bh=6gqJX1U7n84iBPVTs3KRnGrd2GaXJRABX0aW+he6SWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZGX+ul5cFbEmJTmOcOhYEOaXKnqwFkFAk+fTnUh+ctE3Xy78tzNkn4Lfru7obRIj
	 IY5RnxZab20xoUXV7tk+Bz8yNDyz4RDoU80p2S6g6N7Un7e0psgEzcaaqnQkeux3ch
	 JZXtW5mCg1ueK7FB2mFPMNcRaZGp3UQc7BjcKoIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C2BCF8026F;
	Wed, 20 May 2020 18:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF158F8026F; Wed, 20 May 2020 18:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ABE7F80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 18:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ABE7F80132
IronPort-SDR: uC1FFFq199xpVAr9vhUAPgk0S6lkcBe7CK0PfBpNxdq0m0l5EbkDi9fnXkHzXSXrw6KFZqcO4R
 ElGXgmCS4DPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 09:59:21 -0700
IronPort-SDR: j2srVWOlipca+zQng2df8rkXObKdpuV6q+ys28rZCiLFTGLj9NosUdHUI23ws0VpDabWUK0mr1
 r+4JQltD9Jgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412085908"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 09:59:20 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/5] ASoC: SOF: Introduce extended manifest
Date: Wed, 20 May 2020 19:59:08 +0300
Message-Id: <20200520165911.21696-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
References: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

Extended manifest is a place to store build time known firmware
metadata, for example firmware version or used compiler description.
Given information is read on host side before firmware startup.
This part of output binary is located as a first structure in binary
file.
Extended manifest should be skipped in firmware loading routine.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ext_manifest.h |  65 ++++++++++++++++++
 sound/soc/sof/loader.c           | 112 +++++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 include/sound/sof/ext_manifest.h

diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
new file mode 100644
index 000000000000..5c1f03603919
--- /dev/null
+++ b/include/sound/sof/ext_manifest.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ */
+
+/*
+ * Extended manifest is a place to store metadata about firmware, known during
+ * compilation time - for example firmware version or used compiler.
+ * Given information are read on host side before firmware startup.
+ * This part of output binary is not signed.
+ */
+
+#ifndef __SOF_FIRMWARE_EXT_MANIFEST_H__
+#define __SOF_FIRMWARE_EXT_MANIFEST_H__
+
+#include <linux/bits.h>
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+/* In ASCII `XMan` */
+#define SOF_EXT_MAN_MAGIC_NUMBER	0x6e614d58
+
+/* Build u32 number in format MMmmmppp */
+#define SOF_EXT_MAN_BUILD_VERSION(MAJOR, MINOR, PATH) ((uint32_t)( \
+	((MAJOR) << 24) | \
+	((MINOR) << 12) | \
+	(PATH)))
+
+/* check extended manifest version consistency */
+#define SOF_EXT_MAN_VERSION_INCOMPATIBLE(host_ver, cli_ver) ( \
+	((host_ver) & GENMASK(31, 24)) != \
+	((cli_ver) & GENMASK(31, 24)))
+
+/* used extended manifest header version */
+#define SOF_EXT_MAN_VERSION		SOF_EXT_MAN_BUILD_VERSION(1, 0, 0)
+
+/* extended manifest header, deleting any field breaks backward compatibility */
+struct sof_ext_man_header {
+	uint32_t magic;		/*< identification number, */
+				/*< EXT_MAN_MAGIC_NUMBER */
+	uint32_t full_size;	/*< [bytes] full size of ext_man, */
+				/*< (header + content + padding) */
+	uint32_t header_size;	/*< [bytes] makes header extensionable, */
+				/*< after append new field to ext_man header */
+				/*< then backward compatible won't be lost */
+	uint32_t header_version; /*< value of EXT_MAN_VERSION */
+				/*< not related with following content */
+
+	/* just after this header should be list of ext_man_elem_* elements */
+} __packed;
+
+/* Now define extended manifest elements */
+
+/* extended manifest element header */
+struct sof_ext_man_elem_header {
+	uint32_t type;		/*< SOF_EXT_MAN_ELEM_ */
+	uint32_t size;		/*< in bytes, including header size */
+
+	/* just after this header should be type dependent content */
+} __packed;
+
+#endif /* __SOF_FIRMWARE_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index eed3d1e65685..a2c2dc17e9ab 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -12,6 +12,7 @@
 
 #include <linux/firmware.h>
 #include <sound/sof.h>
+#include <sound/sof/ext_manifest.h>
 #include "ops.h"
 
 static int get_ext_windows(struct snd_sof_dev *sdev,
@@ -126,6 +127,100 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 }
 EXPORT_SYMBOL(snd_sof_fw_parse_ext_data);
 
+static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
+{
+	const struct sof_ext_man_header *head;
+
+	head = (struct sof_ext_man_header *)fw->data;
+
+	/*
+	 * assert fw size is big enough to contain extended manifest header,
+	 * it prevents from reading unallocated memory from `head` in following
+	 * step.
+	 */
+	if (fw->size < sizeof(*head))
+		return -EINVAL;
+
+	/*
+	 * When fw points to extended manifest,
+	 * then first u32 must be equal SOF_EXT_MAN_MAGIC_NUMBER.
+	 */
+	if (head->magic == SOF_EXT_MAN_MAGIC_NUMBER)
+		return head->full_size;
+
+	/* otherwise given fw don't have an extended manifest */
+	return 0;
+}
+
+/* parse extended FW manifest data structures */
+static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
+				    const struct firmware *fw)
+{
+	const struct sof_ext_man_elem_header *elem_hdr;
+	const struct sof_ext_man_header *head;
+	ssize_t ext_man_size;
+	ssize_t remaining;
+	uintptr_t iptr;
+	int ret = 0;
+
+	head = (struct sof_ext_man_header *)fw->data;
+	remaining = head->full_size - head->header_size;
+	ext_man_size = snd_sof_ext_man_size(fw);
+
+	/* Assert firmware starts with extended manifest */
+	if (ext_man_size <= 0)
+		return ext_man_size;
+
+	/* incompatible version */
+	if (SOF_EXT_MAN_VERSION_INCOMPATIBLE(SOF_EXT_MAN_VERSION,
+					     head->header_version)) {
+		dev_err(sdev->dev, "error: extended manifest version 0x%X differ from used 0x%X\n",
+			head->header_version, SOF_EXT_MAN_VERSION);
+		return -EINVAL;
+	}
+
+	/* get first extended manifest element header */
+	iptr = (uintptr_t)fw->data + head->header_size;
+
+	while (remaining > sizeof(*elem_hdr)) {
+		elem_hdr = (struct sof_ext_man_elem_header *)iptr;
+
+		dev_dbg(sdev->dev, "found sof_ext_man header type %d size 0x%X\n",
+			elem_hdr->type, elem_hdr->size);
+
+		if (elem_hdr->size < sizeof(*elem_hdr) ||
+		    elem_hdr->size > remaining) {
+			dev_err(sdev->dev, "error: invalid sof_ext_man header size, type %d size 0x%X\n",
+				elem_hdr->type, elem_hdr->size);
+			return -EINVAL;
+		}
+
+		/* process structure data */
+		switch (elem_hdr->type) {
+		default:
+			dev_warn(sdev->dev, "warning: unknown sof_ext_man header type %d size 0x%X\n",
+				 elem_hdr->type, elem_hdr->size);
+			break;
+		}
+
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to parse sof_ext_man header type %d size 0x%X\n",
+				elem_hdr->type, elem_hdr->size);
+			return ret;
+		}
+
+		remaining -= elem_hdr->size;
+		iptr += elem_hdr->size;
+	}
+
+	if (remaining) {
+		dev_err(sdev->dev, "error: sof_ext_man header is inconsistent\n");
+		return -EINVAL;
+	}
+
+	return ext_man_size;
+}
+
 /*
  * IPC Firmware ready.
  */
@@ -473,6 +568,7 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const char *fw_filename;
+	ssize_t ext_man_size;
 	int ret;
 
 	/* Don't request firmware again if firmware is already requested */
@@ -490,11 +586,27 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: request firmware %s failed err: %d\n",
 			fw_filename, ret);
+		goto err;
 	} else {
 		dev_dbg(sdev->dev, "request_firmware %s successful\n",
 			fw_filename);
 	}
 
+	/* check for extended manifest */
+	ext_man_size = snd_sof_fw_ext_man_parse(sdev, plat_data->fw);
+	if (ext_man_size > 0) {
+		/* when no error occurred, drop extended manifest */
+		plat_data->fw_offset = ext_man_size;
+	} else if (!ext_man_size) {
+		/* No extended manifest, so nothing to skip during FW load */
+		dev_dbg(sdev->dev, "firmware doesn't contain extended manifest\n");
+	} else {
+		ret = ext_man_size;
+		dev_err(sdev->dev, "error: firmware %s contains unsupported or invalid extended manifest: %d\n",
+			fw_filename, ret);
+	}
+
+err:
 	kfree(fw_filename);
 
 	return ret;
-- 
2.26.2

