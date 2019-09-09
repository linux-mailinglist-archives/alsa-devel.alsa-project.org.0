Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F63FAD6EE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD70F1667;
	Mon,  9 Sep 2019 12:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD70F1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568025373;
	bh=KFZRTUwvf2VUhoX9/cUuqvxgIUhGMC52moVz1Vma5EU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VzzLhwbYVc7Z3rufKNQqgd+OC3PPdGTSHUjPE59sTiQxS2BBLqvriDmqDiJ+vJlLK
	 qpm32q/ehgOov7TKWEZqc26baLSPoHFD+sYTu/EdINdePnMCFxeLnTc7HijY6d6Tfg
	 lGDjC3MmizSwe2SP7EO/CIC+DEDXhuNMJeLzC3TU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE84BF805F6;
	Mon,  9 Sep 2019 12:34:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91CA9F804FD; Mon,  9 Sep 2019 12:34:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A01C7F800A9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01C7F800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="apxj1Txe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vFMKCAQZR978yk1HuUQDZ3xr07qvsRtDUD4d4nadM3Y=; b=apxj1TxebQij
 zsOIlnsH/GCpkba9HlQO50QdbIKfiC1LMbOkkmxTmYxar6Acsy0ma9hPc++wwL3hZLwj7xE314Dtb
 ATtAN9kaJAq9I7xI8SvsFTaZap1lwBOgX75EfccSEwh+ZSHk0vfGmUQaPyjmEHFMB/hqlMb1E91uF
 j15E0=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZo-0001rF-K2; Mon, 09 Sep 2019 10:07:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 03E2FD02D18; Mon,  9 Sep 2019 11:07:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20190906194636.217881-2-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190909100716.03E2FD02D18@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:16 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5677: Remove magic number register
	writes" to the asoc tree
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

   ASoC: rt5677: Remove magic number register writes

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

From 33b773dc9288eb15d3216628d1d2381103d854a9 Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Fri, 6 Sep 2019 12:46:23 -0700
Subject: [PATCH] ASoC: rt5677: Remove magic number register writes

In order to simplify understanding what register values are being
written to the codec for debugging more advanced features (such as
hotwording) it is best to remove magic numbers

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Link: https://lore.kernel.org/r/20190906194636.217881-2-cujomalainey@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index c779dc3474f9..5b6ca3ced13b 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -691,10 +691,12 @@ static void rt5677_set_dsp_mode(struct snd_soc_component *component, bool on)
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
 	if (on) {
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x2, 0x2);
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+			RT5677_PWR_DSP, RT5677_PWR_DSP);
 		rt5677->is_dsp_mode = true;
 	} else {
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1, 0x2, 0x0);
+		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+			RT5677_PWR_DSP, 0x0);
 		rt5677->is_dsp_mode = false;
 	}
 }
@@ -4466,7 +4468,8 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 
 			regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG1,
 				RT5677_LDO1_SEL_MASK | RT5677_LDO2_SEL_MASK,
-				0x0055);
+				5 << RT5677_LDO1_SEL_SFT |
+				5 << RT5677_LDO2_SEL_SFT);
 			regmap_update_bits(rt5677->regmap,
 				RT5677_PR_BASE + RT5677_BIAS_CUR4,
 				0x0f00, 0x0f00);
@@ -4491,7 +4494,9 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 		regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x1, 0x0);
 		regmap_write(rt5677->regmap, RT5677_PWR_DIG1, 0x0000);
 		regmap_write(rt5677->regmap, RT5677_PWR_DIG2, 0x0000);
-		regmap_write(rt5677->regmap, RT5677_PWR_ANLG1, 0x0022);
+		regmap_write(rt5677->regmap, RT5677_PWR_ANLG1,
+			2 << RT5677_LDO1_SEL_SFT |
+			2 << RT5677_LDO2_SEL_SFT);
 		regmap_write(rt5677->regmap, RT5677_PWR_ANLG2, 0x0000);
 		regmap_update_bits(rt5677->regmap,
 			RT5677_PR_BASE + RT5677_BIAS_CUR4, 0x0f00, 0x0000);
@@ -4719,7 +4724,8 @@ static int rt5677_probe(struct snd_soc_component *component)
 
 	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
 			~RT5677_IRQ_DEBOUNCE_SEL_MASK, 0x0020);
-	regmap_write(rt5677->regmap, RT5677_PWR_DSP2, 0x0c00);
+	regmap_write(rt5677->regmap, RT5677_PWR_DSP2,
+			RT5677_PWR_SLIM_ISO | RT5677_PWR_CORE_ISO);
 
 	for (i = 0; i < RT5677_GPIO_NUM; i++)
 		rt5677_gpio_config(rt5677, i, rt5677->pdata.gpio_config[i]);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
