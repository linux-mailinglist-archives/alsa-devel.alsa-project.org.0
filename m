Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A4809AB
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CAEC16CC;
	Sun,  4 Aug 2019 08:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CAEC16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900132;
	bh=D3Kc4OSS+eybv8P34MULW19pe4w0w5T1A6h5jfxovd8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V4byT9LWka7kF2LIR/17nlx+ip0CSnAvs+vrCPnyyqzLwHz5Lj/4VRbz8k4RRNTt1
	 oxek9V8SARxJwpbcYhJOrdoVBpN54zc0yzMsw4tkq2/UsiClf03jYH9x+zYlRZV4q+
	 b+NrurlwUL0dV3Nj4CMYMg15NF6EVemuCAnSK3io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40893F80641;
	Sun,  4 Aug 2019 08:22:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8B92F805A1; Sun,  4 Aug 2019 08:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B05FFF800F3
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B05FFF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="a4vspDgc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="q3Heb4xk"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DF47C21550;
 Sun,  4 Aug 2019 02:21:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lW+Ju534u3OBQ
 G20JCGO8SyE1wwh21n/SUyKK6HHG48=; b=a4vspDgcySPXTd+vvDy87qOSSZmzt
 o8VGu3S+ySFOmgGkyJPEb7nnaVIvWyfjIigB7yXfjVkGnxndqBgR6oizJVBMid+U
 CUX+gXzzpc7aJACIypeUleqcVyQbxicnW8/0YO2cUfKR0gFMnz3VKQbjTf+J0sSF
 P31stTAtuVWXrS92SRjKDalBPzmzLmQSlGhGxSSdMPNROB9ilI2vsfXcbtnn7A6/
 C+QW0JNq9vyy75xwoJOGBg03lzpohT6F/EEQqhx0t3IBrQjkKDGqgFNnw77+0CY6
 kiiVC0Sd1+pB1KOdkp3gnwAAprVU5tc2OYMTON0tUEosRdjt8oQlCJp9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lW+Ju534u3OBQG20JCGO8SyE1wwh21n/SUyKK6HHG48=; b=q3Heb4xk
 W3FOkhtZZOY9jSGlpxO8eCUyYhTTUyREiRUh+XCydOfsWk1+Jf5IAFKpBj395MzF
 4aHlp9ApqtbX8gXtaJzUGCNeh3Vyoqpv5TdB4iXDuktIx4DCceDFCOD6TfMf2Te7
 KN02r+1FfKl8Wc7oJJV5GK5qNuYOjSvwtJvjmOLgMJIHsmpNY5zF8ueZNgq4uKEE
 p9qujIxXRVGBx3i2XNkRqL1SIQRG5KaeSDMhzndUbUM3mduGH3SoYP2/69EkUE9D
 sBHRhAZvMOU+17/t8V2b5qX/XPyrkFOrZXC+bUT6iF+F31m++Ci/VUXZBKTXek85
 DkGaXd4AXkzflg==
X-ME-Sender: <xms:gnlGXRN60pGtZwfN8HHXDvvZg9qkXUSao506XbP-1tiWk_WZ0ta1iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:gnlGXY2bQefqJRR-o_MXiGuFXV8A1makpwstsFQB9f4zg0SOjaHI2Q>
 <xmx:gnlGXWJ_VZT338D9kxN84fMEVHzQYpCBBDpgGRsYphXC9lkIdniYBA>
 <xmx:gnlGXQIPziYOGSJgwm32kD-FybZZjteMT6Rf64O6Tqwl-zBbkmVyOQ>
 <xmx:gnlGXXAb7JygYE269F1EiddoTAxEfeiT6ojr790MiAzvdlFg9cK0ew>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 77035380083;
 Sun,  4 Aug 2019 02:21:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:27 +0900
Message-Id: <20190804062138.1217-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/19] ALSA: firewire-tascam: code refactoring
	for initialization/destruction of AMDTP stream
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

