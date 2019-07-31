Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056907BFAA
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81B561709;
	Wed, 31 Jul 2019 13:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81B561709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572701;
	bh=hT6y3uNMQv2g2dEW/GCT478N4rQpKZAJh7aLCv6Mj0I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gu2NfMjFcXFCDaJP3YxEskcPKX2pdQ5HXXRtf2/GEitdGSOMl1sEoFAqr246ZEcjP
	 nYq8XA79hucp9u+4ZuFNxAo4laNC7X9ji7ON2o1ZbFM+rEpz5QjJxREUGViPUfh7Bl
	 JbTFhJvchNrmMyEOmILDWnfcFjiaY8rBky1XVu8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AA0F805E1;
	Wed, 31 Jul 2019 13:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A13F8048D; Wed, 31 Jul 2019 13:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 713A3F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 713A3F80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Eyu1a2+I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eSeBCzNpKMCOFoL5FPkI5ImNoBEwwAZgfAmRy9oJTNY=; b=Eyu1a2+I0iZ8
 M/Px0Z8w63HNmsjKCwsxc7YzBUqdl/vh0hrvb9MUOBC6fSj328PFbmsdawyVBlTx1mGdM2CC3QnGZ
 pLnQ1vXJmA7C8Z3oJ2tfexly3pXPdSyhE+COszNJMCFEbh0+2+S3pWaEha4TSU5I31jSB79UGdrmJ
 cTRm4=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmnb-0001ks-5Z; Wed, 31 Jul 2019 11:29:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3BF792742CC3; Wed, 31 Jul 2019 12:29:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Andra Danciu <andradanciu1997@gmail.com>
In-Reply-To: <20190731111930.20230-2-andradanciu1997@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112938.3BF792742CC3@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:38 +0100 (BST)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 kmarinushkin@birdec.tech, m.felsch@pengutronix.de,
 rf@opensource.wolfsonmicro.com, piotrs@opensource.cirrus.com,
 lgirdwood@gmail.com, nh6z@nh6z.net, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, robh+dt@kernel.org, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org,
 anders.roxell@linaro.org, tiwai@suse.com, daniel.baluta@nxp.com,
 jbrunet@baylibre.com
Subject: [alsa-devel] Applied "dt-bindings: sound: Add bindings for UDA1334
	codec" to the asoc tree
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

   dt-bindings: sound: Add bindings for UDA1334 codec

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

From d6de65fde51644f6ed6b1c0c05fef6a2da5ff768 Mon Sep 17 00:00:00 2001
From: Andra Danciu <andradanciu1997@gmail.com>
Date: Wed, 31 Jul 2019 14:19:29 +0300
Subject: [PATCH] dt-bindings: sound: Add bindings for UDA1334 codec

The UDA1334 is an NXP audio codec, supports the I2S-bus data format
and has basic features such as de-emphasis (at 44.1 kHz sampling
rate) and mute. Product information can be found at:
https://www.nxp.com/pages/low-power-audio-dac-with-pll:UDA1334

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
Link: https://lore.kernel.org/r/20190731111930.20230-2-andradanciu1997@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/uda1334.txt       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/uda1334.txt

diff --git a/Documentation/devicetree/bindings/sound/uda1334.txt b/Documentation/devicetree/bindings/sound/uda1334.txt
new file mode 100644
index 000000000000..f64071b25e8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/uda1334.txt
@@ -0,0 +1,17 @@
+UDA1334 audio CODEC
+
+This device uses simple GPIO pins for controlling codec settings.
+
+Required properties:
+
+  - compatible : "nxp,uda1334"
+  - nxp,mute-gpios: a GPIO spec for the MUTE pin.
+  - nxp,deemph-gpios: a GPIO spec for the De-emphasis pin
+
+Example:
+
+uda1334: audio-codec {
+	compatible = "nxp,uda1334";
+	nxp,mute-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	nxp,deemph-gpios = <&gpio3 3 GPIO_ACTIVE_LOW>;
+};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
