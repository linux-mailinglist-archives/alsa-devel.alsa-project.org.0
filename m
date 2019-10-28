Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A786E74E6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 115C6203E;
	Mon, 28 Oct 2019 16:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 115C6203E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572276060;
	bh=mg0ipZHxzoO8ofPzV9FMgKYHw1oySwUZTc6Z8OGyIiU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rFsZ5gdGncWRtF1K1mO81zZKQTaMxq5Op5tsZFmmhgS5/wVfZnMq03dukc2KKKoGm
	 VylqZGKaIVkTvjVvM8ulXeraiHhWTwy/pfeTYXR+Gfp3ygYAiLpAV5TTTS/CmZyoSI
	 I9HtxEHKpwsVP7OxgCuSVMZh6Ckb9lRowTpPAQpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A524F89612;
	Mon, 28 Oct 2019 15:57:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68357F8071F; Mon, 28 Oct 2019 15:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 387BFF803D6
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 387BFF803D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ji8GRUak"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pRAnZ2eosKV/53G9bqUjly+zJvMmzCGpbgurzDJUuFc=; b=ji8GRUakC0x3
 My3BXG8nqht1NWURYP4Hl6TLrXwU+YQJQtG1BZ97HpUaz0DgR5UWjv9SY44Yy/KwuFpDAejKo3hHh
 2130boS1xvfTbbKSPf/G1NXAijvKgw2nBNq0W+VUokakasfTmtqnI6lDnbLH6PMpRjyuNcgU3nNcv
 rz4rM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Ri-0008Rf-UG; Mon, 28 Oct 2019 14:56:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5632E2740B7F; Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20191025120801.16236-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145637.5632E2740B7F@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 dannym@scratchpost.org, tiwai@suse.com, yuehaibing@huawei.com,
 lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 georgii.staroselskii@emlid.com, wens@csie.org, Mark Brown <broonie@kernel.org>,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sunxi: sun4i-codec: remove unneeded
	semicolon" to the asoc tree
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

   ASoC: sunxi: sun4i-codec: remove unneeded semicolon

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 24d05966b560b88d37d90e64f018af2fed888104 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 25 Oct 2019 20:08:01 +0800
Subject: [PATCH] ASoC: sunxi: sun4i-codec: remove unneeded semicolon

remove unneeded semicolon.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20191025120801.16236-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index ee448d5e07a6..34f3e0be3058 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1442,7 +1442,7 @@ static struct snd_soc_card *sun8i_a23_codec_create_card(struct device *dev)
 	if (!aux_dev.dlc.of_node) {
 		dev_err(dev, "Can't find analog controls for codec.\n");
 		return ERR_PTR(-EINVAL);
-	};
+	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
 	if (!card->dai_link)
@@ -1480,7 +1480,7 @@ static struct snd_soc_card *sun8i_h3_codec_create_card(struct device *dev)
 	if (!aux_dev.dlc.of_node) {
 		dev_err(dev, "Can't find analog controls for codec.\n");
 		return ERR_PTR(-EINVAL);
-	};
+	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
 	if (!card->dai_link)
@@ -1518,7 +1518,7 @@ static struct snd_soc_card *sun8i_v3s_codec_create_card(struct device *dev)
 	if (!aux_dev.dlc.of_node) {
 		dev_err(dev, "Can't find analog controls for codec.\n");
 		return ERR_PTR(-EINVAL);
-	};
+	}
 
 	card->dai_link = sun4i_codec_create_link(dev, &card->num_links);
 	if (!card->dai_link)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
