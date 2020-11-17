Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59942B6D4A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 19:24:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394EA177D;
	Tue, 17 Nov 2020 19:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394EA177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605637499;
	bh=6fPjH1p4OEDwhAthW2t5XBg4jhLVTq2J3Bcpqy7YEsw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=orxXjB+4BGuMI0gJq2dkgiBqQD7HxLcX6RcC6gC9I3rkyLe6weKz0EYfUzAkxCuYz
	 C+HI0AYPQrlE4JZDZzDeJH7qgRCKmipOgRywYffMwGCrRK6e0GzrGgKHdclxfmyL+S
	 uq3TwZhzyvoy6aHbvvwXgJU1PYubKfvUt4wlsZkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B031F801F9;
	Tue, 17 Nov 2020 19:23:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FCC6F801F5; Tue, 17 Nov 2020 19:23:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1492F800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 19:23:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1492F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L/+HjC+z"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 415B120888;
 Tue, 17 Nov 2020 18:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605637397;
 bh=6fPjH1p4OEDwhAthW2t5XBg4jhLVTq2J3Bcpqy7YEsw=;
 h=From:To:Cc:Subject:Date:From;
 b=L/+HjC+ztmF+YH9wqUFSJPSVpHbs2HUlLGRbTsilfrP6Ye8VKv3M79SRKqhGYBYPd
 2z86ReOlGB9A5LwChU2dcL8NsJUQu76a9m0mwY21iO1U5B1sjLl+YBCcWvrp7313Ez
 iUtNYIDrqe5NCCtjNIf6971xPHd986c5Yt91taQ8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Samuel Holland <samuel@sholland.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: sunxi: do not select COMMON_CLK to fix builds
Date: Tue, 17 Nov 2020 19:23:10 +0100
Message-Id: <20201117182310.73609-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

COMMON_CLK is a user-selectable option with its own dependencies.  The
most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
should not select COMMON_CLK because they will create a dependency cycle
and build failures.  For example on MIPS a configuration with COMMON_CLK
(selected by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (selected by
SOC_RT305X) is possible:

  WARNING: unmet direct dependencies detected for COMMON_CLK
    Depends on [n]: !HAVE_LEGACY_CLK [=y]
    Selected by [y]:
    - SND_SUN8I_CODEC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
      (ARCH_SUNXI || COMPILE_TEST [=y]) && OF [=y] && (MACH_SUN8I || ARM64 && ARCH_SUNXI || COMPILE_TEST [=y])

    /usr/bin/mips-linux-gnu-ld: drivers/clk/clk.o: in function `clk_set_rate':
    (.text+0xaeb4): multiple definition of `clk_set_rate'; arch/mips/ralink/clk.o:(.text+0x88): first defined here

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Samuel Holland <samuel@sholland.org>

---

Changes since v1:
1. Do not select COMMON_CLK in arch/arm/mach-sunxi/Kconfig,
2. Add Samuel's review.
---
 sound/soc/sunxi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 69b9d8515335..ddcaaa98d3cb 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -14,7 +14,7 @@ config SND_SUN8I_CODEC
 	tristate "Allwinner SUN8I audio codec"
 	depends on OF
 	depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
-	select COMMON_CLK
+	depends on COMMON_CLK
 	select REGMAP_MMIO
 	help
 	  This option enables the digital part of the internal audio codec for
-- 
2.25.1

