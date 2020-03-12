Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE61839B5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:41:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C5221765;
	Thu, 12 Mar 2020 20:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C5221765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584042103;
	bh=/t5JLP09lnUPzPFFeMmGtN1KRUyXiR1ytrL2R4pm7y8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cIuD1pfje7cisKu27HrKC8VsLfH6RqnqND8J0yvXNQ4+OTDwaY9DSes48XsHsTZ5P
	 ns840oMZLI4CQ/KQhurf1EnBSdOXPIwaIZaXVJXDoREautf8Fa38OUzRv2eIYz5C/B
	 3rNCKVaIHkb75GiGoW5SMT9GCXYPy/kcVCaUlLtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D75F802EC;
	Thu, 12 Mar 2020 20:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87081F80273; Thu, 12 Mar 2020 20:35:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07392F8023F
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07392F8023F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="243142775"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 12:35:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] Asoc: SOF: Intel: hda: check SoundWire wakeen interrupt
 in irq thread
Date: Thu, 12 Mar 2020 14:33:46 -0500
Message-Id: <20200312193346.3264-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
References: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, srinivas.kandagatla@linaro.org,
 jank@cadence.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
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
index 9c7a816183b6..b5206dc4607a 100644
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
@@ -685,6 +698,9 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_dsp_check_sdw_irq(sdev))
 		hda_dsp_sdw_thread(irq, hdev->sdw);
 
+	if (hda_sdw_check_wakeen_irq(sdev))
+		hda_sdw_process_wakeen(sdev);
+
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				SOF_HDA_INTCTL,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 69717a38913c..53f563aa782d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -234,6 +234,7 @@
 #define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
 
 #define HDA_DSP_REG_ADSPIS2_SNDW	BIT(5)
+#define HDA_DSP_REG_SNDW_WAKE_STS      0x2C192
 
 /* Intel HD Audio Inter-Processor Communication Registers */
 #define HDA_DSP_IPC_BASE		0x40
@@ -710,6 +711,11 @@ static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
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

