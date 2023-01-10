Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA8664250
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 14:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87EC38AE4;
	Tue, 10 Jan 2023 14:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87EC38AE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673358682;
	bh=NVjAuIumiUR230u9WUVNXhz6j7a7AajPcQDctOP2NqM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W78ErTPjHgjeko4zxCkcX9WDCoJ7zKES/x23fG2sY23zsP4VRzHoYzy1rY7VqJof0
	 idXj4jbTks6twUNJ/7qcLTIpqlkeZ/D54+iXPmLKaZRjzpo9M7eRbFfndwXZC6wphu
	 WCsk4gEqN88qJhE/+CeIsL3cV9IGW5hYhtb3d/NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB7E9F80552;
	Tue, 10 Jan 2023 14:49:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4378DF80542; Tue, 10 Jan 2023 14:49:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F20DCF804D9
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 14:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F20DCF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=HVVaCcqS; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NHDw/AJW
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BF6AD5C0134;
 Tue, 10 Jan 2023 08:49:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 10 Jan 2023 08:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673358581; x=
 1673444981; bh=0Emcl8G9/A5QVEe2uyAFeP376p0PzVxV17iq0NCxdGw=; b=H
 VVaCcqSbFJHhWeYIZcVznGp35FDhzGASNCv10gvTkNzzk7+De6Nk9NcyUCATrUbv
 8cYJH6uGPiijUn2S1ON4f84UoJKtF7b+TnQtcVxp7u0tnBR6L3N0htKrNINXDpef
 /OJ10v2ylzZMxiziYOfsPDM7NYEgR6gTzCU/T7EMHUfwOFa51JySjR7sv+8ox3kx
 ZcwGcL9GGb4lHKoDUr0H891U0/ik901D5+yL5UPjZ9+hPaY7/NTB9KLXr1tfbRIT
 q7JLXt4gN9ls/aeDQgzTkAX640G3QT6lgD8wBpo1ais6YRrDb5Q93MdiwkSG7/qq
 kTC/ewCpZaLtfmRuOhutg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673358581; x=1673444981; bh=0Emcl8G9/A5QV
 Ee2uyAFeP376p0PzVxV17iq0NCxdGw=; b=NHDw/AJWWEdDiwphsioHc3SgZBzra
 IxiHZZtLNNho4FovUveUwF2gXP3NvWLu6VYBq0B3IwsPhb9EYKFOjj7orXtjmqYQ
 UZcOTb84piA9GUQsK89SUjliKc0o1LBfBpbMeqZEiStpiH9hp9OPUGAILdrtgtdi
 yciNkvhX5PkWS+qdRYedII2O34R6JdthbRIjZhsg5sCOsIefIceCc7ZsQ/VU7n5c
 MGbA20bLO0phRGeTcHFxOa5OhvGcisqOwAtDnowJXxEg1ObAMCie6iG3toazYUeB
 t1u4SXoucEDRc6CUmawB9gel68F1KAxGH2Fg8kQd9IMdP+yvDLTslnUTA==
X-ME-Sender: <xms:9Wy9Y3WstkX617I4UKmDeL5v5qnZutLzHxximgzB_6q044Ac97CxcQ>
 <xme:9Wy9Y_mniodphwEe40wZu71hkZCxRNn77NLrdQm3ibGxf7YxPdbvkj-sGfmuMIjNX
 Y1m5c8yw7WI1vDcVtc>
