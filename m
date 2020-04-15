Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CEB1AB28C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B39C850;
	Wed, 15 Apr 2020 22:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B39C850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982885;
	bh=0fBke1oWFmGKqYMYewW8rmD3xxD60XTtjz3VL+DDA44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CO4clQNoDjIOmbmnnr6m2OpjpCuqF+W5DGFy4O5L7dqHrubViYuXtmtpHect/lmWM
	 b8AdhiA6gdaTaiu6CMouVE959ibI0xJtqRcxfQ2BMKYTfpPthMMyDZN8t9O+zAPjYl
	 kFa5P3XAuadCFaaa187phRegP1gVShIhWDGVRv4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C8B4F802DD;
	Wed, 15 Apr 2020 22:29:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15AB1F8026A; Wed, 15 Apr 2020 22:29:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7E91F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7E91F80115
IronPort-SDR: c0KKQXQnHjj9xt59D0hD+Uj+2ozJmPtrenxLAz2XJGQ5Ac1CQSf1x7fDU3To3kvFPKCdE/TcGJ
 eKDqyOBWNzag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:28:55 -0700
IronPort-SDR: 4t72C038MsHYuvRjwPoCWV8C8yDiPtPgZQdE7CjFyJYHIiklW8agMGNZUQLftUIADWr9NtGzd2
 XwjxEUj1i9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656245"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:28:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/24] ASoC: SOF: Introduce extended manifest
Date: Wed, 15 Apr 2020 15:27:56 -0500
Message-Id: <20200415202816.934-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Karol Trzcinski <karolx.trzcinski@linux.intel.com>
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

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/ext_manifest.h |  61 +++++++++++++
 sound/soc/sof/loader.c                | 122 ++++++++++++++++++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 include/uapi/sound/sof/ext_manifest.h

diff --git a/include/uapi/sound/sof/ext_manifest.h b/include/uapi/sound/sof/ext_manifest.h
new file mode 100644
index 000000000000..fc4d1bec0cb3
--- /dev/null
+++ b/include/uapi/sound/sof/ext_manifest.h
@@ -0,0 +1,61 @@
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
+#include <linux/const.h>
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
+	uint8_t elements[];	/*< list of ext_man_elem_* elements */
+} __packed;
+
+/* Now define extended manifest elements */
+
+/* extended manifest element header */
+struct sof_ext_man_elem_header {
+	uint32_t type;		/*< SOF_EXT_MAN_ELEM_ */
+	uint32_t size;		/*< in bytes, including header size */
+	uint8_t blob[];		/*< type dependent content */
+} __packed;
+
+#endif /* __SOF_FIRMWARE_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 89f35db2577d..6b354b6fb83a 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -12,6 +12,7 @@
 
 #include <linux/firmware.h>
 #include <sound/sof.h>
+#include <uapi/sound/sof/ext_manifest.h>
 #include "ops.h"
 
 static int get_ext_windows(struct snd_sof_dev *sdev,
@@ -126,6 +127,104 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 }
 EXPORT_SYMBOL(snd_sof_fw_parse_ext_data);
 
+static ssize_t snd_sof_ext_man_size(const struct firmware *fw)
+{
+	const struct sof_ext_man_header *head = (void *)fw->data;
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
+	if (ext_man_size < 0) {
+		dev_err(sdev->dev, "error: exception while reading firmware extended manifest, code %d\n",
+			(int)ext_man_size);
+		return ext_man_size;
+	} else if (!ext_man_size) {
+		dev_err(sdev->dev, "error: can't parse extended manifest when it's not present\n");
+		return -EINVAL;
+	}
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
+			break;
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
+			break;
+		}
+
+		remaining -= elem_hdr->size;
+		iptr += elem_hdr->size;
+	}
+
+	if (remaining) {
+		dev_err(sdev->dev, "error: sof_ext_man header is inconsistent\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 /*
  * IPC Firmware ready.
  */
@@ -473,6 +572,7 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const char *fw_filename;
+	ssize_t ext_man_size;
 	int ret;
 
 	/* Don't request firmware again if firmware is already requested */
@@ -490,11 +590,33 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: request firmware %s failed err: %d\n",
 			fw_filename, ret);
+		goto err;
 	} else {
 		dev_dbg(sdev->dev, "request_firmware %s successful\n",
 			fw_filename);
 	}
 
+	/* check for extended manifest */
+	ext_man_size = snd_sof_ext_man_size(plat_data->fw);
+	if (ext_man_size > 0) {
+		ret = snd_sof_fw_ext_man_parse(sdev, plat_data->fw);
+
+		/* when no error occurred, drop extended manifest */
+		if (!ret)
+			plat_data->fw_offset = ext_man_size;
+		else
+			dev_err(sdev->dev, "error: firmware %s contains unsupported or invalid extended manifest: %d\n",
+				fw_filename, ret);
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
2.20.1

