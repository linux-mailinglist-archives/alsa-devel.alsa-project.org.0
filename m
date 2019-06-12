Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F642035
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:59:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECEF1790;
	Wed, 12 Jun 2019 10:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECEF1790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329960;
	bh=mXt7mC0ORZjukfJNrn8m+RVzU9Rf+uZ1zYc+0rufvAU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F9IcLU+URwL+uRkUwQgLen+HP7wFVhAYXLKkCHYH6E04/JsGIK0ZjGXv0kCr4/gDz
	 eAHH3qfiVuai8A29IbkmjM3WYu5KFup4o9mD1ikpIX7CzUJ71kCY5hkuDas/caATFK
	 gmYgXW7GMEowC3QsvNdTcOcnI3sM89CdqsUyhZI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02114F8979F;
	Wed, 12 Jun 2019 10:45:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15E2AF89767; Wed, 12 Jun 2019 10:45:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E7CEF89761
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E7CEF89761
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VGL9B+34"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="F85ioAMa"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6E87F46C;
 Wed, 12 Jun 2019 04:44:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SsMTKb8f/KA/T
 b5onWnz77zhoDf48lC8sVdZ7KH82E4=; b=VGL9B+34sgk5OJ4l01vkjePJkJBDv
 o71NJ0jyXbXHRFmiQNHUnxD5GztJSv7iKHxMnHeTvPg1wr1ZhWX8fqBam9bumdmu
 bWJcTgr8hXDTCG+3ekkvMJ+KEMlFo1uh5NYoxkquwu610D1AAtWnf26qDATFvehE
 Gi1pTzk5k0qMoTmq+KkirV1HqrUycug7KoEa79S8SwkWay7XC3DzsZUA31xuCH/y
 53+KB1hmvuxwcOFF634ZimpNUkHR5ggX0yigdydvbir3CAv2kI0O4k3jHcwhUjrf
 aH1Y5oum5cOJAPfpx90jvRThuhhzEZui/6eYIvPyL0tEvM1Hj7tkQotXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=SsMTKb8f/KA/Tb5onWnz77zhoDf48lC8sVdZ7KH82E4=; b=F85ioAMa
 jXijrUZ6HdUmmcyO6Tlx6d/iwcWqeGlLTpfqlYZQ8UyTLcBRpveQ+t4a6T2LgDai
 xmE6am8bA0OdoKVOi4+RE16Qnw1TDC4iPoYDh7N2JvoHmJm4w38NZS7tKJoldxSG
 wH4J+xRt4wa1pPEyT64nyIlfcPbdjKZ871kh4wBpMtZFBOM70E2esl0gMB3KxuIR
 6JzFC98Kd5X8wTswRpGgVJrN/SQ0NBuodUpjtP4YQM2EZPZc4iq+qmnBdXkiO0iy
 baRLDkmVkamvX1LyHgcTK5BJfTtabz04oT/CIZXolt+Vb273VQsfXERLmkoPwYiQ
 VMSau7vF+HyN0g==
X-ME-Sender: <xms:h7sAXRcI-BPWSUt0oI6-oA_4TjvwVclBQdlp7zxCm-dyMd3iYLK7EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudeh
X-ME-Proxy: <xmx:h7sAXWzrpRUxa7PefFft4CIBf-J4jsLknXTajYLlIAoGNv3SLlhVcQ>
 <xmx:h7sAXaJPYxPajkK08vmcRwnBdOxuDRL5S5RsH33c1DnR1G8_g7lD_w>
 <xmx:h7sAXXvT3xNGhXW9j8FP6yrNH8f36NYPhDQY5vX60NORSpdKYIu2pQ>
 <xmx:iLsAXfa59-BEoo_vzwBWLn8zzCnBRGK85ZAH2ZwwXhEREJnevdqDGQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0D4C380089;
 Wed, 12 Jun 2019 04:44:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:22 +0900
