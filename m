Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4EA34B63
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 17:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BABC41688;
	Tue,  4 Jun 2019 17:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BABC41688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559660605;
	bh=VQDAh2iEflbLTM3zJigl8b/EEfwbN19XkeJymDFLjYA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Hd9TBOEvarAvgD5YqMXbPDTqYcO83UCG/Xh700gKouiIK1b2qZahxX6tA/JphK7eH
	 KgJj9WmpiLfQe/FFsyKb03H9xBUvQ2viJ6B8M1psojBWKj1XEoY5I4hRYLYkKTTyAs
	 mewt+N7MhT9jT/RSeiW1WjNc4p0dN3crZuF5sqt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA31F89743;
	Tue,  4 Jun 2019 16:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D09A8F8973F; Tue,  4 Jun 2019 16:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7B8DF89718
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 16:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7B8DF89718
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RWsKsz7n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=RbstzphZvlrTV6oS0dsnCRyk4ToW/lQ4snN4C+vyhtE=; b=RWsKsz7nmfQ/
 u7wQuxhxavNRgyeEccQTmkwSX4SAJTO5a+2SrtQyDtYC0/eK014eSfNOSMmb7qWCTW654mOAKw5A6
 LCtvxpJ+8wOaUR2Dufse2OTcMUhxkV0zpzkmObfsfCyTP8ROhskEa2vhqRf6G9xk5eZXug0u7EA2c
 wJU9c=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYAtx-0006Eo-EN; Tue, 04 Jun 2019 14:59:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E9721440049; Tue,  4 Jun 2019 15:59:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190525123204.16148-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190604145900.E9721440049@finisterre.sirena.org.uk>
Date: Tue,  4 Jun 2019 15:59:00 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cx2072x: remove set but not used
	variable 'is_right_j '" to the asoc tree
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

   ASoC: cx2072x: remove set but not used variable 'is_right_j '

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 190d9e0332ab43b28cbb1856fc73ed7fafbfad7c Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 25 May 2019 20:32:04 +0800
Subject: [PATCH] ASoC: cx2072x: remove set but not used variable 'is_right_j '

Fixes gcc '-Wunused-but-set-variable' warning:

sound/soc/codecs/cx2072x.c: In function cx2072x_config_i2spcm:
sound/soc/codecs/cx2072x.c:679:6: warning: variable is_right_j set but not used [-Wunused-but-set-variable]

It's never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cx2072x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 8b0830854bb3..f2cb35a50726 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -676,7 +676,6 @@ static int cx2072x_config_i2spcm(struct cx2072x_priv *cx2072x)
 	unsigned int bclk_rate = 0;
 	int is_i2s = 0;
 	int has_one_bit_delay = 0;
-	int is_right_j = 0;
 	int is_frame_inv = 0;
 	int is_bclk_inv = 0;
 	int pulse_len;
@@ -740,7 +739,6 @@ static int cx2072x_config_i2spcm(struct cx2072x_priv *cx2072x)
 
 	case SND_SOC_DAIFMT_RIGHT_J:
 		is_i2s = 1;
-		is_right_j = 1;
 		pulse_len = frame_len / 2;
 		break;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
