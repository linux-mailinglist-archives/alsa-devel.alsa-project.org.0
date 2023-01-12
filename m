Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982176671B8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 13:11:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7CF68D07;
	Thu, 12 Jan 2023 13:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7CF68D07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673525470;
	bh=12gFNVXFOBEGicvHrOxgnFPcN3AYQ6+uQof+i2KEWt0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lTkQnF6Pn2manjl+YzNErCuGBiqpBaR/plZz/+1qUcO0HCpoiUmSJFhFem+w4C3LR
	 zXb/NYjgt8lX0XBTK2wNa+h5msw1FUfyhUzaThxVqSBdqEn5Pmo8hzpaVZDtpQlpp9
	 9KpXxwYA6/4T5oB3miL7ouBiky15p4qQqvbL+7fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE1CFF804DD;
	Thu, 12 Jan 2023 13:10:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEE57F804D9; Thu, 12 Jan 2023 13:10:10 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id C9F5BF804BD
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 13:10:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F5BF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=QAT1Y1Oc; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=cdlhPHT6
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2D63A3200754;
 Thu, 12 Jan 2023 07:10:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Jan 2023 07:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673525402; x=
 1673611802; bh=w4c8aheRlcwEZ6gclG5PADACq+h0SqePde2fZNUGaiY=; b=Q
 AT1Y1OcCLc0jG3cNplQXY3t14LPEiW+DL74c2htW3hF/JSCsKit3FZma4JbyhgAL
 o70UIKS8e2giE1JssxoCiTtPuah8TD315VWsOrtiOYAbWsCWJz1N2ZifZ071uE9H
 TVFoumAjQQlZM7tEuF54hP5+O+NGAgx8DeVjimo63K5Y/HTDf3ab2TNLyIH0k9il
 f7NAVqQZahuTjDmV6hmC2Wo+p+899PVAM7omoxvlPYP9A2ots52g8Beoh596Rznv
 CiXnBJWVQ3oIukV7sKoxTGcD9q9HVP6rKPa7FQWtjQ7g329zGako2LcXYM5DrXwG
 yI2Ln5pk4g8sWDclLTlgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673525402; x=1673611802; bh=w4c8aheRlcwEZ
 6gclG5PADACq+h0SqePde2fZNUGaiY=; b=cdlhPHT652W84ukzdDKDK4GBkBLI2
 JoN+rffU/r3CKAm7SLT4Ubet7ZKQifx4cH4O2s8zmBj/bQ7xjkIcosLueym0HrL0
 Q37yKai89H72jBq4QI+pD7KA982k/dGiOKXWlVJ0CCuycKJPJe1efxJPQSLfsP+O
 t4COawKloHXGdYbObq+B8qjRVodkuom+ADNyLLeHJqnxdRE/0PEPAIlnl9Q1F9zW
 hoybJ8bhhKITI2Y3DWQM9iusOJEspTXw7UPKubQlYYxsgOcxlvGPfa3kb/hnGqle
 qASPW5ZYL+dIs4CjHix4hTHmsCUBlHNA24RWy4+8Bctv5YhFnv9Kdf+sg==
X-ME-Sender: <xms:mvi_Y_ZD0oLMsEKhPg4rUhOvdXtI31oHPUGkMq6ATnsvhk_TMf-qEw>
 <xme:mvi_Y-YPVN9Rlwdlb9zXJvFS2u0WRsQHrGO6ryWexWjkh9Xd8eZW4mbZml0BFs4Wr
 ntlgUgDU2CIg7-Xvw4>
X-ME-Received: <xmr:mvi_Yx_Be7BFIvdB0ZfWnvScH2vdvzzRLFBIRty_34I-VW8TVRtR3vjf0OxDZcWTI4Wh-FAfea08sQieF9kpdERBb3f_C238oui8XqclwuxfQiopRE7Pok4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:mvi_Y1qAqoN5eY6Z_z28a-9HpHokAQw-3HpISgPoE2Ob59lwsot-3g>
 <xmx:mvi_Y6pGJdoW5s-LPqoFxTHAzfJBmMmH2j5fFNdPL2H43QV0lg4FUQ>
 <xmx:mvi_Y7Ru-nCaG269lCi1PQHdDfgb96gyMjblxAera7L5aeVXCnTqRQ>
 <xmx:mvi_Y_B8C23T8jJn5q54jPZk9kCabyFeoc3s_Wwla_oCzbLiEzCM6Q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 07:10:00 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/6] ALSA: fireface: rename callback functions
Date: Thu, 12 Jan 2023 21:09:49 +0900
Message-Id: <20230112120954.500692-2-o-takashi@sakamocchi.jp>
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

It's cleared that Fireface 400 transmits quadlet message for two purposes
at least; received MIDI messages and notification of knob control
operation. Nevertheless current implementation uses callback function name
just for MIDI messages.

This commit renames the callback functions.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-former.c | 12 ++++++------
 sound/firewire/fireface/ff-protocol-latter.c |  6 +++---
 sound/firewire/fireface/ff-transaction.c     | 12 +++++-------
 sound/firewire/fireface/ff.h                 |  4 ++--
 4 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index 8900ffe517ed..16afcb334e3c 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -402,8 +402,8 @@ static void ff800_finish_session(struct snd_ff *ff)
 // address.
 // A write transaction to clear registered higher 4 bytes of destination address
 // has an effect to suppress asynchronous transaction from device.
