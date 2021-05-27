Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AC0392DEF
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 14:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE391716;
	Thu, 27 May 2021 14:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE391716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622118542;
	bh=LM5sjz9CxJSNb57R0iclHnPnHQ3UB3/wnzwYNvnhn7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NS2O0HbBu3TxdLqaVC42kRZQWIo4RMVc7FnG3VVKcTzywLdjViRZ+rN6ancOtUWdE
	 BqOpsNO4X+Ae3Bu6A8XcdPq+uw8Iav7R9l0EdIJkb4mMcPVExnz5WiTB6Og9AAkiCw
	 0Z0Ob1rzODqbTeIV5VVBKqEZce5seTmnH8/thpsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE95F804AF;
	Thu, 27 May 2021 14:26:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C15F7F804AE; Thu, 27 May 2021 14:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CE26F8012E
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 14:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CE26F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rIQCakl2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ic5XUzfi"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3C94B10EE;
 Thu, 27 May 2021 08:26:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 May 2021 08:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Ja+joxACPKqO0
 XltQoMcvUjD1nZT/hutfdx6WlrB+PI=; b=rIQCakl2CaR4/RyInurPH3xnX2g9V
 VU0n3LVwR2gfIOyLXu9zMjPY9exvjftLm1tGlnjWaaQ7eSYXeWB9xQfGzhzhrhvk
 g7eLISAhuJjfXcAyRpKD80fZbLZs8AXp7iI4JitkM70N0RxnpZb+lHBaVYO8altA
 i7TlvXG8Z5SZxTZahfhgbV5YnpRPjz6yfcz0aNw2tKcbkoUeVjBCQEAovjXb49d9
 PKdODvvzCKFeEKQXvbat+4WT2kQr3BA7ZEvrc9vWepRVyKdiU3SjgYYsJoRrezdO
 lIhh26X5TLA9jSOZ+4vXDbSAAXs6BkuzK5Qh83K8bplyeaFPdYHhWHaKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Ja+joxACPKqO0XltQoMcvUjD1nZT/hutfdx6WlrB+PI=; b=ic5XUzfi
 cvdqeShDE3KK9qfMLDvery217qlhI3GbhSRamQD3J9H6+Zza7wdxBIY0e0M3UWNK
 IMBRNNHH5tLOIYk+EpuW2/vDbn9+K/P7U2ZO3Yj37rTBhFrm9H39WojyF2UMTJkL
 FoDepUjSegk7HiVMznWZOO2Bkqi6G5Rah9jVD9IwaOg6myOF3Pz3VeyUhcENbsf0
 84bdCV41u0OjoLvMmPBuuqBSY2ooxOUlV4MDGb+02Gu89qAgMRpq3qfzV7cGxfMN
 P1XFxk2zdsSooFaOWtx8FXgmn5ryWJYsiNjBoipw/KDdz5ocE8eANA1LuAlB640l
 dtxq5pgrvBtWTg==
X-ME-Sender: <xms:8I-vYMgKerRs7HAIhWZtdOg1Af7pcW9F-L2aBY7E-appkOHa4n12bw>
 <xme:8I-vYFBj_CWzeBIH65k9sr1XGMKviNUcM9LIxUNKeNRIfM3T3C_9Evc-NiT_jnldK
 4Cvnsz15vOWjmtDpFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8I-vYEGB0NI3UQPvuYkyyKCz_CVroTTCYxPhlhK2cvF4VBgJANabyQ>
 <xmx:8I-vYNTatuErN3XmFXAF7HcZrNhH7ypTJQ6040JCt4Mw31DovMy32w>
 <xmx:8I-vYJxoKTPRzU4GYW7aBRzW0bqDV4vSmMQnMt-txj2au6fTod-UdA>
 <xmx:8I-vYHYl2uLlBEfoh5wazEdziEFr3mGaJH3dn3NW5fyfG3r2ZPQ_dw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:26:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: firewire-lib: transfer rx packets on-the-fly when
 replaying
Date: Thu, 27 May 2021 21:26:11 +0900
Message-Id: <20210527122611.173711-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527122611.173711-1-o-takashi@sakamocchi.jp>
References: <20210527122611.173711-1-o-takashi@sakamocchi.jp>
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

Models in below series start transmission of packet after receiving the
sequence of packets:

 * Digidesign Digi00x family
 * RME Fireface series

Additionally, models in Tascam FireWire series start multiplexing PCM
frames into packets enough after receiving packets. It's required to
transfer packets on-the-fly for the above models according to nominal
sampling transfer frequency before starting sequence replay.

