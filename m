Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D21DBDA0
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2F81674;
	Fri, 18 Oct 2019 08:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2F81674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571379767;
	bh=LgLyFV+DikQuYq+RogH7S04GNw8xn20pAHXajBnQA1U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m5nB5guW4lGiVa288MTdP/EemU6By/tbOVQD+kCm2/fUIvaM462FRq1h+BFbi7mnJ
	 S9ezmBcbR/nZTMFgzy7zoABStaoifWwFWZxm39LfsZpUxfHkTcMcWO26ZUGb4yfaZJ
	 /7jbkQcBsJhOJaBmIWp4byzlj2AT2rSzF2lG4/Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B5CF80600;
	Fri, 18 Oct 2019 08:19:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6BE1F80323; Fri, 18 Oct 2019 08:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1B27F80323
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B27F80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hMqJJ2dM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="QEr6qvad"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 9B87342F;
 Fri, 18 Oct 2019 02:19:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Oct 2019 02:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=I+KYC7Dm/FgVZ
 /pe/Nx+LB/1mPZ2mbkDMDN3pB2aIr8=; b=hMqJJ2dMQXOmdCgWEpC3CUikvlR7F
 T6xOjWwURTK5eA7K9ayNqu8g/TAFWGykKAzjSx1MuWXBMvJPtNlC++SduSuqScAQ
 7WN31q0Z0brFVgV85uvvaf9x5mi3sKRF5+H9RDA3nv9B9xK/7wrG9nTfTglgmdh3
 vcGc5nL97Hz4FO6rtGYJqJwMjsGYU3geYokO68eeT65Zlnwn1KQ3nb2dRqZbnD9+
 kDyQu4aw3wgOhAaxsds2A1Dn64umQ7JaVWNU8fL0jGYHbScRN3Q0vgdStoK9YfuB
 lNMhIioQ4E2+kHHY8Wf7bw79vDy0KheG5YaMyK3+nDWfW5twcJSi0J1iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=I+KYC7Dm/FgVZ/pe/Nx+LB/1mPZ2mbkDMDN3pB2aIr8=; b=QEr6qvad
 0OF10Ngc39i+nuxjYLmX2/QTTN4LUeDXK0ueXv8s1IP+BYormO25xFwVHtvJLL+L
 jS3p9thxdOFL1DakdUF0ydtIPDSd+K0FVtmxFVfEsAz/qK4jgQKw4bsEgNAGu2VB
 V45xLqu407D+PGsTfYXUQPut4CVNwPO7PsWr9lgsIDTJEHqR5dWeqOnM5iPcs716
 O5brIhFQC+5uJ/jUGHQsn6n4Y5LdWXWp+Be9QgqfrXL/gccA8/cb+P4ak1QStlVd
 rJF46UmHYmveAzEnLaGTbE5jHozYu8Mfw23Eh1lPcBmsi4BvOo5FkFUR8lhG+ifZ
 Jc71ub7J2bmnNA==
X-ME-Sender: <xms:Z1mpXSLHlui_irhiHLwsiA1aWTGwNi5VFhzBr07P0T_q2khU-QdTww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Z1mpXeT3aEilm4SF3kI1a53tRVgmV4gQaS48wLrWODp5E1yIZn8DGg>
 <xmx:Z1mpXfsi3ao63KtVfYRsQdZo_t2K1TM696OELXqrti5NSA4Su1mXkg>
 <xmx:Z1mpXR8D2xn81yMJ8dC4wmuygacJwDA0r3Ru1P0hXuMamNB36MAKYw>
 <xmx:Z1mpXYtq7qCO0jLD83GTzflGV3UC5f-qft1gX5nyMWbA1NssfHoxvQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9B91880062;
 Fri, 18 Oct 2019 02:19:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 15:19:07 +0900
Message-Id: <20191018061911.24909-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/6] ALSA: firewire-lib: replace pointer
	callback to flush isoc contexts in AMDTP domain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

An isoc context for AMDTP stream is flushed to queue packet
by a call of pcm.pointer. This commit extends this for AMDTP
domain.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c            | 51 ++++++++++++++----------
 sound/firewire/amdtp-stream.h            |  3 +-
 sound/firewire/bebob/bebob_pcm.c         | 14 ++++---
 sound/firewire/dice/dice-pcm.c           |  4 +-
 sound/firewire/digi00x/digi00x-pcm.c     |  4 +-
 sound/firewire/fireface/ff-pcm.c         |  4 +-
 sound/firewire/fireworks/fireworks_pcm.c |  6 ++-
 sound/firewire/motu/motu-pcm.c           |  4 +-
 sound/firewire/oxfw/oxfw-pcm.c           |  4 +-
 sound/firewire/tascam/tascam-pcm.c       |  4 +-
 10 files changed, 56 insertions(+), 42 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 7486eec4d958..23677b805b05 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1099,35 +1099,44 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 }
 
 /**
- * amdtp_stream_pcm_pointer - get the PCM buffer position
+ * amdtp_domain_stream_pcm_pointer - get the PCM buffer position
+ * @d: the AMDTP domain.
  * @s: the AMDTP stream that transports the PCM data
  *
  * Returns the current buffer position, in frames.
  */
