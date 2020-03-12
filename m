Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C038A1839AE
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:39:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 598C51764;
	Thu, 12 Mar 2020 20:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 598C51764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584041997;
	bh=CQL2wKKR02g+6H350sBPElzjURuSkzeiPls8j0IDnYw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kR4KRWjt2RRt/jaCjHHvWRQa/4d5Fzl+WbvUhrdyM6dsAC63Z4AZ2gi911V1LKo+t
	 rlopboIMEFX3yVihId/WnpdsrHdZVvA6LknfSR142kJO44J12layL+JgPJb3piOrRL
	 7KMuFv6bnyz65FjVK4EdqPDnTxCSolyzs4CXqJlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D8C9F802D2;
	Thu, 12 Mar 2020 20:35:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B460CF802DB; Thu, 12 Mar 2020 20:35:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AE99F802C3
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE99F802C3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="243142681"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 12:35:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: SOF: Intel: hda: merge IPC,
 stream and SoundWire interrupt handlers
Date: Thu, 12 Mar 2020 14:33:43 -0500
Message-Id: <20200312193346.3264-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
References: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 srinivas.kandagatla@linaro.org, jank@cadence.com,
 Bard liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, slawomir.blauciak@intel.com
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
index 1892f612c11d..f7e5371789f2 100644
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
@@ -619,6 +651,7 @@ static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
 static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 
 	/* deal with streams and controller first */
 	if (hda_dsp_check_stream_irq(sdev))
@@ -627,6 +660,9 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_ipc_irq(sdev))
 		sof_ops(sdev)->irq_thread(irq, sdev);
 
+	if (hda_dsp_check_sdw_irq(sdev))
+		hda_dsp_sdw_thread(irq, hdev->sdw);
+
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				SOF_HDA_INTCTL,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3cf2fb5985b9..2b72eefe1635 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -233,6 +233,8 @@
 #define HDA_DSP_REG_ADSPIC2		(HDA_DSP_GEN_BASE + 0x10)
 #define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
 
+#define HDA_DSP_REG_ADSPIS2_SNDW	BIT(5)
+
 /* Intel HD Audio Inter-Processor Communication Registers */
 #define HDA_DSP_IPC_BASE		0x40
 #define HDA_DSP_REG_HIPCT		(HDA_DSP_IPC_BASE + 0x00)
@@ -697,6 +699,15 @@ static inline void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
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

