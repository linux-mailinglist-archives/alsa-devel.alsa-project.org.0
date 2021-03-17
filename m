Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D033F71F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:34:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADB9E16D8;
	Wed, 17 Mar 2021 18:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADB9E16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616002449;
	bh=6jn2yY8vlkK8EeshpId7tcg1BBzVxyhMyK6r0A6lBvw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POKpa/MPK/ZKMX5aIKHXTtqCEjROuUERCKFFhdjhpNi3kXko4ydURaznLUdoG19dp
	 mdzNutghfGQbr0w7j589c2FE4tvIBVGO/Q+q5g96G48/DqtM6i0PTizaSZow7+qVhK
	 QCtDbWO7D6r4i03DgtnlERYat7cJvNQkEg+eA40g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56378F804AD;
	Wed, 17 Mar 2021 18:30:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14DF4F80253; Wed, 17 Mar 2021 18:30:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D174CF8023C
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:30:19 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6B3C1A0042;
 Wed, 17 Mar 2021 18:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6B3C1A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616002219; bh=3gMl5PhiJGtMQ5h4maZzD2DIH/xwu8QFP0QjXIyeyq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bK1cOIM16YAqvkdMvWz7cbptkxyle7kU/90+AH6vUfVk53xj9aYlPizS5OaKu21+j
 d8bcLDUqatb8gtYJ5noOWTS0yaaaWtguGKTs5BP3xl2o+HKr8KTZiXO8XsA2YANgSv
 mnpCNTvC+TVYzCYn/t0VgMYs4eO6BxGNpCgXDDrM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 17 Mar 2021 18:30:15 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
Date: Wed, 17 Mar 2021 18:29:45 +0100
Message-Id: <20210317172945.842280-7-perex@perex.cz>
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

We need to manage the kcontrol entries association for the LED trigger
from the user space. This patch adds a layer to the sysfs tree like:

/sys/devices/virtual/sound/ctl-led/mic
   + card0
   |  + attach
   |  + detach
   |  ...
   + card1
      + attach
      ...

Operations:

  attach and detach
    - amixer style ID is accepted and easy strings for numid and
      simple names
  reset
    - reset all associated kcontrol entries
  list
    - list associated kcontrol entries (numid values only)

Additional symlinks:

/sys/devices/virtual/sound/ctl-led/mic/card0/card ->
  /sys/class/sound/card0

/sys/class/sound/card0/controlC0/led-mic ->
  /sys/devices/virtual/sound/ctl-led/mic/card0

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/control_led.c | 366 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 362 insertions(+), 4 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index dfa51d8461e1..d4fb8b873f34 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -24,6 +24,12 @@ enum snd_ctl_led_mode {
 	 MODE_ON,
 };
 
+struct snd_ctl_led_card {
+	struct device dev;
+	int number;
+	struct snd_ctl_led *led;
+};
+
 struct snd_ctl_led {
 	struct device dev;
 	struct list_head controls;
@@ -31,6 +37,7 @@ struct snd_ctl_led {
 	unsigned int group;
 	enum led_audio trigger_type;
 	enum snd_ctl_led_mode mode;
+	struct snd_ctl_led_card *cards[SNDRV_CARDS];
 };
 
 struct snd_ctl_led_ctl {
@@ -58,6 +65,9 @@ static struct snd_ctl_led snd_ctl_leds[MAX_LED] = {
 	},
 };
 
+static void snd_ctl_led_sysfs_add(struct snd_card *card);
+static void snd_ctl_led_sysfs_remove(struct snd_card *card);
+
 #define UPDATE_ROUTE(route, cb) \
 	do { \
 		int route2 = (cb); \
@@ -222,6 +232,46 @@ static void snd_ctl_led_notify(struct snd_card *card, unsigned int mask,
 	}
 }
 
+static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
+			      unsigned int group, bool set)
+{
+	struct snd_card *card;
+	struct snd_kcontrol *kctl;
+	struct snd_kcontrol_volatile *vd;
+	unsigned int ioff, access, new_access;
+	int err = 0;
+
+	card = snd_card_ref(card_number);
+	if (card) {
+		down_write(&card->controls_rwsem);
+		kctl = snd_ctl_find_id(card, id);
+		if (kctl) {
+			ioff = snd_ctl_get_ioff(kctl, id);
+			vd = &kctl->vd[ioff];
+			access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+			if (access != 0 && access != group_to_access(group)) {
+				err = -EXDEV;
+				goto unlock;
+			}
+			new_access = vd->access & ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+			if (set)
+				new_access |= group_to_access(group);
+			if (new_access != vd->access) {
+				vd->access = new_access;
+				snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_INFO, kctl, ioff);
+			}
+		} else {
+			err = -ENOENT;
+		}
+unlock:
+		up_write(&card->controls_rwsem);
+		snd_card_unref(card);
+	} else {
+		err = -ENXIO;
+	}
+	return err;
+}
+
 static void snd_ctl_led_refresh(void)
 {
 	unsigned int group;
@@ -230,6 +280,12 @@ static void snd_ctl_led_refresh(void)
 		snd_ctl_led_set_state(NULL, group_to_access(group), NULL, 0);
 }
 