-unsigned long amdtp_stream_pcm_pointer(struct amdtp_stream *s)
+unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
+					      struct amdtp_stream *s)
 {
-	/*
-	 * This function is called in software IRQ context of period_tasklet or
-	 * process context.
-	 *
-	 * When the software IRQ context was scheduled by software IRQ context
-	 * of IR/IT contexts, queued packets were already handled. Therefore,
-	 * no need to flush the queue in buffer anymore.
-	 *
-	 * When the process context reach here, some packets will be already
-	 * queued in the buffer. These packets should be handled immediately
-	 * to keep better granularity of PCM pointer.
-	 *
-	 * Later, the process context will sometimes schedules software IRQ
-	 * context of the period_tasklet. Then, no need to flush the queue by
-	 * the same reason as described for IR/IT contexts.
-	 */
-	if (!in_interrupt() && amdtp_stream_running(s))
-		fw_iso_context_flush_completions(s->context);
+	struct amdtp_stream *irq_target = d->irq_target;
+
+	if (irq_target && amdtp_stream_running(irq_target)) {
+		// This function is called in software IRQ context of
+		// period_tasklet or process context.
+		//
+		// When the software IRQ context was scheduled by software IRQ
+		// context of IT contexts, queued packets were already handled.
+		// Therefore, no need to flush the queue in buffer furthermore.
+		//
+		// When the process context reach here, some packets will be
+		// already queued in the buffer. These packets should be handled
+		// immediately to keep better granularity of PCM pointer.
+		//
+		// Later, the process context will sometimes schedules software
+		// IRQ context of the period_tasklet. Then, no need to flush the
+		// queue by the same reason as described in the above
+		if (!in_interrupt()) {
+			// Queued packet should be processed without any kernel
+			// preemption to keep latency against bus cycle.
+			preempt_disable();
+			fw_iso_context_flush_completions(irq_target->context);
+			preempt_enable();
+		}
+	}
 
 	return READ_ONCE(s->pcm_buffer_pointer);
 }
