Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DD4FC5A8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6169E174C;
	Mon, 11 Apr 2022 22:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6169E174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708432;
	bh=b/Er0SUOanSU+72hzRGmPCuWpm91hkcTXlrWVv3xB8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TbwywAdUh4gNmxBdF5pMjFPzAhgdFBOpO7jH0uVSnoWwe/f0KjUXUdwoFF70pQy+u
	 zBOtr0WrRCj3zNI3/v+9s6qxRKASZ5T3tO+Obh8OorPj2nbGvBnO7JWLP5WjIxSn1t
	 Sc8nqrnuWOG/vnr9kHXAOH2ct9Bntzmbu+NaT2YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D2BDF80542;
	Mon, 11 Apr 2022 22:18:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A8E8F804E6; Mon, 11 Apr 2022 22:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD8AF804C1
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD8AF804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q2PfNXvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708279; x=1681244279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b/Er0SUOanSU+72hzRGmPCuWpm91hkcTXlrWVv3xB8s=;
 b=Q2PfNXvsgCqDDxXGPlXpg+S42CnhNIFb64NPaDYR1acYhjmiq50KMonY
 1paYs+191qyLtBe/tcMBONFex2bGJNw72QAFCwuWbO+Fo4+8L95K00lUE
 k7apWAy9UYZd/44zgUvfMQPkuY9krtDiStGOl+ubL4+UJmRXQF+pCzkOb
 qC+VuM3SvL356NFWeN8fB2M/ZnQGvqABgMpQrYUjNOAAcN6dg553OlP/U
 h49wDpSCPKoZcWUVxlXw8/oh1EMx0cv1vgx1H5XJGrnNdDibOqx1FB/J0
 dPk5AiewJ+0b4QbVYJlfPkFROnGQDF2usSpinC/AjovF0JqtzW7o5LzVE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090829"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090829"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135661"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/16] ASoC: SOF: add IPC-dependent file names
Date: Mon, 11 Apr 2022 15:17:15 -0500
Message-Id: <20220411201727.77971-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
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
index 5137600672fe..98dcb1c391ca 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -223,7 +223,9 @@ static const struct sof_dev_desc tng_desc = {
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

