Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9D334F8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A7F216A9;
	Mon,  3 Jun 2019 18:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A7F216A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579457;
	bh=GVuOkEzDz0Stj2IRu8ncskgvIKvXWPBt+u0s1m/BW+4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuvwDi+wmE5MeKu9gPW9oecC2Xg0ySRGBEIexLeE5xgkTMZkCRUN/LWhFQEsuROY6
	 pYzYSsArcrbCLq3XNvhbe0RsF+0M0Zkwitwhbj55MpUcH+Q4oy1zAAWVz91TkfPq7T
	 H60uDKt5iyWJrajdzRxEEAMsLkc0C4AnphNwr3kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD48AF89777;
	Mon,  3 Jun 2019 18:21:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17346F896DE; Mon,  3 Jun 2019 18:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D4A8F896ED
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4A8F896ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,547,1549958400"; d="scan'208";a="181219135"
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 09:20:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:20:29 -0500
Message-Id: <20190603162032.7626-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
References: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/8] ASoC: SOF: Intel: hda-ipc: read all IPC
	registers first
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

Align with hardware recommended sequences, and read all IPC registers
before doing any other actions. Playing with BUSY and DONE bits may
invalidate values.

The values read may not actually be necessary but at least this
provides a snapshot of the IPC registers with no consistency issues.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ipc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 728dd1e075a4..1f01897fa6e3 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -145,6 +145,8 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 				  HDA_DSP_REG_HIPCIE);
 	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
 	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL);
+	hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI);
+	hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCTE);
 
 	/* reenable IPC interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
@@ -153,8 +155,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	/* is this a reply message from the DSP */
 	if (hipcie & HDA_DSP_REG_HIPCIE_DONE &&
 	    hipcctl & HDA_DSP_REG_HIPCCTL_DONE) {
-		hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					 HDA_DSP_REG_HIPCI);
 		msg = hipci & HDA_DSP_REG_HIPCI_MSG_MASK;
 		msg_ext = hipcie & HDA_DSP_REG_HIPCIE_MSG_MASK;
 
@@ -202,9 +202,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	/* is this a new message from DSP */
 	if (hipct & HDA_DSP_REG_HIPCT_BUSY &&
 	    hipcctl & HDA_DSP_REG_HIPCCTL_BUSY) {
-
-		hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					  HDA_DSP_REG_HIPCTE);
 		msg = hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
 		msg_ext = hipcte & HDA_DSP_REG_HIPCTE_MSG_MASK;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