-EXPORT_SYMBOL(amdtp_stream_pcm_pointer);
+EXPORT_SYMBOL_GPL(amdtp_domain_stream_pcm_pointer);
 
 /**
  * amdtp_stream_pcm_ack - acknowledge queued PCM frames
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index f92397a2f35f..ba0bbeddfdcb 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -198,7 +198,6 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 					struct snd_pcm_runtime *runtime);
 
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s);
-unsigned long amdtp_stream_pcm_pointer(struct amdtp_stream *s);
 int amdtp_stream_pcm_ack(struct amdtp_stream *s);
 void amdtp_stream_pcm_abort(struct amdtp_stream *s);
 
@@ -302,4 +301,6 @@ static inline int amdtp_domain_set_events_per_period(struct amdtp_domain *d,
 	return 0;
 }
 
+unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
+					      struct amdtp_stream *s);
 #endif
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 8b2e0ceffe82..dc15ea8d0dc5 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -313,17 +313,19 @@ pcm_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-static snd_pcm_uframes_t
-pcm_capture_pointer(struct snd_pcm_substream *sbstrm)
+static snd_pcm_uframes_t pcm_capture_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_bebob *bebob = sbstrm->private_data;
-	return amdtp_stream_pcm_pointer(&bebob->tx_stream);
+
+	return amdtp_domain_stream_pcm_pointer(&bebob->domain,
+					       &bebob->tx_stream);
 }
-static snd_pcm_uframes_t
-pcm_playback_pointer(struct snd_pcm_substream *sbstrm)
+static snd_pcm_uframes_t pcm_playback_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_bebob *bebob = sbstrm->private_data;
-	return amdtp_stream_pcm_pointer(&bebob->rx_stream);
+
+	return amdtp_domain_stream_pcm_pointer(&bebob->domain,
+					       &bebob->rx_stream);
 }
 
 static int pcm_capture_ack(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 7c0c34c5bd47..81b78e7d181d 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -379,14 +379,14 @@ static snd_pcm_uframes_t capture_pointer(struct snd_pcm_substream *substream)
 	struct snd_dice *dice = substream->private_data;
 	struct amdtp_stream *stream = &dice->tx_stream[substream->pcm->device];
 
-	return amdtp_stream_pcm_pointer(stream);
+	return amdtp_domain_stream_pcm_pointer(&dice->domain, stream);
 }
 static snd_pcm_uframes_t playback_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_dice *dice = substream->private_data;
 	struct amdtp_stream *stream = &dice->rx_stream[substream->pcm->device];
 
-	return amdtp_stream_pcm_pointer(stream);
+	return amdtp_domain_stream_pcm_pointer(&dice->domain, stream);
 }
 
 static int capture_ack(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index c9a833dff20d..f6a2053d5f10 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -301,14 +301,14 @@ static snd_pcm_uframes_t pcm_capture_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_dg00x *dg00x = sbstrm->private_data;
 
-	return amdtp_stream_pcm_pointer(&dg00x->tx_stream);
+	return amdtp_domain_stream_pcm_pointer(&dg00x->domain, &dg00x->tx_stream);
 }
 
 static snd_pcm_uframes_t pcm_playback_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_dg00x *dg00x = sbstrm->private_data;
 
-	return amdtp_stream_pcm_pointer(&dg00x->rx_stream);
+	return amdtp_domain_stream_pcm_pointer(&dg00x->domain, &dg00x->rx_stream);
 }
 
 static int pcm_capture_ack(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 005d959f8651..5af1dce90921 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -341,14 +341,14 @@ static snd_pcm_uframes_t pcm_capture_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_ff *ff = sbstrm->private_data;
 
-	return amdtp_stream_pcm_pointer(&ff->tx_stream);
+	return amdtp_domain_stream_pcm_pointer(&ff->domain, &ff->tx_stream);
 }
 
 static snd_pcm_uframes_t pcm_playback_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_ff *ff = sbstrm->private_data;
 
-	return amdtp_stream_pcm_pointer(&ff->rx_stream);
+	return amdtp_domain_stream_pcm_pointer(&ff->domain, &ff->rx_stream);
 }
 
 static int pcm_capture_ack(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index abcc53dac8a5..71f5057caa0d 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -348,12 +348,14 @@ static int pcm_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 static snd_pcm_uframes_t pcm_capture_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_efw *efw = sbstrm->private_data;
-	return amdtp_stream_pcm_pointer(&efw->tx_stream);
+
+	return amdtp_domain_stream_pcm_pointer(&efw->domain, &efw->tx_stream);
 }
 static snd_pcm_uframes_t pcm_playback_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_efw *efw = sbstrm->private_data;
-	return amdtp_stream_pcm_pointer(&efw->rx_stream);
+
+	return amdtp_domain_stream_pcm_pointer(&efw->domain, &efw->rx_stream);
 }
 
 static int pcm_capture_ack(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 00e693da0cad..13e2577c2a07 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -320,13 +320,13 @@ static snd_pcm_uframes_t capture_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
 
-	return amdtp_stream_pcm_pointer(&motu->tx_stream);
+	return amdtp_domain_stream_pcm_pointer(&motu->domain, &motu->tx_stream);
 }
 static snd_pcm_uframes_t playback_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
 
-	return amdtp_stream_pcm_pointer(&motu->rx_stream);
+	return amdtp_domain_stream_pcm_pointer(&motu->domain, &motu->rx_stream);
 }
 
 static int capture_ack(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index ba586d1ac91d..3be35dfcf270 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -393,13 +393,13 @@ static snd_pcm_uframes_t pcm_capture_pointer(struct snd_pcm_substream *sbstm)
 {
 	struct snd_oxfw *oxfw = sbstm->private_data;
 
-	return amdtp_stream_pcm_pointer(&oxfw->tx_stream);
+	return amdtp_domain_stream_pcm_pointer(&oxfw->domain, &oxfw->tx_stream);
 }
 static snd_pcm_uframes_t pcm_playback_pointer(struct snd_pcm_substream *sbstm)
 {
 	struct snd_oxfw *oxfw = sbstm->private_data;
 
-	return amdtp_stream_pcm_pointer(&oxfw->rx_stream);
+	return amdtp_domain_stream_pcm_pointer(&oxfw->domain, &oxfw->rx_stream);
 }
 
 static int pcm_capture_ack(struct snd_pcm_substream *substream)
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index b18664fdf955..1f66c8be7528 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -230,14 +230,14 @@ static snd_pcm_uframes_t pcm_capture_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_tscm *tscm = sbstrm->private_data;
 
-	return amdtp_stream_pcm_pointer(&tscm->tx_stream);
+	return amdtp_domain_stream_pcm_pointer(&tscm->domain, &tscm->tx_stream);
 }
 
 static snd_pcm_uframes_t pcm_playback_pointer(struct snd_pcm_substream *sbstrm)
 {
 	struct snd_tscm *tscm = sbstrm->private_data;
 
-	return amdtp_stream_pcm_pointer(&tscm->rx_stream);
+	return amdtp_domain_stream_pcm_pointer(&tscm->domain, &tscm->rx_stream);
 }
 
 static int pcm_capture_ack(struct snd_pcm_substream *substream)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
