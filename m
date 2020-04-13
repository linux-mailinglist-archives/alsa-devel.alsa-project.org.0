Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3F1A6433
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 10:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18FE216F7;
	Mon, 13 Apr 2020 10:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18FE216F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586767007;
	bh=XUAzvaVMOvP3VSTj5tI89pzT2fEHROejFliLYuSHZJ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zur5Mbq61kzigg9nIrSDCnOe0IBbToM3fvrig/vNuIQp16xtFKa/OSaonM70rf5tq
	 0LeQjh55+VjV45fBQVmpNtXvswSP50nAsZir80LxOOcxjiITrKHTM29QrOXbvD+8Rj
	 6tVR+MURrxk7G/7edc3UgTo7nUDorMm177jO1SnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48692F80229;
	Mon, 13 Apr 2020 10:35:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA806F8025F; Mon, 13 Apr 2020 10:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47DE8F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 10:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DE8F800B9
IronPort-SDR: SbCvr9aQOdCPqYFAN1v33UyqmftnTOtcgOunXs4T6U0nl+1WWE9nIWTmDPBgVhTq71UeLf+xl9
 yq5Dwi+vPGaA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 01:34:54 -0700
IronPort-SDR: XkPBaEPk3nYKkijQE0zTcybK4lHwfULNgyRdgi64MnHpbewtkjOe0HJmutO6/sflQDAWZZzaHC
 qF1yJLGFfZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="252813717"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga003.jf.intel.com with ESMTP; 13 Apr 2020 01:34:52 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: bdw-rt5650: remove 3-channel capture support
Date: Mon, 13 Apr 2020 16:28:53 +0800
Message-Id: <1586766533-18557-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>, Brent Lu <brent.lu@intel.com>
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

Implement a constrain to exclude 3-channel capture since only 2 and 4
channel capture are supported on the platform.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/bdw-rt5650.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index af2f502..eedbdad 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -83,6 +83,36 @@ static struct snd_soc_jack_pin mic_jack_pin = {
 	.mask	= SND_JACK_MICROPHONE,
 };
 
+static const unsigned int channels[] = {
+	2, 4,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_channels = {
+	.count = ARRAY_SIZE(channels),
+	.list = channels,
+	.mask = 0,
+};
+
+static int bdw_fe_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	/*
+	 * On this platform for PCM device we support,
+	 * 2 or 4 channel capture
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		snd_pcm_hw_constraint_list(runtime, 0,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   &constraints_channels);
+
+	return 0;
+}
+
+static const struct snd_soc_ops bdw_rt5650_fe_ops = {
+	.startup = bdw_fe_startup,
+};
+
 static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 			struct snd_pcm_hw_params *params)
 {
@@ -234,6 +264,7 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.name = "System PCM",
 		.stream_name = "System Playback",
 		.dynamic = 1,
+		.ops = &bdw_rt5650_fe_ops,
 #if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 		.init = bdw_rt5650_rtd_init,
 #endif
-- 
2.7.4

