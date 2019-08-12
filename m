Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8AE89FC6
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:33:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E16A16D6;
	Mon, 12 Aug 2019 15:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E16A16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616838;
	bh=Q1N9QWTdm5KPsPbOqhpp3KisV9f3UCDwilb5jLWR+lo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Fh0v+QgY8bSO4t1iq0uMmPGKuG6IhFZVPhT53gKKSoGoxjGBLJKkbu1VYWIl+/kj4
	 dbi5JnCj27unXgNbOKdyCM9cZqnAGuZhgPb7S+OCyzW1ZA/8ynyxxEIHqLcjarn+Do
	 oo7CkdcvjoUyv2kvuQ8QXyC6Av//slsHBLPLcSCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F53F80720;
	Mon, 12 Aug 2019 15:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D1E1F80268; Mon, 12 Aug 2019 15:11:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55666F805AA
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55666F805AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="B4IGWZyR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=AOVZKgXJ5NuIHoVthDACzHa8bcMhGFw4vKaK6ldY/tw=; b=B4IGWZyRSf7W
 6SI00qXsCUYcu205bpzSZAteyoQRdX+xjFapOoX9Mttj90UPap20WXif0FqoTYWmYLhw7wFKaawk8
 NR+G2PJ+Rlos8mu+3eHMkZDv1VNvypvUbzeRQ0F0oltBRF2xy4qzLSsd0QAyRGK1GYjW+MQuoVkXr
 vLOUc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA5D-0001NE-AZ; Mon, 12 Aug 2019 13:09:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AD7932740CB7; Mon, 12 Aug 2019 14:09:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfw46w9g.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130954.AD7932740CB7@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:54 +0100 (BST)
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
Subject: [alsa-devel] Applied "ASoC: samsung: tm2_wm5110: use
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

   ASoC: samsung: tm2_wm5110: use snd_soc_dai_link_component for aux_dev

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

From 124749194ad2e08fbea9c34fa5e2728310bf4486 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 8 Aug 2019 14:54:20 +0900
Subject: [PATCH] ASoC: samsung: tm2_wm5110: use snd_soc_dai_link_component for
 aux_dev

We can use snd_soc_dai_link_component to specify aux_dev.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/87lfw46w9g.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/tm2_wm5110.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index c091033d17ad..bb9910d4cbe2 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -307,7 +307,6 @@ static struct snd_soc_aux_dev tm2_speaker_amp_dev;
 static int tm2_late_probe(struct snd_soc_card *card)
 {
 	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai_link_component dlc = { 0 };
 	unsigned int ch_map[] = { 0, 1 };
 	struct snd_soc_dai *amp_pdm_dai;
 	struct snd_soc_pcm_runtime *rtd;
@@ -334,8 +333,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 		return ret;
 	}
 
-	dlc.of_node = tm2_speaker_amp_dev.codec_of_node;
-	amp_pdm_dai = snd_soc_find_dai(&dlc);
+	amp_pdm_dai = snd_soc_find_dai(&tm2_speaker_amp_dev.dlc);
 	if (!amp_pdm_dai)
 		return -ENODEV;
 
@@ -532,9 +530,9 @@ static int tm2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	card->aux_dev[0].codec_of_node = of_parse_phandle(dev->of_node,
+	card->aux_dev[0].dlc.of_node = of_parse_phandle(dev->of_node,
 							"audio-amplifier", 0);
-	if (!card->aux_dev[0].codec_of_node) {
+	if (!card->aux_dev[0].dlc.of_node) {
 		dev_err(dev, "audio-amplifier property invalid or missing\n");
 		return -EINVAL;
 	}
@@ -623,7 +621,7 @@ static int tm2_probe(struct platform_device *pdev)
 		of_node_put(cpu_dai_node[i]);
 	}
 
-	of_node_put(card->aux_dev[0].codec_of_node);
+	of_node_put(card->aux_dev[0].dlc.of_node);
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
