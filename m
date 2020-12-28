Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C624E2E34E1
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 09:02:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE4C1707;
	Mon, 28 Dec 2020 09:01:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE4C1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609142529;
	bh=yC8uRdX64+jiwBcM47lNTFlEVTT/847Rak0fp3O9eis=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cp/lygPuS51TXJIR4CEXTf3NsypjFU3exIdKE+U329n/75Q4lsQ2eDjkboqPrAD8a
	 qo/1S1+wGLnmOgRnm+OY2PsWZdI91VTjghVC1SglZMhBDgxCxQsQk7JglubO+wQtB7
	 DMxXEPuVhQmOmPN606VSOIOL+De1E8Vx/50NeZdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A477F80249;
	Mon, 28 Dec 2020 09:00:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6B3CF801F5; Mon, 28 Dec 2020 09:00:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5290FF80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 09:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5290FF80143
Received: from [223.72.45.82] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1ktnRv-0004UZ-E3; Mon, 28 Dec 2020 08:00:16 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 kai.vehmanen@linux.intel.com
Subject: [RFC][PATCH v3 1/4] alsa: jack: implement software jack injection via
 debugfs
Date: Mon, 28 Dec 2020 16:00:00 +0800
Message-Id: <20201228080003.19127-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201228080003.19127-1-hui.wang@canonical.com>
References: <20201228080003.19127-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

We want to perform remote audio auto test, need the audio jack to
change from plugout to plugin or vice versa by software ways.

Here the design is creating a sound-core root folder in the debugfs
dir, and each sound card will create a folder cardN under sound-core,
then the sound jack will create folders by jack_ctrl->ctrl->id.name,
and will create 2 file nodes jackin_inject and sw_inject_enable in
the folder, this is the layout of folder on a machine with 2 sound
cards:
$tree $debugfs_mount_dir/sound-core
sound-core/
├── card0
│   ├── HDMI!DP,pcm=10 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=11 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=3 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=7 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   ├── HDMI!DP,pcm=8 Jack
│   │   ├── jackin_inject
│   │   └── sw_inject_enable
│   └── HDMI!DP,pcm=9 Jack
│       ├── jackin_inject
│       └── sw_inject_enable
└── card1
    ├── HDMI!DP,pcm=3 Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── HDMI!DP,pcm=4 Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── HDMI!DP,pcm=5 Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── Headphone Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    ├── Headset Jack
    │   ├── jackin_inject
    │   └── sw_inject_enable
    └── Mic Jack
        ├── jackin_inject
        └── sw_inject_enable

Suppose users want to enable jack injection for Headphone, they need
to run $sudo sh -c 'echo 1 > 'Headphone Jack'/sw_inject_enable', then
users could change the Headphone Jack state through jackin_inject and
this Jack's state will not be changed by non-injection ways anymore
until users echo 0 to sw_inject_enable.

Users could run $sudo sh -c 'echo 1 > 'Headphone Jack'/jackin_inject'
to trigger the Headphone jack to plugin or echo 0 to trigger it to
plugout.

If users finish their test, they could run
$sudo sh -c 'echo 0 > 'Headphone Jack'/sw_inject_enable' to disable
injection and let non-injection ways control this Jack.

For the jack event report, the hw jack event will call
snd_jack_report(), it will avoid to report the events if a jack_kctl's
sw_inject is enabled, also the related input_dev's events will not be
reproted.

