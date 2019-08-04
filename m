Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D128809AE
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB6A16A8;
	Sun,  4 Aug 2019 08:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB6A16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900225;
	bh=hoD5b0kjLi0ByCxGNdbMCzUASInF37CyYdE6Xl0QWj4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdeFOqJWjUJfvPoIVkrQxgf0OmP87ZCW/Fi+O+J/PYayToUyujKG1I6Q8SvmriLh/
	 YMWlOuwkrJkhkGGZbbMJFESW0CC4roupbDkAw1Ly+nw5u4IJYzcML6CG28RiDIDC/H
	 NnNCoz4ClVeYojmHRF8R2kDCOX8Vt8RrNLMyThlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09FC2F80671;
	Sun,  4 Aug 2019 08:22:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E073F805AA; Sun,  4 Aug 2019 08:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01E5F805A1
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01E5F805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="T1jaeLUn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nqLq3k4a"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id ECCAA21650;
 Sun,  4 Aug 2019 02:21:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0Hn0IMy/apHr0
 sMhido2llcUdBmIgIP4JRhCEyEm944=; b=T1jaeLUnhUq6Q0MoxSQ3rm+2+Cbcg
 wezRX2dxBhYxX3Ex0SUxF0yMRf/MhE7UtlW7USbv3dHjC+OHpMhgPwBxDJp1PRB+
 Dk7lu3xkd8pormenrjXo9yYe6EnaVAK71t1uTH2YgRHVaOg9nwnm518auTGKUz7m
 b+zMDrjJy4MomRRXZKqBpiid3tJMGC2qGLOcuTDS6B4HI1UM8NCb8+KVdOMWnQTf
 LhVsgqXUv2GjYHjiVXgfAUMaXWq32PaoyyVgrmLClSlrfyTSDRnDYwWrXdSehV5I
 p8C4GsyJ8ukEeFpfROEReXMrtqCtgILaa4fG/+avbJihS1c5iQMBT3sMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0Hn0IMy/apHr0sMhido2llcUdBmIgIP4JRhCEyEm944=; b=nqLq3k4a
 XJX8M5cbwVnR0dd2H72BsopcZWNRu7K/bbmr2c2NPqV8ciit0bXfTThNzYuqvfS/
 hDBhuyA2iPzY45aH1LjOmNZr7HFHqVm5UY5rrt9KQ32LaCP7xjfyDV7R2CmELa9H
 6xbfs8NZiaAkORs6GrDfmJkiGvFbJKIXIwP1bVG+vSvHkj/kk/nM5FMxf/taxfDl
 6Ymd8rUXNwWMtPJYXjzmeAfVOdWFsOfrsgt5JYdpMDyPX9vnsC4o8MHhJPeJmnX9
 VoyUxay3SUeHOSr9IQJiHFCigOJUQe6IFJlNQYggYYQ+ZZdgXWWPhNK/+VIVS+Ap
 b9rkdj/k2YcB3w==
X-ME-Sender: <xms:hXlGXab3fqC8LPOYkXrH9ppvNeg4RAEMeqiilSFObPaoaxwMrus37Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:hXlGXeLzbKRGVoAQrVtSLwb6FHZGl0srCSAZmuMU-jx2YmahWRW05g>
 <xmx:hXlGXYwizkn7YF2t4YkWe59Hs7X7us3NW4RNKdMVFNuI6DSzC7g3Og>
 <xmx:hXlGXeMr-DrZ5vJwb4y4OJNBAPFFWLgMXOvFF0q49RVIoNh_s5pF0g>
 <xmx:hXlGXXR2tu7Efe7MUTVLAlEGigekDiXVIh9GR-GsIT3qdeXFxnHvBw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A1D0380083;
 Sun,  4 Aug 2019 02:21:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:29 +0900
Message-Id: <20190804062138.1217-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 10/19] ALSA: fireface: code refactoring for
	initialization/destruction of AMDTP stream
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
 sound/firewire/fireface/ff-stream.c | 39 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 4208b8004d1a..e4710204f481 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -39,54 +39,53 @@ static inline void finish_session(struct snd_ff *ff)
 	ff->spec->protocol->switch_fetching_mode(ff, false);
 }
 
-static int init_stream(struct snd_ff *ff, enum amdtp_stream_direction dir)
+static int init_stream(struct snd_ff *ff, struct amdtp_stream *s)
 {
-	int err;
 	struct fw_iso_resources *resources;
-	struct amdtp_stream *stream;
+	enum amdtp_stream_direction dir;
+	int err;
 
-	if (dir == AMDTP_IN_STREAM) {
+	if (s == &ff->tx_stream) {
 		resources = &ff->tx_resources;
-		stream = &ff->tx_stream;
+		dir = AMDTP_IN_STREAM;
 	} else {
 		resources = &ff->rx_resources;
-		stream = &ff->rx_stream;
+		dir = AMDTP_OUT_STREAM;
 	}
 
 	err = fw_iso_resources_init(resources, ff->unit);
 	if (err < 0)
 		return err;
 
-	err = amdtp_ff_init(stream, ff->unit, dir);
+	err = amdtp_ff_init(s, ff->unit, dir);
 	if (err < 0)
 		fw_iso_resources_destroy(resources);
 
 	return err;
 }
 
-static void destroy_stream(struct snd_ff *ff, enum amdtp_stream_direction dir)
+static void destroy_stream(struct snd_ff *ff, struct amdtp_stream *s)
 {
-	if (dir == AMDTP_IN_STREAM) {
-		amdtp_stream_destroy(&ff->tx_stream);
+	amdtp_stream_destroy(s);
+
+	if (s == &ff->tx_stream)
 		fw_iso_resources_destroy(&ff->tx_resources);
-	} else {
-		amdtp_stream_destroy(&ff->rx_stream);
+	else
 		fw_iso_resources_destroy(&ff->rx_resources);
-	}
 }
 
 int snd_ff_stream_init_duplex(struct snd_ff *ff)
 {
 	int err;
 
-	err = init_stream(ff, AMDTP_OUT_STREAM);
+	err = init_stream(ff, &ff->rx_stream);
 	if (err < 0)
-		goto end;
+		return err;
 
-	err = init_stream(ff, AMDTP_IN_STREAM);
+	err = init_stream(ff, &ff->tx_stream);
 	if (err < 0)
-		destroy_stream(ff, AMDTP_OUT_STREAM);
-end:
+		destroy_stream(ff, &ff->rx_stream);
+
 	return err;
 }
 
@@ -96,8 +95,8 @@ int snd_ff_stream_init_duplex(struct snd_ff *ff)
  */
 void snd_ff_stream_destroy_duplex(struct snd_ff *ff)
 {
-	destroy_stream(ff, AMDTP_IN_STREAM);
-	destroy_stream(ff, AMDTP_OUT_STREAM);
+	destroy_stream(ff, &ff->rx_stream);
+	destroy_stream(ff, &ff->tx_stream);
 }
 
 int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
