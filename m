Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3EC0C76
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:15:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B10261675;
	Fri, 27 Sep 2019 22:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B10261675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615307;
	bh=h1OgYw+TAhcucAeFNFroiaKyCS7PxLVfqTwXR74kAME=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUAJLlK2SmBsBRLkCc7YIY9VD0Iu74MULQv7M/1bKi5mGY/pdax1gRTjNUHN+9C3/
	 TkTPR0gVqCp3tsqEJwymlFVJF5swws9gGp6pjdJMtSAsYLazwtC5gTlR7zjNfGRrcL
	 xgnNADQ0HwW20yrK8PJfaeldP+4T25KVRP3Lu5qM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4D6F806EF;
	Fri, 27 Sep 2019 22:06:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17058F80633; Fri, 27 Sep 2019 22:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C206EF80140
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C206EF80140
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444279"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:37 -0500
Message-Id: <20190927200538.660-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
References: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 12/13] ASoC: SOF: Intel: Add context data to
	any IPC timeout.
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

Helps with FW debug as it provides DSP IPC processing context.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c | 22 +++++++++++++++++++++-
 sound/soc/sof/intel/byt.c | 23 ++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 80e2826fb447..f395d0638876 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -247,7 +247,7 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[BDW_STACK_DUMP_SIZE];
-	u32 status, panic;
+	u32 status, panic, imrx, imrd;
 
 	/* now try generic SOF status messages */
 	status = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IPCD);
@@ -256,6 +256,26 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 			  BDW_STACK_DUMP_SIZE);
 	snd_sof_get_status(sdev, status, panic, &xoops, &panic_info, stack,
 			   BDW_STACK_DUMP_SIZE);
+
+	/* provide some context for firmware debug */
+	imrx = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRX);
+	imrd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRD);
+	dev_err(sdev->dev,
+		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
+		panic & SHIM_IPCX_BUSY ? "yes" : "no",
+		panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
+	dev_err(sdev->dev,
+		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
+		imrx & SHIM_IMRX_BUSY ? "yes" : "no",
+		imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
+	dev_err(sdev->dev,
+		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
+		status & SHIM_IPCD_BUSY ? "yes" : "no",
+		status & SHIM_IPCD_DONE ? "yes" : "no", status);
+	dev_err(sdev->dev,
+		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
+		imrd & SHIM_IMRD_BUSY ? "yes" : "no",
+		imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
 }
 
 /*
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index a1e514f71739..b2597ecfdc1c 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -145,7 +145,7 @@ static void byt_dump(struct snd_sof_dev *sdev, u32 flags)
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[BYT_STACK_DUMP_SIZE];
-	u32 status, panic;
+	u32 status, panic, imrd, imrx;
 
 	/* now try generic SOF status messages */
 	status = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IPCD);
@@ -154,6 +154,27 @@ static void byt_dump(struct snd_sof_dev *sdev, u32 flags)
 			  BYT_STACK_DUMP_SIZE);
 	snd_sof_get_status(sdev, status, panic, &xoops, &panic_info, stack,
 			   BYT_STACK_DUMP_SIZE);
+
+	/* provide some context for firmware debug */
+	imrx = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IMRX);
+	imrd = snd_sof_dsp_read(sdev, BYT_DSP_BAR, SHIM_IMRD);
+	dev_err(sdev->dev,
+		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
+		panic & SHIM_IPCX_BUSY ? "yes" : "no",
+		panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
+	dev_err(sdev->dev,
+		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
+		imrx & SHIM_IMRX_BUSY ? "yes" : "no",
+		imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
+	dev_err(sdev->dev,
+		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
+		status & SHIM_IPCD_BUSY ? "yes" : "no",
+		status & SHIM_IPCD_DONE ? "yes" : "no", status);
+	dev_err(sdev->dev,
+		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
+		imrd & SHIM_IMRD_BUSY ? "yes" : "no",
+		imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
+
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
