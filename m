Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0662716D5
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B35C1685;
	Sun, 20 Sep 2020 20:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B35C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625392;
	bh=VUwLroochFVzCLVgVf2JxkuGLyikZ37Ntt+DRz5qd+I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rzFmocFWGtSHJBGH3Lv0bMxjvcn1ApU7Ez78QdtnnrKBZOICrMYU+7/3nein7pO3J
	 omwAL0zql9MPrvoeAfb6K2ptXvce1rsUmXvaLZIPLvWxXrY5sXd1qdGpx2NQIsauLj
	 hXLpO7rQDmrLhQ7wT4Cokca8GayXeM/WGS6QbMMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 643DDF8023E;
	Sun, 20 Sep 2020 20:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DAA1F80234; Sun, 20 Sep 2020 20:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB364F801EC
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB364F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qBIfsDYD"
Received: by mail-wm1-x344.google.com with SMTP id y15so10319425wmi.0
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3bjJ23k58orvOoas5tPG6uY/RuwdywojuGiQ1D/w8N0=;
 b=qBIfsDYD5/JKsxWIPdRjK+qZ4lFrYBChdA/RnSygqlpfXhw1HjW3puFGenp7FXcDtK
 8JcR32/g9bg8SdZj3ZjbAX3V8338NAH3rcfo7mF3H1MfSfrzpWvUrz7zX0Cb6iXL/7Fp
 0K2KEe0fDMVB89aKvKeR6BCUgzcezJl7hLrdJf/vqMqHs9x4BV0R4zPYxhc2PV+Hg+JX
 wjwWfmKFLir+pZfWdhU55q3kDXFdJr6x8mfovrVQnracYiYAvNTOlpaiAfGG2uZ8JWbd
 6S1ZNmEpOTG4Mj6aeCcNbqIwnDfgvk0bt5qIcQw2w6ygc8spMDo3xRseGKcIbrbTzP0B
 IjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3bjJ23k58orvOoas5tPG6uY/RuwdywojuGiQ1D/w8N0=;
 b=jv6xyi22qJu4MEcqSnefO6YcuwcXxk3m04DfN5PQxeSImm5nbzqEyVJa8M/CzjOpEH
 sIYxWBwxbfAFHtu1F2vXTjfJaOZ4rn4+MpccFc5gLn4j9cxpzIsOslyphdOihx7yCYLZ
 Q3fXDX6lrL3JyR2pmsGLGOqJsRf0xT9nMEJY/neFu4Hjq34FgPoR720hCLkpcVFIoZFh
 RJQ/zdnrBQ+/9OdJe5PYvOk7QI+f+x5KsOwPNPCUncRhae8qPxi1dKl0zCO6Og+HfdT/
 KE7Cu42zrD6HCk8sgPpelGgITqa7K2NJXIkt52LFMzl6jSTimmE66TNdR48HccdbhXcd
 lIPA==
X-Gm-Message-State: AOAM532vM9gHJqkF4ijixrYu1rnA8qfYjPf9Ti9YnbaCa5FHC7yTt2wA
 7bkiL0UQArOTq6t9HIBpmd8=
X-Google-Smtp-Source: ABdhPJzzyhYdkmF45p4diU+SwyS9+3TA9fZDgii7v35zNcFgW8gzz9KChmum8XF2qfU/Qw090t4zXw==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr25828487wmi.186.1600625282949; 
 Sun, 20 Sep 2020 11:08:02 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 00/19] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Sun, 20 Sep 2020 20:07:39 +0200
Message-Id: <20200920180758.592217-1-peron.clem@gmail.com>
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

New test done by Maxime using TDM show that's LRCK is indeed inverted
so I drop the patch reverted in v2.

And HDMI requires an inverted LRCK so let's readd the frame-inversion
in the device-tree.

I have also added a patch to change set_chan_cfg.

Please note that I can't test TDM and only have a Allwinner H6.
So test and comment on other Allwinner chips are welcome!

Regards,
Clement

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

Clément Péron (4):
  ASoC: sun4i-i2s: Change set_chan_cfg params
  ASoC: sun4i-i2s: Fix sun8i volatile regs
  arm64: dts: allwinner: h6: Enable HDMI sound for Beelink GS1
  arm64: defconfig: Enable Allwinner i2s driver

Jernej Skrabec (3):
  ASoC: sun4i-i2s: Add support for H6 I2S
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  arm64: dts: allwinner: h6: Add HDMI audio node

Marcus Cooper (9):
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
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  33 +++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  34 +++
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   8 +
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |   8 +
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  33 +++
 arch/arm64/configs/defconfig                  |   1 +
 sound/soc/sunxi/sun4i-i2s.c                   | 280 ++++++++++++++++--
 14 files changed, 427 insertions(+), 20 deletions(-)

-- 
2.25.1

