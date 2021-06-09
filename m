Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF143A1752
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 16:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E53516DE;
	Wed,  9 Jun 2021 16:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E53516DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623249232;
	bh=C/tPoCEFLvjz1MT7R40JTrabOAMaWPK/Hv2tNLGNmqw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ecERwXoHB7KttsUqYFZbTfHSyQLuTZM82bAcESSgToQinR1wcyf4A1eFxcCRk3gga
	 XcasZaQaYfhDMVX8jzrLZYdMhSu3Ov6XYolY9+/Ny0re7pMbpAo9h2AmWF8iUV61UV
	 6ZWXKTI3ss9H1zaw2qk2IOQsBcqmCV0yxhBcFw3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 363DDF8032C;
	Wed,  9 Jun 2021 16:32:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 642FDF800F4; Wed,  9 Jun 2021 16:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B826F80212
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B826F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cSEkUQVS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Lj9JLJbe"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 01C16964;
 Wed,  9 Jun 2021 10:31:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 09 Jun 2021 10:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Pd+0x1YQKAU48
 1gKY2aPEc+4cxFyhSgyLBETHaxL5Mw=; b=cSEkUQVS43R7wM9lz/ViI4G2qnXLI
 5sgDwiHR436LdLAiqZRPrCtJnRE9uygZ6SS7QGwZWr4nRPbQgqRfdzLDqyr0AlVy
 DleZeXDtkgB0qpxa6K9QeBZZxCb1wXSeEfq1viQEWM9b/hAc0E3EdLIina+aVSzQ
 /ZOlap+7/qp0AIKAjqCh7b+snILwAW7RmOK/o2+HHmPSdaMc3Vtv9cEdzrtH/Zhn
 Pl5YQ8oMvOgmNuOPxaeC1NIqp7IthYtSh/+3ElG6sOrr93DAH7FBJc/5tdBWTTbC
 i9UB9Hz9GCTbA8r3qkMQrS3HlR5UnO3cuAfr+kTBfEM4xClBIJus4XZjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Pd+0x1YQKAU481gKY2aPEc+4cxFyhSgyLBETHaxL5Mw=; b=Lj9JLJbe
 9/qvm1GFRoAjD56YvTMtQ+RVItA+e6EQdZNZGW2JznzKa0jYp8Hb19fu2yhKdI8I
 Ra1RRsSCPz84TAYtgZdA8Yub2KD81mRLmNGQiZzxLAR7YEjpQnXv8tUv6njfpauW
 DOY2uRuIwoI0TrKlBkxDF50dpmvKuhFPbbvwtUgx7KDcofSoTcGD/Q6md575aaNI
 VSI8r8i/ukzg7BAoPs5NeZr27YedkC8BD3x8SwA6wO6bS4liP6Vs0v93FD8XKHIl
 kiGdH+vl0I3AuVLkT5ATtUnoiD8TMvmHhieoZHJ275nZztZGiVaRv91qyU88IB2F
 btY4iOBBsS/lcw==
X-ME-Sender: <xms:29DAYLhM2nuEY8zPYtLWV7WCe09uhwB68RRnzgQgl2J0K4zj-pRM_g>
 <xme:29DAYIAWdm43wHdJ2X-pXZ4y2_DlDOM_5HG6kivlZaJIan86JkH0JBwk77DWIIa9Q
 9fbq6fm69pUi3FKg2E>
X-ME-Received: <xmr:29DAYLHs3tWp8CfrHOu8E4i0Ap42amzQf3SX4quZOKuaRJQ-SRlNQMmkjsVVj8MBXdLhGHjc1AnZFVAHiByagehuF4l6eQ5wIzCAk4cGhaaEUOYJkmG1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:29DAYIQ5oU4jaQrvZngEFy6WgrQ1cWu6asm17DBkf0lkN0GAJdq2CA>
 <xmx:29DAYIzZRQ6okH_2ZpZ4bbcGzhGk21ZFgiLBOAf3EMoClYcHNFWRXQ>
 <xmx:29DAYO4EKEsv3r7M0QpHIS70qVPFnb7VetmJBqHF0hnvNkkd8JlLmw>
 <xmx:29DAYFpx7KxuqJLoYVS9Vsl6I-zvHXnSpWDyI3x9AYqRlRZpGDwUHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 10:31:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 2/3] ALSA: firewire-lib: operate for period elapse event in
 process context
Date: Wed,  9 Jun 2021 23:31:44 +0900
Message-Id: <20210609143145.146680-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
References: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
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

