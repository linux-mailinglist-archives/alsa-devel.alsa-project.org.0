Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D03A08FA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 03:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB18916C1;
	Wed,  9 Jun 2021 03:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB18916C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623201925;
	bh=+wOH7ysXvSX9e3eVeuuM0umACJu138L1Otu7HhQXXQA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pG0YA/AF0d5NrgkQP5H3Cn8xhmSkc5Y15L+7RxAH4+OFv0us9cnwFcUPnbnftTh7Y
	 GAxLaWMINa7UIKJWS8bPgJA1xguZFFpfs1BA7yFmDbUbCO/ykhgOoZEVeKGelC7LfW
	 DGzuRoVbr5rN12kpjAEW1gDFHWN23Lhq9j0zguao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 142E4F804CA;
	Wed,  9 Jun 2021 03:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 264F0F804AD; Wed,  9 Jun 2021 03:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D0B6F80218
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 03:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D0B6F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="csPjiAAg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iQsuSXbw"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 779802084;
 Tue,  8 Jun 2021 21:22:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 08 Jun 2021 21:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=14m1Hwu1CXt0X
 +QjGXAt7PTOivEsvg0ce9HLAZhlOG8=; b=csPjiAAgvNjI2tR+8E8UBXn38REw8
 A1Esdk99eLq65SDIgwQHLzOA1T9AXIvaDXXjnGtyhlp5VCu+s5/wDuV+Sc2qexqD
 vnB9Nxm2+pADUlD66qnu2UaqbYE5C0VTO9t5oMquKg7jFv1PWkjPmVlPRIqHd9ab
 f76EWJmMVGQsU+J/crMmjQcgbvgqLZl0XD/OVrlmN2BmvyjttrM1GbF3TbqWLyor
 nj2iUNsF0xH3LDH9hl5aSFCKi6eryoFXsxOrr3HseGnsf7LYjYeD+gxrr9RBAHt0
 yHLKufX99NyPtzYILHplYkr0Jo6Xb2puuvVTQX7bS5KoDOSYiloohfk6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=14m1Hwu1CXt0X+QjGXAt7PTOivEsvg0ce9HLAZhlOG8=; b=iQsuSXbw
 vnVEyIFHleyvf1WaNQW2vuSiv4o5FNd319m+mGP0OftrMqAtNJce3PGND3zxAHyV
 2SUQZtnJCybdA78hm9fgs7hQcAzl9+HVke66aNlbydq10tV3lhVFaw+J4s23gw7x
 JTJXZZEP8KKO74nXlyELsIQmz4cIMn8m7cZffI0pg6DTns0hPS0Y/hngfN6+fUQd
 G9+os/icDW1EQWQ+eVqlGblMbmVwZ+hl8IOwFoiWfZAUz3ecBRWgORHZQP6+ALfd
 p6FM1x6a17qRqP+GoSnQcWJVaxm2jmC3GwjQNl1QlSbJbKasqc+Kb0pRSkNq52NZ
 RsmtpTuFM4g9gw==
X-ME-Sender: <xms:7hfAYOhqqTUj2wuZNFUavAPCPwoncH3aa_m7g1UTdDg_u2YrieFjqQ>
 <xme:7hfAYPAQBRUlQWv7pHioVHliwPir14xZUC3qnFx5GcvWTUMS6fZ_5laXgWYIeCR-y
 kee-UbX2N6myreNFl8>
X-ME-Received: <xmr:7hfAYGEuADWNpdfMOc5lFIn0HiZzWVTXZThz1ZPN06x3wugW7BTqanZspn4MwBZl3HCPQplHkV2adt-9uTRT2apOD5Z8ozNuizlhF3qLnvSqlNWGOE4J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:7hfAYHRRDt-5lBAgBcafUfvUwNDM9KnBf_xqWRaWWCucDfI9U17Q0Q>
 <xmx:7hfAYLyqesHlZOcvzpq21wnyfghekDZRj1KuKeIrQaoW1j2duX8p0g>
 <xmx:7hfAYF421oSQzeZGKgLyhnnQUVFwxJWE1PKgHMhqtYqlCzcc0ZAqkQ>
 <xmx:8BfAYEqXipI6r124S-XB9crWNml7Rh4SLjAlhDfYfZbdvXGDlRMJLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 21:22:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: firewire-lib: operate for period elapse event in
 process context
Date: Wed,  9 Jun 2021 10:22:43 +0900
Message-Id: <20210609012244.24296-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
References: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
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
isochronous packets of any isochronous context; in software IRQ context
for 1394 OHCI, and in process context of ALSA PCM application.

In the process context, callbacks of .pointer and .ack are utilized. The
callbacks are done by ALSA PCM core under acquiring lock of PCM substream,

In design of ALSA PCM core, call of snd_pcm_period_elapsed() is used for
drivers to awaken user processes from waiting for available frames. The
function voluntarily acquires lock of PCM substream, therefore it is not
called in the process context since it causes dead lock.

As a workaround to avoid the dead lock, all of drivers in ALSA firewire
stack uses workqueue to delegate the call.  A variant of
snd_pcm_period_elapsed() without lock acquisition can obsolete the
workqueue.

An extra care is needed for the callback of .pointer since it's called
from snd_pcm_period_elapsed(). The isochronous context in Linux FireWire
subsystem is safe mostly for nested call except in software IRQ context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 150ee0b9e707..426a85b56cf1 100644
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
+				// In process context of ALSA PCM application under acquired lock of
+				// PCM substream.
+				snd_pcm_period_elapsed_under_stream_lock(pcm);
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

