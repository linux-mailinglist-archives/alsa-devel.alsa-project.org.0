Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411A26EAF4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 04:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518F516A3;
	Fri, 18 Sep 2020 04:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518F516A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600394608;
	bh=QXOztF3wtrFt4Gt65qXn7Z12bKc9kPi5YfxXn+YXy1g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YwNGEacT4lMT/g87F5m1tuNygxiiVFKs7JVM6VpLJUCKT8tFMLcSa7y8T5geACPP+
	 Felm5XtlCHPolMeEAtoMIVb2YLytxZWsv9akNL3v18LDyUq8TGnc5OCrZ0+o/ds3+b
	 kLWYr5FstV+nfBlEPMCYvTrmeTjnZb2U7keAAgAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B2B9F800E8;
	Fri, 18 Sep 2020 04:01:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67995F8015A; Fri, 18 Sep 2020 04:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 464C1F800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 04:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 464C1F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GmMSy7i3"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9556B21734;
 Fri, 18 Sep 2020 02:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394494;
 bh=QXOztF3wtrFt4Gt65qXn7Z12bKc9kPi5YfxXn+YXy1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GmMSy7i3dE0tsQdo7zBaPY/WCCQG16W9gBVUs5rFDMF8U/9kxgE/aGI+wf4i/rn+1
 QQsqG7UGZFcZpeb349elopnrc5C8kp33NjPwoM4DJ+xSiTzcEhoWx0K38GO3HPUg8a
 B0i5PHxxzA6MKzbh3gmZ/7wzB8bD6OmP9MWeJk/I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 019/330] ASoC: kirkwood: fix IRQ error handling
Date: Thu, 17 Sep 2020 21:55:59 -0400
Message-Id: <20200918020110.2063155-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
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

From: Russell King <rmk+kernel@armlinux.org.uk>

[ Upstream commit 175fc928198236037174e5c5c066fe3c4691903e ]

Propagate the error code from request_irq(), rather than returning
-EBUSY.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Link: https://lore.kernel.org/r/E1iNIqh-0000tW-EZ@rmk-PC.armlinux.org.uk
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 6f69f314f2c2a..d2d5c25bf5502 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -132,7 +132,7 @@ static int kirkwood_dma_open(struct snd_pcm_substream *substream)
 		err = request_irq(priv->irq, kirkwood_dma_irq, IRQF_SHARED,
 				  "kirkwood-i2s", priv);
 		if (err)
-			return -EBUSY;
+			return err;
 
 		/*
 		 * Enable Error interrupts. We're only ack'ing them but
-- 
2.25.1

