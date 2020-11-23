Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8342C01D4
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:01:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 911D11686;
	Mon, 23 Nov 2020 10:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 911D11686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122090;
	bh=AYkLz8/u5opVFSLg2jqoGIWkV7gM7GFqTHIOJYbEyLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gln8+lzyov7Af8ajPY/MaxvxCTNHWoWtOLy9QIX2O6iqpYKZ7n3GLQEB7X7sTxux7
	 6as10LfahDxn8+MBkIUjqQzpnZWO3n9MPDbpgkXqo4RtEDrIq6FuJ2GunSJQiPGUMt
	 7TQ0KVKMwPPQJKO+zoe59ycdWkFJyx/5GHboAaXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFDFAF80558;
	Mon, 23 Nov 2020 09:54:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3E53F80528; Mon, 23 Nov 2020 09:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E7DCF804CB
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7DCF804CB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF8D2AFB4;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/41] ALSA: usb-audio: Drop keep_interface flag again
Date: Mon, 23 Nov 2020 09:53:21 +0100
Message-Id: <20201123085347.19667-16-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

This behavior turned out to be invalid from the USB spec POV and
shouldn't be applied.  As it's an optional flag that is set only via
an card control element that must be hardly used, let's drop it
again.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c    | 46 ----------------------------------------------
 sound/usb/pcm.c      | 17 +++++++----------
 sound/usb/usbaudio.h |  3 ---
 3 files changed, 7 insertions(+), 59 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 81e987eaf063..12b15ed59eaa 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3454,48 +3454,6 @@ static int snd_usb_mixer_status_create(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
-static int keep_iface_ctl_get(struct snd_kcontrol *kcontrol,
-			      struct snd_ctl_elem_value *ucontrol)
-{
-	struct usb_mixer_interface *mixer = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.integer.value[0] = mixer->chip->keep_iface;
-	return 0;
-}
-
-static int keep_iface_ctl_put(struct snd_kcontrol *kcontrol,
-			      struct snd_ctl_elem_value *ucontrol)
-{
-	struct usb_mixer_interface *mixer = snd_kcontrol_chip(kcontrol);
-	bool keep_iface = !!ucontrol->value.integer.value[0];
-
-	if (mixer->chip->keep_iface == keep_iface)
-		return 0;
-	mixer->chip->keep_iface = keep_iface;
-	return 1;
-}
-
-static const struct snd_kcontrol_new keep_iface_ctl = {
-	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-	.name = "Keep Interface",
-	.info = snd_ctl_boolean_mono_info,
-	.get = keep_iface_ctl_get,
-	.put = keep_iface_ctl_put,
-};
-
-static int create_keep_iface_ctl(struct usb_mixer_interface *mixer)
-{
-	struct snd_kcontrol *kctl = snd_ctl_new1(&keep_iface_ctl, mixer);
-
-	/* need only one control per card */
-	if (snd_ctl_find_id(mixer->chip->card, &kctl->id)) {
-		snd_ctl_free_one(kctl);
-		return 0;
-	}
-
-	return snd_ctl_add(mixer->chip->card, kctl);
-}
-
 int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif,
 			 int ignore_error)
 {
@@ -3548,10 +3506,6 @@ int snd_usb_create_mixer(struct snd_usb_audio *chip, int ctrlif,
 	if (err < 0)
 		goto _error;
 
-	err = create_keep_iface_ctl(mixer);
-	if (err < 0)
-		goto _error;
-
 	err = snd_usb_mixer_apply_create_quirk(mixer);
 	if (err < 0)
 		goto _error;
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 03b1a02bcff4..392aa1cba61c 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -648,14 +648,12 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 
 	/* close the old interface */
 	if (subs->interface >= 0 && (subs->interface != fmt->iface || subs->need_setup_fmt)) {
-		if (!subs->stream->chip->keep_iface) {
-			err = usb_set_interface(subs->dev, subs->interface, 0);
-			if (err < 0) {
-				dev_err(&dev->dev,
-					"%d:%d: return to setting 0 failed (%d)\n",
-					fmt->iface, fmt->altsetting, err);
-				return -EIO;
-			}
+		err = usb_set_interface(subs->dev, subs->interface, 0);
+		if (err < 0) {
+			dev_err(&dev->dev,
+				"%d:%d: return to setting 0 failed (%d)\n",
+				fmt->iface, fmt->altsetting, err);
+			return -EIO;
 		}
 		subs->interface = -1;
 		subs->altset_idx = 0;
@@ -1483,8 +1481,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 
 	snd_media_stop_pipeline(subs);
 
-	if (!as->chip->keep_iface &&
-	    subs->interface >= 0 &&
+	if (subs->interface >= 0 &&
 	    !snd_usb_lock_shutdown(subs->stream->chip)) {
 		usb_set_interface(subs->dev, subs->interface, 0);
 		subs->interface = -1;
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 0805b7f21272..aa017a93f7bd 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -53,9 +53,6 @@ struct snd_usb_audio {
 
 	int setup;			/* from the 'device_setup' module param */
 	bool autoclock;			/* from the 'autoclock' module param */
-	bool keep_iface;		/* keep interface/altset after closing
-					 * or parameter change
-					 */
 
 	struct usb_host_interface *ctrl_intf;	/* the audio control interface */
 	struct media_device *media_dev;
-- 
2.16.4

