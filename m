Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09B501B50
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:50:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A350D18AC;
	Thu, 14 Apr 2022 20:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A350D18AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962245;
	bh=FdYlBJ6KT7Pe0sVTOhuNGyXCNU2MTbf6sTVaX3HKeGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5rwPzlFVOM5xrlCyPxU4soUvd7nMkCFHNJtWe9eNwgWIzrNH5aeluATFflWh4Ol1
	 bvibDMJ7mMOqwlfuaYcjfErqpzFQ1CJYkWqbQOafieh9wZ4fXOAizjg8A5+2X8WQbT
	 vMEJfrRESQi5j8v/0XeVFgZZk1TUcPNNPBp+dnDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC9DF80528;
	Thu, 14 Apr 2022 20:48:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92F42F80528; Thu, 14 Apr 2022 20:48:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5370DF80519
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5370DF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FO74CbtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962133; x=1681498133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FdYlBJ6KT7Pe0sVTOhuNGyXCNU2MTbf6sTVaX3HKeGI=;
 b=FO74CbtZJYPVISkFnbDpFlkrkD927ZXzG2lbrUKuYcn8jgpTBlwQtgXr
 0wz/BKTqfacJxvQb1VlBwFnYdUvlBww8JW6v/8Gr49c1g6zw09//lcCLk
 tW4n04OCSBssHYQZvUMdIXxWGX0kPzW99LCdtMVtRHaKzKWjVWwOi/Zyo
 vJuW+vkq+pvb+vdUn3k4ALFZOgiOftF16KzlBcQUvprJ2ondzM7vrMVMU
 EkEFNEGD5G8IpFigRsnOA5t7HOf8RunhT4X/3kOKIu5fKcZLvJnpKrchm
 n0Z3/ypca7UDdZdLl2JRJdVqB6RpVYlFRkBJdrx9SxECUGPFXLG3T2YLw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442338"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442338"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304615"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/15] ASoC: SOF: add default IPC capability and file paths
Date: Thu, 14 Apr 2022 13:48:05 -0500
Message-Id: <20220414184817.362215-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
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

This patch adds a default IPC type for each platform, along with file
paths to be used for each IPC type. To make reviews simpler, we only
modify platform descriptors in this table, the information will be
used in the next patch.

The Intel IPCv4 is only supported on Intel platforms after APL, and
not by default. In follow-up patches, support for SKL and KBL will be
added, and in those two cases the IPCv4 will be the default (and only
supported mode).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof.h                    |  4 ++++
 sound/soc/sof/amd/pci-rn.c             |  2 ++
 sound/soc/sof/imx/imx8.c               |  4 ++++
 sound/soc/sof/imx/imx8m.c              |  2 ++
 sound/soc/sof/intel/bdw.c              |  2 ++
 sound/soc/sof/intel/byt.c              |  6 ++++++
 sound/soc/sof/intel/pci-apl.c          |  8 ++++++++
 sound/soc/sof/intel/pci-cnl.c          | 12 ++++++++++++
 sound/soc/sof/intel/pci-icl.c          |  8 ++++++++
 sound/soc/sof/intel/pci-tgl.c          | 20 ++++++++++++++++++++
 sound/soc/sof/intel/pci-tng.c          |  2 ++
 sound/soc/sof/mediatek/mt8195/mt8195.c |  2 ++
 12 files changed, 72 insertions(+)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 69066fe064da..a65af85a4074 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -124,6 +124,10 @@ struct sof_dev_desc {
 	/* defaults for no codec mode */
 	const char *nocodec_tplg_filename;
 
+	/* information on supported IPCs */
+	unsigned int ipc_supported_mask;
+	enum sof_ipc_type ipc_default;
+
 	/* defaults paths for firmware and topology files */
 	const char *default_fw_path[SOF_IPC_TYPE_COUNT];
 	const char *default_tplg_path[SOF_IPC_TYPE_COUNT];
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index e2dfe606d3e8..34b153f5cbd8 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -54,6 +54,8 @@ static const struct sof_dev_desc renoir_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info		= &renoir_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "amd/sof",
 	},
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index d2c9e6d45b1b..cdbbd20c95db 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -613,6 +613,8 @@ static const struct snd_sof_dsp_ops sof_imx8x_ops = {
 };
 
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "imx/sof",
 	},
