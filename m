Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4B772E87
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 14:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE1911938;
	Wed, 24 Jul 2019 14:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE1911938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563970528;
	bh=bz9ioAnyPneCZxfVyoPWoGLGoj7+jwgVFiZJ1cM2Nx4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pY1q+uYPsQbbAft4ivNY1zGFeTVIanzqrXXJag6UXewvmS9n5yNdHGQlzuakEGAEO
	 7tn83DLveTg37Mqqt7ID0uwo254jIgD+rfZ++SMtcDGeHd4TtDoOuliwaERKV5DNzm
	 vmvrXpE8EvP60NI51hd2bsT/SyUYI4UjF7Z5j1Tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EE05F803D1;
	Wed, 24 Jul 2019 14:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5A3CF803D1; Wed, 24 Jul 2019 14:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C245F8026F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 14:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C245F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s8XDVAag"
Received: by mail-pf1-x443.google.com with SMTP id p184so20858022pfp.7
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 05:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yOe9je3y3azuxEkbZtWAgzy/O8tv7xt/7UDFJgcMfj4=;
 b=s8XDVAagfffx5f9BWX1AzPwmmHmm5GOZ3QuKYZ4yMZ69IcT4jkecK2Bg8Yy/vpcKC+
 dthic2I4LPTJcLT4z0STllQckoVS7Fw4OyKGPqxUtz3vexpptdyxut782KbjsCJQco7w
 BoC8SjYltzNvBjuQjU1TTYTgOy5t/dwdTcMPW/AEvuGJ19zZdBs/ctzvexJ8E49ckblB
 OQRe/jbhe/tMsiDL5ZirfuNh0b6HqCQvls6OEVnYFFB9N4WT7Rw9hd93wmj3ld1pU6bW
 57jEMd9adYRQJ6uVhCrAG07o4wwok59qaNSYx4VnSwbvmdAT3lEzYRTvss0db4JLOrhe
 QITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yOe9je3y3azuxEkbZtWAgzy/O8tv7xt/7UDFJgcMfj4=;
 b=RHi7Rhz18f2yczuTiEF+7brmfxtJJs/NG3YQHebMKdX4XVDvOBptnRgOTFzVoNE2RS
 DXYp0NZ7KTp0aqhMv9hvgesOpNE9EOktf0zRO+v6psF2zOMkuh+CLZyr62SE+XEVimsQ
 t857ThY932wbJhjDWCOYEGSNamktAUm7MJR/DW2wKaY7yHPs+V2TKsDFRhwYEizRrN0K
 fv+EqiJMwjzW/hJQRcHDq2JzAIL6S25VR2klRKyeaZCA78ZZOgX7FS9JoePiSz2CeODR
 /nbC7IdLueG5Ev86g3I/U/Dt69XfClhkO7l1lZ1CFC8DLH4EabG6Msx+q6zN5VJQBQND
 kVxg==
X-Gm-Message-State: APjAAAWDX7aW3udrPIWekcvklEdbSXWgdNLTw84XiGEXxcb+B+/Nphdf
 sWvG6K4s8TrEOY4IskhDfb4=
X-Google-Smtp-Source: APXvYqwlapnzHOWglZEataQxo8AjBg+B2YemqkqgWG33hfLPCnq47yi/DxSiTBSZj4GhDAGlntYt0g==
X-Received: by 2002:a63:1749:: with SMTP id 9mr28651971pgx.0.1563970415766;
 Wed, 24 Jul 2019 05:13:35 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id g66sm47009665pfb.44.2019.07.24.05.13.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 05:13:35 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: perex@perex.cz, tiwai@suse.com, bhelgaas@google.com, tglx@linutronix.de,
 rfontana@redhat.com, gregkh@linuxfoundation.org, kirr@nexedi.com
Date: Wed, 24 Jul 2019 20:13:27 +0800
Message-Id: <20190724121327.9894-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: alsa-devel@alsa-project.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: core: Fix possible null-pointer
	dereferences in snd_timer_proc_read()
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

In snd_timer_proc_read(), there is an if statement on line 1204 to check
whether timer->card is NULL:
    if (timer->card && timer->card->shutdown)

When timer->card is NULL, it is used on lines 1212 and 1215:
    timer->card->number

Thus, possible null-pointer dereferences may occur.

To fix these bugs, timer->card is checked before being used.

These bugs are found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 sound/core/timer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 5c9fbf3f4340..967d06a3cdec 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1208,11 +1208,13 @@ static void snd_timer_proc_read(struct snd_info_entry *entry,
 			snd_iprintf(buffer, "G%i: ", timer->tmr_device);
 			break;
 		case SNDRV_TIMER_CLASS_CARD:
-			snd_iprintf(buffer, "C%i-%i: ",
-				    timer->card->number, timer->tmr_device);
+			snd_iprintf(buffer, "C%i-%i: ", 
+					timer->card ? timer->card->number : -1, 
+					timer->tmr_device);
 			break;
 		case SNDRV_TIMER_CLASS_PCM:
-			snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->number,
+			snd_iprintf(buffer, "P%i-%i-%i: ",
+					timer->card ? timer->card->number : -1,
 				    timer->tmr_device, timer->tmr_subdevice);
 			break;
 		default:
-- 
2.17.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
