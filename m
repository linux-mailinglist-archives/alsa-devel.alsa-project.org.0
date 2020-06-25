Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1378720A59F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:18:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B216D852;
	Thu, 25 Jun 2020 21:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B216D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112730;
	bh=Cjo0s5Tb70XkNoNXFwvhM+CojMz4E3aVwYjswLjTVq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvQClOxaK7vV4KhyqbyN0UkfsBX8rV8J1GAXZ+ggSRvzgve5p/fM5NTxnheSUX8So
	 T7LEL291bG6ZEQOsHqclgLDQGKFKtx4B+mtPHC64GOravh0mq8f9LL/Yzr/C/1Xl8x
	 cip89vSsNBON/CTVYWIpkUa+wF9O7AudekPx/LGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 686EEF802E9;
	Thu, 25 Jun 2020 21:14:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1F5BF802DB; Thu, 25 Jun 2020 21:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C02F802BC
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C02F802BC
IronPort-SDR: tZCCou8dWytEmXAUpmvd/8VbjiWBrwrTjSW6PnBU+RI1uwt3SgoM3jLyvJvoPf2q8HaQhiaBz9
 hORJB+8Q+KTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120823"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:37 -0700
IronPort-SDR: D8H8uIf7HBlXfM8Pu1WInMQp0lybYUkA9wwMO0jXCS1KNklmlxYE/A253JRXNG1U+kZ2r6Dala
 6+/W8cd4Kwtg==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559507"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/17] ASoC: Intel: Boards: tgl_max98373: add dai_trigger
 function
Date: Thu, 25 Jun 2020 14:12:58 -0500
Message-Id: <20200625191308.3322-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dharageswari R <dharageswari.r@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Dharageswari R <dharageswari.r@intel.com>

Speaker amplifier feedback is not modeled as being dependent on any
active output. Even when there is no playback happening, parts of the
graph, specifically the IV sense->speaker protection->output remains
active and this prevents the DSP from entering low-power states.

This patch suggests a machine driver level approach where the speaker
pins are enabled/disabled dynamically depending on stream start/stop
events. DPAM graph representations show the feedback loop is indeed
disabled and low-power states can be reached.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dharageswari R <dharageswari.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 45 +++++++++++++++++++++++
 sound/soc/intel/boards/sof_rt5682.c       |  9 +++++
 2 files changed, 54 insertions(+)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 1a549b32d1c9..b7014c424163 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -9,6 +9,8 @@
 #include <uapi/sound/asound.h>
 #include "sof_maxim_common.h"
 
+#define MAX_98373_PIN_NAME 16
+
 static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Left BE_OUT" },
@@ -57,8 +59,51 @@ static int max98373_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int max98373_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	int j;
+	int ret = 0;
+
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
+		struct snd_soc_component *component = codec_dai->component;
+		struct snd_soc_dapm_context *dapm =
+				snd_soc_component_get_dapm(component);
+		char pin_name[MAX_98373_PIN_NAME];
+
+		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
+			 codec_dai->component->name_prefix);
+
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_START:
+		case SNDRV_PCM_TRIGGER_RESUME:
+		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+			ret = snd_soc_dapm_enable_pin(dapm, pin_name);
+			if (!ret)
+				snd_soc_dapm_sync(dapm);
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			/* Make sure no streams are active before disable pin */
+			if (snd_soc_dai_active(codec_dai) != 1)
+				break;
+			ret = snd_soc_dapm_disable_pin(dapm, pin_name);
+			if (!ret)
+				snd_soc_dapm_sync(dapm);
+			break;
+		default:
+			break;
+		}
+	}
+
+	return ret;
+}
+
 struct snd_soc_ops max_98373_ops = {
 	.hw_params = max98373_hw_params,
+	.trigger = max98373_trigger,
 };
 
 int max98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f80ed62025f3..20ab2664f7c8 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -318,6 +318,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = NULL;
+	struct snd_soc_dapm_context *dapm = &card->dapm;
 	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
 	int err;
@@ -356,6 +357,14 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 		i++;
 	}
 
+	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+		/* Disable Left and Right Spk pin after boot */
+		snd_soc_dapm_disable_pin(dapm, "Left Spk");
+		snd_soc_dapm_disable_pin(dapm, "Right Spk");
+		err = snd_soc_dapm_sync(dapm);
+		if (err < 0)
+			return err;
+	}
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
-- 
2.20.1

