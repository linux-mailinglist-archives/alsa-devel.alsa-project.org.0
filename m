Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0591D953C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E765D179A;
	Tue, 19 May 2020 13:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E765D179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887510;
	bh=XOGg+EBhWXEypzQxv2O5aISLTlUZAfgumy1bbTKzJ4A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYbTauJxsKAVSxENizQ+3EhY7Zg/RIcclN79oLXQr2oUInqcFJznnUa2a1Vm7qup/
	 T/HcKvRWUc8VHeAQ+B720fByQ30bhediAc9tP3HifpNd52fAlK0DFaCJhnS0InBb08
	 EzvH+VekUUxHcd273XJ1uq3vXztCD5fe+bTREJDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80140F80308;
	Tue, 19 May 2020 13:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7268F80256; Tue, 19 May 2020 13:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2B2CF801F8
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B2CF801F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pM5RKy+3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bqpx+b6K"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EA83D5C0130;
 Tue, 19 May 2020 07:17:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RQpaR1AvEhJyS
 xTsTudWSo3J2+nz1C2zjic7B4mn53k=; b=pM5RKy+3/jLbfM8WKB5YLW92ukl6K
 klfB2ZAPTANyeeaC1UxSYlD/Y0rv73enPURMnNpu5zbeJShUhemBZonvB20NOm+b
 bpQrmoy0IPye5Yk/plxLEUezetSZYmslO3PDlZvFjAKoC3BAwLIEIhPn1hnTeVwV
 VS0PXFTzYBKfRoAMHPxqf7rAMiZr1xKoA2A5pm4igSAzktdfb4LpMmH1/SiAWocI
 S4Yn3Hw0Jjn6xBHX3Kb2dby49j5gQ08bSzrUPXcYq0+t4DtkPXATef3zNbMq5bN7
 wwH042PkTtL2uqjJCaLMZb0/+ecFYpdKE0mVJZOGAP9PYJI8WrVrR1ZwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RQpaR1AvEhJySxTsTudWSo3J2+nz1C2zjic7B4mn53k=; b=bqpx+b6K
 gC1w182QdfPLPDSEF42Uay2oBx7uCjYJaBb+R1G27SHKmrzXgkT41PEU7aQF2gmR
 tScS5ddxe8CVePz1+RnVYyEKvwaw5NJqUytKvKODzHaFNNVs4Q46ePyNeFHWt44N
 UtO5QcvsMf+4zExacmX7sOyZxk2yHCAGVgSpgi3liG86eBytv7s9BgRPCMG+96S8
 pNRkIZmBhTgVzbc/Kq+ho5b/U794WTrhue5tGWj1biMI3LqrfXTmfj6x68Mh6lbd
 OPftJI3fJTxgmaib8JbhGP2LSYW2kJ3Fcmb60XorjZUCBhd8Zj+IjAvmOCb6HkOu
 8jCuq2wOoqsxow==
X-ME-Sender: <xms:LsDDXuhpBeVLtXHbUGsc6c-LCkmMT_Oig-_71K-sP18-2ve-Ub58bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:LsDDXvCjSnoPeTidHehqnJmz1NQ0bjZv84MUtIHU7akcjhUBczC6CQ>
 <xmx:LsDDXmHFsVkvSCisphSGXXLdsb5kmGidpy6CzbEmAvOSic3qyFqkhQ>
 <xmx:LsDDXnScVUCMloGKO2JnFQKzjzLWVuIDCCKu9E2S908yCkFVWbPkLg>
 <xmx:LsDDXstk5VBKQm4-DwCdTLB7296zdZHZRbZPwSEkAYy8zxf0-Cm9kw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6624B328005E;
 Tue, 19 May 2020 07:17:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 11/14] ALSA: firewire-motu: remove obsoleted codes
