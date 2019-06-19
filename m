Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741324B8C0
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:37:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E344216CC;
	Wed, 19 Jun 2019 14:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E344216CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560947871;
	bh=r+KAb5ZSta3MJSryteojms25OiS+xVgUWWhNpOKjN3c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oxM/O/DpvO+ic2f6bAe/iKxHUhFYmtwEBoTQ7++P987W8QinYii+FNDhKGXLXxJIx
	 OWD4/8zqFtaGhiEB6slwOTNF0TWREQuGpiuUF3Mj7GwiRexFpEUAK96K1yw56Fsetl
	 DxeM/mmlQOyaHR4+RaBxB3h3acWYpnyiSDKvugWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 952B8F897EC;
	Wed, 19 Jun 2019 14:13:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3DCBF89775; Wed, 19 Jun 2019 14:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BECF6F8974B
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BECF6F8974B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bwhttrdA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=70E+mHY3Q6qDtPM4sgzugh82I3ILtOQ5JzJWqjoMr5U=; b=bwhttrdAYidM
 l+BMGSMKcxGvwX1SKHxzwiUrhs6FsQIqOhvT0FMobv+rYxEF0eahSIfGyoP0vAkjbeNS7ADLy/WUN
 ehm3aM7jPNGTAXV8fG0Cu+LJE1L8CL9K+XgWL3C/IvGKs/IIMlYn7d1CBf6nKvkMwQDOlLKku2kph
 L6sTM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRb-0007BX-Lc; Wed, 19 Jun 2019 12:12:03 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2C8F6440049; Wed, 19 Jun 2019 13:12:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnnav0jr.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121203.2C8F6440049@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:03 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: eukrea-tlv320: don't select
	unnecessary Platform" to the asoc tree
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

   ASoC: fsl: eukrea-tlv320: don't select unnecessary Platform

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

From 2058ea1c4f514a01bc0eba68ffe193d6f39bee43 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:16:42 +0900
Subject: [PATCH] ASoC: fsl: eukrea-tlv320: don't select unnecessary Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/eukrea-tlv320.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 6f3b768489f6..1ed409d423c3 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -63,8 +63,7 @@ static const struct snd_soc_ops eukrea_tlv320_snd_ops = {
 
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")));
 
 static struct snd_soc_dai_link eukrea_tlv320_dai = {
 	.name		= "tlv320aic23",
@@ -134,10 +133,8 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		ext_port--;
 
 		eukrea_tlv320_dai.cpus->of_node = ssi_np;
-		eukrea_tlv320_dai.platforms->of_node = ssi_np;
 	} else {
 		eukrea_tlv320_dai.cpus->dai_name = "imx-ssi.0";
-		eukrea_tlv320_dai.platforms->name = "imx-ssi.0";
 		eukrea_tlv320_dai.codecs->name = "tlv320aic23-codec.0-001a";
 		eukrea_tlv320.name = "cpuimx-audio";
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
