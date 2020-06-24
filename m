Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F938207343
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 14:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23D76185A;
	Wed, 24 Jun 2020 14:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23D76185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593001530;
	bh=wtoudPuKBOAKaEaUWSv3Fnc+BFEu3wKqy0gE4PMvOhI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tPKaRXvC32YUicrfr181YsB4JuahC2hTnLJQxtq2oumHHa/baSLPaWEiJ6tn6UBxQ
	 axejerDXB40yF3Wcbz3N1Ai5xNsmqI5w9aZ6jBstFldMcsNhElI/O1Q29hVBD8jC5F
	 9j7qE8sApKttsUVlx09rEmIrBuwugA2MymbFxD6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439AAF80162;
	Wed, 24 Jun 2020 14:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E451F8015B; Wed, 24 Jun 2020 14:23:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ED50F80084
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 14:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED50F80084
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1486CAEC4
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 12:23:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix OOB access of mixer element list
Date: Wed, 24 Jun 2020 14:23:40 +0200
Message-Id: <20200624122340.9615-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

The USB-audio mixer code holds a linked list of usb_mixer_elem_list,
and several operations are performed for each mixer element.  A few of
them (snd_usb_mixer_notify_id() and snd_usb_mixer_interrupt_v2())
assume each mixer element being a usb_mixer_elem_info object that is a
subclass of usb_mixer_elem_list, cast via container_of() and access it
members.  This may result in an out-of-bound access when a
non-standard list element has been added, as spotted by syzkaller
recently.

This patch adds a new field, is_std_info, in usb_mixer_elem_list to
indicate that the element is the usb_mixer_elem_info type or not, and
skip the access to such an element if needed.

Reported-by: syzbot+fb14314433463ad51625@syzkaller.appspotmail.com
Reported-by: syzbot+2405ca3401e943c538b5@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c        | 15 +++++++++++----
 sound/usb/mixer.h        |  9 +++++++--
 sound/usb/mixer_quirks.c |  3 ++-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 15769f266790..eab0fd4fd7c3 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -581,8 +581,9 @@ static int check_matrix_bitmap(unsigned char *bmap,
  * if failed, give up and free the control instance.
  */
 
-int snd_usb_mixer_add_control(struct usb_mixer_elem_list *list,
-			      struct snd_kcontrol *kctl)
+int snd_usb_mixer_add_list(struct usb_mixer_elem_list *list,
+			   struct snd_kcontrol *kctl,
+			   bool is_std_info)
 {
 	struct usb_mixer_interface *mixer = list->mixer;
 	int err;
@@ -596,6 +597,7 @@ int snd_usb_mixer_add_control(struct usb_mixer_elem_list *list,
 		return err;
 	}
 	list->kctl = kctl;
+	list->is_std_info = is_std_info;
 	list->next_id_elem = mixer->id_elems[list->id];
 	mixer->id_elems[list->id] = list;
 	return 0;
@@ -3234,8 +3236,11 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid)
 	unitid = delegate_notify(mixer, unitid, NULL, NULL);
 
 	for_each_mixer_elem(list, mixer, unitid) {
-		struct usb_mixer_elem_info *info =
-			mixer_elem_list_to_info(list);
+		struct usb_mixer_elem_info *info;
+
+		if (!list->is_std_info)
+			continue;
+		info = mixer_elem_list_to_info(list);
 		/* invalidate cache, so the value is read from the device */
 		info->cached = 0;
 		snd_ctl_notify(mixer->chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
@@ -3315,6 +3320,8 @@ static void snd_usb_mixer_interrupt_v2(struct usb_mixer_interface *mixer,
 
 		if (!list->kctl)
 			continue;
+		if (!list->is_std_info)
+			continue;
 
 		info = mixer_elem_list_to_info(list);
 		if (count > 1 && info->control != control)
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 41ec9dc4139b..c29e27ac43a7 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -66,6 +66,7 @@ struct usb_mixer_elem_list {
 	struct usb_mixer_elem_list *next_id_elem; /* list of controls with same id */
 	struct snd_kcontrol *kctl;
 	unsigned int id;
+	bool is_std_info;
 	usb_mixer_elem_dump_func_t dump;
 	usb_mixer_elem_resume_func_t resume;
 };
@@ -103,8 +104,12 @@ void snd_usb_mixer_notify_id(struct usb_mixer_interface *mixer, int unitid);
 int snd_usb_mixer_set_ctl_value(struct usb_mixer_elem_info *cval,
 				int request, int validx, int value_set);
 
-int snd_usb_mixer_add_control(struct usb_mixer_elem_list *list,
-			      struct snd_kcontrol *kctl);
+int snd_usb_mixer_add_list(struct usb_mixer_elem_list *list,
+			   struct snd_kcontrol *kctl,
+			   bool is_std_info);
+
+#define snd_usb_mixer_add_control(list, kctl) \
+	snd_usb_mixer_add_list(list, kctl, true)
 
 void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
 				 struct usb_mixer_interface *mixer,
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index b6bcf2f92383..cec1cfd7edb7 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -158,7 +158,8 @@ static int add_single_ctl_with_resume(struct usb_mixer_interface *mixer,
 		return -ENOMEM;
 	}
 	kctl->private_free = snd_usb_mixer_elem_free;
-	return snd_usb_mixer_add_control(list, kctl);
+	/* don't use snd_usb_mixer_add_control() here, this is a special list element */
+	return snd_usb_mixer_add_list(list, kctl, false);
 }
 
 /*
-- 
2.16.4

