Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390335F0DF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 11:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE70716E4;
	Wed, 14 Apr 2021 11:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE70716E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618392749;
	bh=7AfqIAN1FKtC2Aql8HZkR/u0T4HYIhRWDz+zXmqWFB8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O6WfPdrUgF2Chca531BX1yk7PBqYED0bNeHTkBdbnQ7kVW4B+hK0alrKzkZxlISMr
	 DUSSkx2VtALCTDdeSwVuycaPASYFAW0auLIcxOpnzI6XDb583WM2kSuvdFJPobEagN
	 jTQD6r2Mc2UHV4ggHU9+oRSAe0g3Z6qkliIlAaVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B64F800EB;
	Wed, 14 Apr 2021 11:31:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09912F80269; Wed, 14 Apr 2021 11:30:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10C4AF80128
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 11:30:41 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A1A85A003F;
 Wed, 14 Apr 2021 11:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A1A85A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618392640; bh=nVNfsPkUQJXYQZI8D/9KlJOrJ49TGszkmE947U4/Od8=;
 h=From:To:Cc:Subject:Date:From;
 b=5RUVpE1b0oMk9jRbzIj59cYObYrpWl3NIKKi5MpbubpxbKeudEMQ6J5HYCM6wn1Uv
 buG1pPmwp5bcj9A470X6a3XucqwaHRjRvJznSlCT8NmDfW6wN0AbvuH+R/ptEnfoER
 X1ZWVBfXK4R3Qxz+Xcur6NLXkkf+orzuZpXEuQWs=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 14 Apr 2021 11:30:35 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: control_led - fix the stack usage (control element ops)
Date: Wed, 14 Apr 2021 11:30:31 +0200
Message-Id: <20210414093031.1934261-1-perex@perex.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Nathan Chancellor <nathan@kernel.org>
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

It's a bad idea to allocate big structures on the stack. Allocate
the required structures on demand and cache them in the led
structure.

Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/control_led.c | 52 ++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 93b201063c7d..9d1612b1a6ff 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -37,6 +37,7 @@ struct snd_ctl_led {
 	unsigned int group;
 	enum led_audio trigger_type;
 	enum snd_ctl_led_mode mode;
+	void *info_and_value;
 	struct snd_ctl_led_card *cards[SNDRV_CARDS];
 };
 
@@ -94,34 +95,41 @@ static struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
 	return &snd_ctl_leds[group];
 }
 
-static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
+static int snd_ctl_led_get(struct snd_ctl_led *led, struct snd_ctl_led_ctl *lctl)
 {
 	struct snd_kcontrol *kctl = lctl->kctl;
-	struct snd_ctl_elem_info info;
-	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info *info = led->info_and_value;
+	struct snd_ctl_elem_value *value;
 	unsigned int i;
 	int result;
 
-	memset(&info, 0, sizeof(info));
-	info.id = kctl->id;
-	info.id.index += lctl->index_offset;
-	info.id.numid += lctl->index_offset;
-	result = kctl->info(kctl, &info);
+	if (info == NULL) {
+		info = kmalloc(sizeof(*info) + sizeof(*value), GFP_KERNEL);
+		if (info == NULL)
+			return -1;
+		led->info_and_value = info;
+	}
+	value = (void *)(info + 1);
+	memset(info, 0, sizeof(*info));
+	info->id = kctl->id;
+	info->id.index += lctl->index_offset;
+	info->id.numid += lctl->index_offset;
+	result = kctl->info(kctl, info);
 	if (result < 0)
 		return -1;
-	memset(&value, 0, sizeof(value));
-	value.id = info.id;
-	result = kctl->get(kctl, &value);
+	memset(value, 0, sizeof(*value));
+	value->id = info->id;
+	result = kctl->get(kctl, value);
 	if (result < 0)
 		return -1;
-	if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
-	    info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
-		for (i = 0; i < info.count; i++)
-			if (value.value.integer.value[i] != info.value.integer.min)
+	if (info->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    info->type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
+		for (i = 0; i < info->count; i++)
+			if (value->value.integer.value[i] != info->value.integer.min)
 				return 1;
-	} else if (info.type == SNDRV_CTL_ELEM_TYPE_INTEGER64) {
-		for (i = 0; i < info.count; i++)
-			if (value.value.integer64.value[i] != info.value.integer64.min)
+	} else if (info->type == SNDRV_CTL_ELEM_TYPE_INTEGER64) {
+		for (i = 0; i < info->count; i++)
+			if (value->value.integer64.value[i] != info->value.integer64.min)
 				return 1;
 	}
 	return 0;
@@ -149,7 +157,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 	list_for_each_entry(lctl, &led->controls, list) {
 		if (lctl->kctl == kctl && lctl->index_offset == ioff)
 			found = true;
-		UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
+		UPDATE_ROUTE(route, snd_ctl_led_get(led, lctl));
 	}
 	if (!found && kctl && card) {
 		lctl = kzalloc(sizeof(*lctl), GFP_KERNEL);
@@ -159,7 +167,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 			lctl->kctl = kctl;
 			lctl->index_offset = ioff;
 			list_add(&lctl->list, &led->controls);
-			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
+			UPDATE_ROUTE(route, snd_ctl_led_get(led, lctl));
 		}
 	}
 	mutex_unlock(&snd_ctl_led_mutex);
@@ -300,6 +308,10 @@ static void snd_ctl_led_clean(struct snd_card *card)
 				snd_ctl_led_ctl_destroy(lctl);
 				goto repeat;
 			}
+		if (!card) {
+			kfree(led->info_and_value);
+			led->info_and_value = NULL;
+		}
 	}
 }
 
-- 
2.30.2
