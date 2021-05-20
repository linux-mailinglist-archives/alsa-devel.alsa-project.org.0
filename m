Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29925389C4C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A98B21697;
	Thu, 20 May 2021 06:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A98B21697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483490;
	bh=MBheSRMfo1iJqiyjCWmXGHsatnZ1aYpeETK38XE8kHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1I+rkGCk+CuFZ2YoGYLzXp9pLeAyLMKcKqqb/9cawV4nCDAlo5CELAnuS5sYZcEU
	 bH9MWjMhzOAHPfoWi2MqF4i4vu4ikNm8ftQvCXnyePxVx4TIV+KdE9wfhoLQBJYYgA
	 gI23Fj+GcuyO0Q76792RamxCqg4H/X5aPMxeq15A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB55F80229;
	Thu, 20 May 2021 06:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5746F804A9; Thu, 20 May 2021 06:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEA7DF8027D
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEA7DF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KXNW3P9z"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kjautImZ"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 31DF65C00A2;
 Thu, 20 May 2021 00:02:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 20 May 2021 00:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zFnH9HBMkAybB
 6G22c/7nyW4VIm1oQyZWi5rDfOEv/I=; b=KXNW3P9zA8cjH1AOhDb0cO9TJ1FWA
 +/7TVxm5X00h80FDU6P2ZIeixSR5WegTOcMEv4viT9N6YUzQeTwjayFJXImLcPmp
 EzxveFwd6RjXaI8J3d/9dZ3oj93/w1DqtjjXNBMFld8Do7gGKtva0vKdJRVKzffI
 xksG6eEXIcB7vLbGeqCydn5QpHPHyoMxLoSEhYDqZZxmZ2Lz5xS95WG83scMfB75
 mZlbncxKEHjT1G0oEjkGO1dWeHDdlBdtEhaD1o2+GIxR6iADfR4jgwjrHNtr/rdc
 Ppi3FPK2dcBObXAhbn+VMUHfYXK7bRs4HC59cxuOcFM8O3bRfavsm2BdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zFnH9HBMkAybB6G22c/7nyW4VIm1oQyZWi5rDfOEv/I=; b=kjautImZ
 Jt3Om0xQpTpb7MtQNJF6zuyptqBzBp32zi2JdpZdcS0HuLmr3Peod4ei0HPWKNLY
 SZa6UE6nv0JyFDFp+eGKbfTxe4pCkCoF7jHf0bc5gU9DBrnUWCazYYOaWS5FR1hC
 +HBvdiUt3uI5Cqfw3GIames8kcLOb+rNTZxwsJdr6yKbe4m5pcQxzk2SMwa0+znU
 uTWrAQMl9DoP21B4EgJ/Xa76fdo/TEpaSb4E5bP1M/9arLQ5+ld1YoufIf7QySS3
 GldiZCUe/Rsd2Xa9reJf+kSqnSnjP532N4JFGeBwExS25lgxg4+htDAuznl9+XQZ
 QIx4IXloigmoUA==
X-ME-Sender: <xms:P9-lYDzY_YrlAFBURzr_6x1OR17wvaZANxJspjNwrWb6vDIin_2qzw>
 <xme:P9-lYLQVoeXaHr4tNRP__3pAWcVuElt26KalFNRjVbNzyxJ6azLYlXDObnzcitO0B
 PCqS3R8fPWpfjw9OM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:P9-lYNVNZpBZRsYNsO58Mh3zO25dxC0netjfkupZuoK96fdRLsk8fw>
 <xmx:P9-lYNjtuyAFH9e2yOvCarXJx5dDn_yxOf_liO26v3OBlzil_xn-rw>
 <xmx:P9-lYFAZGJep50bGApH9zIfXu29LzU7Q8L4opsdjQLa1kHDKzfzMFQ>
 <xmx:P9-lYIpwndpyyonbKYx-Zwlzert9YtZahQvYfQFqNVShOlimI2UunQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:02:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 6/8] ALSA: firewire-lib: code refactoring to start several
 IT/IR contexts
Date: Thu, 20 May 2021 13:01:52 +0900
Message-Id: <20210520040154.80450-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
References: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
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

It's several hundred cycles from starting isochronous contexts and the
actual cycle to start processing content of packet. It's useless to
start the context for IRQ target apart from the other contexts.

This commit refactors helper function to start AMDTP domain in the point.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 37 +++++++++++++----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 48ed9612407f..b244fd863ca9 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1223,8 +1223,6 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
  * @s: the AMDTP stream to start
  * @channel: the isochronous channel on the bus
  * @speed: firewire speed code
- * @start_cycle: the isochronous cycle to start the context. Start immediately
- *		 if negative value is given.
  * @queue_size: The number of packets in the queue.
  * @idle_irq_interval: the interval to queue packet during initial state.
  *
@@ -1233,8 +1231,7 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
  * device can be started.
  */
 static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
-			      int start_cycle, unsigned int queue_size,
-			      unsigned int idle_irq_interval)
+			      unsigned int queue_size, unsigned int idle_irq_interval)
 {
 	bool is_irq_target = (s == s->domain->irq_target);
 	unsigned int ctx_header_size;
@@ -1298,6 +1295,9 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	if (s->direction == AMDTP_IN_STREAM) {
 		s->ctx_data.tx.max_ctx_payload_length = max_ctx_payload_size;
 		s->ctx_data.tx.ctx_header_size = ctx_header_size;
+	} else {
+		s->ctx_data.rx.seq_index = 0;
+		s->ctx_data.rx.event_count = 0;
 	}
 
 	if (s->flags & CIP_NO_HEADER)
@@ -1341,7 +1341,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		tag |= FW_ISO_CONTEXT_MATCH_TAG0;
 
 	s->callbacked = false;
-	err = fw_iso_context_start(s->context, start_cycle, 0, tag);
+	err = fw_iso_context_start(s->context, -1, 0, tag);
 	if (err < 0)
 		goto err_pkt_descs;
 
@@ -1559,7 +1559,6 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
 	};
 	unsigned int events_per_buffer = d->events_per_buffer;
 	unsigned int events_per_period = d->events_per_period;
-	unsigned int idle_irq_interval;
 	unsigned int queue_size;
 	struct amdtp_stream *s;
 	int err;
@@ -1598,26 +1597,18 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
 	d->last_syt_offset = TICKS_PER_CYCLE;
 
 	list_for_each_entry(s, &d->streams, list) {
-		if (s->direction == AMDTP_OUT_STREAM)
-			s->ctx_data.rx.seq_index = 0;
+		unsigned int idle_irq_interval = 0;
 
-		if (s != d->irq_target) {
-			err = amdtp_stream_start(s, s->channel, s->speed, -1, queue_size, 0);
-			if (err < 0)
-				goto error;
+		if (s->direction == AMDTP_OUT_STREAM && s == d->irq_target) {
+			idle_irq_interval = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_period,
+							 amdtp_rate_table[d->irq_target->sfc]);
 		}
-	}
 
-	s = d->irq_target;
-	s->ctx_data.rx.event_count = 0;
-	s->ctx_data.rx.seq_index = 0;
-
-	idle_irq_interval = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_period,
-					 amdtp_rate_table[d->irq_target->sfc]);
-	err = amdtp_stream_start(s, s->channel, s->speed, -1, queue_size,
-				 idle_irq_interval);
-	if (err < 0)
-		goto error;
+		// Starts immediately but actually DMA context starts several hundred cycles later.
+		err = amdtp_stream_start(s, s->channel, s->speed, queue_size, idle_irq_interval);
+		if (err < 0)
+			goto error;
+	}
 
 	return 0;
 error:
-- 
2.27.0

