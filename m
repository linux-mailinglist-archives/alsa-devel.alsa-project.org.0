Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED564C3F53
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77871168D;
	Tue,  1 Oct 2019 20:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77871168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569953136;
	bh=nCXCyLrZayCwfRZG2sCu9+QBYolugvYp38CemPHG2kw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=C6wCVFGAXQOrBqowApsCmmRAdExpfkK09sKEZEpAT3noYKLMECWpMzyHQZUjLm4y7
	 sTb1LOlCZRc9GWAvjMm0pWZNkP0sdg6fZV7B581AQRht0K2JzBCuCuIgXH760qKh4i
	 KzDQGb4UMrlir+6cso3KIuoaiuLtNFM6QbdrD8m4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3636F80713;
	Tue,  1 Oct 2019 19:57:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86E4FF805F8; Tue,  1 Oct 2019 19:57:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4FF1F8063B
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FF1F8063B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="i8Umd+Lk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Uc/HpAiM8ZgLHCo5sXA8wZ5+f4owcA5J3+Cdtx9zvBQ=; b=i8Umd+LkzA/0
 FxEh9Kum4fkAQtO01lMscecLolUYkzmdmZBJGqtRezC1WcRybDsQn2Engu9j3QtKSKNSBHMlsVFCt
 Q5hEfMyFQDSb+gd53L1CEYoVYA9dGCOOkMcuaWO+v1A8I62raA2u4n73hSb8lktH1vreZUh49niQa
 NAmUw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOG-0005tC-U3; Tue, 01 Oct 2019 17:56:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 69C4D2742A30; Tue,  1 Oct 2019 18:56:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190927200538.660-12-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175648.69C4D2742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:48 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: initialise and verify FW
	crash dump data." to the asoc tree
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

   ASoC: SOF: Intel: initialise and verify FW crash dump data.

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From ff2be865633e6fa523cd2db3b73197d795dec991 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:36 -0500
Subject: [PATCH] ASoC: SOF: Intel: initialise and verify FW crash dump data.

FW mailbox offset was not set before use and HDR size was not validated.
Fix this.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-12-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/bdw.c | 7 +++++++
 sound/soc/sof/intel/byt.c | 6 ++++++
 sound/soc/sof/intel/hda.c | 7 +++++++
 3 files changed, 20 insertions(+)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index e282179263e8..80e2826fb447 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -37,6 +37,7 @@
 #define MBOX_SIZE       0x1000
 #define MBOX_DUMP_SIZE 0x30
 #define EXCEPT_OFFSET	0x800
+#define EXCEPT_MAX_HDR_SIZE	0x400
 
 /* DSP peripherals */
 #define DMAC0_OFFSET    0xFE000
@@ -228,6 +229,11 @@ static void bdw_get_registers(struct snd_sof_dev *sdev,
 	/* note: variable AR register array is not read */
 
 	/* then get panic info */
+	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
+		dev_err(sdev->dev, "invalid header size 0x%x. FW oops is bogus\n",
+			xoops->arch_hdr.totalsize);
+		return;
+	}
 	offset += xoops->arch_hdr.totalsize;
 	sof_mailbox_read(sdev, offset, panic_info, sizeof(*panic_info));
 
@@ -451,6 +457,7 @@ static int bdw_probe(struct snd_sof_dev *sdev)
 	/* TODO: add offsets */
 	sdev->mmio_bar = BDW_DSP_BAR;
 	sdev->mailbox_bar = BDW_DSP_BAR;
+	sdev->dsp_oops_offset = MBOX_OFFSET;
 
 	/* PCI base */
 	mmio = platform_get_resource(pdev, IORESOURCE_MEM,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 5e7a6aaa627a..a1e514f71739 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -28,6 +28,7 @@
 #define MBOX_OFFSET		0x144000
 #define MBOX_SIZE		0x1000
 #define EXCEPT_OFFSET		0x800
+#define EXCEPT_MAX_HDR_SIZE	0x400
 
 /* DSP peripherals */
 #define DMAC0_OFFSET		0x098000
@@ -126,6 +127,11 @@ static void byt_get_registers(struct snd_sof_dev *sdev,
 	/* note: variable AR register array is not read */
 
 	/* then get panic info */
+	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
+		dev_err(sdev->dev, "invalid header size 0x%x. FW oops is bogus\n",
+			xoops->arch_hdr.totalsize);
+		return;
+	}
 	offset += xoops->arch_hdr.totalsize;
 	sof_mailbox_read(sdev, offset, panic_info, sizeof(*panic_info));
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c72e9a09eee1..06e84679087b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -35,6 +35,8 @@
 #define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
 #define IS_CNL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x9dc8)
 
+#define EXCEPT_MAX_HDR_SIZE	0x400
+
 /*
  * Debug
  */
@@ -131,6 +133,11 @@ static void hda_dsp_get_registers(struct snd_sof_dev *sdev,
 	/* note: variable AR register array is not read */
 
 	/* then get panic info */
+	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
+		dev_err(sdev->dev, "invalid header size 0x%x. FW oops is bogus\n",
+			xoops->arch_hdr.totalsize);
+		return;
+	}
 	offset += xoops->arch_hdr.totalsize;
 	sof_block_read(sdev, sdev->mmio_bar, offset,
 		       panic_info, sizeof(*panic_info));
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
