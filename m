Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA43E25378D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70AD01794;
	Wed, 26 Aug 2020 20:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70AD01794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467810;
	bh=CRyvSiVNBZ9XluaIVp8+UzuOuLhX6DswKDFfYwuSmGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXW9HgMXkKDOcY3wkkxADphMDWD27PPsa7tE2uhPN+vjGcDG1aPR33k8+twQwbxEw
	 OpycpqR4ObtEm5JQqNOXC3JUei2PhUs9+vXbSiN4lBBC9aWCUi+DKR1Ged72quX4A/
	 k26VtBerCqRNZCCjbZoVChlE5MlXB9p923cLjDTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9A46F802E7;
	Wed, 26 Aug 2020 20:46:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 084E1F802DB; Wed, 26 Aug 2020 20:46:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61051F801EC
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61051F801EC
IronPort-SDR: g+i9FsiSg57Mhskoppo7DE4ypBgrER9Iqt9bIyGwbqOm4W57xiF35M4QEuMj7XLc8J4ecxlEs1
 Q07EkJGh91jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418615"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418615"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:45 -0700
IronPort-SDR: JrfLFetjaJLGOaNMOOOEBjig6poiRsBm4t7RzS//4EfQT0o3qQXtKkaw2ytKzwhzKv22K14MyP
 nIwZq0hWNRxQ==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347333"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:45 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: SOF: Intel: hda: Add helper function to program
 ICCMAX stream
Date: Wed, 26 Aug 2020 11:45:27 -0700
Message-Id: <20200826184532.1612070-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

For some platforms, the recommended HW sequence for FW boot involves
starting a specially crafted capture stream before powering
on the DSP cores. Add a helper function to define the minimal
recommended stream programming sequence for this stream.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 69 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h        |  4 ++
 2 files changed, 73 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 1bda14c3590c..0e09ede922c7 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -23,6 +23,8 @@
 #include "../sof-audio.h"
 #include "hda.h"
 
+#define HDA_LTRP_GB_VALUE_US	95
+
 /*
  * set up one of BDL entries for a stream
  */
@@ -322,6 +324,73 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+/* minimal recommended programming for ICCMAX stream */
+int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream,
+				    struct snd_dma_buffer *dmab,
+				    struct snd_pcm_hw_params *params)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hdac_stream *hstream = &stream->hstream;
+	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	int ret;
+	u32 mask = 0x1 << hstream->index;
+
+	if (!stream) {
+		dev_err(sdev->dev, "error: no stream available\n");
+		return -ENODEV;
+	}
+
+	if (hstream->posbuf)
+		*hstream->posbuf = 0;
+
+	/* reset BDL address */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  0x0);
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  0x0);
+
+	hstream->frags = 0;
+
+	ret = hda_dsp_stream_setup_bdl(sdev, dmab, hstream);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: set up of BDL failed\n");
+		return ret;
+	}
+
+	/* program BDL address */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  (u32)hstream->bdl.addr);
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  upper_32_bits(hstream->bdl.addr));
+
+	/* program cyclic buffer length */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL,
+			  hstream->bufsize);
+
+	/* program last valid index */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI,
+				0xffff, (hstream->frags - 1));
+
+	/* decouple host and link DMA, enable DSP features */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+				mask, mask);
+
+	/* Follow HW recommendation to set the guardband value to 95us during FW boot */
+	snd_hdac_chip_updateb(bus, VS_LTRP, HDA_VS_INTEL_LTRP_GB_MASK, HDA_LTRP_GB_VALUE_US);
+
+	/* start DMA */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
+				SOF_HDA_SD_CTL_DMA_START, SOF_HDA_SD_CTL_DMA_START);
+
+	return 0;
+}
+
 /*
  * prepare for common hdac registers settings, for both code loader
  * and normal stream.
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index fe452f0d0ec7..100eaaeecb4d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -246,6 +246,7 @@
 /* Intel Vendor Specific Registers */
 #define HDA_VS_INTEL_EM2		0x1030
 #define HDA_VS_INTEL_EM2_L1SEN		BIT(13)
+#define HDA_VS_INTEL_LTRP_GB_MASK	0x3F
 
 /*  HIPCI */
 #define HDA_DSP_REG_HIPCI_BUSY		BIT(31)
@@ -546,6 +547,9 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 			     struct hdac_ext_stream *stream,
 			     struct snd_dma_buffer *dmab,
 			     struct snd_pcm_hw_params *params);
+int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream,
+				    struct snd_dma_buffer *dmab,
+				    struct snd_pcm_hw_params *params);
 int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 			   struct hdac_ext_stream *stream, int cmd);
 irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context);
-- 
2.25.1

