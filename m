Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F221E528D7
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 12:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B0171607;
	Tue, 25 Jun 2019 11:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B0171607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561456824;
	bh=YTjzkGNAnziVAMRTjHB4FNWU+T1kVEXcYWoZvuZSHR0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=W5sA5rdy3y3L0spAWZ7ptpkp4mcoGQ2eELeSxXL1DJ1xpczlVezrn7Dj2Zy+Avb2m
	 C188H4cpy9C9djJmgDSd3bVASZ8BcKo3ka5jhy+8/l0ZU8FNN1BhbJccxl0LgAPcbj
	 H7NM2Zi+37MEYcJX1pbAVPXMnan0jTN8lgJbZH0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF7FF8974C;
	Tue, 25 Jun 2019 11:54:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D62F89705; Tue, 25 Jun 2019 11:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D72BF89730
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 11:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D72BF89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uKFHQxrV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zx9LoJRA5VJOsRJ+xBMTylTkTEgRWd6viN1kglPW6EM=; b=uKFHQxrVpH8X
 dVpD/orDeKDSABWJfcieBWLyp3ClSXXnpcDhLRzc3zeMTVQo6+BwUWzl3PoKSxu0f1SJDoWumFrT+
 Yklo0nb7sxV1cZK4iRNN5jSsBeYVM/j8t3M1v54LvNzSL+VJ1A15g1ImipVt/yxSKPx+rEmYCVK+W
 Zpba4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfi9G-0004ma-Ha; Tue, 25 Jun 2019 09:53:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 96F5D440046; Mon, 24 Jun 2019 17:32:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
In-Reply-To: <20190621155808.17182-1-enric.balletbo@collabora.com>
X-Patchwork-Hint: ignore
Message-Id: <20190624163213.96F5D440046@finisterre.sirena.org.uk>
Date: Mon, 24 Jun 2019 17:32:13 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Xing Zheng <zhengxing@rock-chips.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: rk3399_gru_sound: Support 32,
	44.1 and 88.2 kHz sample rates" to the asoc tree
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

   ASoC: rk3399_gru_sound: Support 32, 44.1 and 88.2 kHz sample rates

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

From 30b233b1cb4291d39ca08a95566721e8a52e5ee3 Mon Sep 17 00:00:00 2001
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 21 Jun 2019 17:58:08 +0200
Subject: [PATCH] ASoC: rk3399_gru_sound: Support 32, 44.1 and 88.2 kHz sample
 rates

According to the datasheet the max98357a also supports 32, 44.1 and
88.2 kHz sample rate. This support was also introduced recently by
commit fdf34366d324 ("ASoC: max98357a: add missing supported rates").

Actually the machine driver validates the supported sample rates but
this is not really needed because the component driver can all apply
whatever constraints are needed and do their own validation. So, remove
the checks from the machine driver as are not needed at all. This way,
we also support 32, 44.1 and 88.2 kHz sample rates and we get rid of the
errors like the below.

  rk3399-gru-sound sound: rockchip_sound_max98357a_hw_params() doesn't support this sample rate: 44100
  rk3399-gru-sound sound: ASoC: machine hw_params failed: -22

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 879069fc0b94..769d5795919c 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -66,19 +66,7 @@ static int rockchip_sound_max98357a_hw_params(struct snd_pcm_substream *substrea
 	unsigned int mclk;
 	int ret;
 
-	/* max98357a supports these sample rates */
-	switch (params_rate(params)) {
-	case 8000:
-	case 16000:
-	case 48000:
-	case 96000:
-		mclk = params_rate(params) * SOUND_FS;
-		break;
-	default:
-		dev_err(rtd->card->dev, "%s() doesn't support this sample rate: %d\n",
-				__func__, params_rate(params));
-		return -EINVAL;
-	}
+	mclk = params_rate(params) * SOUND_FS;
 
 	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, 0, mclk, 0);
 	if (ret) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
