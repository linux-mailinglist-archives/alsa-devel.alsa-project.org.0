Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB7C0C81
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:15:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43875166C;
	Fri, 27 Sep 2019 22:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43875166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615342;
	bh=8zqr6e1NC/qlR+R1iFelZqYv7HbvwqTl8Rg0j5IcABo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Od9PhBkcaks8IKu4gbBjwX5MUrReX8NeBIFAEexB8cqaB/UHm0H7OANwC+TIEqL/6
	 aCwOh8ZfnqChszYASjaOqnd0NJ5N9K2gyaP13MSKjWpRSUXdVjH4ypfzUnonVwAU1v
	 DVfpzxDvx6YmhdeiqpMO6u4KxT0Q8+oJBFXeMgvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 359CCF806FA;
	Fri, 27 Sep 2019 22:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C5EF80633; Fri, 27 Sep 2019 22:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB41CF80600
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB41CF80600
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444276"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:36 -0500
Message-Id: <20190927200538.660-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
References: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 11/13] ASoC: SOF: Intel: initialise and verify
	FW crash dump data.
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

From: Liam Girdwood <liam.r.girdwood@linux.intel.com>

FW mailbox offset was not set before use and HDR size was not validated.
Fix this.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
