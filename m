Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C4E3945AD
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 18:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D90016D4;
	Fri, 28 May 2021 18:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D90016D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622218355;
	bh=OZnOUFzdtf1hWbkPMrP1O25DZZQwsZewbNjWFCOJpYc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rjdf+VKcSSuu6upU12D06DgtB52eCNj7C6JoEvGchWtvBRv0WNBpvsC8+GBVYcSps
	 Ll7pDa0D55KeIoPbcFmHtQ8EEd2/hGnGa+3hGgIM6SCcR1WnTj7mrW/QRIIYaFDLVB
	 WTQguWvOLzaoBymHg7OPEL8sX4T1z2KO2/rHoYSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7028AF804AB;
	Fri, 28 May 2021 18:11:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72BA3F804AD; Fri, 28 May 2021 18:11:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CBE5F804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 18:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CBE5F804A9
IronPort-SDR: 5JcqcH2fthhXtAIGNMvmLp/5BFVooP4VIjNl3Ypze6blv0U2LdYhjsUSmrntJp37vManInPE0z
 g2Z/JNMV66+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="203016997"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="203016997"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 09:10:53 -0700
IronPort-SDR: AzZ14BVuTJ0fpEiFTxH8nHL2wde8UWS9JYQDDY0IIgeHCR0EYtajYlq0CB4sC0CFRXGDimXD9K
 sNmcOMo/b7XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="444058718"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 28 May 2021 09:10:51 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: hda: clean up hda_dsp_dump()
Date: Fri, 28 May 2021 19:05:50 +0300
Message-Id: <20210528160551.10145-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Clean up the hda_dsp_dump() function to avoid duplicating
the ROM status and error.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 126232a76a10..e1e368ff2b12 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -394,28 +394,21 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
-	u32 status, panic;
 
-	/* try APL specific status message types first */
+	/* print ROM/FW status */
 	hda_dsp_get_status(sdev);
 
-	/* now try generic SOF status messages */
-	status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-				  HDA_DSP_SRAM_REG_FW_STATUS);
-	panic = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_TRACEP);
-
+	/* print panic info if FW boot is complete. Otherwise, print the extended ROM status */
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
+		u32 status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_STATUS);
+		u32 panic = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_TRACEP);
+
 		hda_dsp_get_registers(sdev, &xoops, &panic_info, stack,
 				      HDA_DSP_STACK_DUMP_SIZE);
 		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
 				   stack, HDA_DSP_STACK_DUMP_SIZE);
 	} else {
-		sof_dev_dbg_or_err(sdev->dev, flags & SOF_DBG_DUMP_FORCE_ERR_LEVEL,
-				   "status = 0x%8.8x panic = 0x%8.8x\n",
-				   status, panic);
-
 		hda_dsp_dump_ext_rom_status(sdev, flags);
-		hda_dsp_get_status(sdev);
 	}
 }
 

base-commit: 058efb40641845432c52777443b3372dbc97c032
-- 
2.31.1

