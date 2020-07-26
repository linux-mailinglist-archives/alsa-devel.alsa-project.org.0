Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E977922DB28
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 03:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B231684;
	Sun, 26 Jul 2020 03:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B231684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595727020;
	bh=41UV7XrOd1SmtZYxuq35VaW5LhFRLy6JrIq6NpUmc74=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7wISVcZZe2dOYkamqt+XeC6n2SVsR3tGyWlHuW37clj3/W8UibGTGt+Dmq/2Upia
	 b6vYZunyX2xmTWZDYEy2d+r64lbbFQYcCo/yS+1UrRCd0g0tip2GLHXoZPKMZNH6n5
	 EhPp+9PalwZ3opyTwUbkd8KBh9hr1XMFbjQS6YwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 054B6F802C4;
	Sun, 26 Jul 2020 03:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D8EF80274; Sun, 26 Jul 2020 03:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CA90F80268
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 03:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA90F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="TpRjCvli"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="o7dfIRQp"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D362658015F;
 Sat, 25 Jul 2020 21:26:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 21:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gSnOotan3Mg6t
 HwoG/CYRCC0umOjvwli6asaDlT/n70=; b=TpRjCvlist/PVLSxjSy+81brTc8pP
 sg3I7eIVGbBHDsgGXUCTZDqAlsFCNv4vngP0jwLTN019NEDXwo3dPWUR1fQ9IK+o
 ymcYlyTv/iw3nVaFx7NhMUCFqKcxAw0/CzKU7IV4PewJ9iyQo1hyFTCuSmDFDWrF
 A3YLrtCEN/297KwB0ynTev6+SMkDvhB8pucWAFKnyTvBvEabN8kQwVut2plgR/9j
 wbU/17hSJ0jTv98achQ5DjVDdnleDIZe4SoYx1FPYGRSadPv3HubWgSQvG3ea6Gm
 Yt1zkV3uBdgi6+DQq73RKrmxV7akajuzM1xX2Fk9PIUNglXI4VRdnDTrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gSnOotan3Mg6tHwoG/CYRCC0umOjvwli6asaDlT/n70=; b=o7dfIRQp
 u8vKykFQlz7ln0Y1PNLSOPMzRBr4szk/m1y8Z++7ojssOMc4FUeoFDOTW5qlSqyt
 IWYpumqlwNX92lUJK75jPLDzPFXkeVFYJP2+1WmZJ8rreX8TMcTl3KHDrED1qkmi
 gvWMcxyF36Y6YPG2TYklDaxwsDa2iiCP5t+rsKLJKYn0rYX5sE/yIipMRqk4XM91
 xfQXvViJaY7kmMCl9ZPD8U5xZqlbtrGRV3jOIs5Y4C4FHxskBGUykMCzuwTk7FGn
 qB1iLpRApUYWtanP3lDo6+KShrRhZMyrGxMIz7VlDw32/4SH4y4GFgbTwTBdmk2H
 X/UpHDHZ5MsbcA==
X-ME-Sender: <xms:qNscX8Lfq9K3NwYbTUuA7ZNAnLG60Koq-vNBX5c0XTQrYznKN5vviQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:qNscX8KtBOlNaKLWzHIWKEY2DUd5cqZHk0sDPMdiDk_mPoG0K1P3vQ>
 <xmx:qNscX8ufUs0kGI_sthDKn65juHJmJ0N1hsp4LzsRZtVB3jA56nDNVw>
 <xmx:qNscX5bXxUVwe_EfpABwUeNHX4YcFTpa4fr7Eq1bh9sxz2uUu9GiDQ>
 <xmx:qNscXxDVb3rKkV6ku7rgf5J8RpA7eIoTUnSRoTw9cmK9uncA78FBfA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17B4F30600A3;
 Sat, 25 Jul 2020 21:26:00 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/7] ASoC: sun8i-codec: Add missing mixer routes
Date: Sat, 25 Jul 2020 20:25:53 -0500
Message-Id: <20200726012557.38282-4-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726012557.38282-1-samuel@sholland.org>
References: <20200726012557.38282-1-samuel@sholland.org>
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

The sun8i-codec driver provides ALSA controls for enabling/disabling
each of the inputs to the AIF1 Slot 0 and DAC mixers. For two of these
inputs (ADC->DAC and AIF1 DA0->AIF1 AD0), the audio source is
implemented, so the mixer inputs can be used.

However, because the DAPM routes are missing, these mixer inputs only
work when both the source and the mixer happen to be part of other
active audio paths. Adding the appropriate routes makes these ALSA
controls function all of the time.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index ffeac150c086..a75be9e82d22 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -490,14 +490,20 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 
 	/* DAC Mixer Routes */
 	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0L" },
+	{ "Left Digital DAC Mixer", "ADC Digital DAC Playback Switch", "ADCL" },
+
 	{ "Right Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch", "AIF1 DA0R" },
+	{ "Right Digital DAC Mixer", "ADC Digital DAC Playback Switch", "ADCR" },
 
 	/* ADC Routes */
 	{ "AIF1 AD0L", NULL, "Left Digital ADC Mixer" },
 	{ "AIF1 AD0R", NULL, "Right Digital ADC Mixer" },
 
 	/* ADC Mixer Routes */
+	{ "Left Digital ADC Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0L" },
 	{ "Left Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCL" },
+
+	{ "Right Digital ADC Mixer", "AIF1 Slot 0 Digital ADC Capture Switch", "AIF1 DA0R" },
 	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch", "ADCR" },
 };
 
-- 
2.26.2