Date: Tue, 19 May 2020 20:16:38 +0900
Message-Id: <20200519111641.123211-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
References: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The way to decide CIP payload size by calculation with any flag is now
obsoleted. This commit removes the codes.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 127 +-------------------
 sound/firewire/motu/motu-protocol-v3.c | 158 +------------------------
 sound/firewire/motu/motu.h             |  22 +---
 3 files changed, 11 insertions(+), 296 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 2ed800ccf6a2..1bdc905e8e22 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -186,86 +186,6 @@ int snd_motu_protocol_v2_switch_fetching_mode(struct snd_motu *motu,
 					  sizeof(reg));
 }
 
-static void calculate_fixed_part(struct snd_motu_packet_format *formats,
-				 enum amdtp_stream_direction dir,
-				 enum snd_motu_spec_flags flags,
-				 unsigned char analog_ports)
-{
-	unsigned char pcm_chunks[3] = {0, 0, 0};
-
-	pcm_chunks[0] = analog_ports;
-	pcm_chunks[1] = analog_ports;
-	if (flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4)
-		pcm_chunks[2] = analog_ports;
-
-	if (dir == AMDTP_IN_STREAM) {
-		if (flags & SND_MOTU_SPEC_TX_MICINST_CHUNK) {
-			pcm_chunks[0] += 2;
-			pcm_chunks[1] += 2;
-		}
-		if (flags & SND_MOTU_SPEC_TX_RETURN_CHUNK) {
-			pcm_chunks[0] += 2;
-			pcm_chunks[1] += 2;
-		}
-	} else {
-		if (flags & SND_MOTU_SPEC_RX_SEPARATED_MAIN) {
-			pcm_chunks[0] += 2;
-			pcm_chunks[1] += 2;
-		}
-
-		// Packets to v2 units include 2 chunks for phone 1/2, except
-		// for 176.4/192.0 kHz.
-		pcm_chunks[0] += 2;
-		pcm_chunks[1] += 2;
-	}
-
-	if (flags & SND_MOTU_SPEC_HAS_AESEBU_IFACE) {
-		pcm_chunks[0] += 2;
-		pcm_chunks[1] += 2;
-	}
-
-	/*
-	 * All of v2 models have a pair of coaxial interfaces for digital in/out
-	 * port. At 44.1/48.0/88.2/96.0 kHz, packets includes PCM from these
-	 * ports.
-	 */
-	pcm_chunks[0] += 2;
-	pcm_chunks[1] += 2;
-
-	formats->fixed_part_pcm_chunks[0] = pcm_chunks[0];
-	formats->fixed_part_pcm_chunks[1] = pcm_chunks[1];
-	formats->fixed_part_pcm_chunks[2] = pcm_chunks[2];
-}
-
-static void calculate_differed_part(struct snd_motu_packet_format *formats,
-				    enum snd_motu_spec_flags flags,
-				    u32 data, u32 mask, u32 shift)
-{
-	unsigned char pcm_chunks[2] = {0, 0};
-
-	/*
-	 * When optical interfaces are configured for S/PDIF (TOSLINK),
-	 * the above PCM frames come from them, instead of coaxial
-	 * interfaces.
-	 */
-	data = (data & mask) >> shift;
-	if (data == V2_OPT_IFACE_MODE_ADAT) {
-		if (flags & SND_MOTU_SPEC_HAS_OPT_IFACE_A) {
-			pcm_chunks[0] += 8;
-			pcm_chunks[1] += 4;
-		}
-		// 8pre has two sets of optical interface and doesn't reduce
-		// chunks for ADAT signals.
-		if (flags & SND_MOTU_SPEC_HAS_OPT_IFACE_B) {
-			pcm_chunks[1] += 4;
-		}
-	}
-
-	/* At mode x4, no data chunks are supported in this part. */
-	formats->differed_part_pcm_chunks[0] = pcm_chunks[0];
-	formats->differed_part_pcm_chunks[1] = pcm_chunks[1];
-}
-
 static int detect_packet_formats_828mk2(struct snd_motu *motu, u32 data)
 {
 	if (((data & V2_OPT_IN_IFACE_MASK) >> V2_OPT_IN_IFACE_SHIFT) ==
@@ -335,16 +255,6 @@ int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu)
 		return err;
 	data = be32_to_cpu(reg);
 
-	calculate_fixed_part(&motu->tx_packet_formats, AMDTP_IN_STREAM,
-			     motu->spec->flags, motu->spec->analog_in_ports);
-	calculate_differed_part(&motu->tx_packet_formats, motu->spec->flags,
-			data, V2_OPT_IN_IFACE_MASK, V2_OPT_IN_IFACE_SHIFT);
-
-	calculate_fixed_part(&motu->rx_packet_formats, AMDTP_OUT_STREAM,
-			     motu->spec->flags, motu->spec->analog_out_ports);
-	calculate_differed_part(&motu->rx_packet_formats, motu->spec->flags,
-			data, V2_OPT_OUT_IFACE_MASK, V2_OPT_OUT_IFACE_SHIFT);
-
 	memcpy(motu->tx_packet_formats.pcm_chunks,
 	       motu->spec->tx_fixed_pcm_chunks,
 	       sizeof(motu->tx_packet_formats.pcm_chunks));
@@ -365,62 +275,35 @@ int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu)
 const struct snd_motu_spec snd_motu_spec_828mk2 = {
 	.name = "828mk2",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
 	.tx_fixed_pcm_chunks = {14, 14, 0},
 	.rx_fixed_pcm_chunks = {14, 14, 0},
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
 };
 
 const struct snd_motu_spec snd_motu_spec_traveler = {
 	.name = "Traveler",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_HAS_AESEBU_IFACE |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
 	.tx_fixed_pcm_chunks = {14, 14, 8},
 	.rx_fixed_pcm_chunks = {14, 14, 8},
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
 };
 
 const struct snd_motu_spec snd_motu_spec_ultralite = {
 	.name = "UltraLite",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK | // padding.
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
+	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
 	.tx_fixed_pcm_chunks = {14, 14, 0},
 	.rx_fixed_pcm_chunks = {14, 14, 0},
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
 };
 
 const struct snd_motu_spec snd_motu_spec_8pre = {
 	.name = "8pre",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	// In tx, use coax chunks for mix-return 1/2. In rx, use coax chunks for
-	// dummy 1/2.
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
 	.tx_fixed_pcm_chunks = {10, 6, 0},
 	.rx_fixed_pcm_chunks = {10, 6, 0},
-	.analog_in_ports = 8,
-	.analog_out_ports = 2,
 };
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 903a7eb209f9..cc100d7be0bf 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -158,124 +158,6 @@ int snd_motu_protocol_v3_switch_fetching_mode(struct snd_motu *motu,
 					  sizeof(reg));
 }
 
