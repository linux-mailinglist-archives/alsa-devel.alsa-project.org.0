Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1BE26A9F1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 18:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4AB1687;
	Tue, 15 Sep 2020 18:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4AB1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600187861;
	bh=XIKmNWkm03rqGObd1hOuirLFemUlTb4dQBkA0FIhKvU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S7DhCr6R3tU8qmdhIuob0tsXSncEbbJvToW9tObHNfrPDYHUWx7Nb5H3rVZK+ucys
	 ac/Tzrf0kH37LKc8jIe4yhOC2uY/C3kJhYfCy/gwy/8MPJ1PVxKL+NQ36TGJ1Xu5Wt
	 rVNy5cgK/sqsP0cTxjDWinDqCZ6N2fE5PJ5I3e4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FCE3F80347;
	Tue, 15 Sep 2020 18:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41A86F80345; Tue, 15 Sep 2020 18:31:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E43AF80339
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 18:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E43AF80339
IronPort-SDR: OiJyRRsbTEW7CXhviyIteag9MzOeEuufny6Kpv4GiQVgY3brui0I07mXoxrVvm1EjZ3hzD2Xg0
 UAace6aCT+xw==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="177366004"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="177366004"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 09:30:56 -0700
IronPort-SDR: trdvL4J2RXfEduxahZbUZwnAX/HcT92faXfTSn9kEKGhgfWmx/RHNoBar38XUB55SQvAW+pyL7
 iqCwKNC+8YJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="302218829"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 15 Sep 2020 09:30:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 08/13] ASoC: Intel: catpt: Simple sysfs attributes
Date: Tue, 15 Sep 2020 18:29:39 +0200
Message-Id: <20200915162944.16241-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915162944.16241-1-cezary.rojewski@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
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

Changes in v2:
- fixed size provided to memcpy() in fw_build_read() as reported by Mark

 sound/soc/intel/catpt/fs.c | 79 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 sound/soc/intel/catpt/fs.c

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

