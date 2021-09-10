Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8879406A63
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 12:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2407E839;
	Fri, 10 Sep 2021 12:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2407E839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631271204;
	bh=e0op0wCiw86vzsQnVueK/AZEHEsCgDTgbhuFpRMB6SQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GAaqbejrWTeT2Yq1lKtuyCAAGjQMRNrCacxTslfpmzbfYvMg0BxFmC7NwtPMMeGvR
	 yvq9hqmAAKkglmqPsVEBeOgryLU5OLqHuW6E0t2ViATwrNJd93ZNpuzrtOjjnNi6c5
	 vvZdYd2Xg+gUbRf8f76j/6GJoW11FTUfaCcmkwP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA9CF80143;
	Fri, 10 Sep 2021 12:52:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB9B6F802E7; Fri, 10 Sep 2021 12:52:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0069F80143
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 12:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0069F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hhYscbuW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Le9CfQe0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 58D0820056;
 Fri, 10 Sep 2021 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631271117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DbIQRswzglaAosoZKn0YkfGKDGXNEW0O8Bi+qOVLvBk=;
 b=hhYscbuW8wASPH8EQRzg8MyEJ4bkzE3408kZOS2/frzHix4ymUVBUpaJXnB5Y5jlFVJPsV
 Xe31Rr3dpadtbeqXjYzFGHRbDHoEoNrZ/9G0csgPnWKmpYKhqISesyeNI+nmY/5SdHKknG
 28AD2/qoEcOuz+oMnA0djM3JGcBicJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631271117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DbIQRswzglaAosoZKn0YkfGKDGXNEW0O8Bi+qOVLvBk=;
 b=Le9CfQe00KcGUBtfzEaHrFrOX/wX+TeVL15JPZI/3j8Hl1VwEIcbpPMIrwGg7uPN92pfHG
 6TBWLvdvTwfSRmDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 50603A3B99;
 Fri, 10 Sep 2021 10:51:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Unify mixer resume and reset_resume procedure
Date: Fri, 10 Sep 2021 12:51:55 +0200
Message-Id: <20210910105155.12862-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Yu-Hsuan Hsu <yuhsuan@chromium.org>, En-Shuo Hsu <enshuo@chromium.org>
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

USB-audio driver assumes that the normal resume would preserve the
device configuration while reset_resume wouldn't, and tries to restore
the mixer elements only at reset_resume callback.  However, this seems
too naive, and some devices do behave differently, resetting the
volume at the normal resume; this resulted in the inconsistent volume
that surprised users.

This patch changes the mixer resume code to handle both the normal and
reset resume in the same way, always restoring the original mixer
element values.  This allows us to unify the both callbacks as well as
dropping the no longer used reset_resume field, which ends up with a
good code reduction.

A slight behavior change by this patch is that now we assign
restore_mixer_value() as the default resume callback, and the function
is no longer called at reset-resume when the resume callback is
overridden by the quirk function.  That is, if needed, the quirk
resume function would have to handle similarly as
restore_mixer_value() by itself.

Reported-by: En-Shuo Hsu <enshuo@chromium.org>
Cc: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Link: https://lore.kernel.org/r/CADDZ45UPsbpAAqP6=ZkTT8BE-yLii4Y7xSDnjK550G2DhQsMew@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c         | 18 ++++--------------
 sound/usb/mixer.c        | 26 ++++----------------------
 sound/usb/mixer.h        |  3 +--
 sound/usb/mixer_quirks.c |  2 +-
 4 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fd570a42f043..1764b9302d46 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -1054,7 +1054,7 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 	return 0;
 }
 
-static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
+static int usb_audio_resume(struct usb_interface *intf)
 {
 	struct snd_usb_audio *chip = usb_get_intfdata(intf);
 	struct snd_usb_stream *as;
@@ -1080,7 +1080,7 @@ static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
 	 * we just notify and restart the mixers
 	 */
 	list_for_each_entry(mixer, &chip->mixer_list, list) {
-		err = snd_usb_mixer_resume(mixer, reset_resume);
+		err = snd_usb_mixer_resume(mixer);
 		if (err < 0)
 			goto err_out;
 	}
@@ -1100,20 +1100,10 @@ static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
 	atomic_dec(&chip->active); /* allow autopm after this point */
 	return err;
 }