+static void snd_ctl_led_ctl_destroy(struct snd_ctl_led_ctl *lctl)
+{
+	list_del(&lctl->list);
+	kfree(lctl);
+}
+
 static void snd_ctl_led_clean(struct snd_card *card)
 {
 	unsigned int group;
@@ -241,13 +297,47 @@ static void snd_ctl_led_clean(struct snd_card *card)
 repeat:
 		list_for_each_entry(lctl, &led->controls, list)
 			if (!card || lctl->card == card) {
-				list_del(&lctl->list);
-				kfree(lctl);
+				snd_ctl_led_ctl_destroy(lctl);
 				goto repeat;
 			}
 	}
 }
 
+static int snd_ctl_led_reset(int card_number, unsigned int group)
+{
+	struct snd_card *card;
+	struct snd_ctl_led *led;
+	struct snd_ctl_led_ctl *lctl;
+	struct snd_kcontrol_volatile *vd;
+	bool change = false;
+
+	card = snd_card_ref(card_number);
+	if (!card)
+		return -ENXIO;
+
+	mutex_lock(&snd_ctl_led_mutex);
+	if (!snd_ctl_led_card_valid[card_number]) {
+		mutex_unlock(&snd_ctl_led_mutex);
+		snd_card_unref(card);
+		return -ENXIO;
+	}
+	led = &snd_ctl_leds[group];
+repeat:
+	list_for_each_entry(lctl, &led->controls, list)
+		if (lctl->card == card) {
+			vd = &lctl->kctl->vd[lctl->index_offset];
+			vd->access &= ~group_to_access(group);
+			snd_ctl_led_ctl_destroy(lctl);
+			change = true;
+			goto repeat;
+		}
+	mutex_unlock(&snd_ctl_led_mutex);
+	if (change)
+		snd_ctl_led_set_state(NULL, group_to_access(group), NULL, 0);
+	snd_card_unref(card);
+	return 0;
+}
+
 static void snd_ctl_led_register(struct snd_card *card)
 {
 	struct snd_kcontrol *kctl;
@@ -264,10 +354,12 @@ static void snd_ctl_led_register(struct snd_card *card)
 		for (ioff = 0; ioff < kctl->count; ioff++)
 			snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, ioff);
 	snd_ctl_led_refresh();
