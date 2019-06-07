Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFF39199
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 18:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D41166A;
	Fri,  7 Jun 2019 18:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D41166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559923643;
	bh=0psXz+iQa0ozcHZ38rWpZJMvv5Nv5afsJCrUYFc6tQw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RUstas1XiUoYi3SoMNIj1a83iPGO7VFfeKd2je/LObmLRSyEPB+MR1pW/xt380f0q
	 gNu+bGystvoJtMeW4Ym6QZ8YdM7gsTvfF83QRUF/ZLd95Q40kMTN/SvR6bWZoGg0nq
	 79V+geUrIivpXm80lOq0NCGLkeU89pme+uisYW9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2421F896DD;
	Fri,  7 Jun 2019 18:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F206F896DD; Fri,  7 Jun 2019 18:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96E15F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 18:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E15F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ahu4xvPI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=F5Q6SDucHCUyArIf+VBj29Tx+7bgPxubS3Fhj6FnEtg=; b=ahu4xvPIc4cQ
 3gUMTAuQ0eSlRnw1wcqOITvyqtK1aOQgwRgYfAqEP2096QNCm9RTrmFkLF5jyZ0P+tOQ/pJLdRhXb
 vRJl8+p8Q/C8Zzzqp+/+r9EmJ+XC3+XjHVkPR77FbfZc6krqsmmjjqV4D34SnF8sKFWQSKgvrgwrf
 fGqu8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hZHMx-0002sz-Fz; Fri, 07 Jun 2019 16:05:31 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 94376440046; Fri,  7 Jun 2019 17:05:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20190607154926.11373-1-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20190607160530.94376440046@finisterre.sirena.org.uk>
Date: Fri,  7 Jun 2019 17:05:30 +0100 (BST)
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, lgirdwood@gmail.com,
 krzk@kernel.org, tzungbi@google.com, Mark Brown <broonie@kernel.org>,
 festevam@gmail.com, m.szyprowski@samsung.com
Subject: [alsa-devel] Applied "ASoC: Remove erroneous
	soc_cleanup_card_resources() call" to the asoc tree
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

   ASoC: Remove erroneous soc_cleanup_card_resources() call

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

From 0779935938b1b6f492f019764bc7dda77bb08ec9 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 7 Jun 2019 17:49:26 +0200
Subject: [PATCH] ASoC: Remove erroneous soc_cleanup_card_resources() call

When soc_init_dai_link() call at the beginning of snd_soc_instantiate_card
function fails soc_cleanup_card_resources() and then snd_soc_dapm_free()
gets called with an incompletely initialized card->dapm. In particular
card->dapm.card is NULL and it gets dereferenced in dapm_free_widgets().
Also dapm->list is invalid and there is an invalid pointer dereference
from list_del().

The function call stack (deferred probing) on Chromebook Snow where this
issue has shown up in today's -next is:

 snd_soc_dapm_free
 soc_cleanup_card_resources
 snd_soc_instantiate_card
 snd_soc_register_card
 devm_snd_soc_register_card
 snow_probe

In patch 70fc53734e71 "ASoC: core: move DAI pre-links initiation to
snd_soc_instantiate_card" there is an soc_cleanup_platform() call instead
of soc_cleanup_card_resources() as in current -next.

soc_cleanup_platform got renamed to soc_cleanup_legacy, then removed
in commit adb76b5b9c47 "ASoC: soc-core: remove legacy style dai_link".

It seems in merge conflict resolution the soc_cleanup_platform() call got
renamed to soc_cleanup_card_resources(), instead of being removed.

Correct this by removing an unnecessary soc_cleanup_card_resources() call.

Fixes: a8e992342ce4 ("Merge branch 'asoc-5.2' into asoc-5.3")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Suggested-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 94a36ee8eb22..f0fa289c90d8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1986,7 +1986,6 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = soc_init_dai_link(card, dai_link);
 		if (ret) {
-			soc_cleanup_card_resources(card);
 			dev_err(card->dev, "ASoC: failed to init link %s: %d\n",
 				dai_link->name, ret);
 			mutex_unlock(&client_mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
