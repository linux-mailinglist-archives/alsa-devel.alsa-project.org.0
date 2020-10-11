Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D35728AA56
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD382166F;
	Sun, 11 Oct 2020 22:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD382166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602447859;
	bh=4Of9DSpBOHdoc+XwPLSf/hXYqmCefzxE+Hyi1VQVutM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vkjY1Oo6FRy0FRGNAJXdOmPJ3OqrYJqJgev0/n0m3zvkSvApaxWMkEmHiX3mUU+K2
	 ZugNXa4WrTIUjg5GdayUGUU1Hvtr+NTEZFb1DI/+AaqeVuKOuT1HD+L4AKVjucV7Uz
	 miTELM4wzYG3j0Is/B2rl5y5hH+8/yiqBx6RMb2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53A3DF801D9;
	Sun, 11 Oct 2020 22:22:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A95AFF8016F; Sun, 11 Oct 2020 22:22:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D93CF80134
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D93CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Dv1lSgAi"
Received: by mail-qk1-x744.google.com with SMTP id 188so15994967qkk.12
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tASCTYBxcthY6OHyZcpvEZ2WGLxMD6Z6m5Bm5NnAUZQ=;
 b=Dv1lSgAiqpMC+u/tF2AgZlaLQqTUsG6LtAn2oJpLSQ5nxXcyySAqoPQBzql8egLIOJ
 2TqXFv5N+06kL8+5/4obvGMNM+yhrOEQWIjbH+P5nKXCILkgWE7l4eQcwvATc6ZtIgNV
 kipf2CK6NshRLdCVbkxsT/M/Rhke9pxyDRhImnHRui/OkCEyUD0bpNQbgBML1iMrNRz9
 VX2IqA5IhjTMEEByg/cITnfh0Th0ZUoX/tgu/t/dkAcomLSWjcqmZiLv1Htk4GE4m9bT
 MI/4FwePmlpsMAufc/jXuATMmGLbIV6LE55nvgE6sni6+ms7GJOXiVwVLqoMOobCTTPJ
 B0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tASCTYBxcthY6OHyZcpvEZ2WGLxMD6Z6m5Bm5NnAUZQ=;
 b=tnwk5fQRHxmuelW0CDizFmapjmW/2Ir8UjwZgCbrv8SStIgwC8f3FbfqgeWHlbtH3X
 65jgidw88a4ZoHJaoqWB7iKZbVfLweZ7CYuoFw1pk+1VHklEVTtG8tCf7JXN5KRz8MQT
 1ZYgV22YAA/CSV0ll2fTrpmmITDCSZ9t6Sqg+u7gKuOH9cng1fdqqttwV09uC+5KzNgT
 5sdgPu1aD073vewrUWrDHe8wwOuv8XC+F38KNlk5WtFL3WGwEKOopAeq3/7MaCVQuHOr
 c//+o5YLCJTbJQmrGk/HXp28z9T4O40DRaJNX6ihLqNqfvLHsCG88wIJSibWIxvHlhfs
 PRbg==
X-Gm-Message-State: AOAM5310AgPFbzD8KGAHK2bICa2N/btiLhxQiTDNBb0h/xCzRaGwS8gt
 o/YrlNx/IwtD4GkGMpF64xk=
X-Google-Smtp-Source: ABdhPJy8+5x9bAXKsOMAy506+SFXzMiqLE0rZegNwLCZFuT6OQC4+9gTbGyZkXPwfSNLC6JG8E9dbw==
X-Received: by 2002:ae9:dc03:: with SMTP id q3mr7328008qkf.288.1602447752182; 
 Sun, 11 Oct 2020 13:22:32 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:22:31 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 00/14] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Sun, 11 Oct 2020 22:22:10 +0200
Message-Id: <20201011202224.47544-1-peron.clem@gmail.com>
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

Just some minor changes compare to v6.

As explain in v6 there is no more HDMI soundcard,
I will try to introduce a dedicated Allwinner soundcard
in a next series.

Clément

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
 sound/soc/sunxi/sun4i-i2s.c                   | 376 +++++++++++++++---
 6 files changed, 368 insertions(+), 55 deletions(-)

-- 
2.25.1

