Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEDB3A22B3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 05:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6C21716;
	Thu, 10 Jun 2021 05:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6C21716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623295206;
	bh=C/tPoCEFLvjz1MT7R40JTrabOAMaWPK/Hv2tNLGNmqw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwH/M+49OGXQDO4eq0RX0PJGmVjoyX8bOxfa0UmLvQbruzcaed8afVvtT19XsL4u5
	 Ju+d/6C/XFehjsBW+G4bs/klcJ4F/Q28nBUWnG2Vaez1uPYDeg25nzWdKH8dGVdrCr
	 KEvKB+mq7+S4lWN2DZtwq/5OpkYuuOjhZWkhlqR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 593D5F804CA;
	Thu, 10 Jun 2021 05:17:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8647F80218; Thu, 10 Jun 2021 05:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E217AF8020D
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 05:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E217AF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="TukHHJzl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k8QyW9wb"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 154A55C0138;
 Wed,  9 Jun 2021 23:17:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 09 Jun 2021 23:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Pd+0x1YQKAU48
 1gKY2aPEc+4cxFyhSgyLBETHaxL5Mw=; b=TukHHJzlW52Vj4Na4ChcRgeg1AnNb
 OfET+3Z0ui5ZQ2JiwIattWdhcTSEWDfEB8azxaZjitDFPIjacnK/M2fzr6gqaz3B
 uYTci+O+OtzkZy581NgZQMeck2BU4rX1SGBXQlF1sWOcAuFwX3xugMjFAADFcqBK
 fkIvjHVKPZruHW/3zMqHWR1e1PJGJr3Ryv1N4r6deVGfX9ELRBd5Lej3+6lI67oH
 S6jd3X1DdK857sloJ7bsxQ20QXaIEcfzvVVBea01smQzmZ8cBO3vLuq14lqc2TDT
 6dmUKuhi41wKLxf11Z+sl19gKaUgfQZyq4UQpLnm0/jUBxoCZE+aQUqlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Pd+0x1YQKAU481gKY2aPEc+4cxFyhSgyLBETHaxL5Mw=; b=k8QyW9wb
 T4Wyb6GOI7nVIsP0etzZH6UAAB8VHE6OoIuAeko7INdZMt2P+HUmfelsyM35WqqL
 YrsozSbgYl0YgCxNAZzYuYVvSrL8Wiq4DTno33viUqNsubkXm8K6UFaXY896x4GZ
 NY9U7o+hba7+CFfw7O/cXW1BHWGYFxxX/V+wq0AIftjjyReu9Cn7OozGO/AbMykR
 vOsUyXMFA8GkY1yCn7sdubNc5EV6C1gZ8doETC1ArTGMHZRc1KZzLikX3JScswPJ
 CMM+o+ApvlgEx6WMWSHx6cBICS77W1AUiLylfBCFugJ99b+jNfkf2wzQ2eT2iB+F
 6UagyiSLRIG9nA==
X-ME-Sender: <xms:VITBYDTez9vYpndfphhhyColpTloXunrqSHXhlM_wB7xxT4ziCW6zg>
 <xme:VITBYExwCpEzzW6S4Q58ZvkD0PqCBf9EW0yoij-AqUd6hH6Zc-Xa3JVoUgV8QcyPP
 KPc6J4ugGZ2aUFsQNg>
X-ME-Received: <xmr:VITBYI1wxocGGPjRsVLRiYJMOl4BBwVFQ6h5W9RaaWMim7Z-348Eti5wRyZ8M-CYZcrf5c1ZWWmfGp3yH5qja4q4suqG2GFWORExmHULlsbwKt-AUouM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:VITBYDAGfGVrrsVVfE4RpNFSCq2LsvZEaz8VeBIyuSQ6P0sfxB3SrA>
 <xmx:VITBYMiG4TM9LiaADjeHitSPy0V8ascFKfkt5y-LUPkY48mD24y-2A>
 <xmx:VITBYHqvZOfX7PDUsBar6gaacxaKmEYA5NsHNsMhigqypi9Odl_J6A>
 <xmx:VYTBYIanG-0FHbJ8mz_t28FITt6NoTWa9sBsKb-Gcf0aTSaKwAPiHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 23:17:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 2/3] ALSA: firewire-lib: operate for period elapse event in
 process context
Date: Thu, 10 Jun 2021 12:17:32 +0900
Message-Id: <20210610031733.56297-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610031733.56297-1-o-takashi@sakamocchi.jp>
References: <20210610031733.56297-1-o-takashi@sakamocchi.jp>
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

