Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800A27F7E1
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 04:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D7911808;
	Thu,  1 Oct 2020 04:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D7911808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601518578;
	bh=ZT2ffqMwaTdWcn4eNXWCJOcrSRYmA4so+LIONI/BifY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b4lG3tsiOQW+y8yy/v9yssckISP7r/qPHrB9SCwgzQI/l2ChiZu98FowSsHZsfRM9
	 wCxcRJ7JLCTz2uhlf8e7THqyoZF/9xH4ovXRGjRd3tpoH8N6sK3sZw0G+1OFMBTmR8
	 NoYxqIWzPOsvZq47BubZT2Q9NG1f/IK/XU5+os3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A714EF802D2;
	Thu,  1 Oct 2020 04:12:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E41AF80304; Thu,  1 Oct 2020 04:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D99BF801DB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 04:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D99BF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="nl4GF0z0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JsIK4yQS"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4A27F5800FE;
 Wed, 30 Sep 2020 22:11:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 30 Sep 2020 22:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=k5mtpKP9oNAq+In/8Ew8k5Wo3e
 mD3VL47opFnB6ZQsk=; b=nl4GF0z09NAieUXSBaW9IRsdoHNNnFYIUBu7IuHJWB
 83JX9NyxHDlGYgbFc0POnBwMDkbMqP9AWTnSNFLqxsj1T8R1LbiWh+a8oK3kNcqA
 8gUgNnrlWEjEXBbAF64z0kplKv7KKfxcrDoTfW5+9JTo5ewE5sMmLco0GSwsdYvY
 LWSb+37UEwR1V5DsGo1mg9XcUBlJApjmdvX9Bsg1alPzAzkEmUnNayH13IRKkYvX
 wOYBplBwqgNpBav7NtjCSi02MfA8YGd82uqSyi5FW1LSE+kV/vlavkp/fgXUSF8C
 IUqkRKppZDGj0S1svctn5U3yyHaLfkjVfQdygeQj8adw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=k5mtpKP9oNAq+In/8
 Ew8k5Wo3emD3VL47opFnB6ZQsk=; b=JsIK4yQSXzxJYHVubKnroNYcJpfaBssS/
 zqmA4lQy6zrYpKD89eOco92o8F64cNanu65NzLQNqhFT8rKAi+NUarqAi0tbcsUz
 NNQEIagKzH8M0ylluzXgGSUkdx26YU24GyMqPU6b8WwmSYGWVpZwPpAMhclTvzU+
 j03tIgti/qduHHeMFQVUGR5rktKsJHnxD+2ckigdvb63PrA080KxSlWdOgywW15X
 xgS3w9UCIHlF9psZ5dSBocNf39ue2urX2J78eQeAcMHegx8zJ5a/xahWLBJHjGvG
 Pre1q4LlIWAIVuXbQSvrcC4UGOswUS+J4sXe45kpgmye9MYV1geLg==
X-ME-Sender: <xms:5Tp1X7Xa8gcSMAr0KoBTeFHoeyvVN9PiOuXfTJVVmqbEOfHH7kjLXg>
 <xme:5Tp1XznZt28QTAiqQQuV7TWVXrJYU3CeiqbWmMovKGGz4PHCNKscgc43XzOEt1k9b
 BQc-5l_dkA5RQh5Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
 htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
 tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
 rhhg
X-ME-Proxy: <xmx:5Tp1X3YLXWQ0KYm7sTL-w8N2s_BzgQhVcv8tfSdO21TOh7ElCjM3PQ>
 <xmx:5Tp1X2VRlX1hBTHE9vBa1N0E7eBwg-tt7o9V_jhGn5mOGIKV1HZQrg>
 <xmx:5Tp1X1kqFHujiZpVn2s9S71HHtdGGG9ypVjws4nVrbuTXjSlMOjS1g>
 <xmx:6Dp1X3693d4ubFls6I57Y1q7Y6K6np9XUXXtqKjv5-L8S-RC9fZf4Q>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52A6D306467E;
 Wed, 30 Sep 2020 22:11:49 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 00/25] ASoC: sun8i-codec: support for AIF2 and AIF3
Date: Wed, 30 Sep 2020 21:11:23 -0500
Message-Id: <20201001021148.15852-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

This series adds support the other two AIFs present in the sun8i codec,
which can be used for codec2codec DAI links.

This series first cleans up the DAPM component driver so there is an
organized place to put the new widgets. Then it fills out the DAI
driver, removing assumptions that were made for AIF1 (16 bits, 2
channels, certain clock inversions). Some new logic is required to
handle 3 DAIs and the ADC/DAC sharing the same clock. Finally, it adds
the new DAIs, and hooks them up with DAPM widgets and routes per the
hardware topology.

To minimize the number of patches in this series, related device tree
patches (increasing #sound-dai-cells, adding new DAI links) will be sent
separately.

Samuel Holland (25):
  ASoC: sun8i-codec: Set up clock tree at probe time
  ASoC: sun8i-codec: Swap module clock/reset dependencies
  ASoC: sun8i-codec: Sort DAPM controls, widgets, and routes
  ASoC: sun8i-codec: Consistently name DAPM widgets and routes
  ASoC: sun8i-codec: Correct DAPM widget types
  ASoC: sun8i-codec: Fix AIF widget channel references
  ASoC: sun8i-codec: Enable AIF mono/stereo control
  ASoC: sun8i-codec: Use snd_soc_dai_get_drvdata
  ASoC: sun8i-codec: Prepare to extend the DAI driver
  ASoC: sun8i-codec: Program format before clock inversion
  ASoC: sun8i-codec: Enable all supported clock inversions
  ASoC: sun8i-codec: Program the correct word size
  ASoC: sun8i-codec: Round up the LRCK divisor
  ASoC: sun8i-codec: Correct the BCLK divisor calculation
  ASoC: sun8i-codec: Support the TDM slot binding
  ASoC: sun8i-codec: Enforce symmetric DAI parameters
  ASoC: sun8i-codec: Enable all supported sample rates
  ASoC: sun8i-codec: Automatically set the system sample rate
  ASoC: sun8i-codec: Constrain to compatible sample rates
  ASoC: sun8i-codec: Protect the clock rate while streams are open
  ASoC: sun8i-codec: Require an exact BCLK divisor match
  ASoC: sun8i-codec: Enable all supported PCM formats
  ASoC: sun8i-codec: Generalize AIF clock control
  ASoC: sun8i-codec: Add a DAI, widgets, and routes for AIF2
  ASoC: sun8i-codec: Add a DAI, widgets, and routes for AIF3

 sound/soc/sunxi/sun8i-codec.c | 1135 ++++++++++++++++++++++++++-------
 1 file changed, 894 insertions(+), 241 deletions(-)

-- 
2.26.2

