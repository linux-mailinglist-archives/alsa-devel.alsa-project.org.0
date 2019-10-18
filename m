Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A10DBDA1
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98AA51684;
	Fri, 18 Oct 2019 08:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98AA51684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571379776;
	bh=fUIxKSPfGFmANR4hD0wsQi89NmG4iXqnqctFY5snvbw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnCTzSzxF7nxnza13v2GxDaOlS1iFWyvNuQ76RMMYC1Rizo0/nq0NoZ2EMzMJ+gq6
	 gtH+HO4zmnAOBBMWv5hrpN1fxp+HAoW1tCrsppk3TAZdJNS66Mb+B80yKXM/BHpGMr
	 L/nXo8IlxLzeO7IUGoFFUBK4Fl9zkpByODHra67g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 273D6F80634;
	Fri, 18 Oct 2019 08:19:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD7EDF805FB; Fri, 18 Oct 2019 08:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13F4FF80369
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13F4FF80369
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GcbkYCcd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="w+KFCdy0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 260B1409;
 Fri, 18 Oct 2019 02:19:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Oct 2019 02:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3TgwCikReE7+Y
 VJRhXoF9PDDuKD88IEVeHxuic3zFjE=; b=GcbkYCcd68j3deYZj0OXkbEV4YvA6
 KbENeTq7gSRGBW1ILY03hGDPXkPRr/y6jn+8uz23AUplXZWWpWH0KSqkNwiNlEju
 Fu/ocvoy/cc9IeDkI2VgVsya1WKWja3VchqPdOT7atn7AMEITsoYr28+CTgR3K7I
 QKRe+C1IGR7IjR8iDlJ9mOqbcTkY7eVYlYj/iuFu1yljac4B412m4cgPoy70BkPy
 eyai1C9a2gTYLGKGD8+FNLIrShNvDCsvvLtgIiXBZ0yqG1nDvlU63qEVZeotrKJi
 mAUw6/2NEZrXLNg+CNF+iyrsTeqJeNAfHV9zWVq1DR+Ov/QGOZW2by4OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3TgwCikReE7+YVJRhXoF9PDDuKD88IEVeHxuic3zFjE=; b=w+KFCdy0
 U45e29wm1LM4DInMbF2c9b66aH58sXHwhU+qyKW8yGyaV3NQxAxeWMxBHYwfrt/Q
 IsqyuecxBku+AEZYdK5sXPjcrmzpeauHJ6Y8Yg8q8IYHG+Ju/zvMfHsHx3eOVtep
 3Ny/ScLLQmVfwo5NmdiW5wwSuk3PTh4/yupvNRIBXXbxoZPmCj8UUgZVValAapPg
 aLMG3m7yaIeR8QOHPX1KdYzRwwX5sihEYKrLwCzQeC73oP0zkbbYBILJakoNcyHO
 uzUa//WRI9oBA7Ix6AEijyHAAh5QAKSgfJxazFyfWVwtWF0VDpPgXPv3qpdUGRHU
 VsyTKYGJgDT3Dg==
X-ME-Sender: <xms:aFmpXS4bjUhUrNFt_2ubWRzjUpWiHpUTHlYXnQuRsSYSf8l-PQTjHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:aFmpXdM_MDlMyZYuupgJ8krhNzqZbAS0xFDesPwcrgdyx3nqGR_rkw>
 <xmx:aFmpXT4GkVEdG3ZX1QSefLdOH4MUoNGs3Oi6jy1gyzKfcJjo-Ggh1w>
 <xmx:aFmpXUycQNSnAYJIno4XweTTlwehxn0hcK0MRa2jZdypnYN3YFUxqQ>
 <xmx:aFmpXXkEDvxYElJnVjz1VVoFBosVEbl4XXQWHjMU0TKlNms8Kthb7w>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 553548005B;
 Fri, 18 Oct 2019 02:19:19 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 15:19:08 +0900
