Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C098B5A25A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:29:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F368173F;
	Fri, 28 Jun 2019 19:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F368173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561742994;
	bh=+kNRb86yntmYFPJ22po3i4hfWr0mArRgfISHkWzkmKY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=byxxGOkvtJ5mKTRj7caPoDmNhplZAC8ffh6O36IbltQ9kuj9pDG9T0/xoUZ13on+V
	 Gs7UPk65o6IqCw7RQBXB6Ly95RWUD86MeabLKrs6fv+uiHqROdZCWdvG+G6Yb6VlHV
	 BM/dwSym5mhNdIpSUh1x2ysx05Dsv9ZuebX+KplA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D718BF8981F;
	Fri, 28 Jun 2019 18:58:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F9AF89783; Fri, 28 Jun 2019 18:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00F5EF89753
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00F5EF89753
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bgpibUjt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ecIA+WKfp5Dim18TsWkMPLdTo8UyAuEPpYiOnFVbOeE=; b=bgpibUjtu/Wu
 dqFPepZZSSjLL8ajojpvvnFlDJik2XlCFpoq3h4EesaqHWlKbN8/neuLZQ5Iu0gF4jVT/N1bD2zeV
 aZZ0OKrngbxsDJwahuyjET6lwbhNlKeKlZ9ZCceKovxUZdEiKmzfBl5qxlJ3ejE75xniMGGy+MNa7
 inXsg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAm-0007Bd-P3; Fri, 28 Jun 2019 16:56:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3FB8B44004C; Fri, 28 Jun 2019 17:56:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190627121350.21027-2-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165628.3FB8B44004C@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:28 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: soc-core: defer card registration if
	codec component is missing" to the asoc tree
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

   ASoC: soc-core: defer card registration if codec component is missing

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

From af18b13fedae4637b439d1265038b30929ca5a4c Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 27 Jun 2019 14:13:49 +0200
Subject: [PATCH] ASoC: soc-core: defer card registration if codec component is
 missing

Like cpus and platforms, defer sound card initialization if the codec
component is missing when initializing the dai_link

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 05cd710273b6..b5f3c09311c3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1071,12 +1071,20 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 				link->name);
 			return -EINVAL;
 		}
+
 		/* Codec DAI name must be specified */
 		if (!codec->dai_name) {
 			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
 				link->name);
 			return -EINVAL;
 		}
+
+		/*
+		 * Defer card registration if codec component is not added to
+		 * component list.
+		 */
+		if (!soc_find_component(codec))
+			return -EPROBE_DEFER;
 	}
 
 	/*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
