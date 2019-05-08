Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBD17496
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0DA1A99;
	Wed,  8 May 2019 11:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0DA1A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306533;
	bh=AbxRgYfebVWeH0yB9VhgS0gosiHYmK05K6jXuQAkYK4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vO3DrcXXKVsh/vtwyVl/dPReNI/sqzlIHClSZTqOBck7mhZO7vD3vGORaOomxkkZR
	 GBnUT8srY4/9fVaPhFBlGsiq7agCLfVVJ39nZw5ARK5jdEq6G8RbX65j7qcZ4yXEsB
	 Obh+tDdg812D97Rkfty73paIWqPpwYVynPM4iq9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70BA7F89756;
	Wed,  8 May 2019 11:02:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DB36F89748; Wed,  8 May 2019 11:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05F95F8973C
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05F95F8973C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="d2enb8Qh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=itVQj7YwHYdYXi1bHkaH+CRH+HdJ9sncmv6BMdzBVGk=; b=d2enb8Qh+jPO
 1CuXS1wuq0A0f61rxyI7MopGthO6m+y/EWiuEOVl6mVy6BbfJJpn6F8MMeD6koa1CUYlMAXswCvZO
 KqAg8ok6q1jVWBubc8v7VIP2WtRWTsuDNoX/v/ffrjuh0EJDgMysosHR5hDWEJa1KDfYX5kHJYJL8
 TE6ek=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISQ-0007e1-1v; Wed, 08 May 2019 09:01:49 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 61F98440040; Wed,  8 May 2019 10:01:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190507101220.182466-2-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090132.61F98440040@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:32 +0100 (BST)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tiwai@suse.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt6358: initialize setting
	when ramping volume" to the asoc tree
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

   ASoC: mediatek: mt6358: initialize setting when ramping volume

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From bdb8fa6b09a801a6cbe3c2487f0228860f9c5aba Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 7 May 2019 18:12:18 +0800
Subject: [PATCH] ASoC: mediatek: mt6358: initialize setting when ramping
 volume

Mt6358 ramps up from the smallest volume (i.e. -10dB) to target dB when
opening and ramps down from target dB to mute (i.e. -40dB) when closing.
If target is equal to -10dB when opening, headset_volume_ramp() simply
leaves current setting (which may not be -10dB) unchanged.

Execute the loop at least once to initialize the setting to the
starting point (i.e. from).

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index d4c4fee6d3d9..96547ae50a5d 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -405,10 +405,9 @@ static bool is_valid_hp_pga_idx(int reg_idx)
 	       reg_idx == DL_GAIN_N_40DB;
 }
 
-static void headset_volume_ramp(struct mt6358_priv *priv,
-				int from, int to)
+static void headset_volume_ramp(struct mt6358_priv *priv, int from, int to)
 {
-	int offset = 0, count = 1, reg_idx;
+	int offset = 0, count = 0, reg_idx;
 
 	if (!is_valid_hp_pga_idx(from) || !is_valid_hp_pga_idx(to))
 		dev_warn(priv->dev, "%s(), volume index is not valid, from %d, to %d\n",
@@ -422,7 +421,7 @@ static void headset_volume_ramp(struct mt6358_priv *priv,
 	else
 		offset = from - to;
 
-	while (offset > 0) {
+	while (offset >= 0) {
 		if (to > from)
 			reg_idx = from + count;
 		else
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
