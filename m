Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815BE3CCDB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF491744;
	Tue, 11 Jun 2019 15:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF491744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259550;
	bh=F16RQ+ORMLKmvb8rcMaPWBTcamOgx+EZCLnEUMeBSqI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pb0iDVlyMTChuQcpkxoBTpJGaj0ndOH0cN9Uh8Xvx2GRv085q40YTrqiMH/WXus5b
	 mflxOvesCf8ZKaeeGILtIb2cw/OD1zSvVaEPDbAhiIIA+1cTuGU/Sc/N4AgfU0s5nF
	 ROcoAe8XVhLtfegsMPTP2SYSU52dWUEdZ+Jm5Evg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67114F8973E;
	Tue, 11 Jun 2019 15:21:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 148A8F8971A; Tue, 11 Jun 2019 15:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38488F806F5
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38488F806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dGWHF3JP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Gx7KAS+9"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6605A220C3;
 Tue, 11 Jun 2019 09:21:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Bqatkc+jbFmGk
 cn3hR/M8k8mhfNlx9a0Jjo7TvwhI4E=; b=dGWHF3JPuHHJ92mYCSWFCRT4uHEoF
 pntcMMU0I6AaLJVqfohAnaLsx/dgKp7EzDohG4FEZcLKLH4TE1zsb2iU57Kzsx7J
 4cNXwjZHkmPjTWWOmsRu2DqOs48gtfeWXHAlJNoCVXklFMVyfEzuwX6FXBVBj5CA
 h9eTxwGiuGon9qbeuEmFc7hWtzR937R4n3LeeVjbbqBmy2sD02p5AaKGIaIRDETu
 x2DcFDOqtL8r4UwqZqUO5DJu26jwDKxhgFbfWu//HrItSKTmXCLtiOSFTpLi7G5g
 H+zvH5je7Sg7sNNsO1zR91UZsb6ZjGLRFhFUJhgJXMlvQVqc6+zYnjR6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Bqatkc+jbFmGkcn3hR/M8k8mhfNlx9a0Jjo7TvwhI4E=; b=Gx7KAS+9
 fwKiC9JJiINJoqvyzqKj1KHWgqnhtsiGRY3L5ZkEErghTqbZcf10xLH/DJlvrDVE
 FtYXOUoaNOSUa2h0FW+WkcKMvds3BsA55ihvb1gi0jw5Gd7F4WUIcstSr2V6M7xH
 uqpVAb0w4GsGDSaUuDDhv+Ag4gHfqTk4SRaUYcdJf7qo4hWvLh62Fzq/BAuBdKYv
 KUFTtbl1xxUuNsZ5Oh2etBC9iLOoAOwjnlQfyP8EMHl1sOD4Gol7jvhPS73/lVdI
 bBWmZs9AkPb5I6TeoMXcDipiD+opMlbAAzJPb6uWKJxwreAiHqk9j7RDMvq1kCZ4
 mkPneBIMZL1/Ig==
X-ME-Sender: <xms:2qr_XAGOp_3HcAbk_uNPFVMIjTS1G71VpxYtVaaENbY_LeuvVny94A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:2qr_XHcGyvQEQilMLEXDRPE4YU2cP0R-PNzkj9kns6ZMn-I-b44X7g>
 <xmx:2qr_XEsCf5seufwKVed4mWNrm6V24pwcDOT_KX_Nd56hXx0ILJuiTA>
 <xmx:2qr_XGly6wEEyNrTUw12FJoT0AObCZISuEWyUsR6i8ZMFIHbGd9J7A>
 <xmx:2qr_XFy1WsQwCT5Xrcfzimld3ak36qHOx7h1w2qplOEGueTOWRB7Ig>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7F30380087;
 Tue, 11 Jun 2019 09:21:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:10 +0900
Message-Id: <20190611132118.8378-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 04/12] ALSA: firewire-digi00x: code refactoring
	to keep isochronous resources
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

All of models in Digidesign Digi00x family have the same formation of
data channels in isochronous packet for both directions. This commit
simplifies allocation of isochronous resources in this point.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-stream.c | 42 +++++++++++--------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 8104af94aed5..2bddeb3e4bf5 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -196,12 +196,14 @@ static void release_resources(struct snd_dg00x *dg00x)
 	fw_iso_resources_free(&dg00x->rx_resources);
 }
 
-static int keep_resources(struct snd_dg00x *dg00x, unsigned int rate)
+static int keep_resources(struct snd_dg00x *dg00x, struct amdtp_stream *stream,
+			  unsigned int rate)
 {
-	unsigned int i;
+	struct fw_iso_resources *resources;
+	int i;
 	int err;
 
-	/* Check sampling rate. */
+	// Check sampling rate.
 	for (i = 0; i < SND_DG00X_RATE_COUNT; i++) {
 		if (snd_dg00x_stream_rates[i] == rate)
 			break;
@@ -209,31 +211,19 @@ static int keep_resources(struct snd_dg00x *dg00x, unsigned int rate)
 	if (i == SND_DG00X_RATE_COUNT)
 		return -EINVAL;
 
-	/* Keep resources for out-stream. */
-	err = amdtp_dot_set_parameters(&dg00x->rx_stream, rate,
-				       snd_dg00x_stream_pcm_channels[i]);
-	if (err < 0)
-		return err;
-	err = fw_iso_resources_allocate(&dg00x->rx_resources,
-				amdtp_stream_get_max_payload(&dg00x->rx_stream),
-				fw_parent_device(dg00x->unit)->max_speed);
-	if (err < 0)
-		return err;
+	if (stream == &dg00x->tx_stream)
+		resources = &dg00x->tx_resources;
+	else
+		resources = &dg00x->rx_resources;
 
-	/* Keep resources for in-stream. */
-	err = amdtp_dot_set_parameters(&dg00x->tx_stream, rate,
+	err = amdtp_dot_set_parameters(stream, rate,
 				       snd_dg00x_stream_pcm_channels[i]);
 	if (err < 0)
 		return err;
-	err = fw_iso_resources_allocate(&dg00x->tx_resources,
-				amdtp_stream_get_max_payload(&dg00x->tx_stream),
-				fw_parent_device(dg00x->unit)->max_speed);
-	if (err < 0) {
-		fw_iso_resources_free(&dg00x->rx_resources);
-		return err;
-	}
 
-	return 0;
+	return fw_iso_resources_allocate(resources,
+				amdtp_stream_get_max_payload(stream),
+				fw_parent_device(dg00x->unit)->max_speed);
 }
 
 int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x)
@@ -306,7 +296,11 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = keep_resources(dg00x, rate);
+		err = keep_resources(dg00x, &dg00x->rx_stream, rate);
+		if (err < 0)
+			goto error;
+
+		err = keep_resources(dg00x, &dg00x->tx_stream, rate);
 		if (err < 0)
 			goto error;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
