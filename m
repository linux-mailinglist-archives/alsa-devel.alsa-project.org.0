Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C221D45AB
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 18:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B322823;
	Fri, 11 Oct 2019 18:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B322823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570812360;
	bh=JoVJwVQw6mzvc76WeMuZPfw/87bZ4mY5oPhVnIa8YX8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dk8RArpr9z25RSH7sZiiUVNX2eeKZf4LTC18C89FsIHkengoXPIY6NZXqcFD5NkbX
	 Z4wkwww3J55BOBaPpHf7RfDVOKBLFKMPzd/3zpAFI244PVLnq9V1JIWEcQxLBcIO8i
	 ReP/fWaO5UiweVW9vHbdrZOr64nk6POMvhGf+mwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 130B8F805FA;
	Fri, 11 Oct 2019 18:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C065F80308; Fri, 11 Oct 2019 18:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 512CDF802BE
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 18:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 512CDF802BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 09:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="224387819"
Received: from askelkar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.181.148])
 by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2019 09:43:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 11 Oct 2019 11:43:10 -0500
Message-Id: <20191011164312.7988-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011164312.7988-1-pierre-louis.bossart@linux.intel.com>
References: <20191011164312.7988-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/4] ASoC: SOF: Intel: bdw: fix operator
	precedence warnings
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

Address cppcheck warnings

sound/soc/sof/intel/bdw.c:265:26: style: Clarify calculation precedence
for '&' and '?'. [clarifyCalculation]
  panic & SHIM_IPCX_BUSY ? "yes" : "no",
                         ^

sound/soc/sof/intel/bdw.c:266:26: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
                         ^

sound/soc/sof/intel/bdw.c:269:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrx & SHIM_IMRX_BUSY ? "yes" : "no",
                        ^

sound/soc/sof/intel/bdw.c:270:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
                        ^

sound/soc/sof/intel/bdw.c:273:27: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  status & SHIM_IPCD_BUSY ? "yes" : "no",
                          ^

sound/soc/sof/intel/bdw.c:274:27: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  status & SHIM_IPCD_DONE ? "yes" : "no", status);
                          ^

sound/soc/sof/intel/bdw.c:277:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrd & SHIM_IMRD_BUSY ? "yes" : "no",
                        ^

sound/soc/sof/intel/bdw.c:278:25: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
                        ^

Fixes: 3a9e204d4e369 ("ASoC: SOF: Intel: Add context data to any IPC timeout.")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index f395d0638876..bf961a8798a7 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -262,20 +262,20 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 	imrd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRD);
 	dev_err(sdev->dev,
 		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
-		panic & SHIM_IPCX_BUSY ? "yes" : "no",
-		panic & SHIM_IPCX_DONE ? "yes" : "no", panic);
+		(panic & SHIM_IPCX_BUSY) ? "yes" : "no",
+		(panic & SHIM_IPCX_DONE) ? "yes" : "no", panic);
 	dev_err(sdev->dev,
 		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
-		imrx & SHIM_IMRX_BUSY ? "yes" : "no",
-		imrx & SHIM_IMRX_DONE ? "yes" : "no", imrx);
+		(imrx & SHIM_IMRX_BUSY) ? "yes" : "no",
+		(imrx & SHIM_IMRX_DONE) ? "yes" : "no", imrx);
 	dev_err(sdev->dev,
 		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
-		status & SHIM_IPCD_BUSY ? "yes" : "no",
-		status & SHIM_IPCD_DONE ? "yes" : "no", status);
+		(status & SHIM_IPCD_BUSY) ? "yes" : "no",
+		(status & SHIM_IPCD_DONE) ? "yes" : "no", status);
 	dev_err(sdev->dev,
 		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
-		imrd & SHIM_IMRD_BUSY ? "yes" : "no",
-		imrd & SHIM_IMRD_DONE ? "yes" : "no", imrd);
+		(imrd & SHIM_IMRD_BUSY) ? "yes" : "no",
+		(imrd & SHIM_IMRD_DONE) ? "yes" : "no", imrd);
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