@@ -625,6 +627,8 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 };
 
 static struct sof_dev_desc sof_of_imx8qm_desc = {
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "imx/sof",
 	},
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 7aa695aa9837..cbee484e6a15 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -473,6 +473,8 @@ static const struct snd_sof_dsp_ops sof_imx8m_ops = {
 };
 
 static struct sof_dev_desc sof_of_imx8mp_desc = {
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "imx/sof",
 	},
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index bc06f187cb2e..a0f22b13e6a5 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -646,6 +646,8 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.resindex_imr_base = -1,
 	.irqindex_host_ipc = 0,
 	.chip_info = &bdw_chip_info,
+	.ipc_supported_mask = BIT(SOF_IPC),
+	.ipc_default = SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 	},
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 52815094fcf6..427b5c50bb98 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -388,6 +388,8 @@ static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
 	.resindex_imr_base = 2,
 	.irqindex_host_ipc = 0,
 	.chip_info = &byt_chip_info,
+	.ipc_supported_mask = BIT(SOF_IPC),
+	.ipc_default = SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 	},
@@ -406,6 +408,8 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
 	.resindex_imr_base = 2,
 	.irqindex_host_ipc = 5,
 	.chip_info = &byt_chip_info,
+	.ipc_supported_mask = BIT(SOF_IPC),
+	.ipc_default = SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 	},
@@ -424,6 +428,8 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 	.resindex_imr_base = 2,
 	.irqindex_host_ipc = 5,
 	.chip_info = &cht_chip_info,
+	.ipc_supported_mask = BIT(SOF_IPC),
+	.ipc_default = SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 	},
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 802480a7a4e2..c173f2093b8d 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -27,11 +27,15 @@ static const struct sof_dev_desc bxt_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &apl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/apl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-apl.ri",
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
@@ -46,11 +50,15 @@ static const struct sof_dev_desc glk_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &apl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/glk",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-glk.ri",
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index b8206a93d1f9..b52193929c99 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -28,11 +28,15 @@ static const struct sof_dev_desc cnl_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &cnl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/cnl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
@@ -48,11 +52,15 @@ static const struct sof_dev_desc cfl_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &cnl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/cnl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-cfl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
@@ -68,11 +76,15 @@ static const struct sof_dev_desc cml_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &cnl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/cnl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-cml.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index a27cd4f8ce0c..c1ed81ba08bb 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -28,11 +28,15 @@ static const struct sof_dev_desc icl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &icl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/icl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-icl.ri",
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
@@ -47,11 +51,15 @@ static const struct sof_dev_desc jsl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &jsl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/jsl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-jsl.ri",
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 49d165fdd353..6a4414325041 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -28,11 +28,15 @@ static const struct sof_dev_desc tgl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &tgl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/tgl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-tgl.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
@@ -48,11 +52,15 @@ static const struct sof_dev_desc tglh_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &tglh_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/tgl-h",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-tgl-h.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
@@ -67,11 +75,15 @@ static const struct sof_dev_desc ehl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &ehl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/ehl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-ehl.ri",
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
@@ -87,11 +99,15 @@ static const struct sof_dev_desc adls_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &adls_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/adl-s",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-adl-s.ri",
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
@@ -107,11 +123,15 @@ static const struct sof_dev_desc adl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &tgl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/adl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
 	},
 	.default_fw_filename = "sof-adl.ri",
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index d8d01803739a..18cf9f354fab 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -219,6 +219,8 @@ static const struct sof_dev_desc tng_desc = {
 	.resindex_imr_base	= 0,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &tng_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 	},
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 0982bf158e86..7291538f41ab 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -440,6 +440,8 @@ static const struct snd_sof_dsp_ops sof_mt8195_ops = {
 };
 
 static const struct sof_dev_desc sof_of_mt8195_desc = {
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
 		[SOF_IPC] = "mediatek/sof",
 	},
-- 
2.30.2

