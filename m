Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9D3C7C0E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 04:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D181677;
	Wed, 14 Jul 2021 04:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D181677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626231003;
	bh=nShhwil9duWOcycNbjuBHHbKbSTqOf4wWJUKTia/640=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYVuA41CXQhEmHnwHcDKApJOLXeHaJNVa1vSKcwyVoseXRgDIbZ6nfCqUiLSA3mTV
	 6s1ntXeaJV9/0w9qBF5bocu5UOtcGBlsKkKoyYY81VihSYOq93JfzS6M5Ng66eK6zk
	 iWMHRQEKCvohRiM5mXy4UdWLp208PlkBdIB34/XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F92FF804FD;
	Wed, 14 Jul 2021 04:47:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8200F8025B; Wed, 14 Jul 2021 04:46:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE428F8025B
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 04:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE428F8025B
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210092405"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="210092405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="493593241"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/6] ASoC: SOF: intel: add snd_sof_dsp_check_sdw_irq ops
Date: Wed, 14 Jul 2021 10:46:13 +0800
Message-Id: <20210714024614.9357-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714024614.9357-1-yung-chuan.liao@linux.intel.com>
References: <20210714024614.9357-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

SoundWire IRQ status checks are platform-dependent, add new ops structure
to provide abstraction.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c  |  2 ++
 sound/soc/sof/intel/hda.c  | 13 ++++++++++++-
 sound/soc/sof/intel/hda.h  |  7 +++++++
 sound/soc/sof/intel/icl.c  |  1 +
 sound/soc/sof/intel/shim.h |  1 +
 sound/soc/sof/intel/tgl.c  |  4 ++++
 6 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index acc07cfbc8e3..e115e12a856f 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -349,6 +349,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.check_sdw_irq	= hda_common_check_sdw_irq,
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -367,5 +368,6 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.check_sdw_irq	= hda_common_check_sdw_irq,
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 79388489c4e2..c979581c6812 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -222,7 +222,7 @@ static int hda_sdw_exit(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev;
 	bool ret = false;
@@ -248,6 +248,17 @@ static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+{
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->check_sdw_irq)
+		return chip->check_sdw_irq(sdev);
+
+	return false;
+}
+
 static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 {
 	return sdw_intel_thread(irq, context);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 06ea0006999a..4fdfb108645c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -691,6 +691,7 @@ int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
 int hda_sdw_startup(struct snd_sof_dev *sdev);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
+bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
 
 #else
 
@@ -736,6 +737,12 @@ static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 static inline void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 }
+
+static inline bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
+{
+	return false;
+}
+
 #endif
 
 /* common dai driver */
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 74a14b24794c..ee095b8f2d01 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -144,5 +144,6 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.check_sdw_irq	= hda_common_check_sdw_irq,
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index ee031248d834..e9f7d4d7fcce 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -166,6 +166,7 @@ struct sof_intel_dsp_desc {
 	int ssp_base_offset;		/* base address of the SSPs */
 	u32 sdw_shim_base;
 	u32 sdw_alh_base;
+	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 };
 
 extern const struct snd_sof_dsp_ops sof_tng_ops;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 73aa45bc6f2b..199d41a7dc9b 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -139,6 +139,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.check_sdw_irq	= hda_common_check_sdw_irq,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -157,6 +158,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.check_sdw_irq	= hda_common_check_sdw_irq,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -175,6 +177,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.check_sdw_irq	= hda_common_check_sdw_irq,
 };
 EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -193,5 +196,6 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.check_sdw_irq	= hda_common_check_sdw_irq,
 };
 EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.17.1

