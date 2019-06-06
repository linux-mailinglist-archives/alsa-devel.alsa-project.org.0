Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3938069
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:18:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B9316DF;
	Fri,  7 Jun 2019 00:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B9316DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859518;
	bh=FW9p3gcQkKzOu9r+Dr/LN8B2Q5C4gVpqBzmP80Wgs9Y=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=say8av7XwtO4lN53p3sC+6ieB9H/Z2EnGZe0d3lhh2DMvUH24oPOk/Zu2ATjEcSnH
	 nc4D0PLCU0LEgjc9HzY6iuM+YBLxdLzrJjcVDlNWPVFn20rpzxMxcfdYNx008+J131
	 BpCA0oMV9nyJPilasKrAqHTMTXF5diFqCEYxiUnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BD94F898DC;
	Thu,  6 Jun 2019 23:30:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D22F89849; Thu,  6 Jun 2019 23:28:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 495AFF897A6
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 495AFF897A6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EcWbVOUn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8JvFGQ8uCKHqTUj2vqCcaJXaj130xK4YX+jAZ19+SB8=; b=EcWbVOUnXtvi
 syqX1Lqwl8XW+Fl/XmRTtlGagFvqzBR4hGdr83avG0nfYZn4gAx4Yux0XAsVjEv4BP5SZfsRpTOga
 R0aAMi4r3TZmFmWt9vn/lW973f+eVjRzmQTqNNjTzXLv6DceMb06le5F85mR4bACfaGnZJhByCeNp
 FZgOY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuC-0007OP-0I; Thu, 06 Jun 2019 21:26:40 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8321E440049; Thu,  6 Jun 2019 22:26:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o93bicua.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212639.8321E440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:39 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: atmel-pdmic: use modern dai_link
	style" to the asoc tree
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

   ASoC: atmel: atmel-pdmic: use modern dai_link style

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

From f62da10aba7cc7971dace102ad5cc129e4dfbd94 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:14:00 +0900
Subject: [PATCH] ASoC: atmel: atmel-pdmic: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel-pdmic.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 915c2b064de1..f53213402d94 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -511,17 +511,30 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 {
 	struct snd_soc_dai_link *dai_link;
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai_link_component *comp;
 
 	dai_link = devm_kzalloc(dev, sizeof(*dai_link), GFP_KERNEL);
 	if (!dai_link)
 		return -ENOMEM;
 
+	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
+	if (!comp)
+		return -ENOMEM;
+
+	dai_link->cpus		= &comp[0];
+	dai_link->codecs	= &comp[1];
+	dai_link->platforms	= &comp[2];
+
+	dai_link->num_cpus	= 1;
+	dai_link->num_codecs	= 1;
+	dai_link->num_platforms	= 1;
+
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
-	dai_link->codec_dai_name	= ATMEL_PDMIC_CODEC_DAI_NAME;
-	dai_link->cpu_dai_name		= dev_name(dev);
-	dai_link->codec_name		= dev_name(dev);
-	dai_link->platform_name		= dev_name(dev);
+	dai_link->codecs->dai_name	= ATMEL_PDMIC_CODEC_DAI_NAME;
+	dai_link->cpus->dai_name	= dev_name(dev);
+	dai_link->codecs->name		= dev_name(dev);
+	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
