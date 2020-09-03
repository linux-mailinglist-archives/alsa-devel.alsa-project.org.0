Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CF25CA7A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 199541945;
	Thu,  3 Sep 2020 22:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 199541945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165157;
	bh=NwydRQZC2zw1SKjhcdcOZqUeKjoYQeu+JfXmTqoysIY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q0G3ceyfV/2NFWth6X5a8DVWbGlZ/egrk5NaZuGHu8Ag2wXzFUIFHVsMQXwDvOk/J
	 Mdj1V+aBDOLs8jeAgLgKF8lCpP+iRXOseaQ42URZp+JLZAH/fRuwXEx/j4zJ5NtWLW
	 KKcil4szneBKw1e17uNfPuoJ8vHdSFhhd/ciUhOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38C67F802A9;
	Thu,  3 Sep 2020 22:30:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B623F800F0; Thu,  3 Sep 2020 22:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A94AF800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A94AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jPn9PdHb"
Received: by mail-wr1-x441.google.com with SMTP id m6so4618798wrn.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCiiLHdkyCif4lDSthP4Rue9BpevgzI0PU8h03qCRjY=;
 b=jPn9PdHbFfQYzxWap1ICE8K6I+puU4a41hfw1FW7yTjLz1RhIsitR1DWrUfJmsjeCB
 QuJOmJyDFQYCTkogqBoM4vrDLC/Z5EVI3XFVbh9zdKGJj77q909aTXooCxRXI7xYVuQP
 p/1egAtosQMJUMhUYeyBm4j5pbEtexUOiRgCbw1yLNA4GMSaR9MEwQi5gIl1O4P3cr9C
 CR146At7ZOwRhfRac+TMEc6WNIpHskIq3kk+tAK9MInIn63jVVs/EkMYpXiXfF/eZFOu
 ipNheUsBnVEN6N3RY7iXk1t0dVkKgpWJ/IWMMJP38c+cH+r61oiAKkfz5tqa04VR4jPZ
 ROmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCiiLHdkyCif4lDSthP4Rue9BpevgzI0PU8h03qCRjY=;
 b=B4CovKXW+acpLDfkdH+YCpL4iyJCnMV2+tBDM8B6JmVmZJXN8iFYScyN9bswos4O4K
 BfJy31wlcmXTAc47tnSuQV/x/Wc5oM1eRN4PTp8A8spKtV/vlCOE0eY1NMRtDe7MaN1g
 34dJE+m2U9licJfP2rMzA9DoNbpuAbdsz4bEl6AV/Fe0fHOqOr1zLBfECv7Tu/wuZvBz
 BNDqtbCVZCcnFdr17zD/iyAsVQXfoiNxG/aTHUGNKK2JBBJdvvbdAqP53Cg+apKQYYyS
 4NzinrKcKAD465sdgyUGsHlcvpVoE1xqCLLg9MUYaVYqTJ1Bxl2Lj3XEd7HBAkL1ykl0
 L6NA==
X-Gm-Message-State: AOAM532KBLHQtHfpWk7eQPY2EdpbRgjQo1NfquxiS/bMz2w3Td8Fkv/X
 wBR+S2OMcozRCED2vI1Albs=
X-Google-Smtp-Source: ABdhPJxWnW47sJQ9T2/8BdZhhOZMbOW7I2FSoB1MeYeY4KcXmQ1ajCllvvZtZlt7+JcUa4XQrMLvqw==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr4118026wrt.32.1599165043167; 
 Thu, 03 Sep 2020 13:30:43 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 00/20] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Thu,  3 Sep 2020 22:30:14 +0200
Message-Id: <20200903203034.1057334-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Hi,

Regarding the I2S LRCK polarity, Maxime Ripard test it and found that
the LRCK is fine: https://lkml.org/lkml/2020/7/29/581.
So the patch introduce this modification has been reverted.

I have tested this on Allwinner H6 but this should be tested on older
platform like sun4i family.

Regards,
Clement

Change since v1:
- rebase on next-20200828
- add revert LRCK polarity
- remove all simple-audio-card,frame-inversion in dts
- add Ondrej patches for Orange Pi board
- Add arm64 defconfig patch

Clément Péron (4):
  Revert "ASoC: sun4i-i2s: Fix the LRCK polarity"
  ASoC: sun4i-i2s: Fix sun8i volatile regs
  arm64: dts: allwinner: h6: Enable HDMI sound for Beelink GS1
  arm64: defconfig: Enable Allwinner i2s driver

Jernej Skrabec (3):
  ASoC: sun4i-i2s: Add support for H6 I2S
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  arm64: dts: allwinner: h6: Add HDMI audio node

Marcus Cooper (10):
  ASoC: sun4i-i2s: Adjust LRCLK width
  ASoC: sun4i-i2s: Set sign extend sample
  ASoc: sun4i-i2s: Add 20 and 24 bit support
  arm: dts: sunxi: h3/h5: Add DAI node for HDMI
  arm: dts: sunxi: h3/h5: Add HDMI audio
  arm64: dts: allwinner: a64: Add DAI node for HDMI
  arm64: dts: allwinner: a64: Add HDMI audio
  arm: sun8i: h3: Add HDMI audio to Orange Pi 2
  arm: sun8i: h3: Add HDMI audio to Beelink X2
  arm64: dts: allwinner: a64: Add HDMI audio to Pine64

Ondrej Jirman (3):
  arm64: dts: allwinner: Enable HDMI audio on Orange Pi PC 2
  ARM: dts: sun8i-h3: Enable HDMI audio on Orange Pi PC/One
  arm64: dts: sun50i-h6-orangepi-3: Enable HDMI audio

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   2 +
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts     |   8 +
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts     |   8 +
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts   |   8 +
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts    |   8 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  32 ++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  33 ++
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   8 +
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |   8 +
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  32 ++
 arch/arm64/configs/defconfig                  |   1 +
 sound/soc/sunxi/sun4i-i2s.c                   | 285 ++++++++++++++++--
 14 files changed, 431 insertions(+), 18 deletions(-)

-- 
2.25.1

