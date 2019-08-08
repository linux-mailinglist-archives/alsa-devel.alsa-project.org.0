Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990286BAC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 22:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B4485D;
	Thu,  8 Aug 2019 22:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B4485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565296730;
	bh=yiInQ7hufCDAw16QJmEwFAtEpAJjzFPnXbepIbgBUu0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pRMWDuvjVSwUE4rNlJlQ+s8uR2M2YNX24sFytfd01qKCvrfYBkEsBy23ERYWm8lBz
	 xGBfGtiEvAu7ntm4EEqKyJlK+C9AMCODPa3yb7Z3JhavzGBtv6lrruEK/751Q3jui2
	 bOYSI4ipi34TOVSOyTgWygHX/+qUzQRkLNdt0xLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D41D8F8060F;
	Thu,  8 Aug 2019 22:33:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E818F80535; Thu,  8 Aug 2019 22:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E922F80535
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 22:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E922F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WrGmU+XX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1zJZ/glT8QKhqJbx+FDHKvJKE4qmzsqUonLyAZkyYOQ=; b=WrGmU+XXsP6a
 PfGOXM6t95CqAQZ8fVSP2nJxlopA0ECvg60nzZXor4HA02o1f9RbUU188zosdcvR3sdFDKXhpjq7m
 fzZhqy8q3HEtpqVtDTeZvqwJSRWkcRdKekT7MSRDwcndf1dyOCL7lKdzg8ehN1mAHgTZ1ggo+jk26
 ub0vo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvp6T-00041X-MT; Thu, 08 Aug 2019 20:33:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 31BC92742BDD; Thu,  8 Aug 2019 21:33:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blx1ahoi.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190808203341.31BC92742BDD@ypsilon.sirena.org.uk>
Date: Thu,  8 Aug 2019 21:33:41 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup for
	snd_soc_add_card_controls()" to the asoc tree
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

   ASoC: soc-core: tidyup for snd_soc_add_card_controls()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 9b98c7c2a0599084c7ed629b5f88f474d2578307 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 7 Aug 2019 10:31:08 +0900
Subject: [PATCH] ASoC: soc-core: tidyup for snd_soc_add_card_controls()

snd_soc_add_card_controls() registers controls by using
for(... i < num; ...). If controls was NULL, num should be zero.
Thus, we don't need to check about controls pointer.
This patch also cares missing return value.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87blx1ahoi.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index de95b68ce9ee..4b9ae867613c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2058,9 +2058,10 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	snd_soc_dapm_link_dai_widgets(card);
 	snd_soc_dapm_connect_dai_link_widgets(card);
 
-	if (card->controls)
-		snd_soc_add_card_controls(card, card->controls,
-					  card->num_controls);
+	ret = snd_soc_add_card_controls(card, card->controls,
+					card->num_controls);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
 				      card->num_dapm_routes);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
