Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA91D757F33
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BA93E7;
	Tue, 18 Jul 2023 16:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BA93E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689773;
	bh=qcs7uKOfw8NRH5IX6ifPEHOk9SmwmM9HagxvwOFUGYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r+KkdOHNwMRW/044JZ7gNoWBhZOiov2ASTMA706ObGPLwJaczyo7LPJizpOqp4cuS
	 DhAnITNfa9E1LwDITGjg3UU27MmQQKeiKv8TFyuk69kmLTCLer1fogW0+ACff6M/JZ
	 lmKeZVR/Jabc31M2A/o/+P5xohLmoIommk1MQb5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E374F805D5; Tue, 18 Jul 2023 16:13:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0820AF805C8;
	Tue, 18 Jul 2023 16:13:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC5B5F805B0; Tue, 18 Jul 2023 16:13:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4E1EF8055A
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E1EF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OzekxVSH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=D5RBpQUp
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 517681FDC6;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrFEYMkBIpQXk8oZOhqClSw9DrU2pPioCvAHaX6aZ9I=;
	b=OzekxVSHAaQyzu9Kytx+RuHBcBMsVvaec4+mA2Tk6xuih5CQJWTmTUq3Gd+x7iCipAQ4dl
	ZDihZokqMawT3rdxgHH5Jp3hwDacWrvEYC/J45YeSn1HNRaP4s9ZyRFOcIv2fmOSo7bWQ3
	88DexKvVFzgUcfitNHC/8/GGVaqKQHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrFEYMkBIpQXk8oZOhqClSw9DrU2pPioCvAHaX6aZ9I=;
	b=D5RBpQUpl5Sd1w/2y3JLt3rogIgfnOeWBv9WsLUXjve6M9/z9/vmnnnkgKT7PES4abYkGY
	GiOi+sgpC60fXbBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 310C2134B0;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sBoWC/ydtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 09/11] ALSA: control: Introduce unlocked version for
 snd_ctl_find_*() helpers
Date: Tue, 18 Jul 2023 16:13:02 +0200
Message-Id: <20230718141304.1032-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XLC7P2WQ3DWR24GPRCY2CUQ4I3BPVS5L
X-Message-ID-Hash: XLC7P2WQ3DWR24GPRCY2CUQ4I3BPVS5L
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLC7P2WQ3DWR24GPRCY2CUQ4I3BPVS5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For reducing the unnecessary use of controls_rwsem in the drivers,
this patch adds a new variant for snd_ctl_find_*() helpers:
snd_ctl_find_id_locked() and snd_ctl_find_numid_locked() look for a
kctl element inside the card->controls_rwsem -- that is, doing the
very same as what snd_ctl_find_id() and snd_ctl_find_numid() did until
now.  snd_ctl_find_id() and snd_ctl_find_numid() remain same,
i.e. still unlocked version, but they will be switched to locked
version once after all callers are replaced.

The patch also replaces the calls of snd_ctl_find_id() and
snd_ctl_find_numid() in a few places; all of those are places where we
know that the functions are called properly with controls_rwsem held.
All others are without rwsem (although they should have been).

After this patch, we'll turn on the locking in snd_ctl_find_id() and
snd_ctl_find_numid() to be more race-free.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h     |  4 ++-
 sound/core/control.c        | 69 +++++++++++++++++++++++++++----------
 sound/core/control_compat.c |  2 +-
 sound/core/control_led.c    |  2 +-
 sound/core/oss/mixer_oss.c  | 10 +++---
 sound/pci/emu10k1/emufx.c   |  2 +-
 6 files changed, 61 insertions(+), 28 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index e61b749bf204..42e8dbb22d8e 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -140,7 +140,9 @@ int snd_ctl_remove_id(struct snd_card * card, struct snd_ctl_elem_id *id);
 int snd_ctl_rename_id(struct snd_card * card, struct snd_ctl_elem_id *src_id, struct snd_ctl_elem_id *dst_id);
 void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl, const char *name);
 int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id, int active);
