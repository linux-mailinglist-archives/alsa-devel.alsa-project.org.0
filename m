Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75D41FFC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:55:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E546E1772;
	Wed, 12 Jun 2019 10:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E546E1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329719;
	bh=UzHoGJGJHQoJTKDt71c9BpDUUgRDlx0PmCrNtaGJhLo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlYlST9D83DWssQyAf2udHfgKmSGt6jiZBzpBbabVy1D8aHZ28CNETPn4xK/2ehWw
	 tihb1wmIc5WHsxcSvl+UmhqNTcuN1pOP04zCUh0RQHw9qkBIWZSvFbivAXuZ24w//b
	 57lWFKDrsap8qRgPW5oLqFsIvM1uKNS6kmyExi+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA567F8977C;
	Wed, 12 Jun 2019 10:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EABD0F8974D; Wed, 12 Jun 2019 10:44:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F29DCF89743
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F29DCF89743
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="r7byWZIo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="xKhcS4vi"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 229215BF;
 Wed, 12 Jun 2019 04:44:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=g8+Qqh/9bnxeg
 Su9gduOIS5HQ9i6iULxNGeGJEYQ+rE=; b=r7byWZIoQ1pjn1rexYYNgPsjORobu
 Q1DEy/djzUjjpjJR3SOCljso/4qgtIWZz1dkzlvb/j1PP1yifU1OhgLB0zd3t5mv
 1O42UwbdtQuqlnU6cLSfiFTQQhQebT1TsYM4j0/SAFKOWjIbl9lpKxTiVc+52mWr
 9KNQQChNx0eLsX1GPoB9E1grpegB8NUI56iAGepEGanvS9ZhUxfK6wuJCTMJuvVd
 s6hQMQ7aiEN0W5a28nF3iRYMEh2e8fUWXPPtPN9HGBImfws4dj3+i7pO9iZ9Un1R
 bcpCx7njiYcU8RoiuObctaPPzbij/uVB6sFO4GnEcK5zQe5I2Rv4QOh5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=g8+Qqh/9bnxegSu9gduOIS5HQ9i6iULxNGeGJEYQ+rE=; b=xKhcS4vi
 RgJAAgtk/oU1rChDWFh2LLhYOnxJEJ1mezaXv46CxQG5/Hsw+qCGmD7ONQsxx56Y
 sRoLnHNaoNympb/4yztRPJkstrvPe+o+eTy/+BRa1u+pnF7O0PnH6A64AElns/4S
 RR3mclFWoRf2oQVVX9sfyzi5MCEUjvpowg8aOIKaIDRJHXdbXUvQSYTVNDHr6f7g
 V/PV6rPPukzHJuQN3n7idaBqZHDJr/RlMQL0r3+Rtxda9/kwlT8FEHUgtLN7rbY8
 0k2PCuzuOGy/B2YaFKMaTEIdKa2eVnVC6cPjlTT2hjkqU/+Q0GMcUj/5yw1/NB37
 t5lvbFtYVKO+8w==
X-ME-Sender: <xms:frsAXUSkTSRY1EyK48ffCOAjw8f6MvPTSI68hF0YwTmR5fNFeXCe2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepuddu
X-ME-Proxy: <xmx:frsAXW9hXATISFLMHuHBumYEg9i8GwGTL9tNAi4TiAOX9Ed9T7rkRQ>
 <xmx:frsAXSYNgIqPkCOjM8fbb33UbV_r2rac11jxuo1jPCNoF_9utUIDsw>
 <xmx:frsAXS61z-PlK3sIRds_hRCQE3RfUnFKq_pbrFuDqktlD-T9HKHDEA>
 <xmx:frsAXaFh9y2MbgqhLCkGSikRMaWZkJi0jIyVFsv7mTEYSlHlfuksZg>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FAF0380089;
 Wed, 12 Jun 2019 04:44:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:16 +0900
Message-Id: <20190612084422.5344-14-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 13/19] ALSA: oxfw: start duplex streams if
	supported
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

