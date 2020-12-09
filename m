Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01292D4255
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 13:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD61316DD;
	Wed,  9 Dec 2020 13:45:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD61316DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607517953;
	bh=lO4T1ylt2xckGiPvcpJHVHugakz6edg4G95mq6Yy3Zk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YoTh4OG6SlboNz/2ZJRcrh7omAv5SYudkzKCQPSZ9/TkzqilHvILhnMFZjsJWhZrU
	 RyhnaGy4dnd2GWiOZrSrUm5kaETp0PKIh8tkb2kLitj9ClkZ4Yu0xnZwdXYJsQZxnO
	 AfXYpaaCY2o9HvUciwaprVlZex9KKPUqu77+2xxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D8CF8026A;
	Wed,  9 Dec 2020 13:44:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B45CEF8027C; Wed,  9 Dec 2020 13:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B93AF800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 13:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B93AF800EF
Received: from [123.114.42.209] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kmyp9-0003Vb-Sw; Wed, 09 Dec 2020 12:44:04 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [RFC][PATCH 2/2] alsa: jack: adding support for software jack in or
 out injection
Date: Wed,  9 Dec 2020 20:43:44 +0800
Message-Id: <20201209124344.219158-3-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201209124344.219158-1-hui.wang@canonical.com>
References: <20201209124344.219158-1-hui.wang@canonical.com>
MIME-Version: 1.0
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

Here the design is if the sound card has at least one Jack, the kernel
will build a sysfs interface of jack injection for this sound card, it
will create 2 files: jackin_inject and sw_inject_enable

users need to cat sw_inject_enable first to check all jacks and their
injection enable status, like below (0 means disabled):
Jack: Mic  0
Jack: Headphone  0
Jack: HDMI/DP,pcm=3  0
Jack: HDMI/DP,pcm=4  0
Jack: HDMI/DP,pcm=5  0

Suppose users want to enable jack injection for Headphone, they need
to run $sudo sh -c 'echo Headphone 1 > sw_inject_enable', then users
could change the Headphone Jack state through jackin_inject and this
Jack's state will not changed by non-injection ways anymore.

Users could run $sudo sh -c 'echo Headphone 1 > jackin_inject' to
trigger the Headphone jack to plugin or echo Headphone 0 to trigger
it to plugout.

If users finish their test, they could run
$sudo sh -c 'echo Headphone 0 > sw_inject_enable' to disable injection
and let non-injection ways control this Jack.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 include/sound/core.h |   1 +
 include/sound/jack.h |   1 +
 sound/core/jack.c    | 126 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index 0462c577d7a3..6860bfe5bb46 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -122,6 +122,7 @@ struct snd_card {
 
 	size_t total_pcm_alloc_bytes;	/* total amount of allocated buffers */
 	struct mutex memory_mutex;	/* protection for the above */
+	bool jack_inject_attr_registered; /* jack software inject sysfs interface registered? */
 
 #ifdef CONFIG_PM
 	unsigned int power_state;	/* power state */
diff --git a/include/sound/jack.h b/include/sound/jack.h
index 17f71fe38ed5..082664f2aff2 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -67,6 +67,7 @@ struct snd_jack {
 	char name[100];
 	unsigned int key[6];   /* Keep in sync with definitions above */
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
+	bool sw_inject_enable;
 	void *private_data;
 	void (*private_free)(struct snd_jack *);
 };
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 49b9461aef51..2d8eef9dcab8 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -8,6 +8,7 @@
 #include <linux/input.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/ctype.h>
 #include <sound/jack.h>
 #include <sound/core.h>
 #include <sound/control.h>
@@ -180,6 +181,123 @@ int snd_jack_add_new_kctl(struct snd_jack *jack, const char * name, int mask)
 }
 EXPORT_SYMBOL(snd_jack_add_new_kctl);
 
