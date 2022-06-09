Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D6E5441F8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB15205A;
	Thu,  9 Jun 2022 05:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB15205A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745572;
	bh=fXTyITA23lhqxG0HwVULqH9IUeYyu7322kpw8Y+QV+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHKDb7CxEpPiYjiQWgATGPf6O+up2GLMWQPJqruO1u4m899OrLIrBhrdnbZXIV42L
	 37c6Ux4KfuuIp9bu4BVnwhubPl3K9w2C0wH2i2Jf95LcZd8x0hEzCosGCKbq0HegLF
	 eiOCGpualaWhgp0wccUGuymvA9KSUGIelIWcS9Ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 951D8F805C5;
	Thu,  9 Jun 2022 05:27:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD107F805BA; Thu,  9 Jun 2022 05:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB3C1F80552
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB3C1F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WZchBfOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745243; x=1686281243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fXTyITA23lhqxG0HwVULqH9IUeYyu7322kpw8Y+QV+A=;
 b=WZchBfODUY4rvVX5AOKJkelWHE435fqIE62Dn8+Y/n93fA9x862J6HEo
 twcNhvbD/++EbqcpyOlDSDEdLZAjIr09WGupAxrL8R5JgTod3kaayH5Zs
 gx2OcKjEFijsI3Iieo93kVyM2WqUD/VYRIOOtQIMDwVVjZwAD+Xh0UNBC
 fLony8bALnf57dXPxGtvLdfCagRnj/cbrDAHwe8QW0qXFAW3i9eziYuzN
 pWBpgeKD+i4G3dtyKLt27loqdPG6ZvHJ2BQqWNOYztRiiTKAlQmKT0Kuj
 pJG7mkYpEefT1woH2pNhpOQGce8qyHi3jBetwgvn5+2dz2i8+iNzBsYRq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219569"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219569"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260253"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/23] ASoC: SOF: Intel: hda: init NHLT for IPC4
Date: Wed,  8 Jun 2022 20:26:38 -0700
Message-Id: <20220609032643.916882-19-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

Init and save the BIOS NHLT as part of the IPC4 FW data.
Add a kernel module param to override the BIOS NHLT with the NHLT from
the topology. Also, add the ops_free callback for all HDA platforms to
free the NHLT.

Co-developed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/pci-apl.c |  1 +
 sound/soc/sof/intel/pci-cnl.c |  1 +
 sound/soc/sof/intel/pci-icl.c |  1 +
 sound/soc/sof/intel/pci-tgl.c |  1 +
 sound/soc/sof/ipc4-priv.h     |  2 ++
 7 files changed, 35 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 5423667002e5..228079a52c3d 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -10,6 +10,7 @@
 
 #include <sound/pcm_params.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/intel-nhlt.h>
 #include <sound/sof/ipc4/header.h>
 #include <uapi/sound/sof/header.h>
 #include "../ipc4-priv.h"
@@ -18,6 +19,14 @@
 #include "../sof-audio.h"
 #include "hda.h"
 
+/*
+ * The default method is to fetch NHLT from BIOS. With this parameter set
+ * it is possible to override that with NHLT in the SOF topology manifest.
+ */
+static bool hda_use_tplg_nhlt;
+module_param_named(sof_use_tplg_nhlt, hda_use_tplg_nhlt, bool, 0444);
+MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 
 struct hda_pipe_params {
@@ -777,6 +786,9 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 		}
 		break;
 	case SOF_INTEL_IPC4:
+	{
+		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+
 		for (i = 0; i < ops->num_drv; i++) {
 			if (strstr(ops->drv[i].name, "DMIC")) {
 				ops->drv[i].ops = &ipc4_dmic_dai_ops;
@@ -793,12 +805,28 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 				ops->drv[i].ops = &ipc4_hda_dai_ops;
 #endif
 		}
+
+		if (!hda_use_tplg_nhlt)
+			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
+
 		break;
+	}
 	default:
 		break;
 	}
 }
 
+void hda_ops_free(struct snd_sof_dev *sdev)
+{
+	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+
+		if (!hda_use_tplg_nhlt)
+			intel_nhlt_free(ipc4_data->nhlt);
+	}
+}
+EXPORT_SYMBOL_NS(hda_ops_free, SND_SOC_SOF_INTEL_HDA_COMMON);
+
 /*
  * common dai driver for skl+ platforms.
  * some products who use this DAI array only physically have a subset of
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3e0f7b0c586a..59181468e05e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -763,6 +763,7 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_f
 extern int sof_hda_position_quirk;
 
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops);
+void hda_ops_free(struct snd_sof_dev *sdev);
 
 /* IPC4 */
 irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 2de3658eb817..998e219011f0 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -44,6 +44,7 @@ static const struct sof_dev_desc bxt_desc = {
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
 	.ops_init = sof_apl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc glk_desc = {
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 87e587aef9c9..c797356f7028 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -73,6 +73,7 @@ static const struct sof_dev_desc cfl_desc = {
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.ops_init = sof_cnl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc cml_desc = {
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 1c7f16ce531e..48f24f8ace26 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -45,6 +45,7 @@ static const struct sof_dev_desc icl_desc = {
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_icl_ops,
 	.ops_init = sof_icl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc jsl_desc = {
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 58a9bd92a237..ccc44ba3ad94 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -73,6 +73,7 @@ static const struct sof_dev_desc tglh_desc = {
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc ehl_desc = {
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 8dddceaf5eb3..9492fe1796c2 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -18,11 +18,13 @@
  * @manifest_fw_hdr_offset: FW header offset in the manifest
  * @num_fw_modules : Number of modules in base FW
  * @fw_modules: Array of base FW modules
+ * @nhlt: NHLT table either from the BIOS or the topology manifest
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
 	int num_fw_modules;
 	void *fw_modules;
+	void *nhlt;
 };
 
 /**
-- 
2.25.1

