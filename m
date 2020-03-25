Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31A193326
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:57:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9501673;
	Wed, 25 Mar 2020 22:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9501673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173454;
	bh=X9yXKnrkWOyktvLXJhhW3aIgHuEt22U9g7z8gLR5Vys=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rJoKdcJpbP6d6vB3I5cpLTUaOsoAj0VRNGmvRrlnuLvPAx1rAhccUegngPw0Quz9q
	 aQov6zA1YaSZYcp0nmuI9H4eweDoa9LOB7m6FQS8RFulxrdY3eho/GPS6ynAZxAS9g
	 F7XnPnAyoJLlmiWBdqCNX8vM5+BF8JO+7iUfviHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66042F802FF;
	Wed, 25 Mar 2020 22:51:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CCC5F802E8; Wed, 25 Mar 2020 22:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3B75F80291
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3B75F80291
IronPort-SDR: sQstGm6PJ1El8Wxbt4lccARDmss2DEMITWIEqgVcXgq/pVx/sTN6SnO3YqTU1siTTj3Z0bCic/
 t1nfBrXZp/3g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:50:42 -0700
IronPort-SDR: U8iFI9bK/SUUvq/pr147mN1oMksYoMCDXI6r9ZXqzsr/kDp82GsxnB3/f/gItQOL5e/OOmxpU5
 F8OJnRV2F2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="265666191"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2020 14:50:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/11] ASoC: SOF: Intel: hda: merge IPC,
 stream and SoundWire interrupt handlers
Date: Wed, 25 Mar 2020 16:50:23 -0500
Message-Id: <20200325215027.28716-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
References: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We have a single irq handler for SOF interrupts. We can further merge
SoundWire ones to completely remove MSI interrupts handling issues
leading to timeouts.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 36 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h | 11 +++++++++++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index dea3c385b664..ee4f1ceca883 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -198,6 +198,38 @@ static int hda_sdw_exit(struct snd_sof_dev *sdev)
 
 	return 0;
 }
+
+static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+	bool ret = false;
+	u32 irq_status;
+
+	hdev = sdev->pdata->hw_pdata;
+
+	if (!hdev->sdw)
+		return ret;
+
+	/* store status */
+	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIS2);
+
+	/* invalid message ? */
+	if (irq_status == 0xffffffff)
+		goto out;
+
+	/* SDW message ? */
+	if (irq_status & HDA_DSP_REG_ADSPIS2_SNDW)
+		ret = true;
+
+out:
+	return ret;
+}
+
+static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
+{
+	return sdw_intel_thread(irq, context);
+}
+
 #endif
 
 /*
@@ -618,6 +650,7 @@ static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
 static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 
 	/* deal with streams and controller first */
 	if (hda_dsp_check_stream_irq(sdev))
@@ -626,6 +659,9 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_ipc_irq(sdev))
 		sof_ops(sdev)->irq_thread(irq, sdev);
 
+	if (hda_dsp_check_sdw_irq(sdev))
+		hda_dsp_sdw_thread(irq, hdev->sdw);
+
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				SOF_HDA_INTCTL,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 928a3432e9e6..fc104c5ba006 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -232,6 +232,8 @@
 #define HDA_DSP_REG_ADSPIC2		(HDA_DSP_GEN_BASE + 0x10)
 #define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
 
+#define HDA_DSP_REG_ADSPIS2_SNDW	BIT(5)
+
 /* Intel HD Audio Inter-Processor Communication Registers */
 #define HDA_DSP_IPC_BASE		0x40
 #define HDA_DSP_REG_HIPCT		(HDA_DSP_IPC_BASE + 0x00)
@@ -696,6 +698,15 @@ static inline void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
 }
 
+static inline bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+{
+	return false;
+}
+
+static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
+{
+	return IRQ_HANDLED;
+}
 #endif
 
 /* common dai driver */
-- 
2.20.1

