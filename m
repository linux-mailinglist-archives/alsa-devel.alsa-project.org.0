Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AACA89F9C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E0A16BE;
	Mon, 12 Aug 2019 15:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E0A16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616352;
	bh=MJAuLYrrBHKErwvwpvsj15FyxTcEhmVBZFJBCu40BJo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Wuka4pThynR9KMxK6epJqbGAuks+aZhxkSTHxTaGiZDFL7L3L9tuJWjknD4xE8XQg
	 zyHmf9MIM6fBM5QrtTcY3JixdYkmzt8nVE5FkJBQDL0J1sLwNxMtM9r+bea5mBUxGj
	 RWcWITDXWWPH72kI3bYFAd7zJz+Ol19pKz9PtBV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89278F8058C;
	Mon, 12 Aug 2019 15:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5E1F805FA; Mon, 12 Aug 2019 15:10:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F18D4F805FA
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18D4F805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BecSJ5Vw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YKMzpdBMrXmiwUVQMAY4qsPu0PCTqhRZTwiIYvzMVzY=; b=BecSJ5VwgpQs
 zx5FLue0WInvelbJH6BW8DXfdHT+MK0S3uWJu8tWHfU+V+aMht4EpgBge78AFEuiPluU1581ZSXbF
 5ZY1oLlK/nIrub75JGxy9oaMwEov05NX0ns+8XKkUlEiHn6sKTZgjG4uJg/P0ZK+ZTyx6KaMimyoN
 iUNns=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA5E-0001NU-J1; Mon, 12 Aug 2019 13:09:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 058832740CBD; Mon, 12 Aug 2019 14:09:55 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r25w6wa1.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130956.058832740CBD@ypsilon.sirena.org.uk>
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
Subject: [alsa-devel] Applied "ASoC: meson: axg-card: use
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

   ASoC: meson: axg-card: use snd_soc_dai_link_component for aux_dev

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

From a73b522d4b570ee41754990e81f6f4e849af1af9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 8 Aug 2019 14:53:59 +0900
Subject: [PATCH] ASoC: meson: axg-card: use snd_soc_dai_link_component for
 aux_dev

We can use snd_soc_dai_link_component to specify aux_dev.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r25w6wa1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 14a8321744da..6283e5025548 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -124,7 +124,7 @@ static void axg_card_clean_references(struct axg_card *priv)
 
 	if (card->aux_dev) {
 		for (i = 0; i < card->num_aux_devs; i++)
-			of_node_put(card->aux_dev[i].codec_of_node);
+			of_node_put(card->aux_dev[i].dlc.of_node);
 	}
 
 	kfree(card->dai_link);
@@ -158,9 +158,9 @@ static int axg_card_add_aux_devices(struct snd_soc_card *card)
 	card->num_aux_devs = num;
 
 	for (i = 0; i < card->num_aux_devs; i++, aux++) {
-		aux->codec_of_node =
+		aux->dlc.of_node =
 			of_parse_phandle(node, "audio-aux-devs", i);
-		if (!aux->codec_of_node)
+		if (!aux->dlc.of_node)
 			return -EINVAL;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
