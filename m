Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD0944BEB1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 11:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 926DB165D;
	Wed, 10 Nov 2021 11:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 926DB165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636540253;
	bh=aCiBA6LLb1mFiU3TyZJYKHyHAi9TnxdVaWRMHNjQP20=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1UTv+ng2FPWhlyVUAeHlmwYAG20tDJh+oP0ZjylL/63xZJAK03UMUAKR410IdMjT
	 wsVvsjqSI6jXtlKBFude57UGaSWu/0+wJMdGQWqxoQTwvZBr9Ccchz3AgBZT6WI1Mc
	 aHnuHg7idd3qSiIB1OrjYSBRDBSYr/DqRIr5tkhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03F63F800C1;
	Wed, 10 Nov 2021 11:29:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB06F804B3; Wed, 10 Nov 2021 11:29:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC2C6F800C1
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 11:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC2C6F800C1
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232489609"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232489609"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="452270796"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 10 Nov 2021 02:28:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/4] ALSA: hda: Follow ACPI convention in NHLT struct naming
Date: Wed, 10 Nov 2021 11:31:14 +0100
Message-Id: <20211110103117.3142450-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110103117.3142450-1-cezary.rojewski@intel.com>
References: <20211110103117.3142450-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

All ACPI table structs except for NHLT ones are defined in postfix way.
Update NHLT structs naming to make code cohesive.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/intel-nhlt.h         | 16 ++++++++--------
 sound/hda/intel-dsp-config.c       |  2 +-
 sound/hda/intel-nhlt.c             |  8 ++++----
 sound/soc/intel/skylake/skl-nhlt.c |  8 ++++----
 sound/soc/intel/skylake/skl.h      |  2 +-
 sound/soc/sof/intel/hda.c          |  2 +-
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index d0574805865f..b0796225f82e 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -77,7 +77,7 @@ struct nhlt_endpoint {
 	struct nhlt_specific_cfg config;
 } __packed;
 
