Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6760484F1C7
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 09:55:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EDE4857;
	Fri,  9 Feb 2024 09:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EDE4857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707468943;
	bh=nBOwufcJKX3rOqeiUYDP5rWcbiNGvqPqiRENy/6jTDM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ucEwg5SPY6WdwXI+IeDb2ju2YTwdQ4J59Q8YbzZoU/NkoygGqvLAP1gC5bQZrlJYZ
	 dhAULB1q0+eMazMjEMCbg95/7EhA5X72E2lujazO7NuAZ+inYiZPs+mdasu3iM0OY/
	 /NXGlFyqULSp4qsyHjdC1pDEjTeqk1N+RaBIiH6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8536F8057B; Fri,  9 Feb 2024 09:55:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5368CF80579;
	Fri,  9 Feb 2024 09:55:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6308F801EB; Fri,  9 Feb 2024 09:52:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91F1DF8016E
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 09:52:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F1DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bQGbmpMG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707468760; x=1739004760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nBOwufcJKX3rOqeiUYDP5rWcbiNGvqPqiRENy/6jTDM=;
  b=bQGbmpMG9/F6+NohnlS+GpatwbYqc1E4kiYrAUvN2ju+TLT8aeKvdVYr
   l2shB5xXNYw5K6GuQV48WLisn9y9/orAaCleZmuLW1v9M2FlLzxE3gmvO
   PHocA3xOtNN22beaMmNjXaWrjAJtkKnfYLW3HD2smgCoo6BB5nKYs7/gv
   uQK9Z6SoT4JZ9VoTLn2sE0jOmSXBChQyT5oagu6c5m6l72XvhzYxFNcXD
   15ZbH7nOc0TUB2oEsPngFmuocCo6KQXlrAMuCoK2lebAUSl9+aOqUnb7j
   ZzcURHaD25VKDVLHRdEN760mTtPg1EIkf8GqSXsO6BNknoo0QS/oO2//X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18808770"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400";
   d="scan'208";a="18808770"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:52:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400";
   d="scan'208";a="2196047"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2024 00:52:32 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2] ASoC: Intel: avs: Expose FW version with sysfs
Date: Fri,  9 Feb 2024 09:52:56 +0100
Message-Id: <20240209085256.121261-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HI4GXOH73KOU7CVSBEEQ33W66XJVDCZS
X-Message-ID-Hash: HI4GXOH73KOU7CVSBEEQ33W66XJVDCZS
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HI4GXOH73KOU7CVSBEEQ33W66XJVDCZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Add functionality to read version of loaded FW from sysfs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

Changes in v2:
 - Adjust path in Documentation to correct one

---
 .../ABI/testing/sysfs-bus-pci-devices-avs     |  8 +++++
 sound/soc/intel/avs/Makefile                  |  3 +-
 sound/soc/intel/avs/avs.h                     |  4 +++
 sound/soc/intel/avs/core.c                    |  1 +
 sound/soc/intel/avs/sysfs.c                   | 35 +++++++++++++++++++
 5 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-avs
 create mode 100644 sound/soc/intel/avs/sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-avs b/Documentation/ABI/testing/sysfs-bus-pci-devices-avs
new file mode 100644
index 0000000000000..ebff3fa12055d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-avs
@@ -0,0 +1,8 @@
+What:		/sys/devices/pci0000:00/<dev>/avs/fw_version
+Date:		February 2024
+Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
+Description:
+		Version of AudioDSP firmware ASoC avs driver is communicating
+		with.
+
+		Format: %d.%d.%d.%d, type:major:minor:build.
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 460ee6599daf0..a3fad926d0fb0 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
-		    topology.o path.o pcm.o board_selection.o control.o
+		    topology.o path.o pcm.o board_selection.o control.o \
+		    sysfs.o
 snd-soc-avs-objs += cldma.o
 snd-soc-avs-objs += skl.o apl.o
 
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index d694e08e44e18..69c912feb8a7e 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -392,4 +392,8 @@ static inline void avs_debugfs_init(struct avs_dev *adev) { }
 static inline void avs_debugfs_exit(struct avs_dev *adev) { }
 #endif
 
+/* Filesystems integration */
+
+extern const struct attribute_group *avs_attr_groups[];
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index db78eb2f01080..273a902168562 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -776,6 +776,7 @@ static struct pci_driver avs_pci_driver = {
 	.probe = avs_pci_probe,
 	.remove = avs_pci_remove,
 	.shutdown = avs_pci_shutdown,
+	.dev_groups = avs_attr_groups,
 	.driver = {
 		.pm = &avs_dev_pm,
 	},
diff --git a/sound/soc/intel/avs/sysfs.c b/sound/soc/intel/avs/sysfs.c
new file mode 100644
index 0000000000000..cce21636fbc02
--- /dev/null
+++ b/sound/soc/intel/avs/sysfs.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/sysfs.h>
+#include "avs.h"
+
+static ssize_t fw_version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct avs_dev *adev = to_avs_dev(dev);
+	struct avs_fw_version *fw_version = &adev->fw_cfg.fw_version;
+
+	return sysfs_emit(buf, "%d.%d.%d.%d\n", fw_version->major, fw_version->minor,
+			  fw_version->hotfix, fw_version->build);
+}
+static DEVICE_ATTR_RO(fw_version);
+
+static struct attribute *avs_fw_attrs[] = {
+	&dev_attr_fw_version.attr,
+	NULL
+};
+
+static const struct attribute_group avs_attr_group = {
+	.name = "avs",
+	.attrs = avs_fw_attrs,
+};
+
+const struct attribute_group *avs_attr_groups[] = {
+	&avs_attr_group,
+	NULL
+};
-- 
2.34.1

