Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CEF53BA4B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163C717DC;
	Thu,  2 Jun 2022 15:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163C717DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178339;
	bh=WiEB+pSwz1R54EZdCeRTRN3malm2U97zeS+286opCE8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J6OaXnxRF9Vdv5II3I+syfHtR07jt0qIfE3OVMwcsqym/kwkGZ380tgMw1E2AhfAO
	 kRxWQyCs+pbm9DMysw6tdVtODyhC/JrAXW9RrcHU/y9xvS44j+F//yh9q787Iqvd95
	 gLZbj06Y/4ZUllc2h106d0hcw+zGwSHN3D0HlZq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDADCF805B5;
	Thu,  2 Jun 2022 15:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64385F80587; Thu,  2 Jun 2022 15:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2122BF8056F
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2122BF8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LAFfaTG2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69E8BB81ED5;
 Thu,  2 Jun 2022 13:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A51C3411E;
 Thu,  2 Jun 2022 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178020;
 bh=WiEB+pSwz1R54EZdCeRTRN3malm2U97zeS+286opCE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LAFfaTG2t7gGvFiRfXwuxgwyJXfYblP2Kgd3FARKnchmWZmYaNMCg9ovJ7kDuJx8k
 z8BCuQmvJc8VFIGIgv5EXa/uGMFQ7ADpAbC0vPWIrGqgHJ9OZDsw0Z8vk79EhrqaJl
 hAL0jXvKoSkCUcqQQdEdowQzFVDr+5ZafA+uZnbwR4GTj35hpD8+5SvuoObI9mw/sx
 3hhOTtSP/JlJkiEDbHO6sFL8nfqTZkU0u3+XKXV945vSLaHzZOhpKZafxhWSWrnvr2
 G67O5ocDXoa7FvFdpoHCN5hTmt8JiCghxO5Q++eveeA5kS3XVrAYsi+2+QFU7gwkvK
 ULNpyxZiuNk5g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 16/20] ASoC: tlv320aic26: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:12 +0200
Message-Id: <20220602135316.3554400-17-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; h=from:subject;
 bh=WiEB+pSwz1R54EZdCeRTRN3malm2U97zeS+286opCE8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCaFqZZik52oZUnlmAjKIOhQPNLaMvlObaDKW+3
 hGdmKpqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAmgAKCRAk1otyXVSH0Ki5CA
 CEQkGsbvy9ViWI7F0sf9Cc0EhU8ExP1wIkq1W0U1oIZgBAvenu6tvqDhsWAEXqkX8wIMu2UQA/3dm6
 wpWtVuTgxoSTPAN+tebDfV2g/Gsm3ZXxQDBTmAUDV7JW5u7Q6zKJk1n8C3tOlmgApGtn8iC6srkkcg
 gtlxNFRPMPrwV0a68gh7J4/swHaixxl2dglORZRpRamD6zbzqJ96qo+3F3fXj9ETPy3gp4oZW/YtQH
 8rh1LHQk9EgtFu987cwJ/st/FXzgozgOb34J6vGNakLOYUwD1zpetlvS0pVWklQOrKFrY4+kVNJ3HC
 NHC6XhmR0DlCGPQxNsfGSf7y0B50ex
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the tlv320aic26 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic26.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index 077415a57225..1d756bef86ff 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -32,7 +32,7 @@ struct aic26 {
 	struct spi_device *spi;
 	struct regmap *regmap;
 	struct snd_soc_component *component;
-	int master;
+	int clock_provider;
 	int datfm;
 	int mclk;
 
@@ -117,8 +117,8 @@ static int aic26_hw_params(struct snd_pcm_substream *substream,
 	reg = dval << 2;
 	snd_soc_component_write(component, AIC26_REG_PLL_PROG2, reg);
 
-	/* Audio Control 3 (master mode, fsref rate) */
-	if (aic26->master)
+	/* Audio Control 3 (clock provider mode, fsref rate) */
+	if (aic26->clock_provider)
 		reg = 0x0800;
 	if (fsref == 48000)
 		reg = 0x2000;
@@ -178,10 +178,9 @@ static int aic26_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	dev_dbg(&aic26->spi->dev, "aic26_set_fmt(dai=%p, fmt==%i)\n",
 		codec_dai, fmt);
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM: aic26->master = 1; break;
-	case SND_SOC_DAIFMT_CBS_CFS: aic26->master = 0; break;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP: aic26->clock_provider = 1; break;
+	case SND_SOC_DAIFMT_CBC_CFC: aic26->clock_provider = 0; break;
 	default:
 		dev_dbg(&aic26->spi->dev, "bad master\n"); return -EINVAL;
 	}
-- 
2.30.2

