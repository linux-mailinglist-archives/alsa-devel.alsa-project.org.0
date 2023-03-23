Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5226C5EF8
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1902BED4;
	Thu, 23 Mar 2023 06:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1902BED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549669;
	bh=PSkxVbe47xbUsq7avOoYR8upNoWBv4uK3aM/asFJSEA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eODAmPNLN0JVFaB+WGrE3fRkgM2ILJFSSViWQAEr8Q2fKpmNrT3jcZX0aY3aZ/aT5
	 y9E0QltufJZYaYVzmU51AzrVZlwTFBZ9huY1r1/YhKRpQj01Po1TdjhK5j0roDp4F4
	 daPEJATsrSVMH0+7/Jo3KaZVZa3UgIRAePixRbb0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E43F8052E;
	Thu, 23 Mar 2023 06:32:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A4B8F80551; Thu, 23 Mar 2023 06:30:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 540DBF80482
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540DBF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fWKV/kHJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549420; x=1711085420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PSkxVbe47xbUsq7avOoYR8upNoWBv4uK3aM/asFJSEA=;
  b=fWKV/kHJrhyPqrkQS/32aWcfcRpRD4x+W/l9w9L4FMaQRcStTGNB4IgM
   C2IEyZWbibFK80V+2fgRVYVpZQxlknJ+L17rqAcqTlVGsYej7P10Pekvz
   qs3uOBjoakwOMyiW7cHS7PNUfJkfom7PADJQsHaqC+kvRVc6vCNOVBmtC
   Y6c9U/+ID/9DV58HhNci2GI/gPUa+CW+oN3rZvfEAJDrAJu6/eaaJ18ww
   Aayq76wA2Zmwrj3os150U4nHf1kC2pSZHvAslxBnIgkMW/cguZKY5iYTJ
   wR9OD6O8NSKdcMcX0Pmer6zeD1qaacNSWY3EgPKIxTecVUtU63/Paz522
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779310"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779310"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675566998"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675566998"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 04/20] soundwire/ASOC: Intel: update offsets for LunarLake
Date: Thu, 23 Mar 2023 13:44:36 +0800
Message-Id: <20230323054452.1543233-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B6Z5LQ5LM5XPBREXJGTIY72AQT554ZE6
X-Message-ID-Hash: B6Z5LQ5LM5XPBREXJGTIY72AQT554ZE6
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6Z5LQ5LM5XPBREXJGTIY72AQT554ZE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The previous settings are not applicable, use a flag to determine what
the register layout is.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.h           |  2 ++
 drivers/soundwire/intel_init.c      | 14 ++++++++++----
 include/linux/soundwire/sdw_intel.h |  2 ++
 sound/soc/sof/intel/hda.c           | 21 +++++++++++++++++----
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 09d479f2c77b..51aa42a5a824 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -11,6 +11,7 @@
  * @mmio_base: mmio base of SoundWire registers
  * @registers: Link IO registers base
  * @shim: Audio shim pointer
+ * @shim_vs: Audio vendor-specific shim pointer
  * @alh: ALH (Audio Link Hub) pointer
  * @irq: Interrupt line
  * @ops: Shim callback ops
@@ -28,6 +29,7 @@ struct sdw_intel_link_res {
 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
 	void __iomem *registers;
 	void __iomem *shim;
+	void __iomem *shim_vs;
 	void __iomem *alh;
 	int irq;
 	const struct sdw_intel_ops *ops;
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index cbe56b993c6c..e0023af9e0e1 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -63,10 +63,16 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 	link = &ldev->link_res;
 	link->hw_ops = res->hw_ops;
 	link->mmio_base = res->mmio_base;
-	link->registers = res->mmio_base + SDW_LINK_BASE
-		+ (SDW_LINK_SIZE * link_id);
-	link->shim = res->mmio_base + res->shim_base;
-	link->alh = res->mmio_base + res->alh_base;
+	if (!res->ext) {
+		link->registers = res->mmio_base + SDW_LINK_BASE
+			+ (SDW_LINK_SIZE * link_id);
+		link->shim = res->mmio_base + res->shim_base;
+		link->alh = res->mmio_base + res->alh_base;
+	} else {
+		link->registers = res->mmio_base + SDW_IP_BASE(link_id);
+		link->shim = res->mmio_base +  SDW_SHIM2_GENERIC_BASE(link_id);
+		link->shim_vs = res->mmio_base + SDW_SHIM2_VS_BASE(link_id);
+	}
 
 	link->ops = res->ops;
 	link->dev = res->dev;
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 66687e83a94f..88eb5bf98140 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -323,6 +323,7 @@ struct sdw_intel_ctx {
  * DSP driver. The quirks are common for all links for now.
  * @shim_base: sdw shim base.
  * @alh_base: sdw alh base.
+ * @ext: extended HDaudio link support
  */
 struct sdw_intel_res {
 	const struct sdw_intel_hw_ops *hw_ops;
@@ -337,6 +338,7 @@ struct sdw_intel_res {
 	u32 clock_stop_quirks;
 	u32 shim_base;
 	u32 alh_base;
+	bool ext;
 };
 
 /*
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 81c697e20108..db103524be4f 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -198,6 +198,7 @@ static int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
 
 static int hda_sdw_probe(struct snd_sof_dev *sdev)
 {
+	const struct sof_intel_dsp_desc *chip;
 	struct sof_intel_hda_dev *hdev;
 	struct sdw_intel_res res;
 	void *sdw;
@@ -206,10 +207,22 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 
 	memset(&res, 0, sizeof(res));
 
-	res.hw_ops = &sdw_intel_cnl_hw_ops;
-	res.mmio_base = sdev->bar[HDA_DSP_BAR];
-	res.shim_base = hdev->desc->sdw_shim_base;
-	res.alh_base = hdev->desc->sdw_alh_base;
+	chip = get_chip_info(sdev->pdata);
+	if (chip->hw_ip_version < SOF_INTEL_ACE_2_0) {
+		res.mmio_base = sdev->bar[HDA_DSP_BAR];
+		res.hw_ops = &sdw_intel_cnl_hw_ops;
+		res.shim_base = hdev->desc->sdw_shim_base;
+		res.alh_base = hdev->desc->sdw_alh_base;
+		res.ext = false;
+	} else {
+		res.mmio_base = sdev->bar[HDA_DSP_HDA_BAR];
+		/*
+		 * the SHIM and SoundWire register offsets are link-specific
+		 * and will be determined when adding auxiliary devices
+		 */
+		res.hw_ops = &sdw_intel_lnl_hw_ops;
+		res.ext = true;
+	}
 	res.irq = sdev->ipc_irq;
 	res.handle = hdev->info.handle;
 	res.parent = sdev->dev;
-- 
2.25.1

