Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D09389C52
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCAB51686;
	Thu, 20 May 2021 06:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCAB51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483601;
	bh=kfheQhWWKBaJa+GjHdg4oQxwHM0Sv+j9CE3czu2oPSs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I4VwHZR3n2n/sI8ogIGJV9xqcSKtj6HN2tfw1Rc1JDlkO0F53loSPfAgYpLutP7UG
	 bTHjQoYP3gvi01rObrNwCjNLpwm0Z4Ll7mHtxFt8zI8BcijiwIoR64+LG7KqiqhDut
	 sGIW+Ss+6WYMiXNDD3+Q+7/t87TzV51m3zH4DTGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B33DF804E3;
	Thu, 20 May 2021 06:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81C34F80272; Thu, 20 May 2021 06:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93057F802C8
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93057F802C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="MoqICWdh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RlR707DD"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF1D85C00A2;
 Thu, 20 May 2021 00:02:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 20 May 2021 00:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=C4rSSz6ZpvGPI
 s0MmRj27i3xggR0vVj5hmEV2Swbfc4=; b=MoqICWdhll+9H19LqKij7B0IbSwg8
 JTEDkeFcVgJT2It90KcrIa0FNfapKHIkwUEvSZtD3L7MCLX13DZxeonXCqGJ6yM4
 r2aiNA8JdCdEHad8m3VcBG91jnRhB5rTUECf8vqd2hLT8QsiwUXxKC9w160qvslU
 yEYzKZEeQhO4LhkHKyGfiA3pBclhHICYI8ezqKACywPBBr9ISWmpQ2sy2kCocYBO
 JROd0o0CeOKgHmjEVmKXoQjc6Dsb7nydySU+nL6PC1LS6rhkBavnfOotZW/8abcv
 aqpBIXvS+Qqx0ONldffd4MD8ZChCOtIfy8or9a6eaxAzByS17XVieUJ5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=C4rSSz6ZpvGPIs0MmRj27i3xggR0vVj5hmEV2Swbfc4=; b=RlR707DD
 2lXNFovcBw5iEOSVOWyx0XkxqjRfn2f5s2kEhz+lBTHG+Q+WhqSkA9QrB3mwsJoG
 3D2p/MCM8YTGi5pYnYqvXkooN/IlbrXTwZHPtxsJP0uBHmUfPmhGHUnmHT1qi/oB
 oo4bMMhf1JmAWUesOcYbu81fhrGoCBmZEviBBtApbkp756IoRyJyKUF8NZY7JsQL
 UpvgvsxXxwW4GoKGTvyQ1BKuuPwZHHQRQHP3s0pcpVFqt92IK6YzALzvDSz2Xikc
 YtSjQqAX0SLWYXw7vfm3VbSoCtvuhoMKqQj906i2azdy9vC9yhaw9vDJcvdYK/TH
 Z9t/CtNhwfd8Rg==
X-ME-Sender: <xms:Qd-lYKlbJs7XP3zMxOLNvb3j1GymoNjS_AQD16ILgkd0xxO8J-1jtg>
 <xme:Qd-lYB35cJKaOgREH5W5KXOwwLA_JSoGKA2XRZXghdZr_HjcayBdWOobjqfJLb51o
 IvAZdChBijnJ-7nD44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Qd-lYIp3Bp65QpPoh5EjNuuUXVCYPLIpAdSanBs38SSQ0HUnLnO3wA>
 <xmx:Qd-lYOlNQjy_XlKVP47NPdVrXVCUGysZRZK_8fOf3-5j8lESOqZw9g>
 <xmx:Qd-lYI1GSlcA5cG7iy8ewhBxztSmswD0B1UgGZl0yZMLdX0_HRf2cQ>
 <xmx:Qd-lYN87U4gD54S06TfoGT7Iux4C_r2GcZyVWi6shD2HJXLXDzoPQw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:02:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 8/8] ALSA: firewire-lib: change waking up timing to process
 packets
