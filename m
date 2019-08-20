Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC1296820
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 628B61686;
	Tue, 20 Aug 2019 19:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 628B61686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323846;
	bh=sFQ3giAVN8VAJAvK4pmdhjgtkOrE4opKcwCpO9QQYyQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iyFnD0M7l3KnSzqwaVDzvY01pPyS9OUJbZdRsOCZqw1V0dX2ngizetfIEFlIWloUo
	 KSMdfIThwRKE9nDUGiZGjxIR1Rlaohsp/Nt+6Qik23bcjM/XKut2ViyL1mjwfUpBy0
	 komyooeWla3xrK0biwnjFaRJko+DXuhZEdrLCn1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA16F807CA;
	Tue, 20 Aug 2019 19:41:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F4DCF80677; Tue, 20 Aug 2019 19:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF0D1F805FC
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0D1F805FC
Received: by mail-wr1-f97.google.com with SMTP id c3so13276570wrd.7
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=yCDyVLCiFyaHGZVMltg2SfBdT7xmop4SmEPuiPFwdPM=;
 b=j9x0PRHTKyO411mfAflalbaDbAJjPWWQYQi3f2wG3QunKA3X2xqXcN/ta0PCT0AJnh
 Nq72laC84zkdOP0O34VjSx3xkIbJ0MPezyZWLjwbkjDBL4PgXvPVpixIrwxyaQULZ0vz
 8zPqn3As2NMf4oR9MneymQZTEXTrRefv000hXk/OKS8I0QFX9HwEBfOpqkfY6ykKfUib
 HzLK0bZT2pT8KO9a1TgZWqI05lCSv3vr5S975BkWDYvQOXvPlHTK+sDLOQAkOddVZ60r
 +K62YMslniliRgRuanTLBy13Ds/g5BbbvCQ8xLEQKBCeCq99aUKOXvO5/TkN0f2vrKW2
 AjFA==
X-Gm-Message-State: APjAAAW5gKogYD9Lf3MKy41qR9/N1O2JgE8XTqFYb2sr/h++Ka8V2d7I
 C9qEyNa6tQgAEarF77+wPbeIYK3Efh+QpXkgj0DaXk1J/zinOhZkYqs8bgRDxShDng==
X-Google-Smtp-Source: APXvYqz5YHpKm90mjMqOxMGkNMOoE2BSG7fts0HS8pd2YGeQKJqMEr3P96B8XrAPliZ9bt9z/gCCJ/bhsYWk
X-Received: by 2002:adf:e710:: with SMTP id c16mr36940977wrm.292.1566322868040; 
 Tue, 20 Aug 2019 10:41:08 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id y18sm299785wrn.82.2019.08.20.10.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:08 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0883-00033J-LP; Tue, 20 Aug 2019 17:41:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0F796274314E; Tue, 20 Aug 2019 18:41:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <c3595e3a9788c2ef2dcc30aa3c8c4953bb5cc249.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174107.0F796274314E@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:07 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Don't use the oversample to
	calculate BCLK" to the asoc tree
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

   ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK

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

From 7df8f9a20196072162d9dc8fe99943f2d35f23d5 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:14 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK

The BCLK divider should be calculated using the parameters that actually
make the BCLK rate: the number of channels, the sampling rate and the
sample width.

We've been using the oversample_rate previously because in the former SoCs,
the BCLK's parent is MCLK, which in turn is being used to generate the
oversample rate, so we end up with something like this:

oversample = mclk_rate / sampling_rate
bclk_div = oversample / word_size / channels

So, bclk_div = mclk_rate / sampling_rate / word_size / channels.

And this is actually better, since the oversampling ratio only plays a role
because the MCLK is its parent, not because of what BCLK is supposed to be.

Furthermore, that assumption of MCLK being the parent has been broken on
newer SoCs, so let's use the proper formula, and have the parent rate as an
argument.

Fixes: 7d2993811a1e ("ASoC: sun4i-i2s: Add support for H3")
Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Fixes: 66ecce332538 ("ASoC: sun4i-i2s: Add compatibility with A64 codec I2S")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/c3595e3a9788c2ef2dcc30aa3c8c4953bb5cc249.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 70608fa30bf2..d879db581073 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -222,10 +222,11 @@ static const struct sun4i_i2s_clk_div sun4i_i2s_mclk_div[] = {
 };
 
 static int sun4i_i2s_get_bclk_div(struct sun4i_i2s *i2s,
-				  unsigned int oversample_rate,
+				  unsigned long parent_rate,
+				  unsigned int sampling_rate,
 				  unsigned int word_size)
 {
-	int div = oversample_rate / word_size / 2;
+	int div = parent_rate / sampling_rate / word_size / 2;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sun4i_i2s_bclk_div); i++) {
@@ -315,8 +316,8 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	bclk_div = sun4i_i2s_get_bclk_div(i2s, oversample_rate,
-					  word_size);
+	bclk_div = sun4i_i2s_get_bclk_div(i2s, i2s->mclk_freq,
+					  rate, word_size);
 	if (bclk_div < 0) {
 		dev_err(dai->dev, "Unsupported BCLK divider: %d\n", bclk_div);
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
