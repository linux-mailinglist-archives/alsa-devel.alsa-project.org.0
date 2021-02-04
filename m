Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1CE30FEC7
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:50:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD1F11696;
	Thu,  4 Feb 2021 21:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD1F11696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471848;
	bh=neYa6J9NY/EwoXcDAt7kNUCbNEws08vXq61eZ4+Jp68=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FygZ9mKa8fevGITU7YAijqflGLhbP/5l6N3iNJ1ou30YOwjTDnF7TaMKpVOxpb7e/
	 6HDrtu6WhuCP+uF9AxpsGUVrqs8xANff7CGPmE+Riew7GdnihAXIeWIq2467WjU8vy
	 7y5crs971TRvADXYzyOSMb7ghGNy3Nr8PDuG4PY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4019EF80139;
	Thu,  4 Feb 2021 21:49:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB7DCF8023E; Thu,  4 Feb 2021 21:49:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E321F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E321F80152
IronPort-SDR: BKp5myQu30aSLV2WRROgsCCjG+JnQAHv9fz9w7wG/USlikwMZgATZdjjAbXMCVQMW3PquMZCIN
 thSqmdGoTZSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168443574"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="168443574"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:48:55 -0800
IronPort-SDR: Mlz4acP/sp70etRccqwsQLR+OXYf78umqL18yE4tI/B7oG9pON8iurer2z4gMi8QyANlDFsh0p
 VYcxQapNE1Pw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="415504496"
Received: from zyi-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.188.47])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:48:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 1/2] soundwire: slave: introduce DMI quirks for HP Spectre
 x360 Convertible
Date: Thu,  4 Feb 2021 14:48:36 -0600
Message-Id: <20210204204837.27876-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
References: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

HP Spectre x360 Convertible devices expose invalid _ADR fields in the
DSDT, which prevents codec drivers from probing. A possible solution
is to override the DSDT, but that's just too painful for users.

This patch suggests a simple DMI-based quirk to remap the existing
invalid ADR information into valid ones.

BugLink: https://github.com/thesofproject/linux/issues/2700
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
---
 drivers/soundwire/slave.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 180f38bd003b..abdc1ae94e9c 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -2,6 +2,7 @@
 // Copyright(c) 2015-17 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/of.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
@@ -91,10 +92,44 @@ int sdw_slave_add(struct sdw_bus *bus,
 
 #if IS_ENABLED(CONFIG_ACPI)
 
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
 static bool find_slave(struct sdw_bus *bus,
 		       struct acpi_device *adev,
 		       struct sdw_slave_id *id)
 {
+	const struct dmi_system_id *dmi_id;
 	unsigned long long addr;
 	unsigned int link_id;
 	acpi_status status;
@@ -108,6 +143,21 @@ static bool find_slave(struct sdw_bus *bus,
 		return false;
 	}
 
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
 	/* Extract link id from ADR, Bit 51 to 48 (included) */
 	link_id = SDW_DISCO_LINK_ID(addr);
 
-- 
2.25.1

