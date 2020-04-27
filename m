Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC01B9A96
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 10:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05FC51663;
	Mon, 27 Apr 2020 10:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05FC51663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587977115;
	bh=O0XhvCLiVDwdW+Eqjl81Hb5Y7zjpZMOPwNtrNzeiGYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLYM4a7CkEk/SeFAkIUUl/AdISeS8EUxbRJMlPbHgEXQRPxFDiuVx6WXu2NWPxWG0
	 owIpTJDj1oUw+3BAUevn+1fjSoD5sPoeL3FIVyI2m0qTZi7gh10cjHKrGyaN9umnP0
	 ZpZTOkM0AbaBKG5lgwIuxRH411qVnHNTCv3mThZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDDF8F80257;
	Mon, 27 Apr 2020 10:43:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 359F6F80247; Mon, 27 Apr 2020 10:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB26DF80217
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 10:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB26DF80217
IronPort-SDR: k/kWOIE14aU/EsaUyijR9Cz1ZGdMzZeYWhtqYzpoJ/xWbVqp1ce+af9Bm2Tfj2DxmlqtQKfT+c
 dqcEL/m0m4lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 01:43:28 -0700
IronPort-SDR: W70FpfbFGXv4Y15djW/k2nA39A02axB8Ze4UMVrqXxjarL2+9R+SQnaYfuJDlmdIsDLkTx6wbH
 3IID+bCEHg/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; d="scan'208";a="431673902"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga005.jf.intel.com with ESMTP; 27 Apr 2020 01:43:26 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: bdw-rt5677: channel constraint support
Date: Mon, 27 Apr 2020 16:37:16 +0800
Message-Id: <1587976638-29806-2-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587976638-29806-1-git-send-email-brent.lu@intel.com>
References: <1587976638-29806-1-git-send-email-brent.lu@intel.com>
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

BDW boards using this machine driver supports only stereo capture and
playback. Implement a constraint to enforce it.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index cc41a34..7963cae 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -22,6 +22,8 @@
 
 #include "../../codecs/rt5677.h"
 
+#define DUAL_CHANNEL 2
+
 struct bdw_rt5677_priv {
 	struct gpio_desc *gpio_hp_en;
 	struct snd_soc_component *component;
@@ -222,6 +224,36 @@ static int bdw_rt5677_rtd_init(struct snd_soc_pcm_runtime *rtd)
 }
 #endif
 
+static const unsigned int channels[] = {
+	DUAL_CHANNEL,
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
+	 * stereo audio
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+					   &constraints_channels);
+
+	return 0;
+}
+
+static const struct snd_soc_ops bdw_rt5677_fe_ops = {
+	.startup = bdw_fe_startup,
+};
+
 static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bdw_rt5677_priv *bdw_rt5677 =
@@ -321,6 +353,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		},
 		.dpcm_capture = 1,
 		.dpcm_playback = 1,
+		.ops = &bdw_rt5677_fe_ops,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
-- 
2.7.4

