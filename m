Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AF533F6F4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:33:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 531D816ED;
	Wed, 17 Mar 2021 18:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 531D816ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616002416;
	bh=Q8pxTk3I/yn/VzOuwdRZpwKHxfHtjYGJ3FWvyRWadIY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmuflXTXdfZywxRw32hb8l2UK8piZ9dhNOfkov/cnYv8FB9c0ElRfvx4ZyMF8AzNr
	 ctd4VtqPKRETTAf7/jH9OHNiO4SFGGybBpEKP+iSXFmtiCiiDAaPCQw4A3SSYnkLY8
	 pD1QAkyIfzYpoapo+JUe/4djEM6PIePL8+18Xos0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A748F804A9;
	Wed, 17 Mar 2021 18:30:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5E2F80253; Wed, 17 Mar 2021 18:30:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_FAIL,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C174F8023C
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:30:07 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C270BA0046;
 Wed, 17 Mar 2021 18:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C270BA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616002206; bh=6kD5zATXnBQFDOj0UOLkb8RB9SxBRcqvaUjvcdBtyGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=reQ0OhR+ZOESB/nVnRqOBsLs3odgNkshSFKTQm3gw505LaGi5NmhE0BFH/hTW+gQ7
 N+KumpiMPt1tue8/iiC+m56OFhOfBNk98I+ribdjrMkSPWtYl8HXrN8SjN+k8wHHJ3
 P8cQ3A1rVnaZnKtPicd/BgpGVIR9Ns/yypxYwWxY=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Mar 2021 18:30:02 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v4 3/6] ALSA: control - add generic LED trigger module as the
 new control layer
Date: Wed, 17 Mar 2021 18:29:42 +0100
Message-Id: <20210317172945.842280-4-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317172945.842280-1-perex@perex.cz>
References: <20210317172945.842280-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>
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

The recent laptops have usually two LEDs assigned to reflect
the speaker and microphone mute state. This implementation
adds a tiny layer on top of the control API which calculates
the state for those LEDs using the driver callbacks.

Two new access flags are introduced to describe the controls
which affects the audio path settings (an easy code change
for drivers).

The LED resource can be shared with multiple sound cards with
this code. The user space controls may be added to the state
chain on demand, too.

This code should replace the LED code in the HDA driver and
add a possibility to easy extend the other drivers (ASoC
codecs etc.).

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/control.h  |  19 ++-
 sound/core/Kconfig       |   6 +
 sound/core/Makefile      |   2 +
 sound/core/control.c     |   4 +-
 sound/core/control_led.c | 278 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 307 insertions(+), 2 deletions(-)
 create mode 100644 sound/core/control_led.c

