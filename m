Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F28389C50
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F3D1674;
	Thu, 20 May 2021 06:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F3D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483560;
	bh=NmTPowujpDRcmat7b9Rr2SJYGPOGggPZ7163Yh6JubQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YZddim3LdUnQc9NDOIpz9oLP3l/cRGNP8xTtLLmGncXUVjP4zsB/fioUxPGLoCpbv
	 JlcFsVuE9GmTZtITxv2iZI/zUruoeEqS/ZZY2Yiz9fOMdaWaWaYMbwQNn/JPPBbjG7
	 m2uJ6jq0pSGeAKWuY+hpIKJ+W5SlWp+SW4AMwPYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12D55F804D8;
	Thu, 20 May 2021 06:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C01C2F804AE; Thu, 20 May 2021 06:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7837AF80272
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7837AF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="poUm0rs2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AgVajk4R"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D858B5C00F8;
 Thu, 20 May 2021 00:02:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 20 May 2021 00:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sLryzudFZO8jL
 D2w0dSy6J6g21/XpNI0qiJ7oD3pNwI=; b=poUm0rs2Qoyr2HWV2AgrWD3MLeDm9
 uxjJlzQRaYAWm3G9omRbCqnriPBG49PFYQXUCEq+iOG7FF0IIWp3oLmec7iCCP3a
 pUGo0qW/hWg/1s5KRmImxF5VrCwpllmZJ3kC6W+6hP4/aCHfzzussZYhzt1OMLym
 0VNSs+vO15XtQnh25OqEVkm5vKXRhrb9AiSUum6/a45VgCLLint5G0Dob1nmsoPO
 NHUDq1OTxB15p6zTM8XC15FkhtWm3OAUWZZthk/aDaasYtgcDgozQxoHKuJ0U5vm
 /Ipj10pFFm+lr5MEKivr6ThUMIkIMWUkCgvDLZfhsDJBHD7TQRWNB32NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sLryzudFZO8jLD2w0dSy6J6g21/XpNI0qiJ7oD3pNwI=; b=AgVajk4R
 C7X9OMJUsOrjn2yjdWs+MDrqMg5uKj+HezYskSBhmbibzPz1iNKaytSFEU+TDXqu
 oI1TFT2ZSuFavzhxY4WVrGPgGeUy0TjWIMk4ZEKalFO6f/nvKFUmCfRGrbPjbqqH
 6JJ5cyXVQtdBRo8vCdrJ7oBX81sc95RVYFKsrPJ3v6bAoHg4lsdgF6+whnMm07i7
 E3EwqLkKFtBtCsvO4YCilwUFp6+rb+q1u+eRiJ3IcQb03Pe5HYCGKJ1y8ZHV3s4l
 tVE12F9DnJQ89AXO2QB//m2YIgqiC3qMjqrmR5rv3PVTzet3rJntNQRozCNpz5L7
 u8vwUA3g9VYdCA==
X-ME-Sender: <xms:Pd-lYC3DaLJyaVJkqlqoBRfXimwULuPxKEqE8vmgIDQGEbzC2d1U_g>
 <xme:Pd-lYFGkZ1Hrg6U9xOkpwkcn9v12Z_ckZO28Nq1Rk1ajkDl0uo-cPeehe99g4IbDt
 odzbJGFZUIz5qTYYso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Pd-lYK4UznbiwdwH7R7il_SaFFu4nFKT_DtdCYiMSwF8co1vTjnD5g>
 <xmx:Pd-lYD2OnvW7zqI1JVprfjoU1Z2UdzW-gPOV5rGGEg56Wg7iVflqIQ>
 <xmx:Pd-lYFEizUqPR7vkKG87Gp6IhZ-QtgB8LZHVVjnsvb34FDCv_-Q3-A>
 <xmx:Pd-lYIPZ24aG81CIYymuaaSWpIaE0KeyQzpWyNxazaCHqykgoSmh4w>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:02:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 5/8] ALSA: firewire-lib: skip initial packets instead of
 scheduling IR context
