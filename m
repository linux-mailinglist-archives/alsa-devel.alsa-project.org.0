Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6900341F9A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1FC61735;
	Wed, 12 Jun 2019 10:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1FC61735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329338;
	bh=gEolTqHm5x6zCVrm7uB8G1xWYqa69Lj/mbBw3e0C0Dk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIaihwc5+puv+ab1fBP6j+xNsvCBQvwBEsBOEwbYgfYzAgZZTgt99w/fDdLSqv28H
	 2uN+170SOK+marrphru386FQ3wggohrStw2GGCkjX2rpEUoTf9TWoLpWnVrjOZK5rH
	 AfloKGTNK5wvMTnPCT0O8kQhGbFXi57bdle+1v6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2EC8F89731;
	Wed, 12 Jun 2019 10:44:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12470F89732; Wed, 12 Jun 2019 10:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA8EF806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA8EF806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OFUNBiAD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mOrd7ucP"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 82E4E46C;
 Wed, 12 Jun 2019 04:44:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+3clEX46uyahU
 PVl8agzk/dT6ePWzIyvM33o4X55loo=; b=OFUNBiADovT4/Dc8RT/hZ8lyjj+RT
 8CNOnf8zR+adzo7IhncIa7fm8l8qDI1ReC8mSPU5DZ9+eFjVeIIEjBL4A9VfESZZ
 +ZMrYOajZUZVDoXGx/Y4RgyOH1Z0NhPBshm5rifg94ZsLtdlOpgckyg6fyIlDzxK
 yc2nJVwzQ7ls+hOx3EwK6eZqYt8jliNenLZc8JfR3VE6tvhUWkKILfrgyuKj/wM8
 BL4B4j/qnB8hNBDPtAqIg8mxtYV9+uCQF9xH70u3ljOkj0HgSh0aBw4kS9rqvVFA
 V41iHyENJzwwj98aSErAi9tqHcO6YBF7I74ZDdKRj8BN8aQZ6ATGPTmEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+3clEX46uyahUPVl8agzk/dT6ePWzIyvM33o4X55loo=; b=mOrd7ucP
 sNDBdTFpIUjOyvNS2FxjUchzFARDt3c96Op3jQ8FIdrsFnywsPNrh59YAgoleLxC
 aktsBN1Qst8N1xGK8HrGFErH18GB3s8y+GV6oz1TlCh3Ui3uwLFwuyIfVR254OXe
 /XtIJ07Lau0CfixfGL7Ca9UDZI+JJuTXyrvUPiFLSpqChl1ESL3tN2AtvI9qauYY
 P+gxVJq0qGxjhDMdKHhn/Z57IemZX67BEhq1Q9hnExd2XFH84W/sQf0aJ4xZtAEY
 8HcuWWD8VKh9wcSSlT4Q6ZCr1sexmE/IKZu4OWYLa+urOaQl2Dw8Rp9S1OXdAA+G
 +F/uvbqtE3XA/g==
X-ME-Sender: <xms:cLsAXUdXWEiNfrGm9F-dRLZPYSzTVFGExbr1CIoaPJFFYfJug6j19A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:cbsAXZOvImu-gmWqMWXKLcGCbCgMI3pztFTnPHah98foruyZ-7thfg>
 <xmx:cbsAXYE43zaTIkFoa-deRYrPYnxkfKSw_AzYweogKhVjpDPUUcMMQw>
 <xmx:cbsAXUZocExnNdgAZLBVBspgBCsbEttE2g5Le4g5vLBJiPEdmQGpLA>
 <xmx:cbsAXS3SMte8RnSNi7I0n2SOP9yWcRJ5uCT_YmpdTsS7g8JSwBb4KQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B567938008A;
 Wed, 12 Jun 2019 04:44:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:07 +0900
Message-Id: <20190612084422.5344-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 04/19] ALSA: bebob: code refactoring to
	initialize/destroy stream data
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

This commit changes helper functions to initialize/destroy stream
data so that it has an argument for direction.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 121 ++++++++++++++--------------
 1 file changed, 61 insertions(+), 60 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index c3cc31df49e0..6aab3dc99bef 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -376,24 +376,6 @@ map_data_channels(struct snd_bebob *bebob, struct amdtp_stream *s)
 	return err;
 }
 
-static int
-init_both_connections(struct snd_bebob *bebob)
-{
-	int err;
-
-	err = cmp_connection_init(&bebob->in_conn,
-				  bebob->unit, CMP_INPUT, 0);
-	if (err < 0)
-		goto end;
-
-	err = cmp_connection_init(&bebob->out_conn,
-				  bebob->unit, CMP_OUTPUT, 0);
-	if (err < 0)
-		cmp_connection_destroy(&bebob->in_conn);
-end:
-	return err;
-}
-
 static int
 check_connection_used_by_others(struct snd_bebob *bebob, struct amdtp_stream *s)
 {
@@ -448,13 +430,6 @@ break_both_connections(struct snd_bebob *bebob)
 		msleep(200);
 }
 
