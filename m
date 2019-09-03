Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4FA7227
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 20:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918FC16A9;
	Tue,  3 Sep 2019 20:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918FC16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567533732;
	bh=Nd6RfZffYrMXsvaYwSXgyFdzX3FHMPyfkcKzlumDLWc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IepSW+iOTe75xCpie78nSmiQNM3IwmvM4P5jGfCOYdHW3oLEId0QPeiD7tLlTQFwI
	 CufMK1ypcOqBZ/FI3zR7czri0vcIjwDIMhXMCewUTHcIUnCx4raSVcMrxza3rD1tQY
	 kJJrmjxxrqVcGysRhe0AuF8Lb+KUU/XVv6hytLZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3158F804A9;
	Tue,  3 Sep 2019 20:00:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239AFF8049B; Tue,  3 Sep 2019 20:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 370EDF8011E
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 20:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 370EDF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aJ8OyIbO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Z1/6KbixvXgzeLN5YqOSqKmNDnkEfTxK979SrcIDgOw=; b=aJ8OyIbO9+OM
 GENRjF/rGpQ/B6FMenV8d7b2xrnJqRJwcgDGyGH8w5enynE+WyAOmDUjXhG2gQrRxAkkCX+XL23pS
 Xqj9y2GYy8QrO4INslmwvVDbccEwT4GN0tp3xlbcQs9lYS72wwatBaS/Rwg6bCbKMweQy8vB9Uf5J
 5ntMs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5D6J-0000zX-4Y; Tue, 03 Sep 2019 18:00:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8E9D62740FDC; Tue,  3 Sep 2019 19:00:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
In-Reply-To: <20190903165322.20791-4-katsuhiro@katsuster.net>
X-Patchwork-Hint: ignore
Message-Id: <20190903180018.8E9D62740FDC@ypsilon.sirena.org.uk>
Date: Tue,  3 Sep 2019 19:00:18 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>
Subject: [alsa-devel] Applied "ASoC: es8316: add DT-bindings" to the asoc
	tree
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

   ASoC: es8316: add DT-bindings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 3a3edd6ffe671115c4b3d715f08ed0cf4e927ce1 Mon Sep 17 00:00:00 2001
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Date: Wed, 4 Sep 2019 01:53:22 +0900
Subject: [PATCH] ASoC: es8316: add DT-bindings

This patch adds missing DT-bindings document for Everest ES8316.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Link: https://lore.kernel.org/r/20190903165322.20791-4-katsuhiro@katsuster.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/everest,es8316.txt         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.txt

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.txt b/Documentation/devicetree/bindings/sound/everest,es8316.txt
new file mode 100644
index 000000000000..aefcff9c48a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.txt
@@ -0,0 +1,20 @@
+Everest ES8316 audio CODEC
+
+This device supports both I2C and SPI.
+
+Required properties:
+
+  - compatible  : should be "everest,es8316"
+  - reg : the I2C address of the device for I2C
+  - clocks : a list of phandle, should contain entries for clock-names
+  - clock-names : should include as follows:
+         "mclk" : master clock (MCLK) of the device
+
+Example:
+
+es8316: codec@11 {
+	compatible = "everest,es8316";
+	reg = <0x11>;
+	clocks = <&clks 10>;
+	clock-names = "mclk";
+};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
