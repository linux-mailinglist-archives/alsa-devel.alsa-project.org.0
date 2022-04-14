Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2444501B68
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81B141935;
	Thu, 14 Apr 2022 20:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81B141935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962443;
	bh=dQ7yGcAnO5Rprw3mKZk+kSiTgfU7TWmPKVa68bZlPHc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CR7gF4WUHF0FZ834ci680TklwmhcZLiGIYLXSewGoqfRGGOumKGTyQEpfTjRMuNwQ
	 s9pVa0g4jKAjgWXoOJ/TSEk+9YMxYfeksw5JTrimADc1PQ9yRc5MRBRrArSEb/2PGu
	 8jsdxV40N86ON78axISLU0JhXzNvuNLBI0C+/Fm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8BCCF805AE;
	Thu, 14 Apr 2022 20:49:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55786F80567; Thu, 14 Apr 2022 20:49:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3987F80539
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3987F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z2LkFuQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962142; x=1681498142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dQ7yGcAnO5Rprw3mKZk+kSiTgfU7TWmPKVa68bZlPHc=;
 b=Z2LkFuQ5YQ5Ht+DsHALsuKf77obus1PhbzpfFlbQiW3qf20mIxMrccFp
 /ZJWLZNApn3xG3TknW6EETsX+vGqMl1QJfHfhO4PHyvBHtnRpIlgzikLe
 rZwj1qMOy6M280tkXTAgMbzZRI0vQvEQr/2IKgN3wn/lY16in5poMTVBr
 UBVSQL2XRm3EnBxMeIvVEL7sbMIAOnrn6rXC4gEbt70t2lKtngX8QPe15
 Gzfr+BT+9bHjrMwnLInOXHjujTTRt7cn5LpqEGhnUHpfuJUh/6AxfkbVe
 j6ACPPBSlKsHT3a+0mn93UJUVfSrfjW7vXrXPXhPyIkzUJH4cTgkqcn5E A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442368"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442368"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304660"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 15/15] ASoC: SOF: Intel: add IP identifier
Date: Thu, 14 Apr 2022 13:48:17 -0500
Message-Id: <20220414184817.362215-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This patch adds an IP identifier for each Intel platform. The
identifier will be used to select different code branches or
constants.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/bdw.c     |  1 +
 sound/soc/sof/intel/byt.c     |  2 ++
 sound/soc/sof/intel/cnl.c     |  2 ++
 sound/soc/sof/intel/icl.c     |  1 +
 sound/soc/sof/intel/pci-tng.c |  1 +
 sound/soc/sof/intel/shim.h    | 12 ++++++++++++
 sound/soc/sof/intel/tgl.c     |  4 ++++
 8 files changed, 24 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 4762846d8a33..cb499f3905ce 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -77,5 +77,6 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
 	.quirks = SOF_INTEL_PROCEN_FMT_QUIRK,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_1_5_PLUS,
 };
 EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 3449eeccd9e8..73a20172bf77 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -637,6 +637,7 @@ static struct snd_sof_dsp_ops sof_bdw_ops = {
 static const struct sof_intel_dsp_desc bdw_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
+	.hw_ip_version = SOF_INTEL_BROADWELL,
 };
 
 static const struct sof_dev_desc sof_acpi_broadwell_desc = {
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 3db125d82a1e..08376e8fdc61 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -295,6 +295,7 @@ static struct snd_sof_dsp_ops sof_byt_ops = {
 static const struct sof_intel_dsp_desc byt_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
+	.hw_ip_version = SOF_INTEL_BAYTRAIL,
 };
 
 /* cherrytrail and braswell ops */
@@ -378,6 +379,7 @@ static struct snd_sof_dsp_ops sof_cht_ops = {
 static const struct sof_intel_dsp_desc cht_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
+	.hw_ip_version = SOF_INTEL_BAYTRAIL,
 };
 
 /* BYTCR uses different IRQ index */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 86b683486f06..f5bac91c335b 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -297,6 +297,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_1_8,
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -325,5 +326,6 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 2e4d371f7860..8dd562696934 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -142,5 +142,6 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index ca313c7db47e..14f11528f069 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -210,6 +210,7 @@ struct snd_sof_dsp_ops sof_tng_ops = {
 const struct sof_intel_dsp_desc tng_chip_info = {
 	.cores_num = 1,
 	.host_managed_cores_mask = 1,
+	.hw_ip_version = SOF_INTEL_TANGIER,
 };
 
 static const struct sof_dev_desc tng_desc = {
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 3eb09941ae6e..1fd7b485d821 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -11,6 +11,17 @@
 #ifndef __SOF_INTEL_SHIM_H
 #define __SOF_INTEL_SHIM_H
 
+enum sof_intel_hw_ip_version {
+	SOF_INTEL_TANGIER,
+	SOF_INTEL_BAYTRAIL,
+	SOF_INTEL_BROADWELL,
+	SOF_INTEL_CAVS_1_5,	/* SkyLake, KabyLake, AmberLake */
+	SOF_INTEL_CAVS_1_5_PLUS,/* ApolloLake, GeminiLake */
+	SOF_INTEL_CAVS_1_8,	/* CannonLake, CometLake, CoffeeLake */
+	SOF_INTEL_CAVS_2_0,	/* IceLake, JasperLake */
+	SOF_INTEL_CAVS_2_5,	/* TigerLake, AlderLake */
+};
+
 /*
  * SHIM registers for BYT, BSW, CHT, BDW
  */
@@ -171,6 +182,7 @@ struct sof_intel_dsp_desc {
 	u32 sdw_shim_base;
 	u32 sdw_alh_base;
 	u32 quirks;
+	enum sof_intel_hw_ip_version hw_ip_version;
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
 };
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 32d7e15126c2..816571305f24 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -113,6 +113,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -134,6 +135,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -155,6 +157,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
@@ -176,5 +179,6 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.30.2

