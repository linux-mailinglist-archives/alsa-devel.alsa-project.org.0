Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2306B1C280C
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 21:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C226716B5;
	Sat,  2 May 2020 21:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C226716B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588448079;
	bh=AQ9BDEmKYDorokX2/FmlSzpBnPQPHVsgyK15S/inm9U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxQoAZD/7cMmlldSGxo029eGsSbN78piOgF1I1GDQ+PK11YqlvzXFO7ONECxJQzLV
	 Qv69+xfXR9nyv4ZTeTp8lMqymbtJO0A6dFbrSmJbRjIrjnjkJGbJt7eY/PfwKmyjsH
	 ZoQ9wuTMRv+C/dEGEVIMiydce/oL89EfrBkRFMb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71470F80271;
	Sat,  2 May 2020 21:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98FE3F80271; Sat,  2 May 2020 21:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40B6DF801EB
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 21:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40B6DF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HKWCM9z2"
Received: by mail-pl1-x642.google.com with SMTP id h11so5034284plr.11
 for <alsa-devel@alsa-project.org>; Sat, 02 May 2020 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwZfgYU5pOSIQurozok73LbTUD8n0X6fQwE6GivlBr0=;
 b=HKWCM9z26I0XXC2hIuNY//6teoEr1cIhqWHA105b7SE1K3wJH6XnYzPUMhWph4x+KN
 vDIL2d4u+6hk5ivagHu0JqtWE1v81lqavmpE70w/3BDn8h9/6HIgp7sfKiPoR4HpSw33
 Fb9FPx+YMPSCBbwJz8tFUNbDd0J+oJCD/QrzTpioBvARhYVb2dVxi0Pp8Hpy2aNFMVio
 J7gexJncqXQ2S1gQCBXq/7XNdyPgn2Bj8covz14cJtl1W1EcfD7lpsTdMK+sVcdqG1qf
 Xm5sh2dONmVTd9NBUQJLHRLa8q3+Hb/XdTIJ5eDZt5/rkbw7jr0daV+Ug+35GTMFsOTX
 lKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwZfgYU5pOSIQurozok73LbTUD8n0X6fQwE6GivlBr0=;
 b=KKKX0gDixUJWxoovX49YrgefSpo9KhVQjnPzXjr4pNMX26MHpePGC/ewafqLcO2zVN
 c1nfk1BSoW5+Ep6yL2I8TzJImt/mVkxyWuHudWFnIlJ3FwPt2LnORaWPNq7GWQcNN6OL
 DTxi60EQTNdIQhq3tIQY3A9uJO5DAp3jXWRbWiUB5cWtmFi5uo9e+gR3mNsB/Z5b2bFs
 60RvaauOvr8si48B+lZpvD84FxRU0qlAc86PTqOHCAV7WT5P5Z66EyD3tT1Mpzu/ZRcr
 O71FMS6dxNE29OQZqq+2J0OlaGTT0EwGLytdlq1hdh+RilWnvhwM0XOX78fUzqhXws/m
 AYyA==
X-Gm-Message-State: AGi0PuaAVX6qFtciAssWX6iWz/WRBgJxF+OK3MYhWr84d+hm/tD6EJk9
 ewgHJ27HZ1mGCXrmq4LMdJs=
X-Google-Smtp-Source: APiQypJA7cnL0ZZG81/fp8O3RFdgnHGYF1RPFRF6LpVhzglnxI6TECL6gOwrrNkbWNDlwvuaizFlKg==
X-Received: by 2002:a17:902:a984:: with SMTP id
 bh4mr10379952plb.176.1588447906143; 
 Sat, 02 May 2020 12:31:46 -0700 (PDT)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id 138sm5034358pfz.31.2020.05.02.12.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 12:31:45 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pavel Machek <pavel@denx.de>,
 Allison Randal <allison@lohutok.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: line6: hwdep: add support for O_NONBLOCK opening
 mode
Date: Sat,  2 May 2020 12:31:19 -0700
Message-Id: <20200502193120.79115-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502193120.79115-1-anarsoul@gmail.com>
References: <20200502193120.79115-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
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

Currently line6 hwdep interface ignores O_NONBLOCK flag when
opening device and it renders it somewhat useless when using poll.

Check for O_NONBLOCK flag when opening device and don't block read()
if it is set.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 sound/usb/line6/driver.c | 4 ++++
 sound/usb/line6/driver.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 4f096685ed65..86adf87d57f0 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -550,6 +550,7 @@ static int line6_hwdep_open(struct snd_hwdep *hw, struct file *file)
 	/* NOTE: hwdep layer provides atomicity here */
 
 	line6->messages.active = 1;
+	line6->messages.nonblock = file->f_flags & O_NONBLOCK ? 1 : 0;
 
 	return 0;
 }
@@ -579,6 +580,9 @@ line6_hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 	while (kfifo_len(&line6->messages.fifo) == 0) {
 		mutex_unlock(&line6->messages.read_lock);
 
+		if (line6->messages.nonblock)
+			return -EAGAIN;
+
 		rv = wait_event_interruptible(
 			line6->messages.wait_queue,
 			kfifo_len(&line6->messages.fifo) != 0);
diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index e5e572ed5f30..1a4e3700c80c 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -163,6 +163,7 @@ struct usb_line6 {
 		struct mutex read_lock;
 		wait_queue_head_t wait_queue;
 		unsigned int active:1;
+		unsigned int nonblock:1;
 		STRUCT_KFIFO_REC_2(LINE6_BUFSIZE_LISTEN * LINE6_RAW_MESSAGES_MAXCOUNT)
 			fifo;
 	} messages;
-- 
2.26.2

