Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF1AD8F1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 14:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA851669;
	Mon,  9 Sep 2019 14:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA851669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568031905;
	bh=dM/fnvCELkQkJUFpl3c7iYCh3//gPX1aS71CghkrN8c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LKcIQ8SWzPxOrYg4PZV8kX1M4Pfl2lodHiHvdLL++lkuAf7JcZnZN1lBtVSnOkaPS
	 CfAHTUXrpp+7wDfyHphw479Q6YsKodjgIznwEqmjl1oYYl0HjDpvjZqMb+UVaY8TT6
	 RBp97Qz8Tv3KPSK34G4cpzuJGjww5WJuSmxvjXcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74693F800A9;
	Mon,  9 Sep 2019 14:23:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6483F80323; Mon,  9 Sep 2019 14:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A067F800A9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 14:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A067F800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nuWrbdac"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=gYdHnx7Nr9MWONl7J9r7JSfdbIqXZJZeBwf+664C/f4=; b=nuWrbdacneIA
 HuzZOqw0iUssG+at54HTKWIqjbsQTvSKHodWb/KJyw5hYOX1lIbFh/XLAoY1PWr2+y9JLp8RIR8yB
 RocM3r+DRVzAKqzu/gex799LMmLAyZT71ha4JNgQZKzrfcSWGFnx3KpC/BcznXXUmz4S1BWvLE5PD
 DJfA0=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7IhN-0002In-T4; Mon, 09 Sep 2019 12:23:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 49372D02D4C; Mon,  9 Sep 2019 13:23:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ben Zhang <benzh@chromium.org>
In-Reply-To: <20190906194636.217881-3-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190909122313.49372D02D4C@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 13:23:13 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] Applied "ASoC: rt5677: keep analog power register at
	SND_SOC_BIAS_OFF" to the asoc tree
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

   ASoC: rt5677: keep analog power register at SND_SOC_BIAS_OFF

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

From dfe58f2011595e7512bde9dffbd0abfc3a736ab7 Mon Sep 17 00:00:00 2001
From: Ben Zhang <benzh@chromium.org>
Date: Fri, 6 Sep 2019 12:46:24 -0700
Subject: [PATCH] ASoC: rt5677: keep analog power register at SND_SOC_BIAS_OFF

Instead of clearing RT5677_PWR_ANLG2 (MX-64h) to 0 at SND_SOC_BIAS_OFF,
we only clear the RT5677_PWR_CORE bit which is set at SND_SOC_BIAS_PREPARE.
MICBIAS control bits are left unchanged.

This fixed the bug where if MICBIAS1 widget is forced on, MICBIAS
control bits will be cleared at suspend and never turned back on again,
since DAPM thinks the widget is always on.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Link: https://lore.kernel.org/r/20190906194636.217881-3-cujomalainey@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 5b6ca3ced13b..315a3d39bc09 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4493,11 +4493,11 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_OFF:
 		regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x1, 0x0);
 		regmap_write(rt5677->regmap, RT5677_PWR_DIG1, 0x0000);
-		regmap_write(rt5677->regmap, RT5677_PWR_DIG2, 0x0000);
 		regmap_write(rt5677->regmap, RT5677_PWR_ANLG1,
 			2 << RT5677_LDO1_SEL_SFT |
 			2 << RT5677_LDO2_SEL_SFT);
-		regmap_write(rt5677->regmap, RT5677_PWR_ANLG2, 0x0000);
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG2,
+			RT5677_PWR_CORE, 0);
 		regmap_update_bits(rt5677->regmap,
 			RT5677_PR_BASE + RT5677_BIAS_CUR4, 0x0f00, 0x0000);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
