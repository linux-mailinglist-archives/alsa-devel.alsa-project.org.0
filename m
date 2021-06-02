Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D6E397FA0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 05:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135FF16E1;
	Wed,  2 Jun 2021 05:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135FF16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622605410;
	bh=2Mz4CL+hcmZfP6hnTper68o0ITZ3eyyHnnwv7B3fgaM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ez3FMt2XdN+6rDxSZZ4PcQMnorn+Y9O1huyYCp1tXbDX6AOP9A8SuyVniy1OCPz7P
	 Bm+OK5OYgJ4oNV0MX1ZKf+R9Dsu9Y/8HVsnoiHoS/prP0C5120up/aOJyIOQdsUg9J
	 mmfpxRbXhqlIF9PNZWnHGGIIMmxQ/8Qt+o0z6Dyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61545F80425;
	Wed,  2 Jun 2021 05:42:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A146F80424; Wed,  2 Jun 2021 05:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 012DEF80273
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 05:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 012DEF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PyV8FeSK"
Received: by mail-pf1-x430.google.com with SMTP id z26so1128084pfj.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 20:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zLdktgE0a9sEXZ0/b+s3AebnOjlZIpwVaCTKFoWaY6o=;
 b=PyV8FeSKyEIVaDpLD1OQklsC0+U/xDfysW1/zZXRwfV+KdD6NggGTMgx0BhlkyFcVW
 SuRX+ExKpACmEe4VXNzThsolvdMl99oWRC4cLxxUJxJlxkG0WEAH1BeLWZGowj3e2+g6
 FJO0au3vJfJ7e2KFHuA73+gMVKDUzYq2QluuHh17e5HzHEMzFAru7FLzovFHeQfaJo9T
 vCQqxmaUsbR50lSrCAYy3QdXiuzV+sGsjOpaavnZMj/xQtrfLs+PJJ7/WqjISF4F35zF
 N2NNaZShZivIOJpEWbo8EQErq/+YBkkSsgADbfH0ePpBC4RyEdspM4G+RqHvPec+CQgF
 o7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zLdktgE0a9sEXZ0/b+s3AebnOjlZIpwVaCTKFoWaY6o=;
 b=NOquQx7g0bjYfcYwrT5F6kfcbYgcv+iqo8Lx8WxZKEgRGRrna0TpzZalWN1IAl0KAe
 Bun1ZojGzykfIyVSVxFTHiZtCaabhFVxgr8KGZNhua9JHsFIWVpW7X11/tp97/60hDDH
 Z+ohqpC6sp3Hm43hZFlWaHA9M3ugi3PulvR1xFa3hGXmp4vRU25z4EewGVh2QxILpoQM
 rS4tGI8yC6WLxN1G/T3C01HCYCpi7nWZZwrAb8rnLAXqMIu64LZ0IFCuAd2u9edWL2RM
 byZ4eZyX8G5gvTnzHFNClAnU9K/PSMno1hQAt9VseMReuoMBC30T8Cv+qpG3FbY0jpqF
 dYHA==
X-Gm-Message-State: AOAM5324RYOswE3PLYpLZyaGvWUUyHUMn38zJeArRMQaTnHNg81yyJaW
 PHBHR9M73jsFQAggFDB9SAY=
X-Google-Smtp-Source: ABdhPJzPeLvDeBppfezgwtWuGF9uxgIOTAtzej3GgkpTc/DSKL2YdMFF0UIb8N/mqAv4ufvrNDH0ew==
X-Received: by 2002:aa7:80d3:0:b029:28e:f117:4961 with SMTP id
 a19-20020aa780d30000b029028ef1174961mr25291555pfn.37.1622605308627; 
 Tue, 01 Jun 2021 20:41:48 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.140])
 by smtp.gmail.com with ESMTPSA id 141sm10746460pgf.20.2021.06.01.20.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 20:41:48 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: perex@perex.cz, tiwai@suse.com, dan.carpenter@oracle.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: control led: fix memory leak in snd_ctl_led_register
Date: Wed,  2 Jun 2021 11:41:36 +0800
Message-Id: <20210602034136.2762497-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dongliang Mu <mudongliangabcd@gmail.com>,
 syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
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

The snd_ctl_led_sysfs_add and snd_ctl_led_sysfs_remove should contain
the refcount operations in pair. However, snd_ctl_led_sysfs_remove fails
to decrease the refcount to zero, which causes device_release never to
be invoked. This leads to memory leak to some resources, like struct
device_private. In addition, we also free some other similar memory
leaks in snd_ctl_led_init/snd_ctl_led_exit.

