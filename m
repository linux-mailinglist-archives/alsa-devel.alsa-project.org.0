Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE641FBC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D841744;
	Wed, 12 Jun 2019 10:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D841744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329548;
	bh=Dimhi0Dx7tU3+aZPoIUiVvEx/vzwiGP0qOZqUQKPdvg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJA7LZf41TUB+c+xXGtnleGuiB1/uycW/GsijL5fD9O5ogqTtyz2xQTzhErPg1ZaX
	 R0LXH07qaeYfqMbiOIf2KI6OA142wR5dzYvQgU+084YhHv2gxmgFkfD5C0UrL8eTGH
	 zzUzMZDbFKCSpJXoRS/GDTvwV82Kj1gYUMrv56WI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 959D3F89763;
	Wed, 12 Jun 2019 10:45:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AA5DF8973E; Wed, 12 Jun 2019 10:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9815EF89731
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9815EF89731
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Iaau/Th+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lIdXnUW/"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0D21B5B1;
 Wed, 12 Jun 2019 04:44:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pCQU+kDFwttBr
 v3B04Mbo1hyII5etQNZYUUiI0OlZ/E=; b=Iaau/Th+2OgGOmQ03RnjhYZKv6xxp
 v4PgriXdtdJKIMizb4yARS6ijTRUyoxJv1jXnsSqYogL3vJfSXOAQB2+J+fjhWss
 VNh98/5TfHP5WXFqIb0gaGmGoYrOq3pkxXBZzSrYhCvgnkDm5nsq2SJjV/UNKgLZ
 /hYO4h9PSDlwyqx6I4XtfnzWFFeoqE8BX+5DW3bBKW8CCupy3/j2S5VwPFKJshHy
 LwcvG8lVhjGnOEWO9YLajYlnLwJXjHmMYefVQLCzI0gGWdvCNB+t19Intl7GpxJa
 27EppmzgBp27557lvD4CZiVWHkpajAxS5Ogz/gMYa78/pu4kxq1j86hoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pCQU+kDFwttBrv3B04Mbo1hyII5etQNZYUUiI0OlZ/E=; b=lIdXnUW/
 im2rTMN5R8t21GKcbrih/x2PuN6ko0OdB96OxQ9RzzgKqiQfBUj2tP50JhAvJ4cX
 djSkPnuw6ZVh7/Cs7UVGob36LKC4ENzS6NCWcHXIX+T1j1mdWVJL8E1EP/inqcui
 HKZdOZQRfRbW3JZuB9hi2MjafzWa2LBqXA4onhbfvG1sZ7sEA+c/1W1v3O2TqOPE
 P/CNClO/1UA5wDhvyhIayyv97QsE6DI16p/ocb9JdtISO+8xZgsNsmBKIQd9PDwc
 tSKrliRTAU07ZXGZikvvTGb1BHkIMYnsfrp7Fpl9XwEgbVZDJjsgZ021YzQt2Aqj
 pd0ZjdIin7Z0Vg==
X-ME-Sender: <xms:eLsAXTKVwxoeFfVWn51zMiGC4GJa2d58q4G0jTLZ7fE3SSI-VIBtTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepje
X-ME-Proxy: <xmx:eLsAXbwTmHja_no35GMEBpGVl_gvg71YnEX9Ft13M-a5kKPIv2CLWA>
 <xmx:eLsAXT3mW-9EnFHk4sy1YAqRO_mQwQhjy7Jqyx_UsmhqEcod-1pEGg>
 <xmx:eLsAXWjkFPVbHWpUCOmsvkDNDkkLnn0xvwPeG8YfHejSAVg_LdaZfA>
 <xmx:eLsAXVc7EttJg75gqUKarok8GPxGAcUKq1nbsAiaAl0NnZgqa_wWnQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5562E38008B;
 Wed, 12 Jun 2019 04:44:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:12 +0900
