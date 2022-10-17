Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BA0601A7E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604452D09;
	Mon, 17 Oct 2022 22:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604452D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666039391;
	bh=RElo47wmE/yzcY2Xn9OnhG9U5VGENaKR3A1O4G5TBuI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f+NuvYJCe7kaj1/x97k4PveublGQlMuuwijeiv3JTXnT0megXlDwVGEh1h1VYtqr0
	 Axa8pNoDql8cbNcPbGI1mC5rHIlpFAM+nBWt6N013Lf0HnbfRzCeHmp/RexV+gJGt0
	 fM1jD36W26WCQZ8CpiRSagXwps76AD4Rn+IIWO1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AEBF804FE;
	Mon, 17 Oct 2022 22:42:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00975F804AD; Mon, 17 Oct 2022 22:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A5CBF8025A
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A5CBF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RhV9TtjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666039323; x=1697575323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RElo47wmE/yzcY2Xn9OnhG9U5VGENaKR3A1O4G5TBuI=;
 b=RhV9TtjHHIxDjg7Q+cdDw8vMqpo8cHH88SdgH/dxMFZfwqvB/QHqw5n8
 YkeDr5UNmzi5/1KMMz9eIiZJGYEtGkED6R7OigT9wx51jeo0Y8crOFt9k
 pOqYmn9+GjX3HycJKIYsmfYEKO+Jd7BypPFK1swRVQJzffw+p37akmTFM
 qBY1eY7m0o8sQtgje7dRsMQHbN9HVdYpxDCTC6fNWT5Y9MpARz4IXi37h
 VnFL5bb/4K1+fS/9WXLRZozKb7dIqHX+Y+YE56JamdZR/LP2ubTiJPR1j
 3EolZsO535B2bsf9EXwuRdyh11l6Cpi9p+fwklab5J+J2vrNhlJSiPdn4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="370114070"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="370114070"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:41:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="873611927"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="873611927"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.140])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:41:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
Date: Mon, 17 Oct 2022 15:41:31 -0500
Message-Id: <20221017204131.207564-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

ADL-N uses a different signing key, which means we can't reuse the
regular ADL descriptor used for ADL-P/M/S.

Fixes: cd57eb3c403cb ("ASoC: SOF: Intel: pci-tgl: add ADL-N support")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 2d63cc236a68e..757a7c6bb770c 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -159,6 +159,37 @@ static const struct sof_dev_desc adl_desc = {
 	.ops_init = sof_tgl_ops_init,
 };
 
+static const struct sof_dev_desc adl_n_desc = {
+	.machines               = snd_soc_acpi_intel_adl_machines,
+	.alt_machines           = snd_soc_acpi_intel_adl_sdw_machines,
+	.use_acpi_target_states = true,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.chip_info = &tgl_chip_info,
+	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
+	.ipc_default		= SOF_IPC,
+	.default_fw_path = {
+		[SOF_IPC] = "intel/sof",
+		[SOF_INTEL_IPC4] = "intel/avs/adl-n",
+	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/adl-n",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "intel/sof-tplg",
+		[SOF_INTEL_IPC4] = "intel/avs-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-adl-n.ri",
+		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+	},
+	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
+	.ops = &sof_tgl_ops,
+	.ops_init = sof_tgl_ops_init,
+};
+
 static const struct sof_dev_desc rpls_desc = {
 	.machines               = snd_soc_acpi_intel_rpl_machines,
 	.alt_machines           = snd_soc_acpi_intel_rpl_sdw_machines,
@@ -246,7 +277,7 @@ static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0x51cf), /* RPL-PX */
 		.driver_data = (unsigned long)&rpl_desc},
 	{ PCI_DEVICE(0x8086, 0x54c8), /* ADL-N */
-		.driver_data = (unsigned long)&adl_desc},
+		.driver_data = (unsigned long)&adl_n_desc},
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
-- 
2.34.1

