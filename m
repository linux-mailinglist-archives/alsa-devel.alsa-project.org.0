Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E83D15B7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 19:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BCA51694;
	Wed,  9 Oct 2019 19:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BCA51694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570641919;
	bh=gyO+ekhRjGRhpQluBIAzPEc0Of7ih1J7MjTzMxdkHik=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=t8jSuo2Vgd8tvteoShxMjNf1mE5UDfa5emWuvV+CUUGIOCQmnSdUvqjmb38JbeshT
	 0RV+piPNMr+PUekfftRW2poZC174CUlPgc2GTnXkx+CkycRGapvTqkHBDGXJh7Z5+K
	 FmM1Hp3C0wpQRlZTAf0l5J+3K/y/9/WZCUGhyb1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44220F80611;
	Wed,  9 Oct 2019 19:22:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72436F802DF; Wed,  9 Oct 2019 19:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FD79F802BE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 19:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FD79F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NF9/Mx18"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pz74bknz997j+mbCprEwkouLntFbN+WYwKb9bknd7z0=; b=NF9/Mx18Kz0v
 YIL+dR5MoM9xvdC1mu1883UhUY9H1bCAeExmrq2aIxUNL+yhuAG0OeGYBf8GDwVFa00ak40Oda4f2
 j8oBCCbpAPczOzr1cF+Nr88t+N3ysugyhrSH/7sSz1i7/lvC90uFpnZmduyeD9YrXcUjRMmO6rgZm
 YbTbc=;
Received: from 188.31.199.195.threembb.co.uk ([188.31.199.195]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIFer-0005Jt-Jh; Wed, 09 Oct 2019 17:21:54 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 77012D03ED5; Wed,  9 Oct 2019 18:21:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191009153615.32105-3-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20191009172148.77012D03ED5@fitzroy.sirena.org.uk>
Date: Wed,  9 Oct 2019 18:21:48 +0100 (BST)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com
Subject: [alsa-devel] Applied "ASoC: simple_card_utils.h: Fix potential
	multiple redefinition error" to the asoc tree
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

   ASoC: simple_card_utils.h: Fix potential multiple redefinition error

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

From af6219590b541418d3192e9bfa03989834ca0e78 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 9 Oct 2019 18:36:15 +0300
Subject: [PATCH] ASoC: simple_card_utils.h: Fix potential multiple
 redefinition error

asoc_simple_debug_info and asoc_simple_debug_dai must be static
otherwise we might a compilation error if the compiler decides
not to inline the given function.

Fixes: 0580dde59438686d ("ASoC: simple-card-utils: add asoc_simple_debug_info()")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20191009153615.32105-3-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/simple_card_utils.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 985a5f583de4..31f76b6abf71 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -135,9 +135,9 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
 
 #ifdef DEBUG
-inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
-				  char *name,
-				  struct asoc_simple_dai *dai)
+static inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
+					 char *name,
+					 struct asoc_simple_dai *dai)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
@@ -167,7 +167,7 @@ inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
 		dev_dbg(dev, "%s clk %luHz\n", name, clk_get_rate(dai->clk));
 }
 
-inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
+static inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct device *dev = simple_priv_to_dev(priv);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
