Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1308BAE1C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F32BE65;
	Fri,  3 May 2024 15:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F32BE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714744446;
	bh=jAmF9TapQ0bMEJFmBmDWJ3wBI0lRy4F6KUp4fwsstTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pw1xObSDzIGEAF/uF3NtIiEKodpS35gV9Ut337IZs0GQOCHmu1ymHX0/9HsoXI7EA
	 JzWPeaOx4NdHtdIOBMPr3wzqmHeNW4mURggLe1E33HxFZuKHh+Mxvcca4wIU75cD04
	 2q16StO3mJOLRY3m12kO6en0wrcwSRt7cRpDP3Ac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9638F8060B; Fri,  3 May 2024 15:52:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC16BF8060F;
	Fri,  3 May 2024 15:52:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C48FF80602; Fri,  3 May 2024 15:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C68AF8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C68AF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LHPRk5PI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744362; x=1746280362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jAmF9TapQ0bMEJFmBmDWJ3wBI0lRy4F6KUp4fwsstTo=;
  b=LHPRk5PIFf8DkEp5wqC2CUyxj4C33HNkaS0SMGjwo2UbU3JHTJcpnpwf
   0PaB2prS+pucpbT30Neahec1x3w0e1Db43CH9z/xcEPi3vI2Yq4H/6LKV
   WqH9fDDnKBmkHoeUn7GQDcXrLMNEo8u37xyQOChNLfPWpjsukTPK8Aywl
   ToRTWkJ8n2qWt+whHs8PNdFjzqsRyA9NqhngHcU84dQU0Q5pg7KRl/+iy
   ktDdtVLdCUN/zijwCLroLF/Xm2a70/HD5MQmUwCF+MGOB4S3kGSEVU227
   d0ipc3ag7chHoPsyJsHgNKPmDcOW21CWMBfT4H8sUivUueM6soL16eZ07
   g==;
X-CSE-ConnectionGUID: pp1T7BT/R5aM5w+5Hv/PnQ==
X-CSE-MsgGUID: 1K1yu1iQRdyG1qCO4YuGuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029430"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="28029430"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:37 -0700
X-CSE-ConnectionGUID: JbXCBeDYQgSCp8rtAdYVAg==
X-CSE-MsgGUID: /ZvZYLuUSfufjFb+a4kxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27548769"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 6/7] ASoC: SOF: Intel: remove circular dependency on
 hda_sdw_process_wakeen()
Date: Fri,  3 May 2024 08:52:20 -0500
Message-Id: <20240503135221.229202-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I2NQ7QRWEJJA25AJVUN3CONVZFUHMS2T
X-Message-ID-Hash: I2NQ7QRWEJJA25AJVUN3CONVZFUHMS2T
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2NQ7QRWEJJA25AJVUN3CONVZFUHMS2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

hda_sdw_process_wakeen() is used in hda-loader.c, but defined in
hda.c. This code split will create a circular dependency when hda.c is
moved to a different module. Rather than an invasive code change, this
patch follows the model used for sdw_check_wakeen_irq() with an
abstraction. For now all abstractions point to the same common
routine, which is arguably not great, but this also provides us with a
future-proof way of addressing platform-specific wake processing.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c     |  2 ++
 sound/soc/sof/intel/hda-dsp.c | 15 +++++++++++++++
 sound/soc/sof/intel/hda.c     |  3 ++-
 sound/soc/sof/intel/hda.h     |  5 +++++
 sound/soc/sof/intel/icl.c     |  1 +
 sound/soc/sof/intel/lnl.c     |  1 +
 sound/soc/sof/intel/mtl.c     |  2 ++
 sound/soc/sof/intel/shim.h    |  1 +
 sound/soc/sof/intel/tgl.c     |  4 ++++
 9 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 460bc404ddb6..1936865b2937 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -473,6 +473,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -508,6 +509,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 974ac1cd8c6e..780f4c33e678 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -1311,6 +1311,21 @@ int hda_sdw_check_lcount(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+
+void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
+{
+	u32 interface_mask = hda_get_interface_mask(sdev);
+	const struct sof_intel_dsp_desc *chip;
+
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->sdw_process_wakeen)
+		chip->sdw_process_wakeen(sdev);
+}
+EXPORT_SYMBOL_NS(hda_sdw_process_wakeen, SND_SOC_SOF_INTEL_HDA_COMMON);
+
 #endif
 
 int hda_dsp_disable_interrupts(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b15b1f5edcea..183b2526b6d2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -331,7 +331,7 @@ static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
-void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
+void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct sof_intel_hda_dev *hdev;
@@ -345,6 +345,7 @@ void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 
 	sdw_intel_process_wakeen_event(hdev->sdw);
 }
+EXPORT_SYMBOL_NS(hda_sdw_process_wakeen_common, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 #else /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 0345c90ead4d..e675ff8a83a5 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -817,6 +817,7 @@ int hda_sdw_startup(struct snd_sof_dev *sdev);
 void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
 bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev);
+void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev);
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
 bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
 
@@ -855,6 +856,10 @@ static inline bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
 	return false;
 }
 
+static inline void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev)
+{
+}
+
 static inline void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 }
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 115866225e05..9b916eb4fc21 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -187,6 +187,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index ca0cb91d2b2c..a7446be36627 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -238,6 +238,7 @@ const struct sof_intel_dsp_desc lnl_chip_info = {
 	.enable_sdw_irq = lnl_enable_sdw_irq,
 	.check_sdw_irq = lnl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 13f780f33c22..b9fc123be75d 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -779,6 +779,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.enable_sdw_irq = mtl_enable_sdw_irq,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
@@ -806,6 +807,7 @@ const struct sof_intel_dsp_desc arl_s_chip_info = {
 	.enable_sdw_irq = mtl_enable_sdw_irq,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 18ce3d33fa80..448ec54a6aa9 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -190,6 +190,7 @@ struct sof_intel_dsp_desc {
 	void (*enable_sdw_irq)(struct snd_sof_dev *sdev, bool enable);
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 	bool (*check_sdw_wakeen_irq)(struct snd_sof_dev *sdev);
+	void (*sdw_process_wakeen)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
 	int (*power_down_dsp)(struct snd_sof_dev *sdev);
 	int (*disable_interrupts)(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 6acc65923834..062327d4f068 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -156,6 +156,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -184,6 +185,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -212,6 +214,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
@@ -240,6 +243,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.sdw_process_wakeen = hda_sdw_process_wakeen_common,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
-- 
2.40.1

