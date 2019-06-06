Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E473818C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 01:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60E6D1735;
	Fri,  7 Jun 2019 01:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60E6D1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559862425;
	bh=wWGKo6FKR3CxdnqMFnX7PPr9i2YuqwWcdcOCq2swRnA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iAUk92FSaPMx5q4mvdYg7uiuIyIrxuKfaO8Y1xQkXrRj1CWiLSHbyCPkTqGBVNAkr
	 OSLHMWBoyvejyJy50bM2ZbjQgzuwl0Htxro+UftRuzk8Q+SkX1oNZqoMGdg4Dr2c9H
	 bcf440Oflaf+a+q+gS7ZB+6knEvHlvsm9I0UdSi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C7CF89A79;
	Thu,  6 Jun 2019 23:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADCA9F898BA; Thu,  6 Jun 2019 23:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B927F89818
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B927F89818
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mx/NcQup"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=k2RX91Coy2SDt4/O7/E1BfbsDbyJuKvIgUb/Z6AxZRc=; b=mx/NcQupPmdJ
 wDeuLnrBd5ZpSq8QVio42M94LLgzX748YCrvAa62DrR2pobel+FeZz43OFSr+Mm7r3AsO/nSp6BY2
 ykmZ+nmlVYLv25Ux6hvp5WsplCshkd3t1Bnl0ftnovkG5Pbw0UZm+Cu0YmWB7MmRZD2ymcHIIHcPb
 HibO8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzup-0007VE-Ip; Thu, 06 Jun 2019 21:27:19 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 20FEC440046; Thu,  6 Jun 2019 22:27:19 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20190606062232.3753-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212719.20FEC440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:19 +0100 (BST)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 mingjane_hsieh@realtek.com, flove@realtek.com, hychao@google.com
Subject: [alsa-devel] Applied "ASoC: rt1011: fix warning reported by kbuild
	test robot and minor issue" to the asoc tree
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

   ASoC: rt1011: fix warning reported by kbuild test robot and minor issue

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

From 64429a8711e121e5d5d93d970c5ed3492332dd18 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 6 Jun 2019 14:22:32 +0800
Subject: [PATCH] ASoC: rt1011: fix warning reported by kbuild test robot and
 minor issue

This patch fixes following issues:
- warning: this decimal constant is unsigned only in ISO C90
- sparse: incorrect type in assignment
- check if value.integer.value is zero for "R0 Load Mode" control

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 3a0ae80c5ee0..5605b660f4bf 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1145,8 +1145,8 @@ static int rt1011_bq_drc_coeff_get(struct snd_kcontrol *kcontrol,
 	bq_drc_info = rt1011->bq_drc_params[mode_idx];
 
 	for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
-		params[i].reg = cpu_to_le16(bq_drc_info[i].reg);
-		params[i].val = cpu_to_le16(bq_drc_info[i].val);
+		params[i].reg = bq_drc_info[i].reg;
+		params[i].val = bq_drc_info[i].val;
 	}
 
 	return 0;
@@ -1187,8 +1187,8 @@ static int rt1011_bq_drc_coeff_put(struct snd_kcontrol *kcontrol,
 	pr_info("%s, id.name=%s, mode_idx=%d\n", __func__,
 		ucontrol->id.name, mode_idx);
 	for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
-		bq_drc_info[i].reg =	le16_to_cpu(params[i].reg);
-		bq_drc_info[i].val =	le16_to_cpu(params[i].val);
+		bq_drc_info[i].reg = params[i].reg;
+		bq_drc_info[i].val = params[i].val;
 	}
 
 	for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
@@ -1284,6 +1284,9 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 	if (!component->card->instantiated)
 		return 0;
 
+	if (ucontrol->value.integer.value[0] == 0)
+		return -EINVAL;
+
 	dev = regmap_get_device(rt1011->regmap);
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
 		rt1011->r0_reg = ucontrol->value.integer.value[0];
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
