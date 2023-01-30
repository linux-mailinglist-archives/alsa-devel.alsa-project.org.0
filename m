Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EE76811C8
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 15:16:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A349851;
	Mon, 30 Jan 2023 15:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A349851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675088204;
	bh=GtimKKFo+5KHhDfH/2l4xU8JjWGbC1Jd3qIi+39sUqc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qpnB4tdac0f6b9/Ew1hLfTx4wRH4S06bpsaj708CffEPcoQvNCFWA9x9Cc5Xfrn40
	 276IPAFZYjkyMXSDnKcPn6EErkK6u3rb11Lg4eQFLlFlLDCv7NUEFnCvOKG/X9s0h+
	 LLYQ/cLjWfgkPmCMhwxlJrNIDhZTuNjABJTKQ3vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6494F8032B;
	Mon, 30 Jan 2023 15:15:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E8BDF8032B; Mon, 30 Jan 2023 15:15:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6277F8007C
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 15:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6277F8007C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=johpG74/; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=H2Fu1fox
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 62B1B5C027D;
 Mon, 30 Jan 2023 09:15:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 30 Jan 2023 09:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1675088136; x=1675174536; bh=MzOdtXMSB2
 MsJ8GPLGKHN8eq912ANb4apoW0sMs/hcU=; b=johpG74/BgdyC4GFEgBL/jZgh1
 0fdy+2SiRPerCt3RZPL0oR/tD+gpfTx/GUzoceCRrMcI6YxM92FYewiouH6f2jMs
 MUREgQ7/kPjMaFAUVwmh4AuxW/lTvn7f+xShiGQaLLF8WqE39yJ0t4wyF2mqFqyf
 EZH+V5NcjmAZo0Oqh1o7VwQzdKw/RFxEyqkq24gSiR4IYMvB5sHXrCaIQnr2VRYX
 XvjUtBue1piw6+pFr1smkxr16f9ozPyL7AzpM7kkCYs0YY00d2NYpujhnDepJXVA
 q4yV9Jrk08XYk3htdI7pJW+YfrLD3wDUejwpLJTZciyVd6sBdtYgGr93l2ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1675088136; x=1675174536; bh=MzOdtXMSB2MsJ8GPLGKHN8eq912ANb4apoW
 0sMs/hcU=; b=H2Fu1fox9kjSVzFaJifU+jGUfklXiG5TWNMl9zyEeOkCOiT8bAv
 72JEHkfwJV+GsXJFbunKyO4jb/nJLaKtJp7aKcvrKZUGcuGT6KezfZ5hKOV31wYq
 T06KMLTqIAQ2c3SOmsucB5clbTVVxF5ARAGiw3cri+1yX2XqtkxWt62fkIHkuZlh
 Y9wtx4elzQFz7t8uOaKSbCsrgo917cVqNd7+U0AEKBnuaeaVaniJqSZ18jFHpt3h
 /M8zCYM3Im1x/3Mzvh+ZyJsNw/Od3LUaINVyET/5IARHRHUHK8SfcAItmCjufWnT
 Uh5MxpPNsNpkD/mSsKZqgATlkNpZ+2boNEQ==
X-ME-Sender: <xms:CNHXY4Szt36JVPBocwdXLCYzR8z4Q-tlw0xwD_X5Mn0PmaEpY4Sf9Q>
 <xme:CNHXY1wjJj288RDPbB9qTUF3s-3iiQsKroe_0XHQJSICXPSt4H_tm9nY3pKLApB0q
 5Z0N7NCE6v1EdoYuFA>
X-ME-Received: <xmr:CNHXY10OMqUthQqlLCo-8t1hc9Z1L3qxdAA-NNCF9PTqoIhtEpIGj-HI9Y6ihFJp4OtIxesHA6RvTXJ_nBkhFYQqf7YSciGAgSJ-DHnR-LuLpwlWooiL2mE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
 ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
 hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:CNHXY8AX13cxUyEXlAzeh5-lNgRqDuL4zudvbnXvMwC947KgHSsxXw>
 <xmx:CNHXYxhhL-fStRLVhJl1itbKkIw5EKBUKrO6G1RMEtHqxIec3Y_-9Q>
 <xmx:CNHXY4qDbtNvau_eRdjMmoOFycx5njuOS_y0oKiZgY3iEQZZVFpDnA>
 <xmx:CNHXYxZbkdRiFMZ24VckOH5yw9sHLgWe45Cga0JvfmlakZskZzLkeg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 09:15:35 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-lib: fix uninitialized local variable
Date: Mon, 30 Jan 2023 23:15:32 +0900
Message-Id: <20230130141532.102838-1-o-takashi@sakamocchi.jp>
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
Cc: alsa-devel@alsa-project.org, Dan Carpenter <error27@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The function local variable, curr_cycle_time is declared without
initialization. When tracepoints event is not probed, it looks to be
used as is. This commit fixes it. Fortunately, the value of local variable
is not used unless the event is probed, thus this commit is for better
coding.

Reported-by: Dan Carpenter <error27@gmail.com>
Fixes: fef4e61b0b7 ("ALSA: firewire-lib: extend tracepoints event including CYCLE_TIME of 1394 OHCI")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index f7e1329efa0b..a13c0b408aad 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -910,7 +910,7 @@ static int generate_tx_packet_descs(struct amdtp_stream *s, struct pkt_desc *des
 	unsigned int dbc = s->data_block_counter;
 	unsigned int packet_index = s->packet_index;
 	unsigned int queue_size = s->queue_size;
-	u32 curr_cycle_time;
+	u32 curr_cycle_time = 0;
 	int i;
 	int err;
 
-- 
2.37.2

