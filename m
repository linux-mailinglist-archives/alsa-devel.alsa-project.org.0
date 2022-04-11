Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE3C4FC5BB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D08715CC;
	Mon, 11 Apr 2022 22:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D08715CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708626;
	bh=0p4MVDCujJhpUBXsCLojHP3nDnSM/F2N1GUJHFk9dH0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lBFLNCzzyaGb61yAFx6SI+VxukuTEyARRhnvtV/aGmL9NQhqK+jmm2duwgFZJZ8PF
	 VNf1oCuEIHeUpOkB/2B546Vk7Vhg7aeC70KWhE9kbW1DgoVomlqc/t9CZzoyhQKzmb
	 MoatRmklJKMNsv+U1f8A+YNKHg9DlZFwYY6F+uqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C27BBF805BE;
	Mon, 11 Apr 2022 22:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1532DF8052D; Mon, 11 Apr 2022 22:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A243F8052D
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A243F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="O2TQJMe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708287; x=1681244287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0p4MVDCujJhpUBXsCLojHP3nDnSM/F2N1GUJHFk9dH0=;
 b=O2TQJMe61Xm8zoMO3oUnMb45le34HQzPgsZ9GCWqkYsBiicMug5cYICZ
 eX9hbWlYt3m+YdWF/3ES4gBzsotFtHKYJeUqCe+WAt6CnndnXPULIE2Px
 Tcj1r4wgTE3+c3y830QkE5XktBin0Pd5bqu0OjTfgDyTcsgCNXCBfRDZ9
 m/Ydb0HWBh7zWhLMFnfxFI98IHtpltT29o67c+UJX6Jls+VZ9TIR9dTIW
 5Yq33R1HHtxyko3su1jufawX1TlBWUfqDzX/AwRR8SuTC0p8TtODyFLua
 dfpucF8U7tg3eKrMXrOLhkFzue5ugjFqLy+mlQhfsndBnin6AczMNbQ7c g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090856"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090856"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:18:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135720"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/16] ASoC: SOF: Intel: add IP identifier
Date: Mon, 11 Apr 2022 15:17:27 -0500
Message-Id: <20220411201727.77971-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/sof/intel/skl.c     |  1 +
 sound/soc/sof/intel/tgl.c     |  4 ++++
 9 files changed, 25 insertions(+)

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
index 8ef027a1fde8..6b4e4b7583eb 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -206,6 +206,7 @@ struct snd_sof_dsp_ops sof_tng_ops = {
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
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index e13c8a4b4634..446a7afddfdb 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -65,5 +65,6 @@ const struct sof_intel_dsp_desc skl_chip_info = {
 	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS_SKL,
 	.rom_init_timeout	= 300,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.hw_ip_version = SOF_INTEL_CAVS_1_5,
 };
 EXPORT_SYMBOL_NS(skl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
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

