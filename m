Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB726DDD0
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 16:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29F3116A1;
	Thu, 17 Sep 2020 16:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29F3116A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600352228;
	bh=fgGPOb5h12nxZuUB0ZkPdaT510cJbDGu2z8/D615tWg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KO+pnmitPCoHO1E8gWL2aKt+VjN8qfmqUaEHvv/A7hVSQcmJzWiJS3eeqaTK7t37x
	 zZ8NzHRXYw4hAaSPRgfMypV7y8PRxY/mV1gCL1bsOKPItQvtgnDLxudKrlBRsZl3wg
	 Kzl1AQqLnYS5ZhiBMrPPXk7CpbJnkZcSTiwf0NI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED53F8027C;
	Thu, 17 Sep 2020 16:13:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 146A4F802E7; Thu, 17 Sep 2020 16:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E655F8027C
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 16:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E655F8027C
IronPort-SDR: oR2x3xdGkw/zXfvFB5EMxGH9SlcepzI4vM/iCtoA5mGu3bdR/k9dIZ+4E2VMk2gaAXSfUeajU1
 3xjhzU5iKBMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="221251209"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="221251209"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 07:13:45 -0700
IronPort-SDR: hC2xT+WM1aRq5dCTdH+5lGmLn0bfGn0JfaXxD8V+L1VsuYbGNdDMciu2jrKrKzCVCdWPGAvBzp
 rt1uzs7P+VWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="452318099"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 17 Sep 2020 07:13:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Date: Thu, 17 Sep 2020 16:12:37 +0200
Message-Id: <20200917141242.9081-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917141242.9081-1-cezary.rojewski@intel.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

Add sysfs entries for displaying version of FW currently in use as well
as binary dump of entire version info, including build and log providers
hashes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v6:
- functions declaration and usage now part of this patch instead of
  being separated from it

Changes in v2:
- fixed size provided to memcpy() in fw_build_read() as reported by Mark

 sound/soc/intel/catpt/core.h   |  3 ++
 sound/soc/intel/catpt/device.c |  6 +++
 sound/soc/intel/catpt/fs.c     | 79 ++++++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 sound/soc/intel/catpt/fs.c

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index a29b4c0232cb..1f0f1ac92341 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -155,6 +155,9 @@ int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan);
 int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan);
 int catpt_coredump(struct catpt_dev *cdev);
 
+int catpt_sysfs_create(struct catpt_dev *cdev);
+void catpt_sysfs_remove(struct catpt_dev *cdev);
+
 #include <sound/memalloc.h>
 #include <uapi/sound/asound.h>
 
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 7c7ddbabaf55..e9b7c1f474e0 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -184,6 +184,10 @@ static int catpt_probe_components(struct catpt_dev *cdev)
 		goto board_err;
 	}
 
+	ret = catpt_sysfs_create(cdev);
+	if (ret)
+		goto board_err;
+
 	/* reflect actual ADSP state in pm_runtime */
 	pm_runtime_set_active(cdev->dev);
 
@@ -292,6 +296,8 @@ static int catpt_acpi_remove(struct platform_device *pdev)
 	catpt_sram_free(&cdev->iram);
 	catpt_sram_free(&cdev->dram);
 
+	catpt_sysfs_remove(cdev);
+
 	return 0;
 }
 
diff --git a/sound/soc/intel/catpt/fs.c b/sound/soc/intel/catpt/fs.c
new file mode 100644
index 000000000000..d73493687f4a
--- /dev/null
+++ b/sound/soc/intel/catpt/fs.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-pcm
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/pm_runtime.h>
+#include "core.h"
+
+static ssize_t fw_version_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dev);
+	struct catpt_fw_version version;
+	int ret;
+
+	pm_runtime_get_sync(cdev->dev);
+
+	ret = catpt_ipc_get_fw_version(cdev, &version);
+
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_put_autosuspend(cdev->dev);
+
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	return sprintf(buf, "%d.%d.%d.%d\n", version.type, version.major,
+		       version.minor, version.build);
+}
+
+static DEVICE_ATTR_RO(fw_version);
+
+static ssize_t fw_build_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(kobj_to_dev(kobj));
+	struct catpt_fw_version version;
+	int ret;
+
+	pm_runtime_get_sync(cdev->dev);
+
+	ret = catpt_ipc_get_fw_version(cdev, &version);
+
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_put_autosuspend(cdev->dev);
+
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	memcpy(buf, &version, sizeof(version));
+	return count;
+}
+
+static BIN_ATTR_RO(fw_build, sizeof(struct catpt_fw_version));
+
+int catpt_sysfs_create(struct catpt_dev *cdev)
+{
+	int ret;
+
+	ret = sysfs_create_file(&cdev->dev->kobj, &dev_attr_fw_version.attr);
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_bin_file(&cdev->dev->kobj, &bin_attr_fw_build);
+	if (ret) {
+		sysfs_remove_file(&cdev->dev->kobj, &dev_attr_fw_version.attr);
+		return ret;
+	}
+
+	return 0;
+}
+
+void catpt_sysfs_remove(struct catpt_dev *cdev)
+{
+	sysfs_remove_bin_file(&cdev->dev->kobj, &bin_attr_fw_build);
+	sysfs_remove_file(&cdev->dev->kobj, &dev_attr_fw_version.attr);
+}
-- 
2.17.1

