Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85207160AD0
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:44:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA0881672;
	Mon, 17 Feb 2020 07:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA0881672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581921883;
	bh=6CUcYZAAD/S5+cJF7sPhGuonpzmAYyK2vhMUegc3ENE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=joi03BkBftI9r1xUTts2NAx/xDeveLk0OCUM3UvIH71UANgEl+ZnrAIJI42tPa8rb
	 mUgLT04/LHs2yW9OEGRAoSFvt+hRvModfphHqnlKAMHC7m8vfgr3x3NveL17cH/Xh6
	 x2SDuU8qv+aWUM9xRCvDMjy0oBvf/dv+UUDAfytI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8C2FF8027D;
	Mon, 17 Feb 2020 07:43:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64FACF80246; Mon, 17 Feb 2020 07:42:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BFC4F800C4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BFC4F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="G+D1jRIS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VVEljL7Q"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 492845227;
 Mon, 17 Feb 2020 01:42:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=zSdco/OlhEmu6V+GTJlxM8pk6k
 LCbTTBFJQJg1vPYes=; b=G+D1jRIS6vghi4BstN+rLaADjJEMTHCp6fCuh1M7v5
 xp0n7gMLHIvlbmmcK5qTkgwWnYP19W8txeHFA2/CBiMNLXqHRNLzUUQCKOusERSP
 hzL5A8tn4z9adkyhmfsxlRKOMYsNdprnvftI7JnNRVdG8emKZ8GWk3Q7vtcrhT0d
 GQM8Cuo2IO9f6TDfPIAcXQ6SxhyzEq7PpfdUrpl4gWJBIMR8tVy1u5IZZZFdVswG
 e/fZx/GCmSCpmiSv+UzMfbyAKcRlXI2A5eOEPuDcSMiJJZ8RjrCxGjb+Z+7bOutX
 8ANZ6T2xvNodWCorfSz/w877j7j+2oyxGnvKFF+qjLOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zSdco/OlhEmu6V+GT
 JlxM8pk6kLCbTTBFJQJg1vPYes=; b=VVEljL7Qttz83QjtzIb78dchsCVP+3iiq
 mrQrdn2Wp5FTnyKu7ZmcYGqs+cOB357RegatmWCZw0DMLuYpzQQZiCi6BCxIm+zg
 xzDmhCOdTKUfnV/KTpx5Tdzzadqit1aSyXCiPkKVnYoTOce7/OdMTvkkG8PKjpfq
 ddvrJbyGnqrpSKeXcrrM4CQaD4psU69ZO9FdogfLp05+xPyH168c7cavefKU8Cjr
 oJFqYtKS4U7t+zgrN8OylzK+ay2YFYJQxezgVR3ZkFPoVwoLW/omAWbZY6Mh+JSh
 Ph6TW91ZknD2WeOIHctOZPy1PrCDtdb1D0e8/nc13ZxcXHk/TVm0Q==
X-ME-Sender: <xms:6zVKXvDuwajBBXLayMP6rG3SAxrYn5LDZ13aGwqWVjxZt-hHAhK0rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
 drudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6zVKXrnrOMGEitV3Mp0cgd0vLlrdK1vQDr5LZu6jLvf8nNpxnMVSoA>
 <xmx:6zVKXt30GaZomQc0oEUCOr6_5sOT-7pkk5EZcCYM_ebqtvAritnx-Q>
 <xmx:6zVKXp5nbpyUWIQ3ylMO-s8t07akaXOPrMBtmktqQIqMxOdBSx5Wug>
 <xmx:7DVKXqlBRtkKwaGovPTQOFxuSvXqZjJPSGvZ4GkVyfIsBrIdDCmBUg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70A61328005D;
 Mon, 17 Feb 2020 01:42:50 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:16 -0600
Message-Id: <20200217064250.15516-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 00/34] sun8i-codec fixes and new features
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello all,

The sun8i-codec driver, as used in the Allwinner A33 and A64, currently
only exposes a small subset of the available hardware features. In order
to use the A64 in a smartphone (the PinePhone), I've added the necessary
functionality to the driver:
  * The full set of supported DAI format options
  * Support for AIF2 and AIF3
  * Additional routing knobs
  * Additional volume controls

Unfortunately, due to preexisting issues with the driver, there are some
breaking changes, as explained further in the commit messages:
  * The LRCK inversion issue means we need a new compatible for the A64.
  * Some controls are named inaccurately, so they are renamed.
  * Likewise, the DAPM widgets used in device trees were either named
    wrong, or the device trees were using the wrong widgets in the first
    place. (Specifically, the links between the analog codec and digital
    codec happen at the ADC and DAC, not AIF1.)

