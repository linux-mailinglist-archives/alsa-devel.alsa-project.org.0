Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD67322F7DD
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 20:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38A6416A1;
	Mon, 27 Jul 2020 20:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38A6416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595875151;
	bh=Y3omj8qKiDuXAZErmouwtDGo8K1X1M+S1ldUDMy9vSA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qW9M5s1d4TWBFNVVjg4L++0cFLYRLcyk03GhcwySYIZMSBr5y5FxyRcqFd4Lzbez9
	 ZOYWb8o+6uEWUlhw+piiD3lsYZwj/D+luI3/q9nt2w7adRB1grWhgU6Ks88dVBPxxC
	 5u5yOXlIGBhdj/p9qse/29sZDoFgijRxWaAJfwW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50AFBF80232;
	Mon, 27 Jul 2020 20:36:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1757EF801F7; Mon, 27 Jul 2020 20:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90A17F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 20:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90A17F800DE
IronPort-SDR: E/Ru2aCQuP2cc6okNWMFqDLYDx2/4QQ39j4ZbitR5uTnTPm4U+VD9nvAysUX7GWJYW2MOZujMi
 WmPt4iDYyEqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="148562196"
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="148562196"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:36:34 -0700
IronPort-SDR: O4nZx78Hvqr19DGNQzvkK1DzlAtH6/zI7C7ukWcb/RUnj4YgfxWPrh0Fzy4nan8dI0r/YD4urD
 9Wr+kyr1vTyw==
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="490063003"
Received: from rkbasco-mobl1.amr.corp.intel.com (HELO
 ranjani-desktop.localdomain) ([10.251.147.18])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:36:34 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: fix the suspend procedure to support
 s0ix entry
Date: Mon, 27 Jul 2020 11:36:12 -0700
Message-Id: <20200727183613.1419005-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727183613.1419005-1-ranjani.sridharan@linux.intel.com>
References: <20200727183613.1419005-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

This patch fixes the suspend & resume procedure to allow entry into the
low power states with some streams being active as a wake source - wake on
voice is a perfect example. The current implementation does not stop
the CORB/RIRB DMA and does not power down the HDA links. With firmware's
help, the platform has been able to still enter s0ix state on older
platforms, but the sequence is still incorrect, and the additional
driver actions are needed to ensure correct s0ix behaviour.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 4a40944acaef..89961397010a 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -696,12 +696,35 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 		.state = SOF_DSP_PM_D0,
 		.substate = SOF_HDA_DSP_PM_D0I0,
 	};
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hdac_ext_link *hlink = NULL;
+#endif
 	int ret;
 
 	/* resume from D0I3 */
 	if (sdev->dsp_power_state.state == SOF_DSP_PM_D0) {
 		hda_codec_i915_display_power(sdev, true);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+		/* power up links that were active before suspend */
+		list_for_each_entry(hlink, &bus->hlink_list, list) {
+			if (hlink->ref_count) {
+				ret = snd_hdac_ext_bus_link_power_up(hlink);
+				if (ret < 0) {
+					dev_dbg(sdev->dev,
+						"error %x in %s: failed to power up links",
+						ret, __func__);
+					return ret;
+				}
+			}
+		}
+
+		/* set up CORB/RIRB buffers if was on before suspend */
+		if (bus->cmd_dma_state)
+			snd_hdac_bus_init_cmd_io(bus);
+#endif
+
 		/* Set DSP power state */
 		ret = snd_sof_dsp_set_power_state(sdev, &target_state);
 		if (ret < 0) {
@@ -808,6 +831,21 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 						HDA_VS_INTEL_EM2_L1SEN,
 						HDA_VS_INTEL_EM2_L1SEN);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+		/* stop the CORB/RIRB DMA if it is On */
+		if (bus->cmd_dma_state)
+			snd_hdac_bus_stop_cmd_io(bus);
+
+		/* no link can be powered in s0ix state */
+		ret = snd_hdac_ext_bus_link_power_down_all(bus);
+		if (ret < 0) {
+			dev_dbg(sdev->dev,
+				"error %d in %s: failed to power down links",
+				ret, __func__);
+			return ret;
+		}
+#endif
+
 		/* enable the system waking up via IPC IRQ */
 		enable_irq_wake(pci->irq);
 		pci_save_state(pci);
-- 
2.25.1

