Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54C638E35
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:24:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5966174D;
	Fri, 25 Nov 2022 17:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5966174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669393479;
	bh=m+SGYFsNCNX8Cl+0fjfjQ3Nk9dTHamdszPIm+dlWRBg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UrWDCJH3z+/OybzsjNnNRwvz74hPyCCGNpUddqPv/st4Ok7S1b0VgvR6DhcLMiNm6
	 fDI+iBKWKqBVTY2u5AoiTQvQ48omGHN+C5mAkUT+3UM+FxC2Q08wYST8vQgG7RdEYu
	 XK4o+1tB1iMSCmPVScaVXX7bN8LlTxOWkc92GZSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FBB0F800B6;
	Fri, 25 Nov 2022 17:23:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A182EF80236; Fri, 25 Nov 2022 17:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C29CF800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 17:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C29CF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="6HbA3xg3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=1Xj0qjpg+yYr8OjlhmKxIIj96tMZd7CEOEmBe02j11k=; b=6H
 bA3xg3vdbdYp5Yh9noPb0H6/F1luuPvfrxfMy4ClgzliniIhcPYhAgerJ5Oca2lP35GacrYuO+cWR
 q72o9ENIITLIzi6BDYVK7H1/murC2nK7UPBPWHS0+U25Gw6/sXiBtymyKt9nHp3FBc7ADRQdNRUqB
 exGE0V0YxmdVK9PUDQ7aX3gTnMlN3U3xBUSoLj9MQsLTm0Y1SEblvxjvQPBAzHyxHM4uKMrinRlfu
 8MrMyfi8u8R2XwvmDYQ3R4QHTm8XSJp5RPUrknnYMB96k3Zh1SciIZELkaTl0Msx7UQQltUvlT2vz
 W8izeRcwyXbWSq56Bn9DYD6rDY8RKIOg==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oybUD-0002ir-Ud;
 Fri, 25 Nov 2022 16:23:34 +0000
From: John Keeping <john@metanate.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: fix tracing reason in hw_ptr_error
Date: Fri, 25 Nov 2022 16:23:26 +0000
Message-Id: <20221125162327.297440-1-john@metanate.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Cc: linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>,
 Takashi Iwai <tiwai@suse.com>
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

Strings need to be specially marked in trace events to ensure the
content is captured, othewise the trace just shows the value of the
pointer.

Signed-off-by: John Keeping <john@metanate.com>
---
 sound/core/pcm_trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm_trace.h b/sound/core/pcm_trace.h
index f18da2050772..350b40b906ca 100644
--- a/sound/core/pcm_trace.h
+++ b/sound/core/pcm_trace.h
@@ -88,19 +88,19 @@ TRACE_EVENT(hw_ptr_error,
 		__field( unsigned int, device )
 		__field( unsigned int, number )
 		__field( unsigned int, stream )
-		__field( const char *, reason )
+		__string( reason, why )
 	),
 	TP_fast_assign(
 		__entry->card = (substream)->pcm->card->number;
 		__entry->device = (substream)->pcm->device;
 		__entry->number = (substream)->number;
 		__entry->stream = (substream)->stream;
-		__entry->reason = (why);
+		__assign_str(reason, why);
 	),
 	TP_printk("pcmC%dD%d%s/sub%d: ERROR: %s",
 		  __entry->card, __entry->device,
 		  __entry->stream == SNDRV_PCM_STREAM_PLAYBACK ? "p" : "c",
-		  __entry->number, __entry->reason)
+		  __entry->number, __get_str(reason))
 );
 
 TRACE_EVENT(applptr,
-- 
2.38.1

