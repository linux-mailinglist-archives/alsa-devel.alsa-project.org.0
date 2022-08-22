Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08659C7C1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 21:02:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908C01674;
	Mon, 22 Aug 2022 21:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908C01674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661194942;
	bh=KVLcAmKQkQdgfCx9DB/jymBvamzRz+1Ev4oau7IRKjQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WkHVlY65FnSj4V6tI2+dZtEazbVyElNmb0WYInmeUlU/oglROu0a9CcTMXoU7M9bQ
	 PFKojKtDKrAZuvgz+86Su7iY8001gauCm5fQAwFVjSSIJfRvrqjmhOP1Lgiv+MKz74
	 Xjw02Mfym/MW/D5aWyt+/3iIekNGKWKjP7ZtVJS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60039F804A9;
	Mon, 22 Aug 2022 21:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0205EF800ED; Mon, 22 Aug 2022 21:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6608DF800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 21:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6608DF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N5EzvdHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661194866; x=1692730866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KVLcAmKQkQdgfCx9DB/jymBvamzRz+1Ev4oau7IRKjQ=;
 b=N5EzvdHTKiI5yPPb73MV0yt7HDabtqeRNMNIAgwVIrMradGtdfjidCA+
 oM+Z3LjHk29N1uOyZUQbKeCnPGMF7shzCw6jgKGA7xMJUuXd0Gvql507Z
 ya/k+NLYrLmZlTCzJvqGTtCFyv2Mru/YlaaYaa4ga2y7QnrJf3VG+n5EI
 glwfpGVH5nCOyddurl8DBBy2LdibOdAN8E/HBH8LnnCi39msa4gZSOCiQ
 i/4UEsbOHQe+NV2SSPoMTLMJuGHnPVhzbc9RyQ80bTks7QewW2Zmkvmhs
 JiuC+YryQ7LMADZaDk5Q7OnIuj5fZQPxwo6w88iOHewCTPI4BAhpX58SK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294285675"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="294285675"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 12:01:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="751398898"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 12:00:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: cleanup definitions for multi-link registers
Date: Mon, 22 Aug 2022 21:00:44 +0200
Message-Id: <20220822190044.170495-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

For some reason two masks are used without the AZX prefix, and the
pattern MLCLT should be ML_LCTL for consistency.

Pure rename, no functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/hda_register.h        | 20 +++++++++++---------
 sound/hda/ext/hdac_ext_controller.c | 16 ++++++++--------
 sound/pci/hda/hda_intel.c           | 14 +++++++-------
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index ad8b71b1dbb67..d37cf43546eba 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -260,7 +260,18 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 
 #define AZX_REG_ML_LCAP			0x00
 #define AZX_REG_ML_LCTL			0x04
+
+#define AZX_ML_LCTL_CPA			BIT(23)
+#define AZX_ML_LCTL_CPA_SHIFT		23
+#define AZX_ML_LCTL_SPA			BIT(16)
+#define AZX_ML_LCTL_SPA_SHIFT		16
+#define AZX_ML_LCTL_SCF			GENMASK(3, 0)
+
 #define AZX_REG_ML_LOSIDV		0x08
+
+/* bit0 is reserved, with BIT(1) mapping to stream1 */
+#define AZX_ML_LOSIDV_STREAM_MASK	0xFFFE
+
 #define AZX_REG_ML_LSDIID		0x0C
 #define AZX_REG_ML_LPSOO		0x10
 #define AZX_REG_ML_LPSIO		0x12
@@ -268,15 +279,6 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define AZX_REG_ML_LOUTPAY		0x20
 #define AZX_REG_ML_LINPAY		0x30
 
-/* bit0 is reserved, with BIT(1) mapping to stream1 */
-#define ML_LOSIDV_STREAM_MASK		0xFFFE
-
-#define ML_LCTL_SCF_MASK			0xF
-#define AZX_MLCTL_SPA				(0x1 << 16)
-#define AZX_MLCTL_CPA				(0x1 << 23)
-#define AZX_MLCTL_SPA_SHIFT			16
-#define AZX_MLCTL_CPA_SHIFT			23
-
 /* registers for DMA Resume Capability Structure */
 #define AZX_DRSM_CAP_ID			0x5
 #define AZX_REG_DRSM_CTL		0x4
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index a42f66f561f57..80876b9a87f46 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -170,7 +170,7 @@ static int check_hdac_link_power_active(struct hdac_ext_link *link, bool enable)
 {
 	int timeout;
 	u32 val;
-	int mask = (1 << AZX_MLCTL_CPA_SHIFT);
+	int mask = (1 << AZX_ML_LCTL_CPA_SHIFT);
 
 	udelay(3);
 	timeout = 150;
@@ -178,10 +178,10 @@ static int check_hdac_link_power_active(struct hdac_ext_link *link, bool enable)
 	do {
 		val = readl(link->ml_addr + AZX_REG_ML_LCTL);
 		if (enable) {
-			if (((val & mask) >> AZX_MLCTL_CPA_SHIFT))
+			if (((val & mask) >> AZX_ML_LCTL_CPA_SHIFT))
 				return 0;
 		} else {
-			if (!((val & mask) >> AZX_MLCTL_CPA_SHIFT))
+			if (!((val & mask) >> AZX_ML_LCTL_CPA_SHIFT))
 				return 0;
 		}
 		udelay(3);
@@ -197,7 +197,7 @@ static int check_hdac_link_power_active(struct hdac_ext_link *link, bool enable)
 int snd_hdac_ext_bus_link_power_up(struct hdac_ext_link *link)
 {
 	snd_hdac_updatel(link->ml_addr, AZX_REG_ML_LCTL,
-			 AZX_MLCTL_SPA, AZX_MLCTL_SPA);
+			 AZX_ML_LCTL_SPA, AZX_ML_LCTL_SPA);
 
 	return check_hdac_link_power_active(link, true);
 }
@@ -209,7 +209,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_power_up);
  */
 int snd_hdac_ext_bus_link_power_down(struct hdac_ext_link *link)
 {
-	snd_hdac_updatel(link->ml_addr, AZX_REG_ML_LCTL, AZX_MLCTL_SPA, 0);
+	snd_hdac_updatel(link->ml_addr, AZX_REG_ML_LCTL, AZX_ML_LCTL_SPA, 0);
 
 	return check_hdac_link_power_active(link, false);
 }
