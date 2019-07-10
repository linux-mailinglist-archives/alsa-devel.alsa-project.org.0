Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D93649DB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:41:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 655E116A9;
	Wed, 10 Jul 2019 17:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 655E116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562773272;
	bh=WOwWggw10ttRTAarGG0oFhqRf3vHqzC79bl9Itj0evU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=S+QHHFj1kKy2t1CZ4jnC+AhNBGUYfGlWlcUGhGEjcD8cZtpisKa2+Tpb2fZXv9pYN
	 cNwjDdVCbUdv5AZAlSHWWoo0CmvadT9WhcYlVdhPQTUy9MnfbGYknlkxxOViV4bsKu
	 JwDh0KQ64SDWVm8xHnwnODLYZtxKzbJEBWBnk1Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3336EF803D6;
	Wed, 10 Jul 2019 17:35:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1952F80369; Wed, 10 Jul 2019 17:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25361F80323
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25361F80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="I4oKAsPY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zEYE/fM+fUJTvgouP0rSljrDT6m2g/ZvpYi2J8zq2LE=; b=I4oKAsPY+oqd
 VXcXW9Fd5O5Vlz4I+Fw2ljqe+xYQ/Tv983hPXypZ6SbOwTqMunupGDIJAsnA5mHq8K+G2y7Spa4d4
 znZh/swdVLUrESDCmBL493UFuhgVHwY9XpZ++QhtqouX7oMfPRZ8qVHXBj5Yq8Ag2HdXjRBYBagDm
 mAn+o=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlEcL-00083I-Nr; Wed, 10 Jul 2019 15:34:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 62FF6D02DA6; Wed, 10 Jul 2019 16:34:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
In-Reply-To: <d198a3e6ed3a0e9070afeb6aca69903c3e985149.camel@perches.com>
X-Patchwork-Hint: ignore
Message-Id: <20190710153449.62FF6D02DA6@fitzroy.sirena.org.uk>
Date: Wed, 10 Jul 2019 16:34:49 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt1308: Remove executable attribute
	from source files" to the asoc tree
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

   ASoC: rt1308: Remove executable attribute from source files

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

From 72365164cbefe3afa7a146d27d502ed688bf7323 Mon Sep 17 00:00:00 2001
From: Joe Perches <joe@perches.com>
Date: Tue, 9 Jul 2019 10:22:16 -0700
Subject: [PATCH] ASoC: rt1308: Remove executable attribute from source files

These are source files not executable.

Signed-off-by: Joe Perches <joe@perches.com>
Link: https://lore.kernel.org/r/d198a3e6ed3a0e9070afeb6aca69903c3e985149.camel@perches.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308.c | 0
 sound/soc/codecs/rt1308.h | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 sound/soc/codecs/rt1308.c
 mode change 100755 => 100644 sound/soc/codecs/rt1308.h

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
old mode 100755
new mode 100644
diff --git a/sound/soc/codecs/rt1308.h b/sound/soc/codecs/rt1308.h
old mode 100755
new mode 100644
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