This commit is a preparation to support AMDTP domain.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 71 +++++++++++++++++----------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index e852e46ebe6f..d5e77036e0ee 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -287,38 +287,60 @@ static int keep_resources(struct snd_tscm *tscm, unsigned int rate,
 				fw_parent_device(tscm->unit)->max_speed);
 }
 
-int snd_tscm_stream_init_duplex(struct snd_tscm *tscm)
+static int init_stream(struct snd_tscm *tscm, struct amdtp_stream *s)
 {
+	struct fw_iso_resources *resources;
+	enum amdtp_stream_direction dir;
 	unsigned int pcm_channels;
 	int err;
 
-	/* For out-stream. */
-	err = fw_iso_resources_init(&tscm->rx_resources, tscm->unit);
-	if (err < 0)
-		return err;
-	pcm_channels = tscm->spec->pcm_playback_analog_channels;
+	if (s == &tscm->tx_stream) {
+		resources = &tscm->tx_resources;
+		dir = AMDTP_IN_STREAM;
+		pcm_channels = tscm->spec->pcm_capture_analog_channels;
+	} else {
+		resources = &tscm->rx_resources;
+		dir = AMDTP_OUT_STREAM;
+		pcm_channels = tscm->spec->pcm_playback_analog_channels;
+	}
+
 	if (tscm->spec->has_adat)
 		pcm_channels += 8;
 	if (tscm->spec->has_spdif)
 		pcm_channels += 2;
-	err = amdtp_tscm_init(&tscm->rx_stream, tscm->unit, AMDTP_OUT_STREAM,
-			      pcm_channels);
+
+	err = fw_iso_resources_init(resources, tscm->unit);
 	if (err < 0)
 		return err;
 
-	/* For in-stream. */
-	err = fw_iso_resources_init(&tscm->tx_resources, tscm->unit);
+	err = amdtp_tscm_init(s, tscm->unit, dir, pcm_channels);
+	if (err < 0)
+		fw_iso_resources_free(resources);
+
+	return err;
+}
+
+static void destroy_stream(struct snd_tscm *tscm, struct amdtp_stream *s)
+{
+	amdtp_stream_destroy(s);
+
+	if (s == &tscm->tx_stream)
+		fw_iso_resources_destroy(&tscm->tx_resources);
+	else
+		fw_iso_resources_destroy(&tscm->rx_resources);
+}
+
+int snd_tscm_stream_init_duplex(struct snd_tscm *tscm)
+{
+	int err;
+
+	err = init_stream(tscm, &tscm->tx_stream);
 	if (err < 0)
 		return err;
-	pcm_channels = tscm->spec->pcm_capture_analog_channels;
-	if (tscm->spec->has_adat)
-		pcm_channels += 8;
-	if (tscm->spec->has_spdif)
-		pcm_channels += 2;
-	err = amdtp_tscm_init(&tscm->tx_stream, tscm->unit, AMDTP_IN_STREAM,
-			      pcm_channels);
+
+	err = init_stream(tscm, &tscm->rx_stream);
 	if (err < 0)
-		amdtp_stream_destroy(&tscm->rx_stream);
+		destroy_stream(tscm, &tscm->tx_stream);
 
 	return err;
 }
@@ -333,17 +355,12 @@ void snd_tscm_stream_update_duplex(struct snd_tscm *tscm)
 	amdtp_stream_stop(&tscm->rx_stream);
 }
 
-/*
- * This function should be called before starting streams or after stopping
- * streams.
- */
+// This function should be called before starting streams or after stopping
+// streams.
 void snd_tscm_stream_destroy_duplex(struct snd_tscm *tscm)
 {
-	amdtp_stream_destroy(&tscm->rx_stream);
-	amdtp_stream_destroy(&tscm->tx_stream);
-
-	fw_iso_resources_destroy(&tscm->rx_resources);
-	fw_iso_resources_destroy(&tscm->tx_resources);
+	destroy_stream(tscm, &tscm->rx_stream);
+	destroy_stream(tscm, &tscm->tx_stream);
 }
 
 int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
