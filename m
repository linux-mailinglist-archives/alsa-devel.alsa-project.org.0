Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D658361FA2F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 17:43:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D82C1E0;
	Mon,  7 Nov 2022 17:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D82C1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667839429;
	bh=xPF+sdrJSM7X8vU5qJ4WvUUy+gM+2kpykm+xt8JlPmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYz0Tp+lJdFuug3nQ4K/ZDhh/Qj6XMqMxxskxPwbbXrbJusN0sZR/LIhVgyGCgPz2
	 edKD3/5sTF0QiVAHLnjRPG8Cw01iYATjLcR3d17raN6bFxPSiOdIKLtw9x88Lcb+Ax
	 cp59GnGb1ENZSIP2BjyGItzNfWy/nB2/zNfZK5YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E01F800AE;
	Mon,  7 Nov 2022 17:42:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3145AF804C1; Mon,  7 Nov 2022 17:42:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A366F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 17:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A366F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hTRtRVsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667839344; x=1699375344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xPF+sdrJSM7X8vU5qJ4WvUUy+gM+2kpykm+xt8JlPmA=;
 b=hTRtRVsvgQ+j5oMgLaALFNO6/GK5e/A5S6GVLJ7bidmLPD9MjLGVgEkD
 5Dp8Eal33wInOdIHHQZz+PQj36HmZNNHxEDFM0LpzvtqV/qLGV3ljl0WB
 VYiut1pfPJkPPhx2Daecj7ixXbZDTrpc0u+xHNJtsqn6YE6pGMywJyky8
 hCyhr3i1BV0bVOG752DggS6yqKH56qC+3lzbStMcJKEAeVf5jhcvP3Hqm
 sYYUEkVgCwoNRnEsap8bLkRuIiUFz4HbPq45GA84fv0xDylMYiQvWhSSa
 xybaC/pDjtu3YQRrSxveQLf3q84ln1XH4jvie/4w7zR1HMd7Dn9BdDbnX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308081276"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308081276"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 08:42:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="778554123"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="778554123"
Received: from seanabue-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.82.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 08:42:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: SOF: Intel: add d0i3_offset in chip_info
Date: Mon,  7 Nov 2022 10:41:53 -0600
Message-Id: <20221107164154.21925-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107164154.21925-1-pierre-louis.bossart@linux.intel.com>
References: <20221107164154.21925-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

MTL has different d0i3 offset compared to cavs platforms.
Use d0i3_offset to unify the setting.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c  | 1 +
 sound/soc/sof/intel/cnl.c  | 2 ++
 sound/soc/sof/intel/icl.c  | 1 +
 sound/soc/sof/intel/mtl.c  | 1 +
 sound/soc/sof/intel/shim.h | 1 +
 sound/soc/sof/intel/tgl.c  | 4 ++++
 6 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index d93b4ead3c37..0e7a7e4ad976 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -109,6 +109,7 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.rom_init_timeout	= 150,
 	.ssp_count = APL_SSP_COUNT,
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.quirks = SOF_INTEL_PROCEN_FMT_QUIRK,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 2553afe6f27d..0aaa44bd49eb 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -456,6 +456,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -488,6 +489,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index f95b2ec57077..8dd51f489ba1 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -180,6 +180,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 91619036762b..7452a7dbb0e4 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -684,6 +684,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE_ACE,
 	.sdw_alh_base = SDW_ALH_BASE_ACE,
+	.d0i3_offset = MTL_HDA_VS_D0I3C,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 3ceba5c39317..3e777c500a56 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -182,6 +182,7 @@ struct sof_intel_dsp_desc {
 	int ssp_base_offset;		/* base address of the SSPs */
 	u32 sdw_shim_base;
 	u32 sdw_alh_base;
+	u32 d0i3_offset;
 	u32 quirks;
 	enum sof_intel_hw_ip_version hw_ip_version;
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 143447f7c1ac..946044f440c9 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -135,6 +135,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -160,6 +161,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -185,6 +187,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
@@ -210,6 +213,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 	.sdw_shim_base = SDW_SHIM_BASE,
 	.sdw_alh_base = SDW_ALH_BASE,
+	.d0i3_offset = SOF_HDA_VS_D0I3C,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
-- 
2.34.1

