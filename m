Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779839CE60
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 11:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E22416E3;
	Sun,  6 Jun 2021 11:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E22416E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622971238;
	bh=65MAz9ZdSmbHVo4X/M6JQjEOwol9B9xmE9zYIOT6mjo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkm4b0vfGPPdqwy0S1h9ygVvLFgqC7p8i6XqJe+5kGYMYIWZhYvHHWHBxyzOB1mW1
	 N20iTErL5ZACylrjEHKDK224dY8jDGmGX29Eq9wU+61MftxYIBuQQKeMNsZXxkF6hb
	 EDA4DQXU9nw3jEgRFsFsE7QzK3nzUBj/L63dFgfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE01F804BC;
	Sun,  6 Jun 2021 11:18:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C640F80256; Sun,  6 Jun 2021 11:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F03C3F800C8
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 11:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F03C3F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="eL4f8MDS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MyNp7hx5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D1B25C01B3;
 Sun,  6 Jun 2021 05:18:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 06 Jun 2021 05:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=mfaXpaM4c4ID3
 Ic3X/jCI/AfCYY9GDYh3IAuyWUA+co=; b=eL4f8MDSEvw/OkOd2SBLuWsLAe7qL
 hzY9Edknw+HVX6zRa6gGpUja0uvdFuS0660HKJvngKVm9GbZVjo20CVVIH1c9GDR
 FFA4P5oN3CuX+9AqE/EWNI6dKSu3EJt91/WfoTW3np3p2KiFTT6zMt7RMzPNiEVB
 12jrC+7/h+0efu41pryoyTTE1p+Z7J76BmS2zMK/Jm+vosbn6j2LEuzI7BD197ud
 ZitVfM1KDUMCWVQt0lxUPs/cpwtEhxjQIubT2jA/U0HqDS7I+ey9Q+EdYWf9fPJA
 k6vTzimEQ2A/EkRUeA9phTdWJASEE0U0ZOMuGKsteaYSF7wczpLxe2dlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=mfaXpaM4c4ID3Ic3X/jCI/AfCYY9GDYh3IAuyWUA+co=; b=MyNp7hx5
 uIBg1HmXohuXSQo15zHbYWHMkCsmA+DvoDRyh7p4EKRWQdvm6J4P0cLDJQjfioCq
 Pc8QOXtUqX5z9SKjbj1Mg8y1nf1JmJGxwPRc1Hilh0UAt6D3ZW5oCFYLZk+Hs94h
 netf/rJ/qelK/svgJHVkvDWwf4r0iE+uSC2QtikHBF3hSYMPRhShltlhLK5uLmuf
 zyOpd/UeTpnX0p83A3dLf5HxfI2GufRNHgg2LB5xAVAB0kWm+6kX6Kd/wmSrwnbg
 /+6oci/ee5O7xZ6ZKag4dM6unAl8H5B9BcBdzJnl7y0gYP5YXkJ8Bm7GOnN025Gj
 dIYRIPpM++qB/w==
X-ME-Sender: <xms:95K8YHYQ8TPpeMZOsp4hjucL3tTDqlr0h2GG9RJYaJQqNHVEBpWFOQ>
 <xme:95K8YGYiLHuckjvbMbL3lseGmDJ2vhveIQFZLOboYVfq_9QYA00jNTZ48Ug2ydb6s
 8xv4qmYdfef8kLz6tE>
X-ME-Received: <xmr:95K8YJ-hGjomnxG-HchIODxzWAFPBKUgYd68-_bxt0NAC6eE6JYHui3I98GrE-IbH1gWUDwMSYEagKtlTxomronMsKparsJXkuzW34FjWBhuxuwF6Uoe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedthedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:-JK8YNoWA9ALfsz4xyVjceS8Qj6rHfjb3uQPhgmYjfYfHG7BKxX8iQ>
 <xmx:-JK8YCpbFLEOTSXE0TOnD9taZvBWsBRGwdGpYd94tKmh1uKf7rJk-A>
 <xmx:-JK8YDQpMaeiZs3D6QViLo95P_1ogo9VrvYgmTSt1zp6XBa8684-Aw>
 <xmx:-JK8YHBjcIr7xr0njBjsH5k4mOdR-yEajeB6y10_WYOx-cikaJBcPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 05:18:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [RFC][PATCH 2/3] ALSA: firewire-lib: queue event of period elapse in
 process context
Date: Sun,  6 Jun 2021 18:18:37 +0900
Message-Id: <20210606091838.80812-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
References: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

All of drivers in ALSA firewire stack processes two chances to process
isochronous packets in any isochronous context; in software IRQ context
for 1394 OHCI, and in process context of ALSA PCM application.

In the process context, callbacks of .pointer and .ack are utilized. The
callbacks are done by ALSA PCM core under acquiring lock of PCM substream,

In design of ALSA PCM core, call of snd_pcm_period_elapsed() is used for
drivers to awaken user processes from waiting for available frames. The
function voluntarily acquires lock of PCM substream, therefore it is not
called in the process context since it causes dead lock.

As a workaround to avoid the dead lock, all of drivers in ALSA firewire
stack uses workqueue to delegate the call. A variant of
snd_pcm_period_elapsed() without lock acquisition can obsolete the
workqueue.

An extra care is needed for the callback of .pointer since it's called
from snd_pcm_period_elapsed(). The isochronous context in Linux FireWire
subsystem is safe mostly for nested call except in software IRQ context.
---
 sound/firewire/amdtp-stream.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 150ee0b9e707..b39328eab67e 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -613,8 +613,16 @@ static void update_pcm_pointers(struct amdtp_stream *s,
 		// The program in user process should periodically check the status of intermediate
 		// buffer associated to PCM substream to process PCM frames in the buffer, instead
 		// of receiving notification of period elapsed by poll wait.
-		if (!pcm->runtime->no_period_wakeup)
-			queue_work(system_highpri_wq, &s->period_work);
+		if (!pcm->runtime->no_period_wakeup) {
+			if (in_interrupt()) {
+				// In software IRQ context for 1394 OHCI.
+				snd_pcm_period_elapsed(pcm);
+			} else {
+				// In process context of ALSA PCM application under acquiring lock
+				// of PCM substream.
+				snd_pcm_period_elapsed_without_lock(pcm);
+			}
+		}
 	}
 }
 
@@ -1740,22 +1748,11 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 {
 	struct amdtp_stream *irq_target = d->irq_target;
 
+	// Process isochronous packets queued till recent isochronous cycle to handle PCM frames.
 	if (irq_target && amdtp_stream_running(irq_target)) {
-		// This function is called in software IRQ context of
-		// period_work or process context.
-		//
-		// When the software IRQ context was scheduled by software IRQ
-		// context of IT contexts, queued packets were already handled.
-		// Therefore, no need to flush the queue in buffer furthermore.
-		//
-		// When the process context reach here, some packets will be
-		// already queued in the buffer. These packets should be handled
-		// immediately to keep better granularity of PCM pointer.
-		//
-		// Later, the process context will sometimes schedules software
-		// IRQ context of the period_work. Then, no need to flush the
-		// queue by the same reason as described in the above
-		if (current_work() != &s->period_work)
+		// In software IRQ context, the call causes dead-lock to disable the tasklet
+		// synchronously.
+		if (!in_interrupt())
 			fw_iso_context_flush_completions(irq_target->context);
 	}
 
-- 
2.27.0

