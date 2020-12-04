Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C22CF266
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 17:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99BD31882;
	Fri,  4 Dec 2020 17:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99BD31882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607100874;
	bh=l0qV76wxNLA8Udd8yRlV3A8TFP6RkAB2jg5lLdjw4sQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ODCGFrS9LU81wCEr56KJSIsJZqXHRh+M1ELv3nl4Y5LckNSEWSpyTdvrVPgwwIOoe
	 I9g7Mk9TsevYvPTKYHIZ9D6deg8rCwyPlufiLg1XcM1oU0f3KBMv/JluXJDKtsAsK6
	 XAr97qBwz33fG8fkaDlWze52loDQNuM3oVp+QMDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E18F800E8;
	Fri,  4 Dec 2020 17:53:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CDEDF80278; Fri,  4 Dec 2020 17:52:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D83DF800E2
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 17:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D83DF800E2
IronPort-SDR: FVAtnOCM3OpYlAVead7WkEw0bAybnIdBr9ymGSXDYYA3dExCLQmeCTmuLjoBlSwgQcOMVeM0SH
 6YqdI8HLUWaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="172622982"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="172622982"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 08:52:47 -0800
IronPort-SDR: UAwR8w2MbPRCTmrXcRJ+JKjSiLvju6ce/yzZKdQ3dCrC1+DQSBuFYchspevQgvU4Hi9C20LX8L
 6EI811zxaT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="366352122"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 04 Dec 2020 08:52:45 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: trace: Add runtime trace filtering mechanism
Date: Fri,  4 Dec 2020 18:50:14 +0200
Message-Id: <20201204165014.2697903-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
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

The "filter" debugfs file defines the log levels used by
the firmware and reported by sof-logger.

The file contains the formatted entry list, where each entry
follows the following syntax in plain text:
log_level uuid_id pipe_id comp_id;

This file may be updated by userspace applications such sof-logger,
or directly by the user during debugging process.

An unused (wildcard) pipe_id or comp_id value should be set to -1,
uuid_id is hexadecimal value, so when unused then should be set to 0.

