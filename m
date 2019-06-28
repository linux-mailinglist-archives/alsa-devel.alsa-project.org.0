Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555F5A1A3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7412D166B;
	Fri, 28 Jun 2019 19:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7412D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561741294;
	bh=qbcDI7SfLF3yFvXrLI3fu4KTnbVfpioI0P3pckxlyPI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=V108u2rn7OKrVhNZGOp03RH6I4GWrFlNuUogxvo+PFE/oTDGcT7bhsqOm9TwDcvxO
	 mYyr6whzUnyo7hwunFXmWck0GMggobhlFNhynYhK/wEwbxZW/nDlqOFNoV0AA6eQVt
	 +3WZ+MVAxLqyC7GZjrFf0koy6OI8wkFMQTPteLjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB5FF89738;
	Fri, 28 Jun 2019 18:56:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68E84F896EC; Fri, 28 Jun 2019 18:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CFDBF896CC
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFDBF896CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WYec8eLz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4kdBh0SumBu9d7CuyQYvlOpP/KDjC6yNoW9FiWBHIVQ=; b=WYec8eLz61Xi
 /sDU/7KaihuPZsxVRBuQBbLxQutIp3SGbFtu0HPaxekj36Q2AkBT4Ojy5XyjvEqkFyJ1v73AlN8Si
 uUwpzuaOFU9AD6PEp0m9rc599fUH+gfHSQAqaMnRT8OO1vmCKLzfSMn72ROLNUBjWrG6MYBhSyni5
 mdUaM=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAi-00077e-Gm; Fri, 28 Jun 2019 16:56:24 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 9219E440050; Fri, 28 Jun 2019 17:56:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mui2trac.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165623.9219E440050@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:23 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: rx51: consider CPU-Platform
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

   ASoC: ti: rx51: consider CPU-Platform possibility

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

From 569440b46baab1f9f696a688de7860a915cebc26 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:49:34 +0900
Subject: [PATCH] ASoC: ti: rx51: consider CPU-Platform possibility

commit f0edc6c1ee48 ("ASoC: ti: rx51: don't select unnecessary Platform")

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

Fixes: commit f0edc6c1ee48 ("ASoC: ti: rx51: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/rx51.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 4270cfb66224..bc6046534fa5 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -301,7 +301,8 @@ static int rx51_aic34_init(struct snd_soc_pcm_runtime *rtd)
 SND_SOC_DAILINK_DEFS(aic34,
 	DAILINK_COMP_ARRAY(COMP_CPU("omap-mcbsp.2")),
 	DAILINK_COMP_ARRAY(COMP_CODEC("tlv320aic3x-codec.2-0018",
-				      "tlv320aic3x-hifi")));
+				      "tlv320aic3x-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("omap-mcbsp.2")));
 
 static struct snd_soc_dai_link rx51_dai[] = {
 	{
@@ -378,7 +379,9 @@ static int rx51_soc_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 		rx51_dai[0].cpus->dai_name = NULL;
+		rx51_dai[0].platforms->name = NULL;
 		rx51_dai[0].cpus->of_node = dai_node;
+		rx51_dai[0].platforms->of_node = dai_node;
 
 		dai_node = of_parse_phandle(np, "nokia,audio-codec", 0);
 		if (!dai_node) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
