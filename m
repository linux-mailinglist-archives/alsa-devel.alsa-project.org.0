Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91651687ECB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 14:38:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDDA0E92;
	Thu,  2 Feb 2023 14:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDDA0E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675345104;
	bh=6/EgTt7JuCy1PTRpQOe36pguPJ7+Pxp4QJLEI8XA38k=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=F4Kq1rvQB9ZG95W08rhBZzdVsrI0spZInTmeEj8IEKyp2lXPIzFRc2djP7BsOpx39
	 NgDFP6F6muxCHGXssNLqvbLF/xlPe/vL1XaVJm1KwhVXCupIX+clhsEnzQqJUsKPDm
	 c7KWk/a6ne5L6t9hGBAxgxCf1PzjUY2/64m25pks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33814F804DF;
	Thu,  2 Feb 2023 14:37:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9844F804C2; Thu,  2 Feb 2023 14:37:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47AEBF80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 14:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47AEBF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=e84ZMUHe; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=onqGLus/
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 39D0C32003C0;
 Thu,  2 Feb 2023 08:37:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 02 Feb 2023 08:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1675345032; x=1675431432; bh=89sIOUVWUw
 kN1bm7THHRbQb6iNz8H9x7HGaB0Zkj/RA=; b=e84ZMUHe3QtqGEHqnGISXh3QOX
 Yt/ez9s4EOAQVmuRCK/W5ilG99mbUJuWPTSVGYOSjbPAvPD2JvF1eb9Q/IUvbLu+
 r9kIdcRPMarD6AuimF3rlIx+fIU5A8v1MhZPOGPhFZamgGAuva5mfyfleWASpG5h
 N9m7QdrNw84+DNAbquC3Br0fpf4WfziJMg8tOW549mi1m+Axl0wlW9UF6r14jeHj
 qqEdxQ3q5Wv6dSNUL7FlebTZrgzt2Ha205PPk/b9CUf8HwvWb8H6GcpiMNjZx79C
 EaZvhvoik+7FBwlENqd3cVn0WsjEwArVnRqlrI71oWRCURc8F2MN7P9R6Fbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1675345032; x=1675431432; bh=89sIOUVWUwkN1bm7THHRbQb6iNz8H9x7HGa
 B0Zkj/RA=; b=onqGLus/Zj/27kXo0n9IRb2jPGTfyElL7YZmGX15kFhOQCREA4Z
 OUD4q4be1AT6AwbcUWXil7KCkw3Qk3pBF44WHuCnJ2CjBGz0xch1Uu2haTBIxcn1
 FOHPC43M3MBbWknXat0Q5ZiusGpu0SjYzlH44rwO4tw7rqiUK7J4Rool+nW6T1kc
 UmUODOw3XcNIZPr9GD0T7TyxRpYVC6piO+g7ETtaS6HJf1dFYl/B2WlYKO1BR6wk
 3v2B9hUT0yXd90XoDXcabOqThPvQBq89/8yAvH7okceFeKaQ3WlOCKYxEvDc3hpk
 KYqQzg7Zv9Jnko8z86LH6/xqEi1YFW3H5Bg==
X-ME-Sender: <xms:iLzbYz6VucjRwZRfMLsgGxe9xznYKQuEAXHhSRmm4JU5k6mjjZgFnA>
 <xme:iLzbY45bONSENFRpJD3gjomANSyHnuJcJ8swiyHnMj1zrIyhQXt8FIlQD9293U9Nx
 G6P-_R_AacvgXkH_Ms>
X-ME-Received: <xmr:iLzbY6fniIBnchZN5VhQ_FgPZqpu55clHBNnaSWy_5JIdl3VsPY-7vy_2NH6UKxP_vxJx3eY-gILjyUpi8rDTOiK6wFvxB-jHKyl89Wr0Zx5kMtQqwDbYrM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeggfehleehje
 eileehveefkefhtdeffedtfeeghfekffetudevjeegkeevhfdvueenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:iLzbY0IYQl_mLz88hSGjE3jiNWqsGl4I0x8oPQfB9pXtw3YzkiGlRg>
 <xmx:iLzbY3JkC8ZkFCAFNubkUO_t2WJHdUJjf-vC3-fB1JQpDcFonVrPjw>
 <xmx:iLzbY9zMFoW61znnGzfo50c56cJ7zESwVCdkHvy6KXYgd6N0w3HyCg>
 <xmx:iLzbY5yy9vUWQH-L-hIJx530PSXqwf22uKCQjsRuotqnL7wY4wMXdg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 08:37:11 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: fireface: add field for the number of messages copied
 to user space
