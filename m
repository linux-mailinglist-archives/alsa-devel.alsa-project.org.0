Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CBB6FF87
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B0A41772;
	Mon, 22 Jul 2019 14:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B0A41772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798287;
	bh=7FpvoaLSLG+7mcdvUIYyJf+gnmbtTIOLu0qTOdOVNos=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hTjR/ZdfSytdP1kXmpLqYEOMLP1RfkcYPAyEws2WfzEbHV1de3HuQ5e7/TkMp/JEV
	 svqY4R4Vvu5hfiQJxjGc3M+S0Wl9OMuh3AQuOGKqhySjXdl30XOcAq4ZINItKvx9tF
	 /OjzExTjg7CnKwhcHiboyGoZyvy7+fS+1ByH8AY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00796F803F3;
	Mon, 22 Jul 2019 14:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652FFF80482; Mon, 22 Jul 2019 14:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B1F0F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B1F0F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="N3eIKgRA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4CnDpDpZJPNwW0mah2kzk7QahZvhcnZ5+Jc9o9KgpBM=; b=N3eIKgRApZ/0
 j4nfGFswiNNGwJFHdE4z7Z4jbUq6GLlWBGmc2HoMFQ1TIgeUR2RKVcU+iH4/rVCJwHi5++nReBj1R
 nakqgh08vTW4WHEUrreV1CIQe1OGTRuOo48LDdbWTA7UZdTzHQV7IPoMll0HZCW/BQpCSXRumiwOU
 nrRSk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKR-0007cF-9I; Mon, 22 Jul 2019 12:22:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7C2D627416CB; Mon, 22 Jul 2019 13:22:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20190719063235.18757-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122206.7C2D627416CB@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:06 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1308: simplify the EFUSE read
	function" to the asoc tree
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

   ASoC: rt1308: simplify the EFUSE read function

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

From 7f8272c64b931728549d45147cc53edebbb5b090 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Fri, 19 Jul 2019 14:32:35 +0800
Subject: [PATCH] ASoC: rt1308: simplify the EFUSE read function

The rt1308_efuse function contains many redundant settings.
We remove the redundant settings and the function still works.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20190719063235.18757-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index d673506c7c39..19d255e01827 100755
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -808,33 +808,11 @@ static void rt1308_efuse(struct rt1308_priv *rt1308)
 {
 	regmap_write(rt1308->regmap, RT1308_RESET, 0);
 
-	regmap_write(rt1308->regmap, RT1308_POWER, 0xff371600);
-	regmap_write(rt1308->regmap, RT1308_CLK_1, 0x52100000);
-	regmap_write(rt1308->regmap, RT1308_I2C_I2S_SDW_SET, 0x01014005);
-	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x227f5501);
-	regmap_write(rt1308->regmap, RT1308_PADS_1, 0x50150505);
-	regmap_write(rt1308->regmap, RT1308_VREF, 0x18100000);
-	regmap_write(rt1308->regmap, RT1308_IV_SENSE, 0x87010000);
-	regmap_write(rt1308->regmap, RT1308_DUMMY_REG, 0x00000200);
-	regmap_write(rt1308->regmap, RT1308_SIL_DET, 0x61c30000);
-	regmap_write(rt1308->regmap, RT1308_CLK_DET, 0x03700000);
-	regmap_write(rt1308->regmap, RT1308_SINE_TONE_GEN_1, 0x50022f00);
 	regmap_write(rt1308->regmap, RT1308_POWER_STATUS, 0x01800000);
-	regmap_write(rt1308->regmap, RT1308_DC_CAL_2, 0x00ffff00);
-	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x607e5501);
-
-	regmap_write(rt1308->regmap, RT1308_CLK_2, 0x0060e000);
-	regmap_write(rt1308->regmap, RT1308_EFUSE_1, 0x04fe0f00);
 	msleep(100);
 	regmap_write(rt1308->regmap, RT1308_EFUSE_1, 0x44fe0f00);
 	msleep(20);
 	regmap_write(rt1308->regmap, RT1308_PVDD_OFFSET_CTL, 0x10000000);
-
-	regmap_write(rt1308->regmap, RT1308_POWER_STATUS, 0x00800000);
-	regmap_write(rt1308->regmap, RT1308_POWER, 0x0);
-	regmap_write(rt1308->regmap, RT1308_CLK_1, 0x52000000);
-	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x227f5501);
-	regmap_write(rt1308->regmap, RT1308_SINE_TONE_GEN_1, 0x10022f00);
 }
 
 static int rt1308_i2c_probe(struct i2c_client *i2c,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
