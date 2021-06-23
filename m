Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C253B17CC
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 12:07:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2535166D;
	Wed, 23 Jun 2021 12:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2535166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624442845;
	bh=kabrVEEGJjYBrBwnvILlfntoSEJwnZfugr2rpyGl6Ew=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oz7OkIi5xiKlKTDz46FH4leAcsU0RKzSOZoCTG9qrRxH6MooxmvqhKRf2tKGipLNk
	 NPgotyzGA68bXNA+A0Uz5FtmwvZx6Njps1Sgmmwmrp2o9ka7UsQx7toGkYsnWhseby
	 xnxw1LN2o7+HPa0ThWWypY7R5jPljE+iMdXj6BXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 416DDF80137;
	Wed, 23 Jun 2021 12:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06CD8F8016D; Wed, 23 Jun 2021 12:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C92E0F80137
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 12:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C92E0F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sang-engineering.com
 header.i=@sang-engineering.com header.b="KPfcIVCU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=kabrVEEGJjYBrBwnvILlfntoSEJ
 wnZfugr2rpyGl6Ew=; b=KPfcIVCU03B9ALfeG+OtNa+BGxTrwf667War+Mh1e6V
 EG46BpFXhjCrXfSXZfRn/3WIpT3w+Bu1vsRXuMq4ut2WpsXF91NYyAoR5xHZWO9D
 wYQqNyVW6x5jkg1gn1KS+LGZNxj5BJnW4w4Am07ds+C0gps+WTSG2glU4W92KPuU
 =
Received: (qmail 2554623 invoked from network); 23 Jun 2021 12:05:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 23 Jun 2021 12:05:46 +0200
X-UD-Smtp-Session: l3s3148p1@rRDRDGzFJKogARa4RfhaAavnjlTTqzSz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for
 termination
Date: Wed, 23 Jun 2021 12:05:45 +0200
Message-Id: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Morimoto-san, can you please double check if this works. I don't know
this driver very well. Thank you!

 sound/soc/sh/rcar/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 95aa26d62e4f..d1b46057df9e 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -101,7 +101,7 @@ static int rsnd_dmaen_stop(struct rsnd_mod *mod,
 	struct rsnd_dmaen *dmaen = rsnd_dma_to_dmaen(dma);
 
 	if (dmaen->chan)
-		dmaengine_terminate_all(dmaen->chan);
+		dmaengine_terminate_sync(dmaen->chan);
 
 	return 0;
 }
-- 
2.30.2

