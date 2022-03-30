Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F94EC0E2
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C484C18E5;
	Wed, 30 Mar 2022 13:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C484C18E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641332;
	bh=HHjBaMZZNUVS7HlclTpFmCYSIBZArxrZX0QEnHO+Zzk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEOCSoDi7SaYgrcMRdWn2rxp6oFD/KQHjJTlHdNgw46v/YOHurTyY6I6kMAUio4AN
	 fAyIwIPYAOtvtSI7N9aXro2naA0HDlWtiWPHNE4d2k4it7fBrQxD1Hp2422a1lPW7U
	 WoHkzb+276eo9rTYjh6YEKzgRYzVnwAd7ynJ8sb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44D7CF80524;
	Wed, 30 Mar 2022 13:48:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F9D1F80524; Wed, 30 Mar 2022 13:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC9A7F805D7
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9A7F805D7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ngt4D4eP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F40661626;
 Wed, 30 Mar 2022 11:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC384C36AE2;
 Wed, 30 Mar 2022 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640922;
 bh=HHjBaMZZNUVS7HlclTpFmCYSIBZArxrZX0QEnHO+Zzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ngt4D4eP2xmEVf7N4D2jMAB/G1k/9cAsJWgUyUAsJEkdUgNEyEk47qVUQHeqp2p3u
 YwGatRF0uVDsy+96yiJZzb1piO/qxzXkJ/YQFfkK0yGoGCHS+AANuzL4Hz5AmSFrQg
 /kLJgndJnbCZ4YlUyZ8tXP5QxzALQuOEFYeek62mv+3+lCvI7vudlXKLw4msjrUFJn
 3InEEkziYHkQPasD0EcKpBBKbvFLfOIireV/lEvi2EA+FHp6X/FzOYRwP2D5IAFQxk
 shzOrwMmVyX/PRwMWf97cSIFRzBWoAngH7DDyrJXaXv6K9zv2jVHttWHMjIgp9PvFW
 8ObFuoffpiXcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 06/59] ASoC: sh: rz-ssi: Make the data structures
 available before registering the handlers
Date: Wed, 30 Mar 2022 07:47:38 -0400
Message-Id: <20220330114831.1670235-6-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Pavel Machek <pavel@denx.de>, tiwai@suse.com, lgirdwood@gmail.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[ Upstream commit 0788785c78342d422f93b1c9831c2b2b7f137937 ]

Initialize the spinlock and make the data structures available before
registering the interrupt handlers.

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Link: https://lore.kernel.org/r/20220110094711.8574-3-prabhakar.mahadev-lad.rj@bp.renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rz-ssi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index fa0cc08f70ec..f6ba00bfcc80 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -975,6 +975,9 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->playback.priv = ssi;
 	ssi->capture.priv = ssi;
 
+	spin_lock_init(&ssi->lock);
+	dev_set_drvdata(&pdev->dev, ssi);
+
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
 	if (ssi->irq_int < 0)
@@ -1022,8 +1025,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_resume_and_get(&pdev->dev);
 
-	spin_lock_init(&ssi->lock);
-	dev_set_drvdata(&pdev->dev, ssi);
 	ret = devm_snd_soc_register_component(&pdev->dev, &rz_ssi_soc_component,
 					      rz_ssi_soc_dai,
 					      ARRAY_SIZE(rz_ssi_soc_dai));
-- 
2.34.1

