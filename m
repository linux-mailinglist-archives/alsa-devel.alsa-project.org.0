Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D601A8041
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2989169D;
	Tue, 14 Apr 2020 16:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2989169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586875694;
	bh=IutWf6tVbjBkpct5Tu3pL3Kx0ZUbXBXAJ5rrXZM3Slo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dlu9ZYxDe8ktqh9ZCOqYCGYNKmTXbD53vzFfANvBmptBlTguzKbphPV+Aj4xlKX6b
	 IAWoXhYSL25qPNZIcK7CCwNwQicVZENAnzE0rlXmuCbYsxSnkxn4VAiAijjrVi6xyA
	 iVpzy+g0Rvah4DlCBnogeZh8rNKO6wEq6c2ZliFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4335AF8028C;
	Tue, 14 Apr 2020 16:46:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51373F8028B; Tue, 14 Apr 2020 16:46:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A204AF8016F
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A204AF8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QdZMnmSC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC37F2076D;
 Tue, 14 Apr 2020 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875558;
 bh=IutWf6tVbjBkpct5Tu3pL3Kx0ZUbXBXAJ5rrXZM3Slo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=QdZMnmSC3jo7Ek/0LUhLRrcvc/r4RcN8KTScM8T6J9XxoI7anzE/TbhNEnm67J1//
 NBT1wSbmaNDMEtitSTBRAnCkyGU7GWwcg6BU9JeMGk3A++syr7zZ7NS/r7vmci6O2O
 5RIAXQ9phKaEHsny6ZZyQ+fXerF84z9PxN+IxTvg=
Date: Tue, 14 Apr 2020 15:45:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Applied "ASoC: madera: Remove a couple of stray blank lines" to the
 asoc tree
In-Reply-To: <20200409181311.30247-1-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20200409181311.30247-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

   ASoC: madera: Remove a couple of stray blank lines

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

From bcbc13d28f7f7bcacb3594f72e68c8e57167a836 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Thu, 9 Apr 2020 19:13:11 +0100
Subject: [PATCH] ASoC: madera: Remove a couple of stray blank lines

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200409181311.30247-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/madera.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 40de9d7811d1..a448d2a2918a 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -1903,7 +1903,6 @@ const struct soc_enum madera_isrc_fsh[] = {
 			      MADERA_ISRC4_FSH_SHIFT, 0xf,
 			      MADERA_RATE_ENUM_SIZE,
 			      madera_rate_text, madera_rate_val),
-
 };
 EXPORT_SYMBOL_GPL(madera_isrc_fsh);
 
@@ -1924,7 +1923,6 @@ const struct soc_enum madera_isrc_fsl[] = {
 			      MADERA_ISRC4_FSL_SHIFT, 0xf,
 			      MADERA_RATE_ENUM_SIZE,
 			      madera_rate_text, madera_rate_val),
-
 };
 EXPORT_SYMBOL_GPL(madera_isrc_fsl);
 
@@ -1938,7 +1936,6 @@ const struct soc_enum madera_asrc1_rate[] = {
 			      MADERA_ASYNC_RATE_ENUM_SIZE,
 			      madera_rate_text + MADERA_SYNC_RATE_ENUM_SIZE,
 			      madera_rate_val + MADERA_SYNC_RATE_ENUM_SIZE),
-
 };
 EXPORT_SYMBOL_GPL(madera_asrc1_rate);
 
@@ -1964,7 +1961,6 @@ const struct soc_enum madera_asrc2_rate[] = {
 			      MADERA_ASYNC_RATE_ENUM_SIZE,
 			      madera_rate_text + MADERA_SYNC_RATE_ENUM_SIZE,
 			      madera_rate_val + MADERA_SYNC_RATE_ENUM_SIZE),
-
 };
 EXPORT_SYMBOL_GPL(madera_asrc2_rate);
 
-- 
2.20.1

