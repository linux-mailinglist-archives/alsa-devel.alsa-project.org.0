Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A842D9C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCAD2180B;
	Wed, 12 Jun 2019 19:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCAD2180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360901;
	bh=422koroqi2n3VaJQ1Wy9suy7tDubrCm0u4WZ9nb06EU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TFMe+bfkOfn/JrjFiYEd9Dc/tly/kmGWJ+17TN83QSI5p2XZ1HUgkXvvdNKbG9ify
	 j+sGm0rK+ZJDo4LS6/19vwLeCb616/IPqE4UqX1MJF4t1NCdrT7aEBoo4YhBKO1dz4
	 GC7NCcrHGf/iNvQaI7QppcknRSq0YncMm16QE2qY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 620DCF89775;
	Wed, 12 Jun 2019 19:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01DA7F896CE; Wed, 12 Jun 2019 19:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86A2BF89735
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86A2BF89735
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:58 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:43 -0500
Message-Id: <20190612172347.22338-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 11/15] ASoC: SOF: Intel: hda: add function for
	hda stop chip
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

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

Add common hda_dsp_ctrl_stop_chip() function to stop controller with
the same function handling both HDA and non-HDA cases. This function
disables IRQs and clears status masks. When CONFIG_SND_SOC_SOF_HDA
is defined, also disables the CORB/RIRB, and stops i/o.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 67 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h      |  2 +-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 07bc123112c9..688ab8d895a9 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -263,3 +263,70 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 
 	return ret;
 }
+
+void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hdac_stream *stream;
+	int sd_offset;
+
+	if (!bus->chip_init)
+		return;
+
+	/* disable interrupts in stream descriptor */
+	list_for_each_entry(stream, &bus->stream_list, list) {
+		sd_offset = SOF_STREAM_SD_OFFSET(stream);
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+					sd_offset +
+					SOF_HDA_ADSP_REG_CL_SD_CTL,
+					SOF_HDA_CL_DMA_SD_INT_MASK,
+					0);
+	}
+
+	/* disable SIE for all streams */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
+				SOF_HDA_INT_ALL_STREAM,	0);
+
+	/* disable controller CIE and GIE */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
+				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
+				0);
+
+	/* clear stream status */
+	list_for_each_entry(stream, &bus->stream_list, list) {
+		sd_offset = SOF_STREAM_SD_OFFSET(stream);
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+					sd_offset +
+					SOF_HDA_ADSP_REG_CL_SD_STS,
+					SOF_HDA_CL_DMA_SD_INT_MASK,
+					SOF_HDA_CL_DMA_SD_INT_MASK);
+	}
+
+	/* clear WAKESTS */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
+				SOF_HDA_WAKESTS_INT_MASK,
+				SOF_HDA_WAKESTS_INT_MASK);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* clear rirb status */
+	snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
+#endif
+
+	/* clear interrupt status register */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS,
+			  SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_ALL_STREAM);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* disable CORB/RIRB */
+	snd_hdac_bus_stop_cmd_io(bus);
+#endif
+	/* disable position buffer */
+	if (bus->posbuf.addr) {
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+				  SOF_HDA_ADSP_DPLBASE, 0);
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+				  SOF_HDA_ADSP_DPUBASE, 0);
+	}
+
+	bus->chip_init = false;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 8812dae9cf7a..50653859e0a0 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -538,7 +538,7 @@ int hda_dsp_ctrl_link_reset(struct snd_sof_dev *sdev, bool reset);
 void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable);
 int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable);
 int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset);
-
+void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev);
 /*
  * HDA bus operations.
  */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
