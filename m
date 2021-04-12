Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CC35CAE7
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C061607;
	Mon, 12 Apr 2021 18:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C061607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244281;
	bh=ekFz9fEyqqYhjAOZlVpJWFrKWd1jI+N1yf0MjhDX4Xs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opozz4so9/ldFdHEzAhlRa7BvJgD7kLk4T5uBPVce284DRtww1Zl/GvssJvv6wa5U
	 c0R0AWrWhKzQf1f5wo90vn/Znb50kkOGir+PjpG86oPwXTJ4gmUhnmVzQgn+AI4zns
	 w57SbdGlUK5MJmS6RYMrwXHgzYNWXdTM7diZunxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34179F802D2;
	Mon, 12 Apr 2021 18:15:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98133F8032C; Mon, 12 Apr 2021 18:15:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB7E4F800FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB7E4F800FF
IronPort-SDR: zBL8UPYjzJWS0HW5eGrHaLGj80Sjj8EY4biIPYiJiYXaXu0A4RwxFjE53G68LvtOt1UrTOAD/o
 2jZqurBa5qtQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181355519"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="181355519"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:15:31 -0700
IronPort-SDR: E6GEDMpQKeIoFD1Wyn/m8kTag0J81ejNpkTN9wEq/AQ4EbD7CQIG01o3EMtx9PFRc2ujkipAPf
 er9FIR4UdeCg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="398428918"
Received: from pvquach-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.124.143])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 09:15:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: Update ADL P to use its own descriptor
Date: Mon, 12 Apr 2021 11:15:19 -0500
Message-Id: <20210412161519.13508-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412161519.13508-1-pierre-louis.bossart@linux.intel.com>
References: <20210412161519.13508-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>

ADL P has specific machines and hence having its own
table will help separate the machines and FW

Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 18 +++++++++++++++++-
 sound/soc/sof/intel/tgl.c     |  2 +-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 77cc037655f1..88c3bf404dd7 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -86,6 +86,22 @@ static const struct sof_dev_desc adls_desc = {
 	.ops = &sof_tgl_ops,
 };
 
+static const struct sof_dev_desc adl_desc = {
+	.machines               = snd_soc_acpi_intel_adl_machines,
+	.alt_machines           = snd_soc_acpi_intel_adl_sdw_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.resindex_dma_base      = -1,
+	.chip_info = &tgl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-adl.ri",
+	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
+	.ops = &sof_tgl_ops,
+};
+
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0xa0c8), /* TGL-LP */
@@ -99,7 +115,7 @@ static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0x7ad0), /* ADL-S */
 		.driver_data = (unsigned long)&adls_desc},
 	{ PCI_DEVICE(0x8086, 0x51c8), /* ADL-P */
-		.driver_data = (unsigned long)&tgl_desc},
+		.driver_data = (unsigned long)&adl_desc},
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 54ba1b88ba86..2ed788304414 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -125,7 +125,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 EXPORT_SYMBOL_NS(sof_tgl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc tgl_chip_info = {
-	/* Tigerlake */
+	/* Tigerlake , Alderlake */
 	.cores_num = 4,
 	.init_core_mask = 1,
 	.host_managed_cores_mask = BIT(0),
-- 
2.25.1

