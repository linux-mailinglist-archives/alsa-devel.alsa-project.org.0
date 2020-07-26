Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F105122DB29
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 03:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84CE0168A;
	Sun, 26 Jul 2020 03:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84CE0168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595727059;
	bh=Bzld3renOutKYfvOmofpFeC4iBndJmNs3LtPTjokYdc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9kWntoAjFUC0u4kEOIVR2xxHXaFuXOC2jynISgSABC2/BlNFtLP5JE074CwBUk1Y
	 wQILQF9J57LfWbyWm9YpkwpZC0yU9F0vn7ddo3WhDrAKSTCTbeLXOrB/I5Tr7yOE1g
	 6WYGkqEuuZBywVNtG6fXBIn4hTlrU1UrwaofZ1yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 280DAF802E7;
	Sun, 26 Jul 2020 03:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EA86F8028D; Sun, 26 Jul 2020 03:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96BB5F80212
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 03:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BB5F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="truARi95"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kCUBBvrP"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 82165580161;
 Sat, 25 Jul 2020 21:26:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 21:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=92seWwiwyDFZb
 JFzQ9d3eHcie01wHXdtRt1sWd8bW4k=; b=truARi95xImcb2fRj1hjIyQrtpHZ3
 QKo8JEn5Cqwa6NnKOpf9QykGuRdWK9FvyMQHmgQDNui2PsinxXWnJbSubrQfmXbA
 VIW3Ug+OXmzHaaUDiK9/njsUSNWkSWcxGrNsyFY8H5S1de4rtyRoMqPCdXsjw1+S
 nQBvYFqVRMvkM4z6VMSJMW5f49oWxMNu+JemvgKGDhM3jro1rWu/rMJ8oQ6kZBn4
 Q2ggHplJ0nx2qSHB/mWbOafa7iR9pDIA48IV9R4o37xLuFZ6UAyrtbu9wtyhvGgv
 YaDXKzUbcntgpS7DkozmAqezMgK8nU3yHTheUK2+54PrTv30CL+COWuMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=92seWwiwyDFZbJFzQ9d3eHcie01wHXdtRt1sWd8bW4k=; b=kCUBBvrP
 QhlFnHL7qHPuSqsolAPjsgtU3XCNlst41eUmH9Y4hZRjodPS8i9n1Q4rcnOUq9h8
 pXZjPIwzVqQvwza0YZCauy6ABnqXV6Q67anCA2spT2dIlO7MUkHJDZjkLc2o6XIK
 HvdOqeYRMv4H8wl/E7ihYoLFAggph4WDFlP/e/SfLJ8lj9iEt56K3CmfPOL+laJ7
 19J8rn5Btz/FZxwAvuVvOV2llVMFjM5CZrl1qT+FQhbjVX4cEga7EIH946CU428a
 vfYgLyn9CyeaAXWejp1I5wne7bA5e2wD3qDFE4J+x+ywme9+4LIxXA2vBvacPgQF
 Q/h5iK6svL+obg==
X-ME-Sender: <xms:qdscX_RGSd0Bz5REcB0aynj5T25jXIrvgEsv9e57H56NKetIMONI2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:qdscXwyK2FYqLC728I9A31l-fcx0SvbDFgydDfGDzGhuJR2gX7fb-w>
 <xmx:qdscX03nqSjE-tG8K6ZphOnY5-A0k-HdDMpn6-klUmPABi4X_jTFcA>
 <xmx:qdscX_AVBjwSIo_TAmQSddIfRntZ7wvwu_tXu1_mlzuMZOcyeNxXDQ>
 <xmx:qdscX3p6dP340suJaeFCkfc0ZIuK_oIBhoRYN2WzQF1qtxiJNz6dMQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id B65AC3060067;
 Sat, 25 Jul 2020 21:26:00 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/7] ASoC: sun8i-codec: Add a quirk for LRCK inversion
Date: Sat, 25 Jul 2020 20:25:54 -0500
Message-Id: <20200726012557.38282-5-samuel@sholland.org>
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

On the A64, as tested using the PinePhone, the current code causes the
left/right channels to be swapped during I2S playback from the CPU on
AIF1, and breaks DSP_A communication with the modem on AIF2. Both of
these are fixed when LRCK is no longer inverted.

Trusting that the comment in the code is correct, the existing behavior
is kept for the A33.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index a75be9e82d22..304683a71acd 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -88,6 +88,7 @@
 
 struct sun8i_codec_quirks {
 	bool legacy_widgets	: 1;
+	bool lrck_inversion	: 1;
 };
 
 struct sun8i_codec {
@@ -215,18 +216,19 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 			   value << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_INV);
 
 	/*
-	 * It appears that the DAI and the codec don't share the same
-	 * polarity for the LRCK signal when they mean 'normal' and
-	 * 'inverted' in the datasheet.
+	 * It appears that the DAI and the codec in the A33 SoC don't
+	 * share the same polarity for the LRCK signal when they mean
+	 * 'normal' and 'inverted' in the datasheet.
 	 *
 	 * Since the DAI here is our regular i2s driver that have been
 	 * tested with way more codecs than just this one, it means
 	 * that the codec probably gets it backward, and we have to
 	 * invert the value here.
 	 */
+	value ^= scodec->quirks->lrck_inversion;
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
 			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV),
-			   !value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
+			   value << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_INV);
 
 	/* DAI format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -673,6 +675,7 @@ static int sun8i_codec_remove(struct platform_device *pdev)
 
 static const struct sun8i_codec_quirks sun8i_a33_quirks = {
 	.legacy_widgets	= true,
+	.lrck_inversion	= true,
 };
 
 static const struct sun8i_codec_quirks sun50i_a64_quirks = {
-- 
2.26.2

