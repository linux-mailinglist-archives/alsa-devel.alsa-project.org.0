Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62CC501B5E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 749261909;
	Thu, 14 Apr 2022 20:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 749261909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962380;
	bh=pWo17U9Y3pAhwuPn2joJ8CpP54ulDCjd9WOoRmvR0i8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aURKv96BErQ32+CShow9f3/H+tbZrRq+mW63aMp1F+HzzdT12w8FsqICP2lcdOLwV
	 A9Ytl09AoyRQpnmIC6SiK7T9ufbRZ5BnVpIPQPoW99zP7SE60dYslIzG1W74SlywDr
	 sOaKczyRD9pymW1d7I/T6PTXK/E1XMRpVdyiGzvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7646CF80578;
	Thu, 14 Apr 2022 20:49:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B15F8054A; Thu, 14 Apr 2022 20:49:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC478F80533
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC478F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PhjxVlJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962140; x=1681498140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pWo17U9Y3pAhwuPn2joJ8CpP54ulDCjd9WOoRmvR0i8=;
 b=PhjxVlJVyJHfenwyF/+uCb5sWbKBEfyIAwup3MyrBzX4MerE9j/cEVPy
 Vzfa0CGr9efOsP3RHH8GfOT0h0u7M3zzSxp5XjmX0Gyfwua2htzFkRkfS
 1vxfq6id+kV41x1CiBIOQwu+xdRrtqfbF8Shue5alF9lq1xrN3WvUNe4Y
 L/XO/wykMhqG738CFRle5Zbd664r4qpqfBL9iPpKuO4IsqBiwAm5UhNHE
 wdaj7zt5DkT/Qqhb2bf94XaGUM9BAezd23NEKih9hy8hqtv77/5kARxXa
 lh2joqhlW3g/kinh9GGTHG/9EGP/etLoSvpe2Lpeeh9Xjhn0frNd3CtCL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442361"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442361"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304650"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 12/15] ASoC: SOF: Intel: hda: define check_ipc_irq op
Date: Thu, 14 Apr 2022 13:48:14 -0500
Message-Id: <20220414184817.362215-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Define the check_ipc_irq op for HDA platforms and use it
when checking if it is an IPC IRQ.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/apl.c  |  1 +
 sound/soc/sof/intel/cnl.c  |  2 ++
 sound/soc/sof/intel/hda.c  | 13 ++++++++++++-
 sound/soc/sof/intel/icl.c  |  1 +
 sound/soc/sof/intel/shim.h |  1 +
 sound/soc/sof/intel/tgl.c  |  4 ++++
 6 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index eb471602dae7..b3e3f2494c74 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -75,5 +75,6 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.ssp_count = APL_SSP_COUNT,
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
 	.quirks = SOF_INTEL_PROCEN_FMT_QUIRK,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 21168ebc02cc..ab1f45bfc83b 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -295,6 +295,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -321,5 +322,6 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index da665d15302e..af3693d820fd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -493,6 +493,17 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	}
 }
 
+static bool hda_check_ipc_irq(struct snd_sof_dev *sdev)
+{
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->check_ipc_irq)
+		return chip->check_ipc_irq(sdev);
+
+	return false;
+}
+
 void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
@@ -816,7 +827,7 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_stream_irq(sdev))
 		hda_dsp_stream_threaded_handler(irq, sdev);
 
-	if (hda_dsp_check_ipc_irq(sdev))
+	if (hda_check_ipc_irq(sdev))
 		sof_ops(sdev)->irq_thread(irq, sdev);
 
 	if (hda_dsp_check_sdw_irq(sdev))
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 148d03f4164b..964014239afd 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -140,5 +140,6 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 80c61a7cedf6..fd64377de9a0 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -171,6 +171,7 @@ struct sof_intel_dsp_desc {
 	u32 sdw_alh_base;
 	u32 quirks;
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
+	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
 };
 
 extern struct snd_sof_dsp_ops sof_tng_ops;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 18e01db882f3..d0f805c67d5b 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -111,6 +111,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -130,6 +131,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -149,6 +151,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -168,5 +171,6 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
+	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 };
 EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.30.2

