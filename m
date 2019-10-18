Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE34DBD9B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:21:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A6F167D;
	Fri, 18 Oct 2019 08:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A6F167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571379671;
	bh=ymiipiXee2nZiGhCFlgfyKg3JlrgJE8uWPaWF8uCiBA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFR9fazU/bmdzRk+c4U/7TaHJi/BdSLVkJuBCAgLRuY4mGfWwhEmtBnBkopdznjfT
	 s/SwiKjZa4rucj9A8GolASeDq6oapTKPbBiz4xXOmG4bBZD1MstmIZKlCdlbsonW6M
	 Wt23jsDNHcbumeGvUcZdkWbbDYzcV3p6oZobED5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72E05F80377;
	Fri, 18 Oct 2019 08:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97180F80376; Fri, 18 Oct 2019 08:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90DACF80362
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90DACF80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EHmT9c/k"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vktOw2Be"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D708C3FF;
 Fri, 18 Oct 2019 02:19:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Oct 2019 02:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=AOwIwA67BrgER
 d4EbiUQBjnrhQxxzzsimC8IoRl+S0Y=; b=EHmT9c/kDzu0eOm6S4HqpwbUy2zoK
 rof+49Cm63JkXAnf/Ms0Ce5QY4n7gZxJizbtWodl4QClEoQ0LimZ7JgrKijMUs9m
 lM6tnA5W5T9j9WLIlotclvOjnar2E8cksKbbJuZRwcKmUYfKh7QphdWwYwRMNRXB
 vfHbzCFM9XvaVdXEfNSsCWyvFW3zJcDI8c+bg83lbNY6R1Kh8RDB3hzF62axfyFf
 x5RBcFU4ah3lSpz1mU1dmfUCmeP1q1Ph5qI+Qai+84fibXdK/qF1UyDozOKjS9bf
 BIydLkcVWNsjLqJOYpPDh78hAL1pCcC0U1lweCxDWtWFmcecf0d2in+wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=AOwIwA67BrgERd4EbiUQBjnrhQxxzzsimC8IoRl+S0Y=; b=vktOw2Be
 S1Yv9XG8C6GinqRFwoTSQKBhV5lQ5LxM1XBgm77u1/BbPovM855DvyYqDhtTeoId
 8v3IuruEmRgIxBdsAg6tdJ5D3+7h2s8Jv/a361Bu+I5zqEXvqYp90Cgk2hh+zNyv
 07C1q/TzKq2wo+A4L1DBiKTgw5R8onbM/Rrhlw2BBi3a3662GSRW4/wX7RXIjreB
 bymKP82Lt7UyBWXnaTdYuVAvfI2G2QJ5pA4ldvnLmzs6LzOPBAdHIicxyoCRnRYc
 AQkpyXh0szQwHefGEmcc+HPCcfQWpU3TuMQKvG6A+YswwIxzLYCerssB1fONtjPH
 bgd8Thx407me3w==
X-ME-Sender: <xms:ZVmpXTnsQwjHv_rHMk5WxiDsykMBzl3sH4IpubSwDr0sh6D_vT9r8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ZVmpXWDlfY2EWFjLqRWZBfZQlhJWc_I7NMUwCBE4QXyEafftj_VsRw>
 <xmx:ZVmpXcVUYMyMcwe7jcY8xwlvthXf9YWWLRgq-M4tdeG6xikDH-hE2w>
 <xmx:ZVmpXU9PGlWAcEz3odqXi5HYGFeI3nm6BhrsXIyTuIRiEixweUDAYw>
 <xmx:ZVmpXepAv_l50jfdWf7dByBDLOEleTjkjCHjZsCnn6XJ4HyYZ-2zeQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F8DE80059;
 Fri, 18 Oct 2019 02:19:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 15:19:06 +0900
Message-Id: <20191018061911.24909-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/6] ALSA: firewire-lib: add irq_target member
	into amdtp_domain struct
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

This commit is a preparation to handle several IR/IT contexts in the same
domain by tasklet context for one of the IT context. Such IT context is
stored to AMDTP domain structure as 'irq_target'.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 344818e936df..f92397a2f35f 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -279,6 +279,8 @@ struct amdtp_domain {
 
 	unsigned int events_per_period;
 	unsigned int events_per_buffer;
+
+	struct amdtp_stream *irq_target;
 };
 
 int amdtp_domain_init(struct amdtp_domain *d);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
