Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A94673CCEF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B5F1751;
	Tue, 11 Jun 2019 15:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B5F1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259733;
	bh=+hAJQJGvrN16wICV/La0cxh+6lDs0mk30g31VHL/xwg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idDWnP5ZsWTO/PekBZhWTxq/zRwZI3hKSSPTQVQUn2XUg6vtzSSK368mpxZSjpwGt
	 OUhjw2fO3y6htw+XEBICs6wcO32BT5Uq0laVyRvWf6lr+EuTSTzA4o+Q5yzx6GsadQ
	 TJf83t/UukKMB8ykt/gyjehi8WFxHTY2btShT2YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDCAF89754;
	Tue, 11 Jun 2019 15:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA834F8973B; Tue, 11 Jun 2019 15:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54077F89736
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54077F89736
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jb3CKWIi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="QlcgFLpQ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 82EE0220F1;
 Tue, 11 Jun 2019 09:21:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LbWxWRCurqiKS
 /8hT987XiWCYcgoB8HyNGwzA7aoang=; b=jb3CKWIifboaroU7zMaUkT3muLQFU
 IWbWBbivMwJOAhpE8dKpsuaKvRDSCAWVrfdK4dvVmotH3Y2SFPiXstoKr+7YfAUS
 pwYFevf69yVI9G8jgCZVqgvKUp3ZRdusx2Y9blggnSXauiagz0fQ4hHr6agb2Z/j
 r/Vwcm6eX55R0wbJQvQ+UFqk8Shpb8KBaIxUOwxGWkalsRd0sBU1EkJUmRLguPOW
 F6sjIgDlT/UlRC4YpW6+iHlTzANyQ2YSECBQhWFE4K/ZNzKhoAiKF8D2V9PLP4q/
 Wxc29iFXbQ8+1L11fGviQaDv4TSAX+33eh+oEcvx+LdPN6Uv0W5RzmupQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LbWxWRCurqiKS/8hT987XiWCYcgoB8HyNGwzA7aoang=; b=QlcgFLpQ
 2QUbwY8wY4aWD+FdUX4AmsXpRzMh7joC/7zobiBwC+vA0p3SwmERiWmYc/v2/3oe
 fdfQA223MEX5V5uLmYmXPMB5oGtFNk+wg3L5qlUIJThCf4ft6ClHdg1DU4Ze1ZRP
 PU6oIOdDaK/SGdgPajWk6Kn23UThmMyaBObdf7Z4l2BuK6boYx5d7E+xOf3nfBaC
 8HDhvS84uIvjiS4QLxzsn3KKVQNCVZL7BP4R2I1hBfZWPKu3t0fshW8JuvdSC3jY
 RA+XaKKhMQ7bMDDpNg2Rr4B1YQ7BURIxi1PTjIC0QylPZ9AC95L/xEK0mz3j4MlP
 5ua1mLCt7r0Meg==
X-ME-Sender: <xms:4ar_XIsiWZtYzlekIiNXCRG6ttTWyxMkSxO8bCGGnolKg1usQg020w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:4ar_XA7ltup2uY_D57lyRLFdVDrFdJcIdvp2hgfqt8M_5R0uCK0lEQ>
 <xmx:4ar_XHQufRb8jDzuEY8KxV_o1rqi7HMo6bkxfnJtegw9tFJI181KKA>
 <xmx:4ar_XPrlJZF9exuLzsX1zhX8HCDiMmMmn-nAvW801lhQLeti8AAyBw>
 <xmx:4ar_XPmAdpStjgD2qrLw0ctc9ek--_hx57FUziCG0s9Rv6xR7Fx5iw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 09FD9380083;
 Tue, 11 Jun 2019 09:21:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:14 +0900
Message-Id: <20190611132118.8378-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/12] ALSA: dice: code refactoring to stop
	packet streaming
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

This commit is a part of preparation to perform allocation/release
of isochronous resources in pcm.hw_params/hw_free callbacks.

There're three points to finish packet streaming but no helper
functions for common operations for it. This commit adds a helper
function for operations to finish packet streaming.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index c3c892c5c7ff..8bce923dc4bd 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -230,6 +230,15 @@ static int keep_resources(struct snd_dice *dice,
 				fw_parent_device(dice->unit)->max_speed);
 }
 
+static void finish_session(struct snd_dice *dice, struct reg_params *tx_params,
+			   struct reg_params *rx_params)
+{
+	stop_streams(dice, AMDTP_IN_STREAM, tx_params);
+	stop_streams(dice, AMDTP_OUT_STREAM, rx_params);
+
+	snd_dice_transaction_clear_enable(dice);
+}
+
 static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 			 unsigned int rate, struct reg_params *params)
 {
@@ -328,10 +337,8 @@ static int start_duplex_streams(struct snd_dice *dice, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	/* Stop transmission. */
-	stop_streams(dice, AMDTP_IN_STREAM, &tx_params);
-	stop_streams(dice, AMDTP_OUT_STREAM, &rx_params);
-	snd_dice_transaction_clear_enable(dice);
+	// Stop transmission.
+	finish_session(dice, &tx_params, &rx_params);
 	release_resources(dice);
 
 	err = ensure_phase_lock(dice, rate);
@@ -373,9 +380,7 @@ static int start_duplex_streams(struct snd_dice *dice, unsigned int rate)
 
 	return 0;
 error:
-	stop_streams(dice, AMDTP_IN_STREAM, &tx_params);
-	stop_streams(dice, AMDTP_OUT_STREAM, &rx_params);
-	snd_dice_transaction_clear_enable(dice);
+	finish_session(dice, &tx_params, &rx_params);
 	release_resources(dice);
 	return err;
 }
@@ -449,12 +454,8 @@ void snd_dice_stream_stop_duplex(struct snd_dice *dice)
 	if (dice->substreams_counter > 0)
 		return;
 
-	snd_dice_transaction_clear_enable(dice);
-
-	if (get_register_params(dice, &tx_params, &rx_params) == 0) {
-		stop_streams(dice, AMDTP_IN_STREAM, &tx_params);
-		stop_streams(dice, AMDTP_OUT_STREAM, &rx_params);
-	}
+	if (get_register_params(dice, &tx_params, &rx_params) >= 0)
+		finish_session(dice, &tx_params, &rx_params);
 
 	release_resources(dice);
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
