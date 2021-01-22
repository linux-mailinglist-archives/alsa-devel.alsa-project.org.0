Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9BB2FFE14
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 09:23:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0361ABC;
	Fri, 22 Jan 2021 09:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0361ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611303825;
	bh=0gJZMBYmLl8gdgmeJhMlXGYc2bX68GAC468ah8mjKS0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocGJldxNG+KIFApvzXS+1ao9WhpASIDtZKoRghN9/NIRMXo8i+3O07GZg2RWkOrwt
	 tmTLNawgGtHXjkr16+Y2d5DKXQnUZPI3sk5ItfX9jQpbMFXROOH3dBEaUixwtoXMfA
	 ONR1Pr0FrepgWSzuRnSweTk8QtfxcnU37lixhtrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D4CF80253;
	Fri, 22 Jan 2021 09:22:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AAE7F80227; Fri, 22 Jan 2021 09:22:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAF9EF80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 09:22:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAF9EF80164
Received: from [123.112.70.0] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l2rhy-0005bR-Fr; Fri, 22 Jan 2021 08:22:26 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 kai.vehmanen@linux.intel.com
Subject: [RFC][PATCH v5 1/2] alsa: jack: implement software jack injection via
 debugfs
Date: Fri, 22 Jan 2021 16:21:43 +0800
Message-Id: <20210122082144.16186-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122082144.16186-1-hui.wang@canonical.com>
References: <20210122082144.16186-1-hui.wang@canonical.com>
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

This change adds audio jack injection feature through debugfs, with
this feature, we could validate alsa userspace changes by injecting
plugin or plugout events to the non-phantom audio jacks.

With this change, the sound core will build the folders
$debugfs_mount_dir/sound/cardN if DEBUG_FS is enabled. And if users
also enable the SND_JACK_INJECTION_DEBUG, the jack injection nodes
will be built in the folder cardN like below:

$tree $debugfs_mount_dir/sound
$debugfs_mount_dir/sound
├── card0
│   ├── HDMI_DP_pcm_10_Jack
│   │   ├── jackin_inject
│   │   ├── kctl_id
│   │   ├── mask_bits
│   │   ├── status
│   │   ├── sw_inject_enable
│   │   └── type
...
│   └── HDMI_DP_pcm_9_Jack
│       ├── jackin_inject
│       ├── kctl_id
│       ├── mask_bits
│       ├── status
│       ├── sw_inject_enable
│       └── type
└── card1
    ├── HDMI_DP_pcm_5_Jack
    │   ├── jackin_inject
    │   ├── kctl_id
    │   ├── mask_bits
    │   ├── status
    │   ├── sw_inject_enable
    │   └── type
    ...
    ├── Headphone_Jack
    │   ├── jackin_inject
    │   ├── kctl_id
    │   ├── mask_bits
    │   ├── status
    │   ├── sw_inject_enable
    │   └── type
    └── Headset_Mic_Jack
        ├── jackin_inject
        ├── kctl_id
        ├── mask_bits
        ├── status
        ├── sw_inject_enable
        └── type

The nodes kctl_id, mask_bits, status and type are read-only, users
could check jack or jack_kctl's information through them.

The nodes sw_inject_enable and jackin_inject are directly used for
injection. The sw_inject_enable is read-write, users could check if
software injection is enabled or not on this jack, and users could
echo 1 or 0 to enable or disable software injection on this jack. Once
the injection is enabled, the jack will not change by hardware events
anymore, once the injection is disabled, the jack will restore the
last reported hardware events to the jack. The jackin_inject is
write-only, if the injection is enabled, users could echo 1 or 0 to
this node to inject plugin or plugout events to this jack.

For the detailed usage information on these nodes, please refer to
Documentation/sound/designs/jack-injection.rst.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 include/sound/core.h |   2 +
 include/sound/jack.h |   1 +
 sound/core/Kconfig   |   9 ++
 sound/core/init.c    |  10 ++
 sound/core/jack.c    | 298 ++++++++++++++++++++++++++++++++++++++++++-
 sound/core/sound.c   |   8 ++
 6 files changed, 324 insertions(+), 4 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 0462c577d7a3..15175fd44971 100644
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
+extern struct dentry *sound_debugfs_root;
 
 void snd_request_card(int card);
 
