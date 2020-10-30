Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7382A085A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD95165D;
	Fri, 30 Oct 2020 15:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD95165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069317;
	bh=+/dg9l7HNZWTTlKtTtfAwZ/Yyju2fx+fI7zxHlEQPQ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cfw+s55ZZzQWOpfVI1bfaCPJEAL2JjVVchjT7erTDV18dgs2wje99/F4CzQkML0FE
	 erUHMb9RwV/vQnT4Z6zhoUrIlVVs2Nyep7PksHetDWutFQ+4pH04cnb6r0BQNXNiPy
	 7BuF6EoqsPUKGfhFWWj7Glf5/yXARP0UlVz7IJKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16562F80212;
	Fri, 30 Oct 2020 15:47:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E518CF80212; Fri, 30 Oct 2020 15:47:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C11AF800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C11AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i7AAld3n"
Received: by mail-oi1-x244.google.com with SMTP id x203so6847367oia.10
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KelKv6QuhcXrOVTDysjuR2N/UDbFgkAgyB58VLYR2Cc=;
 b=i7AAld3nd1vqHbAt7c4ECVGFsPnExGyUiImnF0+1hZg5p/YfFnm41rF+FGn1sCvm5V
 ziFxRWKCd1kat1/C3nRghkBoIChBsRMY0gC7KfH5vahKRKoj3qA4sTCqTlWv+XByxGBq
 0VZ2Tvdt4SomDIhwyV9WGKqY+5TxuaBSGh+7SRXzrYAKVA/ZQKzWlOFpGrUiUWjJeojE
 ZGpD1GKchSAsgqexuCVM0h2yqK4KpzEuQyYDcGhhUJKjBtL8kZTOWQ/YwmHQVluChzU/
 lcMpjbLCL3m/WK5fRGImxp0sN9gzx5I+0aHMJ95bvWSXbpcprloz5ZxZrLFi45WC7di0
 DwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KelKv6QuhcXrOVTDysjuR2N/UDbFgkAgyB58VLYR2Cc=;
 b=nCT/z1DYvy/RYj2J6TwsbMcWB8S2noFiYcQHvLT6VUFx09PPtwTJroaJzvi7zGnV5P
 wPj1oQYs8puabQR+YrUz7rs3EILm328oO1xN7OTg0b+TEN26ZJqasz31P4MF/rBBtQr3
 JwZ9Ds1YJNoeLcsMnp/ZFbEf/caGweff4u2cFXBFri+72sm5a9Ljh4gf8GSE533bamLe
 AoqquiSECgMf7j6FBJZJ3yTSaX+nwspPN1T+/B7jPGmeb0NHwhXSB86b3xAIz9EgoWbU
 C12S/DNYljWwy4EbPlo7Fni2ZYbX1lpFzKNK23WLCj/6yTVM40JcQMxXDzLEg6UjuxBi
 kfKw==
X-Gm-Message-State: AOAM530MgOMwOMPW8YzhqIauFq7qD5uqy7njZszS4jU5mJPyccf760Wx
 +r5S7qczlbp0ANML+fQOwM4=
X-Google-Smtp-Source: ABdhPJyTUhg+1uuyzQZecKdw6YSoZcrR37SHffE66ksSbQGfyR8KC4fr5TfZ/52hNaEtGr2jD9Lssg==
X-Received: by 2002:a05:6808:9a9:: with SMTP id
 e9mr1753864oig.37.1604069215295; 
 Fri, 30 Oct 2020 07:46:55 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:46:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 00/15] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Fri, 30 Oct 2020 15:46:33 +0100
Message-Id: <20201030144648.397824-1-peron.clem@gmail.com>
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

This series add H6 I2S support and the I2S node missing to support
HDMI audio in different Allwinner SoC.

As we first use some TDM property to make the I2S working with the
simple soundcard. We have now drop this simple sound card and a
proper dedicated soundcard will be introduce later.

This make the title of this series wrong now but to be able to
follow the previous release I keep the same name.

Regards,
Clement

Change since v9:
- fix lrck_period computation for I2S justified mode

Change since v8:
- move the comment near the function prototype
- collect Maxime Ripard tags

Change since v7:
- rebase on next-20201026
- comment about slots and slot_width

Change since v6:
- move set_channel_cfg() in first position
- convert return value to decimal

Change since v5:
- Drop HDMI simple soundcard
- Collect Chen-Yu Tsai tags
- Configure channels from 9 to 15.
- Remove DMA RX for H3/H5
- Fix Documentation for H3/H5

Change since v4:
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

Clément Péron (7):
  ASoC: sun4i-i2s: Fix lrck_period computation for I2S justified mode
  ASoC: sun4i-i2s: Change set_chan_cfg() params
  ASoC: sun4i-i2s: Change get_sr() and get_wss() to be more explicit
  ASoC: sun4i-i2s: Fix sun8i volatile regs
  ASoC: sun4i-i2s: fix coding-style for callback definition
  arm64: defconfig: Enable Allwinner i2s driver
  dt-bindings: sound: sun4i-i2s: Document H3 with missing RX channel
    possibility

Jernej Skrabec (3):
  ASoC: sun4i-i2s: Add support for H6 I2S
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  arm64: dts: allwinner: h6: Add I2S1 node

Marcus Cooper (4):
  ASoC: sun4i-i2s: Set sign extend sample
  ASoC: sun4i-i2s: Add 20 and 24 bit support
  arm64: dts: allwinner: a64: Add I2S2 node
  arm: dts: sunxi: h3/h5: Add I2S2 node

Samuel Holland (1):
  ASoC: sun4i-i2s: Fix setting of FIFO modes

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   6 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  13 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  14 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  13 +
 arch/arm64/configs/defconfig                  |   1 +
 sound/soc/sunxi/sun4i-i2s.c                   | 388 +++++++++++++++---
 6 files changed, 378 insertions(+), 57 deletions(-)

-- 
2.25.1

