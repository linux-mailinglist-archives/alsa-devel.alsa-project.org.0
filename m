Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA5C6671C9
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 13:13:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 120823FFA;
	Thu, 12 Jan 2023 13:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 120823FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673525583;
	bh=gK8/tkpYlxATkQsO9XNO4Z2bjpTVjR3SuXTh09/vKpo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=c5bhzViE9J8Yr15V6gw0KXOljVccDO3ewd2RTZz7JUgnAvgz6U7FF8rfK5DUgzpvU
	 VUZkN9AeNFfDc36sVZcmkKsdZploZErlmvRJCeN302WlpQzG9JsQ0RLohr2fHvtLdn
	 XXy6Uu6fL4djbP80xQZ6WsBEn1MaZ5QOWNXLPsVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A43D9F80571;
	Thu, 12 Jan 2023 13:10:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A944F8055C; Thu, 12 Jan 2023 13:10:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A7F6F80558
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 13:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A7F6F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=KfgTzzIC; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=INSlfodA
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 750403200926;
 Thu, 12 Jan 2023 07:10:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Jan 2023 07:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673525414; x=
 1673611814; bh=RhyCQ9BUXc9pGETo5nJD3J62TbnHhvNRK59Kc5sZ+Gw=; b=K
 fgTzzICpPAT5Q5aFV5AgpbbHaEiohs+dCyxyE3Cwk1jtgvKhNgwhxHyb/92cRPEG
 9qlrTcl/8ZzGg7DufzTDAuH0QB0X4AVGgjrpGCUEuiYeV2uJ8Q75bOXCYHoArVwg
 8fkvo411vpXIIkI+yJOdjLHTLzlDFP0Y8xBavGJIIHuxUfzbyuywS35NHYZTnQA1
 R8LP4kCP0yelDFy6/xvpQrn5N1Azq6t8TR582Ek5nwg0x8NoLNtFZwWIX7IDwjyG
 vIcCDpyq825pDcev7045XnJ/Pd/oc01e8xo00n7Z/jFpr0z2BqUnTafWFPXFC2wm
 LFNxueuiTJQ3RbM7S8Yyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673525414; x=1673611814; bh=RhyCQ9BUXc9pG
 ETo5nJD3J62TbnHhvNRK59Kc5sZ+Gw=; b=INSlfodAQkBgdcblGDN6z7p+XWV9P
 snR9orze/4XQzi+wyMiYBATrG0eLDwukTdY2lex5XWOeJ0uHgemC2NPSZPypq3Rg
 OWzTaJ0nuQPi6J68R0mm/c3WwCqjottjj16/Y+AkKEVQlvJXCb1tdzp9b2THNlh7
 Ix3izvkz8nB46ahfIE1s7hMJDEzB2PNFcjw/nk7TJm+r819PVB5jdXVi/CSls9wI
 atTjjXGN7xnhAIH6IUlm1otRwNO5v/Gzne8mXdCVH4aBfR2lGuuhCbNKsMFP8ULj
 odz933aNRA82NJRxZjR9AIMlANts/KiXHaQRaKFMpO48RVPTIXZuUcaNg==
X-ME-Sender: <xms:pfi_Y1L90s0MJSLqFwpnIfyGZglPjWRAi46lRC2vIQq8g2oi7o9l2A>
 <xme:pfi_YxKk-x0nBu69b3hdblF0aDii_stslE67W_LR0LxWiQ1ZBtj0OQs5FtzMX83TK
 TNPWchXpsrJEqjGvQI>
X-ME-Received: <xmr:pfi_Y9tfha0Ch2n8FM44D3bgdIOY4fSWqqXp8IZZb53y-V3ciscnhBBc7ZnQW3KiRUqtLqSUC3hkV9pohxWwPGPP3VfdYN3mGssITeR-tSc3L4awkRctw-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:pfi_Y2b-r0KoVHRjNsafT4nk_DkpyBxa5Dmw4SeMWtBQrHl4Nhak6A>
 <xmx:pfi_Y8a5yrlMZ7oNYUw29GaCPbrjo83mnYCU8IjpV-2d0q7re4nqiA>
 <xmx:pfi_Y6CZp7WVuFiEnXDJJRIfvYeAcglGj4k0IRCSjlWNoytAJtlGcw>
 <xmx:pvi_Y3wwxiEFELFNTYzcNU_7ThlammvsFQ7nvLsCft4FppCZI3PJEw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 07:10:12 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 6/6] ALSA: fireface: implement message parser for Fireface 400
