Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8C728B0B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 00:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD02826;
	Fri,  9 Jun 2023 00:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD02826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686262834;
	bh=3DBRlx2NxSnA6NJ8HFQLMriYLzCJmMXiy4qm67FNlIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m1uvRmpTL/ymWPGZAELPunqwTSFmb8v1w+SL70TTBUnT2hNW3NNeWBQyS7Ax+z7RJ
	 Qmx6mahJ7+yXVOPEbHcf4eXP8+NRjX8tvg3nm50BMCkLdCeZ+xYrgK1FV3psZIcVXz
	 JrQEp8NP0AX13kBlB3fk9P40BCZqS5KHDdOyXmb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B55DF8055A; Fri,  9 Jun 2023 00:19:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 996A1F80520;
	Fri,  9 Jun 2023 00:19:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CACCF80549; Fri,  9 Jun 2023 00:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23E4EF80520
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 00:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E4EF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Vegwzt0k
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-650c8cb68aeso933064b3a.3
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686262725; x=1688854725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+cMdbZhW0Wcsi54eHFr6fOPrRXt/DqtLKCDv50m+tA=;
        b=Vegwzt0kxPCBcNMxLShjdOnCxhwH2zxv2t4crDVba9RiOWqVtfwErHPIwYWdkTwrsq
         NOPH6297RfK1kfjao4erZyGbUHTz0/NvTxRPThcvQziNXWwrGVcZzVhkcpmO3PtXI7zv
         rLKqWDrzCLH2Eek/y89yn9D5S459u5M4BnQu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686262725; x=1688854725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+cMdbZhW0Wcsi54eHFr6fOPrRXt/DqtLKCDv50m+tA=;
        b=OSR4xkwbMsPs7bkqlkDpEOQiU6yjyKQwOZS0wxC7DbGA+NzwgJ1VA5gAmoSBzpf3bK
         1XOeLHJwnYLRa15N6e2sEPcftE52lh9X5Z+pLZf7r89eYbbAUpnSQW0ic8C0+crPpZgk
         zOCGUlRtg402j5A5zvXOHo7wbf81HKVypZW+TfFLLewBay3Zu8R0O6bmlnCOccng0YOZ
         bhBsOiHk2atdOtbaM4JBRp/h7upZJvxkSPtcLxcCJRRX5XCevC65skawnXu9na3coV3J
         IKFhLlleNkQehZAmM/UznNRSJr8AYAnfVWgn2UKIY+dVGciDMg2NZ2Bzv4FdaoPR8nL+
         KjoQ==
X-Gm-Message-State: AC+VfDwjag0I0xwCr0uPHhZYIWOluvFbkaSI5W2qRB2IQv8dfXqu/O1T
	KP2IhzjAB0wMhUKXGGberxTQV/IVDvOQ7KVTFQ==
X-Google-Smtp-Source: 
 ACHHUZ7d15Ht1ImVg4AyZmq8AjTmsMugIch861POLcb835jIHc9eReTFiUveQUNTSdqLdop6xyFZmQ==
X-Received: by 2002:a05:6a20:4425:b0:10e:e218:d3f0 with SMTP id
 ce37-20020a056a20442500b0010ee218d3f0mr5577054pzb.54.1686262725352;
        Thu, 08 Jun 2023 15:18:45 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:4e2b:3200:7e2c:cb0])
        by smtp.gmail.com with UTF8SMTPSA id
 o18-20020a639212000000b00502ecb91940sm1693889pgd.55.2023.06.08.15.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 15:18:45 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: SOF: Add IPC3 Kernel Injector
Date: Thu,  8 Jun 2023 15:18:16 -0700
Message-ID: <20230608221822.2825786-2-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230608221822.2825786-1-cujomalainey@chromium.org>
References: <20230608221822.2825786-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NDGDOJMGBHMFVYJ47DJEHXOOSCBV4ZCA
X-Message-ID-Hash: NDGDOJMGBHMFVYJ47DJEHXOOSCBV4ZCA
X-MailFrom: cujomalainey@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDGDOJMGBHMFVYJ47DJEHXOOSCBV4ZCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Add debugfs path to fake a malicious firmware message for fuzzing purposes.

