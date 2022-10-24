Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA69760B328
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C8B74F0D;
	Mon, 24 Oct 2022 18:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C8B74F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630686;
	bh=5A6z4HS1wgeguMfFzjOsEIy+RM6gl0SI+tyoAggKO7c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lo7K3qpVe4zHnj28pnSlY2uoI2oEJY2Je/sKRGjf8yeZJpIMpeGmNzypy0gprRt7k
	 xxDtKxfEIjSZGm6C10lGbF2R2nydI2yF7ME1gMzpyPLV7VEjeZ9YI+LVQeCD/xATEC
	 g9T65CIZ0eeLvl2ij7YiLnB13UTWU/C03hVuir8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECBCEF805C4;
	Mon, 24 Oct 2022 18:53:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33E3EF805A9; Mon, 24 Oct 2022 18:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36A6F80551
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36A6F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k/7LO3dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630418; x=1698166418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5A6z4HS1wgeguMfFzjOsEIy+RM6gl0SI+tyoAggKO7c=;
 b=k/7LO3dlLtdZ1uzBun3lOCFN/tcNEFona4sz1tvNKfP5qc04V1Pv+gq2
 7j2fAvs5hqapldZtgL2wA77tOozop5jaL2Y5RE0Qw4X4qTyrdXNtldkEl
 qBgRvsSjrYGrKKWrYLZwLcHGDz9htkC81FM+0b+aMNmuRaOc2Sf3viDWV
 yhxbzz2/u8coTiOZoy2snKWwJxrR6UvITWJ6VZvr5L0B0cO4e5SJXVduD
 zwK2TWDKeljRFQF68ksVnEvXgtCZo9SBPxSW9ZbN7GcrpMoQB11SjYwL0
 SahqyGfMAhmoV0yqJJ1MY9BFsVsWj5M7qf9QehlESuamy0G2AlBPxzanO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868671"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868671"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:33 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263083"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263083"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/16] ASoC: SOF: Intel: hda-stream: use snd_sof_dsp_updateb()
 helper
Date: Mon, 24 Oct 2022 11:53:09 -0500
Message-Id: <20221024165310.246183-16-pierre-louis.bossart@linux.intel.com>
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

No functionality change, only code consistency.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 4 ++--
 sound/soc/sof/intel/hda.h        | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 6d130b8028b1c..1a39178cbf20f 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -398,7 +398,6 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 				    struct snd_dma_buffer *dmab,
 				    struct snd_pcm_hw_params *params)
 {
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret;
@@ -456,7 +455,8 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 				mask, mask);
 
 	/* Follow HW recommendation to set the guardband value to 95us during FW boot */
-	snd_hdac_chip_updateb(bus, VS_LTRP, HDA_VS_INTEL_LTRP_GB_MASK, HDA_LTRP_GB_VALUE_US);
+	snd_sof_dsp_updateb(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_LTRP,
+			    HDA_VS_INTEL_LTRP_GB_MASK, HDA_LTRP_GB_VALUE_US);
 
 	/* start DMA */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index b2a785d0f0e94..17ed7e60cae81 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -307,6 +307,7 @@
 /* Intel Vendor Specific Registers */
 #define HDA_VS_INTEL_EM2		0x1030
 #define HDA_VS_INTEL_EM2_L1SEN		BIT(13)
+#define HDA_VS_INTEL_LTRP		0x1048
 #define HDA_VS_INTEL_LTRP_GB_MASK	0x3F
 
 /*  HIPCI */
-- 
2.34.1

