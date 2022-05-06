Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722051D931
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:29:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B7D1185F;
	Fri,  6 May 2022 15:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B7D1185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651843790;
	bh=mA5s5teS9go9NIdy3bOYcUMVKQO74l9K8UDqZM8/wG4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G6Kw4qydISEu8iddQKvqrhNXYo9w5X+N4AtvRjyyEACrI52g2C+U0YnENqu/FESSe
	 LX7W3HHHCy5jHr9Ma3FoSB8t3WXFZFobF6KyhZpMmAvfwHvdiOXkXIxgWOMd7WhtwI
	 UIq3jrr7UhAX+i6sfJv4ewaitkVDnHKt5FY6QJO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11014F8053E;
	Fri,  6 May 2022 15:27:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DAC6F80542; Fri,  6 May 2022 15:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7AA0F80529
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7AA0F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UhjPdABu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651843613; x=1683379613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mA5s5teS9go9NIdy3bOYcUMVKQO74l9K8UDqZM8/wG4=;
 b=UhjPdABuHYR/YWANKH95nL+8PvqDLebpue5i/FamRqYPjUzEP+u1VdtS
 Hmm0nQJeYQghDshdJE4b8LZEF4xgF2z2vfAoBxI+stckfAGVjI14up+tJ
 axT/2IqCnXioH51SsA/TNEcw1ximB4DZLTaay1gjB040c6t0XLvhF0/y0
 M171qcNNCViT2vPvYKzokoqMvbrQxrNg7fRB6OaMsZGXSCHP9NfJa6s8g
 CXE/kxKuCvfHig/DY9uNAYQ7NgQEz/uzgTCFqgKz/DVLRsmN00TCWQLeD
 3b9A/NNi8d2nh3ZilnMT9DgpBiUyl+WryEI4vnFhR6ddim7Axe+tBpnDa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="293672833"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293672833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585971620"
Received: from oelagadx-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.61.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH 7/8] ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages
Date: Fri,  6 May 2022 16:26:46 +0300
Message-Id: <20220506132647.18690-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
References: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The IPC message representation of an IPC4 differs from the IPC3 version
significantly.

The message for IPC4 should be written to the debugfs file in this form:
0-7 IPC4 header (2x u32)
8-  additional payload, if any

The reply is given back in the same form.

The message size limitation is the same as with the IPC3, only messages
which can fit to the mailbox can be injected (and received).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/sof-client-ipc-msg-injector.c | 133 +++++++++++++++++++-
 1 file changed, 130 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index b05493b1cd37..c2480317730c 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <sound/sof/header.h>
+#include <sound/sof/ipc4/header.h>
 
 #include "sof-client.h"
 