X-ME-Received: <xmr:9Wy9YzaT3wf_5gN2k0RsaPt9GbS-_rkG7adgKWN3OPVPeBaSKtbcC7ViUJcftW0r8-SKKjs5PD2FUtjDzPYq3j7wgXB6t895oisRumrgA23o5QIlORqGNyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeekgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9Wy9YyWeHwerwkFZedtSXWT_k-xpqvqsX_Ju0mLVlVC36HEGuX99gA>
 <xmx:9Wy9YxlY64wvDXTT8ITPl8SpWhrbD9dk372hdEafWysOvbeDgKAYOQ>
 <xmx:9Wy9Y_eUTdcLS2kfsO_jdLgfCnMSKMIUZJnl2fHik8SOf4P8OpQP3w>
 <xmx:9Wy9Yxtp_H-Eg-Jr16_raU8gmIQj7wLoN2-u1Ukf-YvT-REJCqBeNg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 08:49:40 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] ALSA: firewire-lib: compute extra delay for runtime of
 PCM substream
Date: Tue, 10 Jan 2023 22:49:33 +0900
Message-Id: <20230110134933.322794-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230110134933.322794-1-o-takashi@sakamocchi.jp>
References: <20230110134933.322794-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All drivers in ALSA firewire stack have never reported extra delay for
the runtime of PCM substream. There is some reason, but the main reason
is that the meaning of extra delay differs depending on driver design,
especially for the packet-oriented driver.

Here I define the extra delay for the case of IEC 61883-1/6. It is the
number of PCM frames transferred or should be transferred between the
current isochronous cycle and the isochronous cycle to which the latest
isochronous packet arrived (in IR context) or is scheduled (in IT context).

