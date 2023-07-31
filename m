Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBF76A2F0
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1AC846;
	Mon, 31 Jul 2023 23:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1AC846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839340;
	bh=mO4v0JLpcZjoDEv6O6t5hsaGOB2erQF4h+r3YIkRMSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UcE7ztwhHiDTEiZtGFb+V0A1C4WBsr6+d/z00IHe0cyW7+wftVZdDKjHkKcD6q63P
	 mNCX9UwNWw191d38fQYnqsZ99g9mkVrcOeKdLKD4dgoHtp10x/ZNTxCz7HJsU64Edh
	 B1Ob12cG1Ojev0nqr5OodYpI5Is6/jJx9TgsWAkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FAFBF801D5; Mon, 31 Jul 2023 23:34:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7178F8016D;
	Mon, 31 Jul 2023 23:34:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE017F8025A; Mon, 31 Jul 2023 23:34:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8117EF8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8117EF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CGUBcpM9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839190; x=1722375190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mO4v0JLpcZjoDEv6O6t5hsaGOB2erQF4h+r3YIkRMSU=;
  b=CGUBcpM9TIJXOhNoRh2FaDZsZj5u3bAlU6boxzqnapGlALYoJyPpBts/
   nAIwNM/JR4YXt0K2ttkqIuHmVqDD6WBvnD4Hq2xR1TVaUBBFsOIlLcLwD
   lYR50cJui6tfiOW7Vtbm5vBUzEZg5wanKM7NT2KOLWTsvK/fUgo7IZFch
   OjoO5EjraQrtDkz4ixW4g5I4lB92nltRalouBZnIZui+fOXuBlarwv4bV
   /BwPEctuCDe28wfwaNhir6+95BnfL7RZpgdungmBs3u/7itmNPtwoaw/p
   pVza0lMw+YCJ3Sm9+n6k1G7nBG4oQgZQwuqveGNwn+8tpoNS18OFZV2pu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435447510"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435447510"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731708901"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="731708901"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:33:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 2/6] ASoC: soc-acpi: move link_slaves_found()
Date: Mon, 31 Jul 2023 16:32:38 -0500
Message-Id: <20230731213242.434594-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VNWGOSIDVSUJWOCJJM73WJML3SSDJSEU
X-Message-ID-Hash: VNWGOSIDVSUJWOCJJM73WJML3SSDJSEU
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNWGOSIDVSUJWOCJJM73WJML3SSDJSEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move existing function in common library to make sure the code can be
reused by other SoC vendors.

No functionality change outside of the move and added prefix.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw.h       |  5 ++
 include/linux/soundwire/sdw_intel.h |  7 +--
 include/sound/soc-acpi.h            |  6 +++
 sound/soc/soc-acpi.c                | 73 +++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c           | 76 ++---------------------------
 5 files changed, 88 insertions(+), 79 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f523ceabd059..f248f9a6cd55 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -482,6 +482,11 @@ struct sdw_slave_id {
 	__u8 sdw_version:4;
 };
 
+struct sdw_extended_slave_id {
+	int link_id;
+	struct sdw_slave_id id;
+};
+
 /*
  * Helper macros to extract the MIPI-defined IDs
  *
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 11fc88fb0d78..fa67fad4ef51 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -264,11 +264,6 @@ struct sdw_intel_link_dev;
  */
 #define SDW_INTEL_CLK_STOP_BUS_RESET		BIT(3)
 
-struct sdw_intel_slave_id {
-	int link_id;
-	struct sdw_slave_id id;
-};
-
 struct hdac_bus;
 
 /**
@@ -298,7 +293,7 @@ struct sdw_intel_ctx {
 	int num_slaves;
 	acpi_handle handle;
 	struct sdw_intel_link_dev **ldev;
-	struct sdw_intel_slave_id *ids;
+	struct sdw_extended_slave_id *ids;
 	struct list_head link_list;
 	struct mutex shim_lock; /* lock for access to shared SHIM registers */
 	u32 shim_mask;
diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 528279056b3a..630bf7367fe6 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -9,6 +9,7 @@
 #include <linux/stddef.h>
 #include <linux/acpi.h>
 #include <linux/mod_devicetable.h>
+#include <linux/soundwire/sdw.h>
 
 struct snd_soc_acpi_package_context {
 	char *name;           /* package name */
@@ -208,4 +209,9 @@ static inline bool snd_soc_acpi_sof_parent(struct device *dev)
 		!strncmp(dev->parent->driver->name, "sof-audio-acpi", strlen("sof-audio-acpi"));
 }
 
+bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
+					const struct snd_soc_acpi_link_adr *link,
+					struct sdw_extended_slave_id *ids,
+					int num_slaves);
+
 #endif
diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 142476f1396f..9319e9b2a033 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -125,5 +125,78 @@ struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
 }
 EXPORT_SYMBOL_GPL(snd_soc_acpi_codec_list);
 