-struct snd_kcontrol *snd_ctl_find_numid(struct snd_card * card, unsigned int numid);
+struct snd_kcontrol *snd_ctl_find_numid_locked(struct snd_card *card, unsigned int numid);
+struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card, unsigned int numid);
+struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card, const struct snd_ctl_elem_id *id);
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card, const struct snd_ctl_elem_id *id);
 
 int snd_ctl_create(struct snd_card *card);
diff --git a/sound/core/control.c b/sound/core/control.c
index 180e5768a10f..30741293708d 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -475,7 +475,7 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	if (id.index > UINT_MAX - kcontrol->count)
 		return -EINVAL;
 
-	old = snd_ctl_find_id(card, &id);
+	old = snd_ctl_find_id_locked(card, &id);
 	if (!old) {
 		if (mode == CTL_REPLACE)
 			return -EINVAL;
@@ -641,7 +641,7 @@ int snd_ctl_remove_id(struct snd_card *card, struct snd_ctl_elem_id *id)
 	int ret;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, id);
+	kctl = snd_ctl_find_id_locked(card, id);
 	if (kctl == NULL) {
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
@@ -670,7 +670,7 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
 	int idx, ret;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, id);
+	kctl = snd_ctl_find_id_locked(card, id);
 	if (kctl == NULL) {
 		ret = -ENOENT;
 		goto error;
@@ -711,7 +711,7 @@ int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
 	int ret;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, id);
+	kctl = snd_ctl_find_id_locked(card, id);
 	if (kctl == NULL) {
 		ret = -ENOENT;
 		goto unlock;
@@ -765,7 +765,7 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 	int saved_numid;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, src_id);
+	kctl = snd_ctl_find_id_locked(card, src_id);
 	if (kctl == NULL) {
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
@@ -820,7 +820,7 @@ snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
 #endif /* !CONFIG_SND_CTL_FAST_LOOKUP */
 
 /**
- * snd_ctl_find_numid - find the control instance with the given number-id
+ * snd_ctl_find_numid_locked - find the control instance with the given number-id
  * @card: the card instance
  * @numid: the number-id to search
  *
@@ -830,9 +830,9 @@ snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
  * (if the race condition can happen).
  *
  * Return: The pointer of the instance if found, or %NULL if not.
- *
  */
-struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card, unsigned int numid)
+struct snd_kcontrol *
+snd_ctl_find_numid_locked(struct snd_card *card, unsigned int numid)
 {
 	if (snd_BUG_ON(!card || !numid))
 		return NULL;
@@ -842,10 +842,26 @@ struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card, unsigned int numi
 	return snd_ctl_find_numid_slow(card, numid);
 #endif
 }
+EXPORT_SYMBOL(snd_ctl_find_numid_locked);
+
+/**
+ * snd_ctl_find_numid - find the control instance with the given number-id
+ * @card: the card instance
+ * @numid: the number-id to search
+ *
+ * Finds the control instance with the given number-id from the card.
+ *
+ * Return: The pointer of the instance if found, or %NULL if not.
+ */
+struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card,
+					unsigned int numid)
+{
+	return snd_ctl_find_numid_locked(card, numid);
+}
 EXPORT_SYMBOL(snd_ctl_find_numid);
 
 /**
- * snd_ctl_find_id - find the control instance with the given id
+ * snd_ctl_find_id_locked - find the control instance with the given id
  * @card: the card instance
  * @id: the id to search
  *
@@ -855,17 +871,16 @@ EXPORT_SYMBOL(snd_ctl_find_numid);
  * (if the race condition can happen).
  *
  * Return: The pointer of the instance if found, or %NULL if not.
- *
  */
-struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
-				     const struct snd_ctl_elem_id *id)
+struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card,
+					    const struct snd_ctl_elem_id *id)
 {
 	struct snd_kcontrol *kctl;
 
 	if (snd_BUG_ON(!card || !id))
 		return NULL;
 	if (id->numid != 0)
-		return snd_ctl_find_numid(card, id->numid);
+		return snd_ctl_find_numid_locked(card, id->numid);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
 	kctl = xa_load(&card->ctl_hash, get_ctl_id_hash(id));
 	if (kctl && elem_id_matches(kctl, id))
@@ -880,6 +895,22 @@ struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
 
 	return NULL;
 }