Message-Id: <20191018061911.24909-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/6] ALSA: firewire-lib: replace ack callback
	to flush isoc contexts in AMDTP domain
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
by a call of pcm.ack. This commit extends this for AMDTP
domain.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c            | 24 +++++++++++++++---------
 sound/firewire/amdtp-stream.h            |  3 ++-
 sound/firewire/bebob/bebob_pcm.c         |  4 ++--
 sound/firewire/dice/dice-pcm.c           |  4 ++--
 sound/firewire/digi00x/digi00x-pcm.c     |  4 ++--
 sound/firewire/fireface/ff-pcm.c         |  4 ++--
 sound/firewire/fireworks/fireworks_pcm.c |  4 ++--
 sound/firewire/motu/motu-pcm.c           |  4 ++--
 sound/firewire/oxfw/oxfw-pcm.c           |  4 ++--
 sound/firewire/tascam/tascam-pcm.c       |  4 ++--
 10 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 23677b805b05..3d27d4ce2b45 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1139,23 +1139,29 @@ unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 EXPORT_SYMBOL_GPL(amdtp_domain_stream_pcm_pointer);
 
 /**
- * amdtp_stream_pcm_ack - acknowledge queued PCM frames
+ * amdtp_domain_stream_pcm_ack - acknowledge queued PCM frames
+ * @d: the AMDTP domain.
  * @s: the AMDTP stream that transfers the PCM frames
  *
  * Returns zero always.
  */
-int amdtp_stream_pcm_ack(struct amdtp_stream *s)
+int amdtp_domain_stream_pcm_ack(struct amdtp_domain *d, struct amdtp_stream *s)
 {
-	/*
-	 * Process isochronous packets for recent isochronous cycle to handle
-	 * queued PCM frames.
-	 */
-	if (amdtp_stream_running(s))
-		fw_iso_context_flush_completions(s->context);
+	struct amdtp_stream *irq_target = d->irq_target;
+
+	// Process isochronous packets for recent isochronous cycle to handle
+	// queued PCM frames.
+	if (irq_target && amdtp_stream_running(irq_target)) {
+		// Queued packet should be processed without any kernel
+		// preemption to keep latency against bus cycle.
+		preempt_disable();
+		fw_iso_context_flush_completions(irq_target->context);
+		preempt_enable();
+	}
 
 	return 0;
 }