-static void calculate_fixed_part(struct snd_motu_packet_format *formats,
-				 enum amdtp_stream_direction dir,
-				 enum snd_motu_spec_flags flags,
-				 unsigned char analog_ports)
-{
-	unsigned char pcm_chunks[3] = {0, 0, 0};
-
-	pcm_chunks[0] = analog_ports;
-	pcm_chunks[1] = analog_ports;
-	if (flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4)
-		pcm_chunks[2] = analog_ports;
-
-	if (dir == AMDTP_IN_STREAM) {
-		if (flags & SND_MOTU_SPEC_TX_MICINST_CHUNK) {
-			pcm_chunks[0] += 2;
-			pcm_chunks[1] += 2;
-			if (flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4)
-				pcm_chunks[2] += 2;
-		}
-
-		if (flags & SND_MOTU_SPEC_TX_RETURN_CHUNK) {
-			pcm_chunks[0] += 2;
-			pcm_chunks[1] += 2;
-			if (flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4)
-				pcm_chunks[2] += 2;
-		}
-
-		if (flags & SND_MOTU_SPEC_TX_REVERB_CHUNK) {
-			pcm_chunks[0] += 2;
-			pcm_chunks[1] += 2;
-		}
-	} else {
-		if (flags & SND_MOTU_SPEC_RX_SEPARATED_MAIN) {
-			pcm_chunks[0] += 2;
-			pcm_chunks[1] += 2;
-		}
-
-		// Packets to v3 units include 2 chunks for phone 1/2, except
-		// for 176.4/192.0 kHz.
-		pcm_chunks[0] += 2;
-		pcm_chunks[1] += 2;
-	}
-
-	if (flags & SND_MOTU_SPEC_HAS_AESEBU_IFACE) {
-		pcm_chunks[0] += 2;
-		pcm_chunks[1] += 2;
-	}
-
-	/*
-	 * At least, packets have two data chunks for S/PDIF on coaxial
-	 * interface.
-	 */
-	pcm_chunks[0] += 2;
-	pcm_chunks[1] += 2;
-
-	/*
-	 * Fixed part consists of PCM chunks multiple of 4, with msg chunks. As
-	 * a result, this part can includes empty data chunks.
-	 */
-	formats->fixed_part_pcm_chunks[0] = round_up(2 + pcm_chunks[0], 4) - 2;
-	formats->fixed_part_pcm_chunks[1] = round_up(2 + pcm_chunks[1], 4) - 2;
-	if (flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4)
-		formats->fixed_part_pcm_chunks[2] =
-					round_up(2 + pcm_chunks[2], 4) - 2;
-}
-
-static void calculate_differed_part(struct snd_motu_packet_format *formats,
-				    enum snd_motu_spec_flags flags, u32 data,
-				    u32 a_enable_mask, u32 a_no_adat_mask,
-				    u32 b_enable_mask, u32 b_no_adat_mask)
-{
-	unsigned char pcm_chunks[3] = {0, 0, 0};
-	int i;
-
-	if ((flags & SND_MOTU_SPEC_HAS_OPT_IFACE_A) && (data & a_enable_mask)) {
-		if (data & a_no_adat_mask) {
-			/*
-			 * Additional two data chunks for S/PDIF on optical
-			 * interface A. This includes empty data chunks.
-			 */
-			pcm_chunks[0] += 4;
-			pcm_chunks[1] += 4;
-		} else {
-			/*
-			 * Additional data chunks for ADAT on optical interface
-			 * A.
-			 */
-			pcm_chunks[0] += 8;
-			pcm_chunks[1] += 4;
-		}
-	}
-
-	if ((flags & SND_MOTU_SPEC_HAS_OPT_IFACE_B) && (data & b_enable_mask)) {
-		if (data & b_no_adat_mask) {
-			/*
-			 * Additional two data chunks for S/PDIF on optical
-			 * interface B. This includes empty data chunks.
-			 */
-			pcm_chunks[0] += 4;
-			pcm_chunks[1] += 4;
-		} else {
-			/*
-			 * Additional data chunks for ADAT on optical interface
-			 * B.
-			 */
-			pcm_chunks[0] += 8;
-			pcm_chunks[1] += 4;
-		}
-	}
-
-	for (i = 0; i < 3; ++i) {
-		if (pcm_chunks[i] > 0)
-			pcm_chunks[i] = round_up(pcm_chunks[i], 4);
-
-		formats->differed_part_pcm_chunks[i] = pcm_chunks[i];
-	}
-}
-
 static int detect_packet_formats_828mk3(struct snd_motu *motu, u32 data)
 {
 	if (data & V3_ENABLE_OPT_IN_IFACE_A) {
@@ -339,20 +221,6 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 		return err;
 	data = be32_to_cpu(reg);
 
-	calculate_fixed_part(&motu->tx_packet_formats, AMDTP_IN_STREAM,
-			     motu->spec->flags, motu->spec->analog_in_ports);
-	calculate_differed_part(&motu->tx_packet_formats,
-			motu->spec->flags, data,
-			V3_ENABLE_OPT_IN_IFACE_A, V3_NO_ADAT_OPT_IN_IFACE_A,
-			V3_ENABLE_OPT_IN_IFACE_B, V3_NO_ADAT_OPT_IN_IFACE_B);
-
-	calculate_fixed_part(&motu->rx_packet_formats, AMDTP_OUT_STREAM,
-			     motu->spec->flags, motu->spec->analog_out_ports);
-	calculate_differed_part(&motu->rx_packet_formats,
-			motu->spec->flags, data,
-			V3_ENABLE_OPT_OUT_IFACE_A, V3_NO_ADAT_OPT_OUT_IFACE_A,
-			V3_ENABLE_OPT_OUT_IFACE_B, V3_NO_ADAT_OPT_OUT_IFACE_B);
-
 	memcpy(motu->tx_packet_formats.pcm_chunks,
 	       motu->spec->tx_fixed_pcm_chunks,
 	       sizeof(motu->tx_packet_formats.pcm_chunks));
@@ -370,46 +238,24 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 const struct snd_motu_spec snd_motu_spec_828mk3 = {
 	.name = "828mk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_TX_REVERB_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
-		 SND_MOTU_SPEC_RX_MIDI_3RD_Q |
+	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
 		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
 	.tx_fixed_pcm_chunks = {18, 18, 14},
 	.rx_fixed_pcm_chunks = {14, 14, 10},
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
 };
 
 const struct snd_motu_spec snd_motu_spec_audio_express = {
 	.name = "AudioExpress",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
 	.tx_fixed_pcm_chunks = {10, 10, 0},
 	.rx_fixed_pcm_chunks = {10, 10, 0},
-	.analog_in_ports = 2,
-	.analog_out_ports = 4,
 };
 
 const struct snd_motu_spec snd_motu_spec_4pre = {
 	.name = "4pre",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
 	.tx_fixed_pcm_chunks = {10, 10, 0},
 	.rx_fixed_pcm_chunks = {10, 10, 0},
-	.analog_in_ports = 2,
-	.analog_out_ports = 2,
 };
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index d071b2342f11..e7948bf1f553 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -37,8 +37,6 @@ struct snd_motu_packet_format {
 
 	unsigned char msg_chunks;
 	unsigned char pcm_chunks[3];
-	unsigned char fixed_part_pcm_chunks[3];
-	unsigned char differed_part_pcm_chunks[3];
 };
 
 struct snd_motu {
@@ -75,19 +73,10 @@ struct snd_motu {
 };
 
 enum snd_motu_spec_flags {
-	SND_MOTU_SPEC_SUPPORT_CLOCK_X2	= 0x0001,
-	SND_MOTU_SPEC_SUPPORT_CLOCK_X4	= 0x0002,
-	SND_MOTU_SPEC_TX_MICINST_CHUNK	= 0x0004,
-	SND_MOTU_SPEC_TX_RETURN_CHUNK	= 0x0008,
-	SND_MOTU_SPEC_TX_REVERB_CHUNK	= 0x0010,
-	SND_MOTU_SPEC_HAS_AESEBU_IFACE	= 0x0020,
-	SND_MOTU_SPEC_HAS_OPT_IFACE_A	= 0x0040,
-	SND_MOTU_SPEC_HAS_OPT_IFACE_B	= 0x0080,
-	SND_MOTU_SPEC_RX_MIDI_2ND_Q	= 0x0100,
-	SND_MOTU_SPEC_RX_MIDI_3RD_Q	= 0x0200,
-	SND_MOTU_SPEC_TX_MIDI_2ND_Q	= 0x0400,
-	SND_MOTU_SPEC_TX_MIDI_3RD_Q	= 0x0800,
-	SND_MOTU_SPEC_RX_SEPARATED_MAIN	= 0x1000,
+	SND_MOTU_SPEC_RX_MIDI_2ND_Q	= 0x0001,
+	SND_MOTU_SPEC_RX_MIDI_3RD_Q	= 0x0002,
+	SND_MOTU_SPEC_TX_MIDI_2ND_Q	= 0x0004,
+	SND_MOTU_SPEC_TX_MIDI_3RD_Q	= 0x0008,
 };
 
 #define SND_MOTU_CLOCK_RATE_COUNT	6
@@ -121,9 +110,6 @@ struct snd_motu_spec {
 
 	unsigned char tx_fixed_pcm_chunks[3];
 	unsigned char rx_fixed_pcm_chunks[3];
-
-	unsigned char analog_in_ports;
-	unsigned char analog_out_ports;
 };
 
 extern const struct snd_motu_spec snd_motu_spec_828mk2;
-- 
2.25.1