When the file is modified, an IPC command is sent to FW with new
trace levels for selected components in filter elements list.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/header.h |   1 +
 include/sound/sof/trace.h  |  28 +++++
 sound/soc/sof/trace.c      | 224 +++++++++++++++++++++++++++++++++++++
 3 files changed, 253 insertions(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index c93f08334bbe..4c747c52e01b 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -118,6 +118,7 @@
 #define SOF_IPC_TRACE_DMA_PARAMS		SOF_CMD_TYPE(0x001)
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
 #define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
+#define SOF_IPC_TRACE_FILTER_UPDATE		SOF_CMD_TYPE(0x004) /**< ABI3.17 */
 
 /* debug */
 #define SOF_IPC_DEBUG_MEM_USAGE			SOF_CMD_TYPE(0x001)
diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
index c31a94a13ce0..25ea99f62d37 100644
--- a/include/sound/sof/trace.h
+++ b/include/sound/sof/trace.h
@@ -43,6 +43,34 @@ struct sof_ipc_dma_trace_posn {
 	uint32_t messages;	/* total trace messages */
 }  __packed;
 
+/* Values used in sof_ipc_trace_filter_elem: */
+
+/* bits 6..0 */
+#define SOF_IPC_TRACE_FILTER_ELEM_SET_LEVEL	0x01	/**< trace level for selected components */
+#define SOF_IPC_TRACE_FILTER_ELEM_BY_UUID	0x02	/**< filter by uuid key */
+#define SOF_IPC_TRACE_FILTER_ELEM_BY_PIPE	0x03	/**< filter by pipeline */
+#define SOF_IPC_TRACE_FILTER_ELEM_BY_COMP	0x04	/**< filter by component id */
+
+/* bit 7 */
+#define SOF_IPC_TRACE_FILTER_ELEM_FIN		0x80	/**< mark last filter in set */
+
+/* bits 31..8: Unused */
+
+/** part of sof_ipc_trace_filter, ABI3.17 */
+struct sof_ipc_trace_filter_elem {
+	uint32_t key;		/**< SOF_IPC_TRACE_FILTER_ELEM_ {LEVEL, UUID, COMP, PIPE} */
+	uint32_t value;		/**< element value */
+} __packed;
+
+/** Runtime tracing filtration data - SOF_IPC_TRACE_FILTER_UPDATE, ABI3.17 */
+struct sof_ipc_trace_filter {
+	struct sof_ipc_cmd_hdr hdr;	/**< IPC command header */
+	uint32_t elem_cnt;		/**< number of entries in elems[] array */
+	uint32_t reserved[8];		/**< reserved for future usage */
+	/** variable size array with new filtering settings */
+	struct sof_ipc_trace_filter_elem elems[];
+} __packed;
+
 /*
  * Commom debug
  */
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 69889241a092..f72a6e83e6af 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -13,6 +13,225 @@
 #include "sof-priv.h"
 #include "ops.h"
 
+#define TRACE_FILTER_ELEMENTS_PER_ENTRY 4
+#define TRACE_FILTER_MAX_CONFIG_STRING_LENGTH 1024
+
+static int trace_filter_append_elem(struct snd_sof_dev *sdev, uint32_t key, uint32_t value,
+				    struct sof_ipc_trace_filter_elem *elem_list,
+				    int capacity, int *counter)
+{
+	if (*counter >= capacity)
+		return -ENOMEM;
+
+	elem_list[*counter].key = key;
+	elem_list[*counter].value = value;
+	++*counter;
+
+	return 0;
+}
+
+static int trace_filter_parse_entry(struct snd_sof_dev *sdev, const char *line,
+				    struct sof_ipc_trace_filter_elem *elem,
+				    int capacity, int *counter)
+{
+	int len = strlen(line);
+	int cnt = *counter;
+	uint32_t uuid_id;
+	int log_level;
+	int pipe_id;
+	int comp_id;
+	int read;
+	int ret;
+
+	/* ignore empty content */
+	ret = sscanf(line, " %n", &read);
+	if (!ret && read == len)
+		return len;
+
+	ret = sscanf(line, " %d %x %d %d %n", &log_level, &uuid_id, &pipe_id, &comp_id, &read);
+	if (ret != TRACE_FILTER_ELEMENTS_PER_ENTRY || read != len) {
+		dev_err(sdev->dev, "error: invalid trace filter entry '%s'\n", line);
+		return -EINVAL;
+	}
+
+	if (uuid_id > 0) {
+		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_UUID,
+					       uuid_id, elem, capacity, &cnt);
+		if (ret)
+			return ret;
+	}
+	if (pipe_id >= 0) {
+		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_PIPE,
+					       pipe_id, elem, capacity, &cnt);
+		if (ret)
+			return ret;
+	}
+	if (comp_id >= 0) {
+		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_COMP,
+					       comp_id, elem, capacity, &cnt);
+		if (ret)
+			return ret;
+	}
+
+	ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_SET_LEVEL |
+				       SOF_IPC_TRACE_FILTER_ELEM_FIN,
+				       log_level, elem, capacity, &cnt);
+	if (ret)
+		return ret;
+
+	/* update counter only when parsing whole entry passed */
+	*counter = cnt;
+
+	return len;
+}
+
+static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
+			      int *out_elem_cnt,
+			      struct sof_ipc_trace_filter_elem **out)
+{
+	static const char entry_delimiter[] = ";";
+	char *entry = string;
+	int capacity = 0;
+	int entry_len;
+	int cnt = 0;
+
+	/*
+	 * Each entry contains at least 1, up to TRACE_FILTER_ELEMENTS_PER_ENTRY
+	 * IPC elements, depending on content. Calculate IPC elements capacity
+	 * for the input string where each element is set.
+	 */
+	while (entry) {
+		capacity += TRACE_FILTER_ELEMENTS_PER_ENTRY;
+		entry = strchr(entry + 1, entry_delimiter[0]);
+	}
+	*out = kmalloc(capacity * sizeof(**out), GFP_KERNEL);
+	if (!*out)
+		return -ENOMEM;
+
+	/* split input string by ';', and parse each entry separately in trace_filter_parse_entry */
+	while ((entry = strsep(&string, entry_delimiter))) {
+		entry_len = trace_filter_parse_entry(sdev, entry, *out, capacity, &cnt);
+		if (entry_len < 0) {
+			dev_err(sdev->dev, "error: %s failed for '%s', %d\n", __func__, entry,
+				entry_len);
+			return -EINVAL;
+		}
+	}
+
+	*out_elem_cnt = cnt;
+
+	return 0;
+}
+
+static int sof_ipc_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
+				       struct sof_ipc_trace_filter_elem *elems)
+{
+	struct sof_ipc_trace_filter *msg;
+	struct sof_ipc_reply reply;
+	size_t size;
+	int ret;
+
+	size = struct_size(msg, elems, num_elems);
+	if (size > SOF_IPC_MSG_MAX_SIZE)
+		return -EINVAL;
+
+	msg = kmalloc(size, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->hdr.size = size;
+	msg->hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_FILTER_UPDATE;
+	msg->elem_cnt = num_elems;
+	memcpy(&msg->elems[0], elems, num_elems * sizeof(*elems));
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(sdev->dev);
+		dev_err(sdev->dev, "error: enabling device failed: %d\n", ret);
+		goto error;
+	}
+	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg, msg->hdr.size,
+				 &reply, sizeof(reply));
+	pm_runtime_mark_last_busy(sdev->dev);
+	pm_runtime_put_autosuspend(sdev->dev);
+
+error:
+	kfree(msg);
+	return ret ? ret : reply.error;
+}
+
+static ssize_t sof_dfsentry_trace_filter_write(struct file *file, const char __user *from,
+					       size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct sof_ipc_trace_filter_elem *elems = NULL;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	loff_t pos = 0;
+	int num_elems;
+	char *string;
+	int ret;
+
+	if (count > TRACE_FILTER_MAX_CONFIG_STRING_LENGTH) {
+		dev_err(sdev->dev, "%s too long input, %zu > %d\n", __func__, count,
+			TRACE_FILTER_MAX_CONFIG_STRING_LENGTH);
+		return -EINVAL;
+	}
+
+	string = kmalloc(count + 1, GFP_KERNEL);
+	if (!string)
+		return -ENOMEM;
+
+	/* assert null termination */
+	string[count] = 0;
+	ret = simple_write_to_buffer(string, count, &pos, from, count);
+	if (ret < 0)
+		goto error;
+
+	ret = trace_filter_parse(sdev, string, &num_elems, &elems);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: fail in trace_filter_parse, %d\n", ret);
+		goto error;
+	}
+
+	if (num_elems) {
+		ret = sof_ipc_trace_update_filter(sdev, num_elems, elems);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: fail in sof_ipc_trace_update_filter %d\n", ret);
+			goto error;
+		}
+	}
+	ret = count;
+error:
+	kfree(string);
+	kfree(elems);
+	return ret;
+}
+
+static const struct file_operations sof_dfs_trace_filter_fops = {
+	.open = simple_open,
+	.write = sof_dfsentry_trace_filter_write,
+	.llseek = default_llseek,
+};
+
+static int trace_debugfs_filter_create(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	dfse->sdev = sdev;
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+
+	debugfs_create_file("filter", 0200, sdev->debugfs_root, dfse,
+			    &sof_dfs_trace_filter_fops);
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
+
+	return 0;
+}
+
 static size_t sof_trace_avail(struct snd_sof_dev *sdev,
 			      loff_t pos, size_t buffer_size)
 {
@@ -135,10 +354,15 @@ static const struct file_operations sof_dfs_trace_fops = {
 static int trace_debugfs_create(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_dfsentry *dfse;
+	int ret;
 
 	if (!sdev)
 		return -EINVAL;
 
+	ret = trace_debugfs_filter_create(sdev);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: fail in %s, %d", __func__, ret);
+
 	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
 	if (!dfse)
 		return -ENOMEM;
-- 
2.28.0

