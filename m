Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A92D425C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 13:46:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6998316A8;
	Wed,  9 Dec 2020 13:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6998316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607517995;
	bh=hoSusc6DDDZG9gakRMV3tve5/LkAoxPQPpNfgTZXQJs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ioLbM9wP98KN7B+faRN38HCgcDxIZqqbFjXbrDZM+K6jZOYDGjoiniiRr9tVGvkOa
	 Xacysf4yFw1/VotovE2W0bV9MCmj2SbVvhzc3wI9BT5vu7WAvwoV7RigElEgjGITSd
	 evp5bGlkCcPHt+C4q9KAaMC2/0Uah4Vid+eS6cn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C544F804C2;
	Wed,  9 Dec 2020 13:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44FE9F80240; Wed,  9 Dec 2020 13:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FD6DF801D8
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 13:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD6DF801D8
Received: from [123.114.42.209] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kmyp6-0003Vb-Qd; Wed, 09 Dec 2020 12:44:01 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [RFC][PATCH 1/2] alsa: jack: expand snd_jack_report parameter for
 jack sw_inject
Date: Wed,  9 Dec 2020 20:43:43 +0800
Message-Id: <20201209124344.219158-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201209124344.219158-1-hui.wang@canonical.com>
References: <20201209124344.219158-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is the preparation for supporting jack software plug in/out
injection, when users enable the software injection, the jack state
shouldn't be changed by hw events or other non-injection events
anymore, so adding a parameter in the snd_jack_report() to distinguish
if the function is called from software injection or not.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 include/sound/jack.h            | 4 ++--
 sound/core/jack.c               | 3 ++-
 sound/pci/hda/hda_jack.c        | 6 +++---
 sound/pci/hda/patch_hdmi.c      | 2 +-
 sound/pci/oxygen/xonar_wm87x6.c | 2 +-
 sound/soc/soc-jack.c            | 2 +-
 sound/x86/intel_hdmi_audio.c    | 4 ++--
 7 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/sound/jack.h b/include/sound/jack.h
index 9eb2b5ec1ec4..17f71fe38ed5 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -81,7 +81,7 @@ void snd_jack_set_parent(struct snd_jack *jack, struct device *parent);
 int snd_jack_set_key(struct snd_jack *jack, enum snd_jack_types type,
 		     int keytype);
 #endif
-void snd_jack_report(struct snd_jack *jack, int status);
+void snd_jack_report(struct snd_jack *jack, int status, bool sw_inject);
 
 #else
 static inline int snd_jack_new(struct snd_card *card, const char *id, int type,
@@ -95,7 +95,7 @@ static inline int snd_jack_add_new_kctl(struct snd_jack *jack, const char * name
 	return 0;
 }
 
-static inline void snd_jack_report(struct snd_jack *jack, int status)
+static inline void snd_jack_report(struct snd_jack *jack, int status, bool sw_inject)
 {
 }
 
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 503c8af79d55..49b9461aef51 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -336,8 +336,9 @@ EXPORT_SYMBOL(snd_jack_set_key);
  *
  * @jack:   The jack to report status for
  * @status: The current status of the jack
+ * @sw_inject: Indicate if this is called from jack software inject
  */
-void snd_jack_report(struct snd_jack *jack, int status)
+void snd_jack_report(struct snd_jack *jack, int status, bool sw_inject)
 {
 	struct snd_jack_kctl *jack_kctl;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index 588059428d8f..152d651df74e 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -414,10 +414,10 @@ void snd_hda_jack_report_sync(struct hda_codec *codec)
 			state = jack->button_state;
 			if (get_jack_plug_state(jack->pin_sense))
 				state |= jack->type;
-			snd_jack_report(jack->jack, state);
+			snd_jack_report(jack->jack, state, false);
 			if (jack->button_state) {
 				snd_jack_report(jack->jack,
-						state & ~jack->button_state);
+						state & ~jack->button_state, false);
 				jack->button_state = 0; /* button released */
 			}
 		}
@@ -503,7 +503,7 @@ int snd_hda_jack_add_kctl_mst(struct hda_codec *codec, hda_nid_t nid,
 	}
 
 	state = snd_hda_jack_detect_mst(codec, nid, dev_id);
-	snd_jack_report(jack->jack, state ? jack->type : 0);
+	snd_jack_report(jack->jack, state ? jack->type : 0, false);
 
 	return 0;
 }
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index b0068f8ca46d..f19762a6e9e7 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1590,7 +1590,7 @@ static void update_eld(struct hda_codec *codec,
 	if (eld_changed && pcm_jack)
 		snd_jack_report(pcm_jack,
 				(eld->monitor_present && eld->eld_valid) ?
-				SND_JACK_AVOUT : 0);
+				SND_JACK_AVOUT : 0, false);
 }
 
 /* update ELD and jack state via HD-audio verbs */
diff --git a/sound/pci/oxygen/xonar_wm87x6.c b/sound/pci/oxygen/xonar_wm87x6.c
index 8aa92f3e5ee8..595e10275bd9 100644
--- a/sound/pci/oxygen/xonar_wm87x6.c
+++ b/sound/pci/oxygen/xonar_wm87x6.c
@@ -251,7 +251,7 @@ static void xonar_ds_handle_hp_jack(struct oxygen *chip)
 		reg |= WM8766_MUTEALL;
 	wm8766_write_cached(chip, WM8766_DAC_CTRL, reg);
 
-	snd_jack_report(data->hp_jack, hp_plugged ? SND_JACK_HEADPHONE : 0);
+	snd_jack_report(data->hp_jack, hp_plugged ? SND_JACK_HEADPHONE : 0, false);
 
 	mutex_unlock(&chip->mutex);
 }
diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index 0f1820f36b4d..5b98f5fa4537 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -78,7 +78,7 @@ void snd_soc_jack_report(struct snd_soc_jack *jack, int status, int mask)
 	if (sync)
 		snd_soc_dapm_sync(dapm);
 
-	snd_jack_report(jack->jack, jack->status);
+	snd_jack_report(jack->jack, jack->status, false);
 
 	mutex_unlock(&jack->mutex);
 }
diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 9f9fcd2749f2..e12dce8daed0 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1363,7 +1363,7 @@ static void had_process_hot_plug(struct snd_intelhad *intelhaddata)
 		had_substream_put(intelhaddata);
 	}
 
-	snd_jack_report(intelhaddata->jack, SND_JACK_AVOUT);
+	snd_jack_report(intelhaddata->jack, SND_JACK_AVOUT, false);
 }
 
 /* process hot unplug, called from wq with mutex locked */
@@ -1398,7 +1398,7 @@ static void had_process_hot_unplug(struct snd_intelhad *intelhaddata)
 		had_substream_put(intelhaddata);
 	}
 
-	snd_jack_report(intelhaddata->jack, 0);
+	snd_jack_report(intelhaddata->jack, 0, false);
 }
 
 /*
-- 
2.25.1