Fix this by replacing device_del to device_unregister
in snd_ctl_led_sysfs_remove/snd_ctl_led_init/snd_ctl_led_exit.

Note that, when CONFIG_DEBUG_KOBJECT_RELEASE is enabled, put_device will
call kobject_release and delay the release of kobject, which will cause
use-after-free when the memory backing the kobject is freed at once.

Reported-by: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: fix other similar memory leaks; move kfree(led_card) to a
release function.
 sound/core/control_led.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 25f57c14f294..a90e31dbde61 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -17,6 +17,9 @@ MODULE_LICENSE("GPL");
 #define MAX_LED (((SNDRV_CTL_ELEM_ACCESS_MIC_LED - SNDRV_CTL_ELEM_ACCESS_SPK_LED) \
 			>> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) + 1)
 
+#define to_led_card_dev(_dev) \
+	container_of(_dev, struct snd_ctl_led_card, dev)
+
 enum snd_ctl_led_mode {
 	 MODE_FOLLOW_MUTE = 0,
 	 MODE_FOLLOW_ROUTE,
@@ -371,6 +374,21 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
 	snd_ctl_led_refresh();
 }
 
+static void snd_ctl_led_card_release(struct device *dev)
+{
+	struct snd_ctl_led_card *led_card = to_led_card_dev(dev);
+
+	kfree(led_card);
+}
+
+static void snd_ctl_led_release(struct device *dev)
+{
+}
+
+static void snd_ctl_led_dev_release(struct device *dev)
+{
+}
+
 /*
  * sysfs
  */
@@ -663,6 +681,7 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 		led_card->number = card->number;
 		led_card->led = led;
 		device_initialize(&led_card->dev);
+		led_card->dev.release = snd_ctl_led_card_release;
 		if (dev_set_name(&led_card->dev, "card%d", card->number) < 0)
 			goto cerr;
 		led_card->dev.parent = &led->dev;
@@ -681,7 +700,6 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 		put_device(&led_card->dev);
 cerr2:
 		printk(KERN_ERR "snd_ctl_led: unable to add card%d", card->number);
-		kfree(led_card);
 	}
 }
 
@@ -700,8 +718,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
 		snprintf(link_name, sizeof(link_name), "led-%s", led->name);
 		sysfs_remove_link(&card->ctl_dev.kobj, link_name);
 		sysfs_remove_link(&led_card->dev.kobj, "card");
-		device_del(&led_card->dev);
-		kfree(led_card);
+		device_unregister(&led_card->dev);
 		led->cards[card->number] = NULL;
 	}
 }
@@ -723,6 +740,7 @@ static int __init snd_ctl_led_init(void)
 
 	device_initialize(&snd_ctl_led_dev);
 	snd_ctl_led_dev.class = sound_class;
+	snd_ctl_led_dev.release = snd_ctl_led_dev_release;
 	dev_set_name(&snd_ctl_led_dev, "ctl-led");
 	if (device_add(&snd_ctl_led_dev)) {
 		put_device(&snd_ctl_led_dev);
@@ -733,15 +751,16 @@ static int __init snd_ctl_led_init(void)
 		INIT_LIST_HEAD(&led->controls);
 		device_initialize(&led->dev);
 		led->dev.parent = &snd_ctl_led_dev;
+		led->dev.release = snd_ctl_led_release;
 		led->dev.groups = snd_ctl_led_dev_attr_groups;
 		dev_set_name(&led->dev, led->name);
 		if (device_add(&led->dev)) {
 			put_device(&led->dev);
 			for (; group > 0; group--) {
 				led = &snd_ctl_leds[group - 1];
-				device_del(&led->dev);
+				device_unregister(&led->dev);
 			}
-			device_del(&snd_ctl_led_dev);
+			device_unregister(&snd_ctl_led_dev);
 			return -ENOMEM;
 		}
 	}
@@ -767,9 +786,9 @@ static void __exit snd_ctl_led_exit(void)
 	}
 	for (group = 0; group < MAX_LED; group++) {
 		led = &snd_ctl_leds[group];
-		device_del(&led->dev);
+		device_unregister(&led->dev);
 	}
-	device_del(&snd_ctl_led_dev);
+	device_unregister(&snd_ctl_led_dev);
 	snd_ctl_led_clean(NULL);
 }
 
-- 
2.25.1

