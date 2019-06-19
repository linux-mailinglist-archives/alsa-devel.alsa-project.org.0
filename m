Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC934B90D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A34B1704;
	Wed, 19 Jun 2019 14:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A34B1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560948491;
	bh=r/nYYTrHpCkP0IJJ2j+L+QcRsLcsfUfOqCNSFJAzTsM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=opUFz3uA2YDWpXZ7RHBS6ecyl8nR5TMXiER1mvf2nlUK5cmjTAiNvnyiKrCtu95Cy
	 ec5wC8hch90UzW9scR+Wb4DhAMuM2+Xe/gYpRFHmzfJ1cGFedIrgwR8Yb/nGxpE4TL
	 EMyDPBuVxLrUiQQSST6bcgoZuwge5xYiBAzOSyqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 200B6F89682;
	Wed, 19 Jun 2019 14:13:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6DA3F8978E; Wed, 19 Jun 2019 14:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC055F89758
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC055F89758
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wxoNm67p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=MHbtqkSt8a5ozIVslrafsOir/xCqHAdoTzUMdfiFfg0=; b=wxoNm67pKP3b
 ym6CoVCYs6ivEVYspnFo6A8dH7H9fjqRwD8SFMTN2WPkvyH5QDPbOdYJ1uk3X0GSwWkyLvPLWpyUc
 jUCpu7820rsJxuxMeMnQ/TRPWAVUMtUeugiNby/5kIwgHB0//734Imh6+5mrFEB+BZimSawxfHubj
 uX4ng=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRa-0007AJ-DP; Wed, 19 Jun 2019 12:12:02 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C89A7440049; Wed, 19 Jun 2019 13:12:01 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878styv0hk.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121201.C89A7440049@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:01 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rockchip: rockchip_rt5645: don't select
	unnecessary Platform" to the asoc tree
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

   ASoC: rockchip: rockchip_rt5645: don't select unnecessary Platform

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

From 27a37973a6f1d508398f6ef1b140e8433870fe8a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:18:00 +0900
Subject: [PATCH] ASoC: rockchip: rockchip_rt5645: don't select unnecessary
 Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rockchip_rt5645.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index e17f01635bba..771d3c7305a6 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -137,8 +137,7 @@ static const struct snd_soc_ops rk_aif1_ops = {
 
 SND_SOC_DAILINK_DEFS(pcm,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5645-aif1")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5645-aif1")));
 
 static struct snd_soc_dai_link rk_dailink = {
 	.name = "rt5645",
@@ -190,8 +189,6 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 		goto put_codec_of_node;
 	}
 
-	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
-
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
