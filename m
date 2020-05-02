Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1031C280A
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 21:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F50416B8;
	Sat,  2 May 2020 21:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F50416B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588448063;
	bh=L01Znag3i0jZqV5e6GFhujAAYklgof58nc6RYVaK/gA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIK1Ph7P3LCbN1IFT5LqEp6TaDqLgZozRnprSOt5myL6Y2+l67wCSW0ti7WQogu5X
	 oXaBVn5VCpqHmrg1SoGBTZp8raUoVft6deqbfTkQiXFTJzTsdZwXaMnx3QA+VMkV9d
	 vx4dx9PlliCulkzxIeUa0OBytkBrzJSkvemPmQwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61BECF801EB;
	Sat,  2 May 2020 21:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFCBAF801F7; Sat,  2 May 2020 21:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 564C1F80087
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 21:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 564C1F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b4TQAU3l"
Received: by mail-pj1-x1043.google.com with SMTP id a7so1688359pju.2
 for <alsa-devel@alsa-project.org>; Sat, 02 May 2020 12:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TIL2KbMxRtnATvJqUzPTFDCNwLrdBpSmmIc1wV1dEHA=;
 b=b4TQAU3lmiD8PQG+dwxpbXSHwlgPMje9VEnlG+Q/yWnaPXzbs0+oWvYmWyh9wIevPh
 hkznabwuMxJkrTsq0vpbyApI+jsejbYLhfj4JnIG/l7FH5aS1bn+B0ypxAIZ+LZs4IP/
 sh0wlwEQJ67L/Jp7OFw4xghqClyuUOd6sGPKj1SIAinSKZaANfpHRS1eELWe/DZ3iTWk
 nnC6CNSBJ2Le/CYvy1FQPX/Dp3eudXxq1UqepnRbMvp5e/9MjDPJOlACjGrBZ3nT/rvi
 u58TJt7z1vBVnh1wXZAHG8wI7Xij5SfUCBzKeP9XDiMkYE1vduykLcjPOu0L6DDTZO6p
 GARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TIL2KbMxRtnATvJqUzPTFDCNwLrdBpSmmIc1wV1dEHA=;
 b=lKI91nOKimhuipLEv3sJ9JQ4a3Zh46j62xEuI6C0YXbXZVLwA8+4magBYIj13+AI6R
 3X1wkL0fs2pvOPPbsL9LDbvVyNzchOr9wmMiOaDD54Z0y6YjHr5v37I/CHoyW3WtAqxH
 MwEAilPqVc7TiLL5F52Ixao0vJlDthg3qbZZjPJma/xfEE/hbY6BwYnAzezjvP0EhGBC
 JLjhq/nnZLE5VKCk6L3q8a05xtumCPapN4cAWotpqq7U7nr+I1cUJEhKWvW3wGol7g/s
 sQLSmM3Mq9vcSeotQNrRaAsU7tBheHi6cErDf6ALrrslgRPCwQ5l74ni1DrP8MW+WLXa
 hLYw==
X-Gm-Message-State: AGi0PuZgI1EHM5HrMmVUPKlplfoOLYwTUaC0HDV2/X1SXOlgyuct/R75
 pRpbxD8ZNPOGRaYw4hClAgw=
X-Google-Smtp-Source: APiQypLfNhHJHoTSTVVXkhevMfz86rU1oxpinZmTVTbPaayaoFIvld11z1VAQAQw+UFyVHFSEcorpw==
X-Received: by 2002:a17:90b:8c4:: with SMTP id
 ds4mr7545166pjb.133.1588447907181; 
 Sat, 02 May 2020 12:31:47 -0700 (PDT)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id 138sm5034358pfz.31.2020.05.02.12.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 12:31:46 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pavel Machek <pavel@denx.de>,
 Allison Randal <allison@lohutok.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: line6: Add poll callback for hwdep
Date: Sat,  2 May 2020 12:31:20 -0700
Message-Id: <20200502193120.79115-3-anarsoul@gmail.com>
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

At least POD HD500 uses message-based communication, both sides can
send messages. Add poll callback so application can wait for device
messages without using busy loop.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 sound/usb/line6/driver.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 86adf87d57f0..7629116f570e 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -630,11 +630,27 @@ line6_hwdep_write(struct snd_hwdep *hwdep, const char __user *data, long count,
 	return rv;
 }
 
+static __poll_t
+line6_hwdep_poll(struct snd_hwdep *hwdep, struct file *file, poll_table *wait)
+{
+	__poll_t rv;
+	struct usb_line6 *line6 = hwdep->private_data;
+
+	poll_wait(file, &line6->messages.wait_queue, wait);
+
+	mutex_lock(&line6->messages.read_lock);
+	rv = kfifo_len(&line6->messages.fifo) == 0 ? 0 : EPOLLIN | EPOLLRDNORM;
+	mutex_unlock(&line6->messages.read_lock);
+
+	return rv;
+}
+
 static const struct snd_hwdep_ops hwdep_ops = {
 	.open    = line6_hwdep_open,
 	.release = line6_hwdep_release,
 	.read    = line6_hwdep_read,
 	.write   = line6_hwdep_write,
+	.poll    = line6_hwdep_poll,
 };
 
 /* Insert into circular buffer */
-- 
2.26.2

