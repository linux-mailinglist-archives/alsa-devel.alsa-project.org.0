Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A689660BFC
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 03:34:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A20492D;
	Sat,  7 Jan 2023 03:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A20492D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673058888;
	bh=1x4bT1lkLE907Zo+qa/khNYtIeEFNn1tC1+F8pvAfaw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=scAFQPDjc+pLo7sPCb+GEWgd5f+5Q7ceLa0ldYmo1rGstLV48jfbKmabZ8mMrZh7m
	 IIiF73npARriC9rhBHagel3cJ1xKWm0omzT1GkGrsXAOuVy19OeIEUrKWo5/VoJfG9
	 c/IOLG2DkXnB7Xy6lMzqJoof0IFoA3T71b5Ove88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04089F8055B;
	Sat,  7 Jan 2023 03:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 385D8F804CB; Sat,  7 Jan 2023 03:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0F00F8032D
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 03:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F00F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=p7Xe3+V9; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bdXnuB1t
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 48542320091E;
 Fri,  6 Jan 2023 21:32:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 06 Jan 2023 21:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673058748; x=
 1673145148; bh=6PeTBmkUJc3MWBcNdJSpibsbGmpVsW/F2mHx6yIK8I0=; b=p
 7Xe3+V96Er5Hzc0QgIwWdOYmy5I06tN47koQlq/zBN3uw+rNTzYvUCHOh3hDobqV
 YIKWxvVLAT5DMIUcAJQePH67WF1zK77YbzMb0EH1ELQHrAaRMgntd47wnRftEIMm
 2insRKMFBPubjlempPzjiO4+W/nl8PPQyFRQBnBTu/V7CNJgsVk+yShb0Esi/Zbo
 3YGyKKjkclnjvG11RgcoCiMhyz//thywaQjI92NsetJlIQ7LcS2r4ah2yQZisP10
 pJOl8FBC6EDXm7446p7np1RFPrgZOwgnJ0W5oDbVKs3k3Z4aDsrFDIrclcLdpBaN
 hswtz5j0qaXlU59E+PqZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1673058748; x=1673145148; bh=6PeTBmkUJc3MW
 BcNdJSpibsbGmpVsW/F2mHx6yIK8I0=; b=bdXnuB1tH75YNbYBST++MFPMKhVS5
 WCMOFl1oX9bGoyVWt1r8NskRPmi+o6R6DQIRGkO5bMzEnqa6N/910wQ7PCm2A1Wu
 zcwNG2b47p08jsxYvo8EolV5HNhtVSJqE4pCVS9Sluo8e7KGxf57F/lzf7wzZWh+
 HXArTMlWUvuwLk5XGzfDBTjguQLG4260pwXPMzpGQOV7r5VYs6s2juzFOSDLifW7
 tQ9qX5Z8uoanE+J881H7RyA/iS+LXyRu6g26rO2x9L7xyEMF6+IDRJD7mgwQxfJh
 lSQFJuTRGj/rwE5Pva6DnAL7jqOFFhbqauvaxVslC+txJ6xklf7goAeMA==
X-ME-Sender: <xms:vNm4Y8fgc-v7hEC8h9YHL6D2r5t5HF-L_bpz0KkZmYyKUlSqi7Uqrg>
 <xme:vNm4Y-Oas23J5oWtmr_saYVlqkNrRfCpNstLGAGgZlXsOdeEI_nSjHz1JH2UVZG3j
 Bp_kWjPb59G6lkGl1Q>
X-ME-Received: <xmr:vNm4Y9g8Ra0f-5wUOL3PSUekeXik4aijWMeySI7XPhLqL2UcWelDEtEpXyKmd8XLYBBKEoCVhP37GmGptrdzMgQt7Kibp2LxWlaUP9OsgcVXluZuyLVw6Qs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:vNm4Yx9kKKdd65zvu5zA0lODnKtSCaq-mb4J_TMQFPxb6jOGS1BSNQ>
 <xmx:vNm4Y4s__uDomjSRefwfxYU0LSHnwPp5Fu5oTIOtruOGydU5Q5Jaqg>
 <xmx:vNm4Y4GMYtjPHQsce_7otdv17GWDUtUUi5ObT2DJORimKxTVnegL_g>
 <xmx:vNm4Y1U0NnfKfs9TlCi6i4xO25FYKQ0TYa_nXJEtNMRpM-ihvf6sRw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 21:32:27 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 4/4] ALSA: firewire-lib: code refactoring for cache position
 in sequence replay
