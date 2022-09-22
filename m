Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B35D85E6E8B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F26F847;
	Thu, 22 Sep 2022 23:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F26F847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882774;
	bh=b4QS7eK71lmyeB0OTQ1ZkHA1FjC8wC3uN9AlYqvTB6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/V3od2wo9tErgg1D8IrSbFN4SqGXc2lJgNNNfRDHzU6YVrDpEvzEN1UfmCtCvHq8
	 W4U/LQR6wlINuReOASITonbhRZWbXuQiaofEvWQe2WgDzMYogE7vtY/df7kD2kjDQp
	 hcuMw6ZLpwtCraeBwN4fg00PVhyNsrF0CRHstC3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3CECF8055C;
	Thu, 22 Sep 2022 23:37:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41264F8030F; Thu, 22 Sep 2022 23:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34F0EF8012A
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34F0EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KXTNgaRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882621; x=1695418621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4QS7eK71lmyeB0OTQ1ZkHA1FjC8wC3uN9AlYqvTB6k=;
 b=KXTNgaRwkYmZJqEpuON54Io1Xo3tCctYzdJo6AfYQrsgv6noW3UxSJ6p
 vjz9mhAtfsl1WqxMxmo7ErdT39QxlJ3sDWJT8PetpyEhnrkNRzkMD3eeq
 P1Z3NJvkSSVz/vA39EEeE5+eIPfL5q6eTW1xx47SF7LwS+LQ9E6mgP8Lj
 g4WvflSgwZ8dQdpSUg34HLG3jnZzTKCKjhprT+v+/fgSfO7dsomonGbdf
 fKQ7yVI2P1DKMpXnk8tO+ItGKCSm6eskyuB4OalGi+njTdzSbIKA6PYWu
 Nku7/5//zEGNpK9a4ONLemjSJk+esv+YDP5orEKqg6ZmyV5Qq2CMBLgHG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725787"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725787"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550856"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:51 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ASoC: SOF: Intel: define and set the disable_interrupts
 op for cavs platforms
Date: Thu, 22 Sep 2022 14:36:40 -0700
Message-Id: <20220922213644.666315-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Disable the IPC and SDW nterrupts in the disable_interrupts op for
cavs platforms.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     | 1 +
 sound/soc/sof/intel/cnl.c     | 2 ++
 sound/soc/sof/intel/hda-dsp.c | 8 ++++++++
 sound/soc/sof/intel/hda.h     | 1 +
 sound/soc/sof/intel/icl.c     | 1 +
 sound/soc/sof/intel/skl.c     | 1 +
 sound/soc/sof/intel/tgl.c     | 4 ++++
 7 files changed, 18 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 886eb79ebdf1..44934675ec48 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -105,6 +105,7 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5_PLUS,
 };
 EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index dbdd96901377..d41d02677ea5 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -413,6 +413,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_1_8,
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -444,6 +445,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index f85ac55536fa..2ab2200fc44a 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -989,3 +989,11 @@ int hda_dsp_core_get(struct snd_sof_dev *sdev, int core)
 
 	return ret;
 }
+
+int hda_dsp_disable_interrupts(struct snd_sof_dev *sdev)
+{
+	hda_sdw_int_enable(sdev, false);
+	hda_dsp_ipc_int_disable(sdev);
+
+	return 0;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 65b6faff2153..0b965799ea0d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -587,6 +587,7 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
 void hda_ipc_dump(struct snd_sof_dev *sdev);
 void hda_ipc_irq_dump(struct snd_sof_dev *sdev);
 void hda_dsp_d0i3_work(struct work_struct *work);
+int hda_dsp_disable_interrupts(struct snd_sof_dev *sdev);
 
 /*
  * DSP PCM Operations.
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index ea10ae7a7e1a..f099a018ffb0 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -176,6 +176,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index fdf1814747c4..4ed7a85e6dd0 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -112,6 +112,7 @@ const struct sof_intel_dsp_desc skl_chip_info = {
 	.rom_init_timeout	= 300,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5,
 };
 EXPORT_SYMBOL_NS(skl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 3d675e78c5fe..2f34662015fd 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -131,6 +131,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -155,6 +156,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -179,6 +181,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -203,6 +206,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
 	.cl_init = cl_dsp_init,
 	.power_down_dsp = hda_power_down_dsp,
+	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.25.1