+EXPORT_SYMBOL(snd_ctl_find_id_locked);
+
+/**
+ * snd_ctl_find_id - find the control instance with the given id
+ * @card: the card instance
+ * @id: the id to search
+ *
+ * Finds the control instance with the given id from the card.
+ *
+ * Return: The pointer of the instance if found, or %NULL if not.
+ */
+struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
+				     const struct snd_ctl_elem_id *id)
+{
+	return snd_ctl_find_id_locked(card, id);
+}
 EXPORT_SYMBOL(snd_ctl_find_id);
 
 static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
@@ -1194,7 +1225,7 @@ static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 	int result;
 
 	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, &info->id);
+	kctl = snd_ctl_find_id_locked(card, &info->id);
 	if (kctl == NULL)
 		result = -ENOENT;
 	else
@@ -1233,7 +1264,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	int ret;
 
 	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, &control->id);
+	kctl = snd_ctl_find_id_locked(card, &control->id);
 	if (kctl == NULL) {
 		ret = -ENOENT;
 		goto unlock;
@@ -1310,7 +1341,7 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	int result;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, &control->id);
+	kctl = snd_ctl_find_id_locked(card, &control->id);
 	if (kctl == NULL) {
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
@@ -1391,7 +1422,7 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, &id);
+	kctl = snd_ctl_find_id_locked(card, &id);
 	if (kctl == NULL) {
 		result = -ENOENT;
 	} else {
@@ -1419,7 +1450,7 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, &id);
+	kctl = snd_ctl_find_id_locked(card, &id);
 	if (kctl == NULL) {
 		result = -ENOENT;
 	} else {
@@ -1927,7 +1958,7 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
 	container_size = header.length;
 	container = buf->tlv;
 
-	kctl = snd_ctl_find_numid(file->card, header.numid);
+	kctl = snd_ctl_find_numid_locked(file->card, header.numid);
 	if (kctl == NULL)
 		return -ENOENT;
 
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 9cae5d74335c..0e8b1bfb040e 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -173,7 +173,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	int err;
 
 	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_id(card, id);
+	kctl = snd_ctl_find_id_locked(card, id);
 	if (! kctl) {
 		up_read(&card->controls_rwsem);
 		return -ENOENT;
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index ee77547bf8dc..67fc2a1dcf7a 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -251,7 +251,7 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 	card = snd_card_ref(card_number);
 	if (card) {
 		down_write(&card->controls_rwsem);
-		kctl = snd_ctl_find_id(card, id);
+		kctl = snd_ctl_find_id_locked(card, id);
 		if (kctl) {
 			ioff = snd_ctl_get_ioff(kctl, id);
 			vd = &kctl->vd[ioff];
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 9620115cfdc0..dae2da380835 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -524,7 +524,7 @@ static struct snd_kcontrol *snd_mixer_oss_test_id(struct snd_mixer_oss *mixer, c
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(id.name, name, sizeof(id.name));
 	id.index = index;
-	return snd_ctl_find_id(card, &id);
+	return snd_ctl_find_id_locked(card, &id);
 }
 
 static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
@@ -540,7 +540,7 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid(card, numid);
+	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
@@ -579,7 +579,7 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid(card, numid);
+	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
@@ -645,7 +645,7 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid(card, numid);
+	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
@@ -688,7 +688,7 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	down_read(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid(card, numid);
+	kctl = snd_ctl_find_numid_locked(card, numid);
 	if (!kctl) {
 		up_read(&card->controls_rwsem);
 		return;
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 70c8252a92d9..318a064f2cec 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -800,7 +800,7 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 			continue;
 		gctl_id = (struct snd_ctl_elem_id *)&gctl->id;
 		down_read(&emu->card->controls_rwsem);
-		if (snd_ctl_find_id(emu->card, gctl_id)) {
+		if (snd_ctl_find_id_locked(emu->card, gctl_id)) {
 			up_read(&emu->card->controls_rwsem);
 			err = -EEXIST;
 			goto __error;
-- 
2.35.3

