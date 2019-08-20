Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205196810
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D1B167A;
	Tue, 20 Aug 2019 19:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D1B167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323664;
	bh=s26SbqHfu9gQRql7mQWXNsEz+1m52qhRqfH+pIB0GdU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JJL9szuM3H8QshbVS0ZNQORn0MHIQ0qybzT+UwZK4rFvZ8iQsVjTza7LMVUsMEZxj
	 hI9ImdFkKZJ5wBTo1DU779XTFPkCLzWGhAIRlgaRziSw/t4wuF48SiHouSIxwYLpL0
	 qoMSmOPpTBAXBPAQUjg8Jyg7eW2QonVUP3JehOEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88214F8060E;
	Tue, 20 Aug 2019 19:41:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32C2BF805F9; Tue, 20 Aug 2019 19:41:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E03BF805FE
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E03BF805FE
Received: by mail-wr1-f99.google.com with SMTP id r3so13285377wrt.3
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=L1Zn2ORD9FSrc1HVb+RScuNQ8y1rYfCN6SkmynQKZbI=;
 b=i/j0j3mvavg0VLqXEy9uV/RcTd+dpMHU29IRHGWNRwdQWigbRjVMlY6oqepwKG863D
 HkhebN6fxOQACdAlxzizodMGe5nDh9Y5mrUs9us7s59KDo4XVz9LZIehpmW7GLg8kgah
 dGNyMjntlKtz1zDXXQfwHs4/c8P37gShNB1iwca0EpHcYjK0fog5eQWEw4HEN0z0dLzp
 jcpBVjuhU4wr0GgYDA/gcqXER9Z1LY7aWCkPw2gqgEu1H5ooD3l629q/Dys4JGiUSJX9
 DkPMvM0fD8l5p6gwIySWGYAq0GRc+VWwyDKuT3yPFR8HsndUcCoU8jn3sV2pzlpn7fzL
 Evbw==
X-Gm-Message-State: APjAAAX81Q7PfBwIdhaSrcv3knQHlxPzWBhOAvVy8CCDiYEd7txv08DR
 0Ajm59xYV7QjbvsuB7NucwiXOeTY0/qAegOKP5JtLq04DQU87CNCG9++ivZpE86h8Q==
X-Google-Smtp-Source: APXvYqy5TDi0UH/U2hkLDnHw3HPv5V5xfoaG9/13O8LBHUJJ0XtWYmNWX6MMUl3awmli3v9kooxjXG/VO8dN
X-Received: by 2002:a5d:4950:: with SMTP id r16mr35050963wrs.347.1566322867715; 
 Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id x15sm1831wmj.21.2019.08.20.10.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0883-00033G-FN; Tue, 20 Aug 2019 17:41:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D4AE3274314C; Tue, 20 Aug 2019 18:41:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <c0faaac69ad40248f24eed3c3b2fa1ccc4a85b70.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174106.D4AE3274314C@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:06 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Replace call to
	params_channels by local variable" to the asoc tree
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

   ASoC: sun4i-i2s: Replace call to params_channels by local variable

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

From c7dd0828c088a71f30de8d249f63b2fa9f0d322d Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:10 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Replace call to params_channels by local
 variable

The sun4i_i2s_hw_params already has a variable holding the value returned
by params_channels, so let's just use that variable instead of calling
params_channels multiple times.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/c0faaac69ad40248f24eed3c3b2fa1ccc4a85b70.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d879db581073..77b7b81daf74 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -412,10 +412,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* Configure the channels */
 	regmap_field_write(i2s->field_txchansel,
-			   SUN4I_I2S_CHAN_SEL(params_channels(params)));
-
+			   SUN4I_I2S_CHAN_SEL(channels));
 	regmap_field_write(i2s->field_rxchansel,
-			   SUN4I_I2S_CHAN_SEL(params_channels(params)));
+			   SUN4I_I2S_CHAN_SEL(channels));
 
 	if (i2s->variant->has_chsel_tx_chen)
 		regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
