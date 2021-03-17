Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA1E33F6F2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:33:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D06916F4;
	Wed, 17 Mar 2021 18:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D06916F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616002404;
	bh=But09JBNNCy94I38FlWfHMHmG/sqylWfLr2sUlgYKSk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sY5DjaSSqx0DbxQbavtFuOjlPo1x7frV3rZEsir4n4w9mDz+L0FZm/HDwMA+rcgoc
	 z2LpSmT5Rt9qd3ohdVeYBryjYu8HQiR1NvsEi28JQDNJNJO8dVc2TBUgVtZlAHqg8y
	 sJRavnS1XeT4E6STl+QcMY7gi+wBKzA2tclzc/5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C578F8042F;
	Wed, 17 Mar 2021 18:30:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4CEBF80148; Wed, 17 Mar 2021 18:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 999FAF801F7
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:30:15 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3570CA0042;
 Wed, 17 Mar 2021 18:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3570CA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616002215; bh=KUFIkdfnFXKKjQvl/7O7tqhW/lo++V9f1MRFc9nol8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W307PK15DcYf5JfN0itIYGipNgH74T2bcRm1gCzgSd5eceiSSWeChpOFbSJnRHUqj
 kO/FcovHgGUntrzjnK0vnm6o2+WUu+hlVRZ7KG3C+pd2PNaLf6/0mp0XKVAEn+e1Ct
 55OT6mKE1gz7Hk91e2IH7inizanO3swSWwhmib4Q=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Mar 2021 18:30:11 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v4 5/6] ALSA: control - add sysfs support to the LED trigger
 module
Date: Wed, 17 Mar 2021 18:29:44 +0100
Message-Id: <20210317172945.842280-6-perex@perex.cz>
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

Create SYSFS/devices/virtual/sound/ctl-led tree
(with SYSFS/class/sound/ctl-led symlink).

  speaker/
    +-- mode
    +-- brightness
  mic/
    +-- mode
    +-- brightness

Copy the idea from the HDA driver and allow to set the audio
LEDs based on the various modes:

- follow mute
- follow moute (inverted to follow mute)
- off
- on

Also, the actual LED state is exposed.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/control_led.c | 192 +++++++++++++++++++++++++++++++++------
 1 file changed, 163 insertions(+), 29 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 3e2c3c485c5c..dfa51d8461e1 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -17,7 +17,23 @@ MODULE_LICENSE("GPL");
 #define MAX_LED (((SNDRV_CTL_ELEM_ACCESS_MIC_LED - SNDRV_CTL_ELEM_ACCESS_SPK_LED) \
 			>> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) + 1)
 
