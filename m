Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C61E4B8F7
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7A91682;
	Wed, 19 Jun 2019 14:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7A91682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560948297;
	bh=Ao87cQgmMQfDE1h6JqfIhsEffAy8imAAjRvYxq0JKn8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sJSKwig806t0Ibas9DywGvd4+X044oSrredBeugJqhgpdPqjYGsgA9XdmjX5x4hbA
	 uz4yOnLnymrdve1EtT0U8dZ4FqKmwWTuu3h1upBehBBJkZTi0hjzjKt2F15u1x1ROR
	 YGz1EfJRLBozX9+UXP4mhaP6ccP0itxqoALeIGX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4C81F89835;
	Wed, 19 Jun 2019 14:13:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58826F89789; Wed, 19 Jun 2019 14:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3C5FF89752
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3C5FF89752
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BedFW0wB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+/OxKd3DDcA37jU3C3ZujQr8/xM0okIA7ss42VgZ/IA=; b=BedFW0wB6KHk
 ETgkIOFab+uDret4Pbz7z5pybYb+Cn3pbfkrvSckN+/0dyk86OHYdW1XQOntOsk2h2Ld3ntsKOwm6
 bgB7omH7jJqBfMi+UxOYQ2iJxaC7WTIxvlm2wtWHrvyziZGADBpAPNqOZHAbqnHeHl4TgYAsReGuo
 0Xgrw=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRd-0007Cv-Dy; Wed, 19 Jun 2019 12:12:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E6E7B44004C; Wed, 19 Jun 2019 13:12:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e9itlgo.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121204.E6E7B44004C@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:04 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc.h: fixup for_each_card_links()
	macro" to the asoc tree
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

   ASoC: soc.h: fixup for_each_card_links() macro

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

From 5f174cf75a8cb14d50c1cecfb3884ae82f754058 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:27:52 +0900
Subject: [PATCH] ASoC: soc.h: fixup for_each_card_links() macro

Macro is using "link", not "dai_link"

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 055e6d035e04..80c1ca3a62c7 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1230,7 +1230,7 @@ struct snd_soc_card {
 	     (i)++)
 
 #define for_each_card_links(card, link)				\
-	list_for_each_entry(dai_link, &(card)->dai_link_list, list)
+	list_for_each_entry(link, &(card)->dai_link_list, list)
 #define for_each_card_links_safe(card, link, _link)			\
 	list_for_each_entry_safe(link, _link, &(card)->dai_link_list, list)
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
