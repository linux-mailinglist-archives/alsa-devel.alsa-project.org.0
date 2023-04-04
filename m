Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8196D5BC0
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AEA27F8;
	Tue,  4 Apr 2023 11:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AEA27F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600180;
	bh=Bwr0yu93XpTHCjLm4rVA1DTXsdRkfqA3pX28Vd6D058=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ck1cr5VvlkTx4tSk3F+zVSQmtoRhcX9gv6aFDEKG76B+O3kmN3qaWDrrLryxHIdnr
	 xKKlrm8u/DeqFfJYT3XN75tXS2MN1HGZiZEkAnV0e9mb/Lngxw6MwHCCxBI0+odMAx
	 ubi5/NeCQv2kbSYPWYuy1LinuhJc8344cr5GAuCM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1BAF8015B;
	Tue,  4 Apr 2023 11:21:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFF66F80558; Tue,  4 Apr 2023 11:21:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BBC5F8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BBC5F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z52Qbw+u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600059; x=1712136059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bwr0yu93XpTHCjLm4rVA1DTXsdRkfqA3pX28Vd6D058=;
  b=Z52Qbw+uvEqa5UkFgNtGW2pN9llNYwESxcLwO1wRfrJg3DeOs9YpMVsO
   egaGJk+CnMMk15ONzG45U6Tlsebv51Ypx1Cd5zCL+aFPfJYIp/+1IWuFv
   7+oyZ59iYRRSPcPKQo8+ayYIW3kLpTZFou6z3f3U9Xy7qzSCxb231I771
   pMr9hFjNwqhLOkP8V+wbCRXsBLpAzFbGd+ptAtm8nZw00I/8rTy25tyWP
   EZiRkw9kPNEGgDiF5fV1dzWregRkmkxh8nQlO7OB0ppBr/uh3gJfExsoF
   5rHDBcRS7mdV1T3Vkpa6pB31X1sFaJYJr0ol+awiWXwfdr+uvDKHatmG/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620591"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620591"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820035"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820035"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 06/12] ASoC: SOF: Intel: hda: make DSPless mode work with DSP
 disabled in BIOS
Date: Tue,  4 Apr 2023 12:21:09 +0300
Message-Id: <20230404092115.27949-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QUO7PFLMQUMDWRFYBYMXP4OG6KIZ6Y5I
X-Message-ID-Hash: QUO7PFLMQUMDWRFYBYMXP4OG6KIZ6Y5I
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUO7PFLMQUMDWRFYBYMXP4OG6KIZ6Y5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When the DSP is disabled in the BIOS, the DSP_BAR and PP_BAR cannot be
accessed.

One possible objection noted in initial reviews is that this patch
adds a number of branches. However the number of branches is actually
limited in probe/suspend/resume routines mostly, so there isn't really
a degradation in terms of readability and maintainability. Adding yet
another level of abstraction/ops/callbacks would increase complexity
and not really help in terms of code reuse or readability and
maintainability. A split between controller and DSP driver would be
even more invasive.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c    | 30 +++++++---
 sound/soc/sof/intel/hda-ipc.c    |  3 +
 sound/soc/sof/intel/hda-stream.c | 25 +++++----
 sound/soc/sof/intel/hda.c        | 94 +++++++++++++++++++++++---------
 4 files changed, 107 insertions(+), 45 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index c9231aeacc53..23c05e6f424a 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -321,6 +321,9 @@ void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 
+	if (sdev->dspless_mode_selected)
+		return;
+
 	/* enable IPC DONE and BUSY interrupts */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
 			HDA_DSP_REG_HIPCCTL_DONE | HDA_DSP_REG_HIPCCTL_BUSY,
@@ -336,6 +339,9 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 
+	if (sdev->dspless_mode_selected)
+		return;
+
 	/* disable IPC interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
 				HDA_DSP_ADSPIC_IPC, 0);
@@ -681,6 +687,9 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	/* power down all hda links */
 	hda_bus_ml_suspend(bus);
 
