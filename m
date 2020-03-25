Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFE19332C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:59:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D181167F;
	Wed, 25 Mar 2020 22:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D181167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173547;
	bh=Yz1RluBX7r69bnjHoh9i9DO051Po8prcvlwG/ABkt8A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGX43uR070xb1DC+ttWU7lKXdcEz+BZItngcNF6j10D9F4c+n2Ds/XjgPHteLpAlf
	 +YMw62OnLchVe6dOrSEiipzroqGnQYwpe7VfMmKfE06cDwz+CckwGR3VEtBxUB3JUk
	 cg8Ifd3MaDpUNDBtcmzv1ohrMiayD9fxhdQamW2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D22F80322;
	Wed, 25 Mar 2020 22:51:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9CD1F802EA; Wed, 25 Mar 2020 22:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6B9EF802E0
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6B9EF802E0
IronPort-SDR: 2DeYv/z71NXOCjrQcG7X2PXk6il1lSWjVpu9Ov6WftutZAKLzllEu0xAzhDM6RUatsuxW9K/dL
 +zmSZakYBLdQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:50:45 -0700
IronPort-SDR: 9BZ8s8dVsOs0nBCKF65CvKEDpJOxmAo0W1TnXBBhtpOiMXgpDieznEX+uIJaXntKFTQK+jvC4k
 Sxz1EWgowZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="265666219"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2020 14:50:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 10/11] Asoc: SOF: Intel: hda: check SoundWire wakeen
 interrupt in irq thread
Date: Wed, 25 Mar 2020 16:50:26 -0500
Message-Id: <20200325215027.28716-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
References: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

If pci device is in D0, wakeen interrupt will be
aggregated at cAVS level as interrupt. This commit
check the wakeen status and process it in irq thread

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 16 ++++++++++++++++
 sound/soc/sof/intel/hda.h |  6 ++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7d1aa4c7d82c..211e91e79eae 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -241,6 +241,19 @@ static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 	return sdw_intel_thread(irq, context);
 }
 
+static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+
+	hdev = sdev->pdata->hw_pdata;
+	if (hdev->sdw &&
+	    snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+			     HDA_DSP_REG_SNDW_WAKE_STS))
+		return true;
+
+	return false;
+}
+
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev;
@@ -684,6 +697,9 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_sdw_irq(sdev))
 		hda_dsp_sdw_thread(irq, hdev->sdw);
 
+	if (hda_sdw_check_wakeen_irq(sdev))
+		hda_sdw_process_wakeen(sdev);
+
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				SOF_HDA_INTCTL,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 6f1765b1ed1d..e9825798de77 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -233,6 +233,7 @@
 #define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
 
 #define HDA_DSP_REG_ADSPIS2_SNDW	BIT(5)
+#define HDA_DSP_REG_SNDW_WAKE_STS      0x2C192
 
 /* Intel HD Audio Inter-Processor Communication Registers */
 #define HDA_DSP_IPC_BASE		0x40
@@ -709,6 +710,11 @@ static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
+static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+{
+	return false;
+}
+
 static inline void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
 }
-- 
2.20.1

