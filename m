Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335A39440B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:18:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0511516DB;
	Fri, 28 May 2021 16:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0511516DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622211526;
	bh=wW7nAlmO/n0txnTRtfe1oTgX0cWLqvkJ6SwGKCZXMAg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RIXAmjhE94QNonD5/YHWJn2tDKkFf1PqxZHuoq+yZAV8WnSTusv34wEiLJ7kGQXob
	 sUR4aNhz0Ml+qvMxhKEbVgPSYhoGEETNz6a/c84ggwZt58ISPHF38tpkAhd5WNJRzY
	 2fFWqcTH+Dj98xwfpn+1Ct+Dal+1RrptNNnQAInI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4D8F804E2;
	Fri, 28 May 2021 16:14:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FBB6F804AC; Fri, 28 May 2021 15:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB3B9F802BE
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 15:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3B9F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Lbqovj2F"
Received: by mail-pj1-x102f.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso7229229pjx.1
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RekKeBRuPvOLorDIGSFgCHT4XDxldmZcH/AplJmkZg4=;
 b=Lbqovj2FNhk/oTCo9MepudU1cGkrJPNCJaqnlYyVZnuL/txKOIBaRi1vI8Egu32pvb
 OY6Qv6nGOuvXBdL6Xfe7BuPCEqDahinPHS7yzXuBOBF6ZsrgGGW9OfOpLJaRalJlZCD3
 Wt8rlAYcbY9MhRBL2a8CJtmI8w/HcoTW2XGJWlVGsVJAI7B7moh9ji3ebEi7HGGF7lR3
 Q0IYFc8YPdrwKdLwymCPAguav9spxQ/NQIITTsDLNQZZolBitHOBhFTnQpnGhBc84NNJ
 jnKAO72mn/zGI9L1MCg+StdVbk7DauGnBkDkhPHUO5BLEh8SBP8B04idJ2E8lwV280uu
 lxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RekKeBRuPvOLorDIGSFgCHT4XDxldmZcH/AplJmkZg4=;
 b=obnv7OaQhXeTJOku8q7Dv1A90SU4Ij5o179dnYJy4bnksN2u/vyYRQQMR2aRghMo+p
 khWvh4FOsH34rT114leWzQPTMmRwOo7wTMulZhG2RRrqO5b/8RhR6Ee5qWuNvhXsFdIA
 gDT1Lc71866qkLC1Os5SEsGXjl22ga/s+FzOXEYzrhGsDk68IilanVUUOVm8kg1zeEUx
 gmSIktSMChcVr7s855L14QO2FRd6KsGpPg7tu3ALyP1HhzrSKS1DIVnKx57gAfbdDvPx
 pSSVPe5i1wv66pSrprzPt8F4cj0/tw502vfpogj7hfsT7CCZsMKgLxtJKeAzTRCf1EVh
 2cIQ==
X-Gm-Message-State: AOAM53294nxpwGfkeuhRYlDtSaMWCP33UPcee3iBvrkWuKSdoNjPN3c9
 f/U4MLTWQqOILyFUDHmzV5M=
X-Google-Smtp-Source: ABdhPJzryubmTPDP2z1b/tbJbHKXZ2rBe/YITBtt9HuUVeIwQ3mYeeGMwEngIKawI/ISHIrHdgoO1A==
X-Received: by 2002:a17:902:70c2:b029:ee:b4e5:64d5 with SMTP id
 l2-20020a17090270c2b02900eeb4e564d5mr7957845plt.77.1622207890484; 
 Fri, 28 May 2021 06:18:10 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.113])
 by smtp.gmail.com with ESMTPSA id cu2sm4246045pjb.43.2021.05.28.06.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:18:09 -0700 (PDT)
From: Dongliang Mu <mudongliangabcd@gmail.com>
To: perex@perex.cz, tiwai@suse.com, dan.carpenter@oracle.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
Date: Fri, 28 May 2021 21:17:57 +0800
Message-Id: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 May 2021 16:14:26 +0200
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
device_private.

Fix this by calling put_device at the end of snd_ctl_led_sysfs_remove

Reported-by: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 sound/core/control_led.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 25f57c14f294..fff2688b5019 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -371,6 +371,10 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
 	snd_ctl_led_refresh();
 }
 
+static void snd_ctl_led_release(struct device *dev)
+{
+}
+
 /*
  * sysfs
  */
@@ -663,6 +667,7 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
 		led_card->number = card->number;
 		led_card->led = led;
 		device_initialize(&led_card->dev);
+		led_card->dev.release = snd_ctl_led_release;
 		if (dev_set_name(&led_card->dev, "card%d", card->number) < 0)
 			goto cerr;
 		led_card->dev.parent = &led->dev;
@@ -701,6 +706,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
 		sysfs_remove_link(&card->ctl_dev.kobj, link_name);
 		sysfs_remove_link(&led_card->dev.kobj, "card");
 		device_del(&led_card->dev);
+		put_device(&led_card->dev);
 		kfree(led_card);
 		led->cards[card->number] = NULL;
 	}
-- 
2.25.1

