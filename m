Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB7604C20
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 17:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6B0AD81;
	Wed, 19 Oct 2022 17:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6B0AD81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666194644;
	bh=Cz6EHu9m6AKDuZ4W2fKpiibmjr3Avv6KxWZEj5Wdox4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ucIE7JYhdQRGIQIRwQVrCu6GrZAxKNbL+ZBxDHjuEpfFaAtFOk3ArYFzrHErT02Za
	 ayWEbLq4kx+E87Dzmogzruy6K31I6YZCP2ATTB5u2od/pDELspapwGCcaLsuOhwV1N
	 H9CJegVpottcRT60lwG+GhgIi8M/Ywu+5dk4joEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D79F804E0;
	Wed, 19 Oct 2022 17:49:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E63B8F804CC; Wed, 19 Oct 2022 17:49:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F916F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 17:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F916F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NUmTxluj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666194582; x=1697730582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cz6EHu9m6AKDuZ4W2fKpiibmjr3Avv6KxWZEj5Wdox4=;
 b=NUmTxlujCPIEnRddiIabklKNfigmbhJEzTVzK/8pDr3beYYDU/44iEbi
 9cpwXd424xMz/zKqKejE4/jYOKpI5D0q/84tMROnNpHo3yY4pWcOkY8ke
 N7SuoHctNRaNsUxHxSr+KgFn51fWGBzsONNtMsFGT9FxPlZ3kUyEoeCyp
 yLBHBfzCiGUAPW/aJO3wZtODoIFiYwnTdI6TAet1rn2SYmg+Cd0+QgoDy
 q6/yseKUnvgVk16XGhphhW3UjNTufQQvJYKMDbDOWUUrZ1VfrXSDdRElI
 oJ49/wLUkXfpGv/3wQvLDDCVyvFsS5ESVD0XW70ZIo5uO9GcF3YRqfGUf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="392751959"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392751959"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:49:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="660407193"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="660407193"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:49:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
Date: Wed, 19 Oct 2022 10:49:26 -0500
Message-Id: <20221019154926.163539-1-pierre-louis.bossart@linux.intel.com>
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

v2: removed dependency on the series "ASoC: SOF: Intel/IPC4: Support
for external firmware libraries". This patch needs to go in first
since it's a fix

 sound/soc/sof/intel/pci-tgl.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 2d63cc236a68e..4cfe4f242fc5e 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -159,6 +159,34 @@ static const struct sof_dev_desc adl_desc = {
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
@@ -246,7 +274,7 @@ static const struct pci_device_id sof_pci_ids[] = {
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

