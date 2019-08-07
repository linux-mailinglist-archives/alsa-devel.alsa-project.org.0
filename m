Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F4684871
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 11:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629D484C;
	Wed,  7 Aug 2019 11:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629D484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565169062;
	bh=bOr01533H49GHmEjsKvYso6wcIKHp9sCz+6J7ib9AJY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nSCOvMCT7UV0MNhg/1sIDy0+kMe17628/Brhg4e7K+GoRGZOQ02R1LzJ8XVXdoWaO
	 f0kK0KJ0/4ww40Hj5eaaGemE2YPNRzk9oCiHy1ohhPtjNYinMQ2Spm4uVo7pQTOdgF
	 SQ4Z1NQWpZo8cPHrcBok3tMN0iSLJyZ1ysc+vMm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 811EBF804CA;
	Wed,  7 Aug 2019 11:09:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E1C6F80290; Wed,  7 Aug 2019 11:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD41FF800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 11:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD41FF800E4
Received: by mail-yw1-f68.google.com with SMTP id z197so32044740ywd.13
 for <alsa-devel@alsa-project.org>; Wed, 07 Aug 2019 02:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cYG9qyve6yyxmV+AOeRIzDv8dPpq2DUERiyZ5aq12Zs=;
 b=oxeGNgONZhkUgX5sENtjnV//zDSpklhuQCMb8G1T5vNxcuH0mzfF3Y27a6yPV3gbPp
 fhG00xicXm/B3CbsRtiV8dY2IOGsZDirNlRLX1/rZxkLuJ/gZb5f8UeWlp/iHkVBxeIy
 L4CIBJT7LZ5JqZHWhDHCEzWxonF/G2q6+0W6dKHQQNCynmlUcJGc9TjI3YzQod5aA8T5
 VRuKsg4MLPjRjQxHXnIGZNymQDMkE4lCn88N/yefoHh43U17q0yfkA1f9ArrDA/FO1I2
 rugasMBVs47ISI9WabtCQsmLbN+/irfwWJtOi4XNd6bbFbh7dokop8zOrtQWPj1/cy/C
 tHgA==
X-Gm-Message-State: APjAAAXCJ+otsffvozHytjagTQBaz5leEw1cYHcF2eF1J/T3EaHj+9Dn
 ORcicT2ZOZhP78YeZeZs2uM=
X-Google-Smtp-Source: APXvYqwNxPXEUwt4w+RyJ6UmqNqlXasDRygpmijmshd7FwsVJpuUzLPrT2DBiLP7P/OjcBZnCgqR0g==
X-Received: by 2002:a81:47d5:: with SMTP id u204mr5374829ywa.145.1565168951718; 
 Wed, 07 Aug 2019 02:09:11 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id 193sm369421ywh.89.2019.08.07.02.09.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 02:09:11 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Date: Wed,  7 Aug 2019 04:08:51 -0500
Message-Id: <1565168932-6337-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH v3] ALSA: hiface: fix multiple memory leak bugs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In hiface_pcm_init(), 'rt' is firstly allocated through kzalloc(). Later
on, hiface_pcm_init_urb() is invoked to initialize 'rt->out_urbs[i]'. In
hiface_pcm_init_urb(), 'rt->out_urbs[i].buffer' is allocated through
kzalloc().  However, if hiface_pcm_init_urb() fails, both 'rt' and
'rt->out_urbs[i].buffer' are not deallocated, leading to memory leak bugs.
Also, 'rt->out_urbs[i].buffer' is not deallocated if snd_pcm_new() fails.

To fix the above issues, free 'rt' and 'rt->out_urbs[i].buffer'.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/usb/hiface/pcm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index 14fc1e1..c406497 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -600,14 +600,13 @@ int hiface_pcm_init(struct hiface_chip *chip, u8 extra_freq)
 		ret = hiface_pcm_init_urb(&rt->out_urbs[i], chip, OUT_EP,
 				    hiface_pcm_out_urb_handler);
 		if (ret < 0)
-			return ret;
+			goto error;
 	}
 
 	ret = snd_pcm_new(chip->card, "USB-SPDIF Audio", 0, 1, 0, &pcm);
 	if (ret < 0) {
-		kfree(rt);
 		dev_err(&chip->dev->dev, "Cannot create pcm instance\n");
-		return ret;
+		goto error;
 	}
 
 	pcm->private_data = rt;
@@ -620,4 +619,10 @@ int hiface_pcm_init(struct hiface_chip *chip, u8 extra_freq)
 
 	chip->pcm = rt;
 	return 0;
+
+error:
+	for (i = 0; i < PCM_N_URBS; i++)
+		kfree(rt->out_urbs[i].buffer);
+	kfree(rt);
+	return ret;
 }
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
