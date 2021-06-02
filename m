Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C45D2397E18
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 03:36:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19AC316EE;
	Wed,  2 Jun 2021 03:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19AC316EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622597767;
	bh=OpOwX55kqfXWxKPnLFZ4B3u5m2ILnIK3hE6hvWuiDc0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qo387yVDKZgza7QV3r3PWDFp0NeFPepDBDkNZrudsKvfgChevwbCZITAQOlXH+/us
	 rE/4BbqmFujyRuXXwWucBH0LX6El+qkO/ojZmGSEidH/zsEayV/vGBgiflKne4lJ5/
	 ra8u8nB3+0dj2zVoSHEYTQBJZxZsJ8TA5lt9dOBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0499F8049E;
	Wed,  2 Jun 2021 03:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5C9F804BB; Wed,  2 Jun 2021 03:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85C78F802A9
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 03:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C78F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="wc+unqed"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="h3YmpX4b"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6E76115A9;
 Tue,  1 Jun 2021 21:34:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Jun 2021 21:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ieMbjFiFptira
 qHvAmxKvyj1/JInKkD1FLO2aNy4Eow=; b=wc+unqedmVeOevl88KkGralkGVrh5
 VgJJ6Fcwxdj37mHV43K4gfYRFFZAMtb2mJtqP2DKsPEq5yCkMZtwB2Vp9dPXDpA+
 b5J4hPbGI3FtGqLGDOjGsAW1T9YyzSqlELBsFfDPBkhfJMPAkZhbD52N42wTdWtH
 ugRnWxokLd/RDY2oe+Ds8eAoIhMSSRSJV88QsJdNCO1iXWl4Fa8/Hxu75/e0Ply0
 jISKlfIdvr86+peEAxQosciRJ2y5PB7PbnBBuslFa6Nf8+42t2ebjxkan80Vn9qb
 drSRAqU6ycThvDHVF71ZuH7f2Rfm+kAfIpga/xDAb/rjhPfSRX2h+ns7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ieMbjFiFptiraqHvAmxKvyj1/JInKkD1FLO2aNy4Eow=; b=h3YmpX4b
 ObpLzSbuGnZ8a0nNlLJzyKCXUGOI/C3dsmqdc8GYcAQuje8MyFwpH26Mdf92INNF
 G6yKxZKo82qtmHsfdGTv16ubqkoB4n8Cu33PtZVfDRCEoHDmRLpiPJNzwInFYmFc
 LwlnOAi3y+TR6gbb/UbZomrkQ9KeqRRWlM3bxWa6JGjYsLMoJ8IBwyv/OfRxzmsv
 3zbsKLnyBzjv4HeA7SmbarzAErWyY3SCY7eLnaPvpgkG9KltAnQOO4Zhp28Jb+IT
 vayJzZ3NFfc/N/NrU8Q+IoeV7sMaA3mK42hy0im39QABjnua1Utj+4I5m5WZ4CUS
 Zd7c1m83qBDKOw==
X-ME-Sender: <xms:FOC2YE9QYQwwr-BKg2aBaPerk3ADjKAqAZywNUQ53d6i-J-9MFyv7w>
 <xme:FOC2YMtHYIbveP5luR3gfXhytJyajuJ2trdIinDXJoE6TErrt7hKR4Hlq8efUHQNr
 PL7_vMuXbF8jns-GFA>
X-ME-Received: <xmr:FOC2YKBLA-jG7G_QfkPMKZSS_WLeAdW6KRdG2qe7K2VibpvKisy1U0MaZW-LDIrucknOSzVEJ2mKEWKUZqqNHkOWCOEdaV5-VXFF-FfZCMiUyO1EMeBZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeliedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:FOC2YEdfvHuxWAcm0UsyktiOUELlsrGDwSGpCg7BqGKu6WtQwmsoxQ>
 <xmx:FOC2YJMfhpA0a_fJk_3-LIzzXEq7YMSWrc7qEJjTSFqpfaeOPXwxKA>
 <xmx:FOC2YOkf5B8oWMrdOuKAwH-a5C2eT9vjIrpGbOroNU_aLATwFJP7Bw>
 <xmx:FeC2YH1sD-xi0dh6WSZtjG8TcVaJnxz1_ojpUecYCuvT8iVARvMt5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 21:34:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: firewire-motu: use macro for magic numbers relevant
 to IEC 61883-1
