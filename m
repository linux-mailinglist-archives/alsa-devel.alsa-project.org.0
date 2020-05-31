Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F300E1E9D40
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 07:24:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7869B16F6;
	Mon,  1 Jun 2020 07:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7869B16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590989085;
	bh=onDP2VWtlrdI7cT2IZP4s1k3qa5CQ9+73LwdR1tsGhY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wa7H4VhAqbhj7cQbtp3jP8bZS1MikLNb5mr51rJcqQN0q1YIfLwUsrN6AJrJ+9mkF
	 WOjiygNMShOL+kDpOfsCy+d8Zwa4CYFDx1LAy48PJrEB6167TdMQXWWo7OIn9EVA12
	 PylHX5r9bvGWRMAxtOixlsDq4f1Yqm6vEtB3FD2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78708F8013D;
	Mon,  1 Jun 2020 07:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B65F801ED; Mon,  1 Jun 2020 07:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB0DAF80159
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 07:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB0DAF80159
IronPort-SDR: efuYoTva11W35o7xdQ1WPjW/WJVVQIrq7zHZeKh3UlcZ46Z5mMSWflPxnlIUHRqEsxXK0BW847
 AKsxYWffoYgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 22:22:47 -0700
IronPort-SDR: x/VS843ZPMV31YMBY+LvHL3NIKbKwx5UPVJLKGjiapJBCYhOgsdiBRyipqp8yFaHWCnxN5awoU
 t0GDNHNIY0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="470196419"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 31 May 2020 22:22:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: clarify SPDX use of GPL-2.0
Date: Mon,  1 Jun 2020 01:28:07 +0800
Message-Id: <20200531172807.27042-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Change SPDX from GPL-2.0 to GPL-2.0-only for Intel-contributed
code. This was explicit before the transition to SPDX and lost in
translation.

No change to the dual-license parts, the only clarification is to the
GPL-2.0 term.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c                 | 2 +-
 drivers/soundwire/bus.h                 | 2 +-
 drivers/soundwire/bus_type.c            | 2 +-
 drivers/soundwire/cadence_master.c      | 2 +-
 drivers/soundwire/cadence_master.h      | 2 +-
 drivers/soundwire/intel.c               | 2 +-
 drivers/soundwire/intel.h               | 2 +-
 drivers/soundwire/intel_init.c          | 2 +-
 drivers/soundwire/mipi_disco.c          | 2 +-
 drivers/soundwire/slave.c               | 2 +-
 drivers/soundwire/stream.c              | 2 +-
 include/linux/soundwire/sdw.h           | 2 +-
 include/linux/soundwire/sdw_intel.h     | 2 +-
 include/linux/soundwire/sdw_registers.h | 2 +-
 include/linux/soundwire/sdw_type.h      | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 24ba77226376..2289c2ac8c5a 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 // Copyright(c) 2015-17 Intel Corporation.
 
 #include <linux/acpi.h>
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 82484f741168..697a5b371568 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SDW_BUS_H
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index de9a671802b8..95a87d4e26c2 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2015-17 Intel Corporation.
 
 #include <linux/module.h>
diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 9ea87538b9ef..fe238645ed2c 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 // Copyright(c) 2015-17 Intel Corporation.
 
 /*
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index b410656f8194..ea606b4fba76 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /* Copyright(c) 2015-17 Intel Corporation. */
 #include <sound/soc.h>
 
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 4cfdd074e310..1eda63f488f5 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 // Copyright(c) 2015-17 Intel Corporation.
 
 /*
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 38b7c125fb10..7b4af8018e1a 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SDW_INTEL_LOCAL_H
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index d5d42795a48f..947345d5c960 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 // Copyright(c) 2015-17 Intel Corporation.
 
 /*
diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 4ae62b452b8c..dbd8fc6f4dad 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 // Copyright(c) 2015-17 Intel Corporation.
 
 /*
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 0839445ee07b..8e8b62dff51c 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 // Copyright(c) 2015-17 Intel Corporation.
 
 #include <linux/acpi.h>
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a9a72574b34a..296cea48bdcc 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 // Copyright(c) 2015-18 Intel Corporation.
 
 /*
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 9c27a32df9bb..1fde044f5f3e 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SOUNDWIRE_H
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 979b41b5dcb4..96a8633339a1 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SDW_INTEL_H
diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index a686f7988156..06d895168b32 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SDW_REGISTERS_H
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index 52eb66cd11bc..25ab91f5c6be 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright(c) 2015-17 Intel Corporation. */
 
 #ifndef __SOUNDWIRE_TYPES_H
-- 
2.17.1

