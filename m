Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D4CE2AA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 15:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6B61682;
	Mon,  7 Oct 2019 15:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6B61682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570453607;
	bh=W9MlfoK3CWKblHtMVzLkfjvA3keemK5aRZsg7EqX8Ok=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NuIB/P1B9ah86QhaO409LWTnd/dtEC23d/WRiimyHyJnL4YX8s8jf18SsG6cX632i
	 hR+cvxViiJd1uo2oWH1nbfUOrdza8mImID56xdvEcP7bZO+FTBLx1j9r/8y3nBQkFV
	 6ZMybfHWrEwOmGm2Do+5Ro5+XrSQQ3bcDcVHu7fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FDE9F8060F;
	Mon,  7 Oct 2019 15:03:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52227F80534; Mon,  7 Oct 2019 15:03:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 711ADF802BE
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 15:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 711ADF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="THWXo8Rq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FXvSV90ORQdMKdGNJr1bG4jNw0ZoYKo8tYhWNdgsM1E=; b=THWXo8Rq7TGt
 02XMx0KXdK0VMe4ALiMPT583icsjkQOpUdjLZgye3FLvlAhyIRR+hAanzLWoVSwNbh7Awf4lW9/0I
 1aYHWZuYWuJdCvXfu0odTFZZtNlRv0ts3/oHlsXYAPipHHFPgWEktruoRmDyOqRrJjxXWa/gcvUGn
 Jodhs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHSfO-0003Qo-Td; Mon, 07 Oct 2019 13:03:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8F1AB274124F; Mon,  7 Oct 2019 14:03:09 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20191006105522.58560-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20191007130309.8F1AB274124F@ypsilon.sirena.org.uk>
Date: Mon,  7 Oct 2019 14:03:09 +0100 (BST)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: fsl_mqs: remove set but not used
	variable 'bclk'" to the asoc tree
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

   ASoC: fsl_mqs: remove set but not used variable 'bclk'

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

From e9e8fc9ed63e7e0fb30f8612f628924fbd868467 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sun, 6 Oct 2019 18:55:22 +0800
Subject: [PATCH] ASoC: fsl_mqs: remove set but not used variable 'bclk'

Fixes gcc '-Wunused-but-set-variable' warning:

sound/soc/fsl/fsl_mqs.c: In function fsl_mqs_hw_params:
sound/soc/fsl/fsl_mqs.c:54:6: warning: variable bclk set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20191006105522.58560-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_mqs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index c1619a553514..7b9cab3a62e7 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -51,10 +51,9 @@ static int fsl_mqs_hw_params(struct snd_pcm_substream *substream,
 	struct fsl_mqs *mqs_priv = snd_soc_component_get_drvdata(component);
 	unsigned long mclk_rate;
 	int div, res;
-	int bclk, lrclk;
+	int lrclk;
 
 	mclk_rate = clk_get_rate(mqs_priv->mclk);
-	bclk = snd_soc_params_to_bclk(params);
 	lrclk = params_rate(params);
 
 	/*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