+#define SDW_CODEC_ADR_MASK(_adr) ((_adr) & (SDW_DISCO_LINK_ID_MASK | SDW_VERSION_MASK | \
+				  SDW_MFG_ID_MASK | SDW_PART_ID_MASK))
+
+/* Check if all Slaves defined on the link can be found */
+bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
+					const struct snd_soc_acpi_link_adr *link,
+					struct sdw_extended_slave_id *ids,
+					int num_slaves)
+{
+	unsigned int part_id, link_id, unique_id, mfg_id, version;
+	int i, j, k;
+
+	for (i = 0; i < link->num_adr; i++) {
+		u64 adr = link->adr_d[i].adr;
+		int reported_part_count = 0;
+
+		mfg_id = SDW_MFG_ID(adr);
+		part_id = SDW_PART_ID(adr);
+		link_id = SDW_DISCO_LINK_ID(adr);
+		version = SDW_VERSION(adr);
+
+		for (j = 0; j < num_slaves; j++) {
+			/* find out how many identical parts were reported on that link */
+			if (ids[j].link_id == link_id &&
+			    ids[j].id.part_id == part_id &&
+			    ids[j].id.mfg_id == mfg_id &&
+			    ids[j].id.sdw_version == version)
+				reported_part_count++;
+		}
+
+		for (j = 0; j < num_slaves; j++) {
+			int expected_part_count = 0;
+
+			if (ids[j].link_id != link_id ||
+			    ids[j].id.part_id != part_id ||
+			    ids[j].id.mfg_id != mfg_id ||
+			    ids[j].id.sdw_version != version)
+				continue;
+
+			/* find out how many identical parts are expected */
+			for (k = 0; k < link->num_adr; k++) {
+				u64 adr2 = link->adr_d[k].adr;
+
+				if (SDW_CODEC_ADR_MASK(adr2) == SDW_CODEC_ADR_MASK(adr))
+					expected_part_count++;
+			}
+
+			if (reported_part_count == expected_part_count) {
+				/*
+				 * we have to check unique id
+				 * if there is more than one
+				 * Slave on the link
+				 */
+				unique_id = SDW_UNIQUE_ID(adr);
+				if (reported_part_count == 1 ||
+				    ids[j].id.unique_id == unique_id) {
+					dev_dbg(dev, "found %x at link %d\n", part_id, link_id);
+					break;
+				}
+			} else {
+				dev_dbg(dev, "part %x reported %d expected %d on link %d, skipping\n",
+					part_id, reported_part_count, expected_part_count, link_id);
+			}
+		}
+		if (j == num_slaves) {
+			dev_dbg(dev, "Slave %x not found\n", part_id);
+			return false;
+		}
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(snd_soc_acpi_sdw_link_slaves_found);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("ALSA SoC ACPI module");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 6d9fafb58581..a77c0a52dcad 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1429,78 +1429,6 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
-#define SDW_CODEC_ADR_MASK(_adr) ((_adr) & (SDW_DISCO_LINK_ID_MASK | SDW_VERSION_MASK | \
-				  SDW_MFG_ID_MASK | SDW_PART_ID_MASK))
-
-/* Check if all Slaves defined on the link can be found */
-static bool link_slaves_found(struct device *dev,
-			      const struct snd_soc_acpi_link_adr *link,
-			      struct sdw_intel_slave_id *ids,
-			      int num_slaves)
-{
-	unsigned int part_id, link_id, unique_id, mfg_id, version;
-	int i, j, k;
-
-	for (i = 0; i < link->num_adr; i++) {
-		u64 adr = link->adr_d[i].adr;
-		int reported_part_count = 0;
-
-		mfg_id = SDW_MFG_ID(adr);
-		part_id = SDW_PART_ID(adr);
-		link_id = SDW_DISCO_LINK_ID(adr);
-		version = SDW_VERSION(adr);
-
-		for (j = 0; j < num_slaves; j++) {
-			/* find out how many identical parts were reported on that link */
-			if (ids[j].link_id == link_id &&
-			    ids[j].id.part_id == part_id &&
-			    ids[j].id.mfg_id == mfg_id &&
-			    ids[j].id.sdw_version == version)
-				reported_part_count++;
-		}
-
-		for (j = 0; j < num_slaves; j++) {
-			int expected_part_count = 0;
-
-			if (ids[j].link_id != link_id ||
-			    ids[j].id.part_id != part_id ||
-			    ids[j].id.mfg_id != mfg_id ||
-			    ids[j].id.sdw_version != version)
-				continue;
-
-			/* find out how many identical parts are expected */
-			for (k = 0; k < link->num_adr; k++) {
-				u64 adr2 = link->adr_d[k].adr;
-
-				if (SDW_CODEC_ADR_MASK(adr2) == SDW_CODEC_ADR_MASK(adr))
-					expected_part_count++;
-			}
-
-			if (reported_part_count == expected_part_count) {
-				/*
-				 * we have to check unique id
-				 * if there is more than one
-				 * Slave on the link
-				 */
-				unique_id = SDW_UNIQUE_ID(adr);
-				if (reported_part_count == 1 ||
-				    ids[j].id.unique_id == unique_id) {
-					dev_dbg(dev, "found %x at link %d\n", part_id, link_id);
-					break;
-				}
-			} else {
-				dev_dbg(dev, "part %x reported %d expected %d on link %d, skipping\n",
-					part_id, reported_part_count, expected_part_count, link_id);
-			}
-		}
-		if (j == num_slaves) {
-			dev_dbg(dev, "Slave %x not found\n", part_id);
-			return false;
-		}
-	}
-	return true;
-}
-
 static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
@@ -1544,7 +1472,9 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 				 * Try next machine if any expected Slaves
 				 * are not found on this link.
 				 */
-				if (!link_slaves_found(sdev->dev, link, hdev->sdw->ids, hdev->sdw->num_slaves))
+				if (!snd_soc_acpi_sdw_link_slaves_found(sdev->dev, link,
+									hdev->sdw->ids,
+									hdev->sdw->num_slaves))
 					break;
 			}
 			/* Found if all Slaves are checked */
-- 
2.39.2

