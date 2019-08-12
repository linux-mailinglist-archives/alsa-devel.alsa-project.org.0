Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54F89FAD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F65416B0;
	Mon, 12 Aug 2019 15:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F65416B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616524;
	bh=RpDv2awwxOQzANZlISQVRkpTkelO/7GwhoGSpNH5zdA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RtDpvkFI2MAHe2q06b4UKiKrDclgyY0la+MxPVjOdYoKYHves8WuqvAbfwUBh75+4
	 75FaL3gB2SgTGs05vK29BFcOnu/sweWR1nLL0WQzJS80aPe3hBj3iTVupMjEG7GScL
	 ERKUV2m0FWbCEeTWSnIeGCbbPW+MLLlPsm/wymEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 306DCF80636;
	Mon, 12 Aug 2019 15:22:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3FBEF805F6; Mon, 12 Aug 2019 15:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53F69F805FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F69F805FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J7Tv7Z8j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=H76KdhZ4Gf5rVndPADFlcBa0aKo6mxH58EDMCsxedO8=; b=J7Tv7Z8j1ITe
 6tQjxZ7kIQbhWKCSDd9WUyrR32jVPXhG81pfOY8Ula0t4jO7jxd4Zd0IHCT6N2u7Q1Nuk5yZRtpyn
 dGgXIqYDSHoI7q4WOwPKgSE/9xZxoqBuvVBN2DFl68TCWZUcYOS6k7fTUzIL1gKmn5o8aLETQbWGP
 eBrUs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA5E-0001NP-5b; Mon, 12 Aug 2019 13:09:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AE36E2740CB7; Mon, 12 Aug 2019 14:09:55 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnlg6w9v.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130955.AE36E2740CB7@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:55 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Fontana <rfontana@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Georgii Staroselski i <georgii.staroselskii@emlid.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [alsa-devel] Applied "ASoC: rockchip: rockchip_max98090: use
	snd_soc_dai_link_component for aux_dev" to the asoc tree
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

   ASoC: rockchip: rockchip_max98090: use snd_soc_dai_link_component for aux_dev

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

From 70a6b7bfba9bfd781b8c137f059487017dd385d8 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 8 Aug 2019 14:54:05 +0900
Subject: [PATCH] ASoC: rockchip: rockchip_max98090: use
 snd_soc_dai_link_component for aux_dev

We can use snd_soc_dai_link_component to specify aux_dev.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnlg6w9v.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 1af1147c3da3..7b0c21fa6dca 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -160,7 +160,7 @@ static struct snd_soc_dai_link rk_dailink = {
 static int rk_98090_headset_init(struct snd_soc_component *component);
 
 static struct snd_soc_aux_dev rk_98090_headset_dev = {
-	.name = "Headset Chip",
+	.dlc = COMP_EMPTY(),
 	.init = rk_98090_headset_init,
 };
 
@@ -226,9 +226,9 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 
 	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
 
-	rk_98090_headset_dev.codec_of_node = of_parse_phandle(np,
+	rk_98090_headset_dev.dlc.of_node = of_parse_phandle(np,
 			"rockchip,headset-codec", 0);
-	if (!rk_98090_headset_dev.codec_of_node) {
+	if (!rk_98090_headset_dev.dlc.of_node) {
 		dev_err(&pdev->dev,
 			"Property 'rockchip,headset-codec' missing/invalid\n");
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
