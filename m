Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7084228CF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 15:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C05961685;
	Tue,  5 Oct 2021 15:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C05961685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633441962;
	bh=NfDXB7ZFs5dVgoFlpvlRlbDkkB7Rxsz23Spk/+oXuE8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0Srt/069h/FcWrA1qNaFZg+pyoO+VfcI+VyW3KavIWUKOKTOD6SvQTjNyfssXqPS
	 zGOS/L2H+OW+fmrfBtFnIhJ3p1It9aYDl8q3qqyx0AOZffd9635N+s2+jAprHNq73s
	 VmXNrspAEBHUcrVw84sjEZllM9TUueR49teOgYOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D476F804BB;
	Tue,  5 Oct 2021 15:50:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58934F804E2; Tue,  5 Oct 2021 15:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4BEAF804BB
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 15:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4BEAF804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nBwqXFba"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32580614C8;
 Tue,  5 Oct 2021 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633441841;
 bh=NfDXB7ZFs5dVgoFlpvlRlbDkkB7Rxsz23Spk/+oXuE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nBwqXFba6v4UXVa7fbRUmtf2FGmmE3Pp9KJAcAk3a7N6ili4E3i/yyJ9w+hWYLFgx
 wH528FnSIDp7Q1evvwPYn2+sRp29aUdO+ntayh0T0XhMnOEUfYfqhCmeDG+kKyyQeD
 6Pvy4P7GZHn+SNtCeRTP2LXC15rJVVgbJXvE0dzZYDCV+S5Kr0rtVcXCnZoyZUMJsR
 Zcbg9dZL4SjA3nm7r/OmJt6HlI+dxgUqsESHnDt1Qhyi8fIXk+4MVW9++eE26bE38g
 jqmDybzb1ES2uoSOHPN1fbE2JoI45NPkCWtCkNT7F8g/7u+GydPAraNoKxTYvi40cL
 OJTO8Y44tHo3w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 08/40] ALSA: usb-audio: Unify mixer resume and
 reset_resume procedure
Date: Tue,  5 Oct 2021 09:49:47 -0400
Message-Id: <20211005135020.214291-8-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005135020.214291-1-sashal@kernel.org>
References: <20211005135020.214291-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lars@metafoo.de, fabian@lesniak-it.de, Takashi Iwai <tiwai@suse.de>,
 paskripkin@gmail.com, broonie@kernel.org, nicolas.mure2019@gmail.com,
 tiwai@suse.com, kai.heng.feng@canonical.com, damien@zamaudio.com,
 En-Shuo Hsu <enshuo@chromium.org>, joe@perches.com, colin.king@canonical.com,
 g@b4.vu, Yu-Hsuan Hsu <yuhsuan@chromium.org>, livvy@base.nu
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 7b9cf9036609428e845dc300aec13822ba2c4ab3 ]

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
Link: https://lore.kernel.org/r/20210910105155.12862-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/card.c         | 18 ++++--------------
 sound/usb/mixer.c        | 26 ++++----------------------
 sound/usb/mixer.h        |  3 +--
 sound/usb/mixer_quirks.c |  2 +-
 4 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 6abfc9d079e7..fa75b7e72ad1 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -1020,7 +1020,7 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 	return 0;
 }
 
-static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
+static int usb_audio_resume(struct usb_interface *intf)
 {
 	struct snd_usb_audio *chip = usb_get_intfdata(intf);
 	struct snd_usb_stream *as;
@@ -1046,7 +1046,7 @@ static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
 	 * we just notify and restart the mixers
 	 */
 	list_for_each_entry(mixer, &chip->mixer_list, list) {
-		err = snd_usb_mixer_resume(mixer, reset_resume);
+		err = snd_usb_mixer_resume(mixer);
 		if (err < 0)
 			goto err_out;
 	}
@@ -1066,20 +1066,10 @@ static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
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
@@ -1101,7 +1091,7 @@ static struct usb_driver usb_audio_driver = {
 	.disconnect =	usb_audio_disconnect,
 	.suspend =	usb_audio_suspend,
 	.resume =	usb_audio_resume,
-	.reset_resume =	usb_audio_reset_resume,
+	.reset_resume =	usb_audio_resume,
 	.id_table =	usb_audio_ids,
 	.supports_autosuspend = 1,
 };
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9b713b4a5ec4..fa7cf982d39e 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3655,33 +3655,16 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
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
@@ -3702,7 +3685,6 @@ void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 	list->id = unitid;
 	list->dump = snd_usb_mixer_dump_cval;
 #ifdef CONFIG_PM
-	list->resume = NULL;
-	list->reset_resume = default_mixer_reset_resume;
+	list->resume = restore_mixer_value;
 #endif
 }
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index ea41e7a1f7bf..16567912b998 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -70,7 +70,6 @@ struct usb_mixer_elem_list {
 	bool is_std_info;
 	usb_mixer_elem_dump_func_t dump;
 	usb_mixer_elem_resume_func_t resume;
-	usb_mixer_elem_resume_func_t reset_resume;
 };
 
 /* iterate over mixer element list of the given unit id */
@@ -122,7 +121,7 @@ int snd_usb_mixer_vol_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 
 #ifdef CONFIG_PM
 int snd_usb_mixer_suspend(struct usb_mixer_interface *mixer);
-int snd_usb_mixer_resume(struct usb_mixer_interface *mixer, bool reset_resume);
+int snd_usb_mixer_resume(struct usb_mixer_interface *mixer);
 #endif
 
 int snd_usb_set_cur_mix_value(struct usb_mixer_elem_info *cval, int channel,
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 0a3cb8fd7d00..4a4d3361ac04 100644
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
2.33.0

