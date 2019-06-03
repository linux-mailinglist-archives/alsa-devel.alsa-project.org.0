Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4512334FA
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B9381690;
	Mon,  3 Jun 2019 18:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B9381690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579497;
	bh=xA1VPi93irQQEY5wU5RBl10RZtSNv/SOlkGFHGSaV/g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdzVdGiT0gmSEhqVo+bbQhPftlLgxJi5pNWoHpzBbp9V6OjWfSQAa9kkpGFp1hEs6
	 2sa2z99dBWwAkOxoNz583qKa9KZmwuITKxuNppV7Q/6+yJHAzWNKIeHa9bG2Lomcmx
	 TgQHX2ASYw2s2Mfrd8pseVT1gbLQoDfG2mlDBJqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80920F8977B;
	Mon,  3 Jun 2019 18:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82C1FF896DD; Mon,  3 Jun 2019 18:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8DADF8975D
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8DADF8975D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,547,1549958400"; d="scan'208";a="181219137"
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 09:20:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:20:30 -0500
Message-Id: <20190603162032.7626-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
References: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/8] ASoC: SOF: Intel: hda-ipc: re-enable IPC
	IRQ at end of handler
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

Align with Skylake driver and enable the IRQ at end of handler,
instead of at beginning.

Also add an error log if we have nothing to do in this handler.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ipc.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 1f01897fa6e3..04972f27ffe6 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -131,7 +131,6 @@ static bool hda_dsp_ipc_is_sof(uint32_t msg)
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
-	irqreturn_t ret = IRQ_NONE;
 	u32 hipci;
 	u32 hipcie;
 	u32 hipct;
@@ -139,6 +138,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	u32 hipcctl;
 	u32 msg;
 	u32 msg_ext;
+	bool ipc_irq = false;
 
 	/* read IPC status */
 	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
@@ -148,10 +148,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI);
 	hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCTE);
 
-	/* reenable IPC interrupt */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
-				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
-
 	/* is this a reply message from the DSP */
 	if (hipcie & HDA_DSP_REG_HIPCIE_DONE &&
 	    hipcctl & HDA_DSP_REG_HIPCCTL_DONE) {
@@ -196,7 +192,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 
 		spin_unlock_irq(&sdev->ipc_lock);
 
-		ret = IRQ_HANDLED;
+		ipc_irq = true;
 	}
 
 	/* is this a new message from DSP */
@@ -225,10 +221,22 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 
 		hda_dsp_ipc_host_done(sdev);
 
-		ret = IRQ_HANDLED;
+		ipc_irq = true;
 	}
 
-	return ret;
+	if (!ipc_irq) {
+		/*
+		 * This interrupt is not shared so no need to return IRQ_NONE.
+		 */
+		dev_err_ratelimited(sdev->dev,
+				    "error: nothing to do in IRQ thread\n");
+	}
+
+	/* re-enable IPC interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
+
+	return IRQ_HANDLED;
 }
 
 /* is this IRQ for ADSP ? - we only care about IPC here */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
