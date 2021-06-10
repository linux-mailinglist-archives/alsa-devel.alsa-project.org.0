Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6BB3A353A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 22:58:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CCD417E8;
	Thu, 10 Jun 2021 22:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CCD417E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623358687;
	bh=n4IK28I0hZljCIWjfrJVRRms7HhJ8zIkuXV+0AqHV1M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKhWcJVI96JMJwUAvxjrbHPsXeKbCqAciMVSPqmz9rJiK3vgsK9vlo2nZRyRuidVw
	 rW3S+TNy+g1Pa0J20lA9F7elkuP5pi4Td/qsbDVHspiOCV19mQqKh2HE6IM7Spu+vf
	 pjkjt2edAtoqzXYvhFxaSReCQptwqicw+s0g/sRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E89FDF804F1;
	Thu, 10 Jun 2021 22:54:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 076B7F804B3; Thu, 10 Jun 2021 22:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7CF2F804AB
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 22:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7CF2F804AB
IronPort-SDR: HYU6j48H/pCRGAEGnj8cT+YMaO64VLJ1ju6CCheKe5tZEMLKTxTBtlK7CRhyYVhBMLWVOOywxV
 Ue1q86l04U3g==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226812413"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="226812413"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:50 -0700
IronPort-SDR: lgkQN7a7rYJQBmjNjkpN6yp+1GOZY61uzQsRI3KY/VV/PTUwujnOh/8I5E3mpS7WQxUmYmBUf6
 i2SIeWTCmLXA==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="620183621"
Received: from umedepal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.170.65])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: SOF: Intel: simplify logic for DMI_L1 handling
Date: Thu, 10 Jun 2021 15:53:20 -0500
Message-Id: <20210610205326.1176400-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

We don't need to test in multiple places if the kconfig
SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1 is enabled or not, we might as
well set the existing DMI_L1_COMPATIBLE flag.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c    |  3 ++-
 sound/soc/sof/intel/hda-stream.c | 11 +++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index df00db8369c7..59220fa1def1 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -229,7 +229,8 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 	}
 
 	/* All playback and D0i3 compatible streams are DMI L1 capable */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1) ||
+	    direction == SNDRV_PCM_STREAM_PLAYBACK ||
 	    spcm->stream[substream->stream].d0i3_compatible)
 		flags |= SOF_HDA_STREAM_DMI_L1_COMPATIBLE;
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 40a3993ae2cb..4e49b7b16b4c 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -197,11 +197,10 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 	 * Workaround to address a known issue with host DMA that results
 	 * in xruns during pause/release in capture scenarios.
 	 */
-	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1))
-		if (stream && !(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE))
-			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-						HDA_VS_INTEL_EM2,
-						HDA_VS_INTEL_EM2_L1SEN, 0);
+	if (stream && !(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE))
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+					HDA_VS_INTEL_EM2,
+					HDA_VS_INTEL_EM2_L1SEN, 0);
 
 	return stream;
 }
@@ -240,7 +239,7 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 	spin_unlock_irq(&bus->reg_lock);
 
 	/* Enable DMI L1 if permitted */
-	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1) && dmi_l1_enable)
+	if (dmi_l1_enable)
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
 					HDA_VS_INTEL_EM2_L1SEN, HDA_VS_INTEL_EM2_L1SEN);
 
-- 
2.25.1