+	snd_ctl_led_sysfs_add(card);
 }
 
 static void snd_ctl_led_disconnect(struct snd_card *card)
 {
+	snd_ctl_led_sysfs_remove(card);
 	mutex_lock(&snd_ctl_led_mutex);
 	snd_ctl_led_card_valid[card->number] = false;
 	snd_ctl_led_clean(card);
@@ -349,8 +441,264 @@ static const struct attribute_group *snd_ctl_led_dev_attr_groups[] = {
 	NULL,
 };
 
+static char *find_eos(char *s)
+{
+	while (*s && *s != ',')
+		s++;
+	if (*s)
+		s++;
+	return s;
+}
+
+static char *parse_uint(char *s, unsigned int *val)
+{
+	unsigned long long res;
+	if (kstrtoull(s, 10, &res))
+		res = 0;
+	*val = res;
+	return find_eos(s);
+}
+
+static char *parse_string(char *s, char *val, size_t val_size)
+{
+	if (*s == '"' || *s == '\'') {
+		char c = *s;
+		s++;
+		while (*s && *s != c) {
+			if (val_size > 1) {
+				*val++ = *s;
+				val_size--;
+			}
+			s++;
+		}
+	} else {
+		while (*s && *s != ',') {
+			if (val_size > 1) {
+				*val++ = *s;
+				val_size--;
+			}
+			s++;
+		}
+	}
+	*val = '\0';
+	if (*s)
+		s++;
+	return s;
+}
+
+static char *parse_iface(char *s, unsigned int *val)
+{
+	if (!strncasecmp(s, "card", 4))
+		*val = SNDRV_CTL_ELEM_IFACE_CARD;
+	else if (!strncasecmp(s, "mixer", 5))
+		*val = SNDRV_CTL_ELEM_IFACE_MIXER;
+	return find_eos(s);
+}
+
+/*
+ * These types of input strings are accepted:
+ *
+ *   unsigned integer - numid (equivaled to numid=UINT)
+ *   string - basic mixer name (equivalent to iface=MIXER,name=STR)
+ *   numid=UINT
+ *   [iface=MIXER,][device=UINT,][subdevice=UINT,]name=STR[,index=UINT]
+ */
+static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, size_t count,
+			  bool attach)
+{
+	char buf2[256], *s;
+	size_t len = max(sizeof(s) - 1, count);
+	struct snd_ctl_elem_id id;
+	int err;
+
+	strncpy(buf2, buf, len);
+	buf2[len] = '\0';
+	memset(&id, 0, sizeof(id));
+	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	s = buf2;
+	while (*s) {
+		if (!strncasecmp(s, "numid=", 6)) {
+			s = parse_uint(s + 6, &id.numid);
+		} else if (!strncasecmp(s, "iface=", 6)) {
+			s = parse_iface(s + 6, &id.iface);
+		} else if (!strncasecmp(s, "device=", 7)) {
+			s = parse_uint(s + 7, &id.device);
+		} else if (!strncasecmp(s, "subdevice=", 10)) {
+			s = parse_uint(s + 10, &id.subdevice);
+		} else if (!strncasecmp(s, "name=", 5)) {
+			s = parse_string(s + 5, id.name, sizeof(id.name));
+		} else if (!strncasecmp(s, "index=", 6)) {
+			s = parse_uint(s + 6, &id.index);
+		} else if (s == buf2) {
+			while (*s) {
+				if (*s < '0' || *s > '9')
+					break;
+				s++;
+			}
+			if (*s == '\0')
+				parse_uint(buf2, &id.numid);
+			else {
+				for (; *s >= ' '; s++);
+				*s = '\0';
+				strlcpy(id.name, buf2, sizeof(id.name));
+			}
+			break;
+		}
+		if (*s == ',')
+			s++;
+	}
+
+	err = snd_ctl_led_set_id(led_card->number, &id, led_card->led->group, attach);
+	if (err < 0)
+		return err;
+
+	return count;
+}
+
+static ssize_t parse_attach(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
+	return set_led_id(led_card, buf, count, true);
+}
+
+static ssize_t parse_detach(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
+	return set_led_id(led_card, buf, count, false);
+}
+
+static ssize_t ctl_reset(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
+	int err;
+
+	if (count > 0 && buf[0] == '1') {
+		err = snd_ctl_led_reset(led_card->number, led_card->led->group);
+		if (err < 0)
+			return err;
+	}
+	return count;
+}
+
+static ssize_t ctl_list(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
+	struct snd_card *card;
+	struct snd_ctl_led_ctl *lctl;
+	char *buf2 = buf;
+	size_t l;
+
+	card = snd_card_ref(led_card->number);
+	if (!card)
+		return -ENXIO;
+	down_read(&card->controls_rwsem);
+	mutex_lock(&snd_ctl_led_mutex);
+	if (snd_ctl_led_card_valid[led_card->number]) {
+		list_for_each_entry(lctl, &led_card->led->controls, list)
+			if (lctl->card == card) {
+				if (buf2 - buf > PAGE_SIZE - 16)
+					break;
+				if (buf2 != buf)
+					*buf2++ = ' ';
+				l = scnprintf(buf2, 15, "%u",
+						lctl->kctl->id.numid +
+							lctl->index_offset);
+				buf2[l] = '\0';
+				buf2 += l + 1;
+			}
+	}
+	mutex_unlock(&snd_ctl_led_mutex);
+	up_read(&card->controls_rwsem);
+	snd_card_unref(card);
+	return buf2 - buf;
+}
+
+static DEVICE_ATTR(attach, 0200, NULL, parse_attach);
+static DEVICE_ATTR(detach, 0200, NULL, parse_detach);
+static DEVICE_ATTR(reset, 0200, NULL, ctl_reset);
+static DEVICE_ATTR(list, 0444, ctl_list, NULL);
+
+static struct attribute *snd_ctl_led_card_attrs[] = {
+	&dev_attr_attach.attr,
+	&dev_attr_detach.attr,
+	&dev_attr_reset.attr,
+	&dev_attr_list.attr,
+	NULL,
+};
+
+static const struct attribute_group snd_ctl_led_card_attr_group = {
+	.attrs = snd_ctl_led_card_attrs,
+};
+
+static const struct attribute_group *snd_ctl_led_card_attr_groups[] = {
+	&snd_ctl_led_card_attr_group,
+	NULL,
+};
+
 static struct device snd_ctl_led_dev;
 
