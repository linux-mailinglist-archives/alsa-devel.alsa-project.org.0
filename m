Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26D6FF8E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:25:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F00176F;
	Mon, 22 Jul 2019 14:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F00176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798333;
	bh=iMJeQrggiNjHNySnRb98iyryD99aVLaasRZJt1gyjxI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=o7i2O1vfuq8UucXfAJIHhhGC7i2xhdhmeieNK27hm7srlebVA8tncCl9I2bu9JV3g
	 AwknfxL9LzpasgF/xtK5JR67ett1mKrJQ4YPOalA50SSnPjpT2Lb7RISN/GnpIAMc0
	 PgHKTo7/O6tycpzMlc9t6SsXwT/kzJ7Gekc7JTAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3AAF8045F;
	Mon, 22 Jul 2019 14:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B6AFF8048F; Mon, 22 Jul 2019 14:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D58BF803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D58BF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dM9N4vrH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=0z6U09rUZLECl28yvm3CexCUHnSb2sEGRkEG6GbfCPE=; b=dM9N4vrHnRKf
 plA2tnQIkv+7kDgMz7isQk0oLs+mHmOfGRVJVbghqAVSjK3ZLKq4qDDRwwl155fzafR7aM0sb/4pI
 F7LtADCLGCoWF4ibxFMuOaSwduO9R6arD+HzCmbboIlyqLRB7EAI0MvZ/cxDzgHwKy9RDFWMTo5aP
 jHHng=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKQ-0007c8-QT; Mon, 22 Jul 2019 12:22:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 95EA72742C1A; Mon, 22 Jul 2019 13:22:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
In-Reply-To: <20190719180558.11459-1-enric.balletbo@collabora.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122205.95EA72742C1A@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:05 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
Subject: [alsa-devel] Applied "SoC: rockchip-max98090: Remove MICBIAS as
	supply of input pin IN34" to the asoc tree
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

   SoC: rockchip-max98090: Remove MICBIAS as supply of input pin IN34

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

From 03cc2c22a711080790c5dcb546dd073fe38add05 Mon Sep 17 00:00:00 2001
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 19 Jul 2019 20:05:58 +0200
Subject: [PATCH] SoC: rockchip-max98090: Remove MICBIAS as supply of input pin
 IN34

Commit ec0d23b295b9 ("ASoC: rockchip-max98090: Fix the Headset Mic
route.") moved the MICBIAS widget to supply Headset Mic but forget to
remove the MICBIAS widget to supply IN34 which is not really needed, so
remove that path so we have:

   IN34 <==== Headset MIC <==== MICBIAS

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Link: https://lore.kernel.org/r/20190719180558.11459-1-enric.balletbo@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index c5fc24675a33..d1c907631c2d 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -45,7 +45,6 @@ static const struct snd_soc_dapm_widget rk_dapm_widgets[] = {
 
 static const struct snd_soc_dapm_route rk_audio_map[] = {
 	{"IN34", NULL, "Headset Mic"},
-	{"IN34", NULL, "MICBIAS"},
 	{"Headset Mic", NULL, "MICBIAS"},
 	{"DMICL", NULL, "Int Mic"},
 	{"Headphone", NULL, "HPL"},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