Date: Thu, 20 May 2021 13:01:51 +0900
Message-Id: <20210520040154.80450-6-o-takashi@sakamocchi.jp>
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

Current implementation of ALSA IEC 61883-1/6 packet streaming engine
allows drivers to decide isochronous cycle to start IR context. This
option is mainly used to avoid processing the sequence of packet with
some quirks; e.g. discontinuity of counter. However, it's inconvenient
to fail to continue packet processing when the target device doesn't
start transmission of packet till the decided cycle.

This commit changes the behaviour. As an alternative to the start cycle
for IR context, the cycle count to drop content of packet in the beginning
of IR context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c       | 80 +++++------------------------
 sound/firewire/amdtp-stream.h       |  3 +-
 sound/firewire/bebob/bebob_stream.c | 21 +++-----
 3 files changed, 23 insertions(+), 81 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 35925c9666fc..48ed9612407f 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1199,12 +1199,16 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
 		}
 
 		if (stream_count == callbacked_count) {
+			unsigned int next_cycle;
+
 			list_for_each_entry(s, &d->streams, list) {
 				if (s->direction != AMDTP_IN_STREAM)
 					continue;
 
-				if (compare_ohci_cycle_count(s->next_cycle, cycle) > 0)
-					cycle = s->next_cycle;
+				next_cycle = increment_ohci_cycle_count(s->next_cycle,
+								d->processing_cycle.tx_init_skip);
+				if (compare_ohci_cycle_count(next_cycle, cycle) > 0)
+					cycle = next_cycle;
 
 				s->context->callback.sc = process_tx_packets_intermediately;
 			}
@@ -1533,36 +1537,13 @@ int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_add_stream);
 
-static int get_current_cycle_time(struct fw_card *fw_card, int *cur_cycle)
-{
-	int generation;
-	int rcode;
-	__be32 reg;
-	u32 data;
-
-	// This is a request to local 1394 OHCI controller and expected to
-	// complete without any event waiting.
-	generation = fw_card->generation;
-	smp_rmb();	// node_id vs. generation.
-	rcode = fw_run_transaction(fw_card, TCODE_READ_QUADLET_REQUEST,
-				   fw_card->node_id, generation, SCODE_100,
-				   CSR_REGISTER_BASE + CSR_CYCLE_TIME,
-				   &reg, sizeof(reg));
-	if (rcode != RCODE_COMPLETE)
-		return -EIO;
-
-	data = be32_to_cpu(reg);
-	*cur_cycle = data >> 12;
-
-	return 0;
-}
-
 /**
  * amdtp_domain_start - start sending packets for isoc context in the domain.
  * @d: the AMDTP domain.
- * @ir_delay_cycle: the cycle delay to start all IR contexts.
+ * @tx_init_skip_cycles: the number of cycles to skip processing packets at initial stage of IR
+ *			 contexts.
  */
