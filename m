Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBB89D12A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 15:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7A11668;
	Mon, 26 Aug 2019 15:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7A11668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566827822;
	bh=ZqFg9TpR+9+9C2yE5vnbyZhvn68HF97Y2mqi9AmAcC8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sxeRKOdhJZJYlAgTKF7ETigKRPH+tlXSCkWKERtk56eZkz2ddnpDH6YBJI51s+e2R
	 y5AdRf1tZgi67qVAIwZ9Hg6Dxeu4FbJhEj+McdVSXp03/Yj+T8JgndmHjr7BY/qvbz
	 Toj1XwHkcQ3uzEHqchlWh5B2FcohJH2Bl7cbRYe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4820F8038F;
	Mon, 26 Aug 2019 15:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 775ABF80376; Mon, 26 Aug 2019 15:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28F61F801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 15:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28F61F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="H1FppJEo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="077HGOTh"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8653369C;
 Mon, 26 Aug 2019 09:55:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 26 Aug 2019 09:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=qVqTVg16jy8BQ/ifqmCcF0n/qG
 XCt3vOUx/D0q+cu88=; b=H1FppJEoTV1pZ+x+CbybwdkxtdMTeP0pbjurXJ1G/H
 KSFCgQ1Zro5uuA0JIlQeDlyI4I6K2idzI6FP8dWcSvea1IACcHCn7Z89ocKnZWsU
 RCUYSCLt6VRuBX0z3/2C1E3nXuuwv1/PWJQYKcp98NLvrkOjAxBKS/9/eHwXDE9F
 6VqDzTC1YFvPlKQAWqMytNHNg1DHwVf+MAVgjg3KPLJd4muFN5F+QbHOmWkmyHmQ
 zgU2ncoArS+7dhaXJnTpJNZcCjYn/ik4/yg0uiG49aOwCb/2YGSs8EZxPvOdSQns
 N8LQGTuOzG4pi9/FdHAvt0503VPu+hv3Yq6kuhMb4lDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qVqTVg16jy8BQ/ifq
 mCcF0n/qGXCt3vOUx/D0q+cu88=; b=077HGOThyIs22EQYMo0do3T5YdyaNn7Cw
 39jBUtD59gL1MmVwPi5hWC2O8dK08F70luLMUPXI0NJcvxmPZnJfLAre7B25XTLs
 7ouOJwIikdnQPQeIIRPmYDKH9L5utNG50dh9ZHj9mzgUdX+IPUR6Tqwz3JpL1GKT
 HD0rlX4gXp31rWx0VAWZzsoj1tWNYeWe7msbwqhTnL9tkZ8CMnXhKa/xB+wawoZE
 598W4zUpd5avIfXPlk6kgW7OisbakORjKhxu1U9LtNOK8eSm3dyWjf8sngh69ZMV
 pw9PchlxTEnoTv/NdR8gXlFzn7l/PyNofC6kqDvoR6Bdck03zR26g==
X-ME-Sender: <xms:yORjXZ5oyvrgN4tZHi1zmA0lGPJKm2_2b1j87gKda0Bn4RtOKqdjzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:yORjXZIrGRXn4ZdBF9SV-thLpwdQ-Kyw0QPaqR4V_ZG_YqxSLVjutQ>
 <xmx:yORjXQjYs32_2eyyBiAttJB3Kax7SiRI1u151-FoVHUrFygPQZf0hw>
 <xmx:yORjXbExu13E8wNY7-55mZpd_G4Oj3x5cEADXzyE_cghhBM2nt-MkA>
 <xmx:yORjXUfmtYXdT9fAUnHQVLHQn78zMqUfzUuLZjnaq8wnqisPWA2hsQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8770D6005F;
 Mon, 26 Aug 2019 09:55:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 26 Aug 2019 22:55:15 +0900
Message-Id: <20190826135515.28019-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: oxfw: fix to handle correct stream for
	PCM playback
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

When userspace application calls ioctl(2) to configure hardware for PCM
playback substream, ALSA OXFW driver handles incoming AMDTP stream.
In this case, outgoing AMDTP stream should be handled.

This commit fixes the bug for v5.3-rc kernel.

Fixes: 4f380d007052 ("ALSA: oxfw: configure packet format in pcm.hw_params callback")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 9ea39348cdf5..7c6d1c277d4d 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -248,7 +248,7 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		unsigned int channels = params_channels(hw_params);
 
 		mutex_lock(&oxfw->mutex);
-		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream,
+		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream,
 						     rate, channels);
 		if (err >= 0)
 			++oxfw->substreams_count;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