diff --git a/include/sound/control.h b/include/sound/control.h
index 175610bfa8c8..985c51a8fb74 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -24,7 +24,7 @@ typedef int (snd_kcontrol_tlv_rw_t)(struct snd_kcontrol *kcontrol,
 
 /* internal flag for skipping validations */
 #ifdef CONFIG_SND_CTL_VALIDATION
-#define SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK	(1 << 27)
+#define SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK	(1 << 24)
 #define snd_ctl_skip_validation(info) \
 	((info)->access & SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK)
 #else
@@ -32,6 +32,12 @@ typedef int (snd_kcontrol_tlv_rw_t)(struct snd_kcontrol *kcontrol,
 #define snd_ctl_skip_validation(info)		true
 #endif
 
+/* kernel only - LED bits */
+#define SNDRV_CTL_ELEM_ACCESS_LED_SHIFT		25
+#define SNDRV_CTL_ELEM_ACCESS_LED_MASK		(7<<25) /* kernel three bits - LED group */
+#define SNDRV_CTL_ELEM_ACCESS_SPK_LED		(1<<25) /* kernel speaker (output) LED flag */
+#define SNDRV_CTL_ELEM_ACCESS_MIC_LED		(2<<25) /* kernel microphone (input) LED flag */
+
 enum {
 	SNDRV_CTL_TLV_OP_READ = 0,
 	SNDRV_CTL_TLV_OP_WRITE = 1,
@@ -265,6 +271,17 @@ int snd_ctl_apply_vmaster_followers(struct snd_kcontrol *kctl,
 						void *arg),
 				    void *arg);
 
+/*
+ * Control LED trigger layer
+ */
+#define SND_CTL_LAYER_MODULE_LED	"snd-ctl-led"
+
+#if IS_MODULE(CONFIG_SND_CTL_LED)
+static inline int snd_ctl_led_request(void) { return snd_ctl_request_layer(SND_CTL_LAYER_MODULE_LED); }
+#else
+static inline int snd_ctl_led_request(void) { return 0; }
+#endif
+
 /*
  * Helper functions for jack-detection controls
  */
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index a4050f87f230..db2e3c63ff41 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -203,4 +203,10 @@ config SND_DMA_SGBUF
 	def_bool y
 	depends on X86
 
+config SND_CTL_LED
+	tristate
+	select NEW_LEDS if SND_CTL_LED
+	select LEDS_TRIGGERS if SND_CTL_LED
+	select LEDS_TRIGGER_AUDIO if SND_CTL_LED
+
 source "sound/core/seq/Kconfig"
diff --git a/sound/core/Makefile b/sound/core/Makefile
index ee4a4a6b99ba..d774792850f3 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -27,6 +27,7 @@ CFLAGS_pcm_native.o := -I$(src)
 
 snd-pcm-dmaengine-objs := pcm_dmaengine.o
 
+snd-ctl-led-objs  := control_led.o
 snd-rawmidi-objs  := rawmidi.o
 snd-timer-objs    := timer.o
 snd-hrtimer-objs  := hrtimer.o
@@ -37,6 +38,7 @@ snd-seq-device-objs := seq_device.o
 snd-compress-objs := compress_offload.o
 
 obj-$(CONFIG_SND) 		+= snd.o
+obj-$(CONFIG_SND_CTL_LED)	+= snd-ctl-led.o
 obj-$(CONFIG_SND_HWDEP)		+= snd-hwdep.o
 obj-$(CONFIG_SND_TIMER)		+= snd-timer.o
 obj-$(CONFIG_SND_HRTIMER)	+= snd-hrtimer.o
diff --git a/sound/core/control.c b/sound/core/control.c
index 87630021e434..6825ca75daf5 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -278,6 +278,7 @@ struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new *ncontrol,
 		   SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE |
 		   SNDRV_CTL_ELEM_ACCESS_TLV_COMMAND |
 		   SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK |
+		   SNDRV_CTL_ELEM_ACCESS_LED_MASK |
 		   SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK);
 
 	err = snd_ctl_new(&kctl, count, access, NULL);
@@ -1047,7 +1048,8 @@ static int snd_ctl_elem_info_user(struct snd_ctl_file *ctl,
 	if (result < 0)
 		return result;
 	/* drop internal access flags */
-	info.access &= ~SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK;
+	info.access &= ~(SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK|
+			 SNDRV_CTL_ELEM_ACCESS_LED_MASK);
 	if (copy_to_user(_info, &info, sizeof(info)))
 		return -EFAULT;
 	return result;
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
new file mode 100644
index 000000000000..3e2c3c485c5c
--- /dev/null
+++ b/sound/core/control_led.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  LED state routines for driver control interface
+ *  Copyright (c) 2021 by Jaroslav Kysela <perex@perex.cz>
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/leds.h>
+#include <sound/core.h>
+#include <sound/control.h>
+
+MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
+MODULE_DESCRIPTION("ALSA control interface to LED trigger code.");
+MODULE_LICENSE("GPL");
+
+#define MAX_LED (((SNDRV_CTL_ELEM_ACCESS_MIC_LED - SNDRV_CTL_ELEM_ACCESS_SPK_LED) \
+			>> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) + 1)
+
+struct snd_ctl_led {
+	struct list_head list;
+	struct snd_card *card;
+	unsigned int access;
+	struct snd_kcontrol *kctl;
+	unsigned int index_offset;
+};
+
+static DEFINE_MUTEX(snd_ctl_led_mutex);
+static struct list_head snd_ctl_led_controls[MAX_LED];
+static bool snd_ctl_led_card_valid[SNDRV_CARDS];
+
+#define UPDATE_ROUTE(route, cb) \
+	do { \
+		int route2 = (cb); \
+		if (route2 >= 0) \
+			route = route < 0 ? route2 : (route | route2); \
+	} while (0)
+
+static inline unsigned int access_to_group(unsigned int access)
+{
+	return ((access & SNDRV_CTL_ELEM_ACCESS_LED_MASK) >>
+				SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) - 1;
+}
+
+static inline unsigned int group_to_access(unsigned int group)
+{
+	return (group + 1) << SNDRV_CTL_ELEM_ACCESS_LED_SHIFT;
+}
+
+static struct list_head *snd_ctl_led_controls_by_access(unsigned int access)
+{
+	unsigned int group = access_to_group(access);
+	if (group >= MAX_LED)
+		return NULL;
+	return &snd_ctl_led_controls[group];
+}
+
+static int snd_ctl_led_get(struct snd_ctl_led *lctl)
+{
+	struct snd_kcontrol *kctl = lctl->kctl;
+	struct snd_ctl_elem_info info;
+	struct snd_ctl_elem_value value;
+	unsigned int i;
+	int result;
+
+	memset(&info, 0, sizeof(info));
+	info.id = kctl->id;
+	info.id.index += lctl->index_offset;
+	info.id.numid += lctl->index_offset;
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
+static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
+				  struct snd_kcontrol *kctl, unsigned int ioff)
+{
+	struct list_head *controls;
+	struct snd_ctl_led *lctl;
+	enum led_audio led_trigger_type;
+	int route;
+	bool found;
+
+	controls = snd_ctl_led_controls_by_access(access);
+	if (!controls)
+		return;
+	if (access == SNDRV_CTL_ELEM_ACCESS_SPK_LED) {
+		led_trigger_type = LED_AUDIO_MUTE;
+	} else if (access == SNDRV_CTL_ELEM_ACCESS_MIC_LED) {
+		led_trigger_type = LED_AUDIO_MICMUTE;
+	} else {
+		return;
+	}
+	route = -1;
+	found = false;
+	mutex_lock(&snd_ctl_led_mutex);
+	/* the card may not be registered (active) at this point */
+	if (card && !snd_ctl_led_card_valid[card->number]) {
+		mutex_unlock(&snd_ctl_led_mutex);
+		return;
+	}
+	list_for_each_entry(lctl, controls, list) {
+		if (lctl->kctl == kctl && lctl->index_offset == ioff)
+			found = true;
+		UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
+	}
+	if (!found && kctl && card) {
+		lctl = kzalloc(sizeof(*lctl), GFP_KERNEL);
+		if (lctl) {
+			lctl->card = card;
+			lctl->access = access;
+			lctl->kctl = kctl;
+			lctl->index_offset = ioff;
+			list_add(&lctl->list, controls);
+			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
+		}
+	}
+	mutex_unlock(&snd_ctl_led_mutex);
+	if (route >= 0)
+		ledtrig_audio_set(led_trigger_type, route ? LED_OFF : LED_ON);
+}
+
+static struct snd_ctl_led *snd_ctl_led_find(struct snd_kcontrol *kctl, unsigned int ioff)
+{
+	struct list_head *controls;
+	struct snd_ctl_led *lctl;
+	unsigned int group;
+
+	for (group = 0; group < MAX_LED; group++) {
+		controls = &snd_ctl_led_controls[group];
+		list_for_each_entry(lctl, controls, list)
+			if (lctl->kctl == kctl && lctl->index_offset == ioff)
+				return lctl;
+	}
+	return NULL;
+}
+
+static unsigned int snd_ctl_led_remove(struct snd_kcontrol *kctl, unsigned int ioff,
+				       unsigned int access)
+{
+	struct snd_ctl_led *lctl;
+	unsigned int ret = 0;
+
+	mutex_lock(&snd_ctl_led_mutex);
+	lctl = snd_ctl_led_find(kctl, ioff);
+	if (lctl && (access == 0 || access != lctl->access)) {
+		ret = lctl->access;
+		list_del(&lctl->list);
+		kfree(lctl);
+	}
+	mutex_unlock(&snd_ctl_led_mutex);
+	return ret;
+}
+
+static void snd_ctl_led_notify(struct snd_card *card, unsigned int mask,
+			       struct snd_kcontrol *kctl, unsigned int ioff)
+{
+	struct snd_kcontrol_volatile *vd;
+	unsigned int access, access2;
+
+	if (mask == SNDRV_CTL_EVENT_MASK_REMOVE) {
+		access = snd_ctl_led_remove(kctl, ioff, 0);
+		if (access)
+			snd_ctl_led_set_state(card, access, NULL, 0);
+	} else if (mask & SNDRV_CTL_EVENT_MASK_INFO) {
+		vd = &kctl->vd[ioff];
+		access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+		access2 = snd_ctl_led_remove(kctl, ioff, access);
+		if (access2)
+			snd_ctl_led_set_state(card, access2, NULL, 0);
+		if (access)
+			snd_ctl_led_set_state(card, access, kctl, ioff);
+	} else if ((mask & (SNDRV_CTL_EVENT_MASK_ADD |
+			    SNDRV_CTL_EVENT_MASK_VALUE)) != 0) {
+		vd = &kctl->vd[ioff];
+		access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+		if (access)
+			snd_ctl_led_set_state(card, access, kctl, ioff);
+	}
+}
+
+static void snd_ctl_led_refresh(void)
+{
+	unsigned int group;
+
+	for (group = 0; group < MAX_LED; group++)
+		snd_ctl_led_set_state(NULL, group_to_access(group), NULL, 0);
+}
+
+static void snd_ctl_led_clean(struct snd_card *card)
+{
+	unsigned int group;
+	struct list_head *controls;
+	struct snd_ctl_led *lctl;
+
+	for (group = 0; group < MAX_LED; group++) {
+		controls = &snd_ctl_led_controls[group];
+repeat:
+		list_for_each_entry(lctl, controls, list)
+			if (!card || lctl->card == card) {
+				list_del(&lctl->list);
+				kfree(lctl);
+				goto repeat;
+			}
+	}
+}
+
+static void snd_ctl_led_register(struct snd_card *card)
+{
+	struct snd_kcontrol *kctl;
+	unsigned int ioff;
+
+	if (snd_BUG_ON(card->number < 0 ||
+		       card->number >= ARRAY_SIZE(snd_ctl_led_card_valid)))
+		return;
+	mutex_lock(&snd_ctl_led_mutex);
+	snd_ctl_led_card_valid[card->number] = true;
+	mutex_unlock(&snd_ctl_led_mutex);
+	/* the register callback is already called with held card->controls_rwsem */
+	list_for_each_entry(kctl, &card->controls, list)
+		for (ioff = 0; ioff < kctl->count; ioff++)
+			snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, ioff);
+	snd_ctl_led_refresh();
+}
+
+static void snd_ctl_led_disconnect(struct snd_card *card)
+{
+	mutex_lock(&snd_ctl_led_mutex);
+	snd_ctl_led_card_valid[card->number] = false;
+	snd_ctl_led_clean(card);
+	mutex_unlock(&snd_ctl_led_mutex);
+	snd_ctl_led_refresh();
+}
+
+/*
+ * Control layer registration
+ */
+static struct snd_ctl_layer_ops snd_ctl_led_lops = {
+	.module_name = SND_CTL_LAYER_MODULE_LED,
+	.lregister = snd_ctl_led_register,
+	.ldisconnect = snd_ctl_led_disconnect,
+	.lnotify = snd_ctl_led_notify,
+};
+
+static int __init snd_ctl_led_init(void)
+{
+	unsigned int group;
+
+	for (group = 0; group < MAX_LED; group++)
+		INIT_LIST_HEAD(&snd_ctl_led_controls[group]);
+	snd_ctl_register_layer(&snd_ctl_led_lops);
+	return 0;
+}
+
+static void __exit snd_ctl_led_exit(void)
+{
+	snd_ctl_disconnect_layer(&snd_ctl_led_lops);
+	snd_ctl_led_clean(NULL);
+}
+
+module_init(snd_ctl_led_init)
+module_exit(snd_ctl_led_exit)
-- 
2.29.2
