Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2236E9D9
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 19:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ECC516C1;
	Fri, 19 Jul 2019 19:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ECC516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563556178;
	bh=HEXatngIdU6Sdja2iLg+492CxNn6GNeVU9Z/Rfn7zn4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDez2qHO59OdXVm28EkyBM1Rs+UtcuadcLh8mprLzbfv0GGPAhWfPErQG0DZ1dvgk
	 DzCOl6/sqpVR6vF3RRBSk6euyPmNOm0pUHpoG+LpVR2Pl6miO6tAmt3SNkpWPBrHNv
	 8lS8l5PM0N9qlRPt04NdkaWeuoH65H/ED4dxFfLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42852F80368;
	Fri, 19 Jul 2019 19:06:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9723DF803D0; Fri, 19 Jul 2019 19:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89153F8015B
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 19:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89153F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 10:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="191982217"
Received: from cvrozas-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.190.38])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2019 10:06:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 12:06:06 -0500
Message-Id: <20190719170610.17610-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
References: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 2/6] ALSA: hda: move parts of NHLT code to new
	module
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Move parts of the code outside of the Skylake driver to help detect
the presence of DMICs (which are not supported by the HDaudio legacy
driver).

No functionality change, only indentation and checkpatch fixes, and
making sure that the code compiles without ACPI

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/intel-nhlt.h | 41 ++++++++++++----
 sound/hda/Kconfig          |  3 ++
 sound/hda/Makefile         |  3 ++
 sound/hda/intel-nhlt.c     | 98 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 137 insertions(+), 8 deletions(-)
 create mode 100644 sound/hda/intel-nhlt.c

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index f85fbf9c7ce4..857922f03931 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -1,18 +1,17 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  skl-nhlt.h - Intel HDA Platform NHLT header
+ *  intel-nhlt.h - Intel HDA Platform NHLT header
  *
- *  Copyright (C) 2015 Intel Corp
- *  Author: Sanjiv Kumar <sanjiv.kumar@intel.com>
- *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- *
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *  Copyright (c) 2015-2019 Intel Corporation
  */
-#ifndef __SKL_NHLT_H__
-#define __SKL_NHLT_H__
+
+#ifndef __INTEL_NHLT_H__
+#define __INTEL_NHLT_H__
 
 #include <linux/acpi.h>
 
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
+
 struct wav_fmt {
 	u16 fmt_tag;
 	u16 channels;
@@ -116,4 +115,30 @@ enum {
 	NHLT_MIC_ARRAY_VENDOR_DEFINED = 0xf,
 };
 
+struct nhlt_acpi_table *intel_nhlt_init(struct device *dev);
+
+void intel_nhlt_free(struct nhlt_acpi_table *addr);
+
+int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt);
+
+#else
+
+struct nhlt_acpi_table;
+
+static inline struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
+{
+	return NULL;
+}
+
+static inline void intel_nhlt_free(struct nhlt_acpi_table *addr)
+{
+}
+
+static inline int intel_nhlt_get_dmic_geo(struct device *dev,
+					  struct nhlt_acpi_table *nhlt)
+{
+	return 0;
+}
+#endif
+
 #endif
diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index f6feced15f17..c20145552cc3 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -29,3 +29,6 @@ config SND_HDA_PREALLOC_SIZE
 
 	  Note that the pre-allocation size can be changed dynamically
 	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
+
+config SND_INTEL_NHLT
+	tristate
diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index 2160202e2dc1..8560f6ef1b19 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -13,3 +13,6 @@ obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
 
 #extended hda
 obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
+
+snd-intel-nhlt-objs := intel-nhlt.o
+obj-$(CONFIG_SND_INTEL_NHLT) += snd-intel-nhlt.o
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
new file mode 100644
index 000000000000..b9d00c1b25d5
--- /dev/null
+++ b/sound/hda/intel-nhlt.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2015-2019 Intel Corporation
+
+#include <linux/acpi.h>
+#include <sound/intel-nhlt.h>
+
+#define NHLT_ACPI_HEADER_SIG	"NHLT"
+
+/* Unique identification for getting NHLT blobs */
+static guid_t osc_guid =
+	GUID_INIT(0xA69F886E, 0x6CEB, 0x4594,
+		  0xA4, 0x1F, 0x7B, 0x5D, 0xCE, 0x24, 0xC5, 0x53);
+
+struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
+{
+	acpi_handle handle;
+	union acpi_object *obj;
+	struct nhlt_resource_desc  *nhlt_ptr = NULL;
+	struct nhlt_acpi_table *nhlt_table = NULL;
+
+	handle = ACPI_HANDLE(dev);
+	if (!handle) {
+		dev_err(dev, "Didn't find ACPI_HANDLE\n");
+		return NULL;
+	}
+
+	obj = acpi_evaluate_dsm(handle, &osc_guid, 1, 1, NULL);
+	if (obj && obj->type == ACPI_TYPE_BUFFER) {
+		nhlt_ptr = (struct nhlt_resource_desc  *)obj->buffer.pointer;
+		if (nhlt_ptr->length)
+			nhlt_table = (struct nhlt_acpi_table *)
+				memremap(nhlt_ptr->min_addr, nhlt_ptr->length,
+					 MEMREMAP_WB);
+		ACPI_FREE(obj);
+		if (nhlt_table &&
+		    (strncmp(nhlt_table->header.signature,
+			     NHLT_ACPI_HEADER_SIG,
+			     strlen(NHLT_ACPI_HEADER_SIG)) != 0)) {
+			memunmap(nhlt_table);
+			dev_err(dev, "NHLT ACPI header signature incorrect\n");
+			return NULL;
+		}
+		return nhlt_table;
+	}
+
+	dev_dbg(dev, "No NHLT table found\n");
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(intel_nhlt_init);
+
+void intel_nhlt_free(struct nhlt_acpi_table *nhlt)
+{
+	memunmap((void *)nhlt);
+}
+EXPORT_SYMBOL_GPL(intel_nhlt_free);
+
+int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
+{
+	struct nhlt_endpoint *epnt;
+	struct nhlt_dmic_array_config *cfg;
+	unsigned int dmic_geo = 0;
+	u8 j;
+
+	if (!nhlt)
+		return 0;
+
+	epnt = (struct nhlt_endpoint *)nhlt->desc;
+
+	for (j = 0; j < nhlt->endpoint_count; j++) {
+		if (epnt->linktype == NHLT_LINK_DMIC) {
+			cfg = (struct nhlt_dmic_array_config  *)
+					(epnt->config.caps);
+			switch (cfg->array_type) {
+			case NHLT_MIC_ARRAY_2CH_SMALL:
+			case NHLT_MIC_ARRAY_2CH_BIG:
+				dmic_geo |= MIC_ARRAY_2CH;
+				break;
+
+			case NHLT_MIC_ARRAY_4CH_1ST_GEOM:
+			case NHLT_MIC_ARRAY_4CH_L_SHAPED:
+			case NHLT_MIC_ARRAY_4CH_2ND_GEOM:
+				dmic_geo |= MIC_ARRAY_4CH;
+				break;
+
+			default:
+				dev_warn(dev, "undefined DMIC array_type 0x%0x\n",
+					 cfg->array_type);
+			}
+		}
+		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
+	}
+
+	return dmic_geo;
+}
+EXPORT_SYMBOL_GPL(intel_nhlt_get_dmic_geo);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel NHLT driver");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
