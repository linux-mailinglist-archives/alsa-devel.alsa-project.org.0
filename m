Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4913CCD3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156C41724;
	Tue, 11 Jun 2019 15:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156C41724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259398;
	bh=7QCBL1U+PizB2s7eLDr1kQ8m+XkL1TIUl4E2UTnDMjU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BamuFJk8/0ttVhNo6Jj61VTZ4VQkQ3PzFAMsffpmasYYzrGlID9Waylc3tgJpXdZh
	 TN33tbi9EhoY5Nhqvf/3qC4s3iTa7yZJnd7FuCclS8418+d+LTYgD+RCbx8x+sp3Dw
	 Xyv1iAwBV5nXnTvOwMUrJuMTk6af6a4gliTaE1No=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14D4CF89728;
	Tue, 11 Jun 2019 15:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA1BF89712; Tue, 11 Jun 2019 15:21:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78628F80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78628F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VsxGackJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="QMJ3XTaS"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 356632013C;
 Tue, 11 Jun 2019 09:21:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zHP2ikiueJY3W
 koNHv9uBkWxPy8gCojVxFj0VjLQ75k=; b=VsxGackJ+YHHvQNU03m0Z7O4XbBff
 NJWREyJFru3RaRDOv3p/vkWQtuKFrK0v2ZNdmOjJlOz5XZJzZzrT8PP3OWwaPfXN
 Uq4HdA9R0WfxPzKlm9l6FQf+4C3JGS/CFkdYkJWCljYizg8vOH3OJ6MJSKFdBZPf
 hJu0E0y/To0kAf9UYxIrZf2CvDFcuVE6+M3qmtCCAgLsGTyMbwkaO7I1pI7ungFI
 q5Joy8C7Sw7caGzk/2TWbi8xfOnljypP+npvIewAFihW/a3dbJd0GJuqHKNCYKXK
 9OmVghtWg1ixjOd+fGR8XT4vjyQqUcBggWVyufFzjyjuiPP5wkWH9r6Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zHP2ikiueJY3WkoNHv9uBkWxPy8gCojVxFj0VjLQ75k=; b=QMJ3XTaS
 qVxnvMYE+HTbfxRIv8qL6WK5kjUsFumnDhWX/hAPHuxn0FfxJj0/zneRN9b2ystp
 T7dgeCADDyFlpP9NZmWLdNW9V3kCWqY0tCwDY7tkakIDfodJdLRmD8yY5WAJDj4e
 brkVptxXXvPURlONz9vzS7yvd8a0dxDRAeAocvbkQk0AwiEydLQwRQFOZBELWstH
 wzPqkEJwS/AYi5zS4jC2yTiJejCmzATXQ9jXgLOjf76/hSQF44K7yD1OtKEisUAi
 RpKJ5u5Q8I8coo3gFuqr643bWexbMoor7eQerd5niwB/GkFssCfoGjIGqXKAwZHT
 NGLoaNAgexeovA==
X-ME-Sender: <xms:1Kr_XHaK921p_7HC7d11S-d1Z3m-t2geiFMdfA3h8OdCT1w0y2GezQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:1ar_XFxPyPKR9SV8CyGo1sGZdsibTZ0vJl3a0ic5mUQsllxH3OiYKg>
 <xmx:1ar_XMjePwm8V58HG6nNlIGMPi5_Kowy3A122thJ0MjaFUDNQmeM9g>
 <xmx:1ar_XO1PGU_Z-bBdVoPPRyrPnEqEJ5XZUb2lsxAltaCs-cKUatnTLQ>
 <xmx:1ar_XLrzeODuDicYeH-erCS1Fq7medafgURYA2WV2O2wZeVMJh6x-w>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2A25380087;
 Tue, 11 Jun 2019 09:21:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:07 +0900
Message-Id: <20190611132118.8378-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 01/12] ALSA: firewire-digi00x: refactoring to
	move timing of registration for isochronous channel
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

The registration of isochronous channels is done just after allocation
of isochronous resources. This commit separates the registration just
before starting packet streaming.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-stream.c | 41 ++++++++++++-------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 4d3b4ebbdd49..455c43e81850 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -130,6 +130,12 @@ static void finish_session(struct snd_dg00x *dg00x)
 	snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
 			   DG00X_ADDR_BASE + DG00X_OFFSET_STREAMING_SET,
 			   &data, sizeof(data), 0);
+
+	// Unregister isochronous channels for both direction.
+	data = 0;
+	snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
+			   DG00X_ADDR_BASE + DG00X_OFFSET_ISOC_CHANNELS,
+			   &data, sizeof(data), 0);
 }
 
 static int begin_session(struct snd_dg00x *dg00x)
@@ -138,6 +144,15 @@ static int begin_session(struct snd_dg00x *dg00x)
 	u32 curr;
 	int err;
 
+	// Register isochronous channels for both direction.
+	data = cpu_to_be32((dg00x->tx_resources.channel << 16) |
+			   dg00x->rx_resources.channel);
+	err = snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
+				 DG00X_ADDR_BASE + DG00X_OFFSET_ISOC_CHANNELS,
+				 &data, sizeof(data), 0);
+	if (err < 0)
+		goto error;
+
 	err = snd_fw_transaction(dg00x->unit, TCODE_READ_QUADLET_REQUEST,
 				 DG00X_ADDR_BASE + DG00X_OFFSET_STREAMING_STATE,
 				 &data, sizeof(data), 0);
@@ -171,13 +186,6 @@ static int begin_session(struct snd_dg00x *dg00x)
 
 static void release_resources(struct snd_dg00x *dg00x)
 {
-	__be32 data = 0;
-
-	/* Unregister isochronous channels for both direction. */
-	snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
-			   DG00X_ADDR_BASE + DG00X_OFFSET_ISOC_CHANNELS,
-			   &data, sizeof(data), 0);
-
 	/* Release isochronous resources. */
 	fw_iso_resources_free(&dg00x->tx_resources);
 	fw_iso_resources_free(&dg00x->rx_resources);
@@ -186,7 +194,6 @@ static void release_resources(struct snd_dg00x *dg00x)
 static int keep_resources(struct snd_dg00x *dg00x, unsigned int rate)
 {
 	unsigned int i;
-	__be32 data;
 	int err;
 
 	/* Check sampling rate. */
@@ -216,22 +223,12 @@ static int keep_resources(struct snd_dg00x *dg00x, unsigned int rate)
 	err = fw_iso_resources_allocate(&dg00x->tx_resources,
 				amdtp_stream_get_max_payload(&dg00x->tx_stream),
 				fw_parent_device(dg00x->unit)->max_speed);
-	if (err < 0)
-		goto error;
-
-	/* Register isochronous channels for both direction. */
-	data = cpu_to_be32((dg00x->tx_resources.channel << 16) |
-			   dg00x->rx_resources.channel);
-	err = snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
-				 DG00X_ADDR_BASE + DG00X_OFFSET_ISOC_CHANNELS,
-				 &data, sizeof(data), 0);
-	if (err < 0)
-		goto error;
+	if (err < 0) {
+		fw_iso_resources_free(&dg00x->rx_resources);
+		return err;
+	}
 
 	return 0;
-error:
-	release_resources(dg00x);
-	return err;
 }
 
 int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
