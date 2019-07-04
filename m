Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 384BA5F817
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 14:28:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B719816BE;
	Thu,  4 Jul 2019 14:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B719816BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562243292;
	bh=nHRw99Yew06qLGtCGjayWmAWIFbPJszANZ+x0RRktQo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PDMrnlyN8oL4s+d+8LAO8ctAkY96hnr3Pr/c7mt8i/9qR6X5h4tn/RoWi35UuQ38H
	 SB/FfJaJXrDhW7DqyTw0nxxXrAlktdMgDcN1s0jbvQSUMm91SC2Y22MIDbYveddDf2
	 yr/CGkzXLtYfbkbw6bHf3u64dVuJ/1qdhGo7mAAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9E33F80135;
	Thu,  4 Jul 2019 14:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5523F80113; Thu,  4 Jul 2019 14:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2848F80110
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 14:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2848F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mm0hugq4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vFXKWZbVlhtP1uV3m8Dyf6rla7JmlnmBJTS3Fskfk3I=; b=mm0hugq4fRA9
 ejjmmKIjkCCbP7VOXFMeeNif7zZri8yEK7qmskL8U7p2b+jCRPmiVLtu4JmoSTdofNT5ysqXHwzS/
 YoaFUueq/YaFHVaf30i0SPNttcVfLhL9NjRpUFUtp8Bj35V6E1mxHhomEcsCse8y8VJrWldu+Zn6Z
 otkRo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hj0nH-0000ig-9E; Thu, 04 Jul 2019 12:24:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A00DD274389C; Thu,  4 Jul 2019 13:24:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190703120749.32341-2-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190704122454.A00DD274389C@ypsilon.sirena.org.uk>
Date: Thu,  4 Jul 2019 13:24:54 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: meson: axg-tdm-formatter: add reset to
	the bindings documentation" to the asoc tree
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

   ASoC: meson: axg-tdm-formatter: add reset to the bindings documentation

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

From 094380ea2bf9f0fa7d63e67bf500b8c77e8d1910 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 3 Jul 2019 14:07:48 +0200
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: add reset to the bindings
 documentation

Add an optional reset property to the tdm formatter bindings. The
dedicated reset line is present on some SoC families, such as the g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190703120749.32341-2-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/amlogic,axg-tdm-formatters.txt           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 3b94a715a0b9..8835a43edfbb 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -15,11 +15,15 @@ Required properties:
   * "lrclk"    : sample clock
   * "lrclk_sel": sample clock input multiplexer
 
-Example of TDMOUT_A on the A113 SoC:
+Optional property:
+- resets: phandle to the dedicated reset line of the tdm formatter.
+
+Example of TDMOUT_A on the S905X2 SoC:
 
 tdmout_a: audio-controller@500 {
 	compatible = "amlogic,axg-tdmout";
 	reg = <0x0 0x500 0x0 0x40>;
+	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
 	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
 		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
 		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
