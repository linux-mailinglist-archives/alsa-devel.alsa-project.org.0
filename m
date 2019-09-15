Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B403BB2F5F
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Sep 2019 11:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 297371670;
	Sun, 15 Sep 2019 11:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 297371670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568540004;
	bh=FRFR+OVEERUYmg0dOXtVHocuAATxP/EzX9+iI+gwlag=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=blisMF/KI2Wv10aozdXpiWisxKbGehQvnSQLv8IqCOoeE+5rw4XpncnZkB9pgqTPW
	 QnxiYjRskA0imos6zDTiZB7cvQ/ZdYqeChZyQe1DvhgqNncpH3hnVPZg32GlLo+Ocb
	 2oo390PRWkSS0kM5Jj/KhiipjDese6iYJA4mccAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D8FF8048E;
	Sun, 15 Sep 2019 11:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5819CF80361; Sun, 15 Sep 2019 11:31:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AF87F802DF
 for <alsa-devel@alsa-project.org>; Sun, 15 Sep 2019 11:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF87F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BtRFFzqZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nyo3F8+Gmt+Uhz9HQiAjvCjoWq5h5bVV0pcNn8IbSDs=; b=BtRFFzqZYniD
 NiWHe8lOEdzpXwEggZQzBfkSVqz1Y+nhGRgQ2GbeOCBN0YC2FCSGxkE/1HK/UcQupwZ5itg83/jCQ
 4HwUW5o8kp/26mo7bFytgjfpZXtQzfhwJwKj4docb6tqgeBCm9CDxnuenchFUGuOxClOdMqoMde9p
 8/5I8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9QsV-00079Y-Vg; Sun, 15 Sep 2019 09:31:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 600B62740A09; Sun, 15 Sep 2019 10:31:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Saiyam Doshi <saiyamdoshi.in@gmail.com>
In-Reply-To: <20190914031133.GA28447@SD>
X-Patchwork-Hint: ignore
Message-Id: <20190915093131.600B62740A09@ypsilon.sirena.org.uk>
Date: Sun, 15 Sep 2019 10:31:31 +0100 (BST)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, plai@codeaurora.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sdm845: remove unneeded semicolon" to
	the asoc tree
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

   ASoC: sdm845: remove unneeded semicolon

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

From fca11622d600228bec405456f41590155b3a3eca Mon Sep 17 00:00:00 2001
From: Saiyam Doshi <saiyamdoshi.in@gmail.com>
Date: Sat, 14 Sep 2019 08:41:33 +0530
Subject: [PATCH] ASoC: sdm845: remove unneeded semicolon

Remove excess semicolon after closing parenthesis.

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
Link: https://lore.kernel.org/r/20190914031133.GA28447@SD
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 882f52ed8231..28f3cef696e6 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -319,7 +319,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
 				0, SNDRV_PCM_STREAM_PLAYBACK);
-		};
+		}
 		break;
 
 	case SECONDARY_MI2S_TX:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
