Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6B1B9A9B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 10:46:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184C51678;
	Mon, 27 Apr 2020 10:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184C51678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587977166;
	bh=jEKs/Y8imqy9Bec6QAZ3V+b0vN34OcmRy8ZzvgSIgEI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsIrTpDOsgSPmkyKXmLBFuvQg11Np8i5dfEmQGoo4qyfuEbaSQI7joebz46Xm4pjC
	 8DjylWNQBFYMsM7DndCEc41WdnP3bdwCHkLqM1Xp5yyNo3rm/zzXxP2rEnqKsADMc0
	 RxNbtipUkF0zB3+L0iswerOWbpno0XTgR4r6PyOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6475F80290;
	Mon, 27 Apr 2020 10:43:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBFF4F80290; Mon, 27 Apr 2020 10:43:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56710F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 10:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56710F8010A
IronPort-SDR: I9bET36E25pZaXF2MI8nPTWh6vC8JnycsqqR+Mc/9M3QyH2MtohsyJIWKOQwzqJnCg8LlQoYeI
 ArSRqUymXiYw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 01:43:37 -0700
IronPort-SDR: 4/00gL9/7jS1ZNxqq4qbycgNDswACXAMhZoAlrM9zqX9PK+BxZQtr1Xnn+K8qZOUxg6nFp0NOR
 CscCb8qCNlag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; d="scan'208";a="431673972"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga005.jf.intel.com with ESMTP; 27 Apr 2020 01:43:34 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: broadwell: channel constraint support
Date: Mon, 27 Apr 2020 16:37:18 +0800
Message-Id: <1587976638-29806-4-git-send-email-brent.lu@intel.com>
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
 sound/soc/intel/boards/broadwell.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index f9a8336..09347f2 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -19,6 +19,8 @@
 
 #include "../../codecs/rt286.h"
 
+#define DUAL_CHANNEL 2
+
 static struct snd_soc_jack broadwell_headset;
 /* Headset jack detection DAPM pins */
 static struct snd_soc_jack_pin broadwell_headset_pins[] = {
@@ -143,6 +145,36 @@ static int broadwell_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
+static int broadwell_fe_startup(struct snd_pcm_substream *substream)
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
+static const struct snd_soc_ops broadwell_fe_ops = {
+	.startup = broadwell_fe_startup,
+};
+
 SND_SOC_DAILINK_DEF(system,
 	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
 
@@ -180,6 +212,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.init = broadwell_rtd_init,
 #endif
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.ops = &broadwell_fe_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
-- 
2.7.4

