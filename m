Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAD05529D4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 05:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2868D282A;
	Tue, 21 Jun 2022 05:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2868D282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655783797;
	bh=bSJ3uMvYPl2l3kTH7vaGnitvQD0i/mY81a5m/bqVhLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gadrqY9s7w4W7D6y8ID7uyZNdcWEhcrgl8N4ytE9m6bFewPYFVlFQuXQxXGXz957P
	 aZ+eGgTSo6VAdQIvTYnYHEPiIaFZqMMWogS7rD+CWYSR1tGezGL5UEraSS1jtzYRGN
	 mtUVFn+b9gtwYx+/2TKrdmyYlsSYqSXAC4iG7eNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DFBF80535;
	Tue, 21 Jun 2022 05:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A473AF80534; Tue, 21 Jun 2022 05:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 760EDF80256
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 05:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 760EDF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="DD3jZqrl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="j6cr3/rM"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 72A8132009A3;
 Mon, 20 Jun 2022 23:55:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 20 Jun 2022 23:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655783700; x=1655870100; bh=IV
 XbiXdpdoC7yhelNdR2IcucO5Ao9MT/MrT0BNZ4coY=; b=DD3jZqrlCGUciy45F2
 3LWHvr7jNU6Jafrt6YnTQMVnVHGZbkq0EsgeAs4u/7Z6byMvZ8RDj5BtJfS9uEjN
 H9222HyVP9Z6+ptqh0FbAaVGkegjpEqgp1TmBviKg+KA9/aIYFktNud8I7zSpFKB
 z800FXyNwzcPGFDNRG337ZccouDbbMW398ok8o5KENVvmUSy4IlT3N8JTSQIWiWx
 A8JkT9cPYj5a7LywTSeDMkW3AVafq6nOkZDsu3gh/oXsupnloKo5KoWyOkdg+uSF
 cA4UaqVFwAR4R/tWFanMaGkb/RTvtPVLrSPwTWgULGkEYoY72KLYJao+2V73nSEV
 gDrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655783700; x=1655870100; bh=IVXbiXdpdoC7y
 helNdR2IcucO5Ao9MT/MrT0BNZ4coY=; b=j6cr3/rM/fHch/9aHx6h+vlBZanNb
 /2/fNyCNM/fdGRkMk3M+6uavJtfqT/4GaL+WnNqfHdAS4QxBmnUjEmXf2uA3K3aI
 yHWDznXp1OU1s5R92VR2+9rfb1SczsWZ6U7iMNaWttUg/nkbHdTynX5jRwtEmFEz
 HcFMO1BEY64GnfkOCAjoof+Y1K9NYVocjPphjcMaK4B3zC5Aea3mrr6ORt5d3yy7
 SpShFSu638iiG5YWX0Lahn3/PZ5ijF0cHXnSgIkfDmbaptN6KTcSCzU5aCKOnqfx
 BS/5AGf1p3Tjq3dnfolRw3ADMVJDljMoOWxYpcQUwB0TBJLIHMnTNTibw==
X-ME-Sender: <xms:FEGxYgU-bQblQs3YSwvYJP_uw1qCj8GmkVbUTY7sME3gTJ0KtzlR7A>
 <xme:FEGxYkkCzqwClXiaicqlYklfQfrTgrusUxdyIWa4hr1oY6X9H_5C-q3BMJRpgDa8P
 OkEB5oNN0PXEh24bQ>
X-ME-Received: <xmr:FEGxYkbncAroiaJbw2YFXBdiEAwWIwoLySFGVd8tmlICWYTc2CVBqMa0bjAOMOWu1dwRBKNQAlqVKonwCruz5I57F0iJosKbh-u9UssibtROyXk9IF8LgTRE56lrg0ob35AN7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:FEGxYvXIRg8IScJBKusOtdXJJzw5GzZDU4rUXPLKKKXre97XTOOsIw>
 <xmx:FEGxYqlyzw23q6bsq2d2PsZIiqQnWtCQhsOiCuj52CbU-1EEjG44uQ>
 <xmx:FEGxYkdECgXBx_2-0B6X0i1cqj9P3QT1qN24S3Tkp95_LMOgO9Aijg>
 <xmx:FEGxYv8gZvOvqm3-ZLhNZ2foBALUqWgTjNm0IZM9eyNGydIB_YM9lg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 23:55:00 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/3] ASoC: sun50i-codec-analog: Add support for internal
 bias
Date: Mon, 20 Jun 2022 22:54:51 -0500
Message-Id: <20220621035452.60272-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220621035452.60272-1-samuel@sholland.org>
References: <20220621035452.60272-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

From: Arnaud Ferraris <arnaud.ferraris@collabora.com>

In order to properly bias headset microphones, there should be a pull-up
resistor between pins HBIAS and MIC2P. This can be an external resistor,
but the codec also provides an internal 2.2K resistor which is enabled
by a register.

This patch enables or disables the internal bias resistor based on a
device tree property.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
[Samuel: split binding and implementation; move to device probe]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Move register update from component probe to device probe

 sound/soc/sunxi/sun50i-codec-analog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index a41e25ad0aaf..e1e5e8de0130 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -117,6 +117,7 @@
 #define SUN50I_ADDA_HS_MBIAS_CTRL_MMICBIASEN	7
 
 #define SUN50I_ADDA_JACK_MIC_CTRL	0x1d
+#define SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN	6
 #define SUN50I_ADDA_JACK_MIC_CTRL_HMICBIASEN	5
 
 /* mixer controls */
@@ -507,6 +508,7 @@ static int sun50i_codec_analog_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	void __iomem *base;
+	bool enable;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
@@ -520,6 +522,12 @@ static int sun50i_codec_analog_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
+	enable = device_property_read_bool(&pdev->dev,
+					   "allwinner,internal-bias-resistor");
+	regmap_update_bits(regmap, SUN50I_ADDA_JACK_MIC_CTRL,
+			   BIT(SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN),
+			   enable << SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 					       &sun50i_codec_analog_cmpnt_drv,
 					       NULL, 0);
-- 
2.35.1

