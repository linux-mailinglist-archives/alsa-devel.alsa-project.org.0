Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B542012
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BD7172B;
	Wed, 12 Jun 2019 10:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BD7172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329793;
	bh=3YgI+qrdBTq3XYPSFsU+VGfiX/CofvFE6wVE3bYrI84=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b5RDzWpV+T+DTpF7xSrpH0OVs7VIZQSx4LIVdW7wUuwBH3a+LuvYoECLYNHs3kiGK
	 vLa1LTKbOO7SISPqO0Zh3xXq2JN8gOFDoeLZp7SeIEBqjQHKjDb4hKwEHpFk02+rTx
	 gyLWDDCzwMuRaylTuPCF/E51zt90WZUFi3/iVd4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF10F89783;
	Wed, 12 Jun 2019 10:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07F96F89755; Wed, 12 Jun 2019 10:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2A8FF8974B
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2A8FF8974B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="JdjXrchn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0liaYlv5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 30E755BE;
 Wed, 12 Jun 2019 04:44:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=A0qwqHoFsaSB+
 D41n7uiPfx2eXXUyor27ucHlopk74w=; b=JdjXrchn9D09bob3dPhbKd7c72Ias
 fdh4w/tA3jQVK0r+MsrqH/1HFx6L897flyW0Az05X1df6j5Q2Qa2d1d4RRf1mzG1
 FrHMpc1EUYYNAsYGGVc7ZIKPIBzByO3Yel6GWbHNR+qg7ReVhNVTDxLlkodL+CVf
 QDb0L+N6KxOh4gxqcndPcPLJVo2Sl8R/GCNAs3vVBq/GYrlVZwfiO6mjMisLt9Lo
 +oIHFdYhzRJIpdReh0FiESBHJ5QgeHQGDwzAzOlfq1v0uYV5zgTXFWSGFF4FV2H4
 KjtE4w7Yc++4vhJs5oRHduHqbJx2wF0pXkJW6y5+Oh5auUwHiFNB1m7pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=A0qwqHoFsaSB+D41n7uiPfx2eXXUyor27ucHlopk74w=; b=0liaYlv5
 wVRaTkds+8cLjxLAkAwl67I/PtqV+e1OjAQZqYW1oUX97W3TkWuRKCXvAFDzk3xC
 kgA1Y6Bfp+1R7Wlk/1MSPvcbEola9DPjRyUquu54//csLBjoWIx9EaNM6BFbBDPw
 4x2cjKNDPIjKzBp6E6W1BRRh690cCClJTnceM+572ycJV9Q+jIiTWugb+pkQb7rZ
 ytRFi+gbteVbT/BElgz4b7qWYGhBgsThyGM0o9gyKp02B+4LF9R59FZy6KYPF2Q0
 VEW6PgRQkuywCkJUmoxVoTInQzfDZmpieqJtibCarR1PwD4zP/cIWDrF3CmmMBN/
 3vD9w3ARD3pzsg==
X-ME-Sender: <xms:gbsAXffgZp7x9qqoouAnDqLMr7FRHIs8oCufmXe6K8AK2MSUeqBp6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepuddu
X-ME-Proxy: <xmx:gbsAXWoFjyepxb14KhMdS_vNAxs3l_jxKTP05kQ8E0X0iMAoIAjrPQ>
 <xmx:gbsAXT7CMGXFh6cJyYNLEjibIg6_hEEFd3HowaQHRtVEAxa_hjvGQw>
 <xmx:gbsAXeBczdMSDZA2p--5-Czs72FncUdhFK22XDUHeamOiZMq3DeQWQ>
 <xmx:gbsAXZTN0lo-Xn4Etacvp6g9OQvOLygj1ZHAUyQvnmXG1k7Y1UYRJA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 654A8380087;
 Wed, 12 Jun 2019 04:44:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:18 +0900
Message-Id: <20190612084422.5344-16-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 15/19] ALSA: oxfw: expand stop procedure for
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

The helper function stop packet streaming is not enough useful. This
commit obsoletes it and expands its code.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 68 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 806a7fded99d..561ceb09d927 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -101,17 +101,6 @@ static int set_stream_format(struct snd_oxfw *oxfw, struct amdtp_stream *s,
 	return 0;
 }
 
