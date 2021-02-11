Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95A31893B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 12:17:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2386416DB;
	Thu, 11 Feb 2021 12:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2386416DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613042274;
	bh=MVEkQ0C7i6yrS6PhD5WDkw3guXoqwVdPOUUPxv/X35k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JAeiIdX7D0upl2HkD575de2KSh+UvBPocZw1Y02rITLfHEEsE/keTufg42spPlVY7
	 KaDhBYnFbZw+FsAFZX8lwEwKqdvuK82XzkiQS+QWUE7ijnydPu3Kb/bUZfzCSppttp
	 Fyjm9QFHCxp4rlkVNtKC4QJV1QDkLg235+g1YR4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D9FF80425;
	Thu, 11 Feb 2021 12:14:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59123F80424; Thu, 11 Feb 2021 12:14:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C1DDF802E7
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 12:14:48 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0C18AA0040;
 Thu, 11 Feb 2021 12:14:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0C18AA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613042088; bh=gfSe7ggs4dmR69ZAxjDhv31YoZVne2zm7PE0hyvVweM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ujyuAjfQ3sjgJBUJ0oC0QNraFScQm5lLMVEIrwLda5PaaQ7evQzItDKuFknUlbu/0
 q91rSdqYXbH0aQicw15aKs1AxmAZFJ3n+WkB7JD28oBWgioxwuTlUZYt07CP7g5N4v
 z1lcAfMq5DLjrMsq80Ysdm9H2u7ZkrKW5WsScmqo=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Feb 2021 12:14:42 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH 5/5] ALSA: control - add sysfs support to the LED trigger
 module
Date: Thu, 11 Feb 2021 12:14:00 +0100
Message-Id: <20210211111400.1131020-6-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211111400.1131020-1-perex@perex.cz>
References: <20210211111400.1131020-1-perex@perex.cz>
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

Create SYSFS/devices/virtual/sound/ctl-led tree
(with SYSFS/class/sound/ctl-led symlink).

  speaker/
    +-- mode
    +-- state
  mic/
    +-- mode
    +-- state

Copy the idea from the HDA driver and allow to set the audio
LEDs based on the various modes:

- follow mute
- follow moute (inverted to follow mute)
- off
- on

Also, the actual LED state is exposed.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/control_led.c | 193 ++++++++++++++++++++++++++++++++-------
 1 file changed, 162 insertions(+), 31 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 49b78c12e0e9..638808e397fe 100644
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
 	struct snd_kcontrol *kctl;
@@ -25,8 +41,21 @@ struct snd_ctl_led {
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
@@ -46,15 +75,15 @@ static inline unsigned int group_to_access(unsigned int group)
 	return (group + 1) << SNDRV_CTL_ELEM_ACCESS_LED_SHIFT;
 }
 
-struct list_head *snd_ctl_led_controls_by_access(unsigned int access)
+struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
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
@@ -87,7 +116,7 @@ static int snd_ctl_led_get(struct snd_ctl_led *lctl)
 	return 0;
 }
 
-static int snd_ctl_led_get_lock(struct snd_ctl_led *lctl)
+static int snd_ctl_led_get_lock(struct snd_ctl_led_ctl *lctl)
 {
 	struct snd_card *card = lctl->card;
 	int route;
@@ -101,22 +130,14 @@ static int snd_ctl_led_get_lock(struct snd_ctl_led *lctl)
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
@@ -125,7 +146,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 		mutex_unlock(&snd_ctl_led_mutex);
 		return;
 	}
-	list_for_each_entry(lctl, controls, list) {
+	list_for_each_entry(lctl, &led->controls, list) {
 		if (lctl->kctl == kctl && lctl->index_offset == ioff)
 			found = true;
 		UPDATE_ROUTE(route, snd_ctl_led_get_lock(lctl));
@@ -136,27 +157,33 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 			lctl->card = card;
 			lctl->kctl = kctl;
 			lctl->index_offset = ioff;
-			list_add(&lctl->list, controls);
+			list_add(&lctl->list, &led->controls);
 			UPDATE_ROUTE(route, snd_ctl_led_get_lock(lctl));
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
 
 static void snd_ctl_led_remove(struct snd_kcontrol *kctl, unsigned int ioff)
 {
 	struct snd_kcontrol_volatile *vd;
-	struct list_head *controls;
-	struct snd_ctl_led *lctl;
+	struct snd_ctl_led *led;
+	struct snd_ctl_led_ctl *lctl;
 
 	vd = &kctl->vd[ioff];
-	controls = snd_ctl_led_controls_by_access(vd->access);
-	if (!controls)
+	led = snd_ctl_led_get_by_access(vd->access);
+	if (!led)
 		return;
 	mutex_lock(&snd_ctl_led_mutex);
-	list_for_each_entry(lctl, controls, list)
+	list_for_each_entry(lctl, &led->controls, list)
 		if (lctl->kctl == kctl && lctl->index_offset == ioff) {
 			list_del(&lctl->list);
 			kfree(lctl);
@@ -193,13 +220,13 @@ static void snd_ctl_led_refresh(void)
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
@@ -246,6 +273,90 @@ void snd_ctl_led_hello(void)
 }
 EXPORT_SYMBOL(snd_ctl_led_hello);
 
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
+static ssize_t show_state(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
+	enum led_brightness b;
+	const char *str;
+
+	b = ledtrig_audio_get(led->trigger_type);
+	switch (b) {
+	case LED_ON:	str = "on"; break;
+	case LED_OFF:	str = "off"; break;
+	default:	str = "?"; break;
+	}
+	return sprintf(buf, "%s\n", str);
+}
+
+static DEVICE_ATTR(mode, 0644, show_mode, store_mode);
+static DEVICE_ATTR(state, 0444, show_state, NULL);
+
+static struct attribute *snd_ctl_led_dev_attrs[] = {
+	&dev_attr_mode.attr,
+	&dev_attr_state.attr,
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
@@ -258,16 +369,36 @@ static struct snd_ctl_layer_ops snd_ctl_led_lops = {
 
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
+			device_del(&snd_ctl_led_dev);
+			return -ENOMEM;
+		}
+	}
 	snd_ctl_register_layer(&snd_ctl_led_lops);
 	return 0;
 }
 
 static void __exit snd_ctl_led_exit(void)
 {
+	device_del(&snd_ctl_led_dev);
 	snd_ctl_disconnect_layer(&snd_ctl_led_lops);
 	snd_ctl_led_clean(NULL);
 }
-- 
2.29.2
