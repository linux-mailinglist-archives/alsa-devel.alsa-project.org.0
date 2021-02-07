Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7331275C
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 21:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5883167E;
	Sun,  7 Feb 2021 21:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5883167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612728833;
	bh=1lgXbMmv+ExynuJRO2I2jwyiF1eLVCizoRYBHlCDlT8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eIJb+VTFTeFG6adVT9zX6JBw/8qeVU509TKhv7LwewnULOiJEkav2TFmd35ExZeDc
	 dBHvORP1t0OjQwGLMzmO7CzhuyoThCXz6oB6zfdiGjwsZxQNQghQrEe0wZPENSdx8W
	 FaWlWlPhtGdofkhUoEkyCb2W1DNUNGv/61uhV0GY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 183E1F80129;
	Sun,  7 Feb 2021 21:12:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAFB4F801D5; Sun,  7 Feb 2021 21:12:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 122CDF8013A
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 21:12:11 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F3BE3A003F;
 Sun,  7 Feb 2021 21:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F3BE3A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1612728726; bh=3hmlqol9YC6xSf5MgOjlvyvfRlwWHLoxs+8Fh/0QGv0=;
 h=From:To:Cc:Subject:Date:From;
 b=5v+emrCypQu/uJrAlQuCOMBnJAK8u5YD8hZVWs3t57WFmqsupsjYL/FeI7zfJzDcc
 4XXHCoVGbqot+dzua91Vd/2bQx3TZF1lQhVdKea8FyqReMslVDZQG0HHHiryNQQoZt
 zHGIaCfa+AGV5DIie5TuJTVUw+ZvN8wJ7nL4vSFk=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun,  7 Feb 2021 21:12:00 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] [RFC] ALSA: control - add generic LED API to sound core
 routines
Date: Sun,  7 Feb 2021 21:11:57 +0100
Message-Id: <20210207201157.869972-1-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Perry Yuan <Perry.Yuan@dell.com>
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

[DO NOT MERGE!]
[This is just an early proposal for comments]
[The code is not tested / debugged]

The recent laptops have usually two LEDs assigned to reflect
the speaker and microphone mute state. This implementation
adds a tiny layer on top of the control API which calculates
the state for those LEDs using the driver callbacks.

Two new access flags are introduced to describe the controls
which affects the audio path settings (an easy path for drivers).

The LED resource can be shared with multiple sound cards with
this code. The user space controls may be added to the state
chain, too.

This code should replace the LED code in the HDA driver and
add a possibility to easy extend the other drivers (ASoC
codecs etc.).

Note: The snd_ctl_notify_one() changes should be moved to
a separate patch. I will do this, when this proposal is
agreed.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Perry Yuan <Perry.Yuan@dell.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 include/sound/control.h     |  12 +++
 include/uapi/sound/asound.h |   2 +
 sound/core/Kconfig          |   6 ++
 sound/core/Makefile         |   1 +
 sound/core/control.c        |  83 ++++++++++++++-------
 sound/core/control_led.c    | 144 ++++++++++++++++++++++++++++++++++++
 sound/pci/hda/Kconfig       |   3 +-
 7 files changed, 225 insertions(+), 26 deletions(-)
 create mode 100644 sound/core/control_led.c

diff --git a/include/sound/control.h b/include/sound/control.h
index 77d9fa10812d..ed967b18ffc9 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -261,4 +261,16 @@ snd_kctl_jack_new(const char *name, struct snd_card *card);
 void snd_kctl_jack_report(struct snd_card *card,
 			  struct snd_kcontrol *kctl, bool status);
 
