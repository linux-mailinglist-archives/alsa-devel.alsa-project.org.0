Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D88614E6
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931651677;
	Sun,  7 Jul 2019 14:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931651677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501597;
	bh=mDOWrvvQ+Bh7OWtWMGGrEP1Yd/8MlT2H+P94FxlIq30=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIljc3Kyh7GHa6f3TZHhQUjzd1ZEp6g0bVZG5n9618oO7GVX1wumimjn/d+ESrNjN
	 WsSquUb0zq4Oin8m/skTnM//7xdRZn3Qy+XZuW/bEpBc259u2vxFTiB/Rrhh5CTyMe
	 YCR4Suj5iPp17/eAhJDK4Qn3QSrdry3Z6xl5po2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8ABF802E0;
	Sun,  7 Jul 2019 14:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34803F80272; Sun,  7 Jul 2019 14:08:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F7B3F80228
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7B3F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="a+DQ/Rej"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ew0o5kNV"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8C324435;
 Sun,  7 Jul 2019 08:08:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ybf2UR4Edp0Ic
 yVtmfi800PoHtna59aE+zK8HDdLmQM=; b=a+DQ/Rejya13fBAak2cyEwGhCqPfe
 NWa2bHYspx5Dss6E7ktwhZmbB3zOV/POsFmZJc7wa8oUWmvfaSwHc2o+A/LhKX5B
 g1Z1QOibFUUiZJ/6G6shAW5HznOkuC4RrXxopOx3qib4tLemEPdQ7ECuOGYQcGAT
 I9BRG6HirlYhqNnnKDMx5cAjqqjjf7v0o6zKZbNsKsBSEhLTAaNapFkim0PsHu0l
 idGvYhABtqfHL0z7HCmX7vu7ybGLngjQHmFW44KMQV4lSci+F+UjRq6yYioAT4KO
 w3E3CEz26QayITmXtPt34O7IkxzcOOXUuhmZZeLI1iWtCU6MlEJ631gFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ybf2UR4Edp0IcyVtmfi800PoHtna59aE+zK8HDdLmQM=; b=ew0o5kNV
 w2586JAQntwNCqwjyvL4kKF3W1bnrTsuZFBh/LUNpweSJ5k7MY6wnPRhiQwMYOiC
 OeQIctss9q7DMz9OMzbvs93clMOp3ncH1BIHAykDpzQYpiTIS+VTK8jakTRuzr/8
 0UUAtuknBOmxpOKVObI+5p4QqdCEnkOaCW2fEFUqascCiMVzlwBNBGdyzxVhsxfS
 yRGHWL2P4cHw44GwaxXk4UvnE/ed5C2m8kgOA0oULb5dD3e916Yc9SSUYEDlaLgZ
 P0J10WjyTsP3OX3h5nv5Pf+EVG5lNw7yBCNT3Et/w5d7ty4TsiFZ+SUjzEjoxFpT
 0bjRUNZE4Xx/yg==
X-ME-Sender: <xms:rOAhXb6SVmX5vxlTDeCQZIczVcql65k1NX54FiKz1WOaGFeJRD7esQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:rOAhXXakZ-oMDKVNO3wA7NjFrsETX2yd1PpaD016U6YABEMNsWzCQA>
 <xmx:rOAhXVqrpzsxWT-1XzgtzLRbe6NvvXYNgPeZn-e3naTbA3zg4gPQyQ>
 <xmx:rOAhXWJmr0srgGmx302AKkEf5-C7EUfNBW5AZurrObTiWxF8gGgsZQ>
 <xmx:rOAhXQdi_PT9UtAq5ZwpyE8FIJhdARboYRqkAcvpbFPwhqct91X6Wg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC3498005C;
 Sun,  7 Jul 2019 08:08:10 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:57 +0900
Message-Id: <20190707120759.16371-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
References: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/7] ALSA: firewire-lib: code refactoring for
	error path of parser for CIP header
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

When a parser for CIP header returns -EAGAIN, no extra care is needed
to probe tracepoints event.

This commit adds code refactoring for the error path.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 24cc8ce51e01..8c4564a560f6 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -635,12 +635,8 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 		cip_header = ctx_header + 2;
 		err = check_cip_header(s, cip_header, *payload_length,
 				       data_blocks, dbc, syt);
-		if (err < 0) {
-			if (err != -EAGAIN)
-				return err;
-
-			*data_blocks = 0;
-		}
+		if (err < 0)
+			return err;
 	} else {
 		cip_header = NULL;
 		err = 0;
@@ -654,9 +650,6 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			*dbc = 0;
 	}
 
-	if (err < 0)
-		return err;
-
 	s->data_block_counter = *dbc;
 
 	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
