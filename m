Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD338D969
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 09:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDE511664;
	Sun, 23 May 2021 09:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDE511664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621753986;
	bh=D7ZO/YzC0oumnqsNljm0ozwO1jCsbYTjd2TtUqOV8t0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ikR3cvTmb3PsGvsalxMBVDUWe6MMPZPGQSHvyX6+bfXssRLTDNd+w/GjzPvSPcPFH
	 i2veG4devJDe4yu5bFhqlIl2fUco7dAqAqwmxd+yTRXb8XpkEkDeaiuF4REZKVvqzg
	 Fx7uE1qXTS1eFMtUGMYoUh5xPB7StQPDKuk5fm1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36922F8016D;
	Sun, 23 May 2021 09:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED6EF801EB; Sun, 23 May 2021 09:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50C00F8016D
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 09:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C00F8016D
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fns014hV2zmXf4;
 Sun, 23 May 2021 15:09:05 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 23 May 2021 15:11:24 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 23
 May 2021 15:11:23 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH -next] ALSA: control_led - use DEVICE_ATTR_*() macro
Date: Sun, 23 May 2021 15:11:09 +0800
Message-ID: <20210523071109.28940-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
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

Use DEVICE_ATTR_*() helper instead of plain DEVICE_ATTR,
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/core/control_led.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 25f57c14f294..a5e751f26d46 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -375,7 +375,7 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
  * sysfs
  */
 
-static ssize_t show_mode(struct device *dev,
+static ssize_t mode_show(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
@@ -390,7 +390,8 @@ static ssize_t show_mode(struct device *dev,
 	return sprintf(buf, "%s\n", str);
 }
 
-static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
+static ssize_t mode_store(struct device *dev,
+			  struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
@@ -419,7 +420,7 @@ static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t show_brightness(struct device *dev,
+static ssize_t brightness_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
@@ -427,8 +428,8 @@ static ssize_t show_brightness(struct device *dev,
 	return sprintf(buf, "%u\n", ledtrig_audio_get(led->trigger_type));
 }
 
-static DEVICE_ATTR(mode, 0644, show_mode, store_mode);
-static DEVICE_ATTR(brightness, 0444, show_brightness, NULL);
+static DEVICE_ATTR_RW(mode);
+static DEVICE_ATTR_RO(brightness);
 
 static struct attribute *snd_ctl_led_dev_attrs[] = {
 	&dev_attr_mode.attr,
@@ -562,22 +563,25 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 	return count;
 }
 
-static ssize_t parse_attach(struct device *dev, struct device_attribute *attr,
+static ssize_t attach_store(struct device *dev,
+			    struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	return set_led_id(led_card, buf, count, true);
 }
 
-static ssize_t parse_detach(struct device *dev, struct device_attribute *attr,
+static ssize_t detach_store(struct device *dev,
+			    struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	return set_led_id(led_card, buf, count, false);
 }
 
-static ssize_t ctl_reset(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
+static ssize_t reset_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	int err;
@@ -590,8 +594,8 @@ static ssize_t ctl_reset(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t ctl_list(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t list_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	struct snd_card *card;
@@ -624,10 +628,10 @@ static ssize_t ctl_list(struct device *dev,
 	return buf2 - buf;
 }
 
-static DEVICE_ATTR(attach, 0200, NULL, parse_attach);
-static DEVICE_ATTR(detach, 0200, NULL, parse_detach);
-static DEVICE_ATTR(reset, 0200, NULL, ctl_reset);
-static DEVICE_ATTR(list, 0444, ctl_list, NULL);
+static DEVICE_ATTR_WO(attach);
+static DEVICE_ATTR_WO(detach);
+static DEVICE_ATTR_WO(reset);
+static DEVICE_ATTR_RO(list);
 
 static struct attribute *snd_ctl_led_card_attrs[] = {
 	&dev_attr_attach.attr,
-- 
2.17.1