Message-Id: <20190612084422.5344-20-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 19/19] ALSA: oxfw: configure stream parameter
	in pcm.hw_params callback
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
 sound/firewire/oxfw/oxfw-stream.c | 97 ++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 40 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 373154d8ee0e..837733f10736 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -103,51 +103,13 @@ static int set_stream_format(struct snd_oxfw *oxfw, struct amdtp_stream *s,
 
 static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 {
-	u8 **formats;
-	enum avc_general_plug_dir dir;
 	struct cmp_connection *conn;
-	struct snd_oxfw_stream_formation formation;
-	int i;
 	int err;
 
-	if (stream == &oxfw->rx_stream) {
-		dir = AVC_GENERAL_PLUG_DIR_IN;
-		formats = oxfw->rx_stream_formats;
+	if (stream == &oxfw->rx_stream)
 		conn = &oxfw->in_conn;
-	} else {
-		dir = AVC_GENERAL_PLUG_DIR_OUT;
-		formats = oxfw->tx_stream_formats;
+	else
 		conn = &oxfw->out_conn;
-	}
-
-	err = snd_oxfw_stream_get_current_formation(oxfw, dir, &formation);
-	if (err < 0)
-		return err;
-
-	for (i = 0; i < SND_OXFW_STREAM_FORMAT_ENTRIES; i++) {
-		struct snd_oxfw_stream_formation fmt;
-
-		if (formats[i] == NULL)
-			break;
-
-		err = snd_oxfw_stream_parse_format(formats[i], &fmt);
-		if (err < 0)
-			return err;
-		if (fmt.rate == formation.rate && fmt.pcm == formation.pcm &&
-		    fmt.midi == formation.midi)
-			break;
-	}
-	if (i == SND_OXFW_STREAM_FORMAT_ENTRIES)
-		return -EINVAL;
-
-	// The stream should have one pcm channels at least.
-	if (formation.pcm == 0)
-		return -EINVAL;
-
-	err = amdtp_am824_set_parameters(stream, formation.rate, formation.pcm,
-					 formation.midi * 8, false);
-	if (err < 0)
-		return err;
 
 	err = cmp_connection_establish(conn,
 				       amdtp_stream_get_max_payload(stream));
@@ -236,6 +198,51 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	return 0;
 }
 
+static int keep_resources(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
+{
+	enum avc_general_plug_dir dir;
+	u8 **formats;
+	struct snd_oxfw_stream_formation formation;
+	int i;
+	int err;
+
+	if (stream == &oxfw->rx_stream) {
+		dir = AVC_GENERAL_PLUG_DIR_IN;
+		formats = oxfw->rx_stream_formats;
+	} else {
+		dir = AVC_GENERAL_PLUG_DIR_OUT;
+		formats = oxfw->tx_stream_formats;
+	}
+
+	err = snd_oxfw_stream_get_current_formation(oxfw, dir, &formation);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < SND_OXFW_STREAM_FORMAT_ENTRIES; i++) {
+		struct snd_oxfw_stream_formation fmt;
+
+		if (formats[i] == NULL)
+			break;
+
+		err = snd_oxfw_stream_parse_format(formats[i], &fmt);
+		if (err < 0)
+			return err;
+
+		if (fmt.rate == formation.rate && fmt.pcm == formation.pcm &&
+		    fmt.midi == formation.midi)
+			break;
+	}
+	if (i == SND_OXFW_STREAM_FORMAT_ENTRIES)
+		return -EINVAL;
+
+	// The stream should have one pcm channels at least.
+	if (formation.pcm == 0)
+		return -EINVAL;
+
+	return amdtp_am824_set_parameters(stream, formation.rate, formation.pcm,
+					 formation.midi * 8, false);
+}
+
 int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 				   struct amdtp_stream *stream,
 				   unsigned int rate, unsigned int pcm_channels)
@@ -285,6 +292,16 @@ int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 				"fail to set stream format: %d\n", err);
 			return err;
 		}
+
+		err = keep_resources(oxfw, &oxfw->rx_stream);
+		if (err < 0)
+			return err;
+
+		if (oxfw->has_output) {
+			err = keep_resources(oxfw, &oxfw->tx_stream);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
