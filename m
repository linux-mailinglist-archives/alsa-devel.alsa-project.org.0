Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9657ECFC
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 08:58:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B93B116BA;
	Fri,  2 Aug 2019 08:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B93B116BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564729113;
	bh=51em+6lf5lKqMmNLF9TNY12IldnAwk/SyPDd4EgGS1I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NHMXSJXU0o8ZgnK4OYj/pXbbZNFe33XW3jbQLZ2bFF4fztf12kTFygXbKHec8Vald
	 CqiOMY+gtwF0yjBbbujR4ig97bfoJo+eYt7Nb25P1Dcourlb3N5xY4pdqK6TnyG1p9
	 wcpxAUYICVq/ypR0iGYj5HPNc2oURuZJSo7SnJ4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D86F805FF;
	Fri,  2 Aug 2019 08:52:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D0B9F805A0; Wed, 31 Jul 2019 13:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6BFDF80534
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6BFDF80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="grOJoe/8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=HscMAvIX3nC1A3wZxhpv5ijj3BAWn08doYWBJT7hs3k=; b=grOJoe/8CxJa
 MiZrqP3xAvE6R/4WQliP9ZQiMhZtnER68XbzuPepELZRXw2Gpi1e7G4R80yVTDXWizpvf81ZXej+B
 aT93nWJWGoocUYD66gFVQ67LB9o1fC+J5TLNcUYlilDYNJDHtGhKdGBFDPZJ2qvZT9tw5MRnMw4lK
 P3Lp4=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmne-0001lN-AJ; Wed, 31 Jul 2019 11:29:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7EF382742CC3; Wed, 31 Jul 2019 12:29:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190727150738.54764-19-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112941.7EF382742CC3@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:41 +0100 (BST)
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:52:04 +0200
Cc: mripard@kernel.org, alsa-devel@alsa-project.org, olivier.moysan@st.com,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 jcmvbkbc@gmail.com, thierry.reding@gmail.com, shawnguo@kernel.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, f.fainelli@gmail.com, khilman@baylibre.com,
 tiwai@suse.com, michal.simek@xilinx.com, jonathanh@nvidia.com,
 Hulk Robot <hulkci@huawei.com>, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com, linux-xtensa@linux-xtensa.org,
 alexandre.torgue@st.com, yamada.masahiro@socionext.com, rjui@broadcom.com,
 robert.jarzmik@free.fr, haojian.zhuang@gmail.com, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, baohua@kernel.org, timur@kernel.org,
 sbranden@broadcom.com, eric@anholt.net, gregkh@linuxfoundation.org,
 arnaud.pouliquen@st.com, lgirdwood@gmail.com, wahrenst@gmx.net,
 kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, daniel@zonque.org
Subject: [alsa-devel] Applied "ASoC: mmp-sspa: use
	devm_platform_ioremap_resource() to simplify code" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: mmp-sspa: use devm_platform_ioremap_resource() to simplify code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 72d09322e709c5c2d7112d6a19ec9f3846d3609d Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:22 +0800
Subject: [PATCH] ASoC: mmp-sspa: use devm_platform_ioremap_resource() to
 simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-19-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/mmp-sspa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 72f4364b2d20..e3e5425b5c62 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -399,7 +399,6 @@ static const struct snd_soc_component_driver mmp_sspa_component = {
 static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 {
 	struct sspa_priv *priv;
-	struct resource *res;
 
 	priv = devm_kzalloc(&pdev->dev,
 				sizeof(struct sspa_priv), GFP_KERNEL);
@@ -417,8 +416,7 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	if (priv->dma_params == NULL)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->sspa->mmio_base = devm_ioremap_resource(&pdev->dev, res);
+	priv->sspa->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->sspa->mmio_base))
 		return PTR_ERR(priv->sspa->mmio_base);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