@@ -23,6 +24,7 @@
 struct sof_msg_inject_priv {
 	struct dentry *dfs_file;
 	size_t max_msg_size;
+	enum sof_ipc_type ipc_type;
 
 	void *tx_buffer;
 	void *rx_buffer;
@@ -67,6 +69,49 @@ static ssize_t sof_msg_inject_dfs_read(struct file *file, char __user *buffer,
 	return count;
 }
 
+static ssize_t sof_msg_inject_ipc4_dfs_read(struct file *file,
+					    char __user *buffer,
+					    size_t count, loff_t *ppos)
+{
+	struct sof_client_dev *cdev = file->private_data;
+	struct sof_msg_inject_priv *priv = cdev->data;
+	struct sof_ipc4_msg *ipc4_msg = priv->rx_buffer;
+	size_t remaining;
+
+	if (!ipc4_msg->header_u64 || !count || *ppos)
+		return 0;
+
+	remaining = sizeof(ipc4_msg->header_u64);
+
+	/* Only get large config have payload */
+	if (SOF_IPC4_MSG_IS_MODULE_MSG(ipc4_msg->primary) &&
+	    (SOF_IPC4_MSG_TYPE_GET(ipc4_msg->primary) == SOF_IPC4_MOD_LARGE_CONFIG_GET))
+		remaining += ipc4_msg->data_size;
+
+	if (count > remaining)
+		count = remaining;
+
+	/* copy the header first */
+	if (copy_to_user(buffer, &ipc4_msg->header_u64, sizeof(ipc4_msg->header_u64)))
+		return -EFAULT;
+
+	*ppos += sizeof(ipc4_msg->header_u64);
+	remaining -= sizeof(ipc4_msg->header_u64);
+
+	if (!remaining)
+		return count;
+
+	if (remaining > ipc4_msg->data_size)
+		remaining = ipc4_msg->data_size;
+
+	/* Copy the payload */
+	if (copy_to_user(buffer + *ppos, ipc4_msg->data_ptr, remaining))
+		return -EFAULT;
+
+	*ppos += remaining;
+	return count;
+}
+
 static int sof_msg_inject_send_message(struct sof_client_dev *cdev)
 {
 	struct sof_msg_inject_priv *priv = cdev->data;
@@ -120,6 +165,56 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
 	return size;
 };
 
+static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
+					     const char __user *buffer,
+					     size_t count, loff_t *ppos)
+{
+	struct sof_client_dev *cdev = file->private_data;
+	struct sof_msg_inject_priv *priv = cdev->data;
+	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
+	size_t size;
+	int ret;
+
+	if (*ppos)
+		return 0;
+
+	if (count < sizeof(ipc4_msg->header_u64))
+		return -EINVAL;
+
+	/* copy the header first */
+	size = simple_write_to_buffer(&ipc4_msg->header_u64,
+				      sizeof(ipc4_msg->header_u64),
+				      ppos, buffer, count);
+	if (size != sizeof(ipc4_msg->header_u64))
+		return size > 0 ? -EFAULT : size;
+
+	count -= size;
+	if (!count) {
+		/* Copy the payload */
+		size = simple_write_to_buffer(ipc4_msg->data_ptr,
+					      priv->max_msg_size, ppos, buffer,
+					      count);
+		if (size != count)
+			return size > 0 ? -EFAULT : size;
+	}
+
+	ipc4_msg->data_size = count;
+
+	/* Initialize the reply storage */
+	ipc4_msg = priv->rx_buffer;
+	ipc4_msg->header_u64 = 0;
+	ipc4_msg->data_size = priv->max_msg_size;
+	memset(ipc4_msg->data_ptr, 0, priv->max_msg_size);
+
+	ret = sof_msg_inject_send_message(cdev);
+
+	/* return the error code if test failed */
+	if (ret < 0)
+		size = ret;
+
+	return size;
+};
+
 static int sof_msg_inject_dfs_release(struct inode *inode, struct file *file)
 {
 	debugfs_file_put(file->f_path.dentry);
@@ -137,29 +232,61 @@ static const struct file_operations sof_msg_inject_fops = {
 	.owner = THIS_MODULE,
 };
 
+static const struct file_operations sof_msg_inject_ipc4_fops = {
+	.open = sof_msg_inject_dfs_open,
+	.read = sof_msg_inject_ipc4_dfs_read,
+	.write = sof_msg_inject_ipc4_dfs_write,
+	.llseek = default_llseek,
+	.release = sof_msg_inject_dfs_release,
+
+	.owner = THIS_MODULE,
+};
+
 static int sof_msg_inject_probe(struct auxiliary_device *auxdev,
 				const struct auxiliary_device_id *id)
 {
 	struct sof_client_dev *cdev = auxiliary_dev_to_sof_client_dev(auxdev);
 	struct dentry *debugfs_root = sof_client_get_debugfs_root(cdev);
+	static const struct file_operations *fops;
 	struct device *dev = &auxdev->dev;
 	struct sof_msg_inject_priv *priv;
+	size_t alloc_size;
 
 	/* allocate memory for client data */
 	priv = devm_kzalloc(&auxdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->ipc_type = sof_client_get_ipc_type(cdev);
 	priv->max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
-	priv->tx_buffer = devm_kmalloc(dev, priv->max_msg_size, GFP_KERNEL);
-	priv->rx_buffer = devm_kzalloc(dev, priv->max_msg_size, GFP_KERNEL);
+	alloc_size = priv->max_msg_size;
+
+	if (priv->ipc_type == SOF_INTEL_IPC4)
+		alloc_size += sizeof(struct sof_ipc4_msg);
+
+	priv->tx_buffer = devm_kmalloc(dev, alloc_size, GFP_KERNEL);
+	priv->rx_buffer = devm_kzalloc(dev, alloc_size, GFP_KERNEL);
 	if (!priv->tx_buffer || !priv->rx_buffer)
 		return -ENOMEM;
 
+	if (priv->ipc_type == SOF_INTEL_IPC4) {
+		struct sof_ipc4_msg *ipc4_msg;
+
+		ipc4_msg = priv->tx_buffer;
+		ipc4_msg->data_ptr = priv->tx_buffer + sizeof(struct sof_ipc4_msg);
+
+		ipc4_msg = priv->rx_buffer;
+		ipc4_msg->data_ptr = priv->rx_buffer + sizeof(struct sof_ipc4_msg);
+
+		fops = &sof_msg_inject_ipc4_fops;
+	} else {
+		fops = &sof_msg_inject_fops;
+	}
+
 	cdev->data = priv;
 
 	priv->dfs_file = debugfs_create_file("ipc_msg_inject", 0644, debugfs_root,
-					     cdev, &sof_msg_inject_fops);
+					     cdev, fops);
 
 	/* enable runtime PM */
 	pm_runtime_set_autosuspend_delay(dev, SOF_IPC_CLIENT_SUSPEND_DELAY_MS);
-- 
2.36.0