+enum snd_ctl_led_mode {
+	 MODE_FOLLOW_MUTE = 0,
+	 MODE_FOLLOW_ROUTE,
+	 MODE_OFF,
+	 MODE_ON,
+};
+
 struct snd_ctl_led {
+	struct device dev;
+	struct list_head controls;
+	const char *name;
+	unsigned int group;
+	enum led_audio trigger_type;
+	enum snd_ctl_led_mode mode;
+};
+
+struct snd_ctl_led_ctl {
 	struct list_head list;
 	struct snd_card *card;
 	unsigned int access;
@@ -26,8 +42,21 @@ struct snd_ctl_led {
 };
 
 static DEFINE_MUTEX(snd_ctl_led_mutex);
-static struct list_head snd_ctl_led_controls[MAX_LED];
 static bool snd_ctl_led_card_valid[SNDRV_CARDS];
+static struct snd_ctl_led snd_ctl_leds[MAX_LED] = {
+	{
+		.name = "speaker",
+		.group = (SNDRV_CTL_ELEM_ACCESS_SPK_LED >> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) - 1,
+		.trigger_type = LED_AUDIO_MUTE,
+		.mode = MODE_FOLLOW_MUTE,
+	},
+	{
+		.name = "mic",
+		.group = (SNDRV_CTL_ELEM_ACCESS_MIC_LED >> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) - 1,
+		.trigger_type = LED_AUDIO_MICMUTE,
+		.mode = MODE_FOLLOW_MUTE,
+	},
+};
 
 #define UPDATE_ROUTE(route, cb) \
 	do { \
@@ -47,15 +76,15 @@ static inline unsigned int group_to_access(unsigned int group)
 	return (group + 1) << SNDRV_CTL_ELEM_ACCESS_LED_SHIFT;
 }
 
-static struct list_head *snd_ctl_led_controls_by_access(unsigned int access)
+static struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
 {
 	unsigned int group = access_to_group(access);
 	if (group >= MAX_LED)
 		return NULL;
-	return &snd_ctl_led_controls[group];
+	return &snd_ctl_leds[group];
 }
 
-static int snd_ctl_led_get(struct snd_ctl_led *lctl)
+static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
 {
 	struct snd_kcontrol *kctl = lctl->kctl;
 	struct snd_ctl_elem_info info;
@@ -91,22 +120,14 @@ static int snd_ctl_led_get(struct snd_ctl_led *lctl)
 static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 				  struct snd_kcontrol *kctl, unsigned int ioff)
 {
-	struct list_head *controls;
-	struct snd_ctl_led *lctl;
-	enum led_audio led_trigger_type;
+	struct snd_ctl_led *led;
+	struct snd_ctl_led_ctl *lctl;
 	int route;
 	bool found;
 
-	controls = snd_ctl_led_controls_by_access(access);
-	if (!controls)
+	led = snd_ctl_led_get_by_access(access);
+	if (!led)
 		return;
-	if (access == SNDRV_CTL_ELEM_ACCESS_SPK_LED) {
-		led_trigger_type = LED_AUDIO_MUTE;
-	} else if (access == SNDRV_CTL_ELEM_ACCESS_MIC_LED) {
-		led_trigger_type = LED_AUDIO_MICMUTE;
-	} else {
-		return;
-	}
 	route = -1;
 	found = false;
 	mutex_lock(&snd_ctl_led_mutex);
@@ -115,7 +136,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 		mutex_unlock(&snd_ctl_led_mutex);
 		return;
 	}
-	list_for_each_entry(lctl, controls, list) {
+	list_for_each_entry(lctl, &led->controls, list) {
 		if (lctl->kctl == kctl && lctl->index_offset == ioff)
 			found = true;
 		UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
@@ -127,23 +148,29 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 			lctl->access = access;
 			lctl->kctl = kctl;
 			lctl->index_offset = ioff;
-			list_add(&lctl->list, controls);
+			list_add(&lctl->list, &led->controls);
 			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
 		}
 	}
 	mutex_unlock(&snd_ctl_led_mutex);
+	switch (led->mode) {
+	case MODE_OFF:		route = 1; break;
+	case MODE_ON:		route = 0; break;
+	case MODE_FOLLOW_ROUTE:	if (route >= 0) route ^= 1; break;
+	case MODE_FOLLOW_MUTE:	/* noop */ break;
+	}
 	if (route >= 0)
-		ledtrig_audio_set(led_trigger_type, route ? LED_OFF : LED_ON);
+		ledtrig_audio_set(led->trigger_type, route ? LED_OFF : LED_ON);
 }
 