Date: Thu, 12 Jan 2023 21:09:54 +0900
Message-Id: <20230112120954.500692-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230112120954.500692-1-o-takashi@sakamocchi.jp>
References: <20230112120954.500692-1-o-takashi@sakamocchi.jp>
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

This commit implements message parser for Fireface 400 to pass data of
knob control to user space. The parser has FIFO which can store maximum
32 events without no overrun detection since it doesn't matter to lose
the event.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-former.c | 143 ++++++++++++++++++-
 1 file changed, 137 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index d2cc9961b973..f58008762fe6 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -545,10 +545,23 @@ static void parse_midi_msg(struct snd_ff *ff, u32 quad, unsigned int port)
 	}
 }
 
-#define FF400_MSG_FLAG_IS_MIDI_PORT_0		0x00000100
-#define  FF400_MSG_MASK_MIDI_PORT_0		0x000000ff
-#define FF400_MSG_FLAG_IS_MIDI_PORT_1		0x01000000
-#define  FF400_MSG_MASK_MIDI_PORT_1		0x00ff0000
+#define FF400_QUEUE_SIZE	32
+
+struct ff400_msg_parser {
+	struct {
+		u32 msg;
+		u32 tstamp;
+	} msgs[FF400_QUEUE_SIZE];
+	size_t push_pos;
+	size_t pull_pos;
+};
+
+static bool ff400_has_msg(struct snd_ff *ff)
+{
+	struct ff400_msg_parser *parser = ff->msg_parser;
+
+	return (parser->push_pos != parser->pull_pos);
+}
 
 // For Fireface 400, lower 4 bytes of destination address is configured by bit
 // flag in quadlet register (little endian) at 0x'0000'801'0051c. Drivers can
@@ -569,22 +582,140 @@ static void parse_midi_msg(struct snd_ff *ff, u32 quad, unsigned int port)
 // input attenuation. This driver allocates destination address with '0000'0000
 // in its lower offset and expects userspace application to configure the
 // register for it.
