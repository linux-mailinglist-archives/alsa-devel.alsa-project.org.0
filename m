Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C835341FDF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:54:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2A01766;
	Wed, 12 Jun 2019 10:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2A01766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329668;
	bh=ZXshM73MR0whN04joHbPM2qU+axYL3yha/XD2SBI6mU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZjKHOxaF0X1CknIeopBQnUMpzYVTgVdinxre0gjRn1g946UYpzOICsQqqNcud2mXI
	 8oc0I0fwe837axisp9eSnpttichCuZ3R3GhuTkx3VjmMUqp8cCgaRey5RchViervpd
	 3uqhtYNEk1ppS3myVC9Vvbv9XdEiW1qpOinqPFWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE6AF89771;
	Wed, 12 Jun 2019 10:45:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3593F89747; Wed, 12 Jun 2019 10:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36BD5F8973E
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36BD5F8973E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="grn4B++T"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ylPOInIA"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A06A5582;
 Wed, 12 Jun 2019 04:44:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9o2ZugNByvYIm
 X2Ez1CkNdQM+5ynNc33CaJ+UqqYRwU=; b=grn4B++TEfggXsFx+P1NeN0G+I1r7
 RH8YEN6pDSU3Vn+fazM36ipp4havdEORPwAerrCqSbmtQhkEL2MxKRiC22N2fq8v
 AY78B/BHSu9p3IiUbdaDtkQt6nPxEBmewrH05LX9kqXl4jJJHy3wyI+p4Da/LLQc
 ZPhvI0xg4Jfg0DviwRSOjmq4OD7co8pLnfCu7zgRmDHjg2GokMRFofsij4t8U94R
 wIyH197KdsmJrbt/LzIembVWDwTZhS74Eg4/7Kg52N9Cem7tp5pGbp0yn5wSPbWZ
 ONbr/a7U783M/e7z7CjWK8zY4SvOecU2WdmcazHsZrgOrI9plTmhy6v8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=9o2ZugNByvYImX2Ez1CkNdQM+5ynNc33CaJ+UqqYRwU=; b=ylPOInIA
 YPGhBSVUWF8iPAmg2kKW4xvy8XRhyM6+NnA3HRTAZi1f5GgTH7yT4lhGmKX0dDFI
 a+DSsFqShMMlWYHhVlJA9BcuqvFQZwMb/Az/zeipj4x6nNy12axbh17enPAxdFBy
 GZc7b9tz+Qg77TwxI1pUNs2sNRYC300ByPePcgzuHdVDtFu2dy0OSbFvlFGSzro9
 xeOFa0RhgDKk0reQJGP5KS2n5tDfDZbGUVzq7J7rllvYUiS99O5c+I6t+wP/WccH
 XWU0ISYemu9Z/gljAJ1clw8/SJc+eNrcgqICrpzCic4jwj4OuhzRE2fhWsP0KRzC
 bsc8swuuYfMx+g==
X-ME-Sender: <xms:fbsAXY7Kwqu5tFYXyOIrWbpGwcV76j54AKudMx97PwO_hi1W0FWQrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepje
X-ME-Proxy: <xmx:fbsAXZlAjKSDjNg7v5YlcFPwxz_r5g5aKyB6kpujlW-FwdFPUXMTwQ>
 <xmx:fbsAXdapajtDDCwajeHV5gui5H3VKV_1hksu0sFsIRqOYpAEvU5DVQ>
 <xmx:fbsAXXZQ8H2wGl8WNH-hmBBFuynHmkfbPNuQnsjbt36swowB-I88WA>
 <xmx:fbsAXXATtxw-cPc4WlgwW-vmgQCkuBssjsx_FAXTyt4rrfc0ZslNYw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D89AB380087;
 Wed, 12 Jun 2019 04:44:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:15 +0900
Message-Id: <20190612084422.5344-13-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/19] ALSA: oxfw: set packet parameter
	according to current configuration
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

After a call of pcm.hw_params, the state of target device is expected
for applications. This commit retrieves the state and start packet
streaming.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 34ff673e6ff8..1691fdc1a575 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -112,51 +112,51 @@ static void stop_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 		cmp_connection_break(&oxfw->in_conn);
 }
 
-static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream,
-			unsigned int rate, unsigned int pcm_channels)
+static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 {
 	u8 **formats;
+	enum avc_general_plug_dir dir;
 	struct cmp_connection *conn;
 	struct snd_oxfw_stream_formation formation;
-	unsigned int i, midi_ports;
+	int i;
 	int err;
 
 	if (stream == &oxfw->rx_stream) {
+		dir = AVC_GENERAL_PLUG_DIR_IN;
 		formats = oxfw->rx_stream_formats;
 		conn = &oxfw->in_conn;
 	} else {
+		dir = AVC_GENERAL_PLUG_DIR_OUT;
 		formats = oxfw->tx_stream_formats;
 		conn = &oxfw->out_conn;
 	}
 
-	/* Get stream format */
+	err = snd_oxfw_stream_get_current_formation(oxfw, dir, &formation);
+	if (err < 0)
+		return err;
+
 	for (i = 0; i < SND_OXFW_STREAM_FORMAT_ENTRIES; i++) {
+		struct snd_oxfw_stream_formation fmt;
+
 		if (formats[i] == NULL)
 			break;
 
-		err = snd_oxfw_stream_parse_format(formats[i], &formation);
+		err = snd_oxfw_stream_parse_format(formats[i], &fmt);
 		if (err < 0)
-			goto end;
-		if (rate != formation.rate)
-			continue;
-		if (pcm_channels == 0 ||  pcm_channels == formation.pcm)
+			return err;
+		if (fmt.rate == formation.rate && fmt.pcm == formation.pcm &&
+		    fmt.midi == formation.midi)
 			break;
 	}
-	if (i == SND_OXFW_STREAM_FORMAT_ENTRIES) {
-		err = -EINVAL;
-		goto end;
-	}
+	if (i == SND_OXFW_STREAM_FORMAT_ENTRIES)
+		return -EINVAL;
 
-	pcm_channels = formation.pcm;
-	midi_ports = formation.midi * 8;
+	// The stream should have one pcm channels at least.
+	if (formation.pcm == 0)
+		return -EINVAL;
 
-	/* The stream should have one pcm channels at least */
-	if (pcm_channels == 0) {
-		err = -EINVAL;
-		goto end;
-	}
-	err = amdtp_am824_set_parameters(stream, rate, pcm_channels, midi_ports,
-					 false);
+	err = amdtp_am824_set_parameters(stream, formation.rate, formation.pcm,
+					 formation.midi * 8, false);
 	if (err < 0)
 		goto end;
 
@@ -316,7 +316,7 @@ int snd_oxfw_stream_start_simplex(struct snd_oxfw *oxfw,
 		/* Start opposite stream if needed. */
 		if (opposite && !amdtp_stream_running(opposite) &&
 		    (opposite_substreams > 0)) {
-			err = start_stream(oxfw, opposite, rate, 0);
+			err = start_stream(oxfw, opposite);
 			if (err < 0) {
 				dev_err(&oxfw->unit->device,
 					"fail to restart stream: %d\n", err);
@@ -327,7 +327,7 @@ int snd_oxfw_stream_start_simplex(struct snd_oxfw *oxfw,
 
 	/* Start requested stream. */
 	if (!amdtp_stream_running(stream)) {
-		err = start_stream(oxfw, stream, rate, pcm_channels);
+		err = start_stream(oxfw, stream);
 		if (err < 0)
 			dev_err(&oxfw->unit->device,
 				"fail to start stream: %d\n", err);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
