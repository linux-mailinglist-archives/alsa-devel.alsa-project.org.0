Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0855049CCB3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 15:51:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4B91F00;
	Wed, 26 Jan 2022 15:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4B91F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643208694;
	bh=SYp4kCs0nGUocyRWrl6Y6pTQmQ5qes0TeGJmFEWm8cU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jfY/t1YSwJW8KT+cGyVs38ZfysIWLyzbo9hn9aqbwPN2iAwj5aWj2f4h5Z5rrEhP1
	 WF/8StLcOF9j87Uvpzu05h44CregrbGLV2OWL2e4A+zUC10u9yHVttI0N6ZlR1xtMr
	 nWEYJkqm9To0YQ+fv43m4E14pMLqyTG5DPFaYJ7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D80B5F804BC;
	Wed, 26 Jan 2022 15:50:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BB6CF8049C; Wed, 26 Jan 2022 15:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99175F800C8
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 15:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99175F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="04cpKgYu"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="jvTcs03U"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A0F1F1F3B7;
 Wed, 26 Jan 2022 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643208618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wfDmYtqmFBV7F7gqCio+wB2zyI+sQTwZIPC3pwmVNOQ=;
 b=04cpKgYu0Wi/5Z+wGNWh4ugbjPn7ZJv3fghdFB8S22fLTW0KwvYVIWz7dLc4j/4Bb/4bLt
 86bXt6jN8jHuzQcPxApIc7xrBIHN2g7qQs5vRv1+IE+iVuB9bqtbD/TJWXIcHWed/k5rJp
 0HlNbAbOGFArK6GqZ+W6mxrkZiRl7oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643208618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wfDmYtqmFBV7F7gqCio+wB2zyI+sQTwZIPC3pwmVNOQ=;
 b=jvTcs03Uj/a3ZGVgFHcEZ3nder4EwLNeWy3m461/FPNQbJ1lll1gkZPgF1qONkMyC47gj9
 qJkviod5rTnE8YAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 99562A3B84;
 Wed, 26 Jan 2022 14:50:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Fix UAF of leds class devs at unbinding
Date: Wed, 26 Jan 2022 15:50:11 +0100
Message-Id: <20220126145011.16728-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Sergeyev <sergeev917@gmail.com>
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

The LED class devices that are created by HD-audio codec drivers are
registered via devm_led_classdev_register() and associated with the
HD-audio codec device.  Unfortunately, it turned out that the devres
release doesn't work for this case; namely, since the codec resource
release happens before the devm call chain, it triggers a NULL
dereference or a UAF for a stale set_brightness_delay callback.

For fixing the bug, this patch changes the LED class device register
and unregister in a manual manner without devres, keeping the
instances in hda_gen_spec.

Reported-by: Alexander Sergeyev <sergeev917@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20220111195229.a77wrpjclqwrx4bx@localhost.localdomain
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 17 +++++++++++++++--
 sound/pci/hda/hda_generic.h |  3 +++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 3bf5e3410703..fc114e522480 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -91,6 +91,12 @@ static void snd_hda_gen_spec_free(struct hda_gen_spec *spec)
 	free_kctls(spec);
 	snd_array_free(&spec->paths);
 	snd_array_free(&spec->loopback_list);
+#ifdef CONFIG_SND_HDA_GENERIC_LEDS
+	if (spec->led_cdevs[LED_AUDIO_MUTE])
+		led_classdev_unregister(spec->led_cdevs[LED_AUDIO_MUTE]);
+	if (spec->led_cdevs[LED_AUDIO_MICMUTE])
+		led_classdev_unregister(spec->led_cdevs[LED_AUDIO_MICMUTE]);
+#endif
 }
 
 /*
@@ -3922,7 +3928,10 @@ static int create_mute_led_cdev(struct hda_codec *codec,
 						enum led_brightness),
 				bool micmute)
 {
+	struct hda_gen_spec *spec = codec->spec;
 	struct led_classdev *cdev;
+	int idx = micmute ? LED_AUDIO_MICMUTE : LED_AUDIO_MUTE;
+	int err;
 
 	cdev = devm_kzalloc(&codec->core.dev, sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
@@ -3932,10 +3941,14 @@ static int create_mute_led_cdev(struct hda_codec *codec,
 	cdev->max_brightness = 1;
 	cdev->default_trigger = micmute ? "audio-micmute" : "audio-mute";
 	cdev->brightness_set_blocking = callback;
-	cdev->brightness = ledtrig_audio_get(micmute ? LED_AUDIO_MICMUTE : LED_AUDIO_MUTE);
+	cdev->brightness = ledtrig_audio_get(idx);
 	cdev->flags = LED_CORE_SUSPENDRESUME;
 
-	return devm_led_classdev_register(&codec->core.dev, cdev);
+	err = led_classdev_register(&codec->core.dev, cdev);
+	if (err < 0)
+		return err;
+	spec->led_cdevs[idx] = cdev;
+	return 0;
 }
 
 /**
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 8e1bc8ea74fc..34eba40cc6e6 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -294,6 +294,9 @@ struct hda_gen_spec {
 				   struct hda_jack_callback *cb);
 	void (*mic_autoswitch_hook)(struct hda_codec *codec,
 				    struct hda_jack_callback *cb);
+
+	/* leds */
+	struct led_classdev *led_cdevs[NUM_AUDIO_LEDS];
 };
 
 /* values for add_stereo_mix_input flag */
-- 
2.31.1

