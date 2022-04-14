Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD0D501B4F
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD29018CC;
	Thu, 14 Apr 2022 20:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD29018CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962225;
	bh=PoDgrE0taMijW/vAYgVMYIl6+bkeI87vsWbdg8M0j4s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hve/3/Clb6Riq0y8G2kaSMReZrd1XlVVHsRbsZHDNZfKFUgkGl1mbQvtiSLKLhcLX
	 nWaZPN7Oy15eFTfm0tKbmvxd7uJvNDX2A5W7q1zWBtTqXvdIYRz7zkfrIWj54EuZcr
	 kg/rXvmsly5aLB85R0Md6RGy0ThDVwdFkxe1Ep7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 641ABF804CB;
	Thu, 14 Apr 2022 20:48:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35BE1F804CB; Thu, 14 Apr 2022 20:48:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1A63F80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1A63F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MN0DKr73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962122; x=1681498122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PoDgrE0taMijW/vAYgVMYIl6+bkeI87vsWbdg8M0j4s=;
 b=MN0DKr73Iyr7EhW1RO2iOmjex0R+a6sf1Hs5nKQxxWFsa1hSuwlkCbif
 TCaywqT4DE3E4oXhUpUOuXYjvkvhO0J6SiyA3Zc9rc0TgGefWlzsHsxYx
 Oii4dwjVBwi8Vlklplamt9kO6+S9euDSx4fMKUpexOoaJXlp7uAspGuJ0
 7wZ0eXFXBEurCd+jzoYhboGKECw4K2LDpm38bgNfkIwm2ogV/aKK5odfd
 0RCOqeVpHv7orZMDs0B92tZTuABtCbQi78JvSznWJSPpoO8dc2vUOPYnw
 17xrLdvb7IA+0DOXs+/W3F4PdI0lXkxn1NfLBg83stp2r8JhH6Se9qJ6i A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442335"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442335"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304610"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/15] ASoC: SOF: add path indirection to each IPC type
Date: Thu, 14 Apr 2022 13:48:04 -0500
Message-Id: <20220414184817.362215-3-pierre-louis.bossart@linux.intel.com>
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

With the addition of the IPCv4, we need the ability to select
different paths for firmware and topologies.

First add an indirection. Follow-up patches will add mechanisms to
select a default IPC or override it.

No functionality change in this patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof.h                    |  4 +--
 sound/soc/sof/amd/pci-rn.c             |  8 ++++--
 sound/soc/sof/imx/imx8.c               | 16 ++++++++---
 sound/soc/sof/imx/imx8m.c              |  8 ++++--
 sound/soc/sof/intel/bdw.c              |  8 ++++--
 sound/soc/sof/intel/byt.c              | 24 ++++++++++++----
 sound/soc/sof/intel/pci-apl.c          | 16 ++++++++---
 sound/soc/sof/intel/pci-cnl.c          | 24 ++++++++++++----
 sound/soc/sof/intel/pci-icl.c          | 16 ++++++++---
 sound/soc/sof/intel/pci-tgl.c          | 40 +++++++++++++++++++-------
 sound/soc/sof/intel/pci-tng.c          |  8 ++++--
 sound/soc/sof/mediatek/mt8195/mt8195.c |  8 ++++--
 sound/soc/sof/sof-acpi-dev.c           |  4 +--
 sound/soc/sof/sof-of-dev.c             |  4 +--
 sound/soc/sof/sof-pci-dev.c            |  6 ++--
 15 files changed, 141 insertions(+), 53 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 2658a38be5bd..69066fe064da 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -125,8 +125,8 @@ struct sof_dev_desc {
 	const char *nocodec_tplg_filename;
 
 	/* defaults paths for firmware and topology files */
-	const char *default_fw_path;
-	const char *default_tplg_path;
+	const char *default_fw_path[SOF_IPC_TYPE_COUNT];
+	const char *default_tplg_path[SOF_IPC_TYPE_COUNT];
 
 	/* default firmware name */
 	const char *default_fw_filename;
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 392ffbdf6417..e2dfe606d3e8 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -54,8 +54,12 @@ static const struct sof_dev_desc renoir_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info		= &renoir_chip_info,
-	.default_fw_path	= "amd/sof",
-	.default_tplg_path	= "amd/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "amd/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "amd/sof-tplg",
+	},
 	.default_fw_filename	= "sof-rn.ri",
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_renoir_ops,
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 825bd2b9b7a1..d2c9e6d45b1b 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -613,16 +613,24 @@ static const struct snd_sof_dsp_ops sof_imx8x_ops = {
 };
 
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
-	.default_fw_path = "imx/sof",
-	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "imx/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "imx/sof-tplg",
+	},
 	.default_fw_filename = "sof-imx8x.ri",
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8x_ops,
 };
 
 static struct sof_dev_desc sof_of_imx8qm_desc = {
-	.default_fw_path = "imx/sof",
-	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "imx/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "imx/sof-tplg",
+	},
 	.default_fw_filename = "sof-imx8.ri",
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 803d6be6b4fb..7aa695aa9837 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -473,8 +473,12 @@ static const struct snd_sof_dsp_ops sof_imx8m_ops = {
 };
 
 static struct sof_dev_desc sof_of_imx8mp_desc = {
-	.default_fw_path = "imx/sof",
-	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "imx/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "imx/sof-tplg",
+	},
 	.default_fw_filename = "sof-imx8m.ri",
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8m_ops,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index fb9682b2fe32..bc06f187cb2e 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -646,8 +646,12 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.resindex_imr_base = -1,
 	.irqindex_host_ipc = 0,
 	.chip_info = &bdw_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-bdw.ri",
 	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
 	.ops = &sof_bdw_ops,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index bb84a4aa587a..52815094fcf6 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -388,8 +388,12 @@ static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
 	.resindex_imr_base = 2,
 	.irqindex_host_ipc = 0,
 	.chip_info = &byt_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