-
-static int usb_audio_resume(struct usb_interface *intf)
-{
-	return __usb_audio_resume(intf, false);
-}
-
-static int usb_audio_reset_resume(struct usb_interface *intf)
-{
-	return __usb_audio_resume(intf, true);
-}
 #else
 #define usb_audio_suspend	NULL
 #define usb_audio_resume	NULL
-#define usb_audio_reset_resume	NULL
+#define usb_audio_resume	NULL
 #endif		/* CONFIG_PM */
 
 static const struct usb_device_id usb_audio_ids [] = {
@@ -1135,7 +1125,7 @@ static struct usb_driver usb_audio_driver = {
 	.disconnect =	usb_audio_disconnect,
 	.suspend =	usb_audio_suspend,
 	.resume =	usb_audio_resume,
-	.reset_resume =	usb_audio_reset_resume,
+	.reset_resume =	usb_audio_resume,
 	.id_table =	usb_audio_ids,
 	.supports_autosuspend = 1,
 };
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 43bc59575a6e..a2ce535df14b 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3653,33 +3653,16 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
 	return 0;
 }
 
-static int default_mixer_reset_resume(struct usb_mixer_elem_list *list)
-{
-	int err;
-
-	if (list->resume) {
-		err = list->resume(list);
-		if (err < 0)
-			return err;
-	}
-	return restore_mixer_value(list);
-}
-
-int snd_usb_mixer_resume(struct usb_mixer_interface *mixer, bool reset_resume)
+int snd_usb_mixer_resume(struct usb_mixer_interface *mixer)
 {
 	struct usb_mixer_elem_list *list;
-	usb_mixer_elem_resume_func_t f;
 	int id, err;
 
 	/* restore cached mixer values */
 	for (id = 0; id < MAX_ID_ELEMS; id++) {
 		for_each_mixer_elem(list, mixer, id) {
-			if (reset_resume)
-				f = list->reset_resume;
-			else
-				f = list->resume;
-			if (f) {
-				err = f(list);
+			if (list->resume) {
+				err = list->resume(list);
 				if (err < 0)
 					return err;
 			}
@@ -3700,7 +3683,6 @@ void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 	list->id = unitid;
 	list->dump = snd_usb_mixer_dump_cval;
 #ifdef CONFIG_PM
-	list->resume = NULL;
-	list->reset_resume = default_mixer_reset_resume;
+	list->resume = restore_mixer_value;
 #endif
 }
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 876bbc9a71ad..98ea24d91d80 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -70,7 +70,6 @@ struct usb_mixer_elem_list {
 	bool is_std_info;
 	usb_mixer_elem_dump_func_t dump;
 	usb_mixer_elem_resume_func_t resume;
-	usb_mixer_elem_resume_func_t reset_resume;
 };
 
 /* iterate over mixer element list of the given unit id */
@@ -121,7 +120,7 @@ int snd_usb_mixer_vol_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 
 #ifdef CONFIG_PM
 int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer);
-int snd_usb_mixer_resume(struct usb_mixer_interface *mixer, bool reset_resume);
+int snd_usb_mixer_resume(struct usb_mixer_interface *mixer);
 #endif
 
 int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a66ce0375fd9..46082dc57be0 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -151,7 +151,7 @@ static int add_single_ctl_with_resume(struct usb_mixer_interface *mixer,
 		*listp = list;
 	list->mixer = mixer;
 	list->id = id;
-	list->reset_resume = resume;
+	list->resume = resume;
 	kctl = snd_ctl_new1(knew, list);
 	if (!kctl) {
 		kfree(list);
-- 
2.26.2