Skip IPC4 for initial integration

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/Kconfig                         |  11 ++
 sound/soc/sof/Makefile                        |   2 +
 .../soc/sof/sof-client-ipc-kernel-injector.c  | 162 ++++++++++++++++++
 sound/soc/sof/sof-client.c                    |  52 ++++++
 sound/soc/sof/sof-client.h                    |   1 +
 5 files changed, 228 insertions(+)
 create mode 100644 sound/soc/sof/sof-client-ipc-kernel-injector.c

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index a2725188f4ce4..80361139a49ad 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -236,6 +236,17 @@ config SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR
 	  Say Y if you want to enable the IPC message injector.
 	  If unsure, select "N".
 
+config SND_SOC_SOF_DEBUG_IPC_KERNEL_INJECTOR
+	tristate "SOF enable IPC kernel injector"
+	depends on SND_SOC_SOF
+	select SND_SOC_SOF_CLIENT
+	help
+	  This option enables the IPC kernel injector which can be used to send
+	  crafted IPC messages to the kernel to test its robustness against
+	  DSP messages.
+	  Say Y if you want to enable the IPC kernel injector.
+	  If unsure, select "N".
+
 config SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT
 	bool "SOF retain DSP context on any FW exceptions"
 	help
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 308d876399163..744d40bd8c8ba 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -26,6 +26,7 @@ snd-sof-of-objs := sof-of-dev.o
 
 snd-sof-ipc-flood-test-objs := sof-client-ipc-flood-test.o
 snd-sof-ipc-msg-injector-objs := sof-client-ipc-msg-injector.o
+snd-sof-ipc-kernel-injector-objs := sof-client-ipc-kernel-injector.o
 snd-sof-probes-objs := sof-client-probes.o
 ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
 snd-sof-probes-objs += sof-client-probes-ipc3.o
@@ -49,6 +50,7 @@ obj-$(CONFIG_SND_SOC_SOF_PCI_DEV) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST) += snd-sof-ipc-flood-test.o
 obj-$(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR) += snd-sof-ipc-msg-injector.o
+obj-$(CONFIG_SND_SOC_SOF_DEBUG_IPC_KERNEL_INJECTOR) += snd-sof-ipc-kernel-injector.o
 obj-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += snd-sof-probes.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
