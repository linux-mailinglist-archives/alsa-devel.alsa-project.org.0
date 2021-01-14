Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7661F2F60AD
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 13:00:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A50716BD;
	Thu, 14 Jan 2021 12:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A50716BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610625639;
	bh=H0vI7TMCEw4z2s+j1YbEcjVYRm07UbGyw4IhlP7rNHE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PD4KszShKrEYV/pd9cL/foP8GnXQHjDBkxEpyeB4sBdOxsmNt1YcOOvh4LUgUpRc9
	 2Hu7sMUh8D1Gm9TXUGWut9pyYSMLCyUK3xyAVqg3rTyfbZz7bzd+rvVAp/PwSLH0SP
	 KLlNZIEkCPr6Dy2rzWQF1qokoveu/sAFq4KDNGgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC42AF8025E;
	Thu, 14 Jan 2021 12:59:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9931FF80475; Thu, 14 Jan 2021 12:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D76F80113
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 12:59:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D76F80113
IronPort-SDR: NahoyysdpJdADwf+oBoyMKuFChCIRcWNBHxup6epHwEAgOoJT1XBsPX+1/qMK13+yFbFt82P3A
 DnTefYfd5Gpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="242424575"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="242424575"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 03:59:11 -0800
IronPort-SDR: RsdJy+e+c6nukFvno+XlPZmwDUHGSefyIGP0Q6qcN38XUhDsqPw/VFIzIXc8eujm4dMKsIlw9B
 fks1Q2tKCR0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="349141282"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 14 Jan 2021 03:59:09 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2] ASoC: SOF: Intel: initial support to AlderLake-P
Date: Thu, 14 Jan 2021 13:55:58 +0200
Message-Id: <20210114115558.52699-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

Add PCI id for the AlderLake-P.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

V2 changes:
 - fix compile error if CONFIG_SND_SOC_SOF_TIGERLAKE=n and 
   CONFIG_SND_SOC_SOF_ALDERLAKE is enabled

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 63b989e3ec40..ebd58d49d570 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -213,7 +213,7 @@ static const struct sof_dev_desc icl_desc = {
 };
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE) || IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
 static const struct sof_dev_desc tgl_desc = {
 	.machines               = snd_soc_acpi_intel_tgl_machines,
 	.alt_machines		= snd_soc_acpi_intel_tgl_sdw_machines,
@@ -230,7 +230,9 @@ static const struct sof_dev_desc tgl_desc = {
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 };
+#endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
 static const struct sof_dev_desc tglh_desc = {
 	.machines               = snd_soc_acpi_intel_tgl_machines,
 	.alt_machines		= snd_soc_acpi_intel_tgl_sdw_machines,
@@ -512,6 +514,8 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
 	{ PCI_DEVICE(0x8086, 0x7ad0),
 		.driver_data = (unsigned long)&adls_desc},
+	{ PCI_DEVICE(0x8086, 0x51c8),
+		.driver_data = (unsigned long)&tgl_desc},
 #endif
 	{ 0, }
 };
-- 
2.29.2

