Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C923465FC1
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 09:42:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87BFB2580;
	Thu,  2 Dec 2021 09:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87BFB2580
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638434540;
	bh=NcL9wcXvToWlJHwN6SodHBnBy1p132vHia45k6+xpb0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UebIUm+cRaQjSF/1oZVeKycmFYwTcvst7GikpEZ5q+RBs8mUQagFaHOPYdrjtg+Xn
	 ZBBNiUf0g1a71PiFYtFkzFmIWc+0MUE2NnIAVLKoAGYMZjdGfkh+F8vzhRxFp/84a8
	 IC5eAkWbR102RGB4jt3WnGxlQipfFRWe96JRk7YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1325FF802E0;
	Thu,  2 Dec 2021 09:41:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10CEEF802A0; Thu,  2 Dec 2021 09:41:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF15AF800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 09:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF15AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0rIZCAK8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="SYpX7PSs"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id F343D212BC
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638434454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ouDdS0X35gU7+BoGhTbiNMz7nFwty4/f6AJfodB6vlo=;
 b=0rIZCAK8RcnsreL86jB4e4HD6qqh9UBfxmZpfuiy3VU5L8mRxcW42KnK3bYdfujBQMo6RQ
 FB30qywKxOkyGhSEkK+ucjLJxuaWCRk0OWbkciedvLSd5ebz9XzV8T1Gth7ldL3+l6pYxi
 jVfVxhvu2mAYr6qHDYDCJmEnoXSSQvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638434454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ouDdS0X35gU7+BoGhTbiNMz7nFwty4/f6AJfodB6vlo=;
 b=SYpX7PSsWAfXQKfDJ4Is4n3cEYEaarUj5avc+tMDO56I/zMA2U71vKKiE76dBLvG5wD9Rc
 sGM2mhzmfvgR0NDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E2D8EA3FA4;
 Thu,  2 Dec 2021 08:40:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Drop CONFIG_PM
Date: Thu,  2 Dec 2021 09:40:53 +0100
Message-Id: <20211202084053.18201-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

Practically seen, CONFIG_PM is almost mandatory.
Let's drop the ugly ifdef lines and simplify the code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c         |  7 -------
 sound/usb/mixer.c        |  4 ----
 sound/usb/mixer.h        |  2 --
 sound/usb/mixer_quirks.c |  2 --
 sound/usb/mixer_quirks.h |  2 --
 sound/usb/power.h        | 10 ----------
 6 files changed, 27 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1764b9302d46..376962291c4d 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -987,8 +987,6 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
 		wake_up(&chip->shutdown_wait);
 }
 
-#ifdef CONFIG_PM
-
 int snd_usb_autoresume(struct snd_usb_audio *chip)
 {
 	int i, err;
@@ -1100,11 +1098,6 @@ static int usb_audio_resume(struct usb_interface *intf)
 	atomic_dec(&chip->active); /* allow autopm after this point */
 	return err;
 }
-#else
-#define usb_audio_suspend	NULL
-#define usb_audio_resume	NULL
-#define usb_audio_resume	NULL
-#endif		/* CONFIG_PM */
 
 static const struct usb_device_id usb_audio_ids [] = {
 #include "quirks-table.h"
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 5b9fd07ce2a2..e8f3f8d622ec 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3629,7 +3629,6 @@ void snd_usb_mixer_disconnect(struct usb_mixer_interface *mixer)
 	mixer->disconnected = true;
 }
 
-#ifdef CONFIG_PM
 /* stop any bus activity of a mixer */
 static void snd_usb_mixer_inactivate(struct usb_mixer_interface *mixer)
 {
@@ -3711,7 +3710,6 @@ int snd_usb_mixer_resume(struct usb_mixer_interface *mixer)
 
 	return snd_usb_mixer_activate(mixer);
 }
-#endif
 
 void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 				 struct usb_mixer_interface *mixer,
@@ -3720,7 +3718,5 @@ void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 	list->mixer = mixer;
 	list->id = unitid;
 	list->dump = snd_usb_mixer_dump_cval;
-#ifdef CONFIG_PM
 	list->resume = restore_mixer_value;
-#endif
 }
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 98ea24d91d80..d43895c1ae5c 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -118,10 +118,8 @@ void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 int snd_usb_mixer_vol_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 			  unsigned int size, unsigned int __user *_tlv);
 
-#ifdef CONFIG_PM
 int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer);
 int snd_usb_mixer_resume(struct usb_mixer_interface *mixer);
-#endif
 
 int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
                              int index, int value);
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index db194ad168d0..1f9863725c7c 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3280,7 +3280,6 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	return err;
 }
 
-#ifdef CONFIG_PM
 void snd_usb_mixer_resume_quirk(struct usb_mixer_interface *mixer)
 {
 	switch (mixer->chip->usb_id) {
@@ -3289,7 +3288,6 @@ void snd_usb_mixer_resume_quirk(struct usb_mixer_interface *mixer)
 		break;
 	}
 }
-#endif
 
 void snd_usb_mixer_rc_memory_change(struct usb_mixer_interface *mixer,
 				    int unitid)
diff --git a/sound/usb/mixer_quirks.h b/sound/usb/mixer_quirks.h
index 52be26db558f..4ba01ba3fe8b 100644
--- a/sound/usb/mixer_quirks.h
+++ b/sound/usb/mixer_quirks.h
@@ -14,9 +14,7 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 				  struct usb_mixer_elem_info *cval, int unitid,
 				  struct snd_kcontrol *kctl);
 
-#ifdef CONFIG_PM
 void snd_usb_mixer_resume_quirk(struct usb_mixer_interface *mixer);
-#endif
 
 #endif /* SND_USB_MIXER_QUIRKS_H */
 
diff --git a/sound/usb/power.h b/sound/usb/power.h
index 6004231a7c75..396e3e51440a 100644
--- a/sound/usb/power.h
+++ b/sound/usb/power.h
@@ -21,17 +21,7 @@ struct snd_usb_power_domain *
 snd_usb_find_power_domain(struct usb_host_interface *ctrl_iface,
 			  unsigned char id);
 
-#ifdef CONFIG_PM
 int snd_usb_autoresume(struct snd_usb_audio *chip);
 void snd_usb_autosuspend(struct snd_usb_audio *chip);
-#else
-static inline int snd_usb_autoresume(struct snd_usb_audio *chip)
-{
-	return 0;
-}
-static inline void snd_usb_autosuspend(struct snd_usb_audio *chip)
-{
-}
-#endif
 
 #endif /* __USBAUDIO_POWER_H */
-- 
2.31.1

