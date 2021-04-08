Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF83357F9C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 11:45:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B60DB167A;
	Thu,  8 Apr 2021 11:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B60DB167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617875108;
	bh=zF/G32no0ZNSG7po9o1uP57iW6QfeTP6umNtTZXVZgs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BMAxndP1OPRR0KWcswKyirdMmT1Yv9MsvfEEoO3fjkAiC8EtUSu1d78SGrgvREmZr
	 hcHuSBhoKurdcFsxt2bKe5JI3BB56MnE/97n03aqD9ntKo11/SmvpxCkMwZQnOsCxq
	 nAN6uWp3jhq/06zKRUbX2fmirbYER2jBJLbhSr7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D49F80246;
	Thu,  8 Apr 2021 11:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB19F8020B; Thu,  8 Apr 2021 11:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C43F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 11:43:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 20C9BA0040;
 Thu,  8 Apr 2021 11:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 20C9BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617875006; bh=zQEjPxJVpj6OFdNfDRkmL6opolr3R7ln8+C/5Yjv8iA=;
 h=From:To:Cc:Subject:Date:From;
 b=EXXmGox8iTeksOHFIf21p2LaQzI5pa3GvpiVpwyJGyWSjI/ST7TBM76m9I2CogTx3
 QPyMh4g3TzR1iaCE8rueNGRMZFxRqapgc+qw6RGkgEdvcekbq2G1PbN7S6xU2mkld/
 jK3kCJM3K3NJdryTPOwHyAqgTcCv8QnP9tYWvYJk=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 11:43:20 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: core - add more card sysfs entries
Date: Thu,  8 Apr 2021 11:43:14 +0200
Message-Id: <20210408094314.1322802-1-perex@perex.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

There are several strings which are describing the card. As time goes,
we have new universal drivers which probe components in a way, which
is disassociated from the card structure (ASoC). Also, some drivers
may require to select another firmware depending on the specific
platform using udev. The new firmware may change the sound card behaviour.

This patch allows flexible modifications of the card description
from the user space to handle the specific boot / plug-in settings.

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/init.c | 166 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 155 insertions(+), 11 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index ef41f5b3a240..01b26912a4d0 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -662,6 +662,33 @@ void snd_card_set_id(struct snd_card *card, const char *nid)
 }
 EXPORT_SYMBOL(snd_card_set_id);
 
+#define EXTRA_ID_CHARS		"_-"
+#define EXTRA_NAME_CHARS	" _-.:"
+
+static bool safe_attr_strcpy(char *dst, size_t dst_count,
+			     const char *src, size_t src_count,
+			     const char *extra_characters)
+{
+	size_t idx, copy;
+	int c;
+
+	copy = src_count >= dst_count ? dst_count - 1 : src_count;
+	for (idx = 0; idx < copy; idx++) {
+		c = src[idx];
+		if (c < ' ') {
+			copy = idx;
+			break;
+		}
+		if (!isalnum(c) && !strchr(extra_characters, c))
+			return false;
+	}
+	if (copy < 3)
+		return false;
+	memcpy(dst, src, copy);
+	dst[copy] = '\0';
+	return true;
+}
+
 static ssize_t
 card_id_show_attr(struct device *dev,
 		  struct device_attribute *attr, char *buf)
