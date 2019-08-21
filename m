Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C49857A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 22:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6015A166A;
	Wed, 21 Aug 2019 22:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6015A166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566418869;
	bh=4PTHQeiy2pe4mLnclY1aFNhVAq2sVjUTNVS202i4s0Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgmq25FrkmfxU9xv9KqJxbYF6+q7jwR2bjq8f5sfCdtGRDvNvkZFTPFbxMxhX4CQo
	 mtNvrCU/O53ZHzeXakvG5hF9ggGlbpyf1EJQeJYd+LirGuljZrNcXwvJSD10FYyQz9
	 IMDDWeEumEtaq7LIKu6KJBeKu4qoQGxO35YhVITE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB9C9F805FC;
	Wed, 21 Aug 2019 22:18:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7781F805F9; Wed, 21 Aug 2019 22:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDFA4F805F7
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 22:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDFA4F805F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 13:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="186344192"
Received: from smasango-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.100])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2019 13:17:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 15:17:18 -0500
Message-Id: <20190821201720.17768-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 srinivas.kandagatla@linaro.org, jank@cadence.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, slawomir.blauciak@intel.com
Subject: [alsa-devel] [RFC PATCH 3/5] ASoC: SOF: Intel: hda: add SoundWire
	IP support
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

The Core0 needs to be powered before the SoundWire IP is initialized.

Call sdw_intel_init/exit and store the context. We only have one
context, but depending on the hardware capabilities and BIOS settings
may enable multiple SoundWire links.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 40 +++++++++++++++++++++++++++++++++------
 sound/soc/sof/intel/hda.h |  5 +++++
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a968890d0754..e754058e3679 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -57,6 +57,8 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
 {
 	acpi_handle handle;
 	struct sdw_intel_res res;
+	struct sof_intel_hda_dev *hdev;
+	void *sdw;
 
 	handle = ACPI_HANDLE(sdev->dev);
 
@@ -66,23 +68,32 @@ static int hda_sdw_init(struct snd_sof_dev *sdev)
 	res.irq = sdev->ipc_irq;
 	res.parent = sdev->dev;
 
-	hda_sdw_int_enable(sdev, true);
-
-	sdev->sdw = sdw_intel_init(handle, &res);
-	if (!sdev->sdw) {
+	sdw = sdw_intel_init(handle, &res);
+	if (!sdw) {
 		dev_err(sdev->dev, "SDW Init failed\n");
 		return -EIO;
 	}
 
+	hda_sdw_int_enable(sdev, true);
+
+	/* save context */
+	hdev = sdev->pdata->hw_pdata;
+	hdev->sdw = sdw;
+
 	return 0;
 }
 
 static int hda_sdw_exit(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hdev;
+
+	hdev = sdev->pdata->hw_pdata;
+
 	hda_sdw_int_enable(sdev, false);
 
-	if (sdev->sdw)
-		sdw_intel_exit(sdev->sdw);
+	if (hdev->sdw)
+		sdw_intel_exit(hdev->sdw);
+	hdev->sdw = NULL;
 
 	return 0;
 }
@@ -713,6 +724,21 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
 
+	/* need to power-up core before setting-up capabilities */
+	ret = hda_dsp_core_power_up(sdev, HDA_DSP_CORE_MASK(0));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: could not power-up DSP subsystem\n");
+		goto free_ipc_irq;
+	}
+
+	/* initialize SoundWire capabilities */
+	ret = hda_sdw_init(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: SoundWire get caps error\n");
+		hda_dsp_core_power_down(sdev, HDA_DSP_CORE_MASK(0));
+		goto free_ipc_irq;
+	}
+
 	return 0;
 
 free_ipc_irq:
@@ -744,6 +770,8 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	snd_hdac_ext_bus_device_remove(bus);
 #endif
 
+	hda_sdw_exit(sdev);
+
 	if (!IS_ERR_OR_NULL(hda->dmic_dev))
 		platform_device_unregister(hda->dmic_dev);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index c8f93317aeb4..48e09b7daf0a 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -399,6 +399,11 @@ struct sof_intel_hda_dev {
 
 	/* DMIC device */
 	struct platform_device *dmic_dev;
+
+#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
+	/* sdw context */
+	void *sdw;
+#endif
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
