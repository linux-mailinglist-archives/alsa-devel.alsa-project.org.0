Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C201628D2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 810171683;
	Tue, 18 Feb 2020 15:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 810171683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582037227;
	bh=n1HSN7zgZz7W5VoQCYojOZWxVtt64aVd7AdKuC2OX3M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8+b4Wznb7lEmwPt8AG7zrxUJ5cSWFjHta+jlIC0q58Ue8wb+XUpmNrJuhZ1agX3W
	 NoAFXxiOM1QZmk/qWhYpG6J361k1lkw5ZunRXJbucUyP3vFm3BtIwLSr4IdBz5FmSy
	 TQ+WlDnUIf5MsroExZHYgmgE3qCu3xylqYFmXlAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 245C2F802E3;
	Tue, 18 Feb 2020 15:40:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17260F8028F; Tue, 18 Feb 2020 15:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A28FCF80277
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28FCF80277
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235549878"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 06:40:13 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 8/9] ASoC: SOF: Provide probe debugfs support
Date: Tue, 18 Feb 2020 15:39:23 +0100
Message-Id: <20200218143924.10565-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218143924.10565-1-cezary.rojewski@intel.com>
References: <20200218143924.10565-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

Define debugfs subdirectory delegated for IPC communication with DSP.
Input format: uint,uint,(...) which are later translated into DWORDS
sequence and further into instances of struct of interest given the IPC
type.

For Extractor probes, following have been enabled:
- PROBE_POINT_ADD (echo <..> probe_points)
- PROBE_POINT_REMOVE (echo <..> probe_points_remove)
- PROBE_POINT_INFO (cat probe_points)

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v4:
- Debugfs probe handlers now check if extractor stream is running before
  continuing. To achieve this, 'extractor_stream_tag' is both initialized
  and set to SOF_PROBE_INVALID_NODE_ID on sof_probe_compr_free().
  Suggestion provided by Pierre

