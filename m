Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6903F1AC9D2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED26829;
	Thu, 16 Apr 2020 17:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED26829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587050882;
	bh=Je+2heqtyGCACjbnBaORL/Xoy6YXSNIeA0Bzvqh+r0I=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sxL8TkvaIYAdBOtEdkh0pyChq59jqQvH+ADYFZDcK3YBaw57bdLj24YojuPyx++/N
	 M9Iea/BVHi77fDeWswx0hGAX8wgVqF1nfgNbMCfvr3W1vqoJaSj6L6Wc/8UsSdBlOT
	 Gh+N+OTSX/gxUAmUQRpde/1VniB68vGxHC7AkmfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7E0F802A9;
	Thu, 16 Apr 2020 17:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C9BDF80115; Thu, 16 Apr 2020 17:23:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98924F80290
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98924F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A1plrI0C"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94D082223D;
 Thu, 16 Apr 2020 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587050632;
 bh=Je+2heqtyGCACjbnBaORL/Xoy6YXSNIeA0Bzvqh+r0I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=A1plrI0CiY7wygNk+xkLmg0J7xuhkzanqdyTTy13LCBwUjBgc1NflzkDgtopydN9N
 9EcDMLvqW3jFHs95xOT2tdqptSMTyh8V0DBnkyFs6Ovh/+ofR14l8TrL0afEVocE8z
 5sU5CmXqAlG+BFI9yWSzLNHcZ/PhbnIC6lJpx/go=
Date: Thu, 16 Apr 2020 16:23:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Blankertz <matthias.blankertz@cetitec.com>
Subject: Applied "ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode" to
 the asoc tree
In-Reply-To: <20200415141017.384017-2-matthias.blankertz@cetitec.com>
Message-Id: <applied-20200415141017.384017-2-matthias.blankertz@cetitec.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
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

   ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode

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

From a09fb3f28a60ba3e928a1fa94b0456780800299d Mon Sep 17 00:00:00 2001
From: Matthias Blankertz <matthias.blankertz@cetitec.com>
Date: Wed, 15 Apr 2020 16:10:16 +0200
Subject: [PATCH] ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode

The parent SSI of a multi-SSI setup must be fully setup, started and
stopped since it is also part of the playback/capture setup. So only
skip the SSI (as per commit 203cdf51f288 ("ASoC: rsnd: SSI parent cares
SWSP bit") and commit 597b046f0d99 ("ASoC: rsnd: control SSICR::EN
correctly")) if the SSI is parent outside of a multi-SSI setup.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20200415141017.384017-2-matthias.blankertz@cetitec.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/ssi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index fc5d089868df..d51fb3a39448 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -407,7 +407,7 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	 * We shouldn't exchange SWSP after running.
 	 * This means, parent needs to care it.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		goto init_end;
 
 	if (rsnd_io_is_play(io))
@@ -559,7 +559,7 @@ static int rsnd_ssi_start(struct rsnd_mod *mod,
 	 * EN is for data output.
 	 * SSI parent EN is not needed.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	ssi->cr_en = EN;
@@ -582,7 +582,7 @@ static int rsnd_ssi_stop(struct rsnd_mod *mod,
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	cr  =	ssi->cr_own	|
@@ -620,7 +620,7 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 	if (rsnd_is_gen1(priv))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
-- 
2.20.1

