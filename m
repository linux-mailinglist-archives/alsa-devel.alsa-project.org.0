Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AF5A222
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:20:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B9216D7;
	Fri, 28 Jun 2019 19:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B9216D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561742409;
	bh=1mXS3AUGXbPsLiXexFRLlafQkWX5YfY+UfjcPPKIiuU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZpNG3W5N5bbwyzgDyUq0FDwSjODhUBCv0pcFZ8HiyUsoNYvac93687qqtW/EKPWL0
	 OdRhPxCVaaQEGVPuVBe1pbApLANWOIiehygerKQrTTH1056Vo5wANeEHm5tTgQSeaF
	 myj8RXMJLsVdURK06KjBycluoZt4dnt0ng/y5oyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD48F897DA;
	Fri, 28 Jun 2019 18:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A8DEF89744; Fri, 28 Jun 2019 18:57:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DA86F8973D
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA86F8973D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Cfd/eWm8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vapBaCP6+HJ7qBHOZWq2TaRk/syFnE8zBVYH347LXME=; b=Cfd/eWm8ObY7
 s1WqjGt13LtSoVorc4qwi0ddwrMY/wqbFMx2et+VIngpldbjSXe5r1qK5vS4ZTdVODWZ8tKzyT8zy
 /tBDl0pyXPCVj/vyPD2IlEqrZs0FcF1Ep8IhnG54xq2GhMslND2bDCcmm/a4zXTnZL9m/cWX1Ey2P
 n0iqQ=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAl-0007AN-Ec; Fri, 28 Jun 2019 16:56:27 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D9B59440050; Fri, 28 Jun 2019 17:56:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87woh6v5yo.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165626.D9B59440050@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: eukrea-tlv320: consider
	CPU-Platform possibility" to the asoc tree
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

   ASoC: fsl: eukrea-tlv320: consider CPU-Platform possibility

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

From 68707c37017086c51b319098afb2cf6d6853ef57 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:47:14 +0900
Subject: [PATCH] ASoC: fsl: eukrea-tlv320: consider CPU-Platform possibility

commit 2058ea1c4f514a ("ASoC: fsl: eukrea-tlv320: don't select unnecessary
Platform")

Current ALSA SoC avoid to add duplicate component to rtd,
and this driver was selecting CPU component as Platform component.
Thus, above patch removed Platform settings from this driver,
because it assumed these are same component.

But, some CPU driver is using generic DMAEngine, in such case, both
CPU component and Platform component will have same of_node/name.
In other words, there are some components which are different but
have same of_node/name.

In such case, Card driver definitely need to select Platform even
though it is same as CPU.
It is depends on CPU driver, but is difficult to know it from Card driver.
This patch reverts above patch.

Fixes: commit 2058ea1c4f514a ("ASoC: fsl: eukrea-tlv320: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/eukrea-tlv320.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 1ed409d423c3..6f3b768489f6 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -63,7 +63,8 @@ static const struct snd_soc_ops eukrea_tlv320_snd_ops = {
 
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link eukrea_tlv320_dai = {
 	.name		= "tlv320aic23",
@@ -133,8 +134,10 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		ext_port--;
 
 		eukrea_tlv320_dai.cpus->of_node = ssi_np;
+		eukrea_tlv320_dai.platforms->of_node = ssi_np;
 	} else {
 		eukrea_tlv320_dai.cpus->dai_name = "imx-ssi.0";
+		eukrea_tlv320_dai.platforms->name = "imx-ssi.0";
 		eukrea_tlv320_dai.codecs->name = "tlv320aic23-codec.0-001a";
 		eukrea_tlv320.name = "cpuimx-audio";
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
