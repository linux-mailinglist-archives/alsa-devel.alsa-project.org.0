Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C296813
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C6E71682;
	Tue, 20 Aug 2019 19:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C6E71682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323724;
	bh=mEevPGAa50JWKLmbEAHNrULLsA0KH2OSXh4MhtfsFVg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LGZjcvrHEJ1Kr64bAZmrH/DJB0C7TD0zJOawnFOdAGjPlDzL7wKXSKsPbkUU74iq2
	 +qMckh992gKqJwQNybteD+7846tOyBlnFVTPgVOk8zhjl9YiRpLDon46RFse450UMi
	 Y6o38lek4QFJvIzWTeP+Z8eL2E1QAGQABQvVMLXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CC7AF80787;
	Tue, 20 Aug 2019 19:41:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A159FF80659; Tue, 20 Aug 2019 19:41:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF58EF80600
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF58EF80600
Received: by mail-wr1-f97.google.com with SMTP id j16so13258536wrr.8
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=/oUZyaSFvnTru9mrXf/nQ0HyOhv4Yfcc/8s9tsBFwA8=;
 b=kCz6ZU9NoNYszJly7AaosuKzASvAad+u78LFjW3WfMlIuqqwvX2MdoijA/4E8gqoK+
 gyfQcPVPfuKCnjTH2DkSJQ6l2KFFUOin4+gwrZbuLwSZrEd8cGHkYkfJBSxDgfY9CC/n
 LridawT8L6VUp3TrXejJXMTJhCNujG1JgUysg2xY8JwXF+1CT9OLhm0xAxjCsKtXY7Zh
 305NUQRozOv/cqFEXDzDHUqSVczOTPU211ftaijD2T9fNBLou+So1+7vpODeyPyWA9gD
 C4pJ+ssQE9fZOqWokI5HD2H8lCtlMMLznazFTtgUPJzX1O7GYTMCvFx7I2okO7TIhi4q
 s0/A==
X-Gm-Message-State: APjAAAUzzbAtbfwPEgguhFOZEJJTxTy6dE/Cl3tAmGZrtBGi2IO3Bwfp
 6Ynu6x8NtfRaJhEIHkXsZG17cr2fXiH0i+WA1k4OxWw3OWE4xFPEc4vPqAGTc/OuLw==
X-Google-Smtp-Source: APXvYqwbv2bKM1rrIA+jKyCyDKah2dpXSy5LRhlLaJMLEG6Vxf3igLhSeBTEMkKCmbkcbCpVmYaYhNTJ5hT5
X-Received: by 2002:a5d:528a:: with SMTP id c10mr34277580wrv.111.1566322868042; 
 Tue, 20 Aug 2019 10:41:08 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id y17sm353193wrs.53.2019.08.20.10.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:08 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0883-00033O-PC; Tue, 20 Aug 2019 17:41:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 407F2274314F; Tue, 20 Aug 2019 18:41:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <606d271187091e858e8c15e20555af0b79798fe1.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174107.407F2274314F@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:07 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Switch to devm for PCM
	register" to the asoc tree
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

   ASoC: sun4i-i2s: Switch to devm for PCM register

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

From a49d24e7d8d4fd4edf59e6373983e0bf4a2cca15 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:09 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Switch to devm for PCM register

Since the introduction of the driver, a new managed helper for the
dmaengine PCM registration has been created. Let's use it to simplify a bit
our probe and remove functions.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/606d271187091e858e8c15e20555af0b79798fe1.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d97d694c48df..70608fa30bf2 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1154,7 +1154,7 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 		goto err_suspend;
 	}
 
-	ret = snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
 		goto err_suspend;
@@ -1183,8 +1183,6 @@ static int sun4i_i2s_remove(struct platform_device *pdev)
 {
 	struct sun4i_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
-	snd_dmaengine_pcm_unregister(&pdev->dev);
-
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		sun4i_i2s_runtime_suspend(&pdev->dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
