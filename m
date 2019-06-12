Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0E42D93
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:33:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1599717F8;
	Wed, 12 Jun 2019 19:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1599717F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360780;
	bh=25MIwLbV9kIx4K27cSe/kJ0VSulaYMpL8g68Q9CT2f4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Phoch0wk0pn2blmgnzwTKclJWlQ+ZHrIZjEPoa1t/0JBRps7Pw0026Z+CEqHrQl/9
	 QS0TBXPvrDK8DiGttMbqPPdFFNBN98QjO6M2Piro/z+k++y4xKtbAhWx55ls3MN2oX
	 8rzuDSrwjl0USk8QYBJfK9RRm3KcRbxVgGmJ1u3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99BC8F89764;
	Wed, 12 Jun 2019 19:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D1B8F89743; Wed, 12 Jun 2019 19:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CB15F896EA
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CB15F896EA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:59 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:45 -0500
Message-Id: <20190612172347.22338-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 13/15] ASoC: SOF: Intel: hda: clear stream
	status and wakests properly
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Stream status and WAKESTS registers need to be cleared by writing
to them with snd_sof_dsp_write(). snd_sof_dsp_update_bits() only
writes if the value is changed and will result in not clearing
the status.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 688ab8d895a9..ea63f83a509b 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -217,17 +217,14 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 	/* clear stream status */
 	list_for_each_entry(stream, &bus->stream_list, list) {
 		sd_offset = SOF_STREAM_SD_OFFSET(stream);
-		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-					sd_offset +
-					SOF_HDA_ADSP_REG_CL_SD_STS,
-					SOF_HDA_CL_DMA_SD_INT_MASK,
-					SOF_HDA_CL_DMA_SD_INT_MASK);
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+				  sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+				  SOF_HDA_CL_DMA_SD_INT_MASK);
 	}
 
 	/* clear WAKESTS */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
-				SOF_HDA_WAKESTS_INT_MASK,
-				SOF_HDA_WAKESTS_INT_MASK);
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
+			  SOF_HDA_WAKESTS_INT_MASK);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* clear rirb status */
@@ -295,17 +292,14 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 	/* clear stream status */
 	list_for_each_entry(stream, &bus->stream_list, list) {
 		sd_offset = SOF_STREAM_SD_OFFSET(stream);
-		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-					sd_offset +
-					SOF_HDA_ADSP_REG_CL_SD_STS,
-					SOF_HDA_CL_DMA_SD_INT_MASK,
-					SOF_HDA_CL_DMA_SD_INT_MASK);
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+				  sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
+				  SOF_HDA_CL_DMA_SD_INT_MASK);
 	}
 
 	/* clear WAKESTS */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
-				SOF_HDA_WAKESTS_INT_MASK,
-				SOF_HDA_WAKESTS_INT_MASK);
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
+			  SOF_HDA_WAKESTS_INT_MASK);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* clear rirb status */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
