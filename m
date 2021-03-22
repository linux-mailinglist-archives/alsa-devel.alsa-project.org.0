Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6F344BF2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 17:42:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEAF51686;
	Mon, 22 Mar 2021 17:41:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEAF51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616431349;
	bh=wol+Tgw3MzSGXcr8Y6XAFo5yMpI2arRGEZ75zXoocSg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5PUN31z+ICOmvKsLzONtCEL6j20TlODvZgR/VJNT8sMFJwpuDFVo+D0j5DTXqFqP
	 MS/O0v8wv43wFb4+xF7kzK2EV2sgXuRtdq+a3HC6GwMIT93UV6myUYTGbB2ndoTLyW
	 leKiuDeInfSHpaxaUkXTwvsXanM4arygCoxl3WEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24946F804DF;
	Mon, 22 Mar 2021 17:38:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06D28F8025F; Mon, 22 Mar 2021 17:38:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFCF3F80240
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 17:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFCF3F80240
IronPort-SDR: Bq/FqvgQBu/6/UDl6qpo9KpuaSIdjxxeSJdsifs7o6sCR3Hk8FB8JL1ihE3y1+bb+3NVVs/uYh
 ZTUxkd+aBexQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210376646"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="210376646"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:48 -0700
IronPort-SDR: 0VBZOCUy55eTwyW3tCYlT7egJ3SppTqZoE+UF8DXvofiD/zMdYDTW//0ddTvZNXQt5X4Rb4AIo
 1ZK2Ul8BFzQA==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407899141"
Received: from josemari-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.40.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: SOF: Intel: move ELH chip info
Date: Mon, 22 Mar 2021 11:37:28 -0500
Message-Id: <20210322163728.16616-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
References: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

ELH is a derivative of TGL, so it should be exposed in tgl.c for
consistency.

No functional change.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c | 16 ----------------
 sound/soc/sof/intel/tgl.c | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 094cde17a1b7..821f25fbcf08 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -350,22 +350,6 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-const struct sof_intel_dsp_desc ehl_chip_info = {
-	/* Elkhartlake */
-	.cores_num = 4,
-	.init_core_mask = 1,
-	.host_managed_cores_mask = BIT(0),
-	.ipc_req = CNL_DSP_REG_HIPCIDR,
-	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
-	.ipc_ack = CNL_DSP_REG_HIPCIDA,
-	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
-	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
-	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
-	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
-};
-EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-
 const struct sof_intel_dsp_desc jsl_chip_info = {
 	/* Jasperlake */
 	.cores_num = 2,
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 3e46fac53f78..54ba1b88ba86 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -156,6 +156,22 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
+const struct sof_intel_dsp_desc ehl_chip_info = {
+	/* Elkhartlake */
+	.cores_num = 4,
+	.init_core_mask = 1,
+	.host_managed_cores_mask = BIT(0),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
+
 const struct sof_intel_dsp_desc adls_chip_info = {
 	/* Alderlake-S */
 	.cores_num = 2,
-- 
2.25.1

