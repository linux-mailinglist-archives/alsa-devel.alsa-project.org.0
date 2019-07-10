Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D826649CB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F76167F;
	Wed, 10 Jul 2019 17:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F76167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562773082;
	bh=jEPX57UQnCFsZk9LVahqWXdWHRMppZAH8r89uHp1d0s=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qtJHK2AGQmGf3dnGsiwwJr2k9tQj0wsuj8KDl0ldCVLCf7zZqbmrSJPilxtgXRMCR
	 X+8UQrfOjm4rqHY0hllHah+3FOYHY1m+iHC0qgl9VzA/R/jKLxcdUW6puIzAyzaOLM
	 DMQttGl6c91U/dNR3iMVrbMAh6hIpHCkJ3+NWGEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA59EF80362;
	Wed, 10 Jul 2019 17:34:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F0FF802BE; Wed, 10 Jul 2019 17:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E68EF800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E68EF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Uv1gESDP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=OJOmdq13zo6Dlox6R8w0maL9PomW9D3dvtCqc3uExQc=; b=Uv1gESDPPiCo
 lPtmbPmjX2y7Nie7E7zeXLbxWyxlbzrpfP4w0oixJ3/Zqlg2FvIFK8z6fGrvMBqFjZ0Z8+X0MmVno
 muBDH6DP8ngecW5Z1u8tR2AB8XQzu6nVOPXyibfEuYRa0JuncpO6LvvNfjnCeCFHpPlABQ0A42tud
 Raqcw=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlEcG-00082w-Ir; Wed, 10 Jul 2019 15:34:44 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3A14AD02D7C; Wed, 10 Jul 2019 16:34:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Wen Yang <wen.yang99@zte.com.cn>
In-Reply-To: <1562743509-30496-3-git-send-email-wen.yang99@zte.com.cn>
X-Patchwork-Hint: ignore
Message-Id: <20190710153444.3A14AD02D7C@fitzroy.sirena.org.uk>
Date: Wed, 10 Jul 2019 16:34:44 +0100 (BST)
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 jonathanh@nvidia.com, Mark Brown <broonie@kernel.org>, xue.zhihong@zte.com.cn,
 cheng.shengyu@zte.com.cn
Subject: [alsa-devel] Applied "ASoC: simple-card: fix an use-after-free in
	simple_for_each_link()" to the asoc tree
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

   ASoC: simple-card: fix an use-after-free in simple_for_each_link()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 27862d5a3325bc531ec15e3c607e44aa0fd57f6f Mon Sep 17 00:00:00 2001
From: Wen Yang <wen.yang99@zte.com.cn>
Date: Wed, 10 Jul 2019 15:25:07 +0800
Subject: [PATCH] ASoC: simple-card: fix an use-after-free in
 simple_for_each_link()

The codec variable is still being used after the of_node_put() call,
which may result in use-after-free.

Fixes: d947cdfd4be2 ("ASoC: simple-card: cleanup DAI link loop method - step1")
Link: https://lore.kernel.org/r/1562743509-30496-3-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 4117e54884e5..ef849151ba56 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -364,8 +364,6 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			goto error;
 		}
 
-		of_node_put(codec);
-
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
 		for_each_child_of_node(node, np)
@@ -387,11 +385,13 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 				ret = func_noml(priv, np, codec, li, is_top);
 
 			if (ret < 0) {
+				of_node_put(codec);
 				of_node_put(np);
 				goto error;
 			}
 		}
 
+		of_node_put(codec);
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
