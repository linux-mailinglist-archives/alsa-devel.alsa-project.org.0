Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14938137
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13872172C;
	Fri,  7 Jun 2019 00:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13872172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559861357;
	bh=YZiLOgTWfHTLGvzGiGzbAOnN+Y5vsORV7jvMmyE3U+g=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=E2FCkSXs6JZ2zMz0CqzKKsfOIks9wNrwy3CGnygCsJn0iLG7Zcwiia2jvA9ilWqj/
	 9nzb4zv+hIYgufowuw9b9kx2xhbN3kj9JXSpWFflltwAZYJMX2RELYCcYLZNbowuLr
	 VGWIjwz0TdZgL/0NY/QRiKC/9ZupHJ5qLNwcZbfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79248F899F0;
	Thu,  6 Jun 2019 23:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D7B9F8987C; Thu,  6 Jun 2019 23:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9071F897EB
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9071F897EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a0soP+ge"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=87UGmH52Ithg+akCnGncHrxAvbmpRjTjqQgRcAcXleQ=; b=a0soP+gevSEx
 LUe4ZhiwRsyr7pF3QbHiPliFS3QmYj1t8DKnHo6kyf1vTowrqLGIhJ56xVqT++4TK42bwfPaWzz5W
 1HIgD88oYsBE3lhbYjr/uLH3Jv81qI9WnvXd2lvhncDMbHuVoNdm1b6SbYC5047IDW+gUQ5wGVg5U
 hLdDU=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzua-0007Si-Ii; Thu, 06 Jun 2019 21:27:04 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 0E8FD440046; Thu,  6 Jun 2019 22:27:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftonl65j.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212704.0E8FD440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:03 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: s3c24xx_simtec_tlv320aic23:
	use modern dai_link style" to the asoc tree
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

   ASoC: samsung: s3c24xx_simtec_tlv320aic23: use modern dai_link style

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

From fba1384c3bff25de469a9dcb970a27669e540f42 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:10:11 +0900
Subject: [PATCH] ASoC: samsung: s3c24xx_simtec_tlv320aic23: use modern
 dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c b/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
index 1360b881400d..c03d52990267 100644
--- a/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
+++ b/sound/soc/samsung/s3c24xx_simtec_tlv320aic23.c
@@ -52,14 +52,17 @@ static int simtec_tlv320aic23_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+SND_SOC_DAILINK_DEFS(tlv320aic23,
+	DAILINK_COMP_ARRAY(COMP_CPU("s3c24xx-iis")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.0-001a",
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("s3c24xx-iis")));
+
 static struct snd_soc_dai_link simtec_dai_aic23 = {
 	.name		= "tlv320aic23",
 	.stream_name	= "TLV320AIC23",
-	.codec_name	= "tlv320aic3x-codec.0-001a",
-	.cpu_dai_name	= "s3c24xx-iis",
-	.codec_dai_name = "tlv320aic3x-hifi",
-	.platform_name	= "s3c24xx-iis",
 	.init		= simtec_tlv320aic23_init,
+	SND_SOC_DAILINK_REG(tlv320aic23),
 };
 
 /* simtec audio machine driver */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
