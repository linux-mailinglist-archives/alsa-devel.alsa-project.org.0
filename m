Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E94625282
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:27:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43806166A;
	Fri, 11 Nov 2022 05:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43806166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140865;
	bh=sD0dT5NhS8PzyWlKcgoNPYtT3Av68O8HdUo5PuTklMM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MLa6nTGBDl+S9ZUpTyUhM4ZCpM5zjr42l4VC9IjGB9Zu5hUberfAV5CdKmIqXFDVx
	 LJ7OFogiIZgQCA7uusayPx5T4GE8UsKQPGQ1SGQXxgI7vumVPyGANh3xXKVCfRrdQJ
	 YbRO6inx1W+2SMBg5Y/VN5zoGd1oF43tZ/j4xxIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEB6DF80571;
	Fri, 11 Nov 2022 05:25:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A2FF800CC; Fri, 11 Nov 2022 05:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45C98F80536
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C98F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xycwz3No"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140718; x=1699676718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sD0dT5NhS8PzyWlKcgoNPYtT3Av68O8HdUo5PuTklMM=;
 b=Xycwz3NoWrDIL4iMCXigOYEQ+xNWnNMHtv33PS+1ASaEtc/GqXtIeU3+
 gCaDYktNGeMyKI4UuY+hh0dTzzaKK4HadrpHPHM/9lAVQ5AyLQ5/qHg1t
 d3LIIT2l1BXZzwYLaK5RKUS/otcR0bb5cbJhZEEdTXNsXCzaf2UFVmIDx
 MiEOjr61WgkV57pgfb793pDHJOCdnt3pibOgzf0GPQMzDyJy8UeXDWZqL
 Wv+d/oQq2I2FZqgimaSwnTrrV6WiLj7rQBk89uQNbNvfXEnBqVZB/TFzm
 TR2M6CjGrFu6ZYJXxguqIB1qPx55W39GWssEHdlxxcMgjcurTfQJKPVAv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923738"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923738"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440750"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440750"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:14 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/8] ASoC: SOF: Intel: hda: add callback to check SoundWire
 lcount information
Date: Fri, 11 Nov 2022 12:26:50 +0800
Message-Id: <20221111042653.45520-6-yung-chuan.liao@linux.intel.com>
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

The number of links is stored in different registers depending on the
IP version, add sdw_check_lcount() callback. This callback only checks
that the number of links supported in hardware is compatible with the
number of links exposed in ACPI _DSD properties.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c  |  2 ++
 sound/soc/sof/intel/hda.c  | 39 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h  |  6 ++++++
 sound/soc/sof/intel/icl.c  |  1 +
 sound/soc/sof/intel/mtl.c  |  1 +
 sound/soc/sof/intel/shim.h |  1 +
 sound/soc/sof/intel/tgl.c  |  4 ++++
 7 files changed, 54 insertions(+)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index cbb6474d5c33..6b075bbe5bfb 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -457,6 +457,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
@@ -491,6 +492,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2dc828866b5b..2f9d69e64091 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -238,10 +238,45 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+	struct sdw_intel_ctx *ctx;
+	u32 caps;
+
+	hdev = sdev->pdata->hw_pdata;
+	ctx = hdev->sdw;
+
+	caps = snd_sof_dsp_read(sdev, HDA_DSP_BAR, ctx->shim_base + SDW_SHIM_LCAP);
+	caps &= SDW_SHIM_LCAP_LCOUNT_MASK;
+
+	/* Check HW supported vs property value */
+	if (caps < ctx->count) {
+		dev_err(sdev->dev,
+			"BIOS master count %d is larger than hardware capabilities %d\n",
+			ctx->count, caps);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hda_sdw_check_lcount(struct snd_sof_dev *sdev)
+{
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->read_sdw_lcount)
+		return chip->read_sdw_lcount(sdev);
+
+	return 0;
+}
+
 int hda_sdw_startup(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev;
 	struct snd_sof_pdata *pdata = sdev->pdata;
+	int ret;
 
 	hdev = sdev->pdata->hw_pdata;
 
@@ -251,6 +286,10 @@ int hda_sdw_startup(struct snd_sof_dev *sdev)
 	if (pdata->machine && !pdata->machine->mach_params.link_mask)
 		return 0;
 
+	ret = hda_sdw_check_lcount(sdev);
+	if (ret < 0)
+		return ret;
+
 	return sdw_intel_startup(hdev->sdw);
 }
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 79fccd7b5bf7..022ce80968dd 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -795,6 +795,7 @@ int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
  */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
+int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev);
 int hda_sdw_startup(struct snd_sof_dev *sdev);
 void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
@@ -803,6 +804,11 @@ bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
 
 #else
 
+static inline int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
 static inline int hda_sdw_startup(struct snd_sof_dev *sdev)
 {
 	return 0;
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index f3aff23a13d2..435941a1692f 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -181,6 +181,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index a0839804a6da..904ae42534e1 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -654,6 +654,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE_ACE,
 	.sdw_alh_base = SDW_ALH_BASE_ACE,
 	.d0i3_offset = MTL_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq = mtl_enable_sdw_irq,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 2e78f27c4207..48428ccbcfe0 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -185,6 +185,7 @@ struct sof_intel_dsp_desc {
 	u32 d0i3_offset;
 	u32 quirks;
 	enum sof_intel_hw_ip_version hw_ip_version;
+	int (*read_sdw_lcount)(struct snd_sof_dev *sdev);
 	void (*enable_sdw_irq)(struct snd_sof_dev *sdev, bool enable);
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index dda89c8ea820..30f2f49ee149 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -136,6 +136,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
@@ -163,6 +164,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
@@ -190,6 +192,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
@@ -217,6 +220,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.d0i3_offset = SOF_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
 	.enable_sdw_irq	= hda_common_enable_sdw_irq,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
-- 
2.25.1

