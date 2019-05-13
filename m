Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E5B1B640
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 14:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 579E816C8;
	Mon, 13 May 2019 14:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 579E816C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557751573;
	bh=bCI1WrHjrIO6UrutO18Pn2YhCvq1o1ZT/Zx38Y8bUzA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jTWS5yAPDIPeRnZkbKyrFGOD8Hhzt2ZIqc0KcwuU/pyqYwFvsrGXDHjXm1IkX1MSQ
	 0s79A/Z87HfzW5yaZcFClLmxWx3Mkk3EePAB76Xp+QziloYbc87ZwFccygyNZZ+QnA
	 dch7rDkUJ6SZrBYI0GODHhLtEdm3JH+jfdE24UME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15397F89707;
	Mon, 13 May 2019 14:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0A06F89734; Mon, 13 May 2019 14:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4047F8972C
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4047F8972C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HdHjw3tJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qWluXgA7Kh9IP+JADKSjIybIQy0Aeuvkh7NKTOq6kjY=; b=HdHjw3tJNxNf
 2d2a1949kyGt/ft64iBWhkezus3mQ4UPsKGhTia0rETHFn0vBhZH/tBuSWl3x8rh5hfwxyPd3prt9
 L5PCiRRVC3LaOfnfSz7kWKilbIC5kaqI3NAlhL7Eh6XTCh5ld7GLcEbbQ9MFSg+rAlHm4X/n4sTPe
 EJBVU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA69-0006Wm-Ci; Mon, 13 May 2019 12:30:29 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 6720A1129234; Mon, 13 May 2019 13:30:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
In-Reply-To: <20190509201027.3906-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123028.6720A1129234@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:28 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: ICL add Icelake chip info
	struct" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: ICL add Icelake chip info struct

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 630be964b5d8d37d3dff9fc5c8af8a516aa94af0 Mon Sep 17 00:00:00 2001
From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Date: Thu, 9 May 2019 15:10:27 -0500
Subject: [PATCH] ASoC: SOF: Intel: ICL add Icelake chip info struct

Icelake has different count of SSP other than CNL, using
the new defined ICL SSP count, and copy other parameters
from CNL chip info.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/cnl.c   | 19 +++++++++++++++++++
 sound/soc/sof/intel/hda.h   |  1 +
 sound/soc/sof/sof-pci-dev.c |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 08a1a3d3c08d..c059d1170bab 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -266,3 +266,22 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
 };
 EXPORT_SYMBOL(cnl_chip_info);
+
+const struct sof_intel_dsp_desc icl_chip_info = {
+	/* Icelake */
+	.cores_num = 4,
+	.init_core_mask = 1,
+	.cores_mask = HDA_DSP_CORE_MASK(0) |
+				HDA_DSP_CORE_MASK(1) |
+				HDA_DSP_CORE_MASK(2) |
+				HDA_DSP_CORE_MASK(3),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL(icl_chip_info);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 15ea50aff4ea..455046612b94 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -580,5 +580,6 @@ extern const struct snd_sof_dsp_ops sof_skl_ops;
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
 extern const struct sof_intel_dsp_desc skl_chip_info;
+extern const struct sof_intel_dsp_desc icl_chip_info;
 
 #endif
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index d736806c2e0d..e2b19782f01a 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -157,7 +157,7 @@ static const struct sof_dev_desc icl_desc = {
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
 	.resindex_dma_base      = -1,
-	.chip_info = &cnl_chip_info,
+	.chip_info = &icl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.nocodec_fw_filename = "sof-icl.ri",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
