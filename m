Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C42B7F15
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 15:10:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A4C17AA;
	Wed, 18 Nov 2020 15:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A4C17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605708607;
	bh=r2bvAg0UOKYs0RVTO95ERbraktHASWAa0gxkuCbPSF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VSlkfYMN5X5cLppOYFIDHtqa/EcGnp1CPN+dp0xVcdhlfTPDnfK0Q/X67KOi8RElh
	 iF+vMyXSTOewppT3fHyRnwwVsGP6kVHJ/hqbVt4hI5YBQXuM9ML+egxKtiL4yQyyW6
	 0wgBpaje3XVjcqVf/rMyjJ+7TNw/+timjMuhUTe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57572F8019D;
	Wed, 18 Nov 2020 15:08:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5BF8F8016C; Wed, 18 Nov 2020 15:08:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B54ACF80168
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 15:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B54ACF80168
IronPort-SDR: 8HSHF5Q/QH+vum8NItPW0tgam9x1OXq7id9NQ9rnl3PdFwoyX66eJsn0XupMK6h9HSJeQmpd+1
 cYxlG72IIHwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="168547615"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="168547615"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 06:08:08 -0800
IronPort-SDR: 7NIGuRe+HVeHelbmIhl5OUKEyQ424ACDJyxiNzkgYz6HNUIPKd9/pUBUImfpF1ZadfZnzER0Gb
 bYalqElTgffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="330512895"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2020 06:08:06 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: add hw specific PCM constraints
Date: Wed, 18 Nov 2020 16:05:45 +0200
Message-Id: <20201118140545.2138895-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118140545.2138895-1-kai.vehmanen@linux.intel.com>
References: <20201118140545.2138895-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Part of PCM constraints are set based on DSP topology, but rest
should be set based on hardware capabilities. Add PCM constraints
for Intel platforms:

- Add constraint for the period count to be integer. This avoids
  wrap-arounds of the DMA circular buffer in middle of a period.

- Align period size to dword/32bit as per HDA spec.

Both constraints are aligned with current implementation in snd-hda-intel
driver.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c   | 7 +++++++
 sound/soc/sof/intel/intel-ipc.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index b527d5958ae5..5d35bb18660a 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -225,6 +225,13 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		return -ENODEV;
 	}
 
+	/* minimum as per HDA spec */
+	snd_pcm_hw_constraint_step(substream->runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 4);
+
+	/* avoid circular buffer wrap in middle of period */
+	snd_pcm_hw_constraint_integer(substream->runtime,
+				      SNDRV_PCM_HW_PARAM_PERIODS);
+
 	/* binding pcm substream to hda stream */
 	substream->runtime->private_data = &dsp_stream->hstream;
 	return 0;
diff --git a/sound/soc/sof/intel/intel-ipc.c b/sound/soc/sof/intel/intel-ipc.c
index 310f9168c124..de66f8a82a07 100644
--- a/sound/soc/sof/intel/intel-ipc.c
+++ b/sound/soc/sof/intel/intel-ipc.c
@@ -73,6 +73,13 @@ int intel_pcm_open(struct snd_sof_dev *sdev,
 	/* binding pcm substream to hda stream */
 	substream->runtime->private_data = stream;
 
+	/* align to DMA minimum transfer size */
+	snd_pcm_hw_constraint_step(substream->runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 4);
+
+	/* avoid circular buffer wrap in middle of period */
+	snd_pcm_hw_constraint_integer(substream->runtime,
+				      SNDRV_PCM_HW_PARAM_PERIODS);
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(intel_pcm_open, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
-- 
2.28.0

