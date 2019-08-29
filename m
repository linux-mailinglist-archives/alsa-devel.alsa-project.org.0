Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E117A1ED7
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A76820;
	Thu, 29 Aug 2019 17:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A76820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567092116;
	bh=kM5HZJEJcgejq/XmqNKywin18Mm6WmnmSicZoJlNIhQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gCsDMlgC+zTMxgv5hpH5OGBd8CV6jz8ggcPgI/yL/YH6UyvfCw3JEu782UqBe0T9e
	 QDe/TnDGRH1KT9xaMiGVLE77EvuDl07h+ImDB4HtFQUsSmHoRIdmZzheCK8pk6NFW8
	 NLwTmq8hNV4NjvbMldeOZmpLRZeA5M23g9I6ZFfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE097F80636;
	Thu, 29 Aug 2019 16:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A38CF8060E; Thu, 29 Aug 2019 16:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D040F802A1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D040F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Pt2SPji9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0l1PgJDb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 9967320D98;
 Thu, 29 Aug 2019 10:37:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 29 Aug 2019 10:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=nQRTzArS+lXZk+Ftl9Tu7C8175
 Fir0jAq/pLQ/PQR8Q=; b=Pt2SPji9hxu6YyuLY8frCmZGGbqZU+s6BKjqmH6aSR
 mak7XjULdMfIB911EfHU8ryxS+2Yd/voFTt2xU1S4SGhflMy6T+0KGQ5mz4v4yar
 PU3Bjzc6ALM2u/swq+gGYIPbN48r7YCMf9mvkpnMgi5RBhR3M6BGLgtAYUzXnaEB
 1L+XLZA+0/+dtIkf7Sexg4wekH/Rj9ews2B7/0+isneAbS2HUeNJ0ulcF4p4rZYE
 yt7JOtmFD8hMHroU1CNpWfgCL92lGlgq2LV8DMiKkE0veinmnY9A5fv3XOag8qlw
 Gof2OSTRsUZyu8sVSrQ7/KotLLehV7S8UNg4RhpLXfBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nQRTzArS+lXZk+Ftl
 9Tu7C8175Fir0jAq/pLQ/PQR8Q=; b=0l1PgJDbyLMsnzpncR6yfC8K5neYPMAkt
 60KY+l8G92011QhSE1N+EiraXIHB6XBZ4bzc3zm6Dj2sDiAD1YqHclXATY/d5FG8
 TQOXt2dmapYLLUYjPbuwBhzYqorXhRc7unXSbiPMOH6MiAFfIjRBOuXNvr5LBswU
 TcBMAMYokKzDhudvFvSQI5fEOyczV58OYhJHYSgwibUOiMJ280pq7r2la5Y++cr/
 jkXI5oASsv6vKQZiP7QaFTxD1WMPvjZmZIB63XyFh6NNJHeSmNlQZ1sRK8R8faGz
 ptHJGVY1tjnGdvYwTprjqT6ZF0K74bUM0mUeLOSl/Io7RKXZuI8OQ==
X-ME-Sender: <xms:JONnXQn41t4pEqIIp6btQDLZUsUCqwt-3z0aMcPMCIKDq3fB1JmQBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeivddgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:JONnXSw6lJb9UHj6gNBwdzCkerVc9EYNaDIBKC3nGFeCPTZND-184A>
 <xmx:JONnXVZ-D4X31SA435PZ_N7SciasRbfBotcjoaK1dagcVAhxV61WaA>
 <xmx:JONnXWuLPI7m7IXvNgY4WSn-XEJLGRx6ucgiIGv5uunEf9SWwCY__w>
 <xmx:JONnXYWLF8TfRAVQNOjylDlqto0IweMb3sJoo5EwWnoK_AsdlpF9uQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 38BBBD60067;
 Thu, 29 Aug 2019 10:37:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Thu, 29 Aug 2019 23:37:19 +0900
Message-Id: <20190829143719.7981-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: dice: fix error path for initialization
	of stream structures
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

When introducing AMDTP domain to ALSA dice driver, error path does not
handle error correctly. This commit fixes the bug.

Fixes: e9f21129b8d8 ("ALSA: dice: support AMDTP domain")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index af8c5a2c28f3..f6a8627ae5a2 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -570,7 +570,7 @@ int snd_dice_stream_init_duplex(struct snd_dice *dice)
 				destroy_stream(dice, AMDTP_OUT_STREAM, i);
 			for (i = 0; i < MAX_STREAMS; i++)
 				destroy_stream(dice, AMDTP_IN_STREAM, i);
-			break;
+			goto end;
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
