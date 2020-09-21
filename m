Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED408272101
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9194616EA;
	Mon, 21 Sep 2020 12:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9194616EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684175;
	bh=SDjPaz5r4hBTPNYDgfhF2Wsms4YbmCG8uc0YlL41szo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a6/uG5Qfyaa+CUqLVuz6VDjddgoOBOjHNNerVTZUJ9qMs4s3IZxYA0Hyr0/sMvlBu
	 FO21i40z0p2+0Xwz3VCHYpngATE0lVKH1v99CltjqBKhNssavFAdU5+8ZjT0F4mgwC
	 K2c7TbK2rZ0YwIZvpoWLFkrRlGNCKYeln1bi9D6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF8EDF802E2;
	Mon, 21 Sep 2020 12:27:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDEA2F802C3; Mon, 21 Sep 2020 12:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65C21F800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C21F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Iz+Z733T"
Received: by mail-wm1-x343.google.com with SMTP id z9so12039363wmk.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2WLEdeeGcltAWo8WKHO00MVpZ/wRFMHljgIRKBGWy4=;
 b=Iz+Z733TJ1+3EQ02j3WYFm6pns0QaBjrQebc820NfBFhOCixG28nAEyxfY87Z2y+VY
 VHkmUoAEt3oGiaGtiPPKwRVEjQJuWRg/S3TcfRXAFkR7yFeZbSNzPHhS5g65WFK7dDXs
 bQPtHUg1KJo3xt3jkyWiIDMEcBO5RyHNQA3EOEpEwviaUDqJ3cqDHcOHzbESinW4JV2b
 BZUYom/D+V4v1i7yBtCWIOhcEURWhgcVkOwtDIVOzIuPSd9yPhIplpYPxBMTkgdVDsuB
 2wzvcQ34rm2vtfsfaZytDRTgyBjJ3QhmlVXtmi5CCL5/xOv7Wo49+qfQupsJavqEDGG2
 RENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2WLEdeeGcltAWo8WKHO00MVpZ/wRFMHljgIRKBGWy4=;
 b=IC0mCFLGoXxMLM34u92NN85Xwth/CYg76NCDlvg9AZJnvnKvyCe1bVBajyVEMjLxoG
 hbKRSDSCTf47N4fgH3ELTWgiEiSvidxNsq1sSfuGDEq042r5KljYEEtdyruNg50+gEQl
 vCmQAjelH+20KoJfLspmQEjD2FZLOU8k4bv70o1WMCDw+oBzBB5AFnSapmJyxuiTAbeX
 oM7avjQFzC8rwUr158Jsv7zDibL9wZeTLPzXjg6XrrWacKlqd5bNLVEW3dAJMbirY0Zw
 fBoMdx2Vyw8SwiUPwmyrlJN0prQG87XjBYEg40qC+fpeuEpbr/rFSODWsKKrOIN24JJW
 6HHQ==
X-Gm-Message-State: AOAM5322q811ICotkN0/p5MoxbIcz6H9HVgvin/H8JEjDCeyrL3Ifx39
 nT9QJMecYxqBfmBTmMJj5qw=
X-Google-Smtp-Source: ABdhPJw0iTYMGy5cZtIp9s0Ds4et/1goix1pDoK1k9qkOojOrT/4rfrt/9Uh470FTX8QZVSXHHZH8A==
X-Received: by 2002:a7b:c0ca:: with SMTP id s10mr29366124wmh.103.1600684054964; 
 Mon, 21 Sep 2020 03:27:34 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 00/22] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Mon, 21 Sep 2020 12:27:09 +0200
Message-Id: <20200921102731.747736-1-peron.clem@gmail.com>
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

