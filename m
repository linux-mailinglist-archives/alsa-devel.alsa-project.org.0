Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163A9442950
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 09:27:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4FF716B9;
	Tue,  2 Nov 2021 09:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4FF716B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635841630;
	bh=Zgy+3gAR849m3cjS0YPUYrwCriSjvyb+Adu9TupfIgE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aXEQwKHTTE6thCUBu3NXHQPhY+Tot1QF01tKFsJdudWRfqSz/xzA8mlL+mj1/o1jr
	 nMndKF8D/PvS+9ac3OXpf3UJ/BqQynNdSnESEoBm5xF6AzaIcW5YzoDZjiVfauu5Nb
	 dc86Y4IkXE6v7GgMQLjfFuerqNDe/UZZBF1IN51U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A582F8012E;
	Tue,  2 Nov 2021 09:25:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE037F8025F; Tue,  2 Nov 2021 04:32:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D691FF8012E
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 04:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D691FF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f9u5ZqQM"
Received: by mail-pf1-x42a.google.com with SMTP id o14so4828356pfu.10
 for <alsa-devel@alsa-project.org>; Mon, 01 Nov 2021 20:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=EEtgEXOACUA3wKgJhhNtGNwsVVeGXT8yNYslnmQWcCk=;
 b=f9u5ZqQMRscLfivm6j2Nct+cObOy/UZGbS5T4Pi580A/n7atUi1PCx6+1G36J367uT
 /WW14bqFLXYyRJupCzQf26JBHnwguiXfPAK+UvpPQ5CSjwDCWI0DkYm85b/9di08A0h/
 5WiayzrfmhSkoi+FfFsqK3ZGFwL/46Iq0GLw7/HPzzIRqpma0dwOd2LOSMbIR17G0B70
 LXJGgTcl3WiEvQGsWrRcky50MzXCxzb+h/A8849SzrhGA7opPOs86KSKNlmwmo9rnntd
 j+99mD9rp8KLzE6c8CaARSB7dxZ8ty5O7o3MEw4Dz70uW0ryrzi2dy3LRHjDWeZXW2IV
 j2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EEtgEXOACUA3wKgJhhNtGNwsVVeGXT8yNYslnmQWcCk=;
 b=PUxvwl0hWX0Rs0Qz263BJnBvGjL0kIq5i2Kg/gGbrWXDlusTSUW8mo0VjWqbekScTn
 FduRN8yed0CC9wDR/wTXbqzlczZi5/Z+wlNO41uFy7bqLnpqVHn6WfvMsWUg6fl0Facf
 LRbvQVI9bBVHmpD7RXyvQJFz7OL6ACBt1cdwD+Dg62hk0moqewSBUphnudpCCcRy6/vz
 hWVLCmRc64j5VbFjoH0NfKzQWSnIvCA/jtrBzECSdOs1ogNtvUbGY6Qb2mLAU9T1tyNq
 Az0uEK/ev0jWqVuRdZZJ8xyrdj2tyS1R+JgqXTgGbBnVDeUX1EoKVHfWZEvVprNS+/sa
 ePkQ==
X-Gm-Message-State: AOAM532GVS3Z032BYyNyyOPLqro25uGRZwUYQIihUsocrVXIceKkwoJe
 091Oq5/pXvgudzt5Byb0Ebw=
X-Google-Smtp-Source: ABdhPJx0rqGpL+96sH9guHKoU1KDdgjt8V/3RIX2d8+BiZ8N5riUsa5Fn6nlnDXVmEEwHg9D6CAXBQ==
X-Received: by 2002:a63:455f:: with SMTP id u31mr5567894pgk.206.1635823948233; 
 Mon, 01 Nov 2021 20:32:28 -0700 (PDT)
Received: from BJ-zhangqiang.qcraft.lan ([137.59.101.13])
 by smtp.gmail.com with ESMTPSA id c21sm3937785pfv.119.2021.11.01.20.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 20:32:27 -0700 (PDT)
From: Zqiang <qiang.zhang1211@gmail.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: seq: Fix RCU stall in snd_seq_write()
Date: Tue,  2 Nov 2021 11:32:22 +0800
Message-Id: <20211102033222.3849-1-qiang.zhang1211@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 02 Nov 2021 09:25:50 +0100
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
 sound/core/seq/seq_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index d6c02dea976c..f5b1e4562a64 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -263,6 +263,7 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
+		cond_resched();
 	}
 
 	/* Process time queue... */
@@ -272,6 +273,7 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		if (!cell)
 			break;
 		snd_seq_dispatch_event(cell, atomic, hop);
+		cond_resched();
 	}
 
 	/* free lock */
-- 
2.17.1

