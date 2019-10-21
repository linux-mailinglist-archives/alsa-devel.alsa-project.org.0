Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FCFDF4B6
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 20:05:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385DA1672;
	Mon, 21 Oct 2019 20:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385DA1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571681158;
	bh=GYPtpQdRr6ZBAd4WTi8gKCUtcdHk2KgGdelClhC2a7k=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RySyCX+Zo0945Tj1KwwMoS9h3dnQfx5CWJ0KRh9c6Gj7MKUCHt4MBTkSm0fh5R5KO
	 MU2qgHEiAgQfbZM3k7b80lY2pCnm4wl9FHdkIQ6VtluegMgJPqu5KlJRmy2OnIaEE/
	 wJSNK/vcWFm44ad1Oe4FwFWKf0xIMzK+r/hao1fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4517F80637;
	Mon, 21 Oct 2019 20:01:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF8C0F80393; Mon, 21 Oct 2019 20:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4193FF803A6
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 20:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4193FF803A6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ppfGIhq/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=NBKg7z/RWZPm9A3Z0ZyyZEqHwnPNJzRElLBLEbH7hrs=; b=ppfGIhq/ufNJ
 R2esk6NDpi5I8o/Z//GhcbYeNbpsuz4J6SzMaUwcPS9CX7DCG6nxq+8RXLXiKDG7gQFgvA75714Zz
 gCfs3HlRbDUP7EojhMazCdZZe+yx08O5qH/c3Sk4HgR2CgtTqGyO0TAFq3uODGQiLGhFi70Zy3xzm
 J7Q1Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMbz5-0004bq-HG; Mon, 21 Oct 2019 18:00:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E69772741DD1; Mon, 21 Oct 2019 19:00:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20191020153007.206070-1-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Message-Id: <20191021180046.E69772741DD1@ypsilon.sirena.org.uk>
Date: Mon, 21 Oct 2019 19:00:46 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] Applied "ASoC: msm8916-wcd-analog: Fix RX1 selection
	in RDAC2 MUX" to the asoc tree
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

   ASoC: msm8916-wcd-analog: Fix RX1 selection in RDAC2 MUX

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

From 9110d1b0e229cebb1ffce0c04db2b22beffd513d Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Sun, 20 Oct 2019 17:30:06 +0200
Subject: [PATCH] ASoC: msm8916-wcd-analog: Fix RX1 selection in RDAC2 MUX

According to the PM8916 Hardware Register Description,
CDC_D_CDC_CONN_HPHR_DAC_CTL has only a single bit (RX_SEL)
to switch between RX1 (0) and RX2 (1). It is not possible to
disable it entirely to achieve the "ZERO" state.

However, at the moment the "RDAC2 MUX" mixer defines three possible
values ("ZERO", "RX2" and "RX1"). Setting the mixer to "ZERO"
actually configures it to RX1. Setting the mixer to "RX1" has
(seemingly) no effect.

Remove "ZERO" and replace it with "RX1" to fix this.

Fixes: 585e881e5b9e ("ASoC: codecs: Add msm8916-wcd analog codec")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20191020153007.206070-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 667e9f73aba3..e3d311fb510e 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -306,7 +306,7 @@ struct pm8916_wcd_analog_priv {
 };
 
 static const char *const adc2_mux_text[] = { "ZERO", "INP2", "INP3" };
-static const char *const rdac2_mux_text[] = { "ZERO", "RX2", "RX1" };
+static const char *const rdac2_mux_text[] = { "RX1", "RX2" };
 static const char *const hph_text[] = { "ZERO", "Switch", };
 
 static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
@@ -321,7 +321,7 @@ static const struct soc_enum adc2_enum = SOC_ENUM_SINGLE_VIRT(
 
 /* RDAC2 MUX */
 static const struct soc_enum rdac2_mux_enum = SOC_ENUM_SINGLE(
-			CDC_D_CDC_CONN_HPHR_DAC_CTL, 0, 3, rdac2_mux_text);
+			CDC_D_CDC_CONN_HPHR_DAC_CTL, 0, 2, rdac2_mux_text);
 
 static const struct snd_kcontrol_new spkr_switch[] = {
 	SOC_DAPM_SINGLE("Switch", CDC_A_SPKR_DAC_CTL, 7, 1, 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
