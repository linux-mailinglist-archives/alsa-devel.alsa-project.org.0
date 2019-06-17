Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0B47BFF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:19:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A9A81762;
	Mon, 17 Jun 2019 10:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A9A81762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759589;
	bh=lbpi9P2y0hPOwROve69yTeROkXQesBbTUT7xVssy85I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2YWpOF6u1hEOm4IJkhNhqmtS+NktKKFp47b1XJsbPZdbfBcr3Nrqapi2htq9JRP4
	 4Tg4wk9YTzL22rdqvAwnbDtqiw96rbI77472jaoVWzHThvIs37B7RekyR9V2B61iU0
	 UyzbENaZ2ODPm2YjIBYCp4BRIjTsO+WWM2CPT6Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7880FF89744;
	Mon, 17 Jun 2019 10:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D459F8075C; Mon, 17 Jun 2019 10:15:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 673DFF89693
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673DFF89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="r9ZC2Ns3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="N8+bqi/M"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id DAF0C73C;
 Mon, 17 Jun 2019 04:15:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=IEfeAsGODTUg1
 1X/LCFLcNN0hWFrdO8BUOCmHwwVUxg=; b=r9ZC2Ns3WoHcWOAVlNXZzECi/x+xf
 Q8R3og1KJUZiS77/Txh2UZXDbG5Zy0j7m2V3+plh8YWizboqTvtoJfI78Mpn9Nhw
 ndGmLsPuv8oihlnHybEGtZHBxmpHKamRVCOfGLsCzU0g4VMVNq+tQYf9D82MXN/x
 iUpDbxlC/ekRASzeXVBNngrYMqDmD2UhqXgzuxRrC0RbFWUUhdZZTpWYLDyUwAwk
 V5nAlKm4ymLCSSojxZ8c4ebHyMoTKD90Yu2n/WR6qZgeQ3QWKLGn3U4C2fkMKzu5
 8uayM+pFsWYukc0RmXsop05l3yUQE1vy+7GleXY3MRdO+USWCLw1GbGOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=IEfeAsGODTUg11X/LCFLcNN0hWFrdO8BUOCmHwwVUxg=; b=N8+bqi/M
 NBg9dWEMGo/X4rFX6RwNLKpwQPKU/E1ftwgtw81dW28FbBJCgwXcNwgWKcXXgf68
 Vk2IgrXZgptcbjj8j+72isqLEq2lQBdiQ2tnwfVI2/kw5k+cd07+K98O6hIfXQ30
 ifE51mE3y4F3OLUl0WC4yRaxPbTaR/yCVDCZASj2+M1mVcJbUO96SfvIF12a2Fre
 n9CpfIQHXzocCiAjTb66jg2M0jvS/dSVj1+I3skEKUdyhGWxPWDSl8BucI/lk/w5
 iXOlaLQwlR5bPY2jfKx9NCQU7I9VG6LMoTE9c80wcJdD27j7DGqv0msGe32qWhRP
 eiDiC0DXHpyWvQ==
X-ME-Sender: <xms:GUwHXUWFMtdmsCT8VFEvy-fJwFkrjNhxrqJghTma8IIeCl5pCi6OXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:GUwHXSaBOuISWXY2AFY2Sw8w6O5DCVFH34d0rLxt_AgTw-YjakHGXw>
 <xmx:GUwHXU-pWvKBJL-5__8Pk0SthTe83B-PA-TI3Ry26vUpKbdGAUe7Bg>
 <xmx:GUwHXQuL01NaKMxndhMWaBbbGPexMlWh0Ud9MNQJ456xCsPlVJdGwg>
 <xmx:GUwHXWJAREfF2HZ4bu_MhWdELFKZ1GugOGPs2c9eQAEeZidNNOJKrA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D2D380061;
 Mon, 17 Jun 2019 04:15:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:04 +0900
Message-Id: <20190617081510.11025-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 04/10] ALSA: firewire-motu: code refactoring
	for condition to stop streaming
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

In snd_motu_stream_start_duplex() function, there're two points to stop
packet streaming, however they can be merged.  This commit merges them.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 35b4e0f72fe2..a3f45f2c817c 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -217,19 +217,11 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 	if (motu->substreams_counter == 0)
 		return 0;
 
-	/* Some packet queueing errors. */
-	if (amdtp_streaming_error(&motu->rx_stream) ||
-	    amdtp_streaming_error(&motu->tx_stream)) {
-		amdtp_stream_stop(&motu->rx_stream);
-		amdtp_stream_stop(&motu->tx_stream);
-		stop_both_streams(motu);
-	}
-
 	err = snd_motu_stream_cache_packet_formats(motu);
 	if (err < 0)
 		return err;
 
-	/* Stop stream if rate is different. */
+	// Stop stream if rate is different.
 	err = protocol->get_clock_rate(motu, &curr_rate);
 	if (err < 0) {
 		dev_err(&motu->unit->device,
@@ -238,7 +230,9 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 	}
 	if (rate == 0)
 		rate = curr_rate;
-	if (rate != curr_rate) {
+	if (rate != curr_rate ||
+	    amdtp_streaming_error(&motu->rx_stream) ||
+	    amdtp_streaming_error(&motu->tx_stream)) {
 		amdtp_stream_stop(&motu->rx_stream);
 		amdtp_stream_stop(&motu->tx_stream);
 		stop_both_streams(motu);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