-static struct snd_ctl_led *snd_ctl_led_find(struct snd_kcontrol *kctl, unsigned int ioff)
+static struct snd_ctl_led_ctl *snd_ctl_led_find(struct snd_kcontrol *kctl, unsigned int ioff)
 {
 	struct list_head *controls;
-	struct snd_ctl_led *lctl;
+	struct snd_ctl_led_ctl *lctl;
 	unsigned int group;
 
 	for (group = 0; group < MAX_LED; group++) {
-		controls = &snd_ctl_led_controls[group];
+		controls = &snd_ctl_leds[group].controls;
 		list_for_each_entry(lctl, controls, list)
 			if (lctl->kctl == kctl && lctl->index_offset == ioff)
 				return lctl;
@@ -154,7 +181,7 @@ static struct snd_ctl_led *snd_ctl_led_find(struct snd_kcontrol *kctl, unsigned
 static unsigned int snd_ctl_led_remove(struct snd_kcontrol *kctl, unsigned int ioff,
 				       unsigned int access)
 {
-	struct snd_ctl_led *lctl;
+	struct snd_ctl_led_ctl *lctl;
 	unsigned int ret = 0;
 
 	mutex_lock(&snd_ctl_led_mutex);
@@ -206,13 +233,13 @@ static void snd_ctl_led_refresh(void)
 static void snd_ctl_led_clean(struct snd_card *card)
 {
 	unsigned int group;
-	struct list_head *controls;
-	struct snd_ctl_led *lctl;
+	struct snd_ctl_led *led;
+	struct snd_ctl_led_ctl *lctl;
 
 	for (group = 0; group < MAX_LED; group++) {
-		controls = &snd_ctl_led_controls[group];
+		led = &snd_ctl_leds[group];
 repeat:
-		list_for_each_entry(lctl, controls, list)
+		list_for_each_entry(lctl, &led->controls, list)
 			if (!card || lctl->card == card) {
 				list_del(&lctl->list);
 				kfree(lctl);
@@ -248,6 +275,82 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
 	snd_ctl_led_refresh();
 }
 
+/*
+ * sysfs
+ */
+
+static ssize_t show_mode(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
+	const char *str;
+
+	switch (led->mode) {
+	case MODE_FOLLOW_MUTE:	str = "follow-mute"; break;
+	case MODE_FOLLOW_ROUTE:	str = "follow-route"; break;
+	case MODE_ON:		str = "on"; break;
+	case MODE_OFF:		str = "off"; break;
+	}
+	return sprintf(buf, "%s\n", str);
+}
+
+static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
+	char _buf[16];
+	size_t l = min(count, sizeof(_buf) - 1) + 1;
+	enum snd_ctl_led_mode mode;
+
+	memcpy(_buf, buf, l);
+	_buf[l] = '\0';
+	if (strstr(_buf, "mute"))
+		mode = MODE_FOLLOW_MUTE;
+	else if (strstr(_buf, "route"))
+		mode = MODE_FOLLOW_ROUTE;
+	else if (strncmp(_buf, "off", 3) == 0 || strncmp(_buf, "0", 1) == 0)
+		mode = MODE_OFF;
+	else if (strncmp(_buf, "on", 2) == 0 || strncmp(_buf, "1", 1) == 0)
+		mode = MODE_ON;
+	else
+		return count;
+
+	mutex_lock(&snd_ctl_led_mutex);
+	led->mode = mode;
+	mutex_unlock(&snd_ctl_led_mutex);
+
+	snd_ctl_led_set_state(NULL, group_to_access(led->group), NULL, 0);
+	return count;
+}
+
+static ssize_t show_brightness(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
+
+	return sprintf(buf, "%u\n", ledtrig_audio_get(led->trigger_type));
+}
+
+static DEVICE_ATTR(mode, 0644, show_mode, store_mode);
+static DEVICE_ATTR(brightness, 0444, show_brightness, NULL);
+
+static struct attribute *snd_ctl_led_dev_attrs[] = {
+	&dev_attr_mode.attr,
+	&dev_attr_brightness.attr,
+	NULL,
+};
+
+static const struct attribute_group snd_ctl_led_dev_attr_group = {
+	.attrs = snd_ctl_led_dev_attrs,
+};
+
+static const struct attribute_group *snd_ctl_led_dev_attr_groups[] = {
+	&snd_ctl_led_dev_attr_group,
+	NULL,
+};
+
+static struct device snd_ctl_led_dev;
+
 /*
  * Control layer registration
  */
@@ -260,16 +363,47 @@ static struct snd_ctl_layer_ops snd_ctl_led_lops = {
 
 static int __init snd_ctl_led_init(void)
 {
+	struct snd_ctl_led *led;
 	unsigned int group;
 
-	for (group = 0; group < MAX_LED; group++)
-		INIT_LIST_HEAD(&snd_ctl_led_controls[group]);
+	device_initialize(&snd_ctl_led_dev);
+	snd_ctl_led_dev.class = sound_class;
+	dev_set_name(&snd_ctl_led_dev, "ctl-led");
+	if (device_add(&snd_ctl_led_dev)) {
+		put_device(&snd_ctl_led_dev);
+		return -ENOMEM;
+	}
+	for (group = 0; group < MAX_LED; group++) {
+		led = &snd_ctl_leds[group];
+		INIT_LIST_HEAD(&led->controls);
+		device_initialize(&led->dev);
+		led->dev.parent = &snd_ctl_led_dev;
+		led->dev.groups = snd_ctl_led_dev_attr_groups;
+		dev_set_name(&led->dev, led->name);
+		if (device_add(&led->dev)) {
+			put_device(&led->dev);
+			for (; group > 0; group--) {
+				led = &snd_ctl_leds[group];
+				device_del(&led->dev);
+			}
+			device_del(&snd_ctl_led_dev);
+			return -ENOMEM;
+		}
+	}
 	snd_ctl_register_layer(&snd_ctl_led_lops);
 	return 0;
 }
 
 static void __exit snd_ctl_led_exit(void)
 {
+	struct snd_ctl_led *led;
+	unsigned int group;
+
+	for (group = 0; group < MAX_LED; group++) {
+		led = &snd_ctl_leds[group];
+		device_del(&led->dev);
+	}
+	device_del(&snd_ctl_led_dev);
 	snd_ctl_disconnect_layer(&snd_ctl_led_lops);
 	snd_ctl_led_clean(NULL);
 }
-- 
2.29.2
