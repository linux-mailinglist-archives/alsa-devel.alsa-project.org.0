Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623B460B327
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFEB91FCC;
	Mon, 24 Oct 2022 18:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFEB91FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630670;
	bh=b9uEngRm14BPaCumWfjrKx4PvPtE5PP7XfkyHlYRIL4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bo59ArNMHRSjGUDLUBa3RjkOHKs+KhWg+LJ5THiXzB4s/BnBep4Hk0ueNGhOCAgEh
	 R55ptRnioVMQZkS7fVr6Ik8hkvhet7SOARf5u89gblmv42tFXSkFGU4Rv6Hczi7bAn
	 vfjL7iXfx4tjK4Q7tw5bSmDjHZUZaC3SYNj6Xbts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72F9AF805BE;
	Mon, 24 Oct 2022 18:53:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C20F805A0; Mon, 24 Oct 2022 18:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E0E7F8055B
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E0E7F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aPssvXw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630416; x=1698166416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b9uEngRm14BPaCumWfjrKx4PvPtE5PP7XfkyHlYRIL4=;
 b=aPssvXw3sMWlBxZqTy8lfcyycGx0YOmmpULW+2tyXjSKTiSuymf9OOTG
 0kTqWehE86VnovlFgmJD2SKgy2gozlSsUhRLP8FhrdH8IYTUZSsZU8uve
 yz65om5RHbZJSKzqMLQg9uC/cmQQAszmlWaF7tEInzd18AbKMwlSJG2V7
 XKonpw32tvYwMfakXlIFQb1XOdG+uF72V4Ms2W0dSVF3CpESEQnACwYNZ
 Fhw4uincDqHNWCn7xBAKhLWwhhs2/cQpjBTRBx4kLYeMBIT4za6l6E5UM
 Q9/33fHAOqJSEpXDUgPfBGL1MGzXeT4fIahdTJuXvf3QRO551ZwiisSF+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868664"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868664"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263078"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263078"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/16] ASoC: SOF: Intel: hda-stream: rename CL_SD_CTL
 registers as SD_CTL
Date: Mon, 24 Oct 2022 11:53:07 -0500
Message-Id: <20221024165310.246183-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The use of the CL prefix is misleading. HDaudio streams are used for
code loading since ApolloLake, but they are also used for regular
audio transfers.

No functionality change, pure rename.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c       |  6 ++---
 sound/soc/sof/intel/hda-loader-skl.c | 30 ++++++++++++------------
 sound/soc/sof/intel/hda-loader.c     |  4 ++--
 sound/soc/sof/intel/hda-stream.c     | 34 ++++++++++++++--------------
 sound/soc/sof/intel/hda.h            | 22 +++++++++---------
 5 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 8a8b5f93db254..12900965ca5ff 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -234,7 +234,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 	list_for_each_entry(stream, &bus->stream_list, list) {
 		sd_offset = SOF_STREAM_SD_OFFSET(stream);
 		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-				  sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+				  sd_offset + SOF_HDA_ADSP_REG_SD_STS,
 				  SOF_HDA_CL_DMA_SD_INT_MASK);
 	}
 
@@ -300,7 +300,7 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 		sd_offset = SOF_STREAM_SD_OFFSET(stream);
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 					sd_offset +
-					SOF_HDA_ADSP_REG_CL_SD_CTL,
+					SOF_HDA_ADSP_REG_SD_CTL,
 					SOF_HDA_CL_DMA_SD_INT_MASK,
 					0);
 	}
@@ -318,7 +318,7 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 	list_for_each_entry(stream, &bus->stream_list, list) {
 		sd_offset = SOF_STREAM_SD_OFFSET(stream);
 		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-				  sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+				  sd_offset + SOF_HDA_ADSP_REG_SD_STS,
 				  SOF_HDA_CL_DMA_SD_INT_MASK);
 	}
 
diff --git a/sound/soc/sof/intel/hda-loader-skl.c b/sound/soc/sof/intel/hda-loader-skl.c
index 3211f561db29c..69fdef8f89ae2 100644
--- a/sound/soc/sof/intel/hda-loader-skl.c
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -141,7 +141,7 @@ static void cl_skl_cldma_stream_run(struct snd_sof_dev *sdev, bool enable)
 	u32 run = enable ? 0x1 : 0;
 
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				sd_offset + SOF_HDA_ADSP_REG_SD_CTL,
 				HDA_CL_SD_CTL_RUN(1), HDA_CL_SD_CTL_RUN(run));
 
 	retries = 300;
