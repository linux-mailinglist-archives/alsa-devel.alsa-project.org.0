Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 491894B1155
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 16:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2C931945;
	Thu, 10 Feb 2022 16:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2C931945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644505761;
	bh=0ZJgAw18oUydj5dB+pUqxA25mSWs0m+bYy7EXxR8ToA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gM0b7i61y8vjZm9qVQpDrilxbh7EHjEq089XbAfJlJ1VyP7u06t6+ZZYp498V7701
	 vxuqoWjkpqyXkj8GWvxNF5jA5EO8qIXOG0JPJfqj7ABfjggstgo1f47ucOj1XagsyG
	 syyqNp3Fcdtidj7TPLDY9zuHuLstjdWKITZRZqsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FCE2F80533;
	Thu, 10 Feb 2022 16:06:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C807F8054A; Thu, 10 Feb 2022 16:06:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73792F80533
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 16:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73792F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YNNPQlXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644505559; x=1676041559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ZJgAw18oUydj5dB+pUqxA25mSWs0m+bYy7EXxR8ToA=;
 b=YNNPQlXHbDKVjc+k1+msJE32z7FOlrLGKcpCrOZ0iIi/aX9k++BuC7F1
 3O0HeP7ZlUFZPjGKC68uXsRgnOd/cCJ91SyHrIkpQOXKsSpT4BzgChFNo
 WCOo5kmZXmIdqW9Hrn4rjaZslt+6VnYBqkZaEdaED6IGK0alxVY8k4TGf
 PkRXUC4m1V/D6UZvWH4/boZAhnTxC4AVVlYU+tbWGgjjOJ4Ub3hAzYDo7
 PVpJWXZXRqPOiyPHK1BNE2GyZecwFYrSlZ/Q3UacJmIG18glkWkxtLCWk
 phiqP2YsGwuEHiAdBq9vjPzqECKpGHEn/364hfwER9F/72l/BLcGaeQOZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249715069"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249715069"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="500422732"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:52 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH v2 8/9] ASoC: SOF: Convert the generic IPC message injector
 into SOF client
Date: Thu, 10 Feb 2022 17:05:24 +0200
Message-Id: <20220210150525.30756-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
References: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

Move the IPC message injection code out from the debug file as separate
SOF client driver.

Based on the kernel configuration, the device registration for the new IPC
message injector is going to happen in the core.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Kconfig                       |   3 +-
 sound/soc/sof/Makefile                      |   2 +
 sound/soc/sof/debug.c                       | 108 -----------
 sound/soc/sof/sof-client-ipc-msg-injector.c | 192 ++++++++++++++++++++
 sound/soc/sof/sof-client.c                  |  35 +++-
 sound/soc/sof/sof-priv.h                    |   4 -
 6 files changed, 229 insertions(+), 115 deletions(-)
 create mode 100644 sound/soc/sof/sof-client-ipc-msg-injector.c

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 3f8a2cadd2f8..203b086ac22c 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -212,7 +212,8 @@ config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
 	  Select the number of IPC flood test clients to be created.
 
 config SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR
-	bool "SOF enable IPC message injector"
+	tristate "SOF enable IPC message injector"
+	select SND_SOC_SOF_CLIENT
 	help
 	  This option enables the IPC message injector which can be used to send
 	  crafted IPC messages to the DSP to test its robustness.
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 964eff43c9ba..a2ae79ebf756 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -12,6 +12,7 @@ snd-sof-acpi-objs := sof-acpi-dev.o
 snd-sof-of-objs := sof-of-dev.o
 
 snd-sof-ipc-flood-test-objs := sof-client-ipc-flood-test.o
+snd-sof-ipc-msg-injector-objs := sof-client-ipc-msg-injector.o
 
 snd-sof-nocodec-objs := nocodec.o
 
@@ -27,6 +28,7 @@ obj-$(CONFIG_SND_SOC_SOF_OF_DEV) += snd-sof-of.o
 obj-$(CONFIG_SND_SOC_SOF_PCI_DEV) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST) += snd-sof-ipc-flood-test.o
