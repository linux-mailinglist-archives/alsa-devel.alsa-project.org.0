Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E8501B55
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:51:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C833418DD;
	Thu, 14 Apr 2022 20:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C833418DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962263;
	bh=thWZcZiDbuWgLUnIjV6RHoLecDqHz8Y9lgW76IIsxB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qO8xBCyDuXsFupvn9gQAS/SSguH273Ic9ZxyBOMDSGJPYfueF80aieSJkeN81Fz0d
	 Nln5uFzyceaCX7xhwJywdad9BHlLs/Upw6BheLleIgspNriIbCvbHMeR+U6GVLAOzv
	 wX/RTzuAtbyN7N9jbBtyzPVhEqp03BTvlKElEzKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52021F80537;
	Thu, 14 Apr 2022 20:49:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47B53F80516; Thu, 14 Apr 2022 20:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66A97F80516
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A97F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N2troWTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962134; x=1681498134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=thWZcZiDbuWgLUnIjV6RHoLecDqHz8Y9lgW76IIsxB4=;
 b=N2troWTDdRVqgEMK5evC5Om7AzLeYXOE5wMwrE6kEhe0EkFNFLVWpSCk
 yRKH/caCFJ9kNR2Agm8YXC7l0aHKKESgCELuy4llsgIq8TdG9GTJqcrL9
 E6APy+8N5mUgiTfNjX6lUrNGzN9b7eHVTv+sFxeYNso6FqGzulHWqGMew
 VHGB0bu5/27QRk31hxyJ78FQVDdhGR6UA+Q7EWbdQE8x8dL/tw8AKpuv1
 ZikAWJ9680jz2y8i0uthsbTnEW3ARp1U4CmfaU2JrQJiKPYnwSLoxI9mY
 p6/EY5Hw7nqVQmK6EvGpb8BAkn+Pb8TGnTaCWtyrCS3J6lniQfkFbbxpT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442341"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442341"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304621"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 04/15] ASoC: SOF: add IPC-dependent file names
Date: Thu, 14 Apr 2022 13:48:06 -0500
Message-Id: <20220414184817.362215-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Chao Song <chao.song@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

To avoid misleading file names, use different names for INTEL_IPC4
firmware files.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
---
 include/sound/sof.h                    |  2 +-
 sound/soc/sof/amd/pci-rn.c             |  4 +++-
 sound/soc/sof/imx/imx8.c               |  8 ++++++--
 sound/soc/sof/imx/imx8m.c              |  4 +++-
 sound/soc/sof/intel/bdw.c              |  4 +++-
 sound/soc/sof/intel/byt.c              | 12 +++++++++---
 sound/soc/sof/intel/hda.c              |  2 +-
 sound/soc/sof/intel/pci-apl.c          | 10 ++++++++--
 sound/soc/sof/intel/pci-cnl.c          | 15 ++++++++++++---
 sound/soc/sof/intel/pci-icl.c          | 10 ++++++++--
 sound/soc/sof/intel/pci-tgl.c          | 25 ++++++++++++++++++++-----
 sound/soc/sof/intel/pci-tng.c          |  4 +++-
 sound/soc/sof/mediatek/mt8195/mt8195.c |  4 +++-
 sound/soc/sof/sof-acpi-dev.c           |  2 +-
 sound/soc/sof/sof-of-dev.c             |  2 +-
 sound/soc/sof/sof-pci-dev.c            | 10 ++++++----
 16 files changed, 88 insertions(+), 30 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index a65af85a4074..96997650be65 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -133,7 +133,7 @@ struct sof_dev_desc {
 	const char *default_tplg_path[SOF_IPC_TYPE_COUNT];
 
 	/* default firmware name */
-	const char *default_fw_filename;
+	const char *default_fw_filename[SOF_IPC_TYPE_COUNT];
 
 	const struct snd_sof_dsp_ops *ops;
 };
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 34b153f5cbd8..b8910bb7f27c 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -62,7 +62,9 @@ static const struct sof_dev_desc renoir_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "amd/sof-tplg",
 	},
-	.default_fw_filename	= "sof-rn.ri",
+	.default_fw_filename	= {
+		[SOF_IPC] = "sof-rn.ri",
+	},
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_renoir_ops,
 };
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index cdbbd20c95db..db53be825384 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -621,7 +621,9 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "imx/sof-tplg",
 	},
-	.default_fw_filename = "sof-imx8x.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-imx8x.ri",
+	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8x_ops,
 };
@@ -635,7 +637,9 @@ static struct sof_dev_desc sof_of_imx8qm_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "imx/sof-tplg",
 	},
-	.default_fw_filename = "sof-imx8.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-imx8.ri",
+	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
 };
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index cbee484e6a15..196ca7d7521f 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -481,7 +481,9 @@ static struct sof_dev_desc sof_of_imx8mp_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "imx/sof-tplg",
 	},
-	.default_fw_filename = "sof-imx8m.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-imx8m.ri",
+	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8m_ops,
 };
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index a0f22b13e6a5..efdc9e6282f3 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -654,7 +654,9 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 	},
-	.default_fw_filename = "sof-bdw.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-bdw.ri",
+	},
 	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
 	.ops = &sof_bdw_ops,
 };
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 427b5c50bb98..748d1452d4d8 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -396,7 +396,9 @@ static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 	},
-	.default_fw_filename = "sof-byt.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-byt.ri",
+	},
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
 };