-struct nhlt_acpi_table {
+struct acpi_table_nhlt {
 	struct acpi_table_header header;
 	u8 endpoint_count;
 	struct nhlt_endpoint desc[];
@@ -126,27 +126,27 @@ enum {
 	NHLT_MIC_ARRAY_VENDOR_DEFINED = 0xf,
 };
 
-struct nhlt_acpi_table *intel_nhlt_init(struct device *dev);
+struct acpi_table_nhlt *intel_nhlt_init(struct device *dev);
 
-void intel_nhlt_free(struct nhlt_acpi_table *addr);
+void intel_nhlt_free(struct acpi_table_nhlt *addr);
 
-int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt);
+int intel_nhlt_get_dmic_geo(struct device *dev, struct acpi_table_nhlt *nhlt);
 
 #else
 
-struct nhlt_acpi_table;
+struct acpi_table_nhlt;
 
-static inline struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
+static inline struct acpi_table_nhlt *intel_nhlt_init(struct device *dev)
 {
 	return NULL;
 }
 
-static inline void intel_nhlt_free(struct nhlt_acpi_table *addr)
+static inline void intel_nhlt_free(struct acpi_table_nhlt *addr)
 {
 }
 
 static inline int intel_nhlt_get_dmic_geo(struct device *dev,
-					  struct nhlt_acpi_table *nhlt)
+					  struct acpi_table_nhlt *nhlt)
 {
 	return 0;
 }
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index b9ac9e9e45a4..64b6c6ab591e 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -379,7 +379,7 @@ static const struct config_entry *snd_intel_dsp_find_config
 
 static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
 {
-	struct nhlt_acpi_table *nhlt;
+	struct acpi_table_nhlt *nhlt;
 	int ret = 0;
 
 	nhlt = intel_nhlt_init(&pci->dev);
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index e2237239d922..e6baa7af5c5d 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -4,9 +4,9 @@
 #include <linux/acpi.h>
 #include <sound/intel-nhlt.h>
 
-struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
+struct acpi_table_nhlt *intel_nhlt_init(struct device *dev)
 {
-	struct nhlt_acpi_table *nhlt;
+	struct acpi_table_nhlt *nhlt;
 	acpi_status status;
 
 	status = acpi_get_table(ACPI_SIG_NHLT, 0,
@@ -20,13 +20,13 @@ struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_init);
 
-void intel_nhlt_free(struct nhlt_acpi_table *nhlt)
+void intel_nhlt_free(struct acpi_table_nhlt *nhlt)
 {
 	acpi_put_table((struct acpi_table_header *)nhlt);
 }
 EXPORT_SYMBOL_GPL(intel_nhlt_free);
 
-int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
+int intel_nhlt_get_dmic_geo(struct device *dev, struct acpi_table_nhlt *nhlt)
 {
 	struct nhlt_endpoint *epnt;
 	struct nhlt_dmic_array_config *cfg;
diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 64226072f0ee..3033c1bf279f 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -88,7 +88,7 @@ struct nhlt_specific_cfg
 	struct hdac_bus *bus = skl_to_bus(skl);
 	struct device *dev = bus->dev;
 	struct nhlt_specific_cfg *sp_config;
-	struct nhlt_acpi_table *nhlt = skl->nhlt;
+	struct acpi_table_nhlt *nhlt = skl->nhlt;
 	u16 bps = (s_fmt == 16) ? 16 : 32;
 	u8 j;
 
@@ -132,7 +132,7 @@ static void skl_nhlt_trim_space(char *trim)
 
 int skl_nhlt_update_topology_bin(struct skl_dev *skl)
 {
-	struct nhlt_acpi_table *nhlt = (struct nhlt_acpi_table *)skl->nhlt;
+	struct acpi_table_nhlt *nhlt = (struct acpi_table_nhlt *)skl->nhlt;
 	struct hdac_bus *bus = skl_to_bus(skl);
 	struct device *dev = bus->dev;
 
@@ -155,7 +155,7 @@ static ssize_t platform_id_show(struct device *dev,
 	struct pci_dev *pci = to_pci_dev(dev);
 	struct hdac_bus *bus = pci_get_drvdata(pci);
 	struct skl_dev *skl = bus_to_skl(bus);
-	struct nhlt_acpi_table *nhlt = (struct nhlt_acpi_table *)skl->nhlt;
+	struct acpi_table_nhlt *nhlt = (struct acpi_table_nhlt *)skl->nhlt;
 	char platform_id[32];
 
 	sprintf(platform_id, "%x-%.6s-%.8s-%d", skl->pci_id,
@@ -335,7 +335,7 @@ static void skl_get_mclk(struct skl_dev *skl, struct skl_ssp_clk *mclk,
 
 void skl_get_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks)
 {
-	struct nhlt_acpi_table *nhlt = (struct nhlt_acpi_table *)skl->nhlt;
+	struct acpi_table_nhlt *nhlt = (struct acpi_table_nhlt *)skl->nhlt;
 	struct nhlt_endpoint *epnt;
 	struct nhlt_fmt *fmt;
 	int i;
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 33ed274fc0cb..37195aafbf27 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -67,7 +67,7 @@ struct skl_dev {
 	struct snd_soc_component *component;
 	struct snd_soc_dai_driver *dais;
 
-	struct nhlt_acpi_table *nhlt; /* nhlt ptr */
+	struct acpi_table_nhlt *nhlt; /* nhlt ptr */
 
 	struct list_head ppl_list;
 	struct list_head bind_list;
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 568d351b7a4e..ce65bb089a13 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -648,7 +648,7 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 static int check_nhlt_dmic(struct snd_sof_dev *sdev)
 {
-	struct nhlt_acpi_table *nhlt;
+	struct acpi_table_nhlt *nhlt;
 	int dmic_num;
 
 	nhlt = intel_nhlt_init(sdev->dev);
-- 
2.25.1