-static void ff800_handle_midi_msg(struct snd_ff *ff, unsigned int offset,
-				  __le32 *buf, size_t length)
+static void ff800_handle_midi_msg(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
+				  size_t length)
 {
 	int i;
 
@@ -418,7 +418,7 @@ static void ff800_handle_midi_msg(struct snd_ff *ff, unsigned int offset,
 }
 
 const struct snd_ff_protocol snd_ff_protocol_ff800 = {
-	.handle_midi_msg	= ff800_handle_midi_msg,
+	.handle_msg		= ff800_handle_midi_msg,
 	.fill_midi_msg		= former_fill_midi_msg,
 	.get_clock		= former_get_clock,
 	.switch_fetching_mode	= former_switch_fetching_mode,
@@ -553,8 +553,8 @@ static void ff400_finish_session(struct snd_ff *ff)
 // input attenuation. This driver allocates destination address with '0000'0000
 // in its lower offset and expects userspace application to configure the
 // register for it.
-static void ff400_handle_midi_msg(struct snd_ff *ff, unsigned int offset,
-				  __le32 *buf, size_t length)
+static void ff400_handle_msg(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
+			     size_t length)
 {
 	int i;
 
@@ -592,7 +592,7 @@ static void ff400_handle_midi_msg(struct snd_ff *ff, unsigned int offset,
 }
 
 const struct snd_ff_protocol snd_ff_protocol_ff400 = {
-	.handle_midi_msg	= ff400_handle_midi_msg,
+	.handle_msg		= ff400_handle_msg,
 	.fill_midi_msg		= former_fill_midi_msg,
 	.get_clock		= former_get_clock,
 	.switch_fetching_mode	= former_switch_fetching_mode,
diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
index 76c3eab36d4e..e7a066fb1ead 100644
--- a/sound/firewire/fireface/ff-protocol-latter.c
+++ b/sound/firewire/fireface/ff-protocol-latter.c
@@ -393,8 +393,8 @@ static void latter_dump_status(struct snd_ff *ff, struct snd_info_buffer *buffer
 // input attenuation. This driver allocates for the first option
 // (0x'....'....'0000'0000) and expects userspace application to configure the
 // register for it.
-static void latter_handle_midi_msg(struct snd_ff *ff, unsigned int offset,
-				   __le32 *buf, size_t length)
+static void latter_handle_midi_msg(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
+				   size_t length)
 {
 	u32 data = le32_to_cpu(*buf);
 	unsigned int index = (data & 0x000000f0) >> 4;
@@ -529,7 +529,7 @@ static int latter_fill_midi_msg(struct snd_ff *ff,
 }
 
 const struct snd_ff_protocol snd_ff_protocol_latter = {
-	.handle_midi_msg	= latter_handle_midi_msg,
+	.handle_msg		= latter_handle_midi_msg,
 	.fill_midi_msg		= latter_fill_midi_msg,
 	.get_clock		= latter_get_clock,
 	.switch_fetching_mode	= latter_switch_fetching_mode,
diff --git a/sound/firewire/fireface/ff-transaction.c b/sound/firewire/fireface/ff-transaction.c
index ee7122c461d4..764c772a0b1e 100644
--- a/sound/firewire/fireface/ff-transaction.c
+++ b/sound/firewire/fireface/ff-transaction.c
@@ -125,10 +125,9 @@ static void transmit_midi1_msg(struct work_struct *work)
 	transmit_midi_msg(ff, 1);
 }
 
-static void handle_midi_msg(struct fw_card *card, struct fw_request *request,
-			    int tcode, int destination, int source,
-			    int generation, unsigned long long offset,
-			    void *data, size_t length, void *callback_data)
+static void handle_msg(struct fw_card *card, struct fw_request *request, int tcode,
+		       int destination, int source, int generation, unsigned long long offset,
+		       void *data, size_t length, void *callback_data)
 {
 	struct snd_ff *ff = callback_data;
 	__le32 *buf = data;
@@ -136,8 +135,7 @@ static void handle_midi_msg(struct fw_card *card, struct fw_request *request,
 	fw_send_response(card, request, RCODE_COMPLETE);
 
 	offset -= ff->async_handler.offset;
-	ff->spec->protocol->handle_midi_msg(ff, (unsigned int)offset, buf,
-					    length);
+	ff->spec->protocol->handle_msg(ff, (unsigned int)offset, buf, length);
 }
 
 static int allocate_own_address(struct snd_ff *ff, int i)
@@ -146,7 +144,7 @@ static int allocate_own_address(struct snd_ff *ff, int i)
 	int err;
 
 	ff->async_handler.length = ff->spec->midi_addr_range;
-	ff->async_handler.address_callback = handle_midi_msg;
+	ff->async_handler.address_callback = handle_msg;
 	ff->async_handler.callback_data = ff;
 
 	midi_msg_region.start = 0x000100000000ull * i;
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 0535f0b58b67..0358b444bd01 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -110,8 +110,8 @@ enum snd_ff_clock_src {
 };
 
 struct snd_ff_protocol {
-	void (*handle_midi_msg)(struct snd_ff *ff, unsigned int offset,
-				__le32 *buf, size_t length);
+	void (*handle_msg)(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
+			   size_t length);
 	int (*fill_midi_msg)(struct snd_ff *ff,
 			     struct snd_rawmidi_substream *substream,
 			     unsigned int port);
-- 
2.37.2

