Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590922DB25
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 03:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADFEF1688;
	Sun, 26 Jul 2020 03:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADFEF1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595726941;
	bh=Yu5IfFY3d1mZBUdNBYZ1iV1PG54ZugW9aqbDN17Cu0Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qHNmxC8iEygZchAW6CU2pi74rPcL7TCRsYNv6+dRu+86Lx8lsDU7RB5DCf/7WzKnW
	 sjGO6W9lEw50QThWlaTSziOrBXX0Pq782KJPSvMrxKcgWLEUQy6zaVnmirb/7hhLC1
	 lbiiWa4vt7mdiSc20abwOQxMdKglQ4/04ZHwpsik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F40F80274;
	Sun, 26 Jul 2020 03:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A59BF8026F; Sun, 26 Jul 2020 03:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 941A0F8020D
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 03:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 941A0F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="EVPd1CL+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rn3qR07r"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7533558015E;
 Sat, 25 Jul 2020 21:26:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 21:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=NK4oEFps6opW0I20N7a390yS2P
 HhY6R+HwWvhfjHia4=; b=EVPd1CL+Nvq+jEujkBVk9W6CBa1Or/DRYaZ2O0Qk14
 ELbFcN+mc1RmKSzXLx9GosiTAcOmttKS+QVmnReS5ipq4eNv63F+v0zooFW8+JYY
 OvvW/yMZkwBPgLeRW0fm0oKFWOUrBENjl8u1x5ZexUagHN/lngpnKcJR+THNfByV
 IMykOw3q6j3NU8S7C2f8d4yabqy2W7MCblqUCgvk01wm5N6wranLOI1QHcgblnC9
 j8U/ZIjTJxa1j7VGa8BouLLkfPvJayPyLsW5HDigZahUaXYvbtGgrqpwvy7Zk5NC
 CWr+nuaksgVQsng1+VdAgd3k833JaJ/sJRe/cp2wMPlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NK4oEFps6opW0I20N
 7a390yS2PHhY6R+HwWvhfjHia4=; b=rn3qR07rDkxIPYalMbRKf5pTNltsWk2FO
 czJkgnOA2UUbDWiUJY72giAZpZD/CNeG4ioz5edVh5EF8Znx+drxAQRHtfIebis6
 z/DBPJ6HJg+pFEhMRWGLCHbMJvIL+WyDPimsPkU+ZUWuo+dVnljBPwFuG5ZTRo8J
 hZ4XM2aAjqSKwX/nLo9W0DZ6HUQaZjFk+XMvg3bBrZUdurJa0pu8AVnPEcO3y/2C
 sbcli5lOMnnlng0TQ1n0Mw+foWIxcnDphXpz+f+uoySjIfVlYRrGHy8YjELxkcZh
 Y5HZldCPKHL/PKFeSGrF+8BLIAvqTK1fjs/8p0r2Uuz1FoepRLhlQ==
X-ME-Sender: <xms:ptscX77KMY_lXI7gKRHSJTU8J7TVctfc0kqasdGI3ZB8PJkx1oN_0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
 htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
 tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
 rhhg
X-ME-Proxy: <xmx:ptscXw4jeKeCFpEqyogj7uQ5Y1I7DopCbz7qFo2mExlT8_vcRhVOuw>
 <xmx:ptscXyfZ7anLQhn3huYUE2pB64GsbBr_3jglEzMY-ZN7FaJ6RIGznA>
 <xmx:ptscX8LrNVKJTtKGbO4Uk7bv8EFlxpi1WouWliGgYI_SE5hzmgk4ag>
 <xmx:qNscXxxunWdZ6bnR5OaSin1tC4eHrEPxCpbfXS8zqsB4H8bY3dGKOg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1CA0A3060067;
 Sat, 25 Jul 2020 21:25:58 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/7] Allwinner A64 digital audio codec fixes
Date: Sat, 25 Jul 2020 20:25:50 -0500
Message-Id: <20200726012557.38282-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
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

This series fixes a couple of issues with the digital audio codec in the
Allwinner A64 SoC:
  1) Left/right channels were swapped when playing/recording audio
  2) DAPM topology was wrong, breaking some kcontrols

This is the minimum set of changes necessary to fix these issues in a
backward-compatible way. For that reason, some DAPM widgets still have
incorrect or confusing names; those and other issues will be fixed in
later patch sets.

Samuel Holland (7):
  ASoC: dt-bindings: Add a new compatible for the A64 codec
  ASoC: sun8i-codec: Fix DAPM to match the hardware topology
  ASoC: sun8i-codec: Add missing mixer routes
  ASoC: sun8i-codec: Add a quirk for LRCK inversion
  ARM: dts: sun8i: a33: Update codec widget names
  arm64: dts: allwinner: a64: Update codec widget names
  arm64: dts: allwinner: a64: Update the audio codec compatible

 .../sound/allwinner,sun8i-a33-codec.yaml      |   6 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts     |   4 +-
 arch/arm/boot/dts/sun8i-a33.dtsi              |   4 +-
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |   8 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |   8 +-
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   8 +-
 .../dts/allwinner/sun50i-a64-pinebook.dts     |   8 +-
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   |   8 +-
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts |   8 +-
 .../allwinner/sun50i-a64-sopine-baseboard.dts |   8 +-
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |   8 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  11 +-
 sound/soc/sunxi/sun8i-codec.c                 | 137 ++++++++++++++----
 13 files changed, 155 insertions(+), 71 deletions(-)

-- 
2.26.2