This commit allows drivers to decide whether the engine transfers packet
on-the-fly or not.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c               | 27 +++++++++++++++++----
 sound/firewire/amdtp-stream.h               |  6 +++--
 sound/firewire/bebob/bebob_stream.c         |  2 +-
 sound/firewire/dice/dice-stream.c           |  2 +-
 sound/firewire/digi00x/digi00x-stream.c     |  2 +-
 sound/firewire/fireface/ff-stream.c         |  2 +-
 sound/firewire/fireworks/fireworks_stream.c |  2 +-
 sound/firewire/motu/motu-stream.c           |  2 +-
 sound/firewire/oxfw/oxfw-stream.c           |  2 +-
 sound/firewire/tascam/tascam-stream.c       |  2 +-
 10 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 47ea03370858..d0e9b417c019 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -577,10 +577,23 @@ static void pool_seq_descs(struct amdtp_stream *s, unsigned int count)
 {
 	struct amdtp_domain *d = s->domain;
 
-	if (!d->replay.enable || !s->ctx_data.rx.replay_target)
+	if (!d->replay.enable || !s->ctx_data.rx.replay_target) {
 		pool_ideal_seq_descs(s, count);
-	else
-		pool_replayed_seq(s, count);
+	} else {
+		if (!d->replay.on_the_fly) {
+			pool_replayed_seq(s, count);
+		} else {
+			struct amdtp_stream *tx = s->ctx_data.rx.replay_target;
+			const unsigned int cache_size = tx->ctx_data.tx.cache.size;
+			const unsigned int cache_head = s->ctx_data.rx.cache_head;
+			unsigned int cached_cycles = calculate_cached_cycle_count(tx, cache_head);
+
+			if (cached_cycles > count && cached_cycles > cache_size / 2)
+				pool_replayed_seq(s, count);
+			else
+				pool_ideal_seq_descs(s, count);
+		}
+	}
 }
 
 static void update_pcm_pointers(struct amdtp_stream *s,
@@ -1444,7 +1457,7 @@ static void irq_target_callback_skip(struct fw_iso_context *context, u32 tstamp,
 	skip_rx_packets(context, tstamp, header_length, header, private_data);
 	process_ctxs_in_domain(d);
 
-	if (d->replay.enable) {
+	if (d->replay.enable && !d->replay.on_the_fly) {
 		unsigned int rx_count = 0;
 		unsigned int rx_ready_count = 0;
 		struct amdtp_stream *rx;
@@ -1929,8 +1942,11 @@ static int make_association(struct amdtp_domain *d)
  *			 contexts.
  * @replay_seq: whether to replay the sequence of packet in IR context for the sequence of packet in
  *		IT context.
+ * @replay_on_the_fly: transfer rx packets according to nominal frequency, then begin to replay
+ *		       according to arrival of events in tx packets.
  */
-int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles, bool replay_seq)
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles, bool replay_seq,
+		       bool replay_on_the_fly)
 {
 	unsigned int events_per_buffer = d->events_per_buffer;
 	unsigned int events_per_period = d->events_per_period;
@@ -1944,6 +1960,7 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles,
 			return err;
 	}
 	d->replay.enable = replay_seq;
+	d->replay.on_the_fly = replay_on_the_fly;
 
 	// Select an IT context as IRQ target.
 	list_for_each_entry(s, &d->streams, list) {
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 61b6b5ae8b3b..b25592d5f6af 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -303,7 +303,8 @@ struct amdtp_domain {
 	} processing_cycle;
 
 	struct {
-		bool enable;
+		bool enable:1;
+		bool on_the_fly:1;
 	} replay;
 };
 
@@ -313,7 +314,8 @@ void amdtp_domain_destroy(struct amdtp_domain *d);
 int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 			    int channel, int speed);
 
-int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles, bool replay_seq);
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles, bool replay_seq,
+		       bool replay_on_the_fly);
 void amdtp_domain_stop(struct amdtp_domain *d);
 
 static inline int amdtp_domain_set_events_per_period(struct amdtp_domain *d,
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index fb776f871133..47773ca97e46 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -652,7 +652,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		// MEMO: In the early stage of packet streaming, the device transfers NODATA packets.
 		// After several hundred cycles, it begins to multiplex event into the packet with
 		// syt information.
-		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles, false);
+		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles, false, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 064f28f1822b..0fb8b4ae6a0a 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -459,7 +459,7 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 			goto error;
 		}
 
-		err = amdtp_domain_start(&dice->domain, 0, false);
+		err = amdtp_domain_start(&dice->domain, 0, false, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 5daba75a5bf3..2019f6533477 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -375,7 +375,7 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&dg00x->domain, 0, false);
+		err = amdtp_domain_start(&dg00x->domain, 0, false, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 12779e7caf22..97c356f2ac04 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -199,7 +199,7 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&ff->domain, 0, false);
+		err = amdtp_domain_start(&ff->domain, 0, false, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 0106fa6d1eaf..6fc117c3a068 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -272,7 +272,7 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&efw->domain, 0, false);
+		err = amdtp_domain_start(&efw->domain, 0, false, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 5af9d7487cdc..5d8d067f366d 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -260,7 +260,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 		if (err < 0)
 			goto stop_streams;
 
-		err = amdtp_domain_start(&motu->domain, 0, false);
+		err = amdtp_domain_start(&motu->domain, 0, false, false);
 		if (err < 0)
 			goto stop_streams;
 
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index a6e97a37f129..9792d4b4373c 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -354,7 +354,7 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 			}
 		}
 
-		err = amdtp_domain_start(&oxfw->domain, 0, false);
+		err = amdtp_domain_start(&oxfw->domain, 0, false, false);
 		if (err < 0)
 			goto error;
 
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index eb4c7c47f8e9..4811b60e5823 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -473,7 +473,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&tscm->domain, 0, false);
+		err = amdtp_domain_start(&tscm->domain, 0, false, false);
 		if (err < 0)
 			return err;
 
-- 
2.27.0