@@ -416,7 +418,9 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 	},
-	.default_fw_filename = "sof-byt.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-byt.ri",
+	},
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
 };
@@ -436,7 +440,9 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 	},
-	.default_fw_filename = "sof-cht.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-cht.ri",
+	},
 	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
 	.ops = &sof_cht_ops,
 };
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 9c97c80a7f48..da665d15302e 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1274,7 +1274,7 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
 			mach->mach_params.platform = dev_name(sdev->dev);
-			pdata->fw_filename = pdata->desc->default_fw_filename;
+			pdata->fw_filename = pdata->desc->default_fw_filename[pdata->ipc_type];
 			pdata->tplg_filename = mach->sof_tplg_filename;
 
 			/*
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index c173f2093b8d..1f0e509738dc 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -37,7 +37,10 @@ static const struct sof_dev_desc bxt_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-apl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-apl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
 };
@@ -60,7 +63,10 @@ static const struct sof_dev_desc glk_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-glk.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-glk.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
 };
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index b52193929c99..858e8a1bf564 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -38,7 +38,10 @@ static const struct sof_dev_desc cnl_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-cnl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-cnl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 };
@@ -62,7 +65,10 @@ static const struct sof_dev_desc cfl_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-cfl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-cfl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 };
@@ -86,7 +92,10 @@ static const struct sof_dev_desc cml_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-cml.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-cml.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 };
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index c1ed81ba08bb..21bcd5d34b18 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -38,7 +38,10 @@ static const struct sof_dev_desc icl_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-icl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-icl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_icl_ops,
 };
@@ -61,7 +64,10 @@ static const struct sof_dev_desc jsl_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-jsl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-jsl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 };
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 6a4414325041..caefd3000d51 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -38,7 +38,10 @@ static const struct sof_dev_desc tgl_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-tgl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-tgl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 };
@@ -62,7 +65,10 @@ static const struct sof_dev_desc tglh_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-tgl-h.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-tgl-h.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 };
@@ -85,7 +91,10 @@ static const struct sof_dev_desc ehl_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-ehl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-ehl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 };
@@ -109,7 +118,10 @@ static const struct sof_dev_desc adls_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-adl-s.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-adl-s.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 };
@@ -133,7 +145,10 @@ static const struct sof_dev_desc adl_desc = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
-	.default_fw_filename = "sof-adl.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-adl.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 };
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 18cf9f354fab..38ce6fd838b5 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -227,7 +227,9 @@ static const struct sof_dev_desc tng_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 	},
-	.default_fw_filename = "sof-byt.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-byt.ri",
+	},
 	.nocodec_tplg_filename = "sof-byt.tplg",
 	.ops = &sof_tng_ops,
 };
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 7291538f41ab..5085a3ac3da8 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -448,7 +448,9 @@ static const struct sof_dev_desc sof_of_mt8195_desc = {
 	.default_tplg_path = {
 		[SOF_IPC] = "mediatek/sof-tplg",
 	},
-	.default_fw_filename = "sof-mt8195.ri",
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-mt8195.ri",
+	},
 	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
 	.ops = &sof_mt8195_ops,
 };
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 8bbc0c5e7da4..1b04dcb33293 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -74,7 +74,7 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->fw_filename = desc->default_fw_filename;
+	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC];
 
 	/* alternate fw and tplg filenames ? */
 	if (fw_path)
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 9e2fb9a9fa48..53faeccedd4f 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -64,7 +64,7 @@ int sof_of_probe(struct platform_device *pdev)
 
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->fw_filename = desc->default_fw_filename;
+	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC];
 
 	if (fw_path)
 		sof_pdata->fw_filename_prefix = fw_path;
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index a0a7fa6f56bd..470c0ac4a4e0 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -173,7 +173,9 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	sof_pdata->name = pci_name(pci);
 	sof_pdata->desc = desc;
 	sof_pdata->dev = dev;
-	sof_pdata->fw_filename = desc->default_fw_filename;
+
+	sof_pdata->ipc_type = desc->ipc_default;
+	sof_pdata->fw_filename = desc->default_fw_filename[sof_pdata->ipc_type];
 
 	/*
 	 * for platforms using the SOF community key, change the
@@ -193,7 +195,7 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	} else if (dmi_check_system(community_key_platforms)) {
 		sof_pdata->fw_filename_prefix =
 			devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
-				       sof_pdata->desc->default_fw_path[SOF_IPC],
+				       sof_pdata->desc->default_fw_path[sof_pdata->ipc_type],
 				       "community");
 
 		dev_dbg(dev,
@@ -201,14 +203,14 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 			sof_pdata->fw_filename_prefix);
 	} else {
 		sof_pdata->fw_filename_prefix =
-			sof_pdata->desc->default_fw_path[SOF_IPC];
+			sof_pdata->desc->default_fw_path[sof_pdata->ipc_type];
 	}
 
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
 	else
 		sof_pdata->tplg_filename_prefix =
-			sof_pdata->desc->default_tplg_path[SOF_IPC];
+			sof_pdata->desc->default_tplg_path[sof_pdata->ipc_type];
 
 	dmi_check_system(sof_tplg_table);
 	if (sof_override_tplg_name)
-- 
2.30.2