+#if IS_ENABLED(CONFIG_SND_LED)
+void snd_ctl_led_notify(struct snd_card *card, unsigned int mask,
+			struct snd_kcontrol *kctl, unsigned int ioff);
+void snd_ctl_led_register(struct snd_card *card);
+void snd_ctl_led_disconnect(struct snd_card *card);
+#else
+static inline void snd_ctl_led_notify(struct snd_card *card, unsigned int mask,
+				      struct snd_kcontrol *kctl, unsigned int ioff) {}
+static inline void snd_ctl_led_register(struct snd_card *card) {}
+static inline void snd_ctl_led_disconnect(struct snd_card *card) {}
+#endif
+
 #endif	/* __SOUND_CONTROL_H */
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..3faacdf5eaea 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -982,6 +982,8 @@ typedef int __bitwise snd_ctl_elem_iface_t;
 #define SNDRV_CTL_ELEM_ACCESS_INACTIVE		(1<<8)	/* control does actually nothing, but may be updated */
 #define SNDRV_CTL_ELEM_ACCESS_LOCK		(1<<9)	/* write lock */
 #define SNDRV_CTL_ELEM_ACCESS_OWNER		(1<<10)	/* write lock owner */
+#define SNDRV_CTL_ELEM_ACCESS_SPK_LED		(1<<11)	/* speaker (output) LED flag */
+#define SNDRV_CTL_ELEM_ACCESS_MIC_LED		(1<<12)	/* microphone (input) LED flag */
 #define SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK	(1<<28)	/* kernel use a TLV callback */
 #define SNDRV_CTL_ELEM_ACCESS_USER		(1<<29) /* user space element */
 /* bits 30 and 31 are obsoleted (for indirect access) */
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index a4050f87f230..1bde494fa1fe 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -203,4 +203,10 @@ config SND_DMA_SGBUF
 	def_bool y
 	depends on X86
 
+config SND_LED
+	bool
+	select NEW_LEDS if SND_LED
+	select LEDS_TRIGGERS if SND_LED
+	select LEDS_TRIGGER_AUDIO if SND_LED
+
 source "sound/core/seq/Kconfig"
diff --git a/sound/core/Makefile b/sound/core/Makefile
index ee4a4a6b99ba..81b33877a03d 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -13,6 +13,7 @@ snd-$(CONFIG_ISA_DMA_API) += isadma.o
 snd-$(CONFIG_SND_OSSEMUL) += sound_oss.o
 snd-$(CONFIG_SND_VMASTER) += vmaster.o
 snd-$(CONFIG_SND_JACK)	  += ctljack.o jack.o
+snd-$(CONFIG_SND_LED)     += control_led.o
 
 snd-pcm-y := pcm.o pcm_native.o pcm_lib.o pcm_misc.o \
 		pcm_memory.o memalloc.o
diff --git a/sound/core/control.c b/sound/core/control.c
index 5165741a8400..3171e7f2798e 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -181,6 +181,28 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 }
 EXPORT_SYMBOL(snd_ctl_notify);
 
