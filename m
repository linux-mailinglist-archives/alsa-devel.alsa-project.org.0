Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 845FF3C7C0B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 04:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E452C1677;
	Wed, 14 Jul 2021 04:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E452C1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626230943;
	bh=+Vp1QtCu5qTJlXxjI4lK/4a4z3QDez/AYzKfDrdA81k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abb1hCrr3Qx32pKC296nP6217ghljvot+q533PAaAMQQ+PgfbEKByNTni5gI9JAkz
	 UDRwBw+jQ0EXRyaA43fpVyTlIFVvEAH1DpJW18BPq0BiiexzRbDdmBLBDCJlqXBTdS
	 rHYIIuUiAyi1AA0ZQdUEJPB/hWpEuJVzEHLrF57w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2A38F804EC;
	Wed, 14 Jul 2021 04:46:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 371DAF804DA; Wed, 14 Jul 2021 04:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 775BEF80253
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 04:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 775BEF80253
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210092389"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="210092389"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="493593206"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/6] ASoC: SOF: intel: add sdw_shim/alh_base to
 sof_intel_dsp_desc
Date: Wed, 14 Jul 2021 10:46:10 +0800
Message-Id: <20210714024614.9357-3-yung-chuan.liao@linux.intel.com>
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

sdw_shim_base and sdw_alh_base are platform-dependent. This change allow
us to define different sdw shim/alh base for each platform.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c  | 4 ++++
 sound/soc/sof/intel/icl.c  | 2 ++
 sound/soc/sof/intel/shim.h | 2 ++
 sound/soc/sof/intel/tgl.c  | 8 ++++++++
 4 files changed, 16 insertions(+)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 821f25fbcf08..acc07cfbc8e3 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -347,6 +347,8 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.rom_init_timeout	= 300,
 	.ssp_count = CNL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE,
+	.sdw_alh_base = SDW_ALH_BASE,
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -363,5 +365,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE,
+	.sdw_alh_base = SDW_ALH_BASE,
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 88a74be8a0c1..74a14b24794c 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -142,5 +142,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE,
+	.sdw_alh_base = SDW_ALH_BASE,
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 529f68d0ca47..ee031248d834 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -164,6 +164,8 @@ struct sof_intel_dsp_desc {
 	int rom_init_timeout;
 	int ssp_count;			/* ssp count of the platform */
 	int ssp_base_offset;		/* base address of the SSPs */
+	u32 sdw_shim_base;
+	u32 sdw_alh_base;
 };
 
 extern const struct snd_sof_dsp_ops sof_tng_ops;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 2ed788304414..73aa45bc6f2b 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -137,6 +137,8 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE,
+	.sdw_alh_base = SDW_ALH_BASE,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -153,6 +155,8 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE,
+	.sdw_alh_base = SDW_ALH_BASE,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -169,6 +173,8 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE,
+	.sdw_alh_base = SDW_ALH_BASE,
 };
 EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -185,5 +191,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.rom_init_timeout	= 300,
 	.ssp_count = ICL_SSP_COUNT,
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE,
+	.sdw_alh_base = SDW_ALH_BASE,
 };
 EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.17.1

