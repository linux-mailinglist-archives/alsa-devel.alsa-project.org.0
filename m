Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB07F41FCF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623CB1772;
	Wed, 12 Jun 2019 10:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623CB1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329626;
	bh=3FMCvuAfA1C+gWJ9XvciRWUZvJG94OB2JRqQ/kbd9sE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KaXkYJZttRqAeUUo2l1WSPvwnuDMSX38YkitU5iqxjf67maH6z3tJu7pk/Ok5h+5P
	 I/DQxyykoAxxkYhyrFXlmL8Cw1AiXZPKumVg16/Qut/NqYAJQ4EadkJSY+eXsTeCop
	 msqHaVhFuvNldkxyShHemtdA+2yBY8mOWeWZnOwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B9AF8976C;
	Wed, 12 Jun 2019 10:45:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84835F89744; Wed, 12 Jun 2019 10:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7518F89731
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7518F89731
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="baqRpTgv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JVDf+S2H"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 191225BE;
 Wed, 12 Jun 2019 04:44:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=z429J1gr81FSj
 QsYImPQL48QLQpChb+pYFVuy0T8TtI=; b=baqRpTgvsi4/sLVcf758HNgxluVYh
 SKgpAvPZtXGxsdrMv8aLY7RejTDutX8QyC9dE9/6Nn7Y/pNH7+7GoLLmH4qY+xbe
 ScLM1l8LI1tggGihak0sssxzcr7glcJDNGdeNLbAsLN1PR8CJrit+GL5b4OH1o/I
 ZGQyTF2ZmgbmBBErPnep8DLRhMjri2mFDf9EnNgNMoLmOmeEyHRI4ZKGI5NKR0xz
 279GxOOIoOUAR+W4L4HnrZToJaHrzy0kA8fBCrgzR93/ZjZszMm/9yydOlg9Qe4T
 x3bJfh6HGnatGvI2jBB1j2bwWf1swn1d5AMpXoLGEOWDcWhcEZLHcekRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=z429J1gr81FSjQsYImPQL48QLQpChb+pYFVuy0T8TtI=; b=JVDf+S2H
 tP04nqkJDwQDr7vi5Ch9i1syEHJOHMnQb2r6KVSrRmiteIY3v1oEByfv4i5QGvlZ
 dZYD1rwd9rd4bkvJaPmUfqhlrAP1c2EGZVfnokRfB1dA19rxS9r3PYeY7d/T0J+2
 4wpgZt7CMFMCwMJhVUX8CEuksLXfSiqWx73vTMqhZbzAOyhRrYe9j0mQ2YKkDH6k
 Ygshl5iLC6+/sbsW1VB8WswoUgQapHXk8qvH0pP7iT9eHYcUEB0Ml/+tpttMe8RN
 zHjzBSeU3FElWdgbjXRQoX8IdsWtvaAV6hrwQie+qlleHfLU2h4WGvEuGv0IK6Zl
 akuJKlyrLjX2ng==
X-ME-Sender: <xms:e7sAXX1m1BU8iFx9h2f5tNuSTzN0Zasxrb05i_fHdBJUeFb6fC8_MA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepje
X-ME-Proxy: <xmx:e7sAXbnnHqkQiAMJEUwSVCGi5E876Mr9UtnQoXBWYMCIvrEDtr5dkA>
 <xmx:e7sAXalJZ-03pWOJo-boi2bKoKgeKuQ7XrrCINtQjLUUUAVk-NzPwg>
 <xmx:e7sAXaOyIleJwbsX2RgtkIS_4Yvw8V-R0rO9uZlDdliFKlG4SMLlcQ>
 <xmx:e7sAXdhdAbL02nxhfSYvIFt8d2uLziaDovUN6B0k2hOYn9NYHFb5Hw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5BE57380089;
 Wed, 12 Jun 2019 04:44:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:14 +0900
Message-Id: <20190612084422.5344-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 11/19] ALSA: oxfw: code refactoring for stop
	condition of packet streaming
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

This commit unifies stop condition due to queueing error and unmatched
state of the target device.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index f230a9e44c3c..34ff673e6ff8 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -288,10 +288,6 @@ int snd_oxfw_stream_start_simplex(struct snd_oxfw *oxfw,
 	if (err < 0)
 		goto end;
 
-	/* packet queueing error */
-	if (amdtp_streaming_error(stream))
-		stop_stream(oxfw, stream);
-
 	err = snd_oxfw_stream_get_current_formation(oxfw, dir, &formation);
 	if (err < 0)
 		goto end;
@@ -300,7 +296,8 @@ int snd_oxfw_stream_start_simplex(struct snd_oxfw *oxfw,
 	if (pcm_channels == 0)
 		pcm_channels = formation.pcm;
 
-	if ((formation.rate != rate) || (formation.pcm != pcm_channels)) {
+	if (formation.rate != rate || formation.pcm != pcm_channels ||
+	    amdtp_streaming_error(stream)) {
 		if (opposite != NULL) {
 			err = check_connection_used_by_others(oxfw, opposite);
 			if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