-static void stop_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
-{
-	amdtp_stream_pcm_abort(stream);
-	amdtp_stream_stop(stream);
-
-	if (stream == &oxfw->tx_stream)
-		cmp_connection_break(&oxfw->out_conn);
-	else
-		cmp_connection_break(&oxfw->in_conn);
-}
-
 static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 {
 	u8 **formats;
@@ -158,28 +147,27 @@ static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	err = amdtp_am824_set_parameters(stream, formation.rate, formation.pcm,
 					 formation.midi * 8, false);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = cmp_connection_establish(conn,
 				       amdtp_stream_get_max_payload(stream));
 	if (err < 0)
-		goto end;
+		return err;
 
-	err = amdtp_stream_start(stream,
-				 conn->resources.channel,
-				 conn->speed);
+	err = amdtp_stream_start(stream, conn->resources.channel, conn->speed);
 	if (err < 0) {
 		cmp_connection_break(conn);
-		goto end;
+		return err;
 	}
 
-	/* Wait first packet */
+	// Wait first packet.
 	if (!amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT)) {
-		stop_stream(oxfw, stream);
-		err = -ETIMEDOUT;
+		amdtp_stream_stop(stream);
+		cmp_connection_break(conn);
+		return -ETIMEDOUT;
 	}
-end:
-	return err;
+
+	return 0;
 }
 
 static int check_connection_used_by_others(struct snd_oxfw *oxfw,
@@ -288,9 +276,13 @@ int snd_oxfw_stream_start_simplex(struct snd_oxfw *oxfw,
 	if (formation.rate != rate || formation.pcm != pcm_channels ||
 	    amdtp_streaming_error(&oxfw->rx_stream) ||
 	    amdtp_streaming_error(&oxfw->tx_stream)) {
-		stop_stream(oxfw, &oxfw->rx_stream);
-		if (oxfw->has_output)
-			stop_stream(oxfw, &oxfw->tx_stream);
+		amdtp_stream_stop(&oxfw->rx_stream);
+		cmp_connection_break(&oxfw->in_conn);
+
+		if (oxfw->has_output) {
+			amdtp_stream_stop(&oxfw->tx_stream);
+			cmp_connection_break(&oxfw->out_conn);
+		}
 
 		err = set_stream_format(oxfw, stream, rate, pcm_channels);
 		if (err < 0) {
@@ -322,10 +314,10 @@ int snd_oxfw_stream_start_simplex(struct snd_oxfw *oxfw,
 
 	return 0;
 error:
-	stop_stream(oxfw, &oxfw->rx_stream);
+	amdtp_stream_stop(&oxfw->rx_stream);
 	cmp_connection_break(&oxfw->in_conn);
 	if (oxfw->has_output) {
-		stop_stream(oxfw, &oxfw->tx_stream);
+		amdtp_stream_stop(&oxfw->tx_stream);
 		cmp_connection_break(&oxfw->out_conn);
 	}
 	return err;
@@ -335,10 +327,13 @@ void snd_oxfw_stream_stop_simplex(struct snd_oxfw *oxfw,
 				  struct amdtp_stream *stream)
 {
 	if (oxfw->capture_substreams == 0 && oxfw->playback_substreams == 0) {
-		stop_stream(oxfw, &oxfw->rx_stream);
+		amdtp_stream_stop(&oxfw->rx_stream);
+		cmp_connection_break(&oxfw->in_conn);
 
-		if (oxfw->has_output)
-			stop_stream(oxfw, &oxfw->tx_stream);
+		if (oxfw->has_output) {
+			amdtp_stream_stop(&oxfw->tx_stream);
+			cmp_connection_break(&oxfw->out_conn);
+		}
 	}
 }
 
@@ -363,10 +358,17 @@ void snd_oxfw_stream_destroy_simplex(struct snd_oxfw *oxfw,
 void snd_oxfw_stream_update_simplex(struct snd_oxfw *oxfw,
 				    struct amdtp_stream *stream)
 {
-	stop_stream(oxfw, &oxfw->rx_stream);
+	amdtp_stream_stop(&oxfw->rx_stream);
+	cmp_connection_break(&oxfw->in_conn);
 
-	if (oxfw->has_output)
-		stop_stream(oxfw, &oxfw->tx_stream);
+	amdtp_stream_pcm_abort(&oxfw->rx_stream);
+
+	if (oxfw->has_output) {
+		amdtp_stream_stop(&oxfw->tx_stream);
+		cmp_connection_break(&oxfw->out_conn);
+
+		amdtp_stream_pcm_abort(&oxfw->tx_stream);
+	}
 }
 
 int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
