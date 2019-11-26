Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1E10A05D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:34:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1D01739;
	Tue, 26 Nov 2019 15:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1D01739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574778873;
	bh=tHsM4BNPLnQLnL9e3PI/WS1DlAE1HWCkpCuhiDtl2rw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WW1JU++PcYWXtgE+LrIwI3WFT7RMa6v+Iv0tXyuZsbC9aRcwyl9+ViDaiD27qhHt7
	 fy305WxtQ1tqsa4cG/vu44WkesdNNlSs4rlqLLrMjtiNMcTnIP8AQHY4/r7ExBSPGI
	 VjDnPxUVf4Yv+Kvy9fhw7abW2qlQfj6i8WysGeak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9DECF80253;
	Tue, 26 Nov 2019 15:28:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AACEF8021E; Tue, 26 Nov 2019 15:28:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F35AF801F7
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F35AF801F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="206473486"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.193])
 by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2019 06:28:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 26 Nov 2019 08:28:13 -0600
Message-Id: <20191126142815.21856-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126142815.21856-1-pierre-louis.bossart@linux.intel.com>
References: <20191126142815.21856-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 08/10] ASoC: SOF: remove nocodec_fw_filename
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Remove nocodec_fw_filename from struct sof_dev_desc
as it is not longer needed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h          |  1 -
 sound/soc/sof/sof-acpi-dev.c |  5 -----
 sound/soc/sof/sof-of-dev.c   |  1 -
 sound/soc/sof/sof-pci-dev.c  | 10 ----------
 4 files changed, 17 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 1723478db4a2..98a757d3a67d 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -84,7 +84,6 @@ struct sof_dev_desc {
 	const void *chip_info;
 
 	/* defaults for no codec mode */
-	const char *nocodec_fw_filename;
 	const char *nocodec_tplg_filename;
 
 	/* defaults paths for firmware and topology files */
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 8174b9a7da95..9c0a4eed5cc8 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -46,7 +46,6 @@ static const struct sof_dev_desc sof_acpi_haswell_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-hsw.ri",
-	.nocodec_fw_filename = "sof-hsw.ri",
 	.nocodec_tplg_filename = "sof-hsw-nocodec.tplg",
 	.ops = &sof_hsw_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -64,7 +63,6 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-bdw.ri",
-	.nocodec_fw_filename = "sof-bdw.ri",
 	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
 	.ops = &sof_bdw_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -84,7 +82,6 @@ static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-byt.ri",
-	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -100,7 +97,6 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-byt.ri",
-	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -116,7 +112,6 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cht.ri",
-	.nocodec_fw_filename = "sof-cht.ri",
 	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
 	.ops = &sof_cht_ops,
 	.arch_ops = &sof_xtensa_arch_ops
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 170a5839150f..39ea8af6213f 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -20,7 +20,6 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 	.default_fw_path = "imx/sof",
 	.default_tplg_path = "imx/sof-tplg",
 	.default_fw_filename = "sof-imx8.ri",
-	.nocodec_fw_filename = "sof-imx8.ri",
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
 };
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index c835ee31b53f..c40256c70ea4 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -48,7 +48,6 @@ static const struct sof_dev_desc bxt_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-apl.ri",
-	.nocodec_fw_filename = "sof-apl.ri",
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -67,7 +66,6 @@ static const struct sof_dev_desc glk_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-glk.ri",
-	.nocodec_fw_filename = "sof-glk.ri",
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -96,7 +94,6 @@ static const struct sof_dev_desc tng_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-byt.ri",
-	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt.tplg",
 	.ops = &sof_tng_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -115,7 +112,6 @@ static const struct sof_dev_desc cnl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cnl.ri",
-	.nocodec_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -134,7 +130,6 @@ static const struct sof_dev_desc cfl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cfl.ri",
-	.nocodec_fw_filename = "sof-cfl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -155,7 +150,6 @@ static const struct sof_dev_desc cml_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cml.ri",
-	.nocodec_fw_filename = "sof-cml.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -174,7 +168,6 @@ static const struct sof_dev_desc icl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-icl.ri",
-	.nocodec_fw_filename = "sof-icl.ri",
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -193,7 +186,6 @@ static const struct sof_dev_desc tgl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-tgl.ri",
-	.nocodec_fw_filename = "sof-tgl.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -212,7 +204,6 @@ static const struct sof_dev_desc ehl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-ehl.ri",
-	.nocodec_fw_filename = "sof-ehl.ri",
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -230,7 +221,6 @@ static const struct sof_dev_desc jsl_desc = {
 	.chip_info = &jsl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
-	.nocodec_fw_filename = "sof-jsl.ri",
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
