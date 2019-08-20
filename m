Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F915967F9
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:46:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 985B11666;
	Tue, 20 Aug 2019 19:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 985B11666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323215;
	bh=oeJyvQ5M0kYjCzqL1Jm1VppvVTj2mSQbNZt7l/iM0zM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bjWcy2o/hkKl8SZN+vr+tZHRlCMUw/1Ind49YFezLfNZwn/95EOQCM4B4d7YDfPps
	 WSfIl2/Fgww9IxKPJ4TcUvvyumc6EkcgBreuJ219u9Il15wnoY4ElKjutFPo+X58yr
	 6lMTpcp6RXvIwmM/g5jkDRvSOeMhAzjuN2MmSB4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08594F80642;
	Tue, 20 Aug 2019 19:41:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7C44F800BF; Tue, 20 Aug 2019 19:41:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2115F805E1
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2115F805E1
Received: by mail-wr1-f97.google.com with SMTP id z11so13269675wrt.4
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=rEm//JA9Ode+pkJQsVxasRJPsyZWnLEZfrP5SRv2v4A=;
 b=MxnV7V9zBplU+bmSLapS4hT+XQ9zZAevnncwCZCDO/ShGp9DyZQICRcz6omPSLwd33
 K9roi7R9YH/d2H0bzCpGimogUpE2fBC5XSbUx+kdW0Zsj405fyWJ5BVYNuupPwvYjfLc
 YYOnnTzhE34pQ9nxHUC7YrFi83Qru/f28xHVRKIKh1/+QLFKsNUvcB6c7lDyxDByZGvZ
 0BNqmfkTkktcBMUTBpQT8MOugbzeZaSGA36H+KtI9XNtEX0MbWCvwlPUWXfVgpn5tXxW
 IfGfXvaZnDKAzTZt+yKL9z+WCQOQEiOqTDBSvIjKX5C+99G1bdEzAMKrFw0CXskj8z8W
 qWRg==
X-Gm-Message-State: APjAAAU+5OuSYpxrNQOJ4qpX4pMPuCXa84k8k/NU7I2CwZdrvcLpGVRp
 s24BEhCsq84xLQxlnKsM33Yrzi1VE6UjvMIKtLhbKl/8D/+dDae8vD+ZXRPXEddlNQ==
X-Google-Smtp-Source: APXvYqx2NvCEqcvM7LJG+fzCYUWBys0UGZitIliEf8ce3MjbJm4BQPX76bNDLkREPboSx+tHL788Fsk8liDZ
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr36897292wrw.151.1566322864978; 
 Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id a4sm313012wro.12.2019.08.20.10.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0880-00032I-L5; Tue, 20 Aug 2019 17:41:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 006C12743150; Tue, 20 Aug 2019 18:41:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <48887cf7abfaab6597db233b24d7a088a913e48a.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174104.006C12743150@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:03 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Pass the channels number as
	an argument" to the asoc tree
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

   ASoC: sun4i-i2s: Pass the channels number as an argument

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

From 0083a507a78fdfa868acc0709408b59e72488a61 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:25 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Pass the channels number as an argument

The channels number have been hardcoded to 2 so far, while the controller
supports more than that.

Remove the instance where it has been hardcoded to compute the BCLK
divider, and pass it through as an argument to ease further support of more
channels.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/48887cf7abfaab6597db233b24d7a088a913e48a.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 4c636f1cf7dc..6b172dfbc25d 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -238,10 +238,11 @@ static unsigned long sun8i_i2s_get_bclk_parent_rate(const struct sun4i_i2s *i2s)
 static int sun4i_i2s_get_bclk_div(struct sun4i_i2s *i2s,
 				  unsigned long parent_rate,
 				  unsigned int sampling_rate,
+				  unsigned int channels,
 				  unsigned int word_size)
 {
 	const struct sun4i_i2s_clk_div *dividers = i2s->variant->bclk_dividers;
-	int div = parent_rate / sampling_rate / word_size / 2;
+	int div = parent_rate / sampling_rate / word_size / channels;
 	int i;
 
 	for (i = 0; i < i2s->variant->num_bclk_dividers; i++) {
@@ -286,6 +287,7 @@ static bool sun4i_i2s_oversample_is_valid(unsigned int oversample)
 
 static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 				  unsigned int rate,
+				  unsigned int channels,
 				  unsigned int word_size)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -333,7 +335,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 
 	bclk_parent_rate = i2s->variant->get_bclk_parent_rate(i2s);
 	bclk_div = sun4i_i2s_get_bclk_div(i2s, bclk_parent_rate,
-					  rate, word_size);
+					  rate, channels, word_size);
 	if (bclk_div < 0) {
 		dev_err(dai->dev, "Unsupported BCLK divider: %d\n", bclk_div);
 		return -EINVAL;
@@ -488,7 +490,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_field_write(i2s->field_fmt_sr, sr);
 
 	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
-				      params_width(params));
+				      2, params_width(params));
 }
 
 static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
