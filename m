Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4432FFE1F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 09:29:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881B21AC7;
	Fri, 22 Jan 2021 09:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881B21AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611304141;
	bh=SuTpL6HOX4xqG5ds5yc9fFelsZy6CbKFigq5L0eYoEI=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQ2DKcSdSysEPw9HyTC0q9AjyZ67lJ19s/7gaVMwbueU9NHl7AM70JQY7rpppWoEt
	 Yw+hl2089nTyaffMEVOSW6+1RiS72MqC2/pNHj3AdQ/o1P62iNH7tU5OKJwXIOIffL
	 DgxRcWTrWYyquVmtiecqtVxzj33iUAEvDwjbrePY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6354FF8015B;
	Fri, 22 Jan 2021 09:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B44F8016E; Fri, 22 Jan 2021 09:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from omr2.mail.isx.net.nz (omr2.mail.isx.net.nz [111.65.230.131])
 (using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C897BF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 09:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C897BF8015B
Received: from [10.36.0.146] (unknown [203.173.181.15])
 (Authenticated sender: eliot@blennerhassett.gen.nz)
 by omr2.mail.isx.net.nz (Postfix) with ESMTPA id 870FF937FCF;
 Fri, 22 Jan 2021 21:27:08 +1300 (NZDT)
Subject: [PATCH] ASoC: ak4458: correct reset polarity
From: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
To: Mark Brown <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <935820c1-0c96-6c85-26e7-ce0b741737dc@blennerhassett.gen.nz>
 <20210120190759.GH6794@sirena.org.uk>
 <84e36db4-b78d-de1b-3575-62b19035ea43@blennerhassett.gen.nz>
Message-ID: <ce650f47-4ff6-e486-7846-cc3d033f3601@blennerhassett.gen.nz>
Date: Fri, 22 Jan 2021 21:27:08 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <84e36db4-b78d-de1b-3575-62b19035ea43@blennerhassett.gen.nz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: daniel.baluta@nxp.com, kuninori.morimoto.gx@renesas.com,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Reset (aka power off) happens when the reset gpio is made active.
Change function name to ak4458_reset to match devicetree property "reset-gpios"

Signed-off-by: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
---
 sound/soc/codecs/ak4458.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 1010c9ee2e8..472caad1701 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -595,18 +595,10 @@ static struct snd_soc_dai_driver ak4497_dai = {
 	.ops = &ak4458_dai_ops,
 };
 
-static void ak4458_power_off(struct ak4458_priv *ak4458)
+static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 {
 	if (ak4458->reset_gpiod) {
-		gpiod_set_value_cansleep(ak4458->reset_gpiod, 0);
-		usleep_range(1000, 2000);
-	}
-}
-
-static void ak4458_power_on(struct ak4458_priv *ak4458)
-{
-	if (ak4458->reset_gpiod) {
-		gpiod_set_value_cansleep(ak4458->reset_gpiod, 1);
+		gpiod_set_value_cansleep(ak4458->reset_gpiod, active);
 		usleep_range(1000, 2000);
 	}
 }
@@ -620,7 +612,7 @@ static int ak4458_init(struct snd_soc_component *component)
 	if (ak4458->mute_gpiod)
 		gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
 
-	ak4458_power_on(ak4458);
+	ak4458_reset(ak4458, false);
 
 	ret = snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
 			    0x80, 0x80);   /* ACKS bit = 1; 10000000 */
@@ -650,7 +642,7 @@ static void ak4458_remove(struct snd_soc_component *component)
 {
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 
-	ak4458_power_off(ak4458);
+	ak4458_reset(ak4458, true);
 }
 
 #ifdef CONFIG_PM
@@ -660,7 +652,7 @@ static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
 
 	regcache_cache_only(ak4458->regmap, true);
 
-	ak4458_power_off(ak4458);
+	ak4458_reset(ak4458, true);
 
 	if (ak4458->mute_gpiod)
 		gpiod_set_value_cansleep(ak4458->mute_gpiod, 0);
@@ -685,8 +677,8 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
 	if (ak4458->mute_gpiod)
 		gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
 
-	ak4458_power_off(ak4458);
-	ak4458_power_on(ak4458);
+	ak4458_reset(ak4458, true);
+	ak4458_reset(ak4458, false);
 
 	regcache_cache_only(ak4458->regmap, false);
 	regcache_mark_dirty(ak4458->regmap);