+obj-$(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR) += snd-sof-ipc-msg-injector.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
 obj-$(CONFIG_SND_SOC_SOF_IMX_TOPLEVEL) += imx/
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index e3a5f77bbd4d..937fe6e11d0d 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -234,105 +234,6 @@ static int snd_sof_debugfs_probe_item(struct snd_sof_dev *sdev,
 }
 #endif
 
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR)
-static ssize_t msg_inject_read(struct file *file, char __user *buffer,
-			       size_t count, loff_t *ppos)
-{
-	struct snd_sof_dfsentry *dfse = file->private_data;
-	struct sof_ipc_reply *rhdr = dfse->msg_inject_rx;
-
-	if (!rhdr->hdr.size || !count || *ppos)
-		return 0;
-
-	if (count > rhdr->hdr.size)
-		count = rhdr->hdr.size;
-
-	if (copy_to_user(buffer, dfse->msg_inject_rx, count))
-		return -EFAULT;
-
-	*ppos += count;
-	return count;
-}
-
-static ssize_t msg_inject_write(struct file *file, const char __user *buffer,
-				size_t count, loff_t *ppos)
-{
-	struct snd_sof_dfsentry *dfse = file->private_data;
-	struct snd_sof_dev *sdev = dfse->sdev;
-	struct sof_ipc_cmd_hdr *hdr = dfse->msg_inject_tx;
-	size_t size;
-	int ret, err;
-
-	if (*ppos)
-		return 0;
-
-	size = simple_write_to_buffer(dfse->msg_inject_tx, SOF_IPC_MSG_MAX_SIZE,
-				      ppos, buffer, count);
-	if (size != count)
-		return size > 0 ? -EFAULT : size;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		dev_err_ratelimited(sdev->dev, "%s: DSP resume failed: %d\n",
-				    __func__, ret);
-		pm_runtime_put_noidle(sdev->dev);
-		goto out;
-	}
-
-	/* send the message */
-	memset(dfse->msg_inject_rx, 0, SOF_IPC_MSG_MAX_SIZE);
-	ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd, dfse->msg_inject_tx, count,
-				 dfse->msg_inject_rx, SOF_IPC_MSG_MAX_SIZE);
-
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev, "%s: DSP idle failed: %d\n",
-				    __func__, err);
-
-	/* return size if test is successful */
-	if (ret >= 0)
-		ret = size;
-
-out:
-	return ret;
-}
-
-static const struct file_operations msg_inject_fops = {
-	.open = simple_open,
-	.read = msg_inject_read,
-	.write = msg_inject_write,
-	.llseek = default_llseek,
-};
-
-static int snd_sof_debugfs_msg_inject_item(struct snd_sof_dev *sdev,
-					   const char *name, mode_t mode,
-					   const struct file_operations *fops)
-{
-	struct snd_sof_dfsentry *dfse;
-
-	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
-	if (!dfse)
-		return -ENOMEM;
-
-	/* pre allocate the tx and rx buffers */
-	dfse->msg_inject_tx = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
-	dfse->msg_inject_rx = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
-	if (!dfse->msg_inject_tx || !dfse->msg_inject_rx)
-		return -ENOMEM;
-
-	dfse->type = SOF_DFSENTRY_TYPE_BUF;
-	dfse->sdev = sdev;
-
-	debugfs_create_file(name, mode, sdev->debugfs_root, dfse, fops);
-	/* add to dfsentry list */
-	list_add(&dfse->list, &sdev->dfsentry_list);
-
-	return 0;
-}
-#endif
-
 static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 				  size_t count, loff_t *ppos)
 {
@@ -679,15 +580,6 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 		return err;
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR)
-	err = snd_sof_debugfs_msg_inject_item(sdev, "ipc_msg_inject", 0644,
-					      &msg_inject_fops);
-
-	/* errors are only due to memory allocation, not debugfs */
-	if (err < 0)
-		return err;
-#endif
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_sof_dbg_init);
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
new file mode 100644
index 000000000000..bce103da4c49
--- /dev/null
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+// Author: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
+//
+
+#include <linux/auxiliary_bus.h>
+#include <linux/completion.h>
+#include <linux/debugfs.h>
+#include <linux/ktime.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <sound/sof/header.h>
+
+#include "sof-client.h"
+
+#define SOF_IPC_CLIENT_SUSPEND_DELAY_MS	3000
+
+struct sof_msg_inject_priv {
+	struct dentry *dfs_file;
+
+	void *tx_buffer;
+	void *rx_buffer;
+};
+
+static int sof_msg_inject_dfs_open(struct inode *inode, struct file *file)
+{
+	struct sof_client_dev *cdev = inode->i_private;
+	int ret;
+
+	if (sof_client_get_fw_state(cdev) == SOF_FW_CRASHED)
+		return -ENODEV;
+
+	ret = debugfs_file_get(file->f_path.dentry);
+	if (unlikely(ret))
+		return ret;
+
+	ret = simple_open(inode, file);
+	if (ret)
+		debugfs_file_put(file->f_path.dentry);
+
+	return ret;
+}
+
+static ssize_t sof_msg_inject_dfs_read(struct file *file, char __user *buffer,
+				       size_t count, loff_t *ppos)
+{
+	struct sof_client_dev *cdev = file->private_data;
+	struct sof_msg_inject_priv *priv = cdev->data;
+	struct sof_ipc_reply *rhdr = priv->rx_buffer;
+
+	if (!rhdr->hdr.size || !count || *ppos)
+		return 0;
+
+	if (count > rhdr->hdr.size)
+		count = rhdr->hdr.size;
+
+	if (copy_to_user(buffer, priv->rx_buffer, count))
+		return -EFAULT;
+
+	*ppos += count;
+	return count;
+}
+
+static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *buffer,
+					size_t count, loff_t *ppos)
+{
+	struct sof_client_dev *cdev = file->private_data;
+	struct sof_msg_inject_priv *priv = cdev->data;
+	struct device *dev = &cdev->auxdev.dev;
+	int ret, err;
+	size_t size;
+
+	if (*ppos)
+		return 0;
+
+	size = simple_write_to_buffer(priv->tx_buffer, SOF_IPC_MSG_MAX_SIZE,
+				      ppos, buffer, count);
+	if (size != count)
+		return size > 0 ? -EFAULT : size;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
+
+	/* send the message */
+	memset(priv->rx_buffer, 0, SOF_IPC_MSG_MAX_SIZE);
+	ret = sof_client_ipc_tx_message(cdev, priv->tx_buffer, priv->rx_buffer,
+					SOF_IPC_MSG_MAX_SIZE);
+	pm_runtime_mark_last_busy(dev);
+	err = pm_runtime_put_autosuspend(dev);
+	if (err < 0)
+		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
+
+	/* return size if test is successful */
+	if (ret >= 0)
+		ret = size;
+
+	return ret;
+};
+
+static int sof_msg_inject_dfs_release(struct inode *inode, struct file *file)
+{
+	debugfs_file_put(file->f_path.dentry);
+
+	return 0;
+}
+
+static const struct file_operations sof_msg_inject_fops = {
+	.open = sof_msg_inject_dfs_open,
+	.read = sof_msg_inject_dfs_read,
+	.write = sof_msg_inject_dfs_write,
+	.llseek = default_llseek,
+	.release = sof_msg_inject_dfs_release,
+
+	.owner = THIS_MODULE,
+};
+
+static int sof_msg_inject_probe(struct auxiliary_device *auxdev,
+				const struct auxiliary_device_id *id)
+{
+	struct sof_client_dev *cdev = auxiliary_dev_to_sof_client_dev(auxdev);
+	struct dentry *debugfs_root = sof_client_get_debugfs_root(cdev);
+	struct device *dev = &auxdev->dev;
+	struct sof_msg_inject_priv *priv;
+
+	/* allocate memory for client data */
+	priv = devm_kzalloc(&auxdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->tx_buffer = devm_kmalloc(dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	priv->rx_buffer = devm_kmalloc(dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!priv->tx_buffer || !priv->rx_buffer)
+		return -ENOMEM;
+
+	cdev->data = priv;
+
+	priv->dfs_file = debugfs_create_file("ipc_msg_inject", 0644, debugfs_root,
+					     cdev, &sof_msg_inject_fops);
+
+	/* enable runtime PM */
+	pm_runtime_set_autosuspend_delay(dev, SOF_IPC_CLIENT_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+}
+
+static void sof_msg_inject_remove(struct auxiliary_device *auxdev)
+{
+	struct sof_client_dev *cdev = auxiliary_dev_to_sof_client_dev(auxdev);
+	struct sof_msg_inject_priv *priv = cdev->data;
+
+	pm_runtime_disable(&auxdev->dev);
+
+	debugfs_remove(priv->dfs_file);
+}
+
+static const struct auxiliary_device_id sof_msg_inject_client_id_table[] = {
+	{ .name = "snd_sof.msg_injector" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, sof_msg_inject_client_id_table);
+
+/*
+ * No need for driver pm_ops as the generic pm callbacks in the auxiliary bus
+ * type are enough to ensure that the parent SOF device resumes to bring the DSP
+ * back to D0.
+ * Driver name will be set based on KBUILD_MODNAME.
+ */
+static struct auxiliary_driver sof_msg_inject_client_drv = {
+	.probe = sof_msg_inject_probe,
+	.remove = sof_msg_inject_remove,
+
+	.id_table = sof_msg_inject_client_id_table,
+};
+
+module_auxiliary_driver(sof_msg_inject_client_drv);
+
+MODULE_DESCRIPTION("SOF IPC Message Injector Client Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 0ffe7a26a19a..686ad0c3bb61 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -102,6 +102,25 @@ static inline int sof_register_ipc_flood_test(struct snd_sof_dev *sdev)
 static inline void sof_unregister_ipc_flood_test(struct snd_sof_dev *sdev) {}
 #endif /* CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST */
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR)
+static int sof_register_ipc_msg_injector(struct snd_sof_dev *sdev)
+{
+	return sof_client_dev_register(sdev, "msg_injector", 0, NULL, 0);
+}
+
+static void sof_unregister_ipc_msg_injector(struct snd_sof_dev *sdev)
+{
+	sof_client_dev_unregister(sdev, "msg_injector", 0);
+}
+#else
+static inline int sof_register_ipc_msg_injector(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static inline void sof_unregister_ipc_msg_injector(struct snd_sof_dev *sdev) {}
+#endif /* CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR */
+
 int sof_register_clients(struct snd_sof_dev *sdev)
 {
 	int ret;
@@ -113,13 +132,24 @@ int sof_register_clients(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	ret = sof_register_ipc_msg_injector(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "IPC message injector client registration failed\n");
+		goto err_msg_injector;
+	}
+
 	/* Platform depndent client device registration */
 
 	if (sof_ops(sdev) && sof_ops(sdev)->register_ipc_clients)
 		ret = sof_ops(sdev)->register_ipc_clients(sdev);
 
-	if (ret)
-		sof_unregister_ipc_flood_test(sdev);
+	if (!ret)
+		return 0;
+
+	sof_unregister_ipc_msg_injector(sdev);
+
+err_msg_injector:
+	sof_unregister_ipc_flood_test(sdev);
 
 	return ret;
 }
@@ -129,6 +159,7 @@ void sof_unregister_clients(struct snd_sof_dev *sdev)
 	if (sof_ops(sdev) && sof_ops(sdev)->unregister_ipc_clients)
 		sof_ops(sdev)->unregister_ipc_clients(sdev);
 
+	sof_unregister_ipc_msg_injector(sdev);
 	sof_unregister_ipc_flood_test(sdev);
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1af61ff89345..2529408a4e90 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -324,10 +324,6 @@ struct snd_sof_dfsentry {
 	enum sof_debugfs_access_type access_type;
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 	char *cache_buf; /* buffer to cache the contents of debugfs memory */
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR)
-	void *msg_inject_tx;
-	void *msg_inject_rx;
 #endif
 	struct snd_sof_dev *sdev;
 	struct list_head list;  /* list in sdev dfsentry list */
-- 
2.35.1