It's inconvenient to handle two isochronous context separately
each other. This commit unifies the counters to handle the two
at the same time.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 102 ++++++++++++++----------------
 1 file changed, 49 insertions(+), 53 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 1691fdc1a575..bb4ba6c196ea 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -254,96 +254,92 @@ int snd_oxfw_stream_start_simplex(struct snd_oxfw *oxfw,
 				  struct amdtp_stream *stream,
 				  unsigned int rate, unsigned int pcm_channels)
 {
-	struct amdtp_stream *opposite;
 	struct snd_oxfw_stream_formation formation;
 	enum avc_general_plug_dir dir;
-	unsigned int substreams, opposite_substreams;
 	int err = 0;
 
-	if (stream == &oxfw->tx_stream) {
-		substreams = oxfw->capture_substreams;
-		opposite = &oxfw->rx_stream;
-		opposite_substreams = oxfw->playback_substreams;
-		dir = AVC_GENERAL_PLUG_DIR_OUT;
-	} else {
-		substreams = oxfw->playback_substreams;
-		opposite_substreams = oxfw->capture_substreams;
+	if (oxfw->capture_substreams == 0 && oxfw->playback_substreams == 0)
+		return -EIO;
 
-		if (oxfw->has_output)
-			opposite = &oxfw->rx_stream;
-		else
-			opposite = NULL;
-
-		dir = AVC_GENERAL_PLUG_DIR_IN;
+	// Considering JACK/FFADO streaming:
+	// TODO: This can be removed hwdep functionality becomes popular.
+	err = check_connection_used_by_others(oxfw, &oxfw->rx_stream);
+	if (err < 0)
+		return err;
+	if (oxfw->has_output) {
+		err = check_connection_used_by_others(oxfw, &oxfw->tx_stream);
+		if (err < 0)
+			return err;
 	}
 
-	if (substreams == 0)
-		goto end;
-
-	/*
-	 * Considering JACK/FFADO streaming:
-	 * TODO: This can be removed hwdep functionality becomes popular.
-	 */
-	err = check_connection_used_by_others(oxfw, stream);
-	if (err < 0)
-		goto end;
+	if (stream == &oxfw->tx_stream)
+		dir = AVC_GENERAL_PLUG_DIR_OUT;
+	else
+		dir = AVC_GENERAL_PLUG_DIR_IN;
 
 	err = snd_oxfw_stream_get_current_formation(oxfw, dir, &formation);
 	if (err < 0)
-		goto end;
+		return err;
 	if (rate == 0)
 		rate = formation.rate;
 	if (pcm_channels == 0)
 		pcm_channels = formation.pcm;
 
 	if (formation.rate != rate || formation.pcm != pcm_channels ||
-	    amdtp_streaming_error(stream)) {
-		if (opposite != NULL) {
-			err = check_connection_used_by_others(oxfw, opposite);
-			if (err < 0)
-				goto end;
-			stop_stream(oxfw, opposite);
-		}
-		stop_stream(oxfw, stream);
+	    amdtp_streaming_error(&oxfw->rx_stream) ||
+	    amdtp_streaming_error(&oxfw->tx_stream)) {
+		stop_stream(oxfw, &oxfw->rx_stream);
+		if (oxfw->has_output)
+			stop_stream(oxfw, &oxfw->tx_stream);
 
 		err = set_stream_format(oxfw, stream, rate, pcm_channels);
 		if (err < 0) {
 			dev_err(&oxfw->unit->device,
 				"fail to set stream format: %d\n", err);
-			goto end;
+			return err;
+		}
+	}
+
+	if (!amdtp_stream_running(&oxfw->rx_stream)) {
+		err = start_stream(oxfw, &oxfw->rx_stream);
+		if (err < 0) {
+			dev_err(&oxfw->unit->device,
+				"fail to start rx stream: %d\n", err);
+			goto error;
 		}
+	}
 
-		/* Start opposite stream if needed. */
-		if (opposite && !amdtp_stream_running(opposite) &&
-		    (opposite_substreams > 0)) {
-			err = start_stream(oxfw, opposite);
+	if (oxfw->has_output) {
+		if (!amdtp_stream_running(&oxfw->tx_stream)) {
+			err = start_stream(oxfw, &oxfw->tx_stream);
 			if (err < 0) {
 				dev_err(&oxfw->unit->device,
-					"fail to restart stream: %d\n", err);
-				goto end;
+					"fail to start tx stream: %d\n", err);
+				goto error;
 			}
 		}
 	}
 
-	/* Start requested stream. */
-	if (!amdtp_stream_running(stream)) {
-		err = start_stream(oxfw, stream);
-		if (err < 0)
-			dev_err(&oxfw->unit->device,
-				"fail to start stream: %d\n", err);
+	return 0;
+error:
+	stop_stream(oxfw, &oxfw->rx_stream);
+	cmp_connection_break(&oxfw->in_conn);
+	if (oxfw->has_output) {
+		stop_stream(oxfw, &oxfw->tx_stream);
+		cmp_connection_break(&oxfw->out_conn);
 	}
-end:
 	return err;
 }
 
 void snd_oxfw_stream_stop_simplex(struct snd_oxfw *oxfw,
 				  struct amdtp_stream *stream)
 {
-	if (((stream == &oxfw->tx_stream) && (oxfw->capture_substreams > 0)) ||
-	    ((stream == &oxfw->rx_stream) && (oxfw->playback_substreams > 0)))
-		return;
+	if (oxfw->capture_substreams == 0 && oxfw->playback_substreams == 0) {
+		stop_stream(oxfw, &oxfw->rx_stream);
 
-	stop_stream(oxfw, stream);
+		if (oxfw->has_output)
+			stop_stream(oxfw, &oxfw->tx_stream);
+	}
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