Date: Thu, 20 May 2021 13:01:54 +0900
Message-Id: <20210520040154.80450-9-o-takashi@sakamocchi.jp>
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

When starting AMDTP domain, tasks in process context yields running CPU
till all of isochronous context get callback, with an assumption that
it's OK to process content of packet.

However several isochronous cycles are skipped to transfer rx packets, or
the content of rx packets are dropped, to manage the timing to start
processing the packets.

This commit changes the timing for tasks in process context to wake up
when processing content of packet is actually ready.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c               | 16 +++++---
 sound/firewire/amdtp-stream.h               | 44 ++++++++++++---------
 sound/firewire/bebob/bebob_stream.c         |  8 +---
 sound/firewire/dice/dice-stream.c           | 15 ++-----
 sound/firewire/digi00x/digi00x-stream.c     |  7 +---
 sound/firewire/fireface/ff-stream.c         |  7 +---
 sound/firewire/fireworks/fireworks_stream.c |  8 +---
 sound/firewire/motu/motu-stream.c           |  7 +---
 sound/firewire/oxfw/oxfw-stream.c           | 14 +------
 sound/firewire/tascam/tascam-stream.c       |  7 +---
 10 files changed, 54 insertions(+), 79 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e9bdb609f2eb..a6a7a72a2452 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -107,7 +107,7 @@ int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
 	INIT_WORK(&s->period_work, pcm_period_work);
 	s->packet_index = 0;
 
-	init_waitqueue_head(&s->callback_wait);
+	init_waitqueue_head(&s->ready_wait);
 	s->callbacked = false;
 
 	s->fmt = fmt;
