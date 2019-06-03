Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF904334F1
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2A416B2;
	Mon,  3 Jun 2019 18:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2A416B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579417;
	bh=CbAE578FBkqU37TtG1W2+MNopfifesyFZ3XYv0S60/Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PdntrrDSAVXzh2rJzocpNOsY1kWCmwzNG9ojMrFqt91+LQTjIPtx/pVKOg5NH80fZ
	 HyhspRAlnCWa3/6SCV4j+2QBKOAw/R7yPbuFZILcsKphRZoIE8se8ZSUhj0JgVuvIU
	 HE5SV2IzMHW3aSkiPNQHguXb+kV9i9w5T6EiiQ+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 873F6F89772;
	Mon,  3 Jun 2019 18:21:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4099FF8976B; Mon,  3 Jun 2019 18:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0B7FF896DE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B7FF896DE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,547,1549958400"; d="scan'208";a="181219128"
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 09:20:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:20:27 -0500
Message-Id: <20190603162032.7626-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
References: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/8] ASoC: SOF: Intel: cnl-ipc: move code
	around for clarity
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

Move all register access to cnl_ipc_host_done()
No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 1fae75fc313f..4ecba1d8ec7f 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -99,15 +99,6 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 			snd_sof_ipc_msgs_rx(sdev);
 		}
 
-		/*
-		 * clear busy interrupt to tell dsp controller this
-		 * interrupt has been accepted, not trigger it again
-		 */
-		snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
-					       CNL_DSP_REG_HIPCTDR,
-					       CNL_DSP_REG_HIPCTDR_BUSY,
-					       CNL_DSP_REG_HIPCTDR_BUSY);
-
 		cnl_ipc_host_done(sdev);
 
 		ret = IRQ_HANDLED;
@@ -118,6 +109,14 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 
 static void cnl_ipc_host_done(struct snd_sof_dev *sdev)
 {
+	/*
+	 * clear busy interrupt to tell dsp controller this
+	 * interrupt has been accepted, not trigger it again
+	 */
+	snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+				       CNL_DSP_REG_HIPCTDR,
+				       CNL_DSP_REG_HIPCTDR_BUSY,
+				       CNL_DSP_REG_HIPCTDR_BUSY);
 	/*
 	 * set done bit to ack dsp the msg has been
 	 * processed and send reply msg to dsp
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
