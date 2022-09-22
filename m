Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1335E6E84
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:38:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30229852;
	Thu, 22 Sep 2022 23:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30229852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882732;
	bh=dEKgCeyogkN6MdELgvodH/3/BrAov6K1dyzwkVaHrU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WcuMQlw4jtmLN48cG0EITD1vs200mWm3p0xh584wJp2wLPfB6cAZl9Rfqx1zvC+jh
	 AuzaILli7pcooFzyUgVk9RB6mTNT0erG53ek9MV3kARVTPYUKMjB+ZgbQ5+K2dOOmQ
	 GkJe35NM1Cq7SaMivszoFbBem1aPNURb4StZtCeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A750F804AA;
	Thu, 22 Sep 2022 23:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D4BBF804E7; Thu, 22 Sep 2022 23:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31B89F80256
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31B89F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EG0fGv/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882619; x=1695418619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dEKgCeyogkN6MdELgvodH/3/BrAov6K1dyzwkVaHrU4=;
 b=EG0fGv/JC0YocOSU1Mh0yKi5QFen0/RDbglMEATYu3Gv+Hr6A6AJhQS+
 LYMhUCS6WV5+h47NlmErSzdnBWHilPi3X/J2BPf6Qnc5iwJabIfP/F/hD
 yBttqUA7UHIWNNqY7STnkaZ/MF1tF9Ii/MUk4ZwTItG72phSYV7g9tAlm
 80LJdoDBw+xjE7toUtygHOJ31iPeULjsNOpqpGWEo2txBPOLBkdz6TyJa
 1VYD2OF8GxpBghROt2iSuC7Rm56VwO4ndMJchUDJcmHa4Y2VB7VbcZKQw
 xvjt4ufWJyM3ECsHFKnwxYaJq5uiuu0eLze489/A42HLjEdddQqlomJCd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725765"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550843"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:50 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/10] ASoC: SOF: Intel: define and set power_down_dsp op for
 HDA platforms
Date: Thu, 22 Sep 2022 14:36:36 -0700
Message-Id: <20220922213644.666315-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Fred Oh <fred.oh@linux.intel.com>

hda_power_down_dsp is set for power_down_dsp op for all HDA platforms.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c | 1 +
 sound/soc/sof/intel/cnl.c | 2 ++
 sound/soc/sof/intel/hda.c | 8 ++++++++
 sound/soc/sof/intel/hda.h | 1 +
 sound/soc/sof/intel/icl.c | 1 +
 sound/soc/sof/intel/skl.c | 1 +
 sound/soc/sof/intel/tgl.c | 4 ++++
 7 files changed, 18 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 295df44be271..886eb79ebdf1 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -104,6 +104,7 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.quirks = SOF_INTEL_PROCEN_FMT_QUIRK,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5_PLUS,
 };
 EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 180001d0a38a..dbdd96901377 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -412,6 +412,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_1_8,
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -442,6 +443,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index f7068a7e2e81..c7fe13dee06c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1219,6 +1219,14 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+int hda_power_down_dsp(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+
+	return hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 				       struct snd_soc_acpi_mach **mach)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2013a94020c6..65b6faff2153 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -567,6 +567,7 @@ int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 				  unsigned int core_mask);
+int hda_power_down_dsp(struct snd_sof_dev *sdev);
 int hda_dsp_core_get(struct snd_sof_dev *sdev, int core);
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 59ce3132fada..ea10ae7a7e1a 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -175,6 +175,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index f05905e00368..fdf1814747c4 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -111,6 +111,7 @@ const struct sof_intel_dsp_desc skl_chip_info = {
 	.rom_status_reg = HDA_DSP_SRAM_REG_ROM_STATUS_SKL,
 	.rom_init_timeout	= 300,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5,
 };
 EXPORT_SYMBOL_NS(skl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 5135e1c7e6cf..3d675e78c5fe 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -130,6 +130,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -153,6 +154,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -176,6 +178,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -199,6 +202,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
+	.power_down_dsp = hda_power_down_dsp,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.25.1