Changes in v2:
- renamed debugfs probe functions as requested by Pierre


 sound/soc/sof/debug.c | 226 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index d2b3b99d3a20..b5c0d6cf72cc 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -17,6 +17,221 @@
 #include "sof-priv.h"
 #include "ops.h"
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+#include "probe.h"
+
+/**
+ * strsplit_u32 - Split string into sequence of u32 tokens
+ * @buf:	String to split into tokens.
+ * @delim:	String containing delimiter characters.
+ * @tkns:	Returned u32 sequence pointer.
+ * @num_tkns:	Returned number of tokens obtained.
+ */
+static int
+strsplit_u32(char **buf, const char *delim, u32 **tkns, size_t *num_tkns)
+{
+	char *s;
+	u32 *data, *tmp;
+	size_t count = 0;
+	size_t cap = 32;
+	int ret = 0;
+
+	*tkns = NULL;
+	*num_tkns = 0;
+	data = kcalloc(cap, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	while ((s = strsep(buf, delim)) != NULL) {
+		ret = kstrtouint(s, 0, data + count);
+		if (ret)
+			goto exit;
+		if (++count >= cap) {
+			cap *= 2;
+			tmp = krealloc(data, cap * sizeof(*data), GFP_KERNEL);
+			if (!tmp) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+			data = tmp;
+		}
+	}
+
+	if (!count)
+		goto exit;
+	*tkns = kmemdup(data, count * sizeof(*data), GFP_KERNEL);
+	if (*tkns == NULL) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+	*num_tkns = count;
+
+exit:
+	kfree(data);
+	return ret;
+}
+
+static int tokenize_input(const char __user *from, size_t count,
+		loff_t *ppos, u32 **tkns, size_t *num_tkns)
+{
+	char *buf;
+	int ret;
+
+	buf = kmalloc(count + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(buf, count, ppos, from, count);
+	if (ret != count) {
+		ret = ret >= 0 ? -EIO : ret;
+		goto exit;
+	}
+
+	buf[count] = '\0';
+	ret = strsplit_u32((char **)&buf, ",", tkns, num_tkns);
+exit:
+	kfree(buf);
+	return ret;
+}
+
+static ssize_t probe_points_read(struct file *file,
+		char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	struct sof_probe_point_desc *desc;
+	size_t num_desc, len = 0;
+	char *buf;
+	int i, ret;
+
+	if (sdev->extractor_stream_tag == SOF_PROBE_INVALID_NODE_ID) {
+		dev_warn(sdev->dev, "no extractor stream running\n");
+		return -ENOENT;
+	}
+
+	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = sof_ipc_probe_points_info(sdev, &desc, &num_desc);
+	if (ret < 0)
+		goto exit;
+
+	for (i = 0; i < num_desc; i++) {
+		ret = snprintf(buf + len, PAGE_SIZE - len,
+			"Id: %#010x  Purpose: %d  Node id: %#x\n",
+			desc[i].buffer_id, desc[i].purpose, desc[i].stream_tag);
+		if (ret < 0)
+			goto free_desc;
+		len += ret;
+	}
+
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+free_desc:
+	kfree(desc);
+exit:
+	kfree(buf);
+	return ret;
+}
+
+static ssize_t probe_points_write(struct file *file,
+		const char __user *from, size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	struct sof_probe_point_desc *desc;
+	size_t num_tkns, bytes;
+	u32 *tkns;
+	int ret;
+
+	if (sdev->extractor_stream_tag == SOF_PROBE_INVALID_NODE_ID) {
+		dev_warn(sdev->dev, "no extractor stream running\n");
+		return -ENOENT;
+	}
+
+	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	if (ret < 0)
+		return ret;
+	bytes = sizeof(*tkns) * num_tkns;
+	if (!num_tkns || (bytes % sizeof(*desc))) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	desc = (struct sof_probe_point_desc *)tkns;
+	ret = sof_ipc_probe_points_add(sdev,
+			desc, bytes / sizeof(*desc));
+	if (!ret)
+		ret = count;
+exit:
+	kfree(tkns);
+	return ret;
+}
+
+static const struct file_operations probe_points_fops = {
+	.open = simple_open,
+	.read = probe_points_read,
+	.write = probe_points_write,
+	.llseek = default_llseek,
+};
+
+static ssize_t probe_points_remove_write(struct file *file,
+		const char __user *from, size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	size_t num_tkns;
+	u32 *tkns;
+	int ret;
+
+	if (sdev->extractor_stream_tag == SOF_PROBE_INVALID_NODE_ID) {
+		dev_warn(sdev->dev, "no extractor stream running\n");
+		return -ENOENT;
+	}
+
+	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	if (ret < 0)
+		return ret;
+	if (!num_tkns) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = sof_ipc_probe_points_remove(sdev, tkns, num_tkns);
+	if (!ret)
+		ret = count;
+exit:
+	kfree(tkns);
+	return ret;
+}
+
+static const struct file_operations probe_points_remove_fops = {
+	.open = simple_open,
+	.write = probe_points_remove_write,
+	.llseek = default_llseek,
+};
+
+static int snd_sof_debugfs_probe_item(struct snd_sof_dev *sdev,
+				 const char *name, mode_t mode,
+				 const struct file_operations *fops)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+	dfse->sdev = sdev;
+
+	debugfs_create_file(name, mode, sdev->debugfs_root, dfse, fops);
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
+
+	return 0;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
 #define MAX_IPC_FLOOD_DURATION_MS 1000
 #define MAX_IPC_FLOOD_COUNT 10000
@@ -436,6 +651,17 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 			return err;
 	}
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+	err = snd_sof_debugfs_probe_item(sdev, "probe_points",
+			0644, &probe_points_fops);
+	if (err < 0)
+		return err;
+	err = snd_sof_debugfs_probe_item(sdev, "probe_points_remove",
+			0200, &probe_points_remove_fops);
+	if (err < 0)
+		return err;
+#endif
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
 	/* create read-write ipc_flood_count debugfs entry */
 	err = snd_sof_debugfs_buf_item(sdev, NULL, 0,
-- 
2.17.1

