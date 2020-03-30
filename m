Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BDF198247
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 19:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770C41658;
	Mon, 30 Mar 2020 19:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770C41658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585589131;
	bh=7HNUQ6LApCrvEOhugCuwDfj2q32nlAmC5mytwFWP0hs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=g0DgNnBw504s1006WM9g2sMvKko5qixGNBSSLz7qNIx+/BOKrO7TEWd41WpkLu4Q8
	 4YMNeMHOMzZ3jMf23IM2AnE9GvUU0nE10rPOLoE4G3lpjNE/o1CqDXww9PkuDmwCUA
	 dnaO4IEjP3xRc9AoWwWxbhFSoLPNEFiS1RFDYfZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C3D5F8015C;
	Mon, 30 Mar 2020 19:23:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2385F8010C; Mon, 30 Mar 2020 19:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MIME_8BIT_HEADER, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DD19EF8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 19:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD19EF8010C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99E18101E;
 Mon, 30 Mar 2020 10:23:01 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EF953F68F;
 Mon, 30 Mar 2020 10:23:00 -0700 (PDT)
Date: Mon, 30 Mar 2020 18:22:59 +0100
From: Mark Brown <broonie@kernel.org>
To: 이경택 <gt82.lee@samsung.com>
Subject: Applied "ASoC: fix regwmask" to the asoc tree
In-Reply-To: <001001d60665$db7af3e0$9270dba0$@samsung.com>
Message-Id: <applied-001001d60665$db7af3e0$9270dba0$@samsung.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, Gyeongtaek Lee <gt82.lee@samsung.com>, lgirdwood@gmail.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: fix regwmask

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

From 0ab070917afdc93670c2d0ea02ab6defb6246a7c Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?=EC=9D=B4=EA=B2=BD=ED=83=9D?= <gt82.lee@samsung.com>
Date: Mon, 30 Mar 2020 16:35:59 +0900
Subject: [PATCH] ASoC: fix regwmask

If regwshift is 32 and the selected architecture compiles '<<' operator
for signed int literal into rotating shift, '1<<regwshift' became 1 and
it makes regwmask to 0x0.
The literal is set to unsigned long to get intended regwmask.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Link: https://lore.kernel.org/r/001001d60665$db7af3e0$9270dba0$@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 652657dc6809..55ffb34be95e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -825,7 +825,7 @@ int snd_soc_get_xr_sx(struct snd_kcontrol *kcontrol,
 	unsigned int regbase = mc->regbase;
 	unsigned int regcount = mc->regcount;
 	unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
-	unsigned int regwmask = (1<<regwshift)-1;
+	unsigned int regwmask = (1UL<<regwshift)-1;
 	unsigned int invert = mc->invert;
 	unsigned long mask = (1UL<<mc->nbits)-1;
 	long min = mc->min;
@@ -874,7 +874,7 @@ int snd_soc_put_xr_sx(struct snd_kcontrol *kcontrol,
 	unsigned int regbase = mc->regbase;
 	unsigned int regcount = mc->regcount;
 	unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
-	unsigned int regwmask = (1<<regwshift)-1;
+	unsigned int regwmask = (1UL<<regwshift)-1;
 	unsigned int invert = mc->invert;
 	unsigned long mask = (1UL<<mc->nbits)-1;
 	long max = mc->max;
-- 
2.20.1

