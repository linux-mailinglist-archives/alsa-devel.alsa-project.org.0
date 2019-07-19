Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCB6E9E0
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 19:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A1716CD;
	Fri, 19 Jul 2019 19:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A1716CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563556292;
	bh=s75gSW3kS/a/ewHqJ1D/8XZ3LTCfA2QRl9zxz9wMHUk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pI3/BNRorhOnVnxt+tmLP9UKA0D5fn/ptbfUybutGHwH9EEjn1amcd4wQ+51Pd6Ym
	 Y6mUKSFYfyVuPqtG2xQULrwas4GYwGByzZdZimSxY2n8mNtFXNoSGY5uZvp4mykeSO
	 QtjZ2c6Mb80C57v/G2ru9O+W+f4Vr3v4B4AR+6ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 612B1F8048F;
	Fri, 19 Jul 2019 19:06:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB5BF803F4; Fri, 19 Jul 2019 19:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 765F6F80368
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 19:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 765F6F80368
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 10:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="191982225"
Received: from cvrozas-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.190.38])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2019 10:06:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 12:06:09 -0500
Message-Id: <20190719170610.17610-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
References: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH 5/6] ASoC: Intel: Skylake: use common NHLT
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
 sound/soc/intel/Kconfig            |  1 +
 sound/soc/intel/skylake/skl-nhlt.c | 90 ------------------------------
 sound/soc/intel/skylake/skl.c      | 12 ++--
 sound/soc/intel/skylake/skl.h      |  3 -
 4 files changed, 9 insertions(+), 97 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 96a00a9d4cf8..a3ec17fd63cd 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -215,6 +215,7 @@ config SND_SOC_INTEL_SKYLAKE_COMMON
 	select SND_SOC_INTEL_SST
 	select SND_SOC_HDAC_HDA if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
 	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_INTEL_NHLT
 	help
 	  If you have a Intel Skylake/Broxton/ApolloLake/KabyLake/
 	  GeminiLake or CannonLake platform with the DSP enabled in the BIOS
diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index aabc5d71650e..6f57ceb9efb7 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -13,54 +13,6 @@
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
@@ -163,48 +115,6 @@ struct nhlt_specific_cfg
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
index 3362e71b4563..2b5159890a57 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -26,9 +26,11 @@
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
 #include <sound/hda_codec.h>
+#include <sound/intel-nhlt.h>
 #include "skl.h"
 #include "skl-sst-dsp.h"
 #include "skl-sst-ipc.h"
+
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
 #include "../../../soc/codecs/hdac_hda.h"
 #endif
@@ -516,7 +518,9 @@ static int skl_find_machine(struct skl *skl, void *driver_data)
 
 	if (pdata) {
 		skl->use_tplg_pcm = pdata->use_tplg_pcm;
-		mach->mach_params.dmic_num = skl_get_dmic_geo(skl);
+		mach->mach_params.dmic_num =
+			intel_nhlt_get_dmic_geo(&skl->pci->dev,
+						skl->nhlt);
 	}
 
 	return 0;
@@ -1029,7 +1033,7 @@ static int skl_probe(struct pci_dev *pci,
 
 	device_disable_async_suspend(bus->dev);
 
-	skl->nhlt = skl_nhlt_init(bus->dev);
+	skl->nhlt = intel_nhlt_init(bus->dev);
 
 	if (skl->nhlt == NULL) {
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
@@ -1095,7 +1099,7 @@ static int skl_probe(struct pci_dev *pci,
 out_clk_free:
 	skl_clock_device_unregister(skl);
 out_nhlt_free:
-	skl_nhlt_free(skl->nhlt);
+	intel_nhlt_free(skl->nhlt);
 out_free:
 	skl_free(bus);
 
@@ -1144,7 +1148,7 @@ static void skl_remove(struct pci_dev *pci)
 	skl_dmic_device_unregister(skl);
 	skl_clock_device_unregister(skl);
 	skl_nhlt_remove_sysfs(skl);
-	skl_nhlt_free(skl->nhlt);
+	intel_nhlt_free(skl->nhlt);
 	skl_free(bus);
 	dev_set_drvdata(&pci->dev, NULL);
 }
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 928e8115a1a7..f4dd6c767993 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -128,13 +128,10 @@ struct skl_dsp_ops {
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
