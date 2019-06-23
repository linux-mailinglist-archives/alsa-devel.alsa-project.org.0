Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF874F96E
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2019 03:25:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCDC41615;
	Sun, 23 Jun 2019 03:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCDC41615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561253132;
	bh=bYhRbxYxrgls7NVcxb+M6cZNAUtElqYrlExZFTxUJ0E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EFMNO6D3gkGh2zexsNEArcRfh3jFX/LM1rTUZAqHs7BC+OJ7oa0DnXUBzLwpgqhV6
	 Vx5QiarcZuMWD5YMrDephZNwRiJIXXp6SogMY+2jwK0ZSIekXM7Vnf5dPZ6MFR0cQ7
	 WyKlYB8w0q0mDLhjQFeOo46i7RSWNvwJHopYDzR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B1AF89717;
	Sun, 23 Jun 2019 03:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1404EF89717; Sun, 23 Jun 2019 03:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45492F8070D
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 03:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45492F8070D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Ondh8F2q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LL8AZt/C"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E033821FA9;
 Sat, 22 Jun 2019 21:23:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 22 Jun 2019 21:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=K7D0Mhr6zenKp8zhWN+MZLVeBH
 DSf/lhDPH+YFI217A=; b=Ondh8F2qgvfUZTC5Ky1EoK7WpWHLt681FPhqIvZZZG
 uNLKiBPxVOlWtG9IRu1CTX6mufpZisd4oEmhIGOpKJXWnUrQxSZXpGARSBKYe7ru
 eVEreuXdNxJjhhnMYTvPrOLcXTKyH84u+3KUuAZAmT9jxw7NUErNB5r9wx+1JpFA
 AmgqheNVgn877I4iFEz5GR1+UBd3PHjkRizDE2wV0Vo9OenlXRMeul9rDkKj9HN7
 uzqVwrAeN3Z28MFhLtTGkuGiLjjJF+5rmdduL5h4EkdtGmFT3e2YK1txo0VbeLLp
 0y1hJ9M968p8GmggWEOdD4ByxohpZz2FsxPgxor18FkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=K7D0Mhr6zenKp8zhW
 N+MZLVeBHDSf/lhDPH+YFI217A=; b=LL8AZt/C1saSaCA9r9rTtyv8/Z4DyZsVi
 qOF9aYDTRf8xYu9RR0Z0dQO6trrP2f0xqd/Bd6fza6hZAPij/klDiP2oUSI2QXiB
 yY6nYCq+xx438i2Avd8QM78HlfKESmani8hX4uUiXn46VMNsm3nG4epEODm2gaim
 opIzVV+2qQhZvXTsFam/29O3z/BkyMIUe6skNu2kHI37FpEG2Bz0E/O96igP853P
 kOOfiB01s4loRY+gPpRkSt9qPGb9PWfTrX/0Ove2onYjL9Y+zoO4cgmrR7UmedVJ
 sfi5rvZsXywKYJH6W5v8gDsDSvNXUpX7YBwYKMN9v6DhOD+PZiMLA==
X-ME-Sender: <xms:mdQOXbqam6rQkTu41GsbLTpNxdqmhUadRqT2vwQxZCTWH9pXi4jnRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdelgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:mdQOXTSIcX3IzE2Bh_SRrfgz1gBfMRUlU6CqK0LEL-B_Sgri8WYp1A>
 <xmx:mdQOXdx7HGlvIVTQJTZdxqI0kNE2zEalv66FWu2ew15R85F9FJtueg>
 <xmx:mdQOXSh4FQYGioCjZibmcQBIRQE9vNUJUA757uxhZZD7es3x1l0evQ>
 <xmx:mtQOXdOE0-oLNGf6W_kagnliNUNysLGWPydO-icCV9-m8fFBSWGvpA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B5618005C;
 Sat, 22 Jun 2019 21:23:36 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 23 Jun 2019 10:23:33 +0900
Message-Id: <20190623012333.12056-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] Revert "ALSA: firewire-lib: fix inverted node
	IDs for amdtp_packet events"
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

This reverts commit e703965a129cdd72ff74e248f8fbf0d617844527.

When creating this patch, I compared the value of src field to the
value of first byte of cip_header field (SID) in tracing event.
But in this test I used a device which has a quirk to transfer
isochronous packet with invalid SID.
---
 sound/firewire/amdtp-stream-trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 5fe0920f04e5..ab708857979f 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -35,11 +35,11 @@ TRACE_EVENT(amdtp_packet,
 		__entry->cycle = cycles % CYCLES_PER_SECOND;
 		__entry->channel = s->context->channel;
 		if (s->direction == AMDTP_IN_STREAM) {
-			__entry->src = fw_parent_device(s->unit)->card->node_id;
-			__entry->dest = fw_parent_device(s->unit)->node_id;
-		} else {
 			__entry->src = fw_parent_device(s->unit)->node_id;
 			__entry->dest = fw_parent_device(s->unit)->card->node_id;
+		} else {
+			__entry->src = fw_parent_device(s->unit)->card->node_id;
+			__entry->dest = fw_parent_device(s->unit)->node_id;
 		}
 		if (cip_header) {
 			memcpy(__get_dynamic_array(cip_header), cip_header,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
