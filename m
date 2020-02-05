Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 909091528D9
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 11:07:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329031684;
	Wed,  5 Feb 2020 11:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329031684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580897266;
	bh=miFf0NjKNlKW1nQYsNKidRoX/GH/eHMu7chKsdmnF2g=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oLpImmdxf/SOXGig1/CZEPC5h1wiYw+uEkq1SMfEMN25g7agDT88eZQoJavY23Fbm
	 oebtRr6uh9MSe3nA/pkLb+UfYTKHtGVW9rn30vlpUAwVGToQ0QRoye9RFL277NUDiG
	 W6nvXkqrk7LpZDG3xTKdlg7TO9HsdRI360/CZ19c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27CEFF80148;
	Wed,  5 Feb 2020 11:06:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 543F6F80148; Wed,  5 Feb 2020 11:06:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E257F80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 11:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E257F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FwZ3FTZB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=A5wlAvzYuuyw/lJ8xTeNin0AyoeXmNQPK3Uj4VxKxHA=; b=FwZ3FTZBAxil
 Hqp2wHP41VqRWUSIbId1g0prfYEx0I3vVuAGnkLhkk1BLb2INYvV5DX5P3KDKVeoUcvAbF/quWTSs
 yUEwUzXsLrf+RJecjDGZX+kxJvNrKIa4PtVLLOxQ8f1GIFsnzs3NOo0UEN2l5a9QID9ZbybcJyhTD
 s3jtE=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izHZC-0003qV-Pg; Wed, 05 Feb 2020 10:05:54 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7B621D01D7F; Wed,  5 Feb 2020 10:05:54 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <20200204131857.7634-1-geert@linux-m68k.org>
Message-Id: <applied-20200204131857.7634-1-geert@linux-m68k.org>
X-Patchwork-Hint: ignore
Date: Wed,  5 Feb 2020 10:05:54 +0000 (GMT)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] Applied "ASoC: wcd934x: Add missing COMMON_CLK
	dependency to SND_SOC_ALL_CODECS" to the asoc tree
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

   ASoC: wcd934x: Add missing COMMON_CLK dependency to SND_SOC_ALL_CODECS

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 13426feaf46c48fcddb591e89d35120fcc90527f Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2020 14:18:57 +0100
Subject: [PATCH] ASoC: wcd934x: Add missing COMMON_CLK dependency to
 SND_SOC_ALL_CODECS

Just adding a dependency on COMMON_CLK to SND_SOC_WCD934X is not
sufficient, as enabling SND_SOC_ALL_CODECS will still select it,
breaking the build later:

    WARNING: unmet direct dependencies detected for SND_SOC_WCD934X
      Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && COMMON_CLK [=n] && MFD_WCD934X [=m]
      Selected by [m]:
      - SND_SOC_ALL_CODECS [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && COMPILE_TEST [=y] && MFD_WCD934X [=m]
    ...
    ERROR: "of_clk_add_provider" [sound/soc/codecs/snd-soc-wcd934x.ko] undefined!
    ERROR: "of_clk_src_simple_get" [sound/soc/codecs/snd-soc-wcd934x.ko] undefined!
    ERROR: "clk_hw_register" [sound/soc/codecs/snd-soc-wcd934x.ko] undefined!
    ERROR: "__clk_get_name" [sound/soc/codecs/snd-soc-wcd934x.ko] undefined!

Fix this by adding the missing dependency to SND_SOC_ALL_CODECS

Fixes: 42b716359beca106 ("ASoC: wcd934x: Add missing COMMON_CLK dependency")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20200204131857.7634-1-geert@linux-m68k.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 286514865960..7e90f5d83097 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -214,7 +214,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_UDA134X
 	select SND_SOC_UDA1380 if I2C
 	select SND_SOC_WCD9335 if SLIMBUS
-	select SND_SOC_WCD934X if MFD_WCD934X
+	select SND_SOC_WCD934X if MFD_WCD934X && COMMON_CLK
 	select SND_SOC_WL1273 if MFD_WL1273_CORE
 	select SND_SOC_WM0010 if SPI_MASTER
 	select SND_SOC_WM1250_EV1 if I2C
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
