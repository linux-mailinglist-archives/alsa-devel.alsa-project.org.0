Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F56671C1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 13:12:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9872345DB;
	Thu, 12 Jan 2023 13:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9872345DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673525530;
	bh=zBNM/2odBr4WHyDRLVW6VEDNXNPP4Am3+8hHM96bDBI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BCufow9hCz0M7zu7vzkfjYpQne4M7gNRr6G66V0tlaJYCpw7WhlknctkCR0zLXuQx
	 ac7KnpiSeDHRxaqikPJKQVex2JmPEiEIfaoX2ozKAPrMx++3aYaPHiaUeatimtrKUh
	 hmsJ8EIWAmgIo6yAe++sZxxoFskyMusNI6XhsgMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E55F80551;
	Thu, 12 Jan 2023 13:10:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B619F80539; Thu, 12 Jan 2023 13:10:13 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 09764F804BD
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 13:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09764F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=NqR4SatO; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XRrCoxej
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A58BB320030E;
 Thu, 12 Jan 2023 07:10:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 12 Jan 2023 07:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673525407; x=
 1673611807; bh=/E74PMlIi85CDPZBsXXevIugzm1ADatDBmvAN+5Y2S0=; b=N
 qR4SatOgYvmkd0WiF07ROBDR/28MAC+k2ZhJibhU4SXvQHdvOtJmjacPeMUHrq95
 dKKYJ5B+aW3cEbH1d4XbMdfap7b+0QEPpzCUQxeaJQi26kHA0aIxglOGV9EKQz+7
 W6b/7euFmibpuw0Cgxk0kz3+BJ+vhIntwrs4Ti+C8n/r7VoxXo9Aanac8B3RUxyv
 QwqAKYB7+QRqSfahN7xDiVCGIPxGsoQJV5iybnsOtOIN4PwCLeCHiAPVkTzWO6+8
 0qKKbetGaA6TWOss1+jziG2eSjHuyNztZWebiGbfpPWPA1XJjRk3oFuyx14i50gh
 RUwEKWZklh79+RjYHKA6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673525407; x=1673611807; bh=/E74PMlIi85CD
 PZBsXXevIugzm1ADatDBmvAN+5Y2S0=; b=XRrCoxejfmJy1sBZKmYenLgX0WNlk
 pzNvOsozUCB2L6Fth7bhlWB0HAzrbtkgEuJPzMTMDj18nc/VjySufSRrfhuCUoN8
 rlzKGJSlQDeZhT39MToFlkJCtdml+eK794X97F3kksBFro6TfH9aHEjt6/aPhK72
 14Ow2Rfc1OIek4675svkMg8GoSM57ZBTiBo0nKjwHl3OF/nNdCM/YpiRfL7N/Hez
 lXNu4kLEJMPuK/W5XnbK7TYxQlbNdZUVXXtqO3LBaJORji19KSoWPsSnJjttVH+I
 AJ2ouRuBTG42CXMAPmei10TzsFXRy9tOwAlnJ5/idefwzSkeo/TcxzNcw==
X-ME-Sender: <xms:n_i_YwqQDreQ536DzTQYehzLI33lWf9NjJPyY78wFFkrRxWpwVVhww>
 <xme:n_i_Y2psysM0r7BPBL2rFz-9RlokS-yr6xTBGSxvrKPOp0nMkEaMO4KHTUNgjuKZQ
 Sh88StCyO7i3Sg5MJQ>
X-ME-Received: <xmr:n_i_Y1O9rw9bu_b7riWNVgOW325gnKJXw998O3qONRH1Cbk05OaGjYWpCM9U6uHUZV2uUZT3rfpdDn8XjPSc4jqLH7rs8060HKg5FOryxoArW0rlhL7ff3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:n_i_Y36aU1nPtvYW-B-uqeC3A8hqFXFuq9Kbos130vDtiNrDqFMV2Q>
 <xmx:n_i_Y_6_0RESj-pJEQ4ZYkxrbdve56QtE64lP9Dh8vPWQJ2F4dCqNA>
 <xmx:n_i_Y3iP28tWQf7IuyDOm4Gbeq6dBZ_vopec6S4Th01Xs5QO41IcTw>
 <xmx:n_i_Y5Q3SCJKYUNBNAvtS9XM2ZH9YI_LDZ78Uyxb9PGCeEso6k6cHA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 07:10:05 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/6] ALSA: fireface: add helper function to parse MIDI
 messages transmitted by Fireface 400
Date: Thu, 12 Jan 2023 21:09:51 +0900
Message-Id: <20230112120954.500692-4-o-takashi@sakamocchi.jp>
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

This is minor code refactoring to add helper function to parse MIDI message
bytes in quadlet message.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-former.c | 47 +++++++++-----------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index 22d6aee52de3..d2cc9961b973 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -534,6 +534,22 @@ static void ff400_finish_session(struct snd_ff *ff)
 			   FF400_ISOC_COMM_STOP, &reg, sizeof(reg), 0);
 }
 
+static void parse_midi_msg(struct snd_ff *ff, u32 quad, unsigned int port)
+{
+	struct snd_rawmidi_substream *substream = READ_ONCE(ff->tx_midi_substreams[port]);
+
+	if (substream != NULL) {
+		u8 byte = (quad >> (16 * port)) & 0x000000ff;
+
+		snd_rawmidi_receive(substream, &byte, 1);
+	}
+}
+
+#define FF400_MSG_FLAG_IS_MIDI_PORT_0		0x00000100
+#define  FF400_MSG_MASK_MIDI_PORT_0		0x000000ff
+#define FF400_MSG_FLAG_IS_MIDI_PORT_1		0x01000000
+#define  FF400_MSG_MASK_MIDI_PORT_1		0x00ff0000
+
 // For Fireface 400, lower 4 bytes of destination address is configured by bit
 // flag in quadlet register (little endian) at 0x'0000'801'0051c. Drivers can
 // select one of 4 options:
@@ -560,34 +576,11 @@ static void ff400_handle_msg(struct snd_ff *ff, unsigned int offset, const __le3
 
 	for (i = 0; i < length / 4; i++) {
 		u32 quad = le32_to_cpu(buf[i]);
-		u8 byte;
-		unsigned int index;
-		struct snd_rawmidi_substream *substream;
 
-		/* Message in first port. */
-		/*
-		 * This value may represent the index of this unit when the same
-		 * units are on the same IEEE 1394 bus. This driver doesn't use
-		 * it.
-		 */
-		index = (quad >> 8) & 0xff;
-		if (index > 0) {
-			substream = READ_ONCE(ff->tx_midi_substreams[0]);
-			if (substream != NULL) {
-				byte = quad & 0xff;
-				snd_rawmidi_receive(substream, &byte, 1);
-			}
-		}
-
-		/* Message in second port. */
-		index = (quad >> 24) & 0xff;
-		if (index > 0) {
-			substream = READ_ONCE(ff->tx_midi_substreams[1]);
-			if (substream != NULL) {
-				byte = (quad >> 16) & 0xff;
-				snd_rawmidi_receive(substream, &byte, 1);
-			}
-		}
+		if (quad & FF400_MSG_FLAG_IS_MIDI_PORT_0)
+			parse_midi_msg(ff, quad, 0);
+		else if (quad & FF400_MSG_FLAG_IS_MIDI_PORT_1)
+			parse_midi_msg(ff, quad, 1);
 	}
 }
 
-- 
2.37.2

