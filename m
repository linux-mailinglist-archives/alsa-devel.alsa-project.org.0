Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B7F4B8A0
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C33C1685;
	Wed, 19 Jun 2019 14:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C33C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560947589;
	bh=6gbfRYmt8mzmWi1TNplgHOzmPDV3/ayqHw+bNhWqXQY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gChcpuSDRKByUJ+19RllaU97ewXcyEV1r0R7catBD0W2hLZ/Zt0Usis7db1+q/t5Z
	 dSSGkKjI5zfQGbL3g1BMwoVmQTX19QJBYbvZ6az/ZcmaGxVB/YWQj38tmCVM1eNxQr
	 TJBx9+FFmJQ+y6/JMqUbpIYLskM3Brh3N0RsLcb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EBCFF897C3;
	Wed, 19 Jun 2019 14:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1255BF89771; Wed, 19 Jun 2019 14:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20C6AF89743
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C6AF89743
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XtzyIXfc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=MTAQU8+f82H0BvDtdETDpobFkO4HLN4wJ0fbFM8wkvk=; b=XtzyIXfcdw+E
 kgTMtC2TDEwTCGNhU/6ZGGJdiq0YlvWt00ngR/C+YDYbU+AYaqxm1Di03LmFENy1xoFIkGClSiXZZ
 9xTNYE0BSmsKPVu5aNEoCa2sccDw7dXPzB2QuPoR7CZO0nTR3o4I3PMFPQOUtgIwss8PHLqT2dVKP
 I2iqc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRa-0007Ac-J6; Wed, 19 Jun 2019 12:12:02 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 26D4A440050; Wed, 19 Jun 2019 13:12:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0jav0ii.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121202.26D4A440050@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:02 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: storm: don't select unnecessary
	Platform" to the asoc tree
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

   ASoC: qcom: storm: don't select unnecessary Platform

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

From 3caf11fa88a954916c14c719b89478f4d89386d5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:17:26 +0900
Subject: [PATCH] ASoC: qcom: storm: don't select unnecessary Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/storm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index 672edee2ea93..9c67e42a1f00 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -63,8 +63,7 @@ static const struct snd_soc_ops storm_soc_ops = {
 
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")));
 
 static struct snd_soc_dai_link storm_dai_link = {
 	.name		= "Primary",
@@ -83,7 +82,6 @@ static int storm_parse_of(struct snd_soc_card *card)
 		dev_err(card->dev, "error getting cpu phandle\n");
 		return -EINVAL;
 	}
-	dai_link->platforms->of_node = dai_link->cpus->of_node;
 
 	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
 	if (!dai_link->codecs->of_node) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