+static struct snd_jack *parsing_jack_and_enable(struct snd_card *card, const char *buf,
+						size_t count, unsigned long *enable)
+{
+	struct snd_device *sdev;
+	struct snd_jack *jack = NULL;
+	bool jack_found = 0;
+	char *jackid, *ena;
+	int i, err;
+
+	/* skip the '\n\r' at the end of buf */
+	for (i = count - 2; i > 0; i--)
+		if (isspace(buf[i]))
+			break;
+	if (i == 0)
+		return NULL;
+
+	jackid = kstrndup(buf, i, GFP_KERNEL);
+	if (!jackid)
+		return NULL;
+
+	if (strstr(jackid, "Phantom"))
+		goto exit1;
+
+	ena = kstrndup(&buf[i+1], count - i - 2, GFP_KERNEL);
+	if (!ena)
+		goto exit1;
+
+	err = kstrtoul(ena, 0, enable);
+	if (err)
+		goto exit;
+
+	list_for_each_entry(sdev, &card->devices, list)
+		if (sdev->type == SNDRV_DEV_JACK) {
+			jack = (struct snd_jack *) sdev->device_data;
+			if (!strcmp(jack->id, jackid)) {
+				jack_found = 1;
+				break;
+			}
+		}
+
+	if (!jack_found)
+		jack = NULL;
+ exit:
+	kfree(ena);
+ exit1:
+	kfree(jackid);
+	return jack;
+}
+
+static ssize_t
+jackin_inject_store(struct device *dev, struct device_attribute *attr,
+		    const char *buf, size_t count)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	struct snd_jack *jack;
+	unsigned long enable;
+
+	jack = parsing_jack_and_enable(card, buf, count, &enable);
+	if (!jack)
+		return -EINVAL;
+
+	if (jack->sw_inject_enable)
+		snd_jack_report(jack, enable ? jack->type : 0, true);
+
+	return count;
+}
+static DEVICE_ATTR_WO(jackin_inject);
+
+static ssize_t
+sw_inject_enable_show(struct device *dev,
+		      struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	struct snd_device *sdev;
+	struct snd_jack *jack = NULL;
+	ssize_t ret_count = 0;
+
+	list_for_each_entry(sdev, &card->devices, list)
+		if (sdev->type == SNDRV_DEV_JACK) {
+			jack = (struct snd_jack *) sdev->device_data;
+			if (strstr(jack->id, "Phantom"))
+				continue;
+			ret_count += scnprintf(buf + ret_count, PAGE_SIZE, "%s: %s  %i\n",
+					       "Jack", jack->id, jack->sw_inject_enable);
+		}
+	return ret_count;
+}
+
+static ssize_t
+sw_inject_enable_store(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	struct snd_jack *jack;
+	unsigned long enable;
+
+	jack = parsing_jack_and_enable(card, buf, count, &enable);
+	if (!jack)
+		return -EINVAL;
+
+	jack->sw_inject_enable = !!enable;
+
+	return count;
+}
+static DEVICE_ATTR_RW(sw_inject_enable);
+
+static struct attribute *snd_jack_dev_attrs[] = {
+	&dev_attr_jackin_inject.attr,
+	&dev_attr_sw_inject_enable.attr,
+	NULL
+};
+
+static const struct attribute_group snd_jack_dev_attr_group = {
+	.name = "jack",
+	.attrs = snd_jack_dev_attrs,
+};
+
 /**
  * snd_jack_new - Create a new jack
  * @card:  the card instance
@@ -256,6 +374,11 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 
 	*jjack = jack;
 
+	if (!jack->card->jack_inject_attr_registered) {
+		jack->card->jack_inject_attr_registered = true;
+		snd_card_add_dev_attr(jack->card, &snd_jack_dev_attr_group);
+	}
+
 	return 0;
 
 fail_input:
@@ -348,6 +471,9 @@ void snd_jack_report(struct snd_jack *jack, int status, bool sw_inject)
 	if (!jack)
 		return;
 
+	if (jack->sw_inject_enable && !sw_inject)
+		return;
+
 	list_for_each_entry(jack_kctl, &jack->kctl_list, list)
 		snd_kctl_jack_report(jack->card, jack_kctl->kctl,
 					    status & jack_kctl->mask_bits);
-- 
2.25.1

