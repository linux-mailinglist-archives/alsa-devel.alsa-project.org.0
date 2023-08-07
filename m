Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947C773113
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CFA983E;
	Mon,  7 Aug 2023 23:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CFA983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442996;
	bh=+ZzNFozqpNeH3yOKdXH2AiJ0U5WZxDHHonLSJwKxEd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ng/nP+kN6pBwF7VviioTSYXHAYFYJd1kFFZc0vIisbMkhgWVwvTra2v/Xbz/BdKZs
	 H4BxQu5VzkvpONFyucHXbQmCMYqKmXw1h41kvi5Ou2JWKoNHCSpiRke4e8i0Ci4/ZT
	 fyTd6mluIN+s0nxWCA8j2AcqA+0Do3dAL74SYRVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 623CBF8064C; Mon,  7 Aug 2023 23:11:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 400D0F8063C;
	Mon,  7 Aug 2023 23:11:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61C94F805CB; Mon,  7 Aug 2023 23:10:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61101F8051E
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61101F8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZoHquvEw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442627; x=1722978627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+ZzNFozqpNeH3yOKdXH2AiJ0U5WZxDHHonLSJwKxEd8=;
  b=ZoHquvEwy2c9AONGyDr68TlY/tC1qeYLawdgJt+6pqlTCcet24JVJ7lT
   M/2bR+HAfF3duGdbwUChD6PWF5bcXytdB8j1all9WBcjAoN4dcSpPdYir
   qKvXXMraF0FlHQAY0yO97Hqc7PiG7ppoDJqbsmrZH7ZzY3zE3NceOTOdQ
   G9Q7l9LexmtgnTRkC4ACxcBZvlQ6H7sszi3E2q4jlJASI5rkeX3mLWXVX
   XqsHNOsoPrMnVGzi+4Hj03yb4V/WkVEkRo6WssuhAlqEh8BzCHRb/V8Vg
   LVNrBJF2f7Fy44wFl0fHWJLCXb07iohUiD5DKowckx6G8v5gYQP7ex3I+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244384"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244384"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465254"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465254"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 16/20] ASoC: SOF: Intel: add abstraction for SoundWire
 wake-ups
Date: Mon,  7 Aug 2023 16:09:55 -0500
Message-Id: <20230807210959.506849-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B2TLAM4DOATSKRG5KRN3TTUE3TELUKGM
X-Message-ID-Hash: B2TLAM4DOATSKRG5KRN3TTUE3TELUKGM
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code cannot work for LunarLake, let's add a layer of
abstraction.

No functional change in this patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/cnl.c  |  2 ++
 sound/soc/sof/intel/hda.c  | 20 +++++++++++++++-----
 sound/soc/sof/intel/hda.h  |  6 ++++++
 sound/soc/sof/intel/icl.c  |  1 +
 sound/soc/sof/intel/mtl.c  |  1 +
 sound/soc/sof/intel/shim.h |  1 +
 sound/soc/sof/intel/tgl.c  |  4 ++++
 7 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index a95222e53ecf..c6fbf4285262 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -466,6 +466,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -501,6 +502,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 67b2e00baf4e..5c1e6ad2b7f2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -399,14 +399,10 @@ static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 	return sdw_intel_thread(irq, context);
 }
 
-static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
 {
-	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct sof_intel_hda_dev *hdev;
 
-	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
-		return false;
-
 	hdev = sdev->pdata->hw_pdata;
 	if (hdev->sdw &&
 	    snd_sof_dsp_read(sdev, HDA_DSP_BAR,
@@ -416,6 +412,20 @@ static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
+static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+{
+	u32 interface_mask = hda_get_interface_mask(sdev);
+	const struct sof_intel_dsp_desc *chip;
+
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return false;
+
+	if (chip && chip->check_sdw_wakeen_irq)
+		return chip->check_sdw_wakeen_irq(sdev);
+
+	return false;
+}
+
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 4f60b722e5d5..f19510e8ce87 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -785,6 +785,7 @@ int hda_sdw_check_lcount_ext(struct snd_sof_dev *sdev);
 int hda_sdw_startup(struct snd_sof_dev *sdev);
 void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
+bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev);
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
 bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
 
@@ -813,6 +814,11 @@ static inline void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
 }
 
+static inline bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
+{
+	return false;
+}
+
 static inline void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 }
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 0f249efc6a5a..7ac10167a90d 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -188,6 +188,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index be3155f98944..b84ca58da9d5 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -735,6 +735,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq = mtl_enable_sdw_irq,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 207df48e27cf..9515d753c816 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -189,6 +189,7 @@ struct sof_intel_dsp_desc {
 	int (*read_sdw_lcount)(struct snd_sof_dev *sdev);
 	void (*enable_sdw_irq)(struct snd_sof_dev *sdev, bool enable);
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
+	bool (*check_sdw_wakeen_irq)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
 	int (*power_down_dsp)(struct snd_sof_dev *sdev);
 	int (*disable_interrupts)(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 8e2b07e1612b..bb9f20253c99 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -147,6 +147,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -175,6 +176,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -203,6 +205,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -231,6 +234,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
-- 
2.39.2