@@ -150,7 +150,7 @@ static void cl_skl_cldma_stream_run(struct snd_sof_dev *sdev, bool enable)
 
 		/* waiting for hardware to report the stream Run bit set */
 		val = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-				       sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL);
+				       sd_offset + SOF_HDA_ADSP_REG_SD_CTL);
 		val &= HDA_CL_SD_CTL_RUN(1);
 		if (enable && val)
 			break;
@@ -174,23 +174,23 @@ static void cl_skl_cldma_stream_clear(struct snd_sof_dev *sdev)
 	 * Descriptor Error Interrupt and set the cldma stream number to 0.
 	 */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				sd_offset + SOF_HDA_ADSP_REG_SD_CTL,
 				HDA_CL_SD_CTL_INT_MASK, HDA_CL_SD_CTL_INT(0));
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				sd_offset + SOF_HDA_ADSP_REG_SD_CTL,
 				HDA_CL_SD_CTL_STRM(0xf), HDA_CL_SD_CTL_STRM(0));
 
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL, HDA_CL_SD_BDLPLBA(0));
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL, HDA_CL_SD_BDLPLBA(0));
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU, 0);
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU, 0);
 
 	/* Set the Cyclic Buffer Length to 0. */
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL, 0);
+			  sd_offset + SOF_HDA_ADSP_REG_SD_CBL, 0);
 	/* Set the Last Valid Index. */
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI, 0);
+			  sd_offset + SOF_HDA_ADSP_REG_SD_LVI, 0);
 }
 
 static void cl_skl_cldma_setup_spb(struct snd_sof_dev *sdev,
@@ -240,27 +240,27 @@ static void cl_skl_cldma_setup_controller(struct snd_sof_dev *sdev,
 
 	/* setting the stream register */
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL,
 			  HDA_CL_SD_BDLPLBA(dmab_bdl->addr));
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU,
 			  HDA_CL_SD_BDLPUBA(dmab_bdl->addr));
 
 	/* Set the Cyclic Buffer Length. */
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL, max_size);
+			  sd_offset + SOF_HDA_ADSP_REG_SD_CBL, max_size);
 	/* Set the Last Valid Index. */
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI, count - 1);
+			  sd_offset + SOF_HDA_ADSP_REG_SD_LVI, count - 1);
 
 	/* Set the Interrupt On Completion, FIFO Error Interrupt,
 	 * Descriptor Error Interrupt and the cldma stream number.
 	 */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				sd_offset + SOF_HDA_ADSP_REG_SD_CTL,
 				HDA_CL_SD_CTL_INT_MASK, HDA_CL_SD_CTL_INT(1));
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				sd_offset + SOF_HDA_ADSP_REG_SD_CTL,
 				HDA_CL_SD_CTL_STRM(0xf),
 				HDA_CL_SD_CTL_STRM(1));
 }
@@ -439,7 +439,7 @@ static int cl_skl_cldma_wait_interruptible(struct snd_sof_dev *sdev,
 
 	/* now check DMA interrupt status */
 	cl_dma_intr_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					      sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS);
+					      sd_offset + SOF_HDA_ADSP_REG_SD_STS);
 
 	if (!(cl_dma_intr_status & HDA_CL_DMA_SD_INT_COMPLETE)) {
 		dev_err(sdev->dev, "cldma copy failed\n");
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 38204541fc5d9..3a4b0b6e2c5c2 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -265,9 +265,9 @@ int hda_cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 
 	/* reset BDL address */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL, 0);
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL, 0);
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU, 0);
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU, 0);
 
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, sd_offset, 0);
 	snd_dma_free_pages(dmab);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 7ac703515be4a..6d130b8028b1c 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -367,7 +367,7 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 
 		if (ret >= 0) {
 			snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-					  sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+					  sd_offset + SOF_HDA_ADSP_REG_SD_STS,
 					  SOF_HDA_CL_DMA_SD_INT_MASK);
 
 			hstream->running = false;
@@ -419,10 +419,10 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 
 	/* reset BDL address */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL,
 			  0x0);
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU,
 			  0x0);
 
 	hstream->frags = 0;
@@ -435,20 +435,20 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 
 	/* program BDL address */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL,
 			  (u32)hstream->bdl.addr);
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU,
 			  upper_32_bits(hstream->bdl.addr));
 
 	/* program cyclic buffer length */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_CBL,
 			  hstream->bufsize);
 
 	/* program last valid index */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI,
