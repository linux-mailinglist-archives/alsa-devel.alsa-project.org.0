Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54DF3296B3
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 08:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74FCB1676;
	Tue,  2 Mar 2021 08:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74FCB1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614671622;
	bh=eEb8IJ2sy/nTaPUfMObQX3rz99RgMJSsoREzSyVgH8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UH8zo2DLvhOT8sZLEmlcxeI6hvB2nhN13QcL50ktTHT/eH9JrBc3lqgsTZUp+S/tx
	 HKnVOpMWHOyukmcgNcS4dzK14BNn5naP1B1Ckt+mt+eHsT6n1c+Hmg1VjPVrbqLcal
	 /NUDqRATJlWx1U9BdZ0n/LV7WYC0qw8VEaVGLmNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FAD3F80277;
	Tue,  2 Mar 2021 08:51:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F1A5F80277; Tue,  2 Mar 2021 08:51:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0241F80269
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 08:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0241F80269
IronPort-SDR: 4e/HHfZFE37i4A2qNDsgYIb8yP2LTJwNH2auFmQIHBdPOUj0ezmVpJjYZHKC23LaniPXq7dS0y
 7R2muxIgsa2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186782242"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="186782242"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 23:51:15 -0800
IronPort-SDR: byUiS9rIG5lwheUs1+zg2/hXGgKivn3c6WOCps3Zt4idWWDPolVmperYxRX50vogzV7Q4B7B8l
 CQ0s8Ev5U0GA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406597597"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 23:51:11 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/3] soundwire: Intel: introduce DMI quirks for HP Spectre
 x360 Convertible
Date: Tue,  2 Mar 2021 15:51:04 +0800
Message-Id: <20210302075105.11515-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
References: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

HP Spectre x360 Convertible devices expose invalid _ADR fields in the
DSDT, which prevents codec drivers from probing. A possible solution
is to override the DSDT, but that's just too painful for users.

This patch suggests a simple DMI-based quirk to remap the existing
invalid ADR information into valid ones.

BugLink: https://github.com/thesofproject/linux/issues/2700
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/soundwire/Makefile     |  2 +-
 drivers/soundwire/bus.h        |  2 ++
 drivers/soundwire/dmi-quirks.c | 66 ++++++++++++++++++++++++++++++++++
 drivers/soundwire/intel.c      |  1 +
 4 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/dmi-quirks.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index bf1e250d50dd..986776787b9e 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -20,7 +20,7 @@ soundwire-cadence-y := cadence_master.o
 obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
 
 #Intel driver
-soundwire-intel-y :=	intel.o intel_init.o
+soundwire-intel-y :=	intel.o intel_init.o dmi-quirks.o
 obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
 
 #Qualcomm driver
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 2e049d39c6e5..40354469860a 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -7,6 +7,8 @@
 #define DEFAULT_BANK_SWITCH_TIMEOUT 3000
 #define DEFAULT_PROBE_TIMEOUT       2000
 
+u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr);
+
 #if IS_ENABLED(CONFIG_ACPI)
 int sdw_acpi_find_slaves(struct sdw_bus *bus);
 #else
diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
new file mode 100644
index 000000000000..249e476e49ea
--- /dev/null
+++ b/drivers/soundwire/dmi-quirks.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2021 Intel Corporation.
+
+/*
+ * Soundwire DMI quirks
+ */
+
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/soundwire/sdw.h>
+#include "bus.h"
+
+struct adr_remap {
+	u64 adr;
+	u64 remapped_adr;
+};
+
+/*
+ * HP Spectre 360 Convertible devices do not expose the correct _ADR
+ * in the DSDT.
+ * Remap the bad _ADR values to the ones reported by hardware
+ */
+static const struct adr_remap hp_spectre_360[] = {
+	{
+		0x000010025D070100,
+		0x000020025D071100
+	},
+	{
+		0x000110025d070100,
+		0x000120025D130800
+	},
+	{}
+};
+
+static const struct dmi_system_id adr_remap_quirk_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible"),
+		},
+		.driver_data = (void *)hp_spectre_360,
+	},
+	{}
+};
+
+u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr)
+{
+	const struct dmi_system_id *dmi_id;
+
+	/* check if any address remap quirk applies */
+	dmi_id = dmi_first_match(adr_remap_quirk_table);
+	if (dmi_id) {
+		struct adr_remap *map = dmi_id->driver_data;
+
+		for (map = dmi_id->driver_data; map->adr; map++) {
+			if (map->adr == addr) {
+				dev_dbg(bus->dev, "remapped _ADR 0x%llx as 0x%llx\n",
+					addr, map->remapped_adr);
+				addr = map->remapped_adr;
+				break;
+			}
+		}
+	}
+
+	return addr;
+}
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index a2d5cdaa9998..a401e270a47f 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1302,6 +1302,7 @@ static int intel_prop_read(struct sdw_bus *bus)
 
 static struct sdw_master_ops sdw_intel_ops = {
 	.read_prop = sdw_master_read_prop,
+	.override_adr = sdw_dmi_override_adr,
 	.xfer_msg = cdns_xfer_msg,
 	.xfer_msg_defer = cdns_xfer_msg_defer,
 	.reset_page_addr = cdns_reset_page_addr,
-- 
2.17.1

