Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B0275805
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 14:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BADE516B3;
	Wed, 23 Sep 2020 14:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BADE516B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600864403;
	bh=DRas24z59DjblDBLS3ZJ82b4enyzadn5VUGQSf2VY4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQppdvP4IdaQgwWX70SGm3CsuyXkOgiUYXjDkplEyKNWR5odDfyRNEhSDgCSM+N0p
	 ZO3trqx4vYrJgaAHpuGl0CBAjDF4SmJij4NsJ9BbmMK8JHv4U6qooEUrDfb0bBKtjC
	 wZAGYyzH+5sczlOej2BlkSCA+iEcW0GkPNGsN+jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB79FF80337;
	Wed, 23 Sep 2020 14:26:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15B01F80341; Wed, 23 Sep 2020 14:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB47DF80337
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 14:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB47DF80337
IronPort-SDR: 2ptEtEqCKOYkSXvG4D3VMIBtVxx/gx1wTrKjxtHjG4zO1bl8TNqx9LkCBz/+cxiYbBVD9z4xIr
 hEaLZ92wfAAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="160948249"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="160948249"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 05:26:31 -0700
IronPort-SDR: 6/DoZbGZnGGor5dqxFtZPvuY+Odo/AbA/jh5oxhiW6IZ5HE5VtKXh80DKreUMa2wWRO8dqywDh
 KNCc0mJhDKmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="347338264"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2020 05:26:27 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v8 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Date: Wed, 23 Sep 2020 14:25:03 +0200
Message-Id: <20200923122508.3360-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923122508.3360-1-cezary.rojewski@intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
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
as dumping full FW information including build and log-providers hashes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v7:
- fixed licence header for fs.c
- renamed fs.c to sysfs.c to better match its purpose
- added documentation within Documentation/ABI/testing for entries
  exposed by catpt
- bin_attribute fw_build replaced by attribute fw_info:
  fw_info contains full FW information and after successful handshake,
  it's always available (stored in driver data) so no need to invoke
  GET_FW_VERSION IPC again, just dump the stored information
- rather than manually creating and removing sysfs files, now makes use
  of dev_groups member of struct device_driver 

Changes in v6:
- functions declaration and usage now part of this patch instead of
  being separated from it

Changes in v2:
- fixed size provided to memcpy() in fw_build_read() as reported by Mark

 .../ABI/testing/sysfs-bus-pci-devices-catpt   | 16 ++++++
 sound/soc/intel/catpt/core.h                  |  1 +
 sound/soc/intel/catpt/device.c                |  1 +
 sound/soc/intel/catpt/sysfs.c                 | 57 +++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-catpt
 create mode 100644 sound/soc/intel/catpt/sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-catpt b/Documentation/ABI/testing/sysfs-bus-pci-devices-catpt
new file mode 100644
index 000000000000..8a200f4eefbd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-catpt
@@ -0,0 +1,16 @@
+What:		/sys/devices/pci0000:00/<dev>/fw_version
+Date:		September 2020
+Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
+Description:
+		Version of AudioDSP firmware ASoC catpt driver is
+		communicating with.
+		Format: %d.%d.%d.%d, type:major:minor:build.
+
+What:		/sys/devices/pci0000:00/<dev>/fw_info
+Date:		September 2020
+Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
+Description:
+		Detailed AudioDSP firmware build information including
+		build hash and log-providers hash. This information is
+		obtained during initial handshake with firmware.
+		Format: %s.
diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index a29b4c0232cb..19eda125ee59 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -14,6 +14,7 @@
 #include "registers.h"
 
 struct catpt_dev;
+extern const struct attribute_group *catpt_attr_groups[];
 
 void catpt_sram_init(struct resource *sram, u32 start, u32 size);
 void catpt_sram_free(struct resource *sram);
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index c02d46e5bc81..2d53efa656b1 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -338,6 +338,7 @@ static struct platform_driver catpt_acpi_driver = {
 		.name = "intel_catpt",
 		.acpi_match_table = catpt_ids,
 		.pm = &catpt_dev_pm,
+		.dev_groups = catpt_attr_groups,
 	},
 };
 module_platform_driver(catpt_acpi_driver);
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
new file mode 100644
index 000000000000..f38562071a04
--- /dev/null
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+static ssize_t fw_info_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", cdev->ipc.config.fw_info);
+}
+
+static DEVICE_ATTR_RO(fw_info);
+
+static struct attribute *catpt_attrs[] = {
+	&dev_attr_fw_version.attr,
+	&dev_attr_fw_info.attr,
+	NULL
+};
+
+static const struct attribute_group catpt_attr_group = {
+	.attrs = catpt_attrs,
+};
+
+const struct attribute_group *catpt_attr_groups[] = {
+	&catpt_attr_group,
+	NULL
+};
-- 
2.17.1