@@ -1029,6 +1029,9 @@ static void process_rx_packets_intermediately(struct fw_iso_context *context, u3
 	}
 
 	if (offset < packets) {
+		s->ready_processing = true;
+		wake_up(&s->ready_wait);
+
 		process_rx_packets(context, tstamp, header_length, ctx_header, private_data);
 		if (amdtp_streaming_error(s))
 			return;
@@ -1145,6 +1148,9 @@ static void process_tx_packets_intermediately(struct fw_iso_context *context, u3
 	}
 
 	if (offset < packets) {
+		s->ready_processing = true;
+		wake_up(&s->ready_wait);
+
 		process_tx_packets(context, tstamp, header_length, ctx_header, s);
 		if (amdtp_streaming_error(s))
 			return;
@@ -1286,12 +1292,9 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 	const __be32 *ctx_header = header;
 	u32 cycle;
 
-	/*
-	 * For in-stream, first packet has come.
-	 * For out-stream, prepared to transmit first packet
-	 */
+	// For in-stream, first packet has come.
+	// For out-stream, prepared to transmit first packet
 	s->callbacked = true;
-	wake_up(&s->callback_wait);
 
 	if (s->direction == AMDTP_IN_STREAM) {
 		cycle = compute_ohci_cycle_count(ctx_header[1]);
@@ -1464,6 +1467,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		tag |= FW_ISO_CONTEXT_MATCH_TAG0;
 
 	s->callbacked = false;
+	s->ready_processing = false;
 	err = fw_iso_context_start(s->context, -1, 0, tag);
 	if (err < 0)
 		goto err_pkt_descs;
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 7725d9793458..b362a6499265 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -167,9 +167,11 @@ struct amdtp_stream {
 	snd_pcm_uframes_t pcm_buffer_pointer;
 	unsigned int pcm_period_pointer;
 
-	/* To wait for first packet. */
-	bool callbacked;
-	wait_queue_head_t callback_wait;
+	// To start processing content of packets at the same cycle in several contexts for
+	// each direction.
+	bool callbacked:1;
+	bool ready_processing:1;
+	wait_queue_head_t ready_wait;
 	unsigned int next_cycle;
 
 	/* For backends to process data blocks. */
@@ -259,21 +261,6 @@ static inline bool cip_sfc_is_base_44100(enum cip_sfc sfc)
 	return sfc & 1;
 }
 
-/**
- * amdtp_stream_wait_callback - sleep till callbacked or timeout
- * @s: the AMDTP stream
- * @timeout: msec till timeout
- *
- * If this function return false, the AMDTP stream should be stopped.
- */
-static inline bool amdtp_stream_wait_callback(struct amdtp_stream *s,
-					      unsigned int timeout)
-{
-	return wait_event_timeout(s->callback_wait,
-				  s->callbacked,
-				  msecs_to_jiffies(timeout)) > 0;
-}
-
 struct seq_desc {
 	unsigned int syt_offset;
 	unsigned int data_blocks;
@@ -327,4 +314,25 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 					      struct amdtp_stream *s);
 int amdtp_domain_stream_pcm_ack(struct amdtp_domain *d, struct amdtp_stream *s);
 
+/**
+ * amdtp_domain_wait_ready - sleep till being ready to process packets or timeout
+ * @d: the AMDTP domain
+ * @timeout_ms: msec till timeout
+ *
+ * If this function return false, the AMDTP domain should be stopped.
+ */
+static inline bool amdtp_domain_wait_ready(struct amdtp_domain *d, unsigned int timeout_ms)
+{
+	struct amdtp_stream *s;
+
+	list_for_each_entry(s, &d->streams, list) {
+		unsigned int j = msecs_to_jiffies(timeout_ms);
+
+		if (wait_event_interruptible_timeout(s->ready_wait, s->ready_processing, j) <= 0)
+			return false;
+	}
+
+	return true;
+}
+
 #endif
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 8053d02b68f0..df764171f84b 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -7,8 +7,7 @@
 
 #include "./bebob.h"
 
-#define CALLBACK_TIMEOUT	2500
-#define FW_ISO_RESOURCE_DELAY	1000
+#define READY_TIMEOUT_MS	2500
 
 /*
  * NOTE;
@@ -679,10 +678,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 
 		// Some devices postpone start of transmission mostly for 1 sec after receives
 		// packets firstly.
-		if (!amdtp_stream_wait_callback(&bebob->rx_stream,
-						CALLBACK_TIMEOUT) ||
-		    !amdtp_stream_wait_callback(&bebob->tx_stream,
-						CALLBACK_TIMEOUT)) {
+		if (!amdtp_domain_wait_ready(&bebob->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index c4dfe76500c2..a9a0fe9635dd 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -8,7 +8,7 @@
 
 #include "dice.h"
 
-#define	CALLBACK_TIMEOUT	200
+#define	READY_TIMEOUT_MS	200
 #define NOTIFICATION_TIMEOUT_MS	(2 * MSEC_PER_SEC)
 
 struct reg_params {
@@ -463,16 +463,9 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 		if (err < 0)
 			goto error;
 
-		for (i = 0; i < MAX_STREAMS; i++) {
-			if ((i < tx_params.count &&
-			    !amdtp_stream_wait_callback(&dice->tx_stream[i],
-							CALLBACK_TIMEOUT)) ||
-			    (i < rx_params.count &&
-			     !amdtp_stream_wait_callback(&dice->rx_stream[i],
-							 CALLBACK_TIMEOUT))) {
-				err = -ETIMEDOUT;
-				goto error;
-			}
+		if (!amdtp_domain_wait_ready(&dice->domain, READY_TIMEOUT_MS)) {
+			err = -ETIMEDOUT;
+			goto error;
 		}
 	}
 
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 405d6903bfbc..f11aaff2e248 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -7,7 +7,7 @@
 
 #include "digi00x.h"
 
-#define CALLBACK_TIMEOUT 500
+#define READY_TIMEOUT_MS	500
 
 const unsigned int snd_dg00x_stream_rates[SND_DG00X_RATE_COUNT] = {
 	[SND_DG00X_RATE_44100] = 44100,
@@ -379,10 +379,7 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 		if (err < 0)
 			goto error;
 
-		if (!amdtp_stream_wait_callback(&dg00x->rx_stream,
-						CALLBACK_TIMEOUT) ||
-		    !amdtp_stream_wait_callback(&dg00x->tx_stream,
-						CALLBACK_TIMEOUT)) {
+		if (!amdtp_domain_wait_ready(&dg00x->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 5452115c0ef9..53a21fb95add 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -7,7 +7,7 @@
 
 #include "ff.h"
 
-#define CALLBACK_TIMEOUT_MS	200
+#define READY_TIMEOUT_MS	200
 
 int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 				      enum snd_ff_stream_mode *mode)
@@ -203,10 +203,7 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		if (!amdtp_stream_wait_callback(&ff->rx_stream,
-						CALLBACK_TIMEOUT_MS) ||
-		    !amdtp_stream_wait_callback(&ff->tx_stream,
-						CALLBACK_TIMEOUT_MS)) {
+		if (!amdtp_domain_wait_ready(&ff->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 2206af0fef42..858cd6085c1f 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -6,7 +6,7 @@
  */
 #include "./fireworks.h"
 
-#define CALLBACK_TIMEOUT	100
+#define READY_TIMEOUT_MS	100
 
 static int init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 {
@@ -276,11 +276,7 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw)
 		if (err < 0)
 			goto error;
 
-		// Wait first callback.
-		if (!amdtp_stream_wait_callback(&efw->rx_stream,
-						CALLBACK_TIMEOUT) ||
-		    !amdtp_stream_wait_callback(&efw->tx_stream,
-						CALLBACK_TIMEOUT)) {
+		if (!amdtp_domain_wait_ready(&efw->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 2028c5419f6f..925241ae2551 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -7,7 +7,7 @@
 
 #include "motu.h"
 
-#define	CALLBACK_TIMEOUT	200
+#define	READY_TIMEOUT_MS	200
 
 #define ISOC_COMM_CONTROL_OFFSET		0x0b00
 #define  ISOC_COMM_CONTROL_MASK			0xffff0000
@@ -264,10 +264,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 		if (err < 0)
 			goto stop_streams;
 
-		if (!amdtp_stream_wait_callback(&motu->tx_stream,
-						CALLBACK_TIMEOUT) ||
-		    !amdtp_stream_wait_callback(&motu->rx_stream,
-						CALLBACK_TIMEOUT)) {
+		if (!amdtp_domain_wait_ready(&motu->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto stop_streams;
 		}
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index e9b6a9f171bf..4121d95e161f 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -9,7 +9,7 @@
 #include <linux/delay.h>
 
 #define AVC_GENERIC_FRAME_MAXIMUM_BYTES	512
-#define CALLBACK_TIMEOUT	200
+#define READY_TIMEOUT_MS	200
 
 /*
  * According to datasheet of Oxford Semiconductor:
@@ -358,20 +358,10 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 		if (err < 0)
 			goto error;
 
-		// Wait first packet.
-		if (!amdtp_stream_wait_callback(&oxfw->rx_stream,
-						CALLBACK_TIMEOUT)) {
+		if (!amdtp_domain_wait_ready(&oxfw->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
-
-		if (oxfw->has_output) {
-			if (!amdtp_stream_wait_callback(&oxfw->tx_stream,
-							CALLBACK_TIMEOUT)) {
-				err = -ETIMEDOUT;
-				goto error;
-			}
-		}
 	}
 
 	return 0;
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index eb07e1decf9b..296ecf5f6ddc 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -11,7 +11,7 @@
 #define CLOCK_STATUS_MASK      0xffff0000
 #define CLOCK_CONFIG_MASK      0x0000ffff
 
-#define CALLBACK_TIMEOUT 500
+#define READY_TIMEOUT_MS	500
 
 static int get_clock(struct snd_tscm *tscm, u32 *data)
 {
@@ -477,10 +477,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		if (err < 0)
 			return err;
 
-		if (!amdtp_stream_wait_callback(&tscm->rx_stream,
-						CALLBACK_TIMEOUT) ||
-		    !amdtp_stream_wait_callback(&tscm->tx_stream,
-						CALLBACK_TIMEOUT)) {
+		if (!amdtp_domain_wait_ready(&tscm->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
-- 
2.27.0