Date: Thu,  2 Feb 2023 22:37:08 +0900
Message-Id: <20230202133708.163936-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Current structure includes no field to express the number of messages
copied to user space, thus user space application needs to information
out of the structure to parse the content of structure.

This commit adds a field to express the number of messages copied to user
space since It is more preferable to use self-contained structure.

Kees Cook proposed an idea of annotation for bound of flexible arrays
in his future improvement for flexible-length array in kernel. The
additional field for message count is suitable to the idea as well.

Reference: https://people.kernel.org/kees/bounded-flexible-arrays-in-c
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                |  2 ++
 sound/firewire/fireface/ff-protocol-former.c | 28 +++++++++++---------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 50917581dd2b..1e86872c151f 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -78,6 +78,7 @@ struct snd_firewire_event_motu_register_dsp_change {
  *					     operating hardware knob.
  *
  * @type: Fixed to SNDRV_FIREWIRE_EVENT_FF400_MESSAGE.
+ * @message_count: The number of messages.
  * @messages.message: The messages expressing hardware knob operation.
  * @messages.tstamp: The isochronous cycle at which the request subaction of asynchronous
  *		     transaction was sent to deliver the message. It has 16 bit unsigned integer
@@ -89,6 +90,7 @@ struct snd_firewire_event_motu_register_dsp_change {
  */
 struct snd_firewire_event_ff400_message {
 	unsigned int type;
+	unsigned int message_count;
 	struct {
 		__u32 message;
 		__u32 tstamp;
diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index fa41de978756..efd59e9d9935 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -677,23 +677,19 @@ static void ff400_handle_msg(struct snd_ff *ff, unsigned int offset, const __le3
 
 static long ff400_copy_msg_to_user(struct snd_ff *ff, char __user *buf, long count)
 {
+	struct snd_firewire_event_ff400_message ev = {
+		.type = SNDRV_FIREWIRE_EVENT_FF400_MESSAGE,
+		.message_count = 0,
+	};
 	struct ff400_msg_parser *parser = ff->msg_parser;
-	u32 type = SNDRV_FIREWIRE_EVENT_FF400_MESSAGE;
 	long consumed = 0;
-	int ret = 0;
+	long ret = 0;
 
-	if (count < 8)
+	if (count < sizeof(ev) || parser->pull_pos == parser->push_pos)
 		return 0;
 
-	spin_unlock_irq(&ff->lock);
-	if (copy_to_user(buf, &type, sizeof(type)))
-		ret = -EFAULT;
-	spin_lock_irq(&ff->lock);
-	if (ret)
-		return ret;
-
-	count -= sizeof(type);
-	consumed += sizeof(type);
+	count -= sizeof(ev);
+	consumed += sizeof(ev);
 
 	while (count >= sizeof(*parser->msgs) && parser->pull_pos != parser->push_pos) {
 		spin_unlock_irq(&ff->lock);
@@ -707,10 +703,18 @@ static long ff400_copy_msg_to_user(struct snd_ff *ff, char __user *buf, long cou
 		++parser->pull_pos;
 		if (parser->pull_pos >= FF400_QUEUE_SIZE)
 			parser->pull_pos = 0;
+		++ev.message_count;
 		count -= sizeof(*parser->msgs);
 		consumed += sizeof(*parser->msgs);
 	}
 
+	spin_unlock_irq(&ff->lock);
+	if (copy_to_user(buf, &ev, sizeof(ev)))
+		ret = -EFAULT;
+	spin_lock_irq(&ff->lock);
+	if (ret)
+		return ret;
+
 	return consumed;
 }
 
-- 
2.37.2

