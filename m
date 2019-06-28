Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E7E5A19C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 18:59:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 164B4168C;
	Fri, 28 Jun 2019 18:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 164B4168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561741184;
	bh=AFnzPIs3rjQBb/7PQd+Zbbmv2itN6GB0Wv2cGAXA3ZI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fs7er6grPjt+rQNJwX+vgNoAaQ8cD5OkPzNSrvRtDH8Zy1CxjMtYZ1Nuhguovrm6U
	 LrvScfFxdoiS88yS/kI3m0OEgK5ZyWMnvisdIjey+IEp3SiCtt9sPIKB0p3DVcgkjq
	 Twu82dnqVydpwmYoYWL3AxihRg1NzZbtFQNSleD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DED28F89701;
	Fri, 28 Jun 2019 18:56:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C678F8975F; Fri, 28 Jun 2019 18:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16D24F80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D24F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VezL4kLg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=v/0kN/1WHmhxf4fd7kJlaJc6pMCQXeZwq/vg6bHKAmg=; b=VezL4kLgAPSv
 Qeimvp3yyKoPOveH01IDEp/eNESGl7ZVDhCPY6QigmxL3ytvIPGsSFqkEOZ9os9ioSE6O8sFmji8u
 EEoC4LmzSVynouqcz3qs9xCC8IIudsY4pu/TJN1n3r6+MFYGB2tl+y48Kyr5AdTid4HIeN7YSSd+G
 4biCo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAi-00077b-Cn; Fri, 28 Jun 2019 16:56:24 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id AA1C4440052; Fri, 28 Jun 2019 17:56:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o92itrag.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165623.AA1C4440052@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:23 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: omap-twl4030: consider CPU-Platform
	possibility" to the asoc tree
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

   ASoC: ti: omap-twl4030: consider CPU-Platform possibility

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

From eb313e23da8da79cf18dff5ee1dbba3580df83b5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:49:30 +0900
Subject: [PATCH] ASoC: ti: omap-twl4030: consider CPU-Platform possibility

commit bfe1273c65e1 ("ASoC: ti: omap-twl4030: don't select unnecessary
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

Fixes: commit bfe1273c65e1 ("ASoC: ti: omap-twl4030: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/omap-twl4030.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 34e79e57f039..92dbe2c67290 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -197,11 +197,13 @@ static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 /* Digital audio interface glue - connects codec <--> CPU */
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_CPU("omap-mcbsp.2")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("twl4030-codec", "twl4030-hifi")));
+	DAILINK_COMP_ARRAY(COMP_CODEC("twl4030-codec", "twl4030-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("omap-mcbsp.2")));
 
 SND_SOC_DAILINK_DEFS(voice,
 	DAILINK_COMP_ARRAY(COMP_CPU("omap-mcbsp.3")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("twl4030-codec", "twl4030-voice")));
+	DAILINK_COMP_ARRAY(COMP_CODEC("twl4030-codec", "twl4030-voice")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("omap-mcbsp.3")));
 
 static struct snd_soc_dai_link omap_twl4030_dai_links[] = {
 	{
@@ -263,12 +265,18 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 		omap_twl4030_dai_links[0].cpus->dai_name  = NULL;
 		omap_twl4030_dai_links[0].cpus->of_node = dai_node;
 
+		omap_twl4030_dai_links[0].platforms->name  = NULL;
+		omap_twl4030_dai_links[0].platforms->of_node = dai_node;
+
 		dai_node = of_parse_phandle(node, "ti,mcbsp-voice", 0);
 		if (!dai_node) {
 			card->num_links = 1;
 		} else {
 			omap_twl4030_dai_links[1].cpus->dai_name  = NULL;
 			omap_twl4030_dai_links[1].cpus->of_node = dai_node;
+
+			omap_twl4030_dai_links[1].platforms->name  = NULL;
+			omap_twl4030_dai_links[1].platforms->of_node = dai_node;
 		}
 
 		priv->jack_detect = of_get_named_gpio(node,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
