Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCD47C00
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F004117A8;
	Mon, 17 Jun 2019 10:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F004117A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759638;
	bh=Vq6viaMugPt1fkEYuZxFOcHq/XoEbeozrx2x0MQ8GHw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlcmEau0m6HFuMrVJIHn5L7wd55adCb6D8qwgvQ0KbQHimpxz+YY+7reimBH1YvRx
	 7s4Tzc1Zr5fRICo01nL3xVvnQBfEPcQtKK+nb8nxiFGGnJqSx83gjtyAIdz/wuduqg
	 XzED7lbpOVl8F+vvnipkpirZ/4+fXg/WZO/s9qb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748A6F89748;
	Mon, 17 Jun 2019 10:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21CB1F89733; Mon, 17 Jun 2019 10:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 316D2F896F9
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 316D2F896F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cYb3PIeT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k7lRGM7n"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 853666DA;
 Mon, 17 Jun 2019 04:15:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=39j9KP1ZRI77/
 ozYN1Sd5CHsUml3bBGYWhg6XYt/yFc=; b=cYb3PIeThBYX7YspuWeJoBf36ZLHr
 bft6utcK9tCzpViYLhRuC2msmalSLDoZEJW69kKcaizJC1eGpidj0LAQugowFbRz
 ZU2c0/xT0IuFNIj4XUJzghYuQkfL/0f7xIwhXxlpG2HcHxZA0R8HOCAXkYVQZsXY
 9l/M/d86C1sfYQFNIJcwOhWhXzlpBncbQH5eM7eZLJ2x2sJAheYwAeq9D/RK7njP
 pGGHptiinMe21awJtOIVMnPCQFlUAYPX2cwbNpI8hTaV19GAJHWajLSYSpYtbIfV
 YtAreQjgi9tIi092nKpN5Ri3xaXfMlvja2gGxsJUSVs3ZMHmcju1fI5tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=39j9KP1ZRI77/ozYN1Sd5CHsUml3bBGYWhg6XYt/yFc=; b=k7lRGM7n
 O0YYGEdoOsT9C7eSY7DVlYknMUiERd42bEAsoe5XbOAFhQWd3a7uN4PEc1zjPS2x
 34EPFohf3H7ykY2VvLmZN+ICPsdtHdSmTiimt+av5kqpk5NThl/cujYC0zkn+dLU
 Uh1cykyoD/3BrEs3Kcq8+06mM9LoYJ0sGsJRHdm9eJQe2+TgvGrwRUTlu/zOdJ4O
 i5Iwnrew1TSYfrBObRkI19u4xBEfVM1ETdZaLtgSTi7ZLOcoz86EuNf3TD75UAh7
 q/kO2UFBfSQExrEIxjNj0BF08jHYSYwsrbZVhzOBzsK78IVpDBqxF5DqTrLqEerV
 wvdnHIg0Zf4fpg==
X-ME-Sender: <xms:GkwHXUOxhNFnANFR3H0KYdbsIwQuHRulgFKkidqzUOl6vxTl0lwaNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:G0wHXfOgqpE7RNtnl_5r7QZ6yepJ47ZylGErJPhU2lRVPSJPdFuFlQ>
 <xmx:G0wHXWTG7y12foWBpDCZzuuagGf7SYU_WlPxCOlytiFv8yJSG2pFpw>
 <xmx:G0wHXRBahKaD6yr90tTvYGC1JHgsbqafEYYbfB1mtzCl2exCJYkdaw>
 <xmx:G0wHXQDteGr_jV_tAmYGB1ist9Bexdsg6kEP6qzlQk36pV1g_zkzWg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5AE98005B;
 Mon, 17 Jun 2019 04:15:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:05 +0900
Message-Id: <20190617081510.11025-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 05/10] ALSA: firewire-motu: rename helper
	functions to begin/finish streaming session
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

Like the other drivers in ALSA firewire stack, this commit renames
functions to begin/finish packet streaming.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index a3f45f2c817c..cb01f1d784f1 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -60,7 +60,7 @@ static int keep_resources(struct snd_motu *motu, unsigned int rate,
 				fw_parent_device(motu->unit)->max_speed);
 }
 
-static int start_both_streams(struct snd_motu *motu, unsigned int rate)
+static int begin_session(struct snd_motu *motu, unsigned int rate)
 {
 	__be32 reg;
 	u32 data;
@@ -91,7 +91,7 @@ static int start_both_streams(struct snd_motu *motu, unsigned int rate)
 					  sizeof(reg));
 }
 
-static void stop_both_streams(struct snd_motu *motu)
+static void finish_session(struct snd_motu *motu)
 {
 	__be32 reg;
 	u32 data;
@@ -235,7 +235,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 	    amdtp_streaming_error(&motu->tx_stream)) {
 		amdtp_stream_stop(&motu->rx_stream);
 		amdtp_stream_stop(&motu->tx_stream);
-		stop_both_streams(motu);
+		finish_session(motu);
 	}
 
 	if (!amdtp_stream_running(&motu->rx_stream)) {
@@ -250,7 +250,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 		if (err < 0)
 			return err;
 
-		err = start_both_streams(motu, rate);
+		err = begin_session(motu, rate);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
 				"fail to start isochronous comm: %d\n", err);
@@ -285,7 +285,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 	return 0;
 
 stop_streams:
-	stop_both_streams(motu);
+	finish_session(motu);
 	return err;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