+static void snd_ctl_led_sysfs_add(struct snd_card *card)
+{
+	unsigned int group;
+	struct snd_ctl_led_card *led_card;
+	struct snd_ctl_led *led;
+	char link_name[32];
+
+	for (group = 0; group < MAX_LED; group++) {
+		led = &snd_ctl_leds[group];
+		led_card = kzalloc(sizeof(*led_card), GFP_KERNEL);
+		if (!led_card)
+			goto cerr2;
+		led_card->number = card->number;
+		led_card->led = led;
+		device_initialize(&led_card->dev);
+		if (dev_set_name(&led_card->dev, "card%d", card->number) < 0)
+			goto cerr;
+		led_card->dev.parent = &led->dev;
+		led_card->dev.groups = snd_ctl_led_card_attr_groups;
+		if (device_add(&led_card->dev))
+			goto cerr;
+		led->cards[card->number] = led_card;
+		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
+		WARN(sysfs_create_link(&card->ctl_dev.kobj, &led_card->dev.kobj, link_name),
+			"can't create symlink to controlC%i device\n", card->number);
+		WARN(sysfs_create_link(&led_card->dev.kobj, &card->card_dev.kobj, "card"),
+			"can't create symlink to card%i\n", card->number);
+
+		continue;
+cerr:
+		put_device(&led_card->dev);
+cerr2:
+		printk(KERN_ERR "snd_ctl_led: unable to add card%d", card->number);
+		kfree(led_card);
+	}
+}
+
+static void snd_ctl_led_sysfs_remove(struct snd_card *card)
+{
+	unsigned int group;
+	struct snd_ctl_led_card *led_card;
+	struct snd_ctl_led *led;
+	char link_name[32];
+
+	for (group = 0; group < MAX_LED; group++) {
+		led = &snd_ctl_leds[group];
+		led_card = led->cards[card->number];
+		if (!led_card)
+			continue;
+		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
+		sysfs_remove_link(&card->ctl_dev.kobj, link_name);
+		sysfs_remove_link(&led_card->dev.kobj, "card");
+		device_del(&led_card->dev);
+		kfree(led_card);
+		led->cards[card->number] = NULL;
+	}
+}
+
 /*
  * Control layer registration
  */
@@ -397,14 +745,24 @@ static int __init snd_ctl_led_init(void)
 static void __exit snd_ctl_led_exit(void)
 {
 	struct snd_ctl_led *led;
-	unsigned int group;
+	struct snd_card *card;
+	unsigned int group, card_number;
 
+	snd_ctl_disconnect_layer(&snd_ctl_led_lops);
+	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
+		if (!snd_ctl_led_card_valid[card_number])
+			continue;
+		card = snd_card_ref(card_number);
+		if (card) {
+			snd_ctl_led_sysfs_remove(card);
+			snd_card_unref(card);
+		}
+	}
 	for (group = 0; group < MAX_LED; group++) {
 		led = &snd_ctl_leds[group];
 		device_del(&led->dev);
 	}
 	device_del(&snd_ctl_led_dev);
-	snd_ctl_disconnect_layer(&snd_ctl_led_lops);
 	snd_ctl_led_clean(NULL);
 }
 
-- 
2.29.2
