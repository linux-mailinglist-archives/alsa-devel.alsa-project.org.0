Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC371CA257
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D5D178D;
	Fri,  8 May 2020 06:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D5D178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588912858;
	bh=kMOvG0t34e72eNm462GhBm6/UD/0Hjqnt8ZgQ2TmJ48=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V7PTchiPfweNXXz01K2i26MXSmpkm+Y1JOrGjLNTJvkZI0G0eRNbTz2/jl9fTPRsw
	 kwOspuhGRzP8m2609WOGoGUHvYvzeR1DM/lzfZZxwq30d0yy/keV8QtTUsYFgjnPAX
	 1vAWrdy/RGjqg/Is16NX9B637Fzzz4EL9YNXaxzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD7DF80259;
	Fri,  8 May 2020 06:37:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D284AF80299; Fri,  8 May 2020 06:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48BF8F80258
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BF8F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KoiF6c6P"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZRd2erUF"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B215745D;
 Fri,  8 May 2020 00:36:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sNa7QPXJj8TtB
 YvfmqdngbBZzd7uNWYG3xVGBy6pt74=; b=KoiF6c6PO0yU1kdp5P6SDWmgeYTCm
 q64DzMGFU2nm/epiXPf22C0E3OgsxiIxTLo8dGTEFpBd3VM9oZSY4wtq7z6eju80
 +nfhkwJvl+zQ9TABJvyjnOtX7BVYkiTicjURMFQ+Ui2jQbiN96Gb7TribamjQ3qt
 4kCN2VsF0Rxy9bzrfyttjLJX4/UzPA5YF1hBCNC0Qf4xfGeI4So5xamJBeeLf5RV
 uu99TcNqmMXlGtpX32AnrTZw9Qzjav38GlzFyyrHn6XlGVrPXWGQRhhvG0LjliES
 Lt7t/bsGeF/2Qw/HQ1sVShfuNwTemX1heSWDQgaY8TaVqqbhDE78J4xjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sNa7QPXJj8TtBYvfmqdngbBZzd7uNWYG3xVGBy6pt74=; b=ZRd2erUF
 VuAwjuM2LoAKt21Uk3Yydxj1VFH+sowO8c1IMxV2pQOXu6SGl2yPLZsPMFYZhBUS
 SgddsyD01OnK7ulDIgdyiz+n55p9pFgdAztx7j8BXdFV+S6/s9LmmRw16rm5ggy6
 7IaIIheoeDtJ0PH1BarmpthMJtg2iqJQBHF9Pr7TtPJm2SY1ylRKqaL4jWz9ZqkW
 kGKr0z+QIzf0xp5jSCoTvlW1f1oKik0k2FontCf0Ld9Fg/VYPNS+zq/gYj4Pp6+h
 Jaet0MYaZfoZ6MIQAe0KwPIvPtJXjgzPYJlZyTbyMV5a/NQf/NPFV+2W6lMnKZfK
 S007rJx1ZGf5WQ==
X-ME-Sender: <xms:3eG0XoEWVOlBHB8AyEq3XEgamId0TZT0v0yBg_EQPMAGSv0FSlZaEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:3eG0Xn-UjM1ZJiGvC5NEoUp8V_47dOCnlK-M3qUC47bgrfn6VBEmMQ>
 <xmx:3eG0XpRBl00L24smcfCLDmZqeKKTVXKfLD-cl3m98URiyDE9cjFVmQ>
 <xmx:3eG0XnC7aAa81yRD2n3pCCc6rke4KpFlmTtG5Q76DnBePewTacXfig>
 <xmx:3eG0XnPp6P7dCW_bFkC13lARQ5_m5ORWZ4o9qJ5lLaSfCgYmvHmG0g>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 619453280063;
 Fri,  8 May 2020 00:36:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 06/10] ALSA: firewire-lib: code refactoring for syt offset
 calculation
Date: Fri,  8 May 2020 13:36:31 +0900
Message-Id: <20200508043635.349339-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
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

When calculating syt offset, some states are stored in AMDTP stream
structure. This is inconvenient when reuse the calculation from
non-stream structure.

This commit applies refactoring to helper function for the calculation
so that the function doesn't touch AMDTP stream structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 1605ea4301ce..9041510cb6aa 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -383,14 +383,14 @@ static unsigned int calculate_data_blocks(struct amdtp_stream *s,
 	return data_blocks;
 }
 
-static unsigned int calculate_syt_offset(struct amdtp_stream *s)
+static unsigned int calculate_syt_offset(unsigned int *last_syt_offset,
+			unsigned int *syt_offset_state, enum cip_sfc sfc)
 {
-	unsigned int syt_offset, phase, index;
+	unsigned int syt_offset;
 
-	if (s->ctx_data.rx.last_syt_offset < TICKS_PER_CYCLE) {
-		if (!cip_sfc_is_base_44100(s->sfc))
-			syt_offset = s->ctx_data.rx.last_syt_offset +
-				     s->ctx_data.rx.syt_offset_state;
+	if (*last_syt_offset < TICKS_PER_CYCLE) {
+		if (!cip_sfc_is_base_44100(sfc))
+			syt_offset = *last_syt_offset + *syt_offset_state;
 		else {
 		/*
 		 * The time, in ticks, of the n'th SYT_INTERVAL sample is:
@@ -402,18 +402,19 @@ static unsigned int calculate_syt_offset(struct amdtp_stream *s)
 		 *   1386 1386 1387 1386 1386 1386 1387 1386 1386 1386 1387 ...
 		 * This code generates _exactly_ the same sequence.
 		 */
-			phase = s->ctx_data.rx.syt_offset_state;
-			index = phase % 13;
-			syt_offset = s->ctx_data.rx.last_syt_offset;
+			unsigned int phase = *syt_offset_state;
+			unsigned int index = phase % 13;
+
+			syt_offset = *last_syt_offset;
 			syt_offset += 1386 + ((index && !(index & 3)) ||
 					      phase == 146);
 			if (++phase >= 147)
 				phase = 0;
-			s->ctx_data.rx.syt_offset_state = phase;
+			*syt_offset_state = phase;
 		}
 	} else
-		syt_offset = s->ctx_data.rx.last_syt_offset - TICKS_PER_CYCLE;
-	s->ctx_data.rx.last_syt_offset = syt_offset;
+		syt_offset = *last_syt_offset - TICKS_PER_CYCLE;
+	*last_syt_offset = syt_offset;
 
 	if (syt_offset >= TICKS_PER_CYCLE)
 		syt_offset = CIP_SYT_NO_INFO;
@@ -759,7 +760,9 @@ static void generate_ideal_pkt_descs(struct amdtp_stream *s,
 		unsigned int syt_offset;
 
 		desc->cycle = compute_it_cycle(*ctx_header, s->queue_size);
-		syt_offset = calculate_syt_offset(s);
+		syt_offset = calculate_syt_offset(
+				&s->ctx_data.rx.last_syt_offset,
+				&s->ctx_data.rx.syt_offset_state, s->sfc);
 		if (syt_offset != CIP_SYT_NO_INFO) {
 			desc->syt = compute_syt(syt_offset, desc->cycle,
 						s->ctx_data.rx.transfer_delay);
-- 
2.25.1