@@ -226,7 +226,7 @@ int snd_hdac_ext_bus_link_power_up_all(struct hdac_bus *bus)
 
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
 		snd_hdac_updatel(hlink->ml_addr, AZX_REG_ML_LCTL,
-				 AZX_MLCTL_SPA, AZX_MLCTL_SPA);
+				 AZX_ML_LCTL_SPA, AZX_ML_LCTL_SPA);
 		ret = check_hdac_link_power_active(hlink, true);
 		if (ret < 0)
 			return ret;
@@ -247,7 +247,7 @@ int snd_hdac_ext_bus_link_power_down_all(struct hdac_bus *bus)
 
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
 		snd_hdac_updatel(hlink->ml_addr, AZX_REG_ML_LCTL,
-				 AZX_MLCTL_SPA, 0);
+				 AZX_ML_LCTL_SPA, 0);
 		ret = check_hdac_link_power_active(hlink, false);
 		if (ret < 0)
 			return ret;
@@ -281,7 +281,7 @@ int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 		 * clear the register to invalidate all the output streams
 		 */
 		snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV,
-				 ML_LOSIDV_STREAM_MASK, 0);
+				 AZX_ML_LOSIDV_STREAM_MASK, 0);
 		/*
 		 *  wait for 521usec for codec to report status
 		 *  HDA spec section 4.3 - Codec Discovery
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7720978dc1326..bf9df9bc8f1bf 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -489,14 +489,14 @@ static int intel_ml_lctl_set_power(struct azx *chip, int state)
 	 * If other links are enabled for stream, they need similar fix
 	 */
 	val = readl(bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL);
-	val &= ~AZX_MLCTL_SPA;
-	val |= state << AZX_MLCTL_SPA_SHIFT;
+	val &= ~AZX_ML_LCTL_SPA;
+	val |= state << AZX_ML_LCTL_SPA_SHIFT;
 	writel(val, bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL);
 	/* wait for CPA */
 	timeout = 50;
 	while (timeout) {
 		if (((readl(bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL)) &
-		    AZX_MLCTL_CPA) == (state << AZX_MLCTL_CPA_SHIFT))
+		    AZX_ML_LCTL_CPA) == (state << AZX_ML_LCTL_CPA_SHIFT))
 			return 0;
 		timeout--;
 		udelay(10);
@@ -514,15 +514,15 @@ static void intel_init_lctl(struct azx *chip)
 	/* 0. check lctl register value is correct or not */
 	val = readl(bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL);
 	/* if SCF is already set, let's use it */
-	if ((val & ML_LCTL_SCF_MASK) != 0)
+	if ((val & AZX_ML_LCTL_SCF) != 0)
 		return;
 
 	/*
 	 * Before operating on SPA, CPA must match SPA.
 	 * Any deviation may result in undefined behavior.
 	 */
-	if (((val & AZX_MLCTL_SPA) >> AZX_MLCTL_SPA_SHIFT) !=
-		((val & AZX_MLCTL_CPA) >> AZX_MLCTL_CPA_SHIFT))
+	if (((val & AZX_ML_LCTL_SPA) >> AZX_ML_LCTL_SPA_SHIFT) !=
+		((val & AZX_ML_LCTL_CPA) >> AZX_ML_LCTL_CPA_SHIFT))
 		return;
 
 	/* 1. turn link down: set SPA to 0 and wait CPA to 0 */
@@ -532,7 +532,7 @@ static void intel_init_lctl(struct azx *chip)
 		goto set_spa;
 
 	/* 2. update SCF to select a properly audio clock*/
-	val &= ~ML_LCTL_SCF_MASK;
+	val &= ~AZX_ML_LCTL_SCF;
 	val |= intel_get_lctl_scf(chip);
 	writel(val, bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL);
 
-- 
2.34.1

