Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F341EB14D
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 14:36:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EB0D1F49;
	Thu, 31 Oct 2019 14:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EB0D1F49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572528974;
	bh=a1k2Qy11v7OIfs0xPqtZTrXuQSnpF8TwQwFzXQKjhds=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ktqV521mm16aTwL1VU1Gvyq+KEaboYbehwyfsXM+/ItISKZs5BH3lLk25EpOA2M2h
	 5gaNyFwpfyKb11m0N/cMrHBLLMJSm5Crz4NY2yRQfftAL76u0GKjOjNHLHN4l/tGot
	 O63KTS69rcMrmj2RAOYLeZ9p3E3hrv15eVWQhlWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 811C6F805FD;
	Thu, 31 Oct 2019 14:33:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F4E3F8015A; Thu, 31 Oct 2019 14:33:39 +0100 (CET)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A618F8036C
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 14:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A618F8036C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AJBAWICG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=EZPBHIwFt6RWqzzzibj/rKupl1br5ijmO9r5jrR9awQ=; b=AJBAWICG2W1b
 Uu7HUZ1hNEVxnW2OGGxCjbd7LWdT+QbyTUQvh5TQFctYLqb+3cqujGmDzQb7prAaqwhhuYg+pHlRY
 oO+QXspH9ivCCuIDeHUKDQue7r/O6ENkRX/n4Cx/00a7eqDaPkZMqJ039JN7gT5UfYL0N8/GDbVam
 J2U/Y=;
Received: from [91.217.168.176] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iQAQK-0007oS-D6; Thu, 31 Oct 2019 13:23:36 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 14521D020AA; Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191031115446.21108-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191031132336.14521D020AA@fitzroy.sirena.org.uk>
Date: Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: some minor changes to improve
	readability" to the asoc tree
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

   ASoC: rt1011: some minor changes to improve readability

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

From 683b85152e3606f4d3145b99e2df4d6eaeb758d0 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 31 Oct 2019 19:54:46 +0800
Subject: [PATCH] ASoC: rt1011: some minor changes to improve readability

There is no other code use the RT1011_INIT_REG_LEN definition,
except rt1011_reg_init().
Hence, we remove it and fix the typo.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191031115446.21108-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index f2c581b66d32..2552073e54ce 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -61,7 +61,6 @@ static const struct reg_sequence init_list[] = {
 	{ RT1011_DAC_SET_1, 0xe702 },
 	{ RT1011_DAC_SET_3, 0x2004 },
 };
-#define RT1011_INIT_REG_LEN ARRAY_SIZE(init_list)
 
 static const struct reg_default rt1011_reg[] = {
 	{0x0000, 0x0000},
@@ -684,7 +683,8 @@ static int rt1011_reg_init(struct snd_soc_component *component)
 {
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 
-	regmap_multi_reg_write(rt1011->regmap, init_list, RT1011_INIT_REG_LEN);
+	regmap_multi_reg_write(rt1011->regmap,
+		init_list, ARRAY_SIZE(init_list));
 	return 0;
 }
 
@@ -1773,7 +1773,8 @@ static int rt1011_set_component_pll(struct snd_soc_component *component,
 
 	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
 	if (ret < 0) {
-		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		dev_err(component->dev, "Unsupported input clock %d\n",
+			freq_in);
 		return ret;
 	}
 
@@ -2384,7 +2385,7 @@ static int rt1011_i2c_probe(struct i2c_client *i2c,
 
 	rt1011 = devm_kzalloc(&i2c->dev, sizeof(struct rt1011_priv),
 				GFP_KERNEL);
-	if (rt1011 == NULL)
+	if (!rt1011)
 		return -ENOMEM;
 
 	i2c_set_clientdata(i2c, rt1011);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
