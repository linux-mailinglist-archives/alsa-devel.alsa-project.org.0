Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C242339CC59
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 04:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B6D1736;
	Sun,  6 Jun 2021 04:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B6D1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622948325;
	bh=J0JVC8IrNFhvCSeNwrD98/SSkhP6t+CoTG4Dp2zAyMk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jmOrv0TeDjKM4f5C002+Q1jfxJXl2IFs5IvLAIlNRHIHPSByT2SIT10trnlP/2WcR
	 YPErwesBHjkX80ZbkxMnGCCEULvOYrUYe3GlhafhtdKFC+koEismNlgxPFOO7kgyQD
	 O27YY0LBsKwvKOzB/PVqNb7b5WLuowSbSmpKQqg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C26DF80227;
	Sun,  6 Jun 2021 04:57:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC78F80218; Sun,  6 Jun 2021 04:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CA61F80103
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 04:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA61F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GP93Xprs"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HyZiwDDP"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 478BA1ADE;
 Sat,  5 Jun 2021 22:56:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 05 Jun 2021 22:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=UhIxHU70sGBKj4UvNzYu+U5RD1
 I5cMjzJs+YyMzavL0=; b=GP93Xprsk6Zi3X3jdR4vZiF5QKTIuonc4OJf9w8DVC
 dFPeuzdQ+LSZKpKZA4GTxux95PfdwYN+Xg7su9No9yusEADIlfMC3NVhnN2iH836
 o6qeuuF36HQLCKL4zvAG57rD+/GS1y3WYVjQfW1MBqa2gr8mPekhfoEq3TLc6F4z
 no+2yOE8dVOD18maNjS8wIBiFOff7I8kJqDzswQ5D48oLpdZ21IurJSJrR8GHmIW
 itFUs/GMVXF84SHv1vugLfV7IAG8euSkU1Lh1wl14A/e7cL397PpObkrDjO597oO
 oqXpFqSnfh7eR66nEGRRkNA654N2QPXwjNgKxYGUlNlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UhIxHU70sGBKj4UvN
 zYu+U5RD1I5cMjzJs+YyMzavL0=; b=HyZiwDDPgD/E3Qjuht+eGeIRgrc7qmdUS
 QPkMiUoHMJyjYUGuQzS+Bz3Crvtg634U7c7gJFUxvZ5yr9Vzg0tp3wX6kCU+41Yq
 Y9m8tXYGQ56aoI5ujFyyCMEldXUFtIP7Nm2iOCFaMsAa6v4Kn/nX0YbvV4UFCI9W
 lhLFcpaWEgzfIK6YCrf21lyhF4AQIQWM+D+vAnY3sJ+J0hwZuHDvw2HwghEkgG4D
 UvPLQUIbi5isnW890crzZfH3pOIYu+7ZxEY1wXvDDYJKbPNRpnythbZX0ddAhR1s
 UVrrS60qMbxloxBDKEvSQ4eoApeasDpT0LgvW9jTi1pbAKFKgirYA==
X-ME-Sender: <xms:dzm8YLar3Pb_GkJeDSH-o7SNDjiwGdTHZng7MIuTE9MswWXRhV0bBQ>
 <xme:dzm8YKa8-MUrbpQsq8T8-kQqBM6995roA-hUHf5KbLWTfTkKV3hga6ccksFdLqt5q
 Z0S8NRFnMCDAqZJt9w>
X-ME-Received: <xmr:dzm8YN_OzZjNy4fhfawdbYBYJAijCQV8P3JSlMNNp_XxewRRYhUlH_rwr2Mob21cwb_QYWnxvjThOSq48S9nXlIG6TuPazaMLnMVe45Iz_KDG5P40EC2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:eDm8YBrb9FOxG6xbmsECvH6PRdW8jJciqT4fxYBwInPV-wzTvZGoTQ>
 <xmx:eDm8YGpqVoD8lwFtMRG27i6mVRb7gTcakoJSGAxNh4T-hWdzdly-DQ>
 <xmx:eDm8YHQnBc-nUCT6-1eFpog2SA4L-TMwF-uCQ3Huz99vdnhE_sQcKA>
 <xmx:eDm8YLBvvtJba6YHa-G0wzbfvyXfIfSHjkzF80MwZ5L08si3GGAAXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jun 2021 22:56:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-lib: remove useless operations for kernel
 preemption
Date: Sun,  6 Jun 2021 11:56:51 +0900
Message-Id: <20210606025651.29970-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
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

In all of drivers of ALSA firewire stack, the callback of .pointer and
.ack in snd_pcm_ops structure is done in acquired spin_lock of PCM
substream, therefore already under disabled kernel preemption.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 945597ffacc2..1c566ddf0776 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1751,13 +1751,8 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 		// Later, the process context will sometimes schedules software
 		// IRQ context of the period_work. Then, no need to flush the
 		// queue by the same reason as described in the above
-		if (current_work() != &s->period_work) {
-			// Queued packet should be processed without any kernel
-			// preemption to keep latency against bus cycle.
-			preempt_disable();
+		if (current_work() != &s->period_work)
 			fw_iso_context_flush_completions(irq_target->context);
-			preempt_enable();
-		}
 	}
 
 	return READ_ONCE(s->pcm_buffer_pointer);
@@ -1777,13 +1772,8 @@ int amdtp_domain_stream_pcm_ack(struct amdtp_domain *d, struct amdtp_stream *s)
 
 	// Process isochronous packets for recent isochronous cycle to handle
 	// queued PCM frames.
-	if (irq_target && amdtp_stream_running(irq_target)) {
-		// Queued packet should be processed without any kernel
-		// preemption to keep latency against bus cycle.
-		preempt_disable();
+	if (irq_target && amdtp_stream_running(irq_target))
 		fw_iso_context_flush_completions(irq_target->context);
-		preempt_enable();
-	}
 
 	return 0;
 }
-- 
2.27.0

