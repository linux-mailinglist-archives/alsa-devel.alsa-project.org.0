Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B96B160832
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 03:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3CE71671;
	Mon, 17 Feb 2020 03:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3CE71671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581906727;
	bh=J5sM9SbklSneKFTkJG1fSYjgnbGgxOC2nanSiVOfY0E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vi3COWWrQqO5EnZoOklgQN7PJAC5hEXpxY/Ec3Dhms62BrdhnJ6EFcIM0AnlFlenp
	 lcYHc04KNlrMWxiiy/BexmUbUGXgHXjsw0KhS6Aup+jYG9L0/sJ3KLaGPEOm3Rwhwk
	 a0m5TlJcVXI6165cmc8UVshEQU7mTajbDKQYna+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 244ACF8027D;
	Mon, 17 Feb 2020 03:18:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BACBF8033F; Mon, 17 Feb 2020 03:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01BEAF8014C
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 03:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01BEAF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="KgZOC9om"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tZ4rjemR"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 97B6D6D65;
 Sun, 16 Feb 2020 21:18:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 21:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=81rmcCzH+99CIb8JzKCPF7IB0i
 Cso38cvLYNenVDvQ8=; b=KgZOC9omNh/Mhbz59mykqHg/w1bH45ClosPkO/Fgoz
 MZVm8v1NXpcRoWPtlrKLqnSUQy3XJt9Qtbwk+B4Be+fx9uqNRxS6QrsdAjy1byID
 O/JYdYWsZyCRnagTztvOpA44PadmDw3sSOpvQ8olhgxD/t/XOycyMoJFMxiKhPB5
 NMzKive9HuRPjrq6dk7gU6M0SjswTEjjbNWdYJIc4SaY6iO+PP710It1TDEGQm0k
 0mzXt0E7CGx9FvrZhwNY7jMFteLPBCBswZZ2//OVAni0hTmD/YubQdLNZEfJiH3d
 dh5HkyOkweAb/f93iMMdLOYqgH5U9VMmXZ6N0YSevXGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=81rmcCzH+99CIb8Jz
 KCPF7IB0iCso38cvLYNenVDvQ8=; b=tZ4rjemRHjhvYRn8IWa88dxrN+aJ7aByz
 81isJQx4xCyoJkN1ETHReI0CHGcSnX8REs5smKf6AWPv98T8AEUQ8kmLrduG7do0
 L15QVoc1XNNomtXRu0ZCQDBtSPbHHBoEN9gXJtGcoISYE8FO76fI4deQO/OJSmW5
 pXlkS0cCeRCtWQY1teiJjRjSlWXkthdJBK6STYvVDtrEGv8ynxGX5KQKaHJH2Wj9
 iMoBjLF7MCrWKW9inTL9057KwaQXitloWMtAx5Tao9+XKX36TIgKNKgm0U2nCjxr
 +7tdT5IZr0MOPSYGV0kKAdUnRYCn2mV7OQCf1sYVlWWF973jXAV6Q==
X-ME-Sender: <xms:5vdJXg3nqOvn_wGRRoRCPDwqghJu_I90lH075V3kuV08-Z8QTSnS0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
 drudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:5vdJXiHPqr_iZzZGKOLSoK8hMUwQFvTT2CWrCjnhDYhfRk3Fe6LmGQ>
 <xmx:5vdJXt7kJxB7BEVbcvSeo_2a3KP_GrteIFqNl0cO1okB5I20m02Kwg>
 <xmx:5vdJXov0YxKj6xnnkjebkZWvv228FAN7ew_FqYDVxI36OBFxt8tEhQ>
 <xmx:6_dJXr0UGR0mFYcqrcV5ahNxO4ZvGbeiGrxNaoWWqto1dCWm1TSr2w>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A1443060BE4;
 Sun, 16 Feb 2020 21:18:14 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 16 Feb 2020 20:18:05 -0600
Message-Id: <20200217021813.53266-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [PATCH 0/8] ASoC: sun50i-codec-analog: Cleanup and
	power management
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

This series performs some minor cleanup on the driver for the analog
codec in the Allwinner A64, and hooks up the existing mute switches to
DAPM widgets, in order to provide improved power management.

Samuel Holland (8):
  ASoC: sun50i-codec-analog: Fix duplicate use of ADC enable bits
  ASoC: sun50i-codec-analog: Gate the amplifier clock during suspend
  ASoC: sun50i-codec-analog: Group and sort mixer routes
  ASoC: sun50i-codec-analog: Make headphone routes stereo
  ASoC: sun50i-codec-analog: Enable DAPM for headphone switch
  ASoC: sun50i-codec-analog: Make line out routes stereo
  ASoC: sun50i-codec-analog: Enable DAPM for line out switch
  ASoC: sun50i-codec-analog: Enable DAPM for earpiece switch

 sound/soc/sunxi/sun50i-codec-analog.c | 174 ++++++++++++++++----------
 1 file changed, 109 insertions(+), 65 deletions(-)

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
