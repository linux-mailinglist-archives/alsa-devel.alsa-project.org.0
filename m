Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4E2942B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 11:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D1C316A8;
	Fri, 24 May 2019 11:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D1C316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558688741;
	bh=7KCh+5HJoW4aJsOE8VAQb46QSl8jzBq9LvEKCZy+eGE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDPWPDX54BRpe/kaHcY6nFsTyBkF1gbOuytcDUbICPz3RlkoPgcbSSmuCxu9Pxkaj
	 DrvQGPijos+vL+9bbYGXCMS6Vcv5Jd7tZWpzK1Ca0ik8c2JIrarAMMB6UhWU9uiAp+
	 SChlmqYy6iS31nLT7AZ5VXipCKSC/nn0xXeK+uq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E20F8963E;
	Fri, 24 May 2019 11:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F551F8963E; Fri, 24 May 2019 11:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C54B5F8962F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 11:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C54B5F8962F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dch7EV0d"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OYRFGOjV"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DD7320A82;
 Fri, 24 May 2019 05:03:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 May 2019 05:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=6zZyh9KxMv4Sx
 i9JQCTbNSmM1mtiBf1P5RwqwIILfiQ=; b=dch7EV0dUSY6EJSYuoXcifoaBTv2O
 CfF94ZDu9TLuMTUxtVdnI4x+umW7D3ZwB5jxJ3V5PGI04csAXPOtFXdXh3maMULP
 q8diDdykY6RYmaMC5yKTEW2iHwI77ADCXIt/kPvSBu+pkvbJ2JUg9LmBWzMb4uxk
 RZh1EUl5x5v+ANqGyjbZHD7xEyvMGPHuefTvIUcSIOKRZcZSBRSFzfZGoRZh+pLQ
 BPprQ7i8gJ6UXBQ10rNtQ2c6Byg9isPfaQeUOxoExORKZpEYTlephn2UjZmcvci2
 skwxbZnGZyMzyFdWdRx+iDwnHy3UDhf4ZJ7+es7ckkBt2pGOdmw6l7hzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6zZyh9KxMv4Sxi9JQCTbNSmM1mtiBf1P5RwqwIILfiQ=; b=OYRFGOjV
 kkT851ADyCAA+3R78TafuOKzngZxgaKLGNSEOd+L7w04C18JCO9A6bvYZD0NR3cE
 HdoXmzGQFS2cuTxFmVIRCy6dql2zWD7DsEazOGP/+uzavcsUOVy7JXQzjomXVqhg
 OYDWmeTWBs3K8q7jI3yYERDid3LJLPX113I54tLL5BBKfcxCnX6gBV5lRBLZj61P
 ykpOJIWctPzeTzojXTKObzp7ztwM80SZ7LE4v8lTeSpa9E6PweYMIbdfA5KuHuFu
 rYDF1Zw8Nu8UdQYBz/AIzaVFVb/zxdZog1izVeVZCfYrSu6dQI+JTxQRx9kdyfbv
 HjqFNlxIW2/s7Q==
X-ME-Sender: <xms:dLPnXAIQicXv6sdnslFvvhGILWTgrfF9UFFLo1X_kRtGd3LRVlQdbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:dLPnXAhk9AdPQ6f_5LddE5ra1yrLhmG25n0bz2aWZje_VfEvttSjZQ>
 <xmx:dLPnXImNPhtb0stnnLFi7vNhH4cGixGvhKEWoTRFt51lRBfaXVI7ug>
 <xmx:dLPnXLE5BEqjNw__YOazYC2t1aAz7scKGwOcjpmgREOuyE4G70uAdQ>
 <xmx:dbPnXGns-bO-NiqTmFIlKIMcsO7Swp4TQS4VNoM-Jg6IUDd1OMBW1A>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A4178005C;
 Fri, 24 May 2019 05:03:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 18:03:39 +0900
Message-Id: <20190524090342.15619-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
References: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/4] ALSA: firewire-lib: fix data block counter
	for incoming packet without CIP header
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

The value of data block counter is not calculated for incoming packet
without CIP header. This commit fixes the bug.

Fixes: 947b437e1263 ("ALSA: firewire-lib: unify packet handler for IR context")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 791efa5585c2..8a7da86650ea 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -674,6 +674,8 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		cip_header = NULL;
 		data_blocks = payload_length / 4 / s->data_block_quadlets;
 		syt = 0;
+		s->data_block_counter =
+				(s->data_block_counter + data_blocks) & 0xff;
 	}
 
 	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
