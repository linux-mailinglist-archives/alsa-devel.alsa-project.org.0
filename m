Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FBA6F801
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7BBB171D;
	Mon, 22 Jul 2019 05:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7BBB171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563766794;
	bh=3aCfIUbXs4AC4W22QCpEex2R088I81M/DG8OawAr8L0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ruWOhoLaZPYV+thlbCD4QFRU2ZMzX/0WjBy9H9aGpJCBWlnBUtijaFaklvlE8OQ9+
	 rkcmIqkWGenz0OOKy36kg1Ek3mIoJHhZNtyHcn/FO40uXUY/Hgc2Y+fbbUCCvFMvgm
	 pjzNg3+g+l7C+ZP3fsvz+hGhCo9f7UDYKQ8xKRKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D74C9F803D1;
	Mon, 22 Jul 2019 05:37:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B39BF800E8; Mon, 22 Jul 2019 05:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC7C4F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC7C4F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ac9W6R0t"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hJIPRWK1"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7094D21ADD;
 Sun, 21 Jul 2019 23:37:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4Y3KYr8WoesCm
 77gu0fFCfcX6ixENBpfbiRniNiwC3w=; b=ac9W6R0t2LHZwEAU2BSBFDBudB6YZ
 TjZ/VTg4ihbYvog2AvcyA2rPj3lEo/sTXNAAb2SpPMYqDxR+0SXLgTIC7JGvzPEk
 pKFcr9RdemAWbh6uZD+WorDxMUvHUGtW1r6xq2srBZFi+6/QL6cZx/mpeHRgu9Ue
 YOiaSjDnvEexGcbXXIs6LGKjmWbDeuwNQ7frdKZH1R7WllMO1hx8eyo7b11y9ZSv
 b8U5x7xFHkvLzA1blnM3gbV+HzfmgBBCywVhbyqpObyOjebuYh22qcWV9/89wf0N
 JPfmbcUQYQrCS+2lK95WAjAUte5yT3SNPkRJVYkXY0+7tpG71oLmtxb4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4Y3KYr8WoesCm77gu0fFCfcX6ixENBpfbiRniNiwC3w=; b=hJIPRWK1
 GYCMZ4ZcIeAvpJfVbCIapVIu6KzxjTb+8WTdjHBtYDEuXBiPR94INQCEDmnveyHA
 y/LofvVM+A8ohxHF/X8T9cKcpXiubh358ZkGCHMUSAObj1KKiA0+tH9Uzgo+7GTT
 eTuCFL28iBpemAIUma1blv0/AVRhsWqQhHAt6YJatET3dArd351mYW4BKMRvtE3w
 Z77Xt2BJvsMqVXw+mv4Ay363gB4uRqJeMG2hLWOlGnDMNZdykYksDk3BPn46TVPL
 A5uHKq9Oz2zlji2RTI/b8oGUg9jxrnAGhOegDurj998mvV4BUvZZuWwf+OpfY7a8
 QVwkFIcasN/LVw==
X-ME-Sender: <xms:bS81XYoxbjL4Uliiqens4NM-7SQeiI8va36V7oTjXExovpQ-cT_p4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bS81XcXMEEySTY6N2o2d__qvruYcbKKVgSj1qqvsxaCmCAYoR6GntA>
 <xmx:bS81XXrEF9e7AaYv0mGz92IeVulOvlt6EMF0MznoOrmQ9aErQioCaA>
 <xmx:bS81XYFl5uWhcnvck5l766Q939CiI59gt19_Z-6FE2QWvScWzS6T_g>
 <xmx:bS81XTeaJS608BNvd0UzKZIN78M5aa-l3bv35l8f6YoZTYyy7tX-Cg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 034B880060;
 Sun, 21 Jul 2019 23:37:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:51 +0900
Message-Id: <20190722033710.28107-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 01/20] ALSA: firewire-lib: obsolete
	ctx_data.tx.first_dbc with CIP_UNALIGHED_DBC flag
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