+	if (sdev->dspless_mode_selected)
+		goto skip_dsp;
+
 	ret = chip->power_down_dsp(sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to power down DSP during suspend\n");
@@ -694,6 +703,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	/* disable ppcap interrupt */
 	hda_dsp_ctrl_ppcap_enable(sdev, false);
 	hda_dsp_ctrl_ppcap_int_enable(sdev, false);
+skip_dsp:
 
 	/* disable hda bus irq and streams */
 	hda_dsp_ctrl_stop_chip(sdev);
@@ -744,9 +754,11 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 			hda_codec_jack_check(sdev);
 	}
 
-	/* enable ppcap interrupt */
-	hda_dsp_ctrl_ppcap_enable(sdev, true);
-	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
+	if (!sdev->dspless_mode_selected) {
+		/* enable ppcap interrupt */
+		hda_dsp_ctrl_ppcap_enable(sdev, true);
+		hda_dsp_ctrl_ppcap_int_enable(sdev, true);
+	}
 
 cleanup:
 	/* display codec can powered off after controller init */
@@ -843,8 +855,10 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 	};
 	int ret;
 
-	/* cancel any attempt for DSP D0I3 */
-	cancel_delayed_work_sync(&hda->d0i3_work);
+	if (!sdev->dspless_mode_selected) {
+		/* cancel any attempt for DSP D0I3 */
+		cancel_delayed_work_sync(&hda->d0i3_work);
+	}
 
 	/* stop hda controller and power dsp off */
 	ret = hda_suspend(sdev, true);
@@ -866,8 +880,10 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 	};
 	int ret;
 
-	/* cancel any attempt for DSP D0I3 */
-	cancel_delayed_work_sync(&hda->d0i3_work);
+	if (!sdev->dspless_mode_selected) {
+		/* cancel any attempt for DSP D0I3 */
+		cancel_delayed_work_sync(&hda->d0i3_work);
+	}
 
 	if (target_state == SOF_DSP_PM_D0) {
 		/* Set DSP power state */
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index df541b22b2d2..a838dddb1d32 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -355,6 +355,9 @@ bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 	bool ret = false;
 	u32 irq_status;
 
+	if (sdev->dspless_mode_selected)
+		return false;
+
 	/* store status */
 	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIS);
 	trace_sof_intel_hda_irq_ipc_check(sdev, irq_status);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 87e31a65b314..79d818e6a0fa 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -874,12 +874,14 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 
 		hext_stream = &hda_stream->hext_stream;
 
-		hext_stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
-			SOF_HDA_PPHC_BASE + SOF_HDA_PPHC_INTERVAL * i;
+		if (sdev->bar[HDA_DSP_PP_BAR]) {
+			hext_stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+				SOF_HDA_PPHC_BASE + SOF_HDA_PPHC_INTERVAL * i;
 
-		hext_stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
-			SOF_HDA_PPLC_BASE + SOF_HDA_PPLC_MULTI * num_total +
-			SOF_HDA_PPLC_INTERVAL * i;
+			hext_stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+				SOF_HDA_PPLC_BASE + SOF_HDA_PPLC_MULTI * num_total +
+				SOF_HDA_PPLC_INTERVAL * i;
+		}
 
 		hstream = &hext_stream->hstream;
 
@@ -930,13 +932,14 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 
 		hext_stream = &hda_stream->hext_stream;
 
