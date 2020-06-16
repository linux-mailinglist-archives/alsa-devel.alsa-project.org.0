Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA911FA7EB
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 06:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A5F168A;
	Tue, 16 Jun 2020 06:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A5F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592283000;
	bh=w5mrW+OWPyUJS1s/NVbWDhxsVteA862jXL3kd4Qbt8w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MFO83xwXhEntyiqM4J/5CHsJXNeZziX/FiZaIj5NEH+4BuZzVi3E/pe+n1wqePmBH
	 C0a9ydWMFBdTliwqsN7j3pQYV7bek28cXRc0T++ov0h30xe2nVSbh5+6dtVxTCPS/A
	 pCI+9lVU4nvZRFEJEKOAhFjKKlbIFpopgpkY9Kf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1536DF80255;
	Tue, 16 Jun 2020 06:47:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1304CF80232; Tue, 16 Jun 2020 06:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 055D4F80232
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 06:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 055D4F80232
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jl3V4-0004Qd-59; Tue, 16 Jun 2020 04:47:06 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH 1/2] ALSA: hda: Make codec controlled LED support more generic
Date: Tue, 16 Jun 2020 12:46:58 +0800
Message-Id: <20200616044702.17570-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Kailang Yang <kailang@realtek.com>,
 Tomas Espeleta <tomas.espeleta@gmail.com>, Thomas Hebb <tommyhebb@gmail.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>
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

Currently, only HDA codec GPIO controlled LED class is supported, and
only via platform specific quirk.

There are systems that control LED via COEF instead of GPIO, and to
support those systems, move the LED class registration to
snd_hda_gen_add_micmute_led(), so all systems can facilitate the same
interface.

In addition to that, add LED_CORE_SUSPENDRESUME flag since some systems
don't restore the LED properly after suspend.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/hda_generic.c   | 28 ++++++++++++++++++++++++++++
 sound/pci/hda/patch_realtek.c | 30 ------------------------------
 2 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index f4e9d9445e18..4242407734c0 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -4006,6 +4006,28 @@ static const struct snd_kcontrol_new micmute_led_mode_ctl = {
  *
  * Returns 0 if the hook is established or a negative error code.
  */
+
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
+static int micmute_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
+{
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
+	struct hda_gen_spec *spec = codec->spec;
+
+	spec->micmute_led.led_mode = !brightness;
+	call_micmute_led_update(codec);
+	return 0;
+}
+
+static struct led_classdev micmute_led_cdev = {
+	.name = "hda::micmute",
+	.max_brightness = 1,
+	.brightness_set_blocking = micmute_led_set,
+	.default_trigger = "audio-micmute",
+	.flags = LED_CORE_SUSPENDRESUME,
+};
+#endif
+
 int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 				void (*hook)(struct hda_codec *))
 {
@@ -4019,6 +4041,12 @@ int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 	spec->cap_sync_hook = update_micmute_led;
 	if (!snd_hda_gen_add_kctl(spec, NULL, &micmute_led_mode_ctl))
 		return -ENOMEM;
+
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
+	micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+	if (devm_led_classdev_register(&codec->core.dev, &micmute_led_cdev))
+		codec_warn(codec, "failed to register micmute LED\n");
+#endif
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led);
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6d73f8beadb6..cead44a6c6cd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4109,26 +4109,6 @@ static void alc_gpio_micmute_update(struct hda_codec *codec)
 			    spec->gen.micmute_led.led_value);
 }
 
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-static int micmute_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness brightness)
-{
-	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
-	struct alc_spec *spec = codec->spec;
-
-	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
-			    spec->micmute_led_polarity, !!brightness);
-	return 0;
-}
-
-static struct led_classdev micmute_led_cdev = {
-	.name = "hda::micmute",
-	.max_brightness = 1,
-	.brightness_set_blocking = micmute_led_set,
-	.default_trigger = "audio-micmute",
-};
-#endif
-
 /* setup mute and mic-mute GPIO bits, add hooks appropriately */
 static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  int action,
@@ -4136,9 +4116,6 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  unsigned int micmute_mask)
 {
 	struct alc_spec *spec = codec->spec;
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-	int err;
-#endif
 
 	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
 
@@ -4151,13 +4128,6 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 	if (micmute_mask) {
 		spec->gpio_mic_led_mask = micmute_mask;
 		snd_hda_gen_add_micmute_led(codec, alc_gpio_micmute_update);
-
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-		err = devm_led_classdev_register(&codec->core.dev, &micmute_led_cdev);
-		if (err)
-			codec_warn(codec, "failed to register micmute LED\n");
-#endif
 	}
 }
 
-- 
2.17.1