Message-Id: <20190612084422.5344-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/19] ALSA: fireworks: configure stream
	parameters in pcm.hw_params callback
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

This commit splits out an operation to configure stream parameters into
pcm.hw_params callback. In pcm.prepare callback, establishing
connections and start isochronous contexts.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_stream.c | 82 ++++++++++++---------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index e1ebead583e9..1abc15760513 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -52,54 +52,38 @@ stop_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 		cmp_connection_break(&efw->in_conn);
 }
 
-static int
-start_stream(struct snd_efw *efw, struct amdtp_stream *stream,
-	     unsigned int sampling_rate)
+static int start_stream(struct snd_efw *efw, struct amdtp_stream *stream,
+			unsigned int rate)
 {
 	struct cmp_connection *conn;
-	unsigned int mode, pcm_channels, midi_ports;
 	int err;
 
-	err = snd_efw_get_multiplier_mode(sampling_rate, &mode);
-	if (err < 0)
-		goto end;
-	if (stream == &efw->tx_stream) {
+	if (stream == &efw->tx_stream)
 		conn = &efw->out_conn;
-		pcm_channels = efw->pcm_capture_channels[mode];
-		midi_ports = efw->midi_out_ports;
-	} else {
+	else
 		conn = &efw->in_conn;
-		pcm_channels = efw->pcm_playback_channels[mode];
-		midi_ports = efw->midi_in_ports;
-	}
 
-	err = amdtp_am824_set_parameters(stream, sampling_rate,
-					 pcm_channels, midi_ports, false);
-	if (err < 0)
-		goto end;
-
-	/*  establish connection via CMP */
+	// Establish connection via CMP.
 	err = cmp_connection_establish(conn,
-				amdtp_stream_get_max_payload(stream));
+				       amdtp_stream_get_max_payload(stream));
 	if (err < 0)
-		goto end;
+		return err;
 
-	/* start amdtp stream */
-	err = amdtp_stream_start(stream,
-				 conn->resources.channel,
-				 conn->speed);
+	// Start amdtp stream.
+	err = amdtp_stream_start(stream, conn->resources.channel, conn->speed);
 	if (err < 0) {
-		stop_stream(efw, stream);
-		goto end;
+		cmp_connection_break(conn);
+		return err;
 	}
 
-	/* wait first callback */
+	// Wait first callback.
 	if (!amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT)) {
-		stop_stream(efw, stream);
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
 
 /*
@@ -189,6 +173,24 @@ int snd_efw_stream_init_duplex(struct snd_efw *efw)
 	return err;
 }
 
+static int keep_resources(struct snd_efw *efw, struct amdtp_stream *stream,
+			  unsigned int rate, unsigned int mode)
+{
+	unsigned int pcm_channels;
+	unsigned int midi_ports;
+
+	if (stream == &efw->tx_stream) {
+		pcm_channels = efw->pcm_capture_channels[mode];
+		midi_ports = efw->midi_out_ports;
+	} else {
+		pcm_channels = efw->pcm_playback_channels[mode];
+		midi_ports = efw->midi_in_ports;
+	}
+
+	return amdtp_am824_set_parameters(stream, rate, pcm_channels,
+					  midi_ports, false);
+}
+
 int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
 {
 	unsigned int curr_rate;
@@ -212,9 +214,23 @@ int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
 	}
 
 	if (efw->substreams_counter == 0 || rate != curr_rate) {
+		unsigned int mode;
+
 		err = snd_efw_command_set_sampling_rate(efw, rate);
 		if (err < 0)
 			return err;
+
+		err = snd_efw_get_multiplier_mode(rate, &mode);
+		if (err < 0)
+			return err;
+
+		err = keep_resources(efw, &efw->tx_stream, rate, mode);
+		if (err < 0)
+			return err;
+
+		err = keep_resources(efw, &efw->rx_stream, rate, mode);
+		if (err < 0)
+			return err;
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
