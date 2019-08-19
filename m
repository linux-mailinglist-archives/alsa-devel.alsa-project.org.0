Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7095833
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A951658;
	Tue, 20 Aug 2019 09:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A951658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566285721;
	bh=0ZNuYoPQVa53gDDm3iudyqZuFdEqt1/k1r8+2k/Il2g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IdScU2td+5P+CJkBydGN6U528BD7zgt2xKwPh0WbtlKUI61lryB+/3z0J7tFLR5zM
	 AHzacOXEVgCdz2HaYe+Y1I/3OFrwsrEEqIk3Mz68YdLwToaMWYlVpCR2NuVg2LEC6w
	 gBkXTA+DDrWslD2GYlssltP2bu553JYMdOTwWT9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE54F805FC;
	Tue, 20 Aug 2019 09:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43DF5F802FB; Mon, 19 Aug 2019 21:35:41 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF852F80306
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF852F80306
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rl8cyP+E"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19BD2206C1;
 Mon, 19 Aug 2019 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566242738;
 bh=KWvMAVh8158Vfot7bGOe/TZP6z7v55KtdLwvGs8+fyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rl8cyP+EOopS1H4rho1U/AiNRXHlyHm53mEiFLDzajk2B8TlmRoa1ogWcWL/12kro
 YOby6qvoM/VYXrXOe8an/y9R59mtvrUvlM5y9AfycmsJahHL7kWkYNeZnGmyt/6UW/
 RsWACt/0oxJL+R6W7/DSKGwDFhJKItIy4lgpLFdY=
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 lgirdwood@gmail.com, broonie@kernel.org
Date: Mon, 19 Aug 2019 21:25:09 +0200
Message-Id: <606d271187091e858e8c15e20555af0b79798fe1.1566242458.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:28 +0200
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 02/21] ASoC: sun4i-i2s: Switch to devm for PCM
	register
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

From: Maxime Ripard <maxime.ripard@bootlin.com>

Since the introduction of the driver, a new managed helper for the
dmaengine PCM registration has been created. Let's use it to simplify a bit
our probe and remove functions.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 85c3b2c8cd77..1ed7670eae9c 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1154,7 +1154,7 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 		goto err_suspend;
 	}
 
-	ret = snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
 		goto err_suspend;
@@ -1185,8 +1185,6 @@ static int sun4i_i2s_remove(struct platform_device *pdev)
 {
 	struct sun4i_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
-	snd_dmaengine_pcm_unregister(&pdev->dev);
-
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		sun4i_i2s_runtime_suspend(&pdev->dev);
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