@@ -402,8 +406,12 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
 	.resindex_imr_base = 2,
 	.irqindex_host_ipc = 5,
 	.chip_info = &byt_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
@@ -416,8 +424,12 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 	.resindex_imr_base = 2,
 	.irqindex_host_ipc = 5,
 	.chip_info = &cht_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-cht.ri",
 	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
 	.ops = &sof_cht_ops,
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index a023b3cc0af4..802480a7a4e2 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -27,8 +27,12 @@ static const struct sof_dev_desc bxt_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &apl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-apl.ri",
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
@@ -42,8 +46,12 @@ static const struct sof_dev_desc glk_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &apl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-glk.ri",
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 40cf1cd00042..b8206a93d1f9 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -28,8 +28,12 @@ static const struct sof_dev_desc cnl_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &cnl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
@@ -44,8 +48,12 @@ static const struct sof_dev_desc cfl_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &cnl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-cfl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
@@ -60,8 +68,12 @@ static const struct sof_dev_desc cml_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &cnl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-cml.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 39c84121b313..a27cd4f8ce0c 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -28,8 +28,12 @@ static const struct sof_dev_desc icl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &icl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-icl.ri",
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_icl_ops,
@@ -43,8 +47,12 @@ static const struct sof_dev_desc jsl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &jsl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-jsl.ri",
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index feaec251adc8..49d165fdd353 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -28,8 +28,12 @@ static const struct sof_dev_desc tgl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &tgl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-tgl.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -44,8 +48,12 @@ static const struct sof_dev_desc tglh_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &tglh_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-tgl-h.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -59,8 +67,12 @@ static const struct sof_dev_desc ehl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &ehl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-ehl.ri",
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -75,8 +87,12 @@ static const struct sof_dev_desc adls_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &adls_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-adl-s.ri",
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -91,8 +107,12 @@ static const struct sof_dev_desc adl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.chip_info = &tgl_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-adl.ri",
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 7d502cc3ca80..d8d01803739a 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -219,8 +219,12 @@ static const struct sof_dev_desc tng_desc = {
 	.resindex_imr_base	= 0,
 	.irqindex_host_ipc	= -1,
 	.chip_info = &tng_chip_info,
-	.default_fw_path = "intel/sof",
-	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+	},
 	.default_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt.tplg",
 	.ops = &sof_tng_ops,
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index b5e2fd72acfb..0982bf158e86 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -440,8 +440,12 @@ static const struct snd_sof_dsp_ops sof_mt8195_ops = {
 };
 
 static const struct sof_dev_desc sof_of_mt8195_desc = {
-	.default_fw_path = "mediatek/sof",
-	.default_tplg_path = "mediatek/sof-tplg",
+	.default_fw_path = {
+		[SOF_IPC] = "mediatek/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "mediatek/sof-tplg",
+	},
 	.default_fw_filename = "sof-mt8195.ri",
 	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
 	.ops = &sof_mt8195_ops,
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 74982c04497b..8bbc0c5e7da4 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -81,13 +81,13 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 		sof_pdata->fw_filename_prefix = fw_path;
 	else
 		sof_pdata->fw_filename_prefix =
-			sof_pdata->desc->default_fw_path;
+			sof_pdata->desc->default_fw_path[SOF_IPC];
 
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
 	else
 		sof_pdata->tplg_filename_prefix =
-			sof_pdata->desc->default_tplg_path;
+			sof_pdata->desc->default_tplg_path[SOF_IPC];
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_acpi_probe_complete;
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 18c0f3cd0993..9e2fb9a9fa48 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -69,12 +69,12 @@ int sof_of_probe(struct platform_device *pdev)
 	if (fw_path)
 		sof_pdata->fw_filename_prefix = fw_path;
 	else
-		sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path;
+		sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path[SOF_IPC];
 
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
 	else
-		sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path;
+		sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path[SOF_IPC];
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_of_probe_complete;
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 12f5cff22448..a0a7fa6f56bd 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -193,7 +193,7 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	} else if (dmi_check_system(community_key_platforms)) {
 		sof_pdata->fw_filename_prefix =
 			devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
-				       sof_pdata->desc->default_fw_path,
+				       sof_pdata->desc->default_fw_path[SOF_IPC],
 				       "community");
 
 		dev_dbg(dev,
@@ -201,14 +201,14 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 			sof_pdata->fw_filename_prefix);
 	} else {
 		sof_pdata->fw_filename_prefix =
-			sof_pdata->desc->default_fw_path;
+			sof_pdata->desc->default_fw_path[SOF_IPC];
 	}
 
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
 	else
 		sof_pdata->tplg_filename_prefix =
-			sof_pdata->desc->default_tplg_path;
+			sof_pdata->desc->default_tplg_path[SOF_IPC];
 
 	dmi_check_system(sof_tplg_table);
 	if (sof_override_tplg_name)
-- 
2.30.2