diff --git a/include/sound/jack.h b/include/sound/jack.h
index 9eb2b5ec1ec4..1181f536557e 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -67,6 +67,7 @@ struct snd_jack {
 	char name[100];
 	unsigned int key[6];   /* Keep in sync with definitions above */
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
+	int hw_status_cache;
 	void *private_data;
 	void (*private_free)(struct snd_jack *);
 };
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index d4554f376160..a9189f58dc56 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -38,6 +38,15 @@ config SND_JACK_INPUT_DEV
 	depends on SND_JACK
 	default y if INPUT=y || INPUT=SND
 
+config SND_JACK_INJECTION_DEBUG
+	bool "Sound jack injection interface via debugfs"
+	depends on SND_JACK && DEBUG_FS
+	help
+	  This option can be used to enable or disable sound jack
+	  software injection.
+	  Say Y if you are debugging via jack injection interface.
+	  If unsure select "N".
+
 config SND_OSSEMUL
 	bool "Enable OSS Emulation"
 	select SOUND_OSS_CORE
diff --git a/sound/core/init.c b/sound/core/init.c
index 75aec71c48a8..e7f7cfe1143b 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -13,6 +13,7 @@
 #include <linux/time.h>
 #include <linux/ctype.h>
 #include <linux/pm.h>
+#include <linux/debugfs.h>
 #include <linux/completion.h>
 
 #include <sound/core.h>
@@ -161,6 +162,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 {
 	struct snd_card *card;
 	int err;
+	char name[8];
 
 	if (snd_BUG_ON(!card_ret))
 		return -EINVAL;
@@ -244,6 +246,10 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 		dev_err(parent, "unable to create card info\n");
 		goto __error_ctl;
 	}
+
+	sprintf(name, "card%d", idx);
+	card->debugfs_root = debugfs_create_dir(name, sound_debugfs_root);
+
 	*card_ret = card;
 	return 0;
 
@@ -526,6 +532,10 @@ int snd_card_free(struct snd_card *card)
 		return ret;
 	/* wait, until all devices are ready for the free operation */
 	wait_for_completion(&released);
+
+	debugfs_remove(card->debugfs_root);
+	card->debugfs_root = NULL;
+
 	return 0;
 }
 EXPORT_SYMBOL(snd_card_free);
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 503c8af79d55..ae4208210d78 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -8,6 +8,9 @@
 #include <linux/input.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/ctype.h>
+#include <linux/mm.h>
+#include <linux/debugfs.h>
 #include <sound/jack.h>
 #include <sound/core.h>
 #include <sound/control.h>