new file mode 100644
index 0000000000000..ad0ed2d570a91
--- /dev/null
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2023 Google Inc. All rights reserved.
+//
+// Author: Curtis Malainey <cujomalainey@chromium.org>
+//
+
+#include <linux/auxiliary_bus.h>
+#include <linux/debugfs.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/sof/header.h>
+
+#include "sof-client.h"
+
+#define SOF_IPC_CLIENT_SUSPEND_DELAY_MS	3000
+
+struct sof_msg_inject_priv {
+	struct dentry *kernel_dfs_file;
+	size_t max_msg_size;
+
+	void *kernel_buffer;
+};
+
+static int sof_msg_inject_dfs_open(struct inode *inode, struct file *file)
+{
+	int ret = debugfs_file_get(file->f_path.dentry);
+
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
+static ssize_t sof_kernel_msg_inject_dfs_write(struct file *file, const char __user *buffer,
+					       size_t count, loff_t *ppos)
+{
+	struct sof_client_dev *cdev = file->private_data;
+	struct sof_msg_inject_priv *priv = cdev->data;
+	struct sof_ipc_cmd_hdr *hdr = priv->kernel_buffer;
+	struct device *dev = &cdev->auxdev.dev;
+	ssize_t size;
+	int ret;
+
+	if (*ppos)
+		return 0;
+
+	size = simple_write_to_buffer(priv->kernel_buffer, priv->max_msg_size,
+				      ppos, buffer, count);
+	if (size < 0)
+		return size;
+	if (size != count)
+		return -EFAULT;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
+		return ret;
+	}
+
+	sof_client_ipc_rx_message(cdev, hdr, priv->kernel_buffer);
+
+	pm_runtime_mark_last_busy(dev);
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", ret);
+
+	return count;
+};
+
+static int sof_msg_inject_dfs_release(struct inode *inode, struct file *file)
+{
+	debugfs_file_put(file->f_path.dentry);
+
+	return 0;
+}
+
+static const struct file_operations sof_kernel_msg_inject_fops = {
+	.open = sof_msg_inject_dfs_open,
+	.write = sof_kernel_msg_inject_dfs_write,
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
+	size_t alloc_size;
+
+	/* allocate memory for client data */
+	priv = devm_kzalloc(&auxdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
+	alloc_size = priv->max_msg_size;
+	priv->kernel_buffer = devm_kmalloc(dev, alloc_size, GFP_KERNEL);
+
+	if (!priv->kernel_buffer)
+		return -ENOMEM;
+
+	cdev->data = priv;
+
+	priv->kernel_dfs_file = debugfs_create_file("kernel_ipc_msg_inject", 0644,
+						    debugfs_root, cdev,
+						    &sof_kernel_msg_inject_fops);
+
+	/* enable runtime PM */
+	pm_runtime_set_autosuspend_delay(dev, SOF_IPC_CLIENT_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
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
+	debugfs_remove(priv->kernel_dfs_file);
+}
+
+static const struct auxiliary_device_id sof_msg_inject_client_id_table[] = {
+	{ .name = "snd_sof.kernel_injector" },
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
+MODULE_DESCRIPTION("SOF IPC Kernel Injector Client Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index d6b7caa0cf031..284de96e779c6 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -16,6 +16,7 @@
 #include "ops.h"
 #include "sof-client.h"
 #include "sof-priv.h"
+#include "ipc3-priv.h"
 #include "ipc4-priv.h"
 
 /**
@@ -126,6 +127,29 @@ static inline int sof_register_ipc_msg_injector(struct snd_sof_dev *sdev)
 static inline void sof_unregister_ipc_msg_injector(struct snd_sof_dev *sdev) {}
 #endif /* CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR */
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_KERNEL_INJECTOR)
+static int sof_register_ipc_kernel_injector(struct snd_sof_dev *sdev)
+{
+	/* Only IPC3 supported right now */
+	if (sdev->pdata->ipc_type != SOF_IPC)
+		return 0;
+
+	return sof_client_dev_register(sdev, "kernel_injector", 0, NULL, 0);
+}
+
+static void sof_unregister_ipc_kernel_injector(struct snd_sof_dev *sdev)
+{
+	sof_client_dev_unregister(sdev, "kernel_injector", 0);
+}
+#else
+static inline int sof_register_ipc_kernel_injector(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static inline void sof_unregister_ipc_kernel_injector(struct snd_sof_dev *sdev) {}
+#endif /* CONFIG_SND_SOC_SOF_DEBUG_IPC_KERNEL_INJECTOR */
+
 int sof_register_clients(struct snd_sof_dev *sdev)
 {
 	int ret;
@@ -146,6 +170,12 @@ int sof_register_clients(struct snd_sof_dev *sdev)
 		goto err_msg_injector;
 	}
 
+	ret = sof_register_ipc_kernel_injector(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "IPC kernel injector client registration failed\n");
+		goto err_kernel_injector;
+	}
+
 	/* Platform depndent client device registration */
 
 	if (sof_ops(sdev) && sof_ops(sdev)->register_ipc_clients)
@@ -154,6 +184,9 @@ int sof_register_clients(struct snd_sof_dev *sdev)
 	if (!ret)
 		return 0;
 
+	sof_unregister_ipc_kernel_injector(sdev);
+
+err_kernel_injector:
 	sof_unregister_ipc_msg_injector(sdev);
 
 err_msg_injector:
@@ -167,6 +200,7 @@ void sof_unregister_clients(struct snd_sof_dev *sdev)
 	if (sof_ops(sdev) && sof_ops(sdev)->unregister_ipc_clients)
 		sof_ops(sdev)->unregister_ipc_clients(sdev);
 
+	sof_unregister_ipc_kernel_injector(sdev);
 	sof_unregister_ipc_msg_injector(sdev);
 	sof_unregister_ipc_flood_test(sdev);
 }
@@ -269,6 +303,24 @@ int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
 
+int sof_client_ipc_rx_message(struct sof_client_dev *cdev, void *ipc_msg, void *msg_buf)
+{
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
+
+		if (hdr->size < sizeof(hdr)) {
+			dev_err(cdev->sdev->dev, "The received message size is invalid\n");
+			return -EINVAL;
+		}
+
+		sof_ipc3_do_rx_work(cdev->sdev, ipc_msg, msg_buf);
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc_rx_message, SND_SOC_SOF_CLIENT);
+
 int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 				bool set)
 {
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 10571d1ea9a77..b6ccc2cd69e52 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -75,5 +75,6 @@ int sof_client_register_fw_state_handler(struct sof_client_dev *cdev,
 					 sof_client_fw_state_callback callback);
 void sof_client_unregister_fw_state_handler(struct sof_client_dev *cdev);
 enum sof_fw_state sof_client_get_fw_state(struct sof_client_dev *cdev);
+int sof_client_ipc_rx_message(struct sof_client_dev *cdev, void *ipc_msg, void *msg_buf);
 
 #endif /* __SOC_SOF_CLIENT_H */
-- 
2.41.0.162.gfafddb0af9-goog