Date: Sat,  7 Jan 2023 11:32:14 +0900
Message-Id: <20230107023214.29132-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230107023214.29132-1-o-takashi@sakamocchi.jp>
References: <20230107023214.29132-1-o-takashi@sakamocchi.jp>
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

When sequence replay is enabled for media clock recovery, current
implementation refers to cache of sequence descriptors in tx packets, then
fulfil sequence descriptors for rx packets. The initialization for rx
packets is done before starting packet streaming, while it can be postponed
till the cache has enough entries for the replay.

This commit refactors for the purpose as well as minor code change for
renaming of structure member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 16 +++++++++-------
 sound/firewire/amdtp-stream.h |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 08fd61a06e2e..5ecb449ff6fa 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -546,16 +546,16 @@ static void pool_replayed_seq(struct amdtp_stream *s, struct seq_desc *descs, un
 	struct amdtp_stream *target = s->ctx_data.rx.replay_target;
 	const struct seq_desc *cache = target->ctx_data.tx.cache.descs;
 	const unsigned int cache_size = target->ctx_data.tx.cache.size;
-	unsigned int cache_head = s->ctx_data.rx.cache_head;
+	unsigned int cache_pos = s->ctx_data.rx.cache_pos;
 	int i;
 
 	for (i = 0; i < count; ++i) {
-		descs[pos] = cache[cache_head];
-		cache_head = (cache_head + 1) % cache_size;
+		descs[pos] = cache[cache_pos];
+		cache_pos = (cache_pos + 1) % cache_size;
 		pos = (pos + 1) % size;
 	}
 
-	s->ctx_data.rx.cache_head = cache_head;
+	s->ctx_data.rx.cache_pos = cache_pos;
 }
 
 static void pool_seq_descs(struct amdtp_stream *s, struct seq_desc *descs, unsigned int size,
@@ -573,8 +573,8 @@ static void pool_seq_descs(struct amdtp_stream *s, struct seq_desc *descs, unsig
 		} else {
 			struct amdtp_stream *tx = s->ctx_data.rx.replay_target;
 			const unsigned int cache_size = tx->ctx_data.tx.cache.size;
-			const unsigned int cache_head = s->ctx_data.rx.cache_head;
-			unsigned int cached_cycles = calculate_cached_cycle_count(tx, cache_head);
+			const unsigned int cache_pos = s->ctx_data.rx.cache_pos;
+			unsigned int cached_cycles = calculate_cached_cycle_count(tx, cache_pos);
 
 			if (cached_cycles > count && cached_cycles > cache_size / 2)
 				pool_seq_descs = pool_replayed_seq;
@@ -1181,6 +1181,9 @@ static void process_rx_packets_intermediately(struct fw_iso_context *context, u3
 		s->ready_processing = true;
 		wake_up(&s->ready_wait);
 
+		if (d->replay.enable)
+			s->ctx_data.rx.cache_pos = 0;
+
 		process_rx_packets(context, tstamp, header_length, ctx_header, private_data);
 		if (amdtp_streaming_error(s))
 			return;
@@ -1909,7 +1912,6 @@ static int make_association(struct amdtp_domain *d)
 			}
 
 			rx->ctx_data.rx.replay_target = tx;
-			rx->ctx_data.rx.cache_head = 0;
 
 			++dst_index;
 		}
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 094a140baa19..f021c1f49137 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -167,7 +167,7 @@ struct amdtp_stream {
 			unsigned int last_syt_offset;
 
 			struct amdtp_stream *replay_target;
-			unsigned int cache_head;
+			unsigned int cache_pos;
 		} rx;
 	} ctx_data;
 
-- 
2.37.2

