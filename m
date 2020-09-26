Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9D279816
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Sep 2020 11:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E257A1AA7;
	Sat, 26 Sep 2020 11:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E257A1AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601111223;
	bh=caQ8Mo3N+s4xBHl7hc8UCRy0oNPKFU8z/DO12GsTsKg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NPJsJYnG/Qimf1qOwmrXRlzphTdt79BC10wDatfY5kuUqel38BOspPT9nCEFKKp32
	 dCK9326BH0fIwqU6yEY8B02vF6U5Zj3W2kPZ7VM6Tin4UG29V+2k32bDZHzglpmfDv
	 DGPNz0ToPX1elqbCTplmWIXcjWK/kI/5KkFGTIj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D64AF8033D;
	Sat, 26 Sep 2020 11:00:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F243CF80340; Sat, 26 Sep 2020 10:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2955FF80332
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 10:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2955FF80332
IronPort-SDR: KhBwp17Bga3HC+m/7b1tGa4FNsUrbKhE7x1JUIN798+IkNkCuQ/mcjP3Yd3L6VSSHYTr+dvnTY
 rwPgN9GkD72g==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="149389376"
X-IronPort-AV: E=Sophos;i="5.77,305,1596524400"; d="scan'208";a="149389376"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2020 01:59:52 -0700
IronPort-SDR: ZYp5VHfq/6A7pmvA7vNYk7zDuqcMtPclX3KXPxpb52tb7r6I18qNEg2IeTkpGmn42/zCibn/eI
 hs25P+/lBjPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,305,1596524400"; d="scan'208";a="414198480"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2020 01:59:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v9 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Date: Sat, 26 Sep 2020 10:59:05 +0200
Message-Id: <20200926085910.21948-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926085910.21948-1-cezary.rojewski@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

Changes in v9:
- fixed newlines in sysfs as requested by Andy, left tags as no other
  changes done

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
 sound/soc/intel/catpt/core.h                  |  2 +
 sound/soc/intel/catpt/device.c                |  1 +
 sound/soc/intel/catpt/sysfs.c                 | 55 +++++++++++++++++++
 4 files changed, 74 insertions(+)
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
index a29b4c0232cb..88dc3fb6306f 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -15,6 +15,8 @@
 
 struct catpt_dev;
 
+extern const struct attribute_group *catpt_attr_groups[];
+
 void catpt_sram_init(struct resource *sram, u32 start, u32 size);
 void catpt_sram_free(struct resource *sram);
 struct resource *
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 0d2dd919de8d..390ffb203de0 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -342,6 +342,7 @@ static struct platform_driver catpt_acpi_driver = {
 		.name = "intel_catpt",
 		.acpi_match_table = catpt_ids,
 		.pm = &catpt_dev_pm,
+		.dev_groups = catpt_attr_groups,
 	},
 };
 module_platform_driver(catpt_acpi_driver);
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
new file mode 100644
index 000000000000..9579e233a15d
--- /dev/null
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -0,0 +1,55 @@
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
+static DEVICE_ATTR_RO(fw_version);
+
+static ssize_t fw_info_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", cdev->ipc.config.fw_info);
+}
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

