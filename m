Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B39E54C3DD
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 10:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2BA1936;
	Wed, 15 Jun 2022 10:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2BA1936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655282754;
	bh=Qo7/+t9ADRou42mucg7hgrlwgAkQpFuC9YM2UITbd6g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sic1UYDHiqPE/nIt63FJ0Trxvo+7DLc9eu72u3b7egB+cv4+PopkFsDQnGVYzi4OL
	 awJFDtbBjjGkV3tQgL26TBqJsgLY8Tsposf2j+6fsjPW1W4PM3ob0NGQoDjjS69S0A
	 8k+ZfFK91oVAAvxq1ccXoMTI9tgwJ0XZPJvaqMBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBDE2F80533;
	Wed, 15 Jun 2022 10:44:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EA18F8052F; Wed, 15 Jun 2022 10:44:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94037F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 10:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94037F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b/jMUEfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655282647; x=1686818647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qo7/+t9ADRou42mucg7hgrlwgAkQpFuC9YM2UITbd6g=;
 b=b/jMUEfTn/fpim947Zd4oOln2Pt+Kizmu1W9gtvsrWFF++LcZh5M9Oos
 U9jFyDnpL+mU7lc3cP5RerLG1vcchdEEfoEMlrLHMuZ0Qqq/kEOsk8E9i
 VQ5ZQ17SkMgXy7uG1cnJEpu2u/LZP97dVXIMTwg/+sbDxcIxZbg8VRF3m
 5+J7CD9abdyanZcA0QRttM9U1O8Z5LgEsuokPxmynKcngyiUiGbITbQYa
 qwJnsBKNmgmTToeQQBelRwgBvN5jLGly4Tj+g1VPVlUy5MfrBpfN2BWM6
 R/7KSg7nSUQ6gMFRJ5/+JprQvY1yYeQhqRjO6k+pGjF6qEtlOw+j9w9vr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="267573732"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="267573732"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:43:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="640876238"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:43:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 1/2] ASoC: SOC: Intel: introduce cl_init callback
Date: Wed, 15 Jun 2022 16:43:47 +0800
Message-Id: <20220615084348.3489-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220615084348.3489-1-yung-chuan.liao@linux.intel.com>
References: <20220615084348.3489-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

The code loader init sequences are different between versions of
Intel platforms. Have a cl_init callback allows us to reuse the
common code.
No function changed.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  2 ++
 sound/soc/sof/intel/hda-loader.c | 15 ++++++++++++---
 sound/soc/sof/intel/hda.h        |  1 +
 sound/soc/sof/intel/icl.c        |  1 +
 sound/soc/sof/intel/shim.h       |  1 +
 sound/soc/sof/intel/tgl.c        |  4 ++++
 7 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 0cea280a6d2d..084c245a9522 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -101,6 +101,7 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
 	.quirks = SOF_INTEL_PROCEN_FMT_QUIRK,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5_PLUS,
 };
 EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index cd6e5f8a5eb4..ccf46fcd6c9a 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -401,6 +401,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_1_8,
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -430,6 +431,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d3ec5996a9a3..9e99f376f2b3 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -99,7 +99,7 @@ struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned
  * power on all host managed cores and only unstall/run the boot core to boot the
  * DSP then turn off all non boot cores (if any) is powered on.
  */
-static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
+int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -369,9 +369,15 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 
 static int hda_dsp_boot_imr(struct snd_sof_dev *sdev)
 {
+	const struct sof_intel_dsp_desc *chip_info;
 	int ret;
 
-	ret = cl_dsp_init(sdev, 0, true);
+	chip_info = get_chip_info(sdev->pdata);
+	if (chip_info->cl_init)
+		ret = chip_info->cl_init(sdev, 0, true);
+	else
+		ret = -EINVAL;
+
 	if (!ret)
 		hda_sdw_process_wakeen(sdev);
 
@@ -430,7 +436,10 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 			"Attempting iteration %d of Core En/ROM load...\n", i);
 
 		hda->boot_iteration = i + 1;
-		ret = cl_dsp_init(sdev, hext_stream->hstream.stream_tag, false);
+		if (chip_info->cl_init)
+			ret = chip_info->cl_init(sdev, hext_stream->hstream.stream_tag, false);
+		else
+			ret = -EINVAL;
 
 		/* don't retry anymore if successful */
 		if (!ret)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f4e4cd7d7406..8b7f3c07d478 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -602,6 +602,7 @@ struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned
 					      int direction);
 int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		   struct hdac_ext_stream *hext_stream);
+int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
 #define HDA_CL_STREAM_FORMAT 0x40
 
 /* pre and post fw run ops */
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index f19517dffd62..4e37b7fe0627 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -152,6 +152,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 1fd7b485d821..371991fa474f 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -185,6 +185,7 @@ struct sof_intel_dsp_desc {
 	enum sof_intel_hw_ip_version hw_ip_version;
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
+	int (*cl_init)(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
 };
 
 extern struct snd_sof_dsp_ops sof_tng_ops;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index dcad7c382de6..6dfb4786c782 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -127,6 +127,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -149,6 +150,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(tglh_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -171,6 +173,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(ehl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -193,6 +196,7 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.sdw_alh_base = SDW_ALH_BASE,
 	.check_sdw_irq	= hda_common_check_sdw_irq,
 	.check_ipc_irq	= hda_dsp_check_ipc_irq,
+	.cl_init = cl_dsp_init,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
 };
 EXPORT_SYMBOL_NS(adls_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.17.1