+
+// When the message is for signal level operation, the upper 4 bits in MSB expresses the pair of
+// stereo physical port.
+// - 0: Microphone input 0/1
+// - 1: Line input 0/1
+// - [2-4]: Line output 0-5
+// - 5: Headphone output 0/1
+// - 6: S/PDIF output 0/1
+// - [7-10]: ADAT output 0-7
+//
+// The value of signal level can be detected by mask of 0x00fffc00. For signal level of microphone
+// input:
+//
+// - 0:    0.0 dB
+// - 10: +10.0 dB
+// - 11: +11.0 dB
+// - 12: +12.0 dB
+// - ...
+// - 63: +63.0 dB:
+// - 64: +64.0 dB:
+// - 65: +65.0 dB:
+//
+// For signal level of line input:
+//
+// - 0:  0.0 dB
+// - 1: +0.5 dB
+// - 2: +1.0 dB
+// - 3: +1.5 dB
+// - ...
+// - 34: +17.0 dB:
+// - 35: +17.5 dB:
+// - 36: +18.0 dB:
+//
+// For signal level of any type of output:
+//
+// - 63: -infinite
+// - 62: -58.0 dB
+// - 61: -56.0 dB
+// - 60: -54.0 dB
+// - 59: -53.0 dB
+// - 58: -52.0 dB
+// - ...
+// - 7: -1.0 dB
+// - 6:  0.0 dB
+// - 5: +1.0 dB
+// - ...
+// - 2: +4.0 dB
+// - 1: +5.0 dB
+// - 0: +6.0 dB
+//
+// When the message is not for signal level operation, it's for MIDI bytes. When matching to
+// FF400_MSG_FLAG_IS_MIDI_PORT_0, one MIDI byte can be detected by mask of 0x000000ff. When
+// matching to FF400_MSG_FLAG_IS_MIDI_PORT_1, one MIDI byte can be detected by mask of 0x00ff0000.
+#define FF400_MSG_FLAG_IS_SIGNAL_LEVEL		0x04000000
+#define  FF400_MSG_FLAG_IS_RIGHT_CHANNEL	0x08000000
+#define  FF400_MSG_FLAG_IS_STEREO_PAIRED	0x02000000
+#define  FF400_MSG_MASK_STEREO_PAIR		0xf0000000
+#define  FF400_MSG_MASK_SIGNAL_LEVEL		0x00fffc00
+#define FF400_MSG_FLAG_IS_MIDI_PORT_0		0x00000100
+#define  FF400_MSG_MASK_MIDI_PORT_0		0x000000ff
+#define FF400_MSG_FLAG_IS_MIDI_PORT_1		0x01000000
+#define  FF400_MSG_MASK_MIDI_PORT_1		0x00ff0000
+
 static void ff400_handle_msg(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
 			     size_t length, u32 tstamp)
 {
+	bool need_hwdep_wake_up = false;
 	int i;
 
 	for (i = 0; i < length / 4; i++) {
 		u32 quad = le32_to_cpu(buf[i]);
 
-		if (quad & FF400_MSG_FLAG_IS_MIDI_PORT_0)
+		if (quad & FF400_MSG_FLAG_IS_SIGNAL_LEVEL) {
+			struct ff400_msg_parser *parser = ff->msg_parser;
+
+			parser->msgs[parser->push_pos].msg = quad;
+			parser->msgs[parser->push_pos].tstamp = tstamp;
+			++parser->push_pos;
+			if (parser->push_pos >= FF400_QUEUE_SIZE)
+				parser->push_pos = 0;
+
+			need_hwdep_wake_up = true;
+		} else if (quad & FF400_MSG_FLAG_IS_MIDI_PORT_0) {
 			parse_midi_msg(ff, quad, 0);
-		else if (quad & FF400_MSG_FLAG_IS_MIDI_PORT_1)
+		} else if (quad & FF400_MSG_FLAG_IS_MIDI_PORT_1) {
 			parse_midi_msg(ff, quad, 1);
+		}
 	}
+
+	if (need_hwdep_wake_up)
+		wake_up(&ff->hwdep_wait);
+}
+
+static long ff400_copy_msg_to_user(struct snd_ff *ff, char __user *buf, long count)
+{
+	struct ff400_msg_parser *parser = ff->msg_parser;
+	u32 type = SNDRV_FIREWIRE_EVENT_FF400_MESSAGE;
+	long consumed = 0;
+
+	if (count < 8)
+		return 0;
+
+	spin_unlock_irq(&ff->lock);
+
+	if (copy_to_user(buf, &type, sizeof(type)))
+		return -EFAULT;
+
+	spin_lock_irq(&ff->lock);
+
+	count -= sizeof(type);
+	consumed += sizeof(type);
+
+	while (count >= sizeof(*parser->msgs) && parser->pull_pos != parser->push_pos) {
+		spin_unlock_irq(&ff->lock);
+
+		if (copy_to_user(buf + consumed, parser->msgs + parser->pull_pos,
+				 sizeof(*parser->msgs)))
+			return -EFAULT;
+
+		spin_lock_irq(&ff->lock);
+		++parser->pull_pos;
+		if (parser->pull_pos >= FF400_QUEUE_SIZE)
+			parser->pull_pos = 0;
+		count -= sizeof(*parser->msgs);
+		consumed += sizeof(*parser->msgs);
+	}
+
+	return consumed;
 }
 
 const struct snd_ff_protocol snd_ff_protocol_ff400 = {
+	.msg_parser_size	= sizeof(struct ff400_msg_parser),
+	.has_msg		= ff400_has_msg,
+	.copy_msg_to_user	= ff400_copy_msg_to_user,
 	.handle_msg		= ff400_handle_msg,
 	.fill_midi_msg		= former_fill_midi_msg,
 	.get_clock		= former_get_clock,
-- 
2.37.2

