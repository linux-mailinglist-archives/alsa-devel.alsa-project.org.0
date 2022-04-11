Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE34FC5B1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:21:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9953177E;
	Mon, 11 Apr 2022 22:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9953177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708502;
	bh=pWo17U9Y3pAhwuPn2joJ8CpP54ulDCjd9WOoRmvR0i8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fuEX6V748QsTNdNlv+iO72ns6FGovv9i4n+2719+ODICCnwnEqH4nVRkTmpgdSs1w
	 6idPti5x0sAGpWU6830P/u2JHn3z91rqaeN9ByqDaHaI1mAOZAtOatXLuqACR6GINl
	 0jDG+BaH0jxLlmhSkGHLbP6bVKBX+hml/XwIgrqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4704F8055B;
	Mon, 11 Apr 2022 22:18:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7F5BF8053E; Mon, 11 Apr 2022 22:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB76F80511
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB76F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="oJrBIuQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708285; x=1681244285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pWo17U9Y3pAhwuPn2joJ8CpP54ulDCjd9WOoRmvR0i8=;
 b=oJrBIuQ3tVvAVVd6vzZO3jALphnU5gaKuUwATQTW7od2ewNu7YfxHyIr
 1pMUl+7XBeI04hCRbX4GVnH6+IlV4HqlRZaWwAMSJY2hioSczCJqqrtCn
 YfOvC8AYzuSp27Lh27ClK1kiivIMmZOfIdDiR1L93Rf2U/k4VrMjjOROc
 WEoNg8B33LZWBK/A8NxJI5nHvylYnulwv1ZgJ9+LHnqaeBEZ1DpVQCylI
 l3fMNmL//TVxoVS2bZEdt1NklPjXwCSh46gLf+WlE8qf5kjmqzoi1Poxf
 7rhREzXoRipv6jPHMB5fhaWv3wV9UWU6za/yhWG+x35+fMGyusX13+s0+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090843"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090843"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135695"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/16] ASoC: SOF: Intel: hda: define check_ipc_irq op
Date: Mon, 11 Apr 2022 15:17:23 -0500
Message-Id: <20220411201727.77971-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
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