A commit baa914cd81f5 ("firewire: add kernel API to access CYCLE_TIME
register") allow unit drivers to read CYCLE_TIME of 1394 OHCI controller.
It allows the drivers to compute the current isochronous cycle.

Additionally, a commit f0117128879b ("ALSA: firewire-lib: keep history to
process isochronous packet") enables to save the history processing
packets. It allows the driver to estimate the total number of data blocks
in packets arriving shortly, or calculate the total number of data blocks
in scheduled packets.

Now it is ready. This commit implements the computation of the extra delay.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 83 ++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 03e97faca797..16e45ac28607 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -352,6 +352,9 @@ void amdtp_stream_pcm_prepare(struct amdtp_stream *s)
 }
 EXPORT_SYMBOL(amdtp_stream_pcm_prepare);
 
+#define prev_packet_desc(s, desc) \
+	list_prev_entry_circular(desc, &s->packet_descs_list, link)
+
 static void pool_blocking_data_blocks(struct amdtp_stream *s, struct seq_desc *descs,
 				      unsigned int size, unsigned int pos, unsigned int count)
 {
@@ -851,10 +854,15 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 // In CYCLE_TIMER register of IEEE 1394, 7 bits are used to represent second. On
 // the other hand, in DMA descriptors of 1394 OHCI, 3 bits are used to represent
 // it. Thus, via Linux firewire subsystem, we can get the 3 bits for second.
+static inline u32 compute_ohci_iso_ctx_cycle_count(u32 tstamp)
+{
+	return (((tstamp >> 13) & 0x07) * CYCLES_PER_SECOND) + (tstamp & 0x1fff);
+}
+
 static inline u32 compute_ohci_cycle_count(__be32 ctx_header_tstamp)
 {
 	u32 tstamp = be32_to_cpu(ctx_header_tstamp) & HEADER_TSTAMP_MASK;
-	return (((tstamp >> 13) & 0x07) * 8000) + (tstamp & 0x1fff);
+	return compute_ohci_iso_ctx_cycle_count(tstamp);
 }
 
 static inline u32 increment_ohci_cycle_count(u32 cycle, unsigned int addend)
@@ -865,6 +873,14 @@ static inline u32 increment_ohci_cycle_count(u32 cycle, unsigned int addend)
 	return cycle;
 }
 
+static inline u32 decrement_ohci_cycle_count(u32 minuend, u32 subtrahend)
+{
+	if (minuend < subtrahend)
+		minuend += OHCI_SECOND_MODULUS * CYCLES_PER_SECOND;
+
+	return minuend - subtrahend;
+}
+
 static int compare_ohci_cycle_count(u32 lval, u32 rval)
 {
 	if (lval == rval)
@@ -1035,6 +1051,63 @@ static inline void cancel_stream(struct amdtp_stream *s)
 	WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
 }
 
+static snd_pcm_sframes_t compute_pcm_extra_delay(struct amdtp_stream *s,
+						 const struct pkt_desc *desc, unsigned int count)
+{
+	unsigned int data_block_count = 0;
+	u32 latest_cycle;
+	u32 cycle_time;
+	u32 curr_cycle;
+	u32 cycle_gap;
+	int i, err;
+
+	if (count == 0)
+		goto end;
+
+	// Forward to the latest record.
+	for (i = 0; i < count - 1; ++i)
+		desc = amdtp_stream_next_packet_desc(s, desc);
+	latest_cycle = desc->cycle;
+
+	err = fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &cycle_time);
+	if (err < 0)
+		goto end;
+
+	// Compute cycle count with lower 3 bits of second field and cycle field like timestamp
+	// format of 1394 OHCI isochronous context.
+	curr_cycle = compute_ohci_iso_ctx_cycle_count((cycle_time >> 12) & 0x0000ffff);
+
+	if (s->direction == AMDTP_IN_STREAM) {
+		// NOTE: The AMDTP packet descriptor should be for the past isochronous cycle since
+		// it corresponds to arrived isochronous packet.
+		if (compare_ohci_cycle_count(latest_cycle, curr_cycle) > 0)
+			goto end;
+		cycle_gap = decrement_ohci_cycle_count(curr_cycle, latest_cycle);
+
+		// NOTE: estimate delay by recent history of arrived AMDTP packets. The estimated
+		// value expectedly corresponds to a few packets (0-2) since the packet arrived at
+		// the most recent isochronous cycle has been already processed.
+		for (i = 0; i < cycle_gap; ++i) {
+			desc = amdtp_stream_next_packet_desc(s, desc);
+			data_block_count += desc->data_blocks;
+		}
+	} else {
+		// NOTE: The AMDTP packet descriptor should be for the future isochronous cycle
+		// since it was already scheduled.
+		if (compare_ohci_cycle_count(latest_cycle, curr_cycle) < 0)
+			goto end;
+		cycle_gap = decrement_ohci_cycle_count(latest_cycle, curr_cycle);
+
+		// NOTE: use history of scheduled packets.
+		for (i = 0; i < cycle_gap; ++i) {
+			data_block_count += desc->data_blocks;
+			desc = prev_packet_desc(s, desc);
+		}
+	}
+end:
+	return data_block_count * s->pcm_frame_multiplier;
+}
+
 static void process_ctx_payloads(struct amdtp_stream *s,
 				 const struct pkt_desc *desc,
 				 unsigned int count)
@@ -1048,6 +1121,8 @@ static void process_ctx_payloads(struct amdtp_stream *s,
 	if (pcm) {
 		unsigned int data_block_count = 0;
 
+		pcm->runtime->delay = compute_pcm_extra_delay(s, desc, count);
+
 		for (i = 0; i < count; ++i) {
 			data_block_count += desc->data_blocks;
 			desc = amdtp_stream_next_packet_desc(s, desc);
@@ -1686,7 +1761,11 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 	else
 		s->tag = TAG_CIP;
 
-	descs = kcalloc(s->queue_size, sizeof(*descs), GFP_KERNEL);
+	// NOTE: When operating without hardIRQ/softIRQ, applications tends to call ioctl request
+	// for runtime of PCM substream in the interval equivalent to the size of PCM buffer. It
+	// could take a round over queue of AMDTP packet descriptors and small loss of history. For
+	// safe, keep more 8 elements for the queue, equivalent to 1 ms.
+	descs = kcalloc(s->queue_size + 8, sizeof(*descs), GFP_KERNEL);
 	if (!descs) {
 		err = -ENOMEM;
 		goto err_context;
-- 
2.37.2

