Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260D49680D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0E71671;
	Tue, 20 Aug 2019 19:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0E71671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323541;
	bh=c4pZApbX8dxLgi4pGrU0jU5aup4R33/TNHXb7znAoHU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uZvQ55JPRpGY7f0+KArID8LK5Xkjgyrqw+Mr0HgJN1BF9IV51k4eaajxl34cUeoEV
	 Z4VTTg4kykZU8WX3nn1TN54UP8HVQbbEZMSwN1t7CDArMs5LB0RRNeuFc5YLnyCoBY
	 Ctqv3iD0Uy0hB/CcDoEEuEfj+r7eIit/yfBX9024=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E524F80722;
	Tue, 20 Aug 2019 19:41:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1AF3F805FB; Tue, 20 Aug 2019 19:41:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 342E7F805FD
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 342E7F805FD
Received: by mail-wm1-f100.google.com with SMTP id k1so3074904wmi.1
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=cv4TUIOWFi+U3SKBDcKMgdYCwyfU6uWRpO1K0GUZKw4=;
 b=BduCGWnOwYT6WV17sEoEw7sXl8oxN3RaOHZ+bdKgn86YYEYYHpRqNgTRc+F6A9GPCX
 w1uYlYmtJFPz6suygAFozOkp8lW79feJep5bb/oHmDXnzeZ2VlA57MAXzjtfzhafitqL
 h26z737xPwl72megX57Z+DCHlL9N2HbqlVQqzYTb0nMK0VyJNRuEtO8MK5S+VQ7ZnN3Z
 gcMh5vVeGm673aTZ0k0lqr/kEi36OvGR7E3TiIMTl2vGDgrSiKzjSCwgz1EeypBH5YCv
 BK1IWwkiNgzgjtNTjfdPDbJHubQ7gSQYvlzvs3UG9UvfvVo6yA8cF8VYpqtTmApVDpwz
 iPbA==
X-Gm-Message-State: APjAAAUHS2S6cCVGEboyUVRU3I93dUFXeTgh5uOXa+jXI0DmVsv6PtOb
 UtTzsqiCK47WkPyWF+dbKUcfjZKYRB5Q5D53ofAXQhLw3vHnnsbwU4yIPOVcUL3lBQ==
X-Google-Smtp-Source: APXvYqx+uYT4jx9ACy29QjlApKPxhCbQv2rES9wXuR4Nh6Dk5Vdpymoo9jTZUubbskZ+TyFuKXsASa8lpkci
X-Received: by 2002:a1c:4d0c:: with SMTP id o12mr1296350wmh.62.1566322867460; 
 Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id x17sm4152wmk.48.2019.08.20.10.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0883-00033C-7z; Tue, 20 Aug 2019 17:41:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A19B12742B4A; Tue, 20 Aug 2019 18:41:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <dcc5deb2eb650758d268bddd20f60ba58856d024.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174106.A19B12742B4A@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:06 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Rework MCLK divider
	calculation" to the asoc tree
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

   ASoC: sun4i-i2s: Rework MCLK divider calculation

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

From 8bcf62b73e5421df94deca95d7d7c152997fe5b4 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:13 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Rework MCLK divider calculation

The MCLK divider calculation is currently computing the ideal divider using
the oversample rate, the sample rate and the parent rate.

However, since we have access to the frequency is supposed to be running at
already, and as it turns out we're using it to compute the oversample rate,
we can just use the ratio between the parent rate and the MCLK rate to
simplify a bit the formula.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/dcc5deb2eb650758d268bddd20f60ba58856d024.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 77b7b81daf74..0a5fb9d4b289 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -240,11 +240,10 @@ static int sun4i_i2s_get_bclk_div(struct sun4i_i2s *i2s,
 }
 
 static int sun4i_i2s_get_mclk_div(struct sun4i_i2s *i2s,
-				  unsigned int oversample_rate,
-				  unsigned int module_rate,
-				  unsigned int sampling_rate)
+				  unsigned long parent_rate,
+				  unsigned long mclk_rate)
 {
-	int div = module_rate / sampling_rate / oversample_rate;
+	int div = parent_rate / mclk_rate;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sun4i_i2s_mclk_div); i++) {
@@ -323,8 +322,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	mclk_div = sun4i_i2s_get_mclk_div(i2s, oversample_rate,
-					  clk_rate, rate);
+	mclk_div = sun4i_i2s_get_mclk_div(i2s, clk_rate, i2s->mclk_freq);
 	if (mclk_div < 0) {
 		dev_err(dai->dev, "Unsupported MCLK divider: %d\n", mclk_div);
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
