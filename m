Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D923EC1E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:14:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 303AE15F9;
	Fri,  7 Aug 2020 13:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 303AE15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596798842;
	bh=nT4O4Qvdv4nQ7mxemsLZ8XsRXRVeP0VZVkcZp0ROgKM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tXzsaa21tR2MfD0dwUxyhsW+SAHmvE3EWa8RVfKPMaRzQ9pBz8ILlaiM0wLMEL6RK
	 hQ8UDYVDjUyxf+tWItdTEQaUxOhHZsugmi0fc9X7SFMnnoooSGBI7qw3eZIMlYPU7X
	 9OAeQTkwl+ejjVKUkbaDknvGNE0kUPCOSivlpJ3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2147F80321;
	Fri,  7 Aug 2020 13:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40E10F80337; Fri,  7 Aug 2020 13:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31E23F80321
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E23F80321
IronPort-SDR: EqeqIwF9JyuJzaIdXkk88g9ZVYNvbWBLJGt4lGcCKViJYRiiBSk/v3OnpQRa90ZSoAdVUYescY
 b+wz3uyJCKlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="214585518"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="214585518"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 04:07:34 -0700
IronPort-SDR: 4z5ciHdGL02p5IDkI0tazfJ9PRiyGUUTZJ1ah+JbzurenP+dWnoAyrb3jUpf0Jh+vCejrIHhYj
 oX0NmfeOAKCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="333514034"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 04:07:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/13] ASoC: Intel: catpt: Simple sysfs attributes
Date: Fri,  7 Aug 2020 13:06:44 +0200
Message-Id: <20200807110649.17114-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807110649.17114-1-cezary.rojewski@intel.com>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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
 sound/soc/intel/catpt/fs.c | 79 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 sound/soc/intel/catpt/fs.c

diff --git a/sound/soc/intel/catpt/fs.c b/sound/soc/intel/catpt/fs.c
new file mode 100644
index 000000000000..5102641b57f1
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
+	memcpy(buf, &version, count);
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