+/**
+ * snd_ctl_notify_one - Send notification to user-space for a control change
+ * @card: the card to send notification
+ * @mask: the event mask, SNDRV_CTL_EVENT_*
+ * @kctl: the pointer with the control instance
+ * @ioff: the additional offset to the control index
+ *
+ * This function calls snd_ctl_notify() and does additional jobs
+ * like LED state changes.
+ */
+void snd_ctl_notify_one(struct snd_card *card, unsigned int mask,
+			struct snd_kcontrol *kctl, unsigned int ioff)
+{
+	struct snd_ctl_elem_id id = kctl->id;
+
+	id.index += ioff;
+	id.numid += ioff;
+	snd_ctl_led_notify(card, mask, kctl, ioff);
+	snd_ctl_notify(card, mask, &id);
+}
+EXPORT_SYMBOL(snd_ctl_notify_one);
+
 /**
  * snd_ctl_new - create a new control instance with some elements
  * @kctl: the pointer to store new control instance
@@ -250,6 +272,8 @@ struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new *ncontrol,
 		   SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE |
 		   SNDRV_CTL_ELEM_ACCESS_TLV_COMMAND |
 		   SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK |
+		   SNDRV_CTL_ELEM_ACCESS_SPK_LED |
+		   SNDRV_CTL_ELEM_ACCESS_MIC_LED |
 		   SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK);
 
 	err = snd_ctl_new(&kctl, count, access, NULL);
@@ -342,7 +366,6 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 {
 	struct snd_ctl_elem_id id;
 	unsigned int idx;
-	unsigned int count;
 	struct snd_kcontrol *old;
 	int err;
 
@@ -376,10 +399,8 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	kcontrol->id.numid = card->last_numid + 1;
 	card->last_numid += kcontrol->count;
 
-	id = kcontrol->id;
-	count = kcontrol->count;
-	for (idx = 0; idx < count; idx++, id.index++, id.numid++)
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_ADD, &id);
+	for (idx = 0; idx < kcontrol->count; idx++)
+		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_ADD, kcontrol, idx);
 
 	return 0;
 }
@@ -462,16 +483,15 @@ EXPORT_SYMBOL(snd_ctl_replace);
  */
 int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
 {
-	struct snd_ctl_elem_id id;
 	unsigned int idx;
 
 	if (snd_BUG_ON(!card || !kcontrol))
 		return -EINVAL;
 	list_del(&kcontrol->list);
 	card->controls_count -= kcontrol->count;
-	id = kcontrol->id;
-	for (idx = 0; idx < kcontrol->count; idx++, id.index++, id.numid++)
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_REMOVE, &id);
+
+	for (idx = 0; idx < kcontrol->count; idx++)
+		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
 	snd_ctl_free_one(kcontrol);
 	return 0;
 }
@@ -584,11 +604,13 @@ int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
 		vd->access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 	}
 	snd_ctl_build_ioff(id, kctl, index_offset);
-	ret = 1;
+	downgrade_write(&card->controls_rwsem);
+	snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_INFO, kctl, index_offset);
+	up_read(&card->controls_rwsem);
+	return 1;
+
  unlock:
 	up_write(&card->controls_rwsem);
-	if (ret > 0)
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO, id);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_ctl_activate_id);
@@ -1110,25 +1132,34 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	unsigned int index_offset;
 	int result;
 
+	down_write(&card->controls_rwsem);
 	kctl = snd_ctl_find_id(card, &control->id);
-	if (kctl == NULL)
+	if (kctl == NULL) {
+		up_write(&card->controls_rwsem);
 		return -ENOENT;
+	}
 
 	index_offset = snd_ctl_get_ioff(kctl, &control->id);
 	vd = &kctl->vd[index_offset];
 	if (!(vd->access & SNDRV_CTL_ELEM_ACCESS_WRITE) || kctl->put == NULL ||
 	    (file && vd->owner && vd->owner != file)) {
+		up_write(&card->controls_rwsem);
 		return -EPERM;
 	}
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
 	result = kctl->put(kctl, control);
-	if (result < 0)
+	if (result < 0) {
+		up_write(&card->controls_rwsem);
 		return result;
+	}
 
 	if (result > 0) {
-		struct snd_ctl_elem_id id = control->id;
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
+		downgrade_write(&card->controls_rwsem);
+		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, index_offset);
+		up_read(&card->controls_rwsem);
+	} else {
+		up_write(&card->controls_rwsem);
 	}
 
 	return 0;
@@ -1150,9 +1181,7 @@ static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
 	if (result < 0)
 		goto error;
 
-	down_write(&card->controls_rwsem);
 	result = snd_ctl_elem_write(card, file, control);
-	up_write(&card->controls_rwsem);
 	if (result < 0)
 		goto error;
 
@@ -1301,7 +1330,6 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 {
 	struct user_element *ue = kctl->private_data;
 	unsigned int *container;
-	struct snd_ctl_elem_id id;
 	unsigned int mask = 0;
 	int i;
 	int change;
@@ -1333,10 +1361,8 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 	ue->tlv_data_size = size;
 
 	mask |= SNDRV_CTL_EVENT_MASK_TLV;
-	for (i = 0; i < kctl->count; ++i) {
-		snd_ctl_build_ioff(&id, kctl, i);
-		snd_ctl_notify(ue->card, mask, &id);
-	}
+	for (i = 0; i < kctl->count; ++i)
+		snd_ctl_notify_one(ue->card, mask, kctl, i);
 
 	return change;
 }