@@ -676,18 +703,10 @@ card_id_store_attr(struct device *dev, struct device_attribute *attr,
 {
 	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
 	char buf1[sizeof(card->id)];
-	size_t copy = count > sizeof(card->id) - 1 ?
-					sizeof(card->id) - 1 : count;
-	size_t idx;
-	int c;
 
-	for (idx = 0; idx < copy; idx++) {
-		c = buf[idx];
-		if (!isalnum(c) && c != '_' && c != '-')
-			return -EINVAL;
-	}
-	memcpy(buf1, buf, copy);
-	buf1[copy] = '\0';
+	if (!safe_attr_strcpy(buf1, sizeof(buf1), buf, count, EXTRA_ID_CHARS))
+		return -EINVAL;
+
 	mutex_lock(&snd_card_mutex);
 	if (!card_id_ok(NULL, buf1)) {
 		mutex_unlock(&snd_card_mutex);
@@ -712,9 +731,134 @@ card_number_show_attr(struct device *dev,
 
 static DEVICE_ATTR(number, 0444, card_number_show_attr, NULL);
 
+static ssize_t
+card_driver_show_attr(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", card->driver);
+}
+
+static ssize_t
+card_driver_store_attr(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	char driver1[sizeof(card->driver)];
+
+	if (!safe_attr_strcpy(driver1, sizeof(driver1), buf, count, EXTRA_NAME_CHARS))
+		return -EINVAL;
+	mutex_lock(&snd_card_mutex);
+	strcpy(card->driver, driver1);
+	mutex_unlock(&snd_card_mutex);
+	return count;
+}
+
+static DEVICE_ATTR(driver, 0644, card_driver_show_attr, card_driver_store_attr);
+
+static ssize_t
+card_name_show_attr(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", card->shortname);
+}
+
+static ssize_t
+card_name_store_attr(struct device *dev, struct device_attribute *attr,
+		     const char *buf, size_t count)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	char name1[sizeof(card->shortname)];
+
+	if (!safe_attr_strcpy(name1, sizeof(name1), buf, count, EXTRA_NAME_CHARS))
+		return -EINVAL;
+	mutex_lock(&snd_card_mutex);
+	strcpy(card->shortname, name1);
+	mutex_unlock(&snd_card_mutex);
+	return count;
+}
+
+static DEVICE_ATTR(name, 0644, card_name_show_attr, card_name_store_attr);
+
+static ssize_t
+card_longname_show_attr(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", card->longname);
+}
+
+static ssize_t
+card_longname_store_attr(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	char longname1[sizeof(card->longname)];
+
+	if (!safe_attr_strcpy(longname1, sizeof(longname1), buf, count, EXTRA_NAME_CHARS))
+		return -EINVAL;
+	mutex_lock(&snd_card_mutex);
+	strcpy(card->longname, longname1);
+	mutex_unlock(&snd_card_mutex);
+	return count;
+}
+
+static DEVICE_ATTR(longname, 0644, card_longname_show_attr, card_longname_store_attr);
+
+static ssize_t
+card_mixername_show_attr(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", card->mixername);
+}
+
+static ssize_t
+card_mixername_store_attr(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	char mixername1[sizeof(card->mixername)];
+
+	if (!safe_attr_strcpy(mixername1, sizeof(mixername1), buf, count, EXTRA_NAME_CHARS))
+		return -EINVAL;
+	mutex_lock(&snd_card_mutex);
+	strcpy(card->mixername, mixername1);
+	mutex_unlock(&snd_card_mutex);
+	return count;
+}
+
+static DEVICE_ATTR(mixername, 0644, card_mixername_show_attr, card_mixername_store_attr);
+
+static ssize_t
+card_components_show_attr(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", card->components);
+}
+
+static ssize_t
+card_components_store_attr(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
+	char components1[sizeof(card->components)];
+
+	if (!safe_attr_strcpy(components1, sizeof(components1), buf, count, EXTRA_NAME_CHARS))
+		return -EINVAL;
+	mutex_lock(&snd_card_mutex);
+	strcpy(card->components, components1);
+	mutex_unlock(&snd_card_mutex);
+	return count;
+}
+
+static DEVICE_ATTR(components, 0644, card_components_show_attr, card_components_store_attr);
+
 static struct attribute *card_dev_attrs[] = {
 	&dev_attr_id.attr,
 	&dev_attr_number.attr,
+	&dev_attr_driver.attr,
+	&dev_attr_name.attr,
+	&dev_attr_longname.attr,
+	&dev_attr_mixername.attr,
+	&dev_attr_components.attr,
 	NULL
 };
 
-- 
2.30.2
