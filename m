Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120B28E06
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 01:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6EF165F;
	Fri, 24 May 2019 01:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6EF165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558655148;
	bh=2ZYssQi9pcJ0aqjEz8RC6ANLWQW6m3yVzrjHhC80tBo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ulK852BKouYMfYLLI1XaU1b2UbrjGvescEiEIakfUVfA1VNtgC1RQErqcUcBmr2Ol
	 zx9ap4j/cUYf/OXbqxt4/xvhkEcHLqKFm758X+Z0in2laflkA5kCdMFBNlrSctySYP
	 lZdh8GNW9Ql/CuHgm82hRjFeXekjAb7Sd9IOwXNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA4BFF89742;
	Fri, 24 May 2019 01:40:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE879F89707; Fri, 24 May 2019 01:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41CACF89707
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 01:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41CACF89707
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 16:40:37 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.128.35])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 16:40:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 23 May 2019 18:39:49 -0500
Message-Id: <20190523233951.31122-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [RFC PATCH 4/6] ASoC: Intel: Skylake: use common NHLT
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

No functionality change, only use common functions now.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/skl-nhlt.c | 90 ------------------------------
 sound/soc/intel/skylake/skl.c      | 11 ++--
 sound/soc/intel/skylake/skl.h      |  3 -
 3 files changed, 7 insertions(+), 97 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 8c72b737c1fa..bb73d2544dc5 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -22,54 +22,6 @@
 #include "skl.h"
 #include "skl-i2s.h"
 
-#define NHLT_ACPI_HEADER_SIG	"NHLT"
-
-/* Unique identification for getting NHLT blobs */
-static guid_t osc_guid =
-	GUID_INIT(0xA69F886E, 0x6CEB, 0x4594,
-		  0xA4, 0x1F, 0x7B, 0x5D, 0xCE, 0x24, 0xC5, 0x53);
-
-
-struct nhlt_acpi_table *skl_nhlt_init(struct device *dev)
-{
-	acpi_handle handle;
-	union acpi_object *obj;
-	struct nhlt_resource_desc  *nhlt_ptr = NULL;
-	struct nhlt_acpi_table *nhlt_table = NULL;
-
-	handle = ACPI_HANDLE(dev);
-	if (!handle) {
-		dev_err(dev, "Didn't find ACPI_HANDLE\n");
-		return NULL;
-	}
-
-	obj = acpi_evaluate_dsm(handle, &osc_guid, 1, 1, NULL);
-	if (obj && obj->type == ACPI_TYPE_BUFFER) {
-		nhlt_ptr = (struct nhlt_resource_desc  *)obj->buffer.pointer;
-		if (nhlt_ptr->length)
-			nhlt_table = (struct nhlt_acpi_table *)
-				memremap(nhlt_ptr->min_addr, nhlt_ptr->length,
-				MEMREMAP_WB);
-		ACPI_FREE(obj);
-		if (nhlt_table && (strncmp(nhlt_table->header.signature,
-					NHLT_ACPI_HEADER_SIG,
-					strlen(NHLT_ACPI_HEADER_SIG)) != 0)) {
-			memunmap(nhlt_table);
-			dev_err(dev, "NHLT ACPI header signature incorrect\n");
-			return NULL;
-		}
-		return nhlt_table;
-	}
-
-	dev_err(dev, "device specific method to extract NHLT blob failed\n");
-	return NULL;
-}
-
-void skl_nhlt_free(struct nhlt_acpi_table *nhlt)
-{
-	memunmap((void *) nhlt);
-}
-
 static struct nhlt_specific_cfg *skl_get_specific_cfg(
 		struct device *dev, struct nhlt_fmt *fmt,
 		u8 no_ch, u32 rate, u16 bps, u8 linktype)
@@ -172,48 +124,6 @@ struct nhlt_specific_cfg
 	return NULL;
 }
 
