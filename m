Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B284CAAC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 13:25:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD62582A;
	Wed,  7 Feb 2024 13:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD62582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707308730;
	bh=WJiPnGQnpL8D5hbUv1rOxOUv6OpRKLHCtAzNkuXyfhw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m9028QnP0VPB1c6z9W67suFn25XicP6WmDY5nn8uY2Mmpcb4UDFqLg6Y62AGNdgm3
	 1HXuJRWzrWVBOXuY2Fy6zVFq4uL4kWkmeI3TX+Wl3wdtxuFFNFWdf42PXDEQGt/Y82
	 v6upDMyIEhesf3yo0Pb8GyrHmjdXCVGpPaqAbY9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63D91F80589; Wed,  7 Feb 2024 13:24:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 132CEF805A0;
	Wed,  7 Feb 2024 13:24:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE1E2F801EB; Wed,  7 Feb 2024 13:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA112F800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 13:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA112F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GwgYgwJA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707308687; x=1738844687;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WJiPnGQnpL8D5hbUv1rOxOUv6OpRKLHCtAzNkuXyfhw=;
  b=GwgYgwJA1t3zRW0bfwUZ3dmIINEu4zpm+K88ktNWOnOYh0wL3fri1Stk
   llGF4e+WYWPiDRQylWuutLXbn1Yne2RGXHLvtTLoxH42dNHI53VdINTlv
   DU/u4O/KqnHRi31TN2NVb6670YeiIUdVZoksawL4PuDKcpkQq07bMCDPv
   4tQ9C+WLbDkOBWPL6VBZ0k8RGwhJqnDmxpZ2GU7rMmvGntfpziuI0uTE4
   M3dXhrghwUY8ZLXSKI9U+WbD3yrp/AaspEBRw9X0cz7uHLR49G6CCZAf7
   nv05RX2H+7bRs9Pnky9kH1W+Mns5OTtxUINx9qM1ShzqnSQ9u2MSqJ0f9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436110929"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400";
   d="scan'208";a="436110929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 04:24:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400";
   d="scan'208";a="38748625"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa001.jf.intel.com with ESMTP; 07 Feb 2024 04:24:39 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Expose FW version with sysfs
Date: Wed,  7 Feb 2024 13:25:09 +0100
Message-Id: <20240207122509.2222214-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AXPSOZ3NGTVHOWNWMC4GGAIJNNTMU6NM
X-Message-ID-Hash: AXPSOZ3NGTVHOWNWMC4GGAIJNNTMU6NM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXPSOZ3NGTVHOWNWMC4GGAIJNNTMU6NM/>
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
index 0000000000000..abfdecd85f204
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-avs
@@ -0,0 +1,8 @@
+What:		/sys/devices/pci0000:00/<dev>/fw_version
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

