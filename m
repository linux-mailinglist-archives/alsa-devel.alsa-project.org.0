Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32C28E01
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 01:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 793BB168D;
	Fri, 24 May 2019 01:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 793BB168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558655053;
	bh=HBufRHYMldX1wZC4DwNjj6W6hdlE+4smlq8ClPTh9+A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qEMHzgGyAmCdivOeWqpNkqHhbclGLnhS5Q9zm+3qhF0azPrSubE5yHijxJXwjwBvG
	 Mp0O0HKs16Ci19vdGhsF8oVaB0iUF9huitOwRXjTrzsG0M5QBLZGW72CY0YJJj7MYq
	 Teps5XXuvn9sdP+ilB6MkkUih2vdrackmft8RnoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF706F89732;
	Fri, 24 May 2019 01:40:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A852F89728; Fri, 24 May 2019 01:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D018FF8079B
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 01:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D018FF8079B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 16:40:35 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.128.35])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 16:40:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 23 May 2019 18:39:48 -0500
Message-Id: <20190523233951.31122-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [RFC PATCH 3/6] ASoC: Intel: common: move parts of
	NHLT code to new module
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

No functionality change, only indentation and checkpatch fixes, and making sure that the code compiles without ACPI

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig             |  3 +
 sound/soc/intel/common/Makefile     |  3 +
 sound/soc/intel/common/intel-nhlt.c | 98 +++++++++++++++++++++++++++++
 sound/soc/intel/common/intel-nhlt.h | 28 +++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 sound/soc/intel/common/intel-nhlt.c

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index b089ed3bf77f..71f19b73eed7 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -205,6 +205,7 @@ config SND_SOC_INTEL_SKYLAKE_COMMON
 	select SND_SOC_INTEL_SST
 	select SND_SOC_HDAC_HDA if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
 	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_SOC_INTEL_NHLT
 	help
 	  If you have a Intel Skylake/Broxton/ApolloLake/KabyLake/
 	  GeminiLake or CannonLake platform with the DSP enabled in the BIOS
@@ -224,6 +225,8 @@ config SND_SOC_ACPI_INTEL_MATCH
 
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
+config SND_SOC_INTEL_NHLT
+	tristate
 
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 56c81e20b5bf..4a5d2e4c28e4 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -10,7 +10,10 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-cnl-match.o soc-acpi-intel-icl-match.o \
 	soc-acpi-intel-hda-match.o
 
+snd-soc-intel-nhlt-objs := intel-nhlt.o
+
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_INTEL_SST_ACPI) += snd-soc-sst-acpi.o
 obj-$(CONFIG_SND_SOC_INTEL_SST_FIRMWARE) += snd-soc-sst-firmware.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
+obj-$(CONFIG_SND_SOC_INTEL_NHLT) += snd-soc-intel-nhlt.o
diff --git a/sound/soc/intel/common/intel-nhlt.c b/sound/soc/intel/common/intel-nhlt.c
new file mode 100644
index 000000000000..d93ecc32d996
--- /dev/null
+++ b/sound/soc/intel/common/intel-nhlt.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2015-2019 Intel Corporation
+
+#include <linux/acpi.h>
+#include "intel-nhlt.h"
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
diff --git a/sound/soc/intel/common/intel-nhlt.h b/sound/soc/intel/common/intel-nhlt.h
index 116534e7b3c5..125e47ae9a3c 100644
--- a/sound/soc/intel/common/intel-nhlt.h
+++ b/sound/soc/intel/common/intel-nhlt.h
@@ -20,6 +20,8 @@
 #ifndef __SKL_NHLT_H__
 #define __SKL_NHLT_H__
 
+#if IS_ENABLED(CONFIG_ACPI)
+
 #include <linux/acpi.h>
 
 struct wav_fmt {
@@ -125,4 +127,30 @@ enum {
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
+static inline nhlt_acpi_table *intel_nhlt_init(struct device *dev)
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
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
