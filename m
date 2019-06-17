Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD047C07
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89031762;
	Mon, 17 Jun 2019 10:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89031762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759711;
	bh=4HDuqkeIVw+nnCDNCrCYxJPs9Pn1gMbZaayMxfKGLqo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lSURuYN0R0OxMZcOT462sHXHdpc82LAv46JRHt69KSb2eF7NzqYjmjJULDfBKOUQO
	 adGgmHq+4tlUXhVhJ9fVTelSP2rgU3DwKM1g25oSldH+V98Euv3R8t5jI3WKM7hKf2
	 XB1P5FEFOrQ6nTkU/L3kXKYV8FskzAo87T8Xp8oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A1ADF89750;
	Mon, 17 Jun 2019 10:15:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9442F89738; Mon, 17 Jun 2019 10:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18A34F896F9
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18A34F896F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iwH4R7wE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vfT1194M"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8C10174B;
 Mon, 17 Jun 2019 04:15:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IT1hXbmsFMmC8
 QQh/FFYRwviAynmCpCr7xWXPe/yZ8Q=; b=iwH4R7wEZALmClJYKzBO2x+jV1Szn
 0cox6zRLABKGegTRatgnaE+U4WNLDr3kHU/l5ZzaiokfEyxJ6BEYfkyuvXm4YImp
 ugngwN0QnrpEch6CVSGzuuM7Ve821jfgnarNnKrlageZ9IqqHTcqtspO1gKERQMr
 ytbcdv3J1u5XASnYKlleT5oKXSs/4DnAHWqoML9MkoWezk+4DxiDbNB3UZpXE4Jz
 F9xtQoUbH0fXLcuyiFcyPEJMFEQJjhHOLmgaQu+n1HMr0CrPbkTR3OfQrKOJEHUI
 45JPbJUCfUrtoM+Ipi0e071dhM/Kfv9GtKAK7m9z1H+sZ+JzsG/UlORLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=IT1hXbmsFMmC8QQh/FFYRwviAynmCpCr7xWXPe/yZ8Q=; b=vfT1194M
 ocXAjlgnRG8ySVVXP4m9izrrOsHgAriv19XEbXXg9lPt6DOoMYTMejbZxhaGsXVx
 Cv01mUYTwngpmuvkxJ6Iladx05vskOZHSqaa49LVbhvL7yo2N3WQJHh4AH1VcNuN
 zc5GkmYNkiCs57D7EH6MNvsCRukCqfD8SuKKxNbX3uhEW4OSxACBZUHRe3753MQE
 NCLYdBNPU6P5sI23Y9SKVac8+RR7z8/ENOUCh/pK+80VEii6ncQcfoHLjDjRdBbD
 7O2wG/Dea9NrtTgL6M7Mo+pJeShjDTFUgv30UlxMiYig/eSIW0wZlqPH9j9f4+QA
 uvJrwAwq4dh/Dw==
X-ME-Sender: <xms:HUwHXaEzycMHkJIurfnExGA1eIcA0CEc9MZoSjqHhLFfQPRGqXXqNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:HkwHXXqOJBn_NDKSnRaGxCHwKg3ZJ0_ySHpQG95uPTkRYUGJaoiv-w>
 <xmx:HkwHXW5PCcDrKNi-2JFSPPWetBjLYdzQTjh12umjxH9VTuTAhooBlg>
 <xmx:HkwHXV5FT5c50wgNH1mV3mErj7MwGOqp7D8_72WtDyA7JV6uVlqzYg>
 <xmx:HkwHXXVVftefykJTp-U_vjJjAOQM_QJ_a1CHfWuTwmItRcriLprLVw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B2C0680059;
 Mon, 17 Jun 2019 04:15:24 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:07 +0900
Message-Id: <20190617081510.11025-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 07/10] ALSA: firewire-motu: code refactoring to
	finish streaming session
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

The operation to finish packet streaming includes stopping isochronous
contexts. This commit merges it to the helper function.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 4fbec35eaad5..53c43848b137 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -101,6 +101,9 @@ static void finish_session(struct snd_motu *motu)
 	if (err < 0)
 		return;
 
+	amdtp_stream_stop(&motu->tx_stream);
+	amdtp_stream_stop(&motu->rx_stream);
+
 	err = snd_motu_transaction_read(motu, ISOC_COMM_CONTROL_OFFSET, &reg,
 					sizeof(reg));
 	if (err < 0)
@@ -219,11 +222,8 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 		rate = curr_rate;
 	if (rate != curr_rate ||
 	    amdtp_streaming_error(&motu->rx_stream) ||
-	    amdtp_streaming_error(&motu->tx_stream)) {
-		amdtp_stream_stop(&motu->rx_stream);
-		amdtp_stream_stop(&motu->tx_stream);
+	    amdtp_streaming_error(&motu->tx_stream))
 		finish_session(motu);
-	}
 
 	if (!amdtp_stream_running(&motu->rx_stream)) {
 		err = protocol->set_clock_rate(motu, rate);
@@ -278,13 +278,8 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 
 void snd_motu_stream_stop_duplex(struct snd_motu *motu)
 {
-	if (motu->substreams_counter == 0) {
-		amdtp_stream_stop(&motu->tx_stream);
-		amdtp_stream_stop(&motu->rx_stream);
-
-		fw_iso_resources_free(&motu->tx_resources);
-		fw_iso_resources_free(&motu->rx_resources);
-	}
+	if (motu->substreams_counter == 0)
+		finish_session(motu);
 }
 
 static int init_stream(struct snd_motu *motu, enum amdtp_stream_direction dir)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