-int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles)
 {
 	static const struct {
 		unsigned int data_block;
@@ -1581,7 +1562,6 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 	unsigned int idle_irq_interval;
 	unsigned int queue_size;
 	struct amdtp_stream *s;
-	int cycle;
 	int err;
 
 	// Select an IT context as IRQ target.
@@ -1593,6 +1573,8 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 		return -ENXIO;
 	d->irq_target = s;
 
+	d->processing_cycle.tx_init_skip = tx_init_skip_cycles;
+
 	// This is a case that AMDTP streams in domain run just for MIDI
 	// substream. Use the number of events equivalent to 10 msec as
 	// interval of hardware IRQ.
@@ -1615,48 +1597,12 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 	d->syt_offset_state = entry->syt_offset;
 	d->last_syt_offset = TICKS_PER_CYCLE;
 
-	if (ir_delay_cycle > 0) {
-		struct fw_card *fw_card = fw_parent_device(s->unit)->card;
-
-		err = get_current_cycle_time(fw_card, &cycle);
-		if (err < 0)
-			goto error;
-
-		// No need to care overflow in cycle field because of enough
-		// width.
-		cycle += ir_delay_cycle;
-
-		// Round up to sec field.
-		if ((cycle & 0x00001fff) >= CYCLES_PER_SECOND) {
-			unsigned int sec;
-
-			// The sec field can overflow.
-			sec = (cycle & 0xffffe000) >> 13;
-			cycle = (++sec << 13) |
-				((cycle & 0x00001fff) / CYCLES_PER_SECOND);
-		}
-
-		// In OHCI 1394 specification, lower 2 bits are available for
-		// sec field.
-		cycle &= 0x00007fff;
-	} else {
-		cycle = -1;
-	}
-
 	list_for_each_entry(s, &d->streams, list) {
-		int cycle_match;
-
-		if (s->direction == AMDTP_IN_STREAM) {
-			cycle_match = cycle;
-		} else {
-			// IT context starts immediately.
-			cycle_match = -1;
+		if (s->direction == AMDTP_OUT_STREAM)
 			s->ctx_data.rx.seq_index = 0;
-		}
 
 		if (s != d->irq_target) {
-			err = amdtp_stream_start(s, s->channel, s->speed,
-						 cycle_match, queue_size, 0);
+			err = amdtp_stream_start(s, s->channel, s->speed, -1, queue_size, 0);
 			if (err < 0)
 				goto error;
 		}
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 6fad113188fe..ebd040560791 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -289,6 +289,7 @@ struct amdtp_domain {
 	struct amdtp_stream *irq_target;
 
 	struct {
+		unsigned int tx_init_skip;
 		unsigned int tx_start;
 	} processing_cycle;
 
@@ -309,7 +310,7 @@ void amdtp_domain_destroy(struct amdtp_domain *d);
 int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 			    int channel, int speed);
 
-int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle);
+int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles);
 void amdtp_domain_stop(struct amdtp_domain *d);
 
 static inline int amdtp_domain_set_events_per_period(struct amdtp_domain *d,
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index b612ee3e33b6..8053d02b68f0 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -626,7 +626,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		enum snd_bebob_clock_type src;
 		struct amdtp_stream *master, *slave;
 		unsigned int curr_rate;
-		unsigned int ir_delay_cycle;
+		unsigned int tx_init_skip_cycles;
 
 		if (bebob->maudio_special_quirk) {
 			err = bebob->spec->rate->get(bebob, &curr_rate);
@@ -654,20 +654,13 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		if (err < 0)
 			goto error;
 
-		// The device postpones start of transmission mostly for 1 sec
-		// after receives packets firstly. For safe, IR context starts
-		// 0.4 sec (=3200 cycles) later to version 1 or 2 firmware,
-		// 2.0 sec (=16000 cycles) for version 3 firmware. This is
-		// within 2.5 sec (=CALLBACK_TIMEOUT).
-		// Furthermore, some devices transfer isoc packets with
-		// discontinuous counter in the beginning of packet streaming.
-		// The delay has an effect to avoid detection of this
-		// discontinuity.
+		// Some devices transfer isoc packets with discontinuous counter in the beginning
+		// of packet streaming.
 		if (bebob->version < 2)
-			ir_delay_cycle = 3200;
+			tx_init_skip_cycles = 3200;
 		else
-			ir_delay_cycle = 16000;
-		err = amdtp_domain_start(&bebob->domain, ir_delay_cycle);
+			tx_init_skip_cycles = 16000;
+		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles);
 		if (err < 0)
 			goto error;
 
@@ -684,6 +677,8 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 			}
 		}
 
+		// Some devices postpone start of transmission mostly for 1 sec after receives
+		// packets firstly.
 		if (!amdtp_stream_wait_callback(&bebob->rx_stream,
 						CALLBACK_TIMEOUT) ||
 		    !amdtp_stream_wait_callback(&bebob->tx_stream,
-- 
2.27.0