-static void
-destroy_both_connections(struct snd_bebob *bebob)
-{
-	cmp_connection_destroy(&bebob->in_conn);
-	cmp_connection_destroy(&bebob->out_conn);
-}
-
 static int
 start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 {
@@ -481,49 +456,77 @@ start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 	return err;
 }
 
-int snd_bebob_stream_init_duplex(struct snd_bebob *bebob)
+static int init_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 {
+	enum amdtp_stream_direction dir_stream;
+	struct cmp_connection *conn;
+	enum cmp_direction dir_conn;
 	int err;
 
-	err = init_both_connections(bebob);
+	if (stream == &bebob->tx_stream) {
+		dir_stream = AMDTP_IN_STREAM;
+		conn = &bebob->out_conn;
+		dir_conn = CMP_OUTPUT;
+	} else {
+		dir_stream = AMDTP_OUT_STREAM;
+		conn = &bebob->in_conn;
+		dir_conn = CMP_INPUT;
+	}
+
+	err = cmp_connection_init(conn, bebob->unit, dir_conn, 0);
 	if (err < 0)
-		goto end;
+		return err;
 
-	err = amdtp_am824_init(&bebob->tx_stream, bebob->unit,
-			       AMDTP_IN_STREAM, CIP_BLOCKING);
+	err = amdtp_am824_init(stream, bebob->unit, dir_stream, CIP_BLOCKING);
 	if (err < 0) {
-		amdtp_stream_destroy(&bebob->tx_stream);
-		destroy_both_connections(bebob);
-		goto end;
+		cmp_connection_destroy(conn);
+		return err;
 	}
 
-	/*
-	 * BeBoB v3 transfers packets with these qurks:
-	 *  - In the beginning of streaming, the value of dbc is incremented
-	 *    even if no data blocks are transferred.
-	 *  - The value of dbc is reset suddenly.
-	 */
-	if (bebob->version > 2)
-		bebob->tx_stream.flags |= CIP_EMPTY_HAS_WRONG_DBC |
-					  CIP_SKIP_DBC_ZERO_CHECK;
+	if (stream == &bebob->tx_stream) {
+		// BeBoB v3 transfers packets with these qurks:
+		//  - In the beginning of streaming, the value of dbc is
+		//    incremented even if no data blocks are transferred.
+		//  - The value of dbc is reset suddenly.
+		if (bebob->version > 2)
+			bebob->tx_stream.flags |= CIP_EMPTY_HAS_WRONG_DBC |
+						  CIP_SKIP_DBC_ZERO_CHECK;
+
+		// At high sampling rate, M-Audio special firmware transmits
+		// empty packet with the value of dbc incremented by 8 but the
+		// others are valid to IEC 61883-1.
+		if (bebob->maudio_special_quirk)
+			bebob->tx_stream.flags |= CIP_EMPTY_HAS_WRONG_DBC;
+	}
 
-	/*
-	 * At high sampling rate, M-Audio special firmware transmits empty
-	 * packet with the value of dbc incremented by 8 but the others are
-	 * valid to IEC 61883-1.
-	 */
-	if (bebob->maudio_special_quirk)
-		bebob->tx_stream.flags |= CIP_EMPTY_HAS_WRONG_DBC;
+	return 0;
+}
+
+static void destroy_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
+{
+	amdtp_stream_destroy(stream);
+
+	if (stream == &bebob->tx_stream)
+		cmp_connection_destroy(&bebob->out_conn);
+	else
+		cmp_connection_destroy(&bebob->in_conn);
+}
 
-	err = amdtp_am824_init(&bebob->rx_stream, bebob->unit,
-			       AMDTP_OUT_STREAM, CIP_BLOCKING);
+int snd_bebob_stream_init_duplex(struct snd_bebob *bebob)
+{
+	int err;
+
+	err = init_stream(bebob, &bebob->tx_stream);
+	if (err < 0)
+		return err;
+
+	err = init_stream(bebob, &bebob->rx_stream);
 	if (err < 0) {
-		amdtp_stream_destroy(&bebob->tx_stream);
-		amdtp_stream_destroy(&bebob->rx_stream);
-		destroy_both_connections(bebob);
+		destroy_stream(bebob, &bebob->tx_stream);
+		return err;
 	}
-end:
-	return err;
+
+	return 0;
 }
 
 static int keep_resources(struct snd_bebob *bebob, struct amdtp_stream *stream,
@@ -693,10 +696,8 @@ void snd_bebob_stream_stop_duplex(struct snd_bebob *bebob)
  */
 void snd_bebob_stream_destroy_duplex(struct snd_bebob *bebob)
 {
-	amdtp_stream_destroy(&bebob->rx_stream);
-	amdtp_stream_destroy(&bebob->tx_stream);
-
-	destroy_both_connections(bebob);
+	destroy_stream(bebob, &bebob->tx_stream);
+	destroy_stream(bebob, &bebob->rx_stream);
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
