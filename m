Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A962527E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:26:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B41F1661;
	Fri, 11 Nov 2022 05:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B41F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140815;
	bh=depyS39p+nqbjkrSWPNdTKa3bhRfj4+k8n/5TB+rs4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5/eULxcCJ3kCk5ZUhjQTj4VblWVXea3KIQh2PDMKDrDl1GHw5RdIGB35m/Uq4yiD
	 679J1Ddy10k9Sl/5BQy+G30fTGFQ379uWN+GzeeWAiQy4iBVyLL24otbeUwWDBW8Jw
	 yjIKm/oTUgBB331I764MpRY4L1AEn1DOqi+bNVjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD2FDF80557;
	Fri, 11 Nov 2022 05:25:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93C92F8051B; Fri, 11 Nov 2022 05:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_MED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF007F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF007F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z5z1QhwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140711; x=1699676711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=depyS39p+nqbjkrSWPNdTKa3bhRfj4+k8n/5TB+rs4I=;
 b=Z5z1QhwG/Ch3AEwJIAKmAl7/T9j1cRMyRJWO2+R30NKoywJPJyPahuza
 I/hxdBF/+JFwpHsUr9S/Rwkixbxa8UM3S7Ux5fDQscBMuyoSvza5C2xtG
 IVtLSm4AtwaXbDPgaCrv9YmRHEZAfm70vV+3gUanUNMPl0fV0mYho1XdB
 Ihz3WnsJFAfibDiqNEEgfVUZW+THUkXffZcSdfi6Yt3iwM33X5ZMN483h
 qlxoBu5Hu/X6dFLeDB8470fTArLCb8HRPjUohFgrz2jZh6ImQgCGRAMEj
 csulkYqoUwF846ehW7b/CHfxFGtszCjaadPLVEzQTsslGedSeD4r7vdF9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923710"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923710"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440690"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440690"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:06 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/8] ASoC: SOF: Intel: hda: add per-chip enable_sdw_irq()
 callback
Date: Fri, 11 Nov 2022 12:26:47 +0800
Message-Id: <20221111042653.45520-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Different generations of Intel hardware rely on different programming
sequences to enable SoundWire IP. In existing hardware, the SoundWire
interrupt is enabled with a register field in the DSP register
space. With HDaudio multi-link extensions registers, the SoundWire
interrupt will be enabled with a generic interrupt enable field in
LCTL, without any dependency on the DSP being enabled.

Add a per-chip callback following the example of the check_sdw_irq()
model already upstream.

Note that the callback is not populated yet for MeteorLake (MTL) since
the interrupts are already enabled in the init. A follow-up patch will
move the functionality to this callback after a couple of cleanups.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c  |  2 ++
 sound/soc/sof/intel/hda.c  | 20 +++++++++++++++++++-
 sound/soc/sof/intel/hda.h  |  6 ++++++
 sound/soc/sof/intel/icl.c  |  1 +
 sound/soc/sof/intel/shim.h |  1 +
 sound/soc/sof/intel/tgl.c  |  4 ++++
 6 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 0aaa44bd49eb..cbb6474d5c33 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -457,6 +457,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -490,6 +491,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 348fbfb6a2c2..2dc828866b5b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -155,9 +155,27 @@ struct sdw_intel_ops sdw_callback = {
 	.free_stream = sdw_free_stream,
 };
 
+void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
+{
+	struct sof_intel_hda_dev *hdev;
+
+	hdev = sdev->pdata->hw_pdata;
+
+	if (!hdev->sdw)
+		return;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC2,
+				HDA_DSP_REG_ADSPIC2_SNDW,
+				enable ? HDA_DSP_REG_ADSPIC2_SNDW : 0);
+}
+
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
-	sdw_intel_enable_irq(sdev->bar[HDA_DSP_BAR], enable);
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->enable_sdw_irq)
+		chip->enable_sdw_irq(sdev, enable);
 }
 
 static int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ea73fd17ae28..79fccd7b5bf7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -294,6 +294,7 @@
 #define HDA_DSP_REG_ADSPIC2		(HDA_DSP_GEN_BASE + 0x10)
 #define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
 
+#define HDA_DSP_REG_ADSPIC2_SNDW	BIT(5)
 #define HDA_DSP_REG_ADSPIS2_SNDW	BIT(5)
 
 /* Intel HD Audio Inter-Processor Communication Registers */
@@ -795,6 +796,7 @@ int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 int hda_sdw_startup(struct snd_sof_dev *sdev);
+void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
 bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
@@ -806,6 +808,10 @@ static inline int hda_sdw_startup(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static inline void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
+{
+}
+
 static inline void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
 }
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 8dd51f489ba1..f3aff23a13d2 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -181,6 +181,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 3e777c500a56..2e78f27c4207 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -185,6 +185,7 @@ struct sof_intel_dsp_desc {
 	u32 d0i3_offset;
 	u32 quirks;
 	enum sof_intel_hw_ip_version hw_ip_version;
+	void (*enable_sdw_irq)(struct snd_sof_dev *sdev, bool enable);
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
 	int (*power_down_dsp)(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 946044f440c9..dda89c8ea820 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -136,6 +136,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -162,6 +163,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -188,6 +190,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -214,6 +217,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
-- 
2.25.1