-		/* we always have DSP support */
-		hext_stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
-			SOF_HDA_PPHC_BASE + SOF_HDA_PPHC_INTERVAL * i;
+		if (sdev->bar[HDA_DSP_PP_BAR]) {
+			hext_stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+				SOF_HDA_PPHC_BASE + SOF_HDA_PPHC_INTERVAL * i;
 
-		hext_stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
-			SOF_HDA_PPLC_BASE + SOF_HDA_PPLC_MULTI * num_total +
-			SOF_HDA_PPLC_INTERVAL * i;
+			hext_stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+				SOF_HDA_PPLC_BASE + SOF_HDA_PPLC_MULTI * num_total +
+				SOF_HDA_PPLC_INTERVAL * i;
+		}
 
 		hstream = &hext_stream->hstream;
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a14733aa7a60..483ec80f3160 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -122,8 +122,12 @@ void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
 
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
+	u32 interface_mask = hda_get_interface_mask(sdev);
 	const struct sof_intel_dsp_desc *chip;
 
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return;
+
 	chip = get_chip_info(sdev->pdata);
 	if (chip && chip->enable_sdw_irq)
 		chip->enable_sdw_irq(sdev, enable);
@@ -131,10 +135,14 @@ void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 
 static int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
 {
+	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct sof_intel_hda_dev *hdev;
 	acpi_handle handle;
 	int ret;
 
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return -EINVAL;
+
 	handle = ACPI_HANDLE(sdev->dev);
 
 	/* save ACPI info for the probe step */
@@ -288,8 +296,12 @@ bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 
 static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 {
+	u32 interface_mask = hda_get_interface_mask(sdev);
 	const struct sof_intel_dsp_desc *chip;
 
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return false;
+
 	chip = get_chip_info(sdev->pdata);
 	if (chip && chip->check_sdw_irq)
 		return chip->check_sdw_irq(sdev);
@@ -304,8 +316,12 @@ static irqreturn_t hda_dsp_sdw_thread(int irq, void *context)
 
 static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 {
+	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct sof_intel_hda_dev *hdev;
 
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return false;
+
 	hdev = sdev->pdata->hw_pdata;
 	if (hdev->sdw &&
 	    snd_sof_dsp_read(sdev, HDA_DSP_BAR,
@@ -317,8 +333,12 @@ static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
+	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct sof_intel_hda_dev *hdev;
 
+	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+		return;
+
 	hdev = sdev->pdata->hw_pdata;
 	if (!hdev->sdw)
 		return;
@@ -1010,21 +1030,25 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	const struct sof_intel_dsp_desc *chip;
 	int ret = 0;
 
-	/*
-	 * detect DSP by checking class/subclass/prog-id information
-	 * class=04 subclass 03 prog-if 00: no DSP, legacy driver is required
-	 * class=04 subclass 01 prog-if 00: DSP is present
-	 *   (and may be required e.g. for DMIC or SSP support)
-	 * class=04 subclass 03 prog-if 80: either of DSP or legacy mode works
-	 */
-	if (pci->class == 0x040300) {
-		dev_err(sdev->dev, "error: the DSP is not enabled on this platform, aborting probe\n");
-		return -ENODEV;
-	} else if (pci->class != 0x040100 && pci->class != 0x040380) {
-		dev_err(sdev->dev, "error: unknown PCI class/subclass/prog-if 0x%06x found, aborting probe\n", pci->class);
-		return -ENODEV;
+	if (!sdev->dspless_mode_selected) {
+		/*
+		 * detect DSP by checking class/subclass/prog-id information
+		 * class=04 subclass 03 prog-if 00: no DSP, legacy driver is required
+		 * class=04 subclass 01 prog-if 00: DSP is present
+		 *   (and may be required e.g. for DMIC or SSP support)
+		 * class=04 subclass 03 prog-if 80: either of DSP or legacy mode works
+		 */
+		if (pci->class == 0x040300) {
+			dev_err(sdev->dev, "the DSP is not enabled on this platform, aborting probe\n");
+			return -ENODEV;
+		} else if (pci->class != 0x040100 && pci->class != 0x040380) {
+			dev_err(sdev->dev, "unknown PCI class/subclass/prog-if 0x%06x found, aborting probe\n",
+				pci->class);
+			return -ENODEV;
+		}
+		dev_info(sdev->dev, "DSP detected with PCI class/subclass/prog-if 0x%06x\n",
+			 pci->class);
 	}
-	dev_info(sdev->dev, "DSP detected with PCI class/subclass/prog-if 0x%06x\n", pci->class);
 
 	chip = get_chip_info(sdev->pdata);
 	if (!chip) {
@@ -1069,6 +1093,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto hdac_bus_unmap;
 
+	if (sdev->dspless_mode_selected)
+		goto skip_dsp_setup;
+
 	/* DSP base */
 	sdev->bar[HDA_DSP_BAR] = pci_ioremap_bar(pci, HDA_DSP_BAR);
 	if (!sdev->bar[HDA_DSP_BAR]) {
@@ -1079,6 +1106,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 
 	sdev->mmio_bar = HDA_DSP_BAR;
 	sdev->mailbox_bar = HDA_DSP_BAR;
+skip_dsp_setup:
 
 	/* allow 64bit DMA address if supported by H/W */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64))) {
@@ -1144,14 +1172,16 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto free_ipc_irq;
 
-	/* enable ppcap interrupt */
-	hda_dsp_ctrl_ppcap_enable(sdev, true);
-	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
+	if (!sdev->dspless_mode_selected) {
+		/* enable ppcap interrupt */
+		hda_dsp_ctrl_ppcap_enable(sdev, true);
+		hda_dsp_ctrl_ppcap_int_enable(sdev, true);
 
-	/* set default mailbox offset for FW ready message */
-	sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
+		/* set default mailbox offset for FW ready message */
+		sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
 
-	INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
+		INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
+	}
 
 	init_waitqueue_head(&hdev->waitq);
 
@@ -1167,7 +1197,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 free_streams:
 	hda_dsp_stream_free(sdev);
 /* dsp_unmap: not currently used */
-	iounmap(sdev->bar[HDA_DSP_BAR]);
+	if (!sdev->dspless_mode_selected)
+		iounmap(sdev->bar[HDA_DSP_BAR]);
 hdac_bus_unmap:
 	platform_device_unregister(hdev->dmic_dev);
 	iounmap(bus->remap_addr);
@@ -1187,8 +1218,9 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	if (nhlt)
 		intel_nhlt_free(nhlt);
 
-	/* cancel any attempt for DSP D0I3 */
-	cancel_delayed_work_sync(&hda->d0i3_work);
+	if (!sdev->dspless_mode_selected)
+		/* cancel any attempt for DSP D0I3 */
+		cancel_delayed_work_sync(&hda->d0i3_work);
 
 	hda_codec_device_remove(sdev);
 
@@ -1197,14 +1229,19 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	if (!IS_ERR_OR_NULL(hda->dmic_dev))
 		platform_device_unregister(hda->dmic_dev);
 
-	/* disable DSP IRQ */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-				SOF_HDA_PPCTL_PIE, 0);
+	if (!sdev->dspless_mode_selected) {
+		/* disable DSP IRQ */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+					SOF_HDA_PPCTL_PIE, 0);
+	}
 
 	/* disable CIE and GIE interrupts */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
 				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN, 0);
 
+	if (sdev->dspless_mode_selected)
+		goto skip_disable_dsp;
+
 	/* no need to check for error as the DSP will be disabled anyway */
 	if (chip && chip->power_down_dsp)
 		chip->power_down_dsp(sdev);
@@ -1213,6 +1250,7 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 				SOF_HDA_PPCTL_GPROCEN, 0);
 
+skip_disable_dsp:
 	free_irq(sdev->ipc_irq, sdev);
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
@@ -1221,7 +1259,9 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	hda_bus_ml_free(sof_to_bus(sdev));
 
-	iounmap(sdev->bar[HDA_DSP_BAR]);
+	if (!sdev->dspless_mode_selected)
+		iounmap(sdev->bar[HDA_DSP_BAR]);
+
 	iounmap(bus->remap_addr);
 
 	sof_hda_bus_exit(sdev);
-- 
2.40.0