If users inject a event, it will call snd_jack_inject_report(), it
only reports the events for this jack_kctl and reports the related
input_dev's events.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 include/sound/core.h |   2 +
 sound/core/init.c    |   7 ++
 sound/core/jack.c    | 181 ++++++++++++++++++++++++++++++++++++++++++-
 sound/core/sound.c   |   8 ++
 4 files changed, 194 insertions(+), 4 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 0462c577d7a3..11d61e4248ee 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -122,6 +122,7 @@ struct snd_card {
 
 	size_t total_pcm_alloc_bytes;	/* total amount of allocated buffers */
 	struct mutex memory_mutex;	/* protection for the above */
+	struct dentry *debugfs_root;    /* debugfs root for card */
 
 #ifdef CONFIG_PM
 	unsigned int power_state;	/* power state */
@@ -180,6 +181,7 @@ static inline struct device *snd_card_get_device_link(struct snd_card *card)
 extern int snd_major;
 extern int snd_ecards_limit;
 extern struct class *sound_class;
+extern struct dentry *sound_core_debugfs_root;
 
 void snd_request_card(int card);
 
diff --git a/sound/core/init.c b/sound/core/init.c
index 764dbe673d48..a9ceaf788019 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -13,6 +13,7 @@
 #include <linux/time.h>
 #include <linux/ctype.h>
 #include <linux/pm.h>
+#include <linux/debugfs.h>
 #include <linux/completion.h>
 
 #include <sound/core.h>
@@ -163,6 +164,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 {
 	struct snd_card *card;
 	int err;
+	char name[8];
 
 	if (snd_BUG_ON(!card_ret))
 		return -EINVAL;
@@ -246,6 +248,10 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 		dev_err(parent, "unable to create card info\n");
 		goto __error_ctl;
 	}
+
+	sprintf(name, "card%d", idx);
+	card->debugfs_root = debugfs_create_dir(name, sound_core_debugfs_root);
+
 	*card_ret = card;
 	return 0;
 
@@ -418,6 +424,7 @@ int snd_card_disconnect(struct snd_card *card)
 	/* notify all devices that we are disconnected */
 	snd_device_disconnect_all(card);
 
+	debugfs_remove(card->debugfs_root);
 	snd_info_card_disconnect(card);
 	if (card->registered) {
 		device_del(&card->card_dev);
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 503c8af79d55..0f232a806c3a 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -8,6 +8,8 @@
 #include <linux/input.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/ctype.h>
+#include <linux/debugfs.h>
 #include <sound/jack.h>
 #include <sound/core.h>
 #include <sound/control.h>
@@ -16,6 +18,9 @@ struct snd_jack_kctl {
 	struct snd_kcontrol *kctl;
 	struct list_head list;  /* list of controls belong to the same jack */
 	unsigned int mask_bits; /* only masked status bits are reported via kctl */
+	struct snd_jack *jack;  /* pointer to struct snd_jack */
+	bool sw_inject_enable;  /* allow to inject plug event via debugfs */
+	struct dentry *jack_debugfs_root; /* jack_kctl debugfs root */
 };
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
@@ -109,12 +114,172 @@ static int snd_jack_dev_register(struct snd_device *device)
 }
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
+#ifdef CONFIG_DEBUG_FS
+static void snd_jack_inject_report(struct snd_jack_kctl *jack_kctl, int status)
+{
+	struct snd_jack *jack;
+#ifdef CONFIG_SND_JACK_INPUT_DEV
+	int i;
+#endif
+	if (!jack_kctl)
+		return;
+
+	jack = jack_kctl->jack;
+
+	if (jack_kctl->sw_inject_enable)
+		snd_kctl_jack_report(jack->card, jack_kctl->kctl,
+				     status & jack_kctl->mask_bits);
+
+#ifdef CONFIG_SND_JACK_INPUT_DEV
+	if (!jack->input_dev)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(jack->key); i++) {
+		int testbit = ((SND_JACK_BTN_0 >> i) & jack_kctl->mask_bits);
+
+		if (jack->type & testbit)
+			input_report_key(jack->input_dev, jack->key[i],
+					 status & testbit);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(jack_switch_types); i++) {
+		int testbit = ((1 << i) & jack_kctl->mask_bits);
+
+		if (jack->type & testbit)
+			input_report_switch(jack->input_dev,
+					    jack_switch_types[i],
+					    status & testbit);
+	}
+
+	input_sync(jack->input_dev);
+#endif /* CONFIG_SND_JACK_INPUT_DEV */
+}
+
+static ssize_t sw_inject_enable_read(struct file *file,
+				     char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char *buf;
+	int len, ret;
+
+	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = scnprintf(buf, PAGE_SIZE, "%s: %s\t\t%s: %i\n", "Jack", jack_kctl->kctl->id.name,
+			"Inject Enabled", jack_kctl->sw_inject_enable);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	kfree(buf);
+	return ret;
+}
+
+static ssize_t sw_inject_enable_write(struct file *file,
+				      const char __user *from, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char *buf;
+	int ret, err;
+	unsigned long enable;
+
+	buf = kzalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(buf, count, ppos, from, count);
+	err = kstrtoul(buf, 0, &enable);
+	if (err) {
+		ret = err;
+		goto exit;
+	}
+
+	jack_kctl->sw_inject_enable = !!enable;
+
+ exit:
+	kfree(buf);
+	return ret;
+}
+
+static ssize_t jackin_inject_write(struct file *file,
+				   const char __user *from, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char *buf;
+	int ret, err;
+	unsigned long enable;
+
+	if (!jack_kctl->sw_inject_enable)
+		return -EINVAL;
+
+	buf = kzalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(buf, count, ppos, from, count);
+	err = kstrtoul(buf, 0, &enable);
+	if (err) {
+		ret = err;
+		goto exit;
+	}
+
+	snd_jack_inject_report(jack_kctl, !!enable ? jack_kctl->mask_bits : 0);
+
+ exit:
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations sw_inject_enable_fops = {
+	.open = simple_open,
+	.read = sw_inject_enable_read,
+	.write = sw_inject_enable_write,
+	.llseek = default_llseek,
+};
+
+static const struct file_operations jackin_inject_fops = {
+	.open = simple_open,
+	.write = jackin_inject_write,
+	.llseek = default_llseek,
+};
+
+static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
+					    struct snd_jack_kctl *jack_kctl)
+{
+	char *tname;
+
+	/* the folder's name can't contains '/', need to replace it with '!'
+	 * as lib/kobject.c does
+	 */
+	tname = kstrdup(jack_kctl->kctl->id.name, GFP_KERNEL);
+	if (!tname)
+		return -ENOMEM;
+	strreplace(tname, '/', '!');
+	jack_kctl->jack_debugfs_root = debugfs_create_dir(tname, jack->card->debugfs_root);
+	kfree(tname);
+
+	debugfs_create_file("sw_inject_enable", 0644, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &sw_inject_enable_fops);
+
+	debugfs_create_file("jackin_inject", 0200, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jackin_inject_fops);
+
+	return 0;
+}
+#else /* CONFIG_DEBUG_FS */
+static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
+					    struct snd_jack_kctl *jack_kctl)
+{
+	return 0;
+}
+#endif /* CONFIG_DEBUG_FS */
+
 static void snd_jack_kctl_private_free(struct snd_kcontrol *kctl)
 {
 	struct snd_jack_kctl *jack_kctl;
 
 	jack_kctl = kctl->private_data;
 	if (jack_kctl) {
+		debugfs_remove(jack_kctl->jack_debugfs_root);
 		list_del(&jack_kctl->list);
 		kfree(jack_kctl);
 	}
@@ -122,7 +287,10 @@ static void snd_jack_kctl_private_free(struct snd_kcontrol *kctl)
 
 static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_kctl *jack_kctl)
 {
+	jack_kctl->jack = jack;
 	list_add_tail(&jack_kctl->list, &jack->kctl_list);
+	if (!strstr(jack_kctl->kctl->id.name, "Phantom"))
+		snd_jack_debugfs_add_inject_node(jack, jack_kctl);
 }
 
 static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, const char *name, unsigned int mask)