-int skl_get_dmic_geo(struct skl *skl)
-{
-	struct nhlt_acpi_table *nhlt = (struct nhlt_acpi_table *)skl->nhlt;
-	struct nhlt_endpoint *epnt;
-	struct nhlt_dmic_array_config *cfg;
-	struct device *dev = &skl->pci->dev;
-	unsigned int dmic_geo = 0;
-	u8 j;
-
-	if (!nhlt)
-		return 0;
-
-	epnt = (struct nhlt_endpoint *)nhlt->desc;
-
-	for (j = 0; j < nhlt->endpoint_count; j++) {
-		if (epnt->linktype == NHLT_LINK_DMIC) {
-			cfg = (struct nhlt_dmic_array_config  *)
-					(epnt->config.caps);
-			switch (cfg->array_type) {
-			case NHLT_MIC_ARRAY_2CH_SMALL:
-			case NHLT_MIC_ARRAY_2CH_BIG:
-				dmic_geo |= MIC_ARRAY_2CH;
-				break;
-
-			case NHLT_MIC_ARRAY_4CH_1ST_GEOM:
-			case NHLT_MIC_ARRAY_4CH_L_SHAPED:
-			case NHLT_MIC_ARRAY_4CH_2ND_GEOM:
-				dmic_geo |= MIC_ARRAY_4CH;
-				break;
-
-			default:
-				dev_warn(dev, "undefined DMIC array_type 0x%0x\n",
-						cfg->array_type);
-
-			}
-		}
-		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
-	}
-
-	return dmic_geo;
-}
-
 static void skl_nhlt_trim_space(char *trim)
 {
 	char *s = trim;
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index f864f7b3df3a..322bbb36531b 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -37,6 +37,7 @@
 #include "skl.h"
 #include "skl-sst-dsp.h"
 #include "skl-sst-ipc.h"
+#include "../common/intel-nhlt.h"
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
 #include "../../../soc/codecs/hdac_hda.h"
 #endif
@@ -505,7 +506,9 @@ static int skl_find_machine(struct skl *skl, void *driver_data)
 
 	if (pdata) {
 		skl->use_tplg_pcm = pdata->use_tplg_pcm;
-		mach->mach_params.dmic_num = skl_get_dmic_geo(skl);
+		mach->mach_params.dmic_num =
+			intel_nhlt_get_dmic_geo(&skl->pci->dev,
+						skl->nhlt);
 	}
 
 	return 0;
@@ -1014,7 +1017,7 @@ static int skl_probe(struct pci_dev *pci,
 
 	device_disable_async_suspend(bus->dev);
 
-	skl->nhlt = skl_nhlt_init(bus->dev);
+	skl->nhlt = intel_nhlt_init(bus->dev);
 
 	if (skl->nhlt == NULL) {
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
@@ -1080,7 +1083,7 @@ static int skl_probe(struct pci_dev *pci,
 out_clk_free:
 	skl_clock_device_unregister(skl);
 out_nhlt_free:
-	skl_nhlt_free(skl->nhlt);
+	intel_nhlt_free(skl->nhlt);
 out_free:
 	skl_free(bus);
 
@@ -1130,7 +1133,7 @@ static void skl_remove(struct pci_dev *pci)
 	skl_dmic_device_unregister(skl);
 	skl_clock_device_unregister(skl);
 	skl_nhlt_remove_sysfs(skl);
-	skl_nhlt_free(skl->nhlt);
+	intel_nhlt_free(skl->nhlt);
 	skl_free(bus);
 	dev_set_drvdata(&pci->dev, NULL);
 }
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index f0a15cb3d311..0f19c9d47017 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -136,13 +136,10 @@ struct skl_dsp_ops {
 int skl_platform_unregister(struct device *dev);
 int skl_platform_register(struct device *dev);
 
-struct nhlt_acpi_table *skl_nhlt_init(struct device *dev);
-void skl_nhlt_free(struct nhlt_acpi_table *addr);
 struct nhlt_specific_cfg *skl_get_ep_blob(struct skl *skl, u32 instance,
 					u8 link_type, u8 s_fmt, u8 no_ch,
 					u32 s_rate, u8 dirn, u8 dev_type);
 
-int skl_get_dmic_geo(struct skl *skl);
 int skl_nhlt_update_topology_bin(struct skl *skl);
 int skl_init_dsp(struct skl *skl);
 int skl_free_dsp(struct skl *skl);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
