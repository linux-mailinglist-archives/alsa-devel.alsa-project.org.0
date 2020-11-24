Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A781F2C2F8E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 19:06:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F329A170E;
	Tue, 24 Nov 2020 19:05:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F329A170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606241170;
	bh=uNOFJ6J0MMd5lgT3TFU1m8EoXYEqWPPKiQvcKWOsj/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKG4JaVGLZgdXMn5xPATHSAZY1D5fSuL7V7D7dD7nQ0tLLTOdngCiMHOPMvueoi2X
	 5JXJBdyn2/R0aQVT4VCTesXT5+oyrEqwETAiRFVnFEpqZtMrKIJe0FAJS1e7UJTLsd
	 ApOp1Ebsi9b9zIZqfvrkRzCtY6oAlWNiT0WBhXOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6411F80166;
	Tue, 24 Nov 2020 19:04:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0B8AF80161; Tue, 24 Nov 2020 19:04:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 863D8F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 19:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 863D8F800C1
IronPort-SDR: Zq/XE3Vv0IMoekaaOCGNZQbjmNmk8Q/L9+4XAxiJUfYU9LBR5V8C2+v/AEiDugrvzJBbvDVw4g
 7hanccKrA1kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="256699712"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="256699712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 10:04:30 -0800
IronPort-SDR: lUwGYhFG4aIJwe4CeAeffZo56wrODm6CCyEfg8XneGVk/QXvNMqSxi3tOQWrgbwNLTLjWfN+uk
 bT3DOwcjpPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="478585635"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 24 Nov 2020 10:04:28 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/4] ASoC: SOF: Add `memory_info` file to debugfs
Date: Tue, 24 Nov 2020 20:00:17 +0200
Message-Id: <20201124180017.2232128-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
References: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>, daniel.baluta@nxp.com
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

This file content describes memory allocation status
at run-time, typically to detect memory leaks.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/debug.h        |  41 +++++++++++
 include/sound/sof/ext_manifest.h |   1 +
 include/sound/sof/header.h       |   4 ++
 include/uapi/sound/sof/abi.h     |   2 +-
 sound/soc/sof/debug.c            | 117 +++++++++++++++++++++++++++++++
 sound/soc/sof/ipc.c              |   9 +++
 sound/soc/sof/loader.c           |  10 +++
 sound/soc/sof/sof-priv.h         |   2 +
 8 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sof/debug.h