@@ -340,6 +508,7 @@ EXPORT_SYMBOL(snd_jack_set_key);
 void snd_jack_report(struct snd_jack *jack, int status)
 {
 	struct snd_jack_kctl *jack_kctl;
+	unsigned int mask_bits = 0;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	int i;
 #endif
@@ -348,15 +517,18 @@ void snd_jack_report(struct snd_jack *jack, int status)
 		return;
 
 	list_for_each_entry(jack_kctl, &jack->kctl_list, list)
-		snd_kctl_jack_report(jack->card, jack_kctl->kctl,
-					    status & jack_kctl->mask_bits);
+		if (jack_kctl->sw_inject_enable)
+			mask_bits |= jack_kctl->mask_bits;
+		else
+			snd_kctl_jack_report(jack->card, jack_kctl->kctl,
+					     status & jack_kctl->mask_bits);
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	if (!jack->input_dev)
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(jack->key); i++) {
-		int testbit = SND_JACK_BTN_0 >> i;
+		int testbit = ((SND_JACK_BTN_0 >> i) & ~mask_bits);
 
 		if (jack->type & testbit)
 			input_report_key(jack->input_dev, jack->key[i],
@@ -364,7 +536,8 @@ void snd_jack_report(struct snd_jack *jack, int status)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(jack_switch_types); i++) {
-		int testbit = 1 << i;
+		int testbit = ((1 << i) & ~mask_bits);
+
 		if (jack->type & testbit)
 			input_report_switch(jack->input_dev,
 					    jack_switch_types[i],
diff --git a/sound/core/sound.c b/sound/core/sound.c
index b75f78f2c4b8..3039e317df93 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -9,6 +9,7 @@
 #include <linux/time.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/debugfs.h>
 #include <sound/core.h>
 #include <sound/minors.h>
 #include <sound/info.h>
@@ -39,6 +40,9 @@ MODULE_ALIAS_CHARDEV_MAJOR(CONFIG_SND_MAJOR);
 int snd_ecards_limit;
 EXPORT_SYMBOL(snd_ecards_limit);
 
+struct dentry *sound_core_debugfs_root;
+EXPORT_SYMBOL_GPL(sound_core_debugfs_root);
+
 static struct snd_minor *snd_minors[SNDRV_OS_MINORS];
 static DEFINE_MUTEX(sound_mutex);
 
@@ -395,6 +399,9 @@ static int __init alsa_sound_init(void)
 		unregister_chrdev(major, "alsa");
 		return -ENOMEM;
 	}
+
+	sound_core_debugfs_root = debugfs_create_dir("sound-core", NULL);
+
 #ifndef MODULE
 	pr_info("Advanced Linux Sound Architecture Driver Initialized.\n");
 #endif
@@ -403,6 +410,7 @@ static int __init alsa_sound_init(void)
 
 static void __exit alsa_sound_exit(void)
 {
+	debugfs_remove(sound_core_debugfs_root);
 	snd_info_done();
 	unregister_chrdev(major, "alsa");
 }
-- 
2.25.1

