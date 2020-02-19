Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E216387C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:23:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D18B81705;
	Wed, 19 Feb 2020 01:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D18B81705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071791;
	bh=FRfR8YehnSAiL9jiYh/HsGab1hjtSgI902DvMF5QBlk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=O7rKfsK+yFqlT59NpFyZLL3/xYswLkaGRquSJoBZde4KmR4sHVxjgPvHH+Kaiw8cF
	 n1vXixouTsJ+87piHBFUV2K3kWe3tPQwmWfZmMbEbCpI+ryUrahfd6dSmQNi2GcEKp
	 ZwKAFJMEkM+xFjTs78DxSHwSE2wUjZ2ny7MWsXvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33EB8F8035E;
	Wed, 19 Feb 2020 01:10:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A302F80350; Wed, 19 Feb 2020 01:10:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0D5FCF80347
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:10:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D5FCF80347
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41DD6FEC;
 Tue, 18 Feb 2020 16:10:39 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B979B3F68F;
 Tue, 18 Feb 2020 16:10:38 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: SOF: Provide probe debugfs support" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: SOF: Provide probe debugfs support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 394695f410c1cd3208906451ba5420f45c420a51 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 18 Feb 2020 15:39:23 +0100
Subject: [PATCH] ASoC: SOF: Provide probe debugfs support

Define debugfs subdirectory delegated for IPC communication with DSP.
Input format: uint,uint,(...) which are later translated into DWORDS
sequence and further into instances of struct of interest given the IPC
type.

For Extractor probes, following have been enabled:
- PROBE_POINT_ADD (echo <..> probe_points)
- PROBE_POINT_REMOVE (echo <..> probe_points_remove)
- PROBE_POINT_INFO (cat probe_points)

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200218143924.10565-9-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
2.20.1

