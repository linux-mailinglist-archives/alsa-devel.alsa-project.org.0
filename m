Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D74B8C2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19BF016DE;
	Wed, 19 Jun 2019 14:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19BF016DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560947913;
	bh=xEI23nvIofdLJo5CouSDLUjU8m0Cf2V2XB43k9iEXCI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F1mYmu0aAaFBQQs7VpifVKdKk6x8/j2nf9HfmrynaURvcgnV8ee3BXvWTG6jDjMM2
	 nz/K3Su9PbNM9HkYXBW+beslo4/ZusJ5lz7DFYAS5bgJTw8ZibPdMSKwEhhOeA39WY
	 LuGYb+Zh/M4H64MGYNReJL5Z/dZGRujinU44JkV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0424F897F7;
	Wed, 19 Jun 2019 14:13:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D851BF89775; Wed, 19 Jun 2019 14:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A9FFF89749
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A9FFF89749
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AhYDT27W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6Xpnlf3JO1Boi63PQ/gEDKcrD4ouXXrxFCqthNqby8c=; b=AhYDT27WIziq
 5prhHE3OCeGXfVubuAmXL0/jwNeL7AvzODYh3SJcKOql8Uv37IvnWSedufBL7ryQOrsblwOiiwI1N
 yQ+zgjuyZr2G/QfqL9oRNs5AIhVm5TasxiugPADSLeCigYm3RjM4s5s3ynUYJ0E2GreaGnUGCpstr
 3SMs0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRa-0007As-To; Wed, 19 Jun 2019 12:12:02 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7A62F44004C; Wed, 19 Jun 2019 13:12:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h88mv0iu.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121202.7A62F44004C@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:02 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: kirkwood: armada-370-db: don't select
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

   ASoC: kirkwood: armada-370-db: don't select unnecessary Platform

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

From 717f163317127bc5fdc0d90ad42e3d309dac0df0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:17:14 +0900
Subject: [PATCH] ASoC: kirkwood: armada-370-db: don't select unnecessary
 Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/kirkwood/armada-370-db.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/kirkwood/armada-370-db.c b/sound/soc/kirkwood/armada-370-db.c
index b2d735b610b8..14f41ea874ef 100644
--- a/sound/soc/kirkwood/armada-370-db.c
+++ b/sound/soc/kirkwood/armada-370-db.c
@@ -60,18 +60,15 @@ static const struct snd_soc_dapm_route a370db_route[] = {
 
 SND_SOC_DAILINK_DEFS(analog,
 	DAILINK_COMP_ARRAY(COMP_CPU("i2s")),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42l51-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42l51-hifi")));
 
 SND_SOC_DAILINK_DEFS(spdif_out,
 	DAILINK_COMP_ARRAY(COMP_CPU("spdif")),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dit-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dit-hifi")));
 
 SND_SOC_DAILINK_DEFS(spdif_in,
 	DAILINK_COMP_ARRAY(COMP_CPU("spdif")),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dir-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dir-hifi")));
 
 static struct snd_soc_dai_link a370db_dai[] = {
 {
@@ -115,21 +112,18 @@ static int a370db_probe(struct platform_device *pdev)
 	a370db_dai[0].cpus->of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "marvell,audio-controller", 0);
-	a370db_dai[0].platforms->of_node = a370db_dai[0].cpus->of_node;
 
 	a370db_dai[0].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "marvell,audio-codec", 0);
 
 	a370db_dai[1].cpus->of_node = a370db_dai[0].cpus->of_node;
-	a370db_dai[1].platforms->of_node = a370db_dai[0].cpus->of_node;
 
 	a370db_dai[1].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "marvell,audio-codec", 1);
 
 	a370db_dai[2].cpus->of_node = a370db_dai[0].cpus->of_node;
-	a370db_dai[2].platforms->of_node = a370db_dai[0].cpus->of_node;
 
 	a370db_dai[2].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
