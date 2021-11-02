Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D7442B45
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 11:01:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C080E16CF;
	Tue,  2 Nov 2021 11:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C080E16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635847292;
	bh=x3vZTTdEsT8NEMYV2dp48LFOcdH4kd8OGs7uGVk31J8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Su56tTVnkPy+8qvfrrAkQL8AXQBonWFB4GxHhK+LBpqOR5cOslEQqmDkQRYb/5xr6
	 P2DoBdjnwnoxdY1uJfAd7Xa+clesrgEAphb0GsN4mBdOvrUeXATNN4rBerlhjKI5hd
	 sy7eeR3sb8E5KAgjIDKOFP6PoRUOu+zPQVWzt4YU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA3BF80224;
	Tue,  2 Nov 2021 11:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FEABF8025D; Tue,  2 Nov 2021 11:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ACDEF80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 11:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ACDEF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OaZ87Gej"
Received: by mail-pf1-x429.google.com with SMTP id t38so953416pfg.12
 for <alsa-devel@alsa-project.org>; Tue, 02 Nov 2021 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=JpTyGYnff/5miun0g61C6IcTX8F0aNJvJj2eVkMxvhU=;
 b=OaZ87GejHK9lo+qBFKeYET1LmjJ2+z5pq2FkNimcTEj4hwzuGTrDqOr4cszXqebtS6
 NPnLD92dSg+E236N7oAmvOxDA9YLEAwDpRS9HcyanMOaOd60dJI+yzaJsr98B8kF2t0E
 nRDUxynghTgr18yWZA5grBqqlpnN4TxAO1aUvoZgGnAXHdhHFh2ZgtbMUG5dgfnwQNpq
 fGajTCWpxEjlhoWT6UpBZO2FrL07j/aLE692ioMebNMk5equZKzfd5NT6jBhMJaZrr0v
 VI0o67fhjdue2dhKNmDgwZf0fFqHWA6AeLzGL50W5Gl9KpGgv8M/hzses9uPMNsNoZOy
 Qc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JpTyGYnff/5miun0g61C6IcTX8F0aNJvJj2eVkMxvhU=;
 b=TUSvxWL5ysKPQ1ROTeZzIaTFLgOKhwJRwUj6J4eHF148IVptcEwfDkzUg9oyWIFpvs
 YGCZIe/JpdKq1QC2FCIp6zu8a07eABRYa5op9XUuTIq5JOxhAXEGdR7zJwT3f2OEw4ak
 Iv8GT3A84BtfSmZWZE2LvhDyjm+U5pXxVdrV4wenTTfzUsZsMO9xcfzNs6hh5iH8hjBS
 yZmgsVP2Ysbc47iuLQbI90w81gkfH3lnxZS2pFV87OZM9bI6gwnViNgUyYgROni1bf9U
 gXHDNcMRPQxNT84Us5SIeniZdeX+TrKaWD/bgBsaJqWRszNCHiMnM68TOpXY05ghygBe
 1cyg==
X-Gm-Message-State: AOAM531hGCYfwTUoep1l21m2vaF354/AzRbXLAwDH/cnGOAVxSis1Er+
 96skiolIS9uRbz0oItuDFy8=
X-Google-Smtp-Source: ABdhPJwCWI/5Qq+20VTAWY790ex7XZTcC5l+HGCxwBioFFFqY8ChuQReqyQ+/YcIlL0BiC+ba2i8Ow==
X-Received: by 2002:aa7:8019:0:b0:44d:d761:6f79 with SMTP id
 j25-20020aa78019000000b0044dd7616f79mr35580155pfi.3.1635847200638; 
 Tue, 02 Nov 2021 03:00:00 -0700 (PDT)
Received: from BJ-zhangqiang.qcraft.lan ([137.59.101.13])
 by smtp.gmail.com with ESMTPSA id ml24sm1921607pjb.16.2021.11.02.02.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:00:00 -0700 (PDT)
From: Zqiang <qiang.zhang1211@gmail.com>
To: tiwai@suse.com
Subject: [PATCH v2] ALSA: seq: Fix RCU stall in snd_seq_write()
Date: Tue,  2 Nov 2021 17:59:55 +0800
Message-Id: <20211102095955.30060-1-qiang.zhang1211@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Zqiang <qiang.zhang1211@gmail.com>,
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

If we have a lot of cell object, this cycle may take a long time, and
trigger RCU stall. insert a conditional reschedule point to fix it.

rcu: INFO: rcu_preempt self-detected stall on CPU
rcu: 	1-....: (1 GPs behind) idle=9f5/1/0x4000000000000000
	softirq=16474/16475 fqs=4916
	(t=10500 jiffies g=19249 q=192515)
NMI backtrace for cpu 1
......
asm_sysvec_apic_timer_interrupt
RIP: 0010:_raw_spin_unlock_irqrestore+0x38/0x70
spin_unlock_irqrestore
snd_seq_prioq_cell_out+0x1dc/0x360
snd_seq_check_queue+0x1a6/0x3f0
snd_seq_enqueue_event+0x1ed/0x3e0
snd_seq_client_enqueue_event.constprop.0+0x19a/0x3c0
snd_seq_write+0x2db/0x510
vfs_write+0x1c4/0x900
ksys_write+0x171/0x1d0
do_syscall_64+0x35/0xb0

Reported-by: syzbot+bb950e68b400ab4f65f8@syzkaller.appspotmail.com
Signed-off-by: Zqiang <qiang.zhang1211@gmail.com>
---
 v1->v2:
 Add atomic context detection.

 sound/core/seq/seq_queue.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index d6c02dea976c..3a05b5e0d555 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -263,6 +263,8 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
+		if (!atomic)
+			cond_resched();
 	}
 
 	/* Process time queue... */
@@ -272,6 +274,8 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
+		if (!atomic)
+			cond_resched();
 	}
 
 	/* free lock */
-- 
2.17.1