+				sd_offset + SOF_HDA_ADSP_REG_SD_LVI,
 				0xffff, (hstream->frags - 1));
 
 	/* decouple host and link DMA, enable DSP features */
@@ -520,7 +520,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	}
 
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+				sd_offset + SOF_HDA_ADSP_REG_SD_STS,
 				SOF_HDA_CL_DMA_SD_INT_MASK,
 				SOF_HDA_CL_DMA_SD_INT_MASK);
 
@@ -534,10 +534,10 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 
 	/* reset BDL address */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL,
 			  0x0);
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU,
 			  0x0);
 
 	/* clear stream status */
@@ -562,7 +562,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	}
 
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+				sd_offset + SOF_HDA_ADSP_REG_SD_STS,
 				SOF_HDA_CL_DMA_SD_INT_MASK,
 				SOF_HDA_CL_DMA_SD_INT_MASK);
 
@@ -582,7 +582,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 
 	/* program cyclic buffer length */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_CBL,
 			  hstream->bufsize);
 
 	/*
@@ -606,7 +606,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	/* program stream format */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset +
-				SOF_HDA_ADSP_REG_CL_SD_FORMAT,
+				SOF_HDA_ADSP_REG_SD_FORMAT,
 				0xffff, hstream->format_val);
 
 	if (chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK) {
@@ -617,15 +617,15 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 
 	/* program last valid index */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-				sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI,
+				sd_offset + SOF_HDA_ADSP_REG_SD_LVI,
 				0xffff, (hstream->frags - 1));
 
 	/* program BDL address */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL,
 			  (u32)hstream->bdl.addr);
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU,
 			  upper_32_bits(hstream->bdl.addr));
 
 	/* enable position buffer, if needed */
@@ -649,7 +649,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 		hstream->fifo_size =
 			snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
 					 sd_offset +
-					 SOF_HDA_ADSP_REG_CL_SD_FIFOSIZE);
+					 SOF_HDA_ADSP_REG_SD_FIFOSIZE);
 		hstream->fifo_size &= 0xffff;
 		hstream->fifo_size += 1;
 	} else {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 6b1474d78ebb3..b2a785d0f0e94 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -122,17 +122,17 @@
 #define SOF_HDA_ADSP_DPLBASE_ENABLE		0x01
 
 /* Stream Registers */
-#define SOF_HDA_ADSP_REG_CL_SD_CTL		0x00
-#define SOF_HDA_ADSP_REG_CL_SD_STS		0x03
-#define SOF_HDA_ADSP_REG_CL_SD_LPIB		0x04
-#define SOF_HDA_ADSP_REG_CL_SD_CBL		0x08
-#define SOF_HDA_ADSP_REG_CL_SD_LVI		0x0C
-#define SOF_HDA_ADSP_REG_CL_SD_FIFOW		0x0E
-#define SOF_HDA_ADSP_REG_CL_SD_FIFOSIZE		0x10
-#define SOF_HDA_ADSP_REG_CL_SD_FORMAT		0x12
-#define SOF_HDA_ADSP_REG_CL_SD_FIFOL		0x14
-#define SOF_HDA_ADSP_REG_CL_SD_BDLPL		0x18
-#define SOF_HDA_ADSP_REG_CL_SD_BDLPU		0x1C
+#define SOF_HDA_ADSP_REG_SD_CTL			0x00
+#define SOF_HDA_ADSP_REG_SD_STS			0x03
+#define SOF_HDA_ADSP_REG_SD_LPIB		0x04
+#define SOF_HDA_ADSP_REG_SD_CBL			0x08
+#define SOF_HDA_ADSP_REG_SD_LVI			0x0C
+#define SOF_HDA_ADSP_REG_SD_FIFOW		0x0E
+#define SOF_HDA_ADSP_REG_SD_FIFOSIZE		0x10
+#define SOF_HDA_ADSP_REG_SD_FORMAT		0x12
+#define SOF_HDA_ADSP_REG_SD_FIFOL		0x14
+#define SOF_HDA_ADSP_REG_SD_BDLPL		0x18
+#define SOF_HDA_ADSP_REG_SD_BDLPU		0x1C
 #define SOF_HDA_ADSP_SD_ENTRY_SIZE		0x20
 
 /* CL: Software Position Based FIFO Capability Registers */
-- 
2.34.1