@@ -1998,9 +2024,14 @@ static const struct file_operations snd_ctl_f_ops =
 static int snd_ctl_dev_register(struct snd_device *device)
 {
 	struct snd_card *card = device->device_data;
+	int err;
 
-	return snd_register_device(SNDRV_DEVICE_TYPE_CONTROL, card, -1,
-				   &snd_ctl_f_ops, card, &card->ctl_dev);
+	err = snd_register_device(SNDRV_DEVICE_TYPE_CONTROL, card, -1,
+				  &snd_ctl_f_ops, card, &card->ctl_dev);
+	if (err < 0)
+		return err;
+	snd_ctl_led_register(card);
+	return 0;
 }
 
 /*
@@ -2019,6 +2050,8 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	}
 	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
 
+	snd_ctl_led_disconnect(card);
+
 	return snd_unregister_device(&card->ctl_dev);
 }
 
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
new file mode 100644
index 000000000000..e70855ea54d1
--- /dev/null
+++ b/sound/core/control_led.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  LED state routines for driver control interface
+ *  Copyright (c) 2021 by Jaroslav Kysela <perex@perex.cz>
+ */
+
+#include <linux/leds.h>
+#include <sound/core.h>
+#include <sound/control.h>
+
+static DEFINE_MUTEX(snd_control_led_mutex);
+static unsigned int snd_control_led_last_card;
+static struct snd_card *snd_control_led_cards[SNDRV_CARDS];
+
+#define UPDATE_ROUTE(route, cb) \
+	do { \
+		int route2 = (cb); \
+		if (route2 >= 0) \
+			route = route < 0 ? route2 : (route | route2); \
+	} while (0)
+
+static int snd_ctl_led_get(struct snd_card *card,
+			   struct snd_kcontrol *kctl, unsigned int ioff)
+{
+	struct snd_ctl_elem_info info;
+	struct snd_ctl_elem_value value;
+	unsigned int i;
+	int result;
+
+	memset(&info, 0, sizeof(info));
+	info.id = kctl->id;
+	info.id.index += ioff;
+	info.id.numid += ioff;
+	result = kctl->info(kctl, &info);
+	if (result < 0)
+		return -1;
+	memset(&value, 0, sizeof(value));
+	value.id = info.id;
+	result = kctl->get(kctl, &value);
+	if (result < 0)
+		return -1;
+	if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
+		for (i = 0; i < info.count; i++)
+			if (value.value.integer.value[i] != info.value.integer.min)
+				return 1;
+	} else if (info.type == SNDRV_CTL_ELEM_TYPE_INTEGER64) {
+		for (i = 0; i < info.count; i++)
+			if (value.value.integer64.value[i] != info.value.integer64.min)
+				return 1;
+	}
+	return 0;
+}
+
+static int snd_ctl_led_set_state_for_card(int card_number, unsigned int group)
+{
+	struct snd_card *card = snd_control_led_cards[card_number];
+	struct snd_kcontrol *kctl;
+	struct snd_kcontrol_volatile *vd;
+	unsigned int ioff;
+	int route = -1;
+
+	down_read(&card->controls_rwsem);
+	list_for_each_entry(kctl, &card->controls, list) {
+		for (ioff = 0; ioff < kctl->count; ioff++) {
+			vd = &kctl->vd[ioff];
+			if (vd->access & group)
+				UPDATE_ROUTE(route, snd_ctl_led_get(card, kctl, ioff));
+		}
+	}
+	up_read(&card->controls_rwsem);
+	return route;
+}
+
+static void snd_ctl_led_set_state(struct snd_card *card, unsigned int group)
+{
+	int card_number;
+	enum led_audio led_trigger_type;
+	int route;
+
+	if (group == SNDRV_CTL_ELEM_ACCESS_SPK_LED) {
+		led_trigger_type = LED_AUDIO_MUTE;
+	} else if (group == SNDRV_CTL_ELEM_ACCESS_MIC_LED) {
+		led_trigger_type = LED_AUDIO_MICMUTE;
+	} else {
+		return;
+	}
+	route = -1;
+	mutex_lock(&snd_control_led_mutex);
+	/* the card may not be registered (active) at this point */
+	if (snd_control_led_cards[card->number] == NULL) {
+		mutex_unlock(&snd_control_led_mutex);
+		return;
+	}
+	for (card_number = 0; card_number <= snd_control_led_last_card; card_number++)
+		UPDATE_ROUTE(route, snd_ctl_led_set_state_for_card(card_number, group));
+	mutex_unlock(&snd_control_led_mutex);
+	if (route >= 0)
+		ledtrig_audio_set(led_trigger_type, route ? LED_OFF : LED_ON);
+
+}
+
+void snd_ctl_led_notify(struct snd_card *card, unsigned int mask,
+			struct snd_kcontrol *kctl, unsigned int ioff)
+{
+	if (mask == SNDRV_CTL_EVENT_MASK_REMOVE ||
+	    (mask & (SNDRV_CTL_EVENT_MASK_INFO |
+		     SNDRV_CTL_EVENT_MASK_ADD |
+		     SNDRV_CTL_EVENT_MASK_VALUE)) != 0) {
+		struct snd_kcontrol_volatile *vd = &kctl->vd[ioff];
+		if (vd->access & SNDRV_CTL_ELEM_ACCESS_SPK_LED)
+			snd_ctl_led_set_state(card, SNDRV_CTL_ELEM_ACCESS_SPK_LED);
+		if (vd->access & SNDRV_CTL_ELEM_ACCESS_MIC_LED)
+			snd_ctl_led_set_state(card, SNDRV_CTL_ELEM_ACCESS_MIC_LED);
+	}
+}
+
+void snd_ctl_led_register(struct snd_card *card)
+{
+	if (snd_BUG_ON(card->number < 0 ||
+		       card->number >= ARRAY_SIZE(snd_control_led_cards)))
+		return;
+	mutex_lock(&snd_control_led_mutex);
+	snd_control_led_cards[card->number] = card;
+	if (card->number > snd_control_led_last_card)
+		snd_control_led_last_card = card->number;
+	mutex_unlock(&snd_control_led_mutex);
+	snd_ctl_led_set_state(card, SNDRV_CTL_ELEM_ACCESS_SPK_LED);
+	snd_ctl_led_set_state(card, SNDRV_CTL_ELEM_ACCESS_MIC_LED);
+}
+
+void snd_ctl_led_disconnect(struct snd_card *card)
+{
+	mutex_lock(&snd_control_led_mutex);
+	if (snd_control_led_last_card == card->number) {
+		while (snd_control_led_last_card > 0)
+			if (snd_control_led_cards[--snd_control_led_last_card])
+				break;
+	}
+	snd_control_led_cards[card->number] = NULL;
+	mutex_unlock(&snd_control_led_mutex);
+	snd_ctl_led_set_state(card, SNDRV_CTL_ELEM_ACCESS_SPK_LED);
+	snd_ctl_led_set_state(card, SNDRV_CTL_ELEM_ACCESS_MIC_LED);
+}
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 90759391cbac..ccf788ede8ba 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -9,7 +9,8 @@ config SND_HDA
 	select SND_HDA_CORE
 
 config SND_HDA_GENERIC_LEDS
-       bool
+	bool
+	select SND_LED	# just for test, ignore, please!
 
 config SND_HDA_INTEL
 	tristate "HD Audio PCI"
-- 
2.29.2