@@ -16,6 +19,9 @@ struct snd_jack_kctl {
 	struct snd_kcontrol *kctl;
 	struct list_head list;  /* list of controls belong to the same jack */
 	unsigned int mask_bits; /* only masked status bits are reported via kctl */
+	struct snd_jack *jack;  /* pointer to struct snd_jack */
+	bool sw_inject_enable;  /* allow to inject plug event via debugfs */
+	struct dentry *jack_debugfs_root; /* jack_kctl debugfs root */
 };
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
@@ -109,12 +115,286 @@ static int snd_jack_dev_register(struct snd_device *device)
 }
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
+#ifdef CONFIG_SND_JACK_INJECTION_DEBUG
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
+	int len, ret;
+	char buf[128];
+
+	len = scnprintf(buf, 128, "%s: %s\t\t%s: %i\n", "Jack", jack_kctl->kctl->id.name,
+			"Inject Enabled", jack_kctl->sw_inject_enable);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	return ret;
+}
+
+static ssize_t sw_inject_enable_write(struct file *file,
+				      const char __user *from, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	int ret, err;
+	unsigned long enable;
+	char buf[8] = { 0 };
+
+	if (count >= 8)
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, count, ppos, from, count);
+	err = kstrtoul(buf, 0, &enable);
+	if (err)
+		return err;
+
+	if (jack_kctl->sw_inject_enable == (!!enable))
+		return ret;
+
+	jack_kctl->sw_inject_enable = !!enable;
+
+	if (!jack_kctl->sw_inject_enable)
+		snd_jack_report(jack_kctl->jack, jack_kctl->jack->hw_status_cache);
+
+	return ret;
+}
+
+static ssize_t jackin_inject_write(struct file *file,
+				   const char __user *from, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	int ret, err;
+	unsigned long enable;
+	char buf[8] = { 0 };
+
+	if (!jack_kctl->sw_inject_enable)
+		return -EINVAL;
+
+	if (count >= 8)
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, count, ppos, from, count);
+	err = kstrtoul(buf, 0, &enable);
+	if (err)
+		return err;
+
+	snd_jack_inject_report(jack_kctl, !!enable ? jack_kctl->mask_bits : 0);
+
+	return ret;
+}
+
+static ssize_t jack_kctl_id_read(struct file *file,
+				 char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char buf[64];
+	int len, ret;
+
+	len = scnprintf(buf, 64, "%s\n", jack_kctl->kctl->id.name);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	return ret;
+}
+
+/* the bit definition is aligned with snd_jack_types in jack.h */
+static const char * const jack_events_name[] = {
+	"HEADPHONE(0x0001)", "MICROPHONE(0x0002)", "LINEOUT(0x0004)",
+	"MECHANICAL(0x0008)", "VIDEOOUT(0x0010)", "LINEIN(0x0020)",
+	"", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)", "BTN_3(0x0800)",
+	"BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)", "",
+};
+
+static int parse_mask_bits(unsigned int mask_bits, char *s)
+{
+	char buf[256];
+	int len, i;
+
+	len = scnprintf(buf, 256, "0x%04x", mask_bits);
+
+	for (i = 0; i < 16; i++)
+		if (mask_bits & (1 << i))
+			len += scnprintf(buf + strlen(buf), 256 - strlen(buf),
+					 " %s", jack_events_name[i]);
+
+	len += scnprintf(buf + strlen(buf), 256 - strlen(buf), "\n");
+
+	strcpy(s, buf);
+
+	return len;
+}
+
+static ssize_t jack_kctl_mask_bits_read(struct file *file,
+					char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char buf[256];
+	int len, ret;
+
+	len = parse_mask_bits(jack_kctl->mask_bits, buf);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	return ret;
+}
+
+static ssize_t jack_kctl_status_read(struct file *file,
+				     char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char buf[16];
+	int len, ret;
+
+	len = scnprintf(buf, 16, "%s\n", jack_kctl->kctl->private_value ?
+			"Plugged" : "Unplugged");
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	return ret;
+}
+
+#ifdef CONFIG_SND_JACK_INPUT_DEV
+static ssize_t jack_type_read(struct file *file,
+			      char __user *to, size_t count, loff_t *ppos)
+{
+	struct snd_jack_kctl *jack_kctl = file->private_data;
+	char buf[256];
+	int len, ret;
+
+	len = parse_mask_bits(jack_kctl->jack->type, buf);
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+
+	return ret;
+}
+
+static const struct file_operations jack_type_fops = {
+	.open = simple_open,
+	.read = jack_type_read,
+	.llseek = default_llseek,
+};
+#endif
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
+static const struct file_operations jack_kctl_id_fops = {
+	.open = simple_open,
+	.read = jack_kctl_id_read,
+	.llseek = default_llseek,
+};
+
+static const struct file_operations jack_kctl_mask_bits_fops = {
+	.open = simple_open,
+	.read = jack_kctl_mask_bits_read,
+	.llseek = default_llseek,
+};
+
+static const struct file_operations jack_kctl_status_fops = {
+	.open = simple_open,
+	.read = jack_kctl_status_read,
+	.llseek = default_llseek,
+};
+
+static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
+					    struct snd_jack_kctl *jack_kctl)
+{
+	char *tname;
+	int i;
+
+	tname = kstrdup(jack_kctl->kctl->id.name, GFP_KERNEL);
+	if (!tname)
+		return -ENOMEM;
+
+	/* replace the chars which are not suitable for folder's name with _ */
+	for (i = 0; i < strlen(tname); i++)
+		if (!isalnum(tname[i]))
+			tname[i] = '_';
+
+	jack_kctl->jack_debugfs_root = debugfs_create_dir(tname, jack->card->debugfs_root);
+	kfree(tname);
+
+	debugfs_create_file("sw_inject_enable", 0644, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &sw_inject_enable_fops);
+
+	debugfs_create_file("jackin_inject", 0200, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jackin_inject_fops);
+
+	debugfs_create_file("kctl_id", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_kctl_id_fops);
+
+	debugfs_create_file("mask_bits", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_kctl_mask_bits_fops);
+
+	debugfs_create_file("status", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_kctl_status_fops);
+
+#ifdef CONFIG_SND_JACK_INPUT_DEV
+	debugfs_create_file("type", 0444, jack_kctl->jack_debugfs_root, jack_kctl,
+			    &jack_type_fops);
+#endif
+	return 0;
+}
+#else /* CONFIG_SND_JACK_INJECTION_DEBUG */
+static int snd_jack_debugfs_add_inject_node(struct snd_jack *jack,
+					    struct snd_jack_kctl *jack_kctl)
+{
+	return 0;
+}
+#endif /* CONFIG_SND_JACK_INJECTION_DEBUG */
+
 static void snd_jack_kctl_private_free(struct snd_kcontrol *kctl)
 {
 	struct snd_jack_kctl *jack_kctl;
 
 	jack_kctl = kctl->private_data;
 	if (jack_kctl) {
+		debugfs_remove(jack_kctl->jack_debugfs_root);
+		jack_kctl->jack_debugfs_root = NULL;
 		list_del(&jack_kctl->list);
 		kfree(jack_kctl);
 	}
@@ -122,7 +402,10 @@ static void snd_jack_kctl_private_free(struct snd_kcontrol *kctl)
 
 static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_kctl *jack_kctl)
 {
+	jack_kctl->jack = jack;
 	list_add_tail(&jack_kctl->list, &jack->kctl_list);
+	if (!strstr(jack_kctl->kctl->id.name, "Phantom"))
+		snd_jack_debugfs_add_inject_node(jack, jack_kctl);
 }
 
 static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, const char *name, unsigned int mask)
