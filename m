Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 564384A7DA8
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 03:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D894E16E1;
	Thu,  3 Feb 2022 03:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D894E16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643853753;
	bh=J8ajVcBp4Zkx3e4qoungVOksOz05J4o4J/I3ClEKLFk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bYtzALSIjjw0P9bDKVIWINr+lkw4uHyNdowK28+q3N+baGS+Z99e4G/sDH31pDRAm
	 kYIhZVdUO9JRqHYRTCwYMcWekC7WCZs+0gN0F9iNq0MYmVzMaBhreZHVIKZ4/803mM
	 wE/STfwgJYXo6Ygk+Z4h/Olgko8gLFfEnjyTjUdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42182F80095;
	Thu,  3 Feb 2022 03:01:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E9F3F804B0; Thu,  3 Feb 2022 03:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C429FF80095
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 03:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C429FF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="ZnegHZQ6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="k+D/h9Sj"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C44542B0009C;
 Wed,  2 Feb 2022 21:01:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 21:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=9CK2u6ee+e0QjQkxatovO9y+1G1KA4Gn5dGKWr+mjC4=; b=ZnegH
 ZQ60vHjqTX4D7uUYXe5eqphy9Hom3Q0OMy2nkIxlMA2DdDrxYZ3DqqefN+nQtUpT
 yNXkOPQdeKyZP7jhIAJobfZ8FFSZxqNqWrVDqK6cst2uAyFZ3PkpfW8eyZxtejPL
 FOJgZjEW2/+OiJyTAeMNteQPecTYN4uLWsQA6cVjr4t5oc6dTfzkgNNOiLByxQIz
 vRWF+AuWVFMDrBvDos1EfIqxc/QQfTfqTUNtErkCPAH6mwpmc3PWWaJIPOjENi8V
 u2WSTGgtrgaC3ycJRELZlLaEu00TLYU4KBvxr+nhR+XgCBXUz4M99HDTlJ75Ubb1
 4yxd0S/CMOQRfEhXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=9CK2u6ee+e0QjQkxatovO9y+1G1KA
 4Gn5dGKWr+mjC4=; b=k+D/h9SjwYCWKitapyjE4CFvr771k8gxw7Y8BIGXhXRSl
 3BmwxtA+eIgUyRHgv75UY9/Jo0FqzFvrWRN4gkUorKLbDuYzrM3acKPJhmKH134S
 5z/4aAGAmOfuFc2//n8aEdm/ZjcGElm1p9pd9Ih7/UMsNI/u5KBUmSWM1ZNRbrfw
 P+WKUvNQsUvrE74X6NkwAnW8bMTI77EYBL3FtoYgk1ESHKTRxV+1WP4Q0P7gVdRx
 xBaev1c60GKfmA2F93IENygqGpEmSBHdB2FCFgXKHcOeobdS49qDtUwR52THaFzH
 lqomZuaRuJyFomiG3YKBGitWxLepYkIuGvuRph1eg==
X-ME-Sender: <xms:bTf7YTWTuuKlb-2J7ORvbqYz83iYnI8dE9FX0V4QiNm_qJo6jtnjFg>
 <xme:bTf7YblnhByH9vvLtIvCq01RWFgLFs8fnLxUbpQNH37z0LNjbNWItK04uFEnHw9Ns
 WDCenOTGpa-GHRJoQ>
X-ME-Received: <xmr:bTf7Yfa3fB2XRQf_x8SZC4o0PrgTEFbYewlgQcpalf5dKPrMETPMx61W2Sbo4NPpttux9Ff4s0XMzJ8HLyKgPTQCaHduwDAExUL4RT4GUaIommUvGy-u2zi7vsIM0ncVj4qmCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
 htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
 tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
 grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:bTf7YeXDDMu_6kHYY28fau6Oqk9As0BsFHH-IU1ijs457m3pHLqUGw>
 <xmx:bTf7YdnqzlUBoXW4aEgGLSOY3k7B_lYhOtW-nqNAKbnT_X_e9XAKRg>
 <xmx:bTf7YbeQC5-kdjTaVhdNw7qQnWtRB-ASPOqgoIzTa_DSCDoagXD-Tw>
 <xmx:bjf7YfnzjWVR7i8J84FPAx566rYwrVhpQEMs4t9x_SYoc3USMjfIpoQvK2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 21:01:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC: sun4i-i2s: Support for Allwinner R329 and D1 SoCs
Date: Wed,  2 Feb 2022 20:01:12 -0600
Message-Id: <20220203020116.12279-1-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

This series extends the sun4i-i2s binding and driver to support some
newer versions of the hardware. Each instance of the hardwar now has
multiple input/output pins, and channels can be muxed between them.
Since so far the driver only supports a "default" linear channel map,
the driver changes are minimal.


Samuel Holland (3):
  ASoC: dt-bindings: sun4i-i2s: Add compatibles for R329 and D1
  ASoC: sun4i-i2s: Update registers for more channels
  ASoC: sun4i-i2s: Add support for the R329/D1 variant

 .../sound/allwinner,sun4i-a10-i2s.yaml        |  5 ++
 sound/soc/sunxi/sun4i-i2s.c                   | 68 +++++++++++++++----
 2 files changed, 59 insertions(+), 14 deletions(-)

-- 
2.33.1