I tended to take the philosophy of "while I'm breaking things, I might
as well do them right", so I've probably made a few more changes than
absolutely necessary. I'm not sure about where all of the policy
boundaries are, about how far I should go to maintain compatibility. For
example, for the DT widget usage, I could:
  * Rename everything and update the DTS files (which is what I did)
  * Keep the old (misleading/wrong) name for the widgets, but repurpose
    them to work correctly
      (i.e. "ADC Left" would be named "AIF1 Slot 0 Left ADC", but it
       would work just like "ADC Left" does in this patchset)
  * Keep the old widgets around as a compatibility layer, but add new
    widgets and update the in-tree DTS files to use them
      (i.e. "ADC Left" would have a path from "AIF1 Slot 0 Left ADC",
       but "AIF1 Slot 0 Left ADC" would be a no-op widget)
  * Something else entirely

There are several trivial fixes in here, and there are several commits
that just add new features without changing any existing behavior, but
there is enough changing that I thought it would be best to send the
whole thing as an RFC. I'm more than happy to reorganize this into one
or several patchsets in future revisions. It doesn't have to all go in
at once.

This has all been tested on the PinePhone. For example, I've
successfully routed a voice call between the modem at AIF2 and a
Bluetooth headset at AIF3, merged with an audio file played from AIF1.
Unfortunately, the PinePhone does not have a DTS upstream yet (partially
due to the audio driver situation), so I don't have an example DTS in
this patchset.

Thanks for any feedback,
Samuel

Samuel Holland (34):
  ASoC: dt-bindings: Add a separate compatible for the A64 codec
  ASoC: sun8i-codec: LRCK is not inverted on A64
  arm64: dts: allwinner: a64: Fix the audio codec compatible
  ASoC: sun8i-codec: Remove unused dev from codec struct
  ASoC: sun8i-codec: Remove incorrect SND_SOC_DAIFMT_DSP_B
  ASoC: sun8i-codec: Fix setting DAI data format
  ASoC: sun8i-codec: Remove extraneous widgets
  ASoC: sun8i-codec: Fix direction of AIF1 outputs
  ASoC: sun8i-codec: Fix broken DAPM routing
  ASoC: sun8i-codec: Advertise only hardware-supported rates
  ASoC: sun8i-codec: Enforce parameter symmetry
  ASoC: sun8i-codec: Fix AIF1 MODCLK widget name
  ASoC: sun8i-codec: Fix AIF1_ADCDAT_CTRL field names
  ASoC: sun8i-codec: Fix AIF1_MXR_SRC field names
  ASoC: sun8i-codec: Fix ADC_DIG_CTRL field name
  ASoC: sun8i-codec: Fix field bit number indentation
  ASoC: sun8i-codec: Sort masks in a consistent order
  ASoC: sun8i-codec: Allow all clock inversion permutations
  ASoC: sun8i-codec: Support mono DAI configurations
  ASoC: sun8i-codec: Support 8/20/24-bit word sizes
  ASoC: sun8i-codec: Clean up module/clock hierarchy
  ASoC: sun8i-codec: Clean up AIF1 Slot 0 widgets
  ASoC: sun8i-codec: Clean up DAC widgets
  ASoC: sun8i-codec: Prepare to support multiple AIFs
  ASoC: sun8i-codec: Add support for AIF2
  ASoC: sun8i-codec: Add support for AIF3
  ASoC: sun8i-codec: Add AIF mono/stereo controls
  ASoC: sun8i-codec: Add AIF loopback controls
  ASoC: sun8i-codec: Add AIF, ADC, and DAC volume controls
  ASoC: dt-bindings: Bump sound-dai-cells on sun8i-codec
  ARM: dts: sun8i-a33: Allow using multiple codec DAIs
  arm64: dts: allwinner: a64: Allow using multiple codec DAIs
  arm64: dts: allwinner: a64: Allow multiple DAI links
  arm64: dts: allwinner: a64: Add pinmux for AIF2/AIF3

 .../sound/allwinner,sun8i-a33-codec.yaml      |    6 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts     |    6 +-
 arch/arm/boot/dts/sun8i-a33.dtsi              |   10 +-
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |    8 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |    8 +-
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |    8 +-
 .../dts/allwinner/sun50i-a64-pinebook.dts     |    8 +-
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts |   14 +-
 .../allwinner/sun50i-a64-sopine-baseboard.dts |    8 +-
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |    8 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |   47 +-
 sound/soc/sunxi/sun8i-codec.c                 | 1056 +++++++++++++----
 12 files changed, 890 insertions(+), 297 deletions(-)

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
