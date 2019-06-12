Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A741F97
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C90173F;
	Wed, 12 Jun 2019 10:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C90173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329268;
	bh=uEGoTSHa4+0uRZo5/KpUrpLY7uuUa1g8WSoclMsRmiY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gmzHjUlhJ6f2tY8ob6quqhjrb00lBvYFwjHdI0yuhTiaEOGsUsqNaUKzqsl/vW5pv
	 UeZsVnqxMCZN5hUU3MoiAiIndm2zTgVJxRAA8+BLIFGI2R2tY1kXXTony5TigB1LpD
	 XEjh44a26rKHLp2d02Lc26+0bx4l9njo/czNefIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA35BF8973C;
	Wed, 12 Jun 2019 10:44:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91727F896FA; Wed, 12 Jun 2019 10:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AADEF896E0
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AADEF896E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HcSOhFpN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dDNn9uZ+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5913921D;
 Wed, 12 Jun 2019 04:44:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=rQPw2br47iJmu
 AB9R7SwY+syNnr+IhPNRTSQq5YT2hI=; b=HcSOhFpN5aG910+30ipfuGNoWxJZX
 NR6Hod52Lq8I/DJ6yiNHpNVQbyOuzzeLq6LP7Pwy6LKTlLWsfrvs6JUj/vSTKWCC
 kJR4AQuhl47HZEw/Qrg3W4ZHTQoaEM0Q1mVn9ieq/beyONggWgKlW1Bx/s3bDib0
 pzo5MSS+XnLglGER3Xjhzt3whQJQItZ6elJkdqa7BMA72V5yK4OXQk9Lj9SUW7O/
 gb7NtIPLTp3O4Y5+oca+osAmZto+Pe0PVpkF1FQP4yMI6LPPeINxXTO3hxB/x2q0
 7x+IeYMbXZYo3n6Iski02xRH9t/9akdmp9T31Hm9N6dL3Q9oFmVBWJx2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rQPw2br47iJmuAB9R7SwY+syNnr+IhPNRTSQq5YT2hI=; b=dDNn9uZ+
 IBYtWkJwxMa26rxGRHdXdwr8L+21DV7SLTsz/KdDpdyqj9NM61tZ+l/CNPB7Mulh
 VmYAq5QXQ+W1dDq8QmBS+phy3hLMrFIBWwP/T/jvPfjeSk/GW/y9iLXc9ER/NQWU
 7whFyYU3yeHdOZ65qe5diXrpZSczHUtWsUT/DTSd6yiQ6sy9hhtlbCtYEZR6FdYR
 GGwaoq+L0d6GR2dZNqSwSUvtJhNcqTBuD62yjMocNkNWA3JaYDCtHGZH6t4Nvg2z
 z/uDJU2IR62jk9frFR2oyltp2j2VhQ4TcWinSb+OWn6kTaZqjoRshDYWqMo0eBnZ
 cBPVZSquYYN6ag==
X-ME-Sender: <xms:bbsAXT8sI8KjTbB8ZWXxZVcV-FvdkM3qGXCjKO1WEwJF8mlxu8Reag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bbsAXREI6RAUDYsEg73kLaT9vLFBZTTVkHPJI0u8NSgwhHbPkVIw4g>
 <xmx:bbsAXaR02lmt9DhYc8_Z6dpD7HPpEZvQwIqmgzIrZEGwZY0Rk-2Wlg>
 <xmx:bbsAXXu49Umhf1CGGN-KVkwEJx-yyH5P6oXnuZcJkUDZu178n2GDpg>
 <xmx:bbsAXab9aOTi726NpHLXgpKYJioO7ZtrzRsCtD9qsfwx2yfjjr3QJg>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5719380089;
 Wed, 12 Jun 2019 04:44:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:05 +0900
Message-Id: <20190612084422.5344-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/19] ALSA: bebob: don't set XRUN in stop
	streaming
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

When stopping packet streaming, no need to stop PCM substream with XRUN
state. This commit suppresses it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index fcc93156d0b7..d6e7f13ef42d 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -687,10 +687,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 void snd_bebob_stream_stop_duplex(struct snd_bebob *bebob)
 {
 	if (bebob->substreams_counter == 0) {
-		amdtp_stream_pcm_abort(&bebob->rx_stream);
 		amdtp_stream_stop(&bebob->rx_stream);
-
-		amdtp_stream_pcm_abort(&bebob->tx_stream);
 		amdtp_stream_stop(&bebob->tx_stream);
 
 		break_both_connections(bebob);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