Date: Wed,  2 Jun 2021 10:34:04 +0900
Message-Id: <20210602013406.26442-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602013406.26442-1-o-takashi@sakamocchi.jp>
References: <20210602013406.26442-1-o-takashi@sakamocchi.jp>
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

ALSA firewire-motu driver has some magic numbers from IEC 61883-1 to
operates source packet header (SPH). This commit replaces them with
macros.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c | 40 +++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 18bf433f43b6..89638e1fbb69 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -16,6 +16,18 @@
 #define CIP_FMT_MOTU_TX_V3	0x22
 #define MOTU_FDF_AM824		0x22
 
+#define TICKS_PER_CYCLE		3072
+#define CYCLES_PER_SECOND	8000
+#define TICKS_PER_SECOND	(TICKS_PER_CYCLE * CYCLES_PER_SECOND)
+
+#define IEEE1394_SEC_MODULUS	128
+
+#define TRANSFER_DELAY_TICKS	0x2e00 /* 479.17 microseconds */
+
+#define CIP_SPH_CYCLE_SHIFT	12
+#define CIP_SPH_CYCLE_MASK	0x01fff000
+#define CIP_SPH_OFFSET_MASK	0x00000fff
+
 /*
  * Nominally 3125 bytes/second, but the MIDI port's clock might be
  * 1% too slow, and the bus clock 100 ppm too fast.
@@ -97,17 +109,16 @@ int amdtp_motu_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	p->midi_db_count = 0;
 	p->midi_db_interval = rate / MIDI_BYTES_PER_SECOND;
 
-	/* IEEE 1394 bus requires. */
-	delay = 0x2e00;
+	delay = TRANSFER_DELAY_TICKS;
 
-	/* For no-data or empty packets to adjust PCM sampling frequency. */
-	delay += 8000 * 3072 * s->syt_interval / rate;
+	// For no-data or empty packets to adjust PCM sampling frequency.
+	delay += TICKS_PER_SECOND * s->syt_interval / rate;
 
 	p->next_seconds = 0;
-	p->next_cycles = delay / 3072;
+	p->next_cycles = delay / TICKS_PER_CYCLE;
 	p->quotient_ticks_per_event = params[s->sfc].quotient_ticks_per_event;
 	p->remainder_ticks_per_event = params[s->sfc].remainder_ticks_per_event;
-	p->next_ticks = delay % 3072;
+	p->next_ticks = delay % TICKS_PER_CYCLE;
 	p->next_accumulated = 0;
 
 	return 0;
@@ -363,18 +374,18 @@ static inline void compute_next_elapse_from_start(struct amdtp_motu *p)
 	}
 
 	p->next_ticks += p->quotient_ticks_per_event;
-	if (p->next_ticks >= 3072) {
-		p->next_ticks -= 3072;
+	if (p->next_ticks >= TICKS_PER_CYCLE) {
+		p->next_ticks -= TICKS_PER_CYCLE;
 		p->next_cycles++;
 	}
 
-	if (p->next_cycles >= 8000) {
-		p->next_cycles -= 8000;
+	if (p->next_cycles >= CYCLES_PER_SECOND) {
+		p->next_cycles -= CYCLES_PER_SECOND;
 		p->next_seconds++;
 	}
 
-	if (p->next_seconds >= 128)
-		p->next_seconds -= 128;
+	if (p->next_seconds >= IEEE1394_SEC_MODULUS)
+		p->next_seconds -= IEEE1394_SEC_MODULUS;
 }
 
 static void write_sph(struct amdtp_stream *s, __be32 *buffer, unsigned int data_blocks,
@@ -386,8 +397,9 @@ static void write_sph(struct amdtp_stream *s, __be32 *buffer, unsigned int data_
 	u32 sph;
 
 	for (i = 0; i < data_blocks; i++) {
-		next_cycles = (rx_start_cycle + p->next_cycles) % 8000;
-		sph = ((next_cycles << 12) | p->next_ticks) & 0x01ffffff;
+		next_cycles = (rx_start_cycle + p->next_cycles) % CYCLES_PER_SECOND;
+		sph = ((next_cycles << CIP_SPH_CYCLE_SHIFT) | p->next_ticks) &
+		      (CIP_SPH_CYCLE_MASK | CIP_SPH_OFFSET_MASK);
 		*buffer = cpu_to_be32(sph);
 
 		compute_next_elapse_from_start(p);
-- 
2.27.0

