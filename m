Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD327A2C2
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:31:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD8918EC;
	Sun, 27 Sep 2020 21:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD8918EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235117;
	bh=vcpOELzA8EO4IraL+wuKT11QDRobo6IEgtsIzRUl8ZA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sk0nFZe+MKgk5mP+gexaJmK0aV9XLe8Ojd3dsgFZc9Tccq/8Iv1YFc8d3DK3OXjla
	 ztOVSEUI1g01nJFrGxcL6ZTQ3pJbCxFDGJM3vNAB3/R657k9BoPx0NAmxH34YOTiV1
	 LGoL+b/q9/mtYtjYnwVKeeHKHLDw4DBwrp3ZjyjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35842F801DB;
	Sun, 27 Sep 2020 21:29:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75F9EF8022B; Sun, 27 Sep 2020 21:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEC09F800B5
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEC09F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hbvgMZ9d"
Received: by mail-wr1-x444.google.com with SMTP id k10so6418637wru.6
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GAAtSAinEwDD4No76XzUrrz89y+X5YI3Fkp3Qs1EF6A=;
 b=hbvgMZ9dkpTeaVc5x0SjPW7TzrNggvlPmhgOnG5tn1P+we5d6QPlFc+j3/1VysZ9EQ
 itQVPlgShHauuDhLCa4ba6QnClEIqkUdxuR9P9j0aTPkyR7BCqKbb6GqjL140WPeDQG8
 JtPAJBxtLNHk+LJTWELGvpHddzfpXVy4gvDa9+WY6GqeC1DIyJVUonyPYE/Hb45jonvl
 moMG66DTEghDqgNB+Zp+kxWjaJM/tSURPmU00oWqXm3AgwJ+UeVQDjEUuIwPVz5N+EmE
 JOqq56iTaGn3tEVUMpZuF2s7FXut0HXOuyADmAawW3zIdFmYPJvLVbDrKduLjVwi7xfU
 v40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GAAtSAinEwDD4No76XzUrrz89y+X5YI3Fkp3Qs1EF6A=;
 b=AHI1Acpve+gmz0Ase+f4cE+nqomLqyNYL+IAOB9RAQVBD8R/RAXy+t/2CGQBzhYX9i
 BSE8ZrIovnPBgs2Th5vgZGvE6kgKsYJpRk4HHFHjkQHbN3zM3tbCyJJ5O69Esk6Wwsrp
 i+Q+yE3Sy6jbyOQHpBzSSS4+1+PgUGU3AoMjq+rFTPQ/zuLYYAIzi1EXuJbFCrAd+OrK
 JRlKeQdDWjSmS28+YfKyQshEXIgeKcSJUORvEwITkdA8FuP+Nu3S8bxaXTFIUTjRvRTY
 u0Q5r5B8Y7ymt7IYfeA1jbHeFByrjwD14IiBJbNwPs3aVP5PPo8WSlfVSeYmu+CyPP2B
 43EA==
X-Gm-Message-State: AOAM531CgaXdv2nPoWsm7/vw3MLd39fiYOdRIiAR4ptkLM66LaS6Twm1
 U0HgDyk67zELJ1Knewdfi6E=
X-Google-Smtp-Source: ABdhPJy0jlKkB+a7iXNGAIriN8xg5n6aV2MPg6E/rLpY9BkzWV0JjpJGSE0LpFuu38MPFaH6nUPSyQ==
X-Received: by 2002:a5d:5512:: with SMTP id b18mr12159410wrv.229.1601234957454; 
 Sun, 27 Sep 2020 12:29:17 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 00/20] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Sun, 27 Sep 2020 21:28:52 +0200
Message-Id: <20200927192912.46323-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
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

This is exactly the same as v4 but with more details in some commit log
and also device-tree soundcard and DAI node have been merged.

Regards,
Clement

Change since v4;
- add more comment on get_wss() and set_channel_cfg() patch
- merge soundcard and DAI HDMI patches

Change since v3:
- add Samuel Holland patch to reconfigure FIFO_TX_REG when suspend is enabled
- readd inversion to H6 LRCK sun50i_h6_i2s_set_soc_fmt()
- Fix get_wss() for sun4i
- Add a commit to fix checkpatch warning

Change since v2:
- rebase on next-20200918
- drop revert LRCK polarity patch
- readd simple-audio-card,frame-inversion in dts
- Add patch for changing set_chan_cfg params

Change since v1:
- rebase on next-20200828
- add revert LRCK polarity
- remove all simple-audio-card,frame-inversion in dts
- add Ondrej patches for Orange Pi board
- Add arm64 defconfig patch

Clément Péron (6):
  ASoC: sun4i-i2s: Change set_chan_cfg() params
  ASoC: sun4i-i2s: Change get_sr() and get_wss() to be more explicit
  ASoC: sun4i-i2s: Fix sun8i volatile regs
  arm64: dts: allwinner: h6: Enable HDMI sound for Beelink GS1
  arm64: defconfig: Enable Allwinner i2s driver
  ASoC: sun4i-i2s: fix coding-style for callback definition

Jernej Skrabec (3):
  ASoC: sun4i-i2s: Add support for H6 I2S
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  arm64: dts: allwinner: h6: Add DAI node and soundcard for HDMI

Marcus Cooper (7):
  ASoC: sun4i-i2s: Set sign extend sample
  ASoc: sun4i-i2s: Add 20 and 24 bit support
  arm: dts: sunxi: h3/h5: Add DAI node and soundcard for HDMI
  arm64: dts: allwinner: a64: Add DAI node and soundcard for HDMI
  arm: sun8i: h3: Add HDMI audio to Orange Pi 2
  arm: sun8i: h3: Add HDMI audio to Beelink X2
  arm64: dts: allwinner: a64: Add HDMI audio to Pine64

Ondrej Jirman (3):
  arm64: dts: allwinner: Enable HDMI audio on Orange Pi PC 2
  ARM: dts: sun8i-h3: Enable HDMI audio on Orange Pi PC/One
  arm64: dts: sun50i-h6-orangepi-3: Enable HDMI audio

Samuel Holland (1):
  ASoC: sun4i-i2s: Fix setting of FIFO modes

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   2 +
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts     |   8 +
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts     |   8 +
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts   |   8 +
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts    |   8 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  33 ++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  34 ++
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   8 +
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |   8 +
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  33 ++
 arch/arm64/configs/defconfig                  |   1 +
 sound/soc/sunxi/sun4i-i2s.c                   | 374 +++++++++++++++---
 14 files changed, 487 insertions(+), 54 deletions(-)

-- 
2.25.1

