Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A129C742
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:33:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2458916A5;
	Tue, 27 Oct 2020 19:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2458916A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823613;
	bh=VnoZym2aKubNCy7EX3i8yLUFLHt5seWYpPS+sqf5sUo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UXYtUyPvgYU4mOgaOdEQfjzztOli2waPpevKGIsEQ3Js+gNB2+gS0kUw1GB4UdrHK
	 u+Dcbm7tO2nchZBCAuFlpd6nWWyflF3JJUrF7hZf/yTWgzDTDaHI3njYhZyd8tYzBj
	 5C0Iet0wUZAyyZgMwuBFMGoYqo2TxJJ9w1OVIrO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D90BBF8021D;
	Tue, 27 Oct 2020 19:32:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 915A2F8020D; Tue, 27 Oct 2020 19:31:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91763F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91763F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m0U8E4Wp"
Received: by mail-wr1-x443.google.com with SMTP id n15so3064294wrq.2
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7u9KlF+y0OyiuKU/hfbRmYFsG2pmwDPw+7/oznvGoCI=;
 b=m0U8E4Wp1elMN898vGRbZYUMLzVIvaqipR8nK3gm1Rhe0PoQYdzIdFKES2aKPmfomS
 g1mQok3PsCL3QHSxuRwKpkT0FMcH2a8HZ1N+DPa3HSi6uVLfDJHTKPB53xgIUPcsONep
 iTzqk3VldAw85kFIAt8iVoees6SdZJ13xVwerq87YuQzjYRs/4vSQ77M6yLBKeLoiAOm
 T7foIBbIpnyG8kyud3+wyK23iK1GE7CmdvcKUOtO2bYNxiu7klW0tpkDNHj12HUCP1rh
 sopLKCf2vcZ9CGYegRdvT+8QQwfAYVy54vk/TMZ581Q/1nOufN13nkh6wHriNx8lVQ2P
 cKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7u9KlF+y0OyiuKU/hfbRmYFsG2pmwDPw+7/oznvGoCI=;
 b=esw1pwZ3PREPrWp2hdUPjzeN6rSgYO9xWTU74bk3BOcDZW8nKeY3p6pH3b8OMWzcR+
 G3VbTKO4oTIroaRA+L59L2Bzs1F5FQK4bHv+k8inSNCB3EWXdw2BBn4hsJAUcaUMckjk
 i89S7chhG7wjo+vWzS2D9OU3yDL2amail8Z+dEIA/PiwvNr9jxEs9/VyE0AuC1DXLvO9
 EIs3ii9JRTg+VkAmD7oW5nz783z+3ZjrZyK2RgFv4aI0sW0gzKxh3U84DESNJbycXQPw
 vfbSOkRyiB/SpxwqSlv/tvU9IlB4Snum2cj6NsfwEUsEaXFdN2bRcJlWx+qX6hYmaVXi
 n41A==
X-Gm-Message-State: AOAM530ZrbqrQ/rNyEY567WPQbaW3geMLyJmgJEOPhT1jIF3nr0yZHAh
 LAoFsoFOrDTn4uZ+yE8ENLU=
X-Google-Smtp-Source: ABdhPJxxBZ5wxOSwsnJUso/K1iFZaRYt3LJplJOMEmFBsSSBdqL+CoSH3Oj8ijg4eFnWClC5F5RUcg==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr4630755wrs.342.1603823512576; 
 Tue, 27 Oct 2020 11:31:52 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:31:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 00/14] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Tue, 27 Oct 2020 19:31:35 +0100
Message-Id: <20201027183149.145165-1-peron.clem@gmail.com>
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

As we first use some TDM property to make the I2S working we the
simple soundcard. We have now drop this simple sound card and a
proper dedicated soundcard will be introduce later.

This make the title of this series wrong now :/.

Regards,
Clement

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

Clément Péron (6):
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
  ASoc: sun4i-i2s: Add 20 and 24 bit support
  arm64: dts: allwinner: a64: Add I2S2 node
  arm: dts: sunxi: h3/h5: Add I2S2 node

Samuel Holland (1):
  ASoC: sun4i-i2s: Fix setting of FIFO modes

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   6 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  13 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  14 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  13 +
 arch/arm64/configs/defconfig                  |   1 +
 sound/soc/sunxi/sun4i-i2s.c                   | 384 +++++++++++++++---
 6 files changed, 376 insertions(+), 55 deletions(-)

-- 
2.25.1

