Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD828214570
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3403D167E;
	Sat,  4 Jul 2020 13:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3403D167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593862853;
	bh=S7EYk980Kldt0P/fYucRfJcRjBZpdRL1ntsxNPvOdVc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kLvHQ+Sg3QgFQiGQR7tspv/TsrJdwV7k9PA1TJJ3P0QfMiF3DQcL/k3LJV0Ha9bej
	 sxBohREW/eoxDrHO+s84rnMU/q1DBw7uyPdnGfqcQy00R8sp1rBz2H9uyuqP0STobF
	 lGLjHc6mMikz92oM3DyK8s44cl7oRl9Iv4WOVYHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 403D0F80247;
	Sat,  4 Jul 2020 13:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39288F80247; Sat,  4 Jul 2020 13:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EDFBF80125
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EDFBF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="meZHio9k"
Received: by mail-wr1-x443.google.com with SMTP id o11so35448285wrv.9
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=huTZWc4WX2Vk6rlBo+W/npzq0ocSqctPFM6mvDyKzhI=;
 b=meZHio9kKgmPtzv7j7dRdrQkTdsN+PUWTJgQrVGZfSrAh8bO7SmdtsxUZjgewfgm+t
 KQwupF83sh/tOwBQV2oDQvmEfzbCBdFbhiUvgFkafu1hc5+9tgW7oPWeKLcGMlf0xwYg
 S2JDTsTmYO3/pqZqdM/qTRYEVSI36OaSmC5Ong+8WOPeDVX9ZMkGa4DKmN21UFyjZThT
 z1Ufia2+HHra4ZoTt2B6k5q8aIFfPVb1u5oySe6l7B16SF3ZGJ1EV0X+UGaGHshmlZNL
 qOyl/wjerLE2dV4cjbW8EykX/AWIQolAs6de3MRZaDBSi0bHrWY0IY6DD2Bidzdc6jho
 8fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=huTZWc4WX2Vk6rlBo+W/npzq0ocSqctPFM6mvDyKzhI=;
 b=h4Q6p6HAn88cDjdF3VykI+9RgHrxJBM4nmRno8UCXHJpbqUXIsKnJFgMc1MUZYQBvb
 3070DYAUjdH2hnWzISyxmEJ5fRMYGo3AqJpSdGdRwrcY9JAYlbtW1meo5UbdMqbwEAxK
 o+sARMA5tccWvnqlOExqUl0//c8qdwlfvZCIwsFqJf4LDnCLw4vTlv5ikOvz8BDCmoLE
 CLB5fyQyFFhTaS9srwiAVXts4P7hIqvPOt0X3ye0lxYZ8DytodptdJjIBaj5WET46aPk
 8J7X8zyyY0rIMd6FcjnVreUJtaZv6+gFnzrt/ksyXqWjWiaANdKAIRPyzQ4U7eYxzgCx
 hwaA==
X-Gm-Message-State: AOAM531fDgb6imJ32ERAwfpAInZsB59w24qeG9uT+JZceu53M5Gz+1Mt
 Dabv2/HJ3iGZ8700ST77gBE=
X-Google-Smtp-Source: ABdhPJxCjhh8TckSSIgRr6CJvS63LYfsRrgWAUQSGAQuTFPXEG/R05nSp234vtwv/LzOsRt4HrNb7Q==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr40188744wrr.42.1593862745973; 
 Sat, 04 Jul 2020 04:39:05 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:05 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 00/16] Add Allwinner H3/H5/H6/A64 HDMI audio
Date: Sat,  4 Jul 2020 13:38:46 +0200
Message-Id: <20200704113902.336911-1-peron.clem@gmail.com>
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

This a merge of serie:
- Add Add H6 I2S support https://patchwork.kernel.org/cover/11497007/
- Add Allwinner H3/H5/A64 HDMI audio https://patchwork.kernel.org/cover/11510511/

I merge both serie because there is a similar issue regarding the I2S polarity.
This need to be investigated under a scope and see if the comment is still true
for Allwinner H6 and previous SoC.
LibreElec team found that we have to introduce the
"simple-audio-card,frame-inversion" property with recent mainline change.
In order to make HDMI audio work.
Maybe the I2S polarity is good or maybe the silicium has an issue but not present
for HDMI I2S or not present in TDM mode...
I cannot do it myself, so if someone want to to do it please feel free.

Regarding the discussion we had here: https://patchwork.kernel.org/patch/11510521/
I didn't switch to generic hdmi card-name and used name like:
sun8i-h3-hdmi, sun50i-h6-hdmi, etc....

Despite this wrong comment the rest of the serie introduce some fix that should
be merged even if it's without the H6 support.

Regards
Clement

Change since v1:
- drop allwinner,playback-channels property
- use coherent hdmi,card-name 
- indentation fix
- collect tags

Clément Péron (2):
  ASoC: sun4i-i2s: Fix sun8i volatile regs
  arm64: dts: allwinner: h6: Enable HDMI sound for Beelink GS1

Jernej Skrabec (3):
  ASoC: sun4i-i2s: Add support for H6 I2S
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  arm64: dts: allwinner: h6: Add HDMI audio node

Marcus Cooper (11):
  ASoC: sun4i-i2s: Adjust LRCLK width
  ASoC: sun4i-i2s: Set sign extend sample
  ASoc: sun4i-i2s: Add 20 and 24 bit support
  ASoC: sun4i-i2s: Adjust regmap settings
  arm: dts: sunxi: h3/h5: Add DAI node for HDMI
  arm: dts: sunxi: h3/h5: Add HDMI audio
  arm64: dts: allwinner: a64: Add DAI node for HDMI
  arm64: dts: allwinner: a64: Add HDMI audio
  arm: sun8i: h3: Add HDMI audio to Orange Pi 2
  arm: sun8i: h3: Add HDMI audio to Beelink X2
  arm64: dts: allwinner: a64: Add HDMI audio to Pine64

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   2 +
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts     |   8 +
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts     |   8 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  33 ++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  35 +++
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |   8 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  33 ++
 sound/soc/sunxi/sun4i-i2s.c                   | 281 +++++++++++++++++-
 9 files changed, 410 insertions(+), 6 deletions(-)

-- 
2.25.1

