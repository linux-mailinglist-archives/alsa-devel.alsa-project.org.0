Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0474B7E2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B192A1681;
	Wed, 19 Jun 2019 14:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B192A1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560946633;
	bh=PIxq/NAIiiMjFjvQqvx4ZyfrUJvAdClN8fAo9N4Ppts=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CLf2G+eYRBU2TdfVNQYDxBthGs64VKmEDlZygZ16TBhfZIM46AizqQp3AlSvR3cND
	 xGkCKGmWcq62ueHYZ3eiJda/ybmBmxZLWHnV8V/SmNsPBw81ViP2tWYZQMsHTU3Y9+
	 Qxl9YNMhLHYHmk7llrnVSmdp+RImwY8FuroFFqXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EACBCF89763;
	Wed, 19 Jun 2019 14:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF335F896DA; Wed, 19 Jun 2019 14:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25236F896C7
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25236F896C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VgV4e8z8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Yi3MFx54t1gTA67DV1DoUwKLFEiQCEw0fWxh+S80Du0=; b=VgV4e8z8w37y
 P+mvfUOYPEXQV+j7ZAiPAV8T3xXJO2ji7g92Ohv5M9hqNJwXAWTqt5sAS8LQklbF5kOiRUUUzaj3i
 AMyd2A8oK59WM/XnaHH1OqTcAnr9q7c+2DJUMgTYc1fcl6Wb0hYsxUkNXK+1G4+2gYhkFfEBZLoEa
 n8PE0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRX-00078R-J7; Wed, 19 Jun 2019 12:11:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 089BE440049; Wed, 19 Jun 2019 13:11:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878stytlu8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121159.089BE440049@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:11:59 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-utils: remove dummy Platform" to
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

   ASoC: soc-utils: remove dummy Platform

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

From 64ee5067cf64f948449201579d89829b5c693c16 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:19:44 +0900
Subject: [PATCH] ASoC: soc-utils: remove dummy Platform

ALSA SoC used 2 type of Platform if sound card doesn't need
Platform.

	1) use Dummy Platform as Platform component
	2) use CPU component  as Platform component

Now, ALSA SoC allows "no Platform" settings, and it will behave
same as 2) case selection. And, all sound card which doesn't need
specific Platform are now not selecting Platform any more.

This means, no sound card is using dummy Platform on ALSA SoC any
more. This patch removes unused dummy Platform.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-utils.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index e3b9dd634c6d..f67e715a9f42 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -262,26 +262,6 @@ static const struct snd_pcm_hardware dummy_dma_hardware = {
 	.periods_max		= 128,
 };
 
-static int dummy_dma_open(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-
-	/* BE's dont need dummy params */
-	if (!rtd->dai_link->no_pcm)
-		snd_soc_set_runtime_hwparams(substream, &dummy_dma_hardware);
-
-	return 0;
-}
-
-static const struct snd_pcm_ops snd_dummy_dma_ops = {
-	.open		= dummy_dma_open,
-	.ioctl		= snd_pcm_lib_ioctl,
-};
-
-static const struct snd_soc_component_driver dummy_platform = {
-	.ops = &snd_dummy_dma_ops,
-};
-
 static const struct snd_soc_component_driver dummy_codec = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
@@ -339,11 +319,6 @@ static int snd_soc_dummy_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &dummy_codec, &dummy_dai, 1);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_snd_soc_register_component(&pdev->dev, &dummy_platform,
-					      NULL, 0);
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
