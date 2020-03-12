Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352E1839B4
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7201753;
	Thu, 12 Mar 2020 20:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7201753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584042063;
	bh=7HfQ7gRqjbqkPy/YeG0lngl92uGcpuF12Eu/B4zdmMk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BNTD54wckWAegmNdUyRAPczwafOdEJy66/P+DnDkZOOhuZV4IBx1JfXURl7QiPa3a
	 Oaf6ESNyPS03fsF1h12eHhu3gGSWyk9jyqCfVyaY5ynnqEFSRj/+7fboHu4Akn9QG5
	 MIuhA64xaARCbtE5eiELLUmq/25UjbldsB7SrDPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D53FBF802F8;
	Thu, 12 Mar 2020 20:35:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8282AF802F7; Thu, 12 Mar 2020 20:35:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E759F802E7
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E759F802E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="243142761"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 12:35:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: SOF: Intel: hda: add WAKEEN interrupt support for
 SoundWire
Date: Thu, 12 Mar 2020 14:33:45 -0500
Message-Id: <20200312193346.3264-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
References: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
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

When a SoundWire link is in clock stop state, a Slave device may wake
up the Master for some events such as jack detection. The WAKEEN
interrupt will be triggered and processed by the audio pci device.

If audio device is in D3, the interrupt will be routed to PME, or
aggregated at cAVS level as interrupt when audio device is in D0. This
patch only supports D3 case, where the audio pci device will be
resumed by a PME event and the WAKEEN interrupt will be processed
after audio pci device is powered up and ROM is initialized
successfully.

The WAKEEN handling is only enabled after the first boot due to
dependencies on a shim_lock mutex being initialized.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 18 ++++++++++++++++++
 sound/soc/sof/intel/hda.c        | 11 +++++++++++
 sound/soc/sof/intel/hda.h        |  5 +++++
 3 files changed, 34 insertions(+)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 8a37a473f8aa..4549d60d8cf8 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -349,6 +349,24 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		goto cleanup;
 	}
 
+	/*
+	 * When a SoundWire link is in clock stop state, a Slave
+	 * device may trigger in-band wakes for events such as jack
+	 * insertion or acoustic event detection. This event will lead
+	 * to a WAKEEN interrupt, handled by the PCI device and routed
+	 * to PME if the PCI device is in D3. The resume function in
+	 * audio PCI driver will be invoked by ACPI for PME event and
+	 * initialize the device and process WAKEEN interrupt.
+	 *
+	 * The WAKEEN interrupt should be processed ASAP to prevent an
+	 * interrupt flood, otherwise other interrupts, such IPC,
+	 * cannot work normally.  The WAKEEN is handled after the ROM
+	 * is initialized successfully, which ensures power rails are
+	 * enabled before accessing the SoundWire SHIM registers
+	 */
+	if (!sdev->first_boot)
+		hda_sdw_process_wakeen(sdev);
+
 	/*
 	 * at this point DSP ROM has been initialized and
 	 * should be ready for code loading and firmware boot
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 32b02d3b6536..9c7a816183b6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -241,6 +241,17 @@ static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 	return sdw_intel_thread(irq, context);
 }
 
+void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hdev;
+
+	hdev = sdev->pdata->hw_pdata;
+	if (!hdev->sdw)
+		return;
+
+	sdw_intel_process_wakeen_event(hdev->sdw);
+}
+
 #endif
 
 /*
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2b72eefe1635..69717a38913c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -672,6 +672,7 @@ int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
 
 int hda_sdw_startup(struct snd_sof_dev *sdev);
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
+void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
 
 #else
 
@@ -708,6 +709,10 @@ static inline irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 {
 	return IRQ_HANDLED;
 }
+
+static inline void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
+{
+}
 #endif
 
 /* common dai driver */
-- 
2.20.1