diff --git a/include/sound/sof/debug.h b/include/sound/sof/debug.h
new file mode 100644
index 000000000000..3ecb5793789d
--- /dev/null
+++ b/include/sound/sof/debug.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_DEBUG_H__
+#define __INCLUDE_SOUND_SOF_DEBUG_H__
+
+#include <sound/sof/header.h>
+
+/** ABI3.18 */
+enum sof_ipc_dbg_mem_zone {
+	SOF_IPC_MEM_ZONE_SYS		= 0,	/**< System zone */
+	SOF_IPC_MEM_ZONE_SYS_RUNTIME	= 1,	/**< System-runtime zone */
+	SOF_IPC_MEM_ZONE_RUNTIME	= 2,	/**< Runtime zone */
+	SOF_IPC_MEM_ZONE_BUFFER		= 3,	/**< Buffer zone */
+};
+
+/** ABI3.18 */
+struct sof_ipc_dbg_mem_usage_elem {
+	uint32_t zone;		/**< see sof_ipc_dbg_mem_zone */
+	uint32_t id;		/**< heap index within zone */
+	uint32_t used;		/**< number of bytes used in zone */
+	uint32_t free;		/**< number of bytes free to use within zone */
+	uint32_t reserved;	/**< for future use */
+} __packed;
+
+/** ABI3.18 */
+struct sof_ipc_dbg_mem_usage {
+	struct sof_ipc_reply rhdr;			/**< generic IPC reply header */
+	uint32_t reserved[4];				/**< reserved for future use */
+	uint32_t num_elems;				/**< elems[] counter */
+	struct sof_ipc_dbg_mem_usage_elem elems[];	/**< memory usage information */
+} __packed;
+
+#endif
diff --git a/include/sound/sof/ext_manifest.h b/include/sound/sof/ext_manifest.h
index 31da6e611c6e..e05cb21023e5 100644
--- a/include/sound/sof/ext_manifest.h
+++ b/include/sound/sof/ext_manifest.h
@@ -104,6 +104,7 @@ struct ext_man_dbg_abi {
 enum config_elem_type {
 	SOF_EXT_MAN_CONFIG_EMPTY		= 0,
 	SOF_EXT_MAN_CONFIG_IPC_MSG_SIZE		= 1,
+	SOF_EXT_MAN_CONFIG_MEMORY_USAGE_SCAN	= 2, /**< ABI 3.18 */
 };
 
 struct sof_config_elem {
diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 13256d4fb0dd..c93f08334bbe 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -52,6 +52,7 @@
 #define SOF_IPC_GLB_GDB_DEBUG			SOF_GLB_TYPE(0xAU)
 #define SOF_IPC_GLB_TEST_MSG			SOF_GLB_TYPE(0xBU)
 #define SOF_IPC_GLB_PROBE			SOF_GLB_TYPE(0xCU)
+#define SOF_IPC_GLB_DEBUG			SOF_GLB_TYPE(0xDU)
 
 /*
  * DSP Command Message Types
@@ -118,6 +119,9 @@
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
 #define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
 
+/* debug */
+#define SOF_IPC_DEBUG_MEM_USAGE			SOF_CMD_TYPE(0x001)
+
 /* test */
 #define SOF_IPC_TEST_IPC_FLOOD			SOF_CMD_TYPE(0x001)
 
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 6af32f82fb99..fe2cfae94b45 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 17
+#define SOF_ABI_MINOR 18
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 9419a99bab53..143117334ae5 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -14,6 +14,8 @@
 #include <linux/debugfs.h>
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
+#include <sound/sof/ext_manifest.h>
+#include <sound/sof/debug.h>
 #include "sof-priv.h"
 #include "ops.h"
 
@@ -626,6 +628,121 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL_GPL(snd_sof_debugfs_buf_item);
 
+static int memory_info_update(struct snd_sof_dev *sdev, char *buf, size_t buff_size)
+{
+	struct sof_ipc_cmd_hdr msg = {
+		.size = sizeof(struct sof_ipc_cmd_hdr),
+		.cmd = SOF_IPC_GLB_DEBUG | SOF_IPC_DEBUG_MEM_USAGE,
+	};
+	struct sof_ipc_dbg_mem_usage *reply;
+	int len;
+	int ret;
+	int i;
+
+	reply = kmalloc(SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!reply)
+		return -ENOMEM;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(sdev->dev);
+		dev_err(sdev->dev, "error: enabling device failed: %d\n", ret);
+		goto error;
+	}
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg.cmd, &msg, msg.size, reply, SOF_IPC_MSG_MAX_SIZE);
+	pm_runtime_mark_last_busy(sdev->dev);
+	pm_runtime_put_autosuspend(sdev->dev);
+	if (ret < 0 || reply->rhdr.error < 0) {
+		ret = min(ret, reply->rhdr.error);
+		dev_err(sdev->dev, "error: reading memory info failed, %d\n", ret);
+		goto error;
+	}
+
+	if (struct_size(reply, elems, reply->num_elems) != reply->rhdr.hdr.size) {
+		dev_err(sdev->dev, "error: invalid memory info ipc struct size, %d\n",
+			reply->rhdr.hdr.size);
+		ret = -EINVAL;
+		goto error;
+	}
+
+	for (i = 0, len = 0; i < reply->num_elems; i++) {
+		ret = snprintf(buf + len, buff_size - len, "zone %d.%d used %#8x free %#8x\n",
+			       reply->elems[i].zone, reply->elems[i].id,
+			       reply->elems[i].used, reply->elems[i].free);
+		if (ret < 0)
+			goto error;
+		len += ret;
+	}
+
+	ret = len;
+error:
+	kfree(reply);
+	return ret;
+}
+
+static ssize_t memory_info_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	int data_length;
+
+	/* read memory info from FW only once for each file read */
+	if (!*ppos) {
+		dfse->buf_data_size = 0;
+		data_length = memory_info_update(sdev, dfse->buf, dfse->size);
+		if (data_length < 0)
+			return data_length;
+		dfse->buf_data_size = data_length;
+	}
+
+	return simple_read_from_buffer(to, count, ppos, dfse->buf, dfse->buf_data_size);
+}
+
+static int memory_info_open(struct inode *inode, struct file *file)
+{
+	struct snd_sof_dfsentry *dfse = inode->i_private;
+	struct snd_sof_dev *sdev = dfse->sdev;
+
+	file->private_data = dfse;
+
+	/* allocate buffer memory only in first open run, to save memory when unused */
+	if (!dfse->buf) {
+		dfse->buf = devm_kmalloc(sdev->dev, PAGE_SIZE, GFP_KERNEL);
+		if (!dfse->buf)
+			return -ENOMEM;
+		dfse->size = PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+static const struct file_operations memory_info_fops = {
+	.open = memory_info_open,
+	.read = memory_info_read,
+	.llseek = default_llseek,
+};
+
+int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	/* don't allocate buffer before first usage, to save memory when unused */
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+	dfse->sdev = sdev;
+
+	debugfs_create_file("memory_info", 0444, sdev->debugfs_root, dfse, &memory_info_fops);
+
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_sof_dbg_memory_info_init);
+
 int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 {
 	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index fd2b96ae4943..fc13bb06dbf3 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -181,6 +181,15 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 			str2 = "unknown type"; break;
 		}
 		break;
+	case SOF_IPC_GLB_DEBUG:
+		str = "GLB_DEBUG";
+		switch (type) {
+		case SOF_IPC_DEBUG_MEM_USAGE:
+			str2 = "MEM_USAGE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
 	default:
 		str = "unknown GLB command"; break;
 	}
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 33d3be774380..2a8c9bff9963 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -205,6 +205,7 @@ static int ext_man_get_config_data(struct snd_sof_dev *sdev,
 	const struct sof_config_elem *elem;
 	int elems_counter;
 	int elems_size;
+	int ret = 0;
 	int i;
 
 	/* calculate elements counter */
@@ -225,11 +226,20 @@ static int ext_man_get_config_data(struct snd_sof_dev *sdev,
 		case SOF_EXT_MAN_CONFIG_IPC_MSG_SIZE:
 			/* TODO: use ipc msg size from config data */
 			break;
+		case SOF_EXT_MAN_CONFIG_MEMORY_USAGE_SCAN:
+			if (sdev->first_boot && elem->value)
+				ret = snd_sof_dbg_memory_info_init(sdev);
+			break;
 		default:
 			dev_info(sdev->dev, "Unknown firmware configuration token %d value %d",
 				 elem->token, elem->value);
 			break;
 		}
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: processing sof_ext_man_config_data failed for token %d value 0x%x, %d\n",
+				elem->token, elem->value, ret);
+			return ret;
+		}
 	}
 
 	return 0;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0aed2a7ab858..d8bc0178dc89 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -290,6 +290,7 @@ enum sof_debugfs_access_type {
 /* FS entry for debug files that can expose DSP memories, registers */
 struct snd_sof_dfsentry {
 	size_t size;
+	size_t buf_data_size;  /* length of buffered data for file read operation */
 	enum sof_dfsentry_type type;
 	/*
 	 * access_type specifies if the
@@ -523,6 +524,7 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 			void *stack, size_t stack_words);
 int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
+int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev);
 
 /*
  * Platform specific ops.
-- 
2.28.0

