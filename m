Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9CCFF44
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BECD1665;
	Tue,  8 Oct 2019 18:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BECD1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570553516;
	bh=9DeLmkUqjnA8c6T4pOkw/DTAnujB8LKYbbou8kkI4Oo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwFFaKgUgvaiGeQGMFEw7ZMCdCt3haHtEouE9/WYdsIxUP1TX8R350OJ3N+1bqpSK
	 waDXM2I5WXmcXxnqopMZLZz3dO2Kya4gz8ktG+eH6+gMNtMCSVVsmhjU6AnBrxWSB4
	 c/QwqEVElr5b8Dwd6UVKVUVWJ6LEWu8YKsbsd3a8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D50A2F80677;
	Tue,  8 Oct 2019 18:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1255BF8060F; Tue,  8 Oct 2019 18:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50D49F80322
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50D49F80322
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="218338342"
Received: from kwwong-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.150.53])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2019 09:44:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  8 Oct 2019 11:44:43 -0500
Message-Id: <20191008164443.1358-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
References: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 9/9] ASoC: SOF: acpi led support for switch
	controls
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Currently sof doesn't support acpi leds with mute switches. So implement
acpi leds following quite shamelessly existing HDA implementation by
Takashi Iwai.

Mute leds can be enabled in topology by adding led and direction token
in switch control private data.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  4 ++++
 sound/soc/sof/control.c         | 32 ++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h        |  9 +++++++++
 sound/soc/sof/topology.c        | 13 +++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index da18c9de1056..d65406f34361 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -113,4 +113,8 @@
 /* ESAI */
 #define SOF_TKN_IMX_ESAI_MCLK_ID		1100
 
+/* Led control for mute switches */
+#define SOF_TKN_MUTE_LED_USE			1300
+#define SOF_TKN_MUTE_LED_DIRECTION		1301
+
 #endif
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index a4983f90ff5b..41551e8f6ac3 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -11,8 +11,37 @@
 /* Mixer Controls */
 
 #include <linux/pm_runtime.h>
+#include <linux/leds.h>
 #include "sof-priv.h"
 
+static void update_mute_led(struct snd_sof_control *scontrol,
+			    struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int temp = 0;
+	unsigned int mask;
+	int i;
+
+	mask = 1U << snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
+
+	for (i = 0; i < scontrol->num_channels; i++) {
+		if (ucontrol->value.integer.value[i]) {
+			temp |= mask;
+			break;
+		}
+	}
+
+	if (temp == scontrol->led_ctl.led_value)
+		return;
+
+	scontrol->led_ctl.led_value = temp;
+
+	if (!scontrol->led_ctl.direction)
+		ledtrig_audio_set(LED_AUDIO_MUTE, temp ? LED_OFF : LED_ON);
+	else
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, temp ? LED_OFF : LED_ON);
+}
+
 static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
 {
 	if (value >= size)
@@ -112,6 +141,9 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 		cdata->chanv[i].channel = i;
 	}
 
+	if (scontrol->led_ctl.use_led)
+		update_mute_led(scontrol, kcontrol, ucontrol);
+
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(sdev->dev))
 		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 44f789bf7fb0..5a11a8517fa5 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -15,6 +15,7 @@
 
 #include <sound/hdaudio.h>
 #include <sound/soc.h>
+#include <sound/control.h>
 
 #include <sound/sof.h>
 #include <sound/sof/stream.h> /* needs to be included before control.h */
@@ -310,6 +311,12 @@ struct snd_sof_pcm {
 	bool prepared[2]; /* PCM_PARAMS set successfully */
 };
 
+struct snd_sof_led_control {
+	unsigned int use_led;
+	unsigned int direction;
+	unsigned int led_value;
+};
+
 /* ALSA SOF Kcontrol device */
 struct snd_sof_control {
 	struct snd_sof_dev *sdev;
@@ -324,6 +331,8 @@ struct snd_sof_control {
 	u32 *volume_table; /* volume table computed from tlv data*/
 
 	struct list_head list;	/* list in sdev control list */
+
+	struct snd_sof_led_control led_ctl;
 };
 
 /* ASoC SOF DAPM widget */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3f598c18a5da..a29109ea3c06 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -689,6 +689,14 @@ static const struct sof_topology_token dmic_pdm_tokens[] = {
 static const struct sof_topology_token hda_tokens[] = {
 };
 
+/* Leds */
+static const struct sof_topology_token led_tokens[] = {
+	{SOF_TKN_MUTE_LED_USE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+	 offsetof(struct snd_sof_led_control, use_led), 0},
+	{SOF_TKN_MUTE_LED_DIRECTION, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+	 get_token_u32, offsetof(struct snd_sof_led_control, direction), 0},
+};
+
 static void sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 				  void *object,
 				  const struct sof_topology_token *tokens,
@@ -951,6 +959,11 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	}
 
 out:
+	/* set up possible led control from mixer private data */
+	ret = sof_parse_tokens(scomp, &scontrol->led_ctl, led_tokens,
+			       ARRAY_SIZE(led_tokens), mc->priv.array,
+			       le32_to_cpu(mc->priv.size));
+
 	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