@@ -340,6 +623,7 @@ EXPORT_SYMBOL(snd_jack_set_key);
 void snd_jack_report(struct snd_jack *jack, int status)
 {
 	struct snd_jack_kctl *jack_kctl;
+	unsigned int mask_bits = 0;
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	int i;
 #endif
@@ -347,16 +631,21 @@ void snd_jack_report(struct snd_jack *jack, int status)
 	if (!jack)
 		return;
 
+	jack->hw_status_cache = status;
+
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
@@ -364,7 +653,8 @@ void snd_jack_report(struct snd_jack *jack, int status)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(jack_switch_types); i++) {
-		int testbit = 1 << i;
+		int testbit = ((1 << i) & ~mask_bits);
+
 		if (jack->type & testbit)
 			input_report_switch(jack->input_dev,
 					    jack_switch_types[i],
diff --git a/sound/core/sound.c b/sound/core/sound.c
index b75f78f2c4b8..8a80f0440455 100644
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
 
+struct dentry *sound_debugfs_root;
+EXPORT_SYMBOL_GPL(sound_debugfs_root);
+
 static struct snd_minor *snd_minors[SNDRV_OS_MINORS];
 static DEFINE_MUTEX(sound_mutex);
 
@@ -395,6 +399,9 @@ static int __init alsa_sound_init(void)
 		unregister_chrdev(major, "alsa");
 		return -ENOMEM;
 	}
+
+	sound_debugfs_root = debugfs_create_dir("sound", NULL);
+
 #ifndef MODULE
 	pr_info("Advanced Linux Sound Architecture Driver Initialized.\n");
 #endif
@@ -403,6 +410,7 @@ static int __init alsa_sound_init(void)
 
 static void __exit alsa_sound_exit(void)
 {
+	debugfs_remove(sound_debugfs_root);
 	snd_info_done();
 	unregister_chrdev(major, "alsa");
 }
-- 
2.25.1