Recent firmware for Fireworks board module have a quirk to start
transmission of CIP with non-zero value for its data block counter.
In current implementation of ALSA firewire stack, the quirk is handled
by 'struct amdtp_stream.ctx_data.tx.first_dbc' with value 0x02. However,
the value comes from reverse engineering. It's better to handle this
quirk without the explicit value.

In a process to parse CIP header, the quirk of data block counter
affects decision of sequence index in sequence-multiplexed data channel;
i.e. MIDI conformant data channel. In Fireworks, the index is decided
by the number of data blocks from top of the same CIP, thus the value
of data block counter is useless.

This commit adds CIP_UNALIGHED_DBC flag and obsoletes the explicit
value for this quirk.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c                | 8 ++++++--
 sound/firewire/amdtp-stream.c               | 3 +--
 sound/firewire/amdtp-stream.h               | 5 +++--
 sound/firewire/fireworks/fireworks_stream.c | 2 +-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index fd5d6b8ac557..99c567ded7a3 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -315,12 +315,16 @@ static void read_midi_messages(struct amdtp_stream *s,
 			       __be32 *buffer, unsigned int frames)
 {
 	struct amdtp_am824 *p = s->protocol;
-	unsigned int f, port;
 	int len;
 	u8 *b;
+	int f;
 
 	for (f = 0; f < frames; f++) {
-		port = (8 - s->ctx_data.tx.first_dbc + s->data_block_counter + f) % 8;
+		unsigned int port = f;
+
+		if (!(s->flags & CIP_UNALIGHED_DBC))
+			port += s->data_block_counter;
+		port %= 8;
 		b = (u8 *)&buffer[p->midi_position];
 
 		len = b[0] - 0x80;
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 4d71d74707cf..fc1e8e5b9429 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -584,8 +584,7 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 	    s->data_block_counter != UINT_MAX)
 		*dbc = s->data_block_counter;
 
-	if (((s->flags & CIP_SKIP_DBC_ZERO_CHECK) &&
-	     *dbc == s->ctx_data.tx.first_dbc) ||
+	if ((*dbc == 0x00 && (s->flags & CIP_SKIP_DBC_ZERO_CHECK)) ||
 	    s->data_block_counter == UINT_MAX) {
 		lost = false;
 	} else if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 3942894c11ac..5d611122312b 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -33,6 +33,8 @@
  * @CIP_HEADER_WITHOUT_EOH: Only for in-stream. CIP Header doesn't include
  *	valid EOH.
  * @CIP_NO_HEADERS: a lack of headers in packets
+ * @CIP_UNALIGHED_DBC: Only for in-stream. The value of dbc is not alighed to
+ *	the value of current SYT_INTERVAL; e.g. initial value is not zero.
  */
 enum cip_flags {
 	CIP_NONBLOCKING		= 0x00,
@@ -45,6 +47,7 @@ enum cip_flags {
 	CIP_JUMBO_PAYLOAD	= 0x40,
 	CIP_HEADER_WITHOUT_EOH	= 0x80,
 	CIP_NO_HEADER		= 0x100,
+	CIP_UNALIGHED_DBC	= 0x200,
 };
 
 /**
@@ -119,8 +122,6 @@ struct amdtp_stream {
 			// Fixed interval of dbc between previos/current
 			// packets.
 			unsigned int dbc_interval;
-			// Indicate the value of dbc field in a first packet.
-			unsigned int first_dbc;
 		} tx;
 		struct {
 			// To calculate CIP data blocks and tstamp.
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index e659a0b89ba5..385fc9686365 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -146,7 +146,7 @@ int snd_efw_stream_init_duplex(struct snd_efw *efw)
 	    (efw->firmware_version == 0x5070000 ||
 	     efw->firmware_version == 0x5070300 ||
 	     efw->firmware_version == 0x5080000))
-		efw->tx_stream.ctx_data.tx.first_dbc = 0x02;
+		efw->tx_stream.flags |= CIP_UNALIGHED_DBC;
 	/* AudioFire9 always reports wrong dbs. */
 	if (efw->is_af9)
 		efw->tx_stream.flags |= CIP_WRONG_DBS;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