-EXPORT_SYMBOL(amdtp_stream_pcm_ack);
+EXPORT_SYMBOL_GPL(amdtp_domain_stream_pcm_ack);
 
 /**
  * amdtp_stream_update - update the stream after a bus reset
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index ba0bbeddfdcb..470e77ca0061 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -198,7 +198,6 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 					struct snd_pcm_runtime *runtime);
 
 void amdtp_stream_pcm_prepare(struct amdtp_stream *s);
-int amdtp_stream_pcm_ack(struct amdtp_stream *s);
 void amdtp_stream_pcm_abort(struct amdtp_stream *s);
 
 extern const unsigned int amdtp_syt_intervals[CIP_SFC_COUNT];
@@ -303,4 +302,6 @@ static inline int amdtp_domain_set_events_per_period(struct amdtp_domain *d,
 
 unsigned long amdtp_domain_stream_pcm_pointer(struct amdtp_domain *d,
 					      struct amdtp_stream *s);
+int amdtp_domain_stream_pcm_ack(struct amdtp_domain *d, struct amdtp_stream *s);
+
 #endif
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index dc15ea8d0dc5..1b100159f4c5 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -332,14 +332,14 @@ static int pcm_capture_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_bebob *bebob = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&bebob->tx_stream);
+	return amdtp_domain_stream_pcm_ack(&bebob->domain, &bebob->tx_stream);
 }
 
 static int pcm_playback_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_bebob *bebob = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&bebob->rx_stream);
+	return amdtp_domain_stream_pcm_ack(&bebob->domain, &bebob->rx_stream);
 }
 
 int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 81b78e7d181d..f1848fb39bd0 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -394,7 +394,7 @@ static int capture_ack(struct snd_pcm_substream *substream)
 	struct snd_dice *dice = substream->private_data;
 	struct amdtp_stream *stream = &dice->tx_stream[substream->pcm->device];
 
-	return amdtp_stream_pcm_ack(stream);
+	return amdtp_domain_stream_pcm_ack(&dice->domain, stream);
 }
 
 static int playback_ack(struct snd_pcm_substream *substream)
@@ -402,7 +402,7 @@ static int playback_ack(struct snd_pcm_substream *substream)
 	struct snd_dice *dice = substream->private_data;
 	struct amdtp_stream *stream = &dice->rx_stream[substream->pcm->device];
 
-	return amdtp_stream_pcm_ack(stream);
+	return amdtp_domain_stream_pcm_ack(&dice->domain, stream);
 }
 
 int snd_dice_create_pcm(struct snd_dice *dice)
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index f6a2053d5f10..8befc5d2ef22 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -315,14 +315,14 @@ static int pcm_capture_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&dg00x->tx_stream);
+	return amdtp_domain_stream_pcm_ack(&dg00x->domain, &dg00x->tx_stream);
 }
 
 static int pcm_playback_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&dg00x->rx_stream);
+	return amdtp_domain_stream_pcm_ack(&dg00x->domain, &dg00x->rx_stream);
 }
 
 int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 5af1dce90921..c29f87a65c0f 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -355,14 +355,14 @@ static int pcm_capture_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_ff *ff = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&ff->tx_stream);
+	return amdtp_domain_stream_pcm_ack(&ff->domain, &ff->tx_stream);
 }
 
 static int pcm_playback_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_ff *ff = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&ff->rx_stream);
+	return amdtp_domain_stream_pcm_ack(&ff->domain, &ff->rx_stream);
 }
 
 int snd_ff_create_pcm_devices(struct snd_ff *ff)
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 71f5057caa0d..64c1bcf28dfa 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -362,14 +362,14 @@ static int pcm_capture_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&efw->tx_stream);
+	return amdtp_domain_stream_pcm_ack(&efw->domain, &efw->tx_stream);
 }
 
 static int pcm_playback_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&efw->rx_stream);
+	return amdtp_domain_stream_pcm_ack(&efw->domain, &efw->rx_stream);
 }
 
 int snd_efw_create_pcm_devices(struct snd_efw *efw)
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 13e2577c2a07..55d3d6661731 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -333,14 +333,14 @@ static int capture_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&motu->tx_stream);
+	return amdtp_domain_stream_pcm_ack(&motu->domain, &motu->tx_stream);
 }
 
 static int playback_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&motu->rx_stream);
+	return amdtp_domain_stream_pcm_ack(&motu->domain, &motu->rx_stream);
 }
 
 int snd_motu_create_pcm_devices(struct snd_motu *motu)
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 3be35dfcf270..74bd1811cec2 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -406,14 +406,14 @@ static int pcm_capture_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&oxfw->tx_stream);
+	return amdtp_domain_stream_pcm_ack(&oxfw->domain, &oxfw->tx_stream);
 }
 
 static int pcm_playback_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&oxfw->rx_stream);
+	return amdtp_domain_stream_pcm_ack(&oxfw->domain, &oxfw->rx_stream);
 }
 
 int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 1f66c8be7528..cd45f20ba515 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -244,14 +244,14 @@ static int pcm_capture_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_tscm *tscm = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&tscm->tx_stream);
+	return amdtp_domain_stream_pcm_ack(&tscm->domain, &tscm->tx_stream);
 }
 
 static int pcm_playback_ack(struct snd_pcm_substream *substream)
 {
 	struct snd_tscm *tscm = substream->private_data;
 
-	return amdtp_stream_pcm_ack(&tscm->rx_stream);
+	return amdtp_domain_stream_pcm_ack(&tscm->domain, &tscm->rx_stream);
 }
 
 int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
