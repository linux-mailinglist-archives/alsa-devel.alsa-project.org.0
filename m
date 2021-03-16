Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15B33D371
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 12:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A5D18A4;
	Tue, 16 Mar 2021 12:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A5D18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615895879;
	bh=KNsyDEdhU/TZGu0peuH8OE7gFBtTMraM8AiK4zTf7XI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PBZvDJMjvNn7cuC1aKLrNJpSoziRTp/iOPJ3O3r1loHnASQ53Bt1gzdW2BO3lmH+s
	 xMUsxeT8Prg3eVmk5/7QniIZtzJNmMalrmuHjwD8wW9B/dVCpFlTau1+fRx+uuOQQr
	 ygTE2QVxFFEnHqTxjzat6miKJ7kN/GFbCMQ9FXQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D83F80137;
	Tue, 16 Mar 2021 12:56:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE8B5F80163; Tue, 16 Mar 2021 12:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31539F8013F
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 12:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31539F8013F
Received: from [123.112.71.149] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lM8In-0001C1-Gk; Tue, 16 Mar 2021 11:55:58 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek: add more delay time before
 determine_headset_type
Date: Tue, 16 Mar 2021 19:55:49 +0800
Message-Id: <20210316115549.240014-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
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

We found a recording issue on the headset-mic recently, sometimes
users plug a headset and select headset-mic from UI, but can't record
any sound from headset-mic. The root cause is the
determine_headset_type() returns a wrong type, e.g. users plug a ctia
type headset, but that function returns omtp type.

In the past, determine_headset_type() worked well because the internal
mic is connected to the codec, so the "Input Source" or
"Capture Source" is internal mic by default when users plug a headset,
the determine_headset_type() will not be called unless users select
headset-mic from UI, when users select headset-mic, the plugging
action already finished and the headset is completely plugged into the
jack, so determine_headset_type() could return a correct type.

But more and more machines connect the internal mic to the PCH now,
and the "Input Source" is headset mic by default, when users plug a
headset, the determine_headset_type() will be called immediately, if
the headset is not completely plugged in, it will return a wrong type.

Here add 2s delay before calling determine_headset_type(), and since
there is a pop-up dialogue when users do plugging action, to avoid
freezing the UI, use the deleyed_work to call that function.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b47504fa8dfd..1f6fc8addf3e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -127,6 +127,8 @@ struct alc_spec {
 	unsigned int coef0;
 	struct input_dev *kb_dev;
 	u8 alc_mute_keycode_map[1];
+	struct hda_codec *codec;
+	struct delayed_work headset_set_work;
 };
 
 /*
@@ -1160,6 +1162,7 @@ static int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
 		kfree(spec);
 		return err;
 	}
+	spec->codec = codec;
 	return 0;
 }
 
@@ -5363,6 +5366,21 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 	spec->current_headset_type = is_ctia ? ALC_HEADSET_TYPE_CTIA : ALC_HEADSET_TYPE_OMTP;
 }
 
+static void alc_headset_check_and_set(struct work_struct *work)
+{
+	struct alc_spec *spec = container_of(work, struct alc_spec,
+					     headset_set_work.work);
+	struct hda_codec *codec = spec->codec;
+
+	if (spec->current_headset_type == ALC_HEADSET_TYPE_UNKNOWN)
+		alc_determine_headset_type(codec);
+	if (spec->current_headset_type == ALC_HEADSET_TYPE_CTIA)
+		alc_headset_mode_ctia(codec);
+	else if (spec->current_headset_type == ALC_HEADSET_TYPE_OMTP)
+		alc_headset_mode_omtp(codec);
+	spec->gen.hp_jack_present = true;
+}
+
 static void alc_update_headset_mode(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
@@ -5386,6 +5404,7 @@ static void alc_update_headset_mode(struct hda_codec *codec)
 		return;
 	}
 
+	cancel_delayed_work_sync(&spec->headset_set_work);
 	switch (new_headset_mode) {
 	case ALC_HEADSET_MODE_UNPLUGGED:
 		alc_headset_mode_unplugged(codec);
@@ -5394,13 +5413,7 @@ static void alc_update_headset_mode(struct hda_codec *codec)
 		spec->gen.hp_jack_present = false;
 		break;
 	case ALC_HEADSET_MODE_HEADSET:
-		if (spec->current_headset_type == ALC_HEADSET_TYPE_UNKNOWN)
-			alc_determine_headset_type(codec);
-		if (spec->current_headset_type == ALC_HEADSET_TYPE_CTIA)
-			alc_headset_mode_ctia(codec);
-		else if (spec->current_headset_type == ALC_HEADSET_TYPE_OMTP)
-			alc_headset_mode_omtp(codec);
-		spec->gen.hp_jack_present = true;
+		schedule_delayed_work(&spec->headset_set_work, msecs_to_jiffies(2000));
 		break;
 	case ALC_HEADSET_MODE_MIC:
 		alc_headset_mode_mic_in(codec, hp_pin, spec->headphone_mic_pin);
@@ -5466,6 +5479,7 @@ static void alc_fixup_headset_mode(struct hda_codec *codec,
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC | HDA_PINCFG_HEADPHONE_MIC;
 		break;
 	case HDA_FIXUP_ACT_PROBE:
+		INIT_DELAYED_WORK(&spec->headset_set_work, alc_headset_check_and_set);
 		alc_probe_headset_mode(codec);
 		break;
 	case HDA_FIXUP_ACT_INIT:
@@ -5475,6 +5489,9 @@ static void alc_fixup_headset_mode(struct hda_codec *codec,
 		}
 		alc_update_headset_mode(codec);
 		break;
+	case HDA_FIXUP_ACT_FREE:
+		cancel_delayed_work_sync(&spec->headset_set_work);
+		break;
 	}
 }
 
-- 
2.25.1

