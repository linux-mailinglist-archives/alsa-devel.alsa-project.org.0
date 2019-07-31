Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD97C011
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E45B170E;
	Wed, 31 Jul 2019 13:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E45B170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572905;
	bh=baeN/4fNU1vIX39jQbzCeivvnvE+0cIKRz5vPEDVdgo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=me/IWqx+I9zoOpHFq0I5fwSXNUADZ/JY4wJwhg9t5zZbaTlEd6oGgOPZJ0jERY0Jo
	 msh4sh6KwRDjR6qdAV0gn2KyGk+2rsiNOUQ1kKqmfUljlZKS/FlVvaAem8B4z365cY
	 mlo+pi8uW5OIYL/gBCGdmWWPtfHpp4CuKitiVPCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAF72F805A8;
	Wed, 31 Jul 2019 13:31:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B43D3F80440; Wed, 31 Jul 2019 13:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 843FCF805AA
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 843FCF805AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dK9FSytL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qVwW0pPyCeBbMZcq8baEchug6az9I8W8IrbQzrWy+Hg=; b=dK9FSytLKVuG
 5f+I87sxZk5Iq1u05g7ycSp9tQvqkl24sxzYMs9JL3Z08C+xDsnAhWv3Lm9bSkP8E3nfmOYfaP20w
 ku7RD4nTVctpsusYx+a0WXInn0RBT6rfWs9Qp8DjUudvc++s5hvWQQmk55apFtGgmEhXJmTJtRg0s
 9xl3A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmnp-0001q4-53; Wed, 31 Jul 2019 11:29:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BC2C42742C99; Wed, 31 Jul 2019 12:29:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Marcus Cooper <codekipper@gmail.com>
In-Reply-To: <20190729152130.27955-1-codekipper@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112951.BC2C42742C99@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:51 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-sunxi@googlegroups.com, Mark Brown <broonie@kernel.org>,
 maxime.ripard@free-electrons.com, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Incorrect SR and WSS
	computation" to the asoc tree
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

   ASoC: sun4i-i2s: Incorrect SR and WSS computation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 52f87f3ca251f5e43b42e78ab9816b2b07718bfe Mon Sep 17 00:00:00 2001
From: Marcus Cooper <codekipper@gmail.com>
Date: Mon, 29 Jul 2019 17:21:30 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Incorrect SR and WSS computation

The A64 audio codec uses the original I2S block but the SR and
WSS computation currently assigned is for the newer block.

Fixes: 619c15f7fac9 (ASoC: sun4i-i2s: Change SR and WSS computation)
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Link: https://lore.kernel.org/r/20190729152130.27955-1-codekipper@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9b2232908b65..7fa5c61169db 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1002,8 +1002,8 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
-	.get_sr			= sun8i_i2s_get_sr_wss,
-	.get_wss		= sun8i_i2s_get_sr_wss,
+	.get_sr			= sun4i_i2s_get_sr,
+	.get_wss		= sun4i_i2s_get_wss,
 };
 
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
