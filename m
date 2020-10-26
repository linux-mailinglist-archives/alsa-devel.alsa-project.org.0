Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6B2995EF
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:54:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA9516B1;
	Mon, 26 Oct 2020 19:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA9516B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738462;
	bh=yFp3WQ3rRs12gtCaLRvFW0Zc81F3+ULafKm4dwnZGDM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ej8NUy7nkWQPRV45u2o08QgbyJigC6i3OUGJr3WOe76qVr2UqlgVmSmIp1nm/SE//
	 ifqdIoRqjOFXVmRHe8bZ+96QdIMs5FSlIo0OB1aE74fxNfwES2ZG1A8HKcpVvHTYFo
	 6fUwwAlyCatYDCsQilMMcRn24itbeq7QE+CFsDsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B3FF8025E;
	Mon, 26 Oct 2020 19:52:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEC8FF801D8; Mon, 26 Oct 2020 19:52:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D17AF801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D17AF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PgQ4zBHo"
Received: by mail-wr1-x443.google.com with SMTP id i1so13910774wro.1
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cQUhXvV9ngizC4642GzTTm7/Hlvt6fgB3K3UUaUSFT8=;
 b=PgQ4zBHoGONM0EuDC+MSQZsCD9loQzQ/78CLuJDg4QV+2Go3bxkFWh9IyXcuIHBroL
 rbIUa+IRjeisxRCJpYXzD8hUNyeJEy13yexO7FQG9+VKCziLjOxCJkYvV0uNeHvVnxMm
 ufM/sUnjs1kE9IZFM3gKlAzTESp7DfjYbofyZ7CBGQX0e3sjDSPbzIWVkqjQV4spTsuP
 4PXu/623TZ+FKcLB03A+TsGN7W6bkZ3qVfpT/yuuchwgFM4TaFHY4C3dTdhz8qvAMuXF
 MNmtzUOWHuYANxu+HF6BtbLrSEdHDFZg/5Ck488Rnww18A7Y/CLeTc7fGEAr1wlAeSwx
 WUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cQUhXvV9ngizC4642GzTTm7/Hlvt6fgB3K3UUaUSFT8=;
 b=YKK+3ZoaQinhP1G+MLCCfwMZuhhZTB6lc0uSJHE/TxevIKN4XZ1it1IFh5E31WJhil
 ph2mO3aSJkvwCDGyV7tByinkeJUd2OL0dxOg+djPZn8091ehD28FLoeeiprsTQdwZP/u
 JaEFXczfpntceuWDdc1PVWWMccQFF8kTo7GiwsZxBZ0z2yUY0TUp/i1fNwOXm/je/P12
 c5/c79h1tn+kAy9kbB1n8um+n1pg92aBSYaWunQ2KGbNdtZTgxzvmcmSHslsgxymQAXF
 wLolW8foi809dLJR4EHG3Ys/VBFWVhA+fyEU2DsX19MiW00UXY08n5bl8gQaR5dM7et+
 Qjkw==
X-Gm-Message-State: AOAM5332FGGPK1o+IU1NzSJxy1odJJlW+SSV+ZaRBrPugcaIwkfNKqs+
 ml4kBiIYRfGsgICTcmdDhYQ=
X-Google-Smtp-Source: ABdhPJywDncUnB846jl9ZKKaIOxZYjnQy76ipa3mbrDKAR3UpGtLZXtIwqM4R8XMtakeYjC0yhYG8A==
X-Received: by 2002:adf:b787:: with SMTP id s7mr20509135wre.390.1603738362970; 
 Mon, 26 Oct 2020 11:52:42 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 00/14] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Mon, 26 Oct 2020 19:52:25 +0100
Message-Id: <20201026185239.379417-1-peron.clem@gmail.com>
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

This is the same as v7 but rebased on next-20201026 and added a comment
about slots and slot_width.

A proper sound card will be introduced later.

This was tested on H6 only.

Regards,
Clement

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
 sound/soc/sunxi/sun4i-i2s.c                   | 385 +++++++++++++++---
 6 files changed, 376 insertions(+), 56 deletions(-)

-- 
2.25.1

