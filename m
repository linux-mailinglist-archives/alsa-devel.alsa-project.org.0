Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA78922DB6D
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 04:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77FC31687;
	Sun, 26 Jul 2020 04:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77FC31687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595732129;
	bh=IDMH81WIRsDjga3aE3NauFJKm1C/jdwnQmQnL4ueMIM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JnkryTzRRfpEAC6+1IakxLjCT/129yNG012NZU/jQxHmtveu9EWoLbQM2XHy2j+l2
	 ns73QeTuGVbp+D97q4ixPwncOnF/drG3gJCeWkAr6QnFBNt7twqpL+PqPhIpxrXFnS
	 6jkYRNLjhzlS791VY6ZqfQ8PP1nIvyKBfimcSkLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 874ECF8029B;
	Sun, 26 Jul 2020 04:53:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25739F8029B; Sun, 26 Jul 2020 04:53:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5B46F801F7
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 04:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B46F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="DGdIlHZp"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="E1Yezqie"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9EEB5580428;
 Sat, 25 Jul 2020 22:53:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 22:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=f1ggifv2qgcXmIBc8IkyaYFUQ+
 xQAPJcNHBoK/4x6GQ=; b=DGdIlHZpufK70xhAOzazoy2zcD96Q3GW5iGSyLA4mg
 NFIZl/uP6yodeDrgnVkEW8rimFZge9u856d5XIyxLvhuZh4OCkIf2SxvZykIPi/w
 31Muif3RoSMwTsILd5qnShu4Y3j2nIpDV/zKpFaQCjA5XRu/ez7JuSq84LWDJogF
 o1QhPbDIE19YC4Y1DjhsxDienwb43Ism1EpzY7Qi4SRBRfgzZOtFmKV/iinIfKAy
 1wCJhhtvCZ7leirG/38EhoECR2B75lfkjbRE2VS/VNAiQ+f4U5gGfhNcncTNTFdm
 NCGkEJjsuIJzhs4P39xc9jIwNMap5g0gaAr+QB5CZ2Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f1ggifv2qgcXmIBc8
 IkyaYFUQ+xQAPJcNHBoK/4x6GQ=; b=E1YezqiewiNurCuxe5NhRkz14JBoQjxru
 v0E8BSeC+mJMKiJOIf8elkAs8AXRY19DUgZyOF97IvSdbaWcUgSd7fYfmJ9UkODE
 HUaWahd2PmTL94RFeh8i0uit5ZHI05MGxAkuSZ18BTmkgjL6loekrq2gq9F18Vca
 uTmy7kjRubVRoeSU2tG2fNUBqYnvaE4Ff7pNFFChcxkn/W2cWb/bNzdNUgGhix9T
 PCZ10XMysxpd1CfDISyRA8UQi7woCcYLo69fLHHUR1UkDj6WWgaZduFoU0VBnFPv
 6M5oEHDucDUOvvkAb3Ev4yK+LO5OxwyuWtUkSnozVf9wPBR+Bs0Xg==
X-ME-Sender: <xms:L_AcX1qaQZloYaNCIOK-q2UERnpBfBLjXfH0R411WxV1NSZK4NlAvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
 htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
 tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
 rhhg
X-ME-Proxy: <xmx:L_AcX3qwidCk6rwxszrRXQ23DURSYgn33SmLoB8rkgwiHvfRLSajXw>
 <xmx:L_AcXyMYBvMfQrVDX5rJExI_B4kvD8pvNgqveAHlLx2APOFyFv_6oQ>
 <xmx:L_AcXw4lb9LYcdvIS1AmFmRDnyTSDC0d-bYoD74ZNCXuFYfozK_EKA>
 <xmx:MPAcXzZNCLDDdndCY6f5kxqmnuepiAmrPEqRd-_-FJEKtfwyF_0eVw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id D5A2D3280063;
 Sat, 25 Jul 2020 22:53:34 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 0/8] ASoC: sun50i-codec-analog: Cleanup and power management
Date: Sat, 25 Jul 2020 21:53:26 -0500
Message-Id: <20200726025334.59931-1-samuel@sholland.org>
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

This series performs some minor cleanup on the driver for the analog
codec in the Allwinner A64, and hooks up the existing mute switches to
DAPM widgets, in order to provide improved power management.

Changes since v1:
  - Collected Acked-by/Reviewed-by tags
  - Used SOC_MIXER_NAMED_CTL_ARRAY to avoid naming a widget "Earpiece"

Samuel Holland (8):
  ASoC: sun50i-codec-analog: Fix duplicate use of ADC enable bits
  ASoC: sun50i-codec-analog: Gate the amplifier clock during suspend
  ASoC: sun50i-codec-analog: Group and sort mixer routes
  ASoC: sun50i-codec-analog: Make headphone routes stereo
  ASoC: sun50i-codec-analog: Enable DAPM for headphone switch
  ASoC: sun50i-codec-analog: Make line out routes stereo
  ASoC: sun50i-codec-analog: Enable DAPM for line out switch
  ASoC: sun50i-codec-analog: Enable DAPM for earpiece switch

 sound/soc/sunxi/sun50i-codec-analog.c | 176 ++++++++++++++++----------
 1 file changed, 111 insertions(+), 65 deletions(-)

-- 
2.26.2

