Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDE54DA8D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 08:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A7591AD0;
	Thu, 16 Jun 2022 08:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A7591AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655360862;
	bh=Q0f2O84rdgTt9lWltJ5d4iN+/S6RrFqzFduhMO8bc2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/O4kpmz0tKQkCyZLjlk9B/ccXv4pOiN4iFM57kkuRLRGQ2HQHNENGkRoZl7xsP2P
	 9lZAB+C1j8Us433X6OpJEb6kbvNHetDZaZhooQ/qLQ9YrGLwPRrwoElbCG6XJQqsxu
	 ed4ow82lxx2rZXsaMWcgfhF8f1ndiwSvPpJUKFXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF47F800F0;
	Thu, 16 Jun 2022 08:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A363F804E0; Thu, 16 Jun 2022 08:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38EB9F80310
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 08:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38EB9F80310
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Xt5lIXMG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="l4UPReM0"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 785043200B3F;
 Thu, 16 Jun 2022 02:26:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Jun 2022 02:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655360762; x=1655447162; bh=Kz
 eS9u1MTLURbLcpn0LvQlKGCvEwzACeYn+zXwv6d8E=; b=Xt5lIXMGvMHUEnnJJZ
 /G7J9P5KS1Yt6jgkg2mbEyXxEonBCxI9sZPkxNRzdVBBoxt3AQTepDBVeKFWBCAm
 ZQRqeK49gKcw0aALEAk9ggYJub0n1tDLrBqRrmPMr625vC9acqWQYFdipCl3PeBB
 Q/psD8VuuAm4cbrg0U0INOgxtE+Yc1CldnAWuSSSrjEimp1mOOPJfnmlT84erV5v
 BVJSpoO2fH4qUAvnPOGz6y3OsikKUlb/zHPMbN4C74LfHqF6XgjBLoOeXi8O71qv
 S/0+nnFYS2gsr4wlJ7KO+jLvV72+ytdhNnoH3Y/oOLDYDq3k/iB0Yhtf7BTE5PCl
 Mpzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655360762; x=1655447162; bh=KzeS9u1MTLURb
 Lcpn0LvQlKGCvEwzACeYn+zXwv6d8E=; b=l4UPReM079yTbntpXZluelJtAEG/t
 iYgeutXBJXaF+ZKU+m1R0jlfK9vS7vPacorFJyYAeQ4d/hyIh9yg+vZeIigKwH8X
 yVBi9kJGOS4YlbrbdjadQjfnQPCOePrtgdLGboDeWcan5s39qcYqPK313cCOz8T2
 y1mo9XtSmMAatIJ8yUe/c69S3VTf6IuWFDoSQcm0ZCdpUcm/zusbSs3Xv5mMXAXj
 u7NoNeR4t/AYTniifc9eWOh+FUVKyIa4pPwZiLal12xgIsSanFJqgaafhnFkedLT
 3VSd6+HxZnie7Xnp4t63zJvY4/9UsduCgPhVovyDfPIKvihCuqd1UdIpg==
X-ME-Sender: <xms:-syqYlaGEElpFySsXxzhzUNX4NdiLS9iDF-GknN9yHMI1H2u70UTdw>
 <xme:-syqYsaS-Kfc_J--cd0iXBWEnod6RGvzYi3QIl2vOBWt5rdjUDQ97DWYWnuC8YT07
 3-FvMhc2WI1X7hLGQ>
X-ME-Received: <xmr:-syqYn-6nNLTXtYmXMN0TTOV37JpeaN0wMgEgvzasr4IoRwrLxDuc8YwVnrT2Xent4MBwzVsTjR7E51440TsIICc-Acv5CnyvaAuIGSWfTUypg_IQghnPVfKJI7YqeO5YQFzrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
 gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:-syqYjruQNCCC-nymaVBSj44cspl0GbuITlZQNWwZCY4eckXoKVKgQ>
 <xmx:-syqYgpPaSd7yW01CSy8-j0lpvueowtqrTJ0usGVTW8hzRsC6JOeEw>
 <xmx:-syqYpQ_-G4C-kURH7XWdtVDt94Hc9JV7nOelU_QDFYPXaI8iEiTEQ>
 <xmx:-syqYrAAcYDB_v8QcOfKFp-5LiySAsR_Z9ldbfUejsoMHBZQrDBTsQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:26:02 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: sun50i-codec-analog: Add support for internal bias
Date: Thu, 16 Jun 2022 01:25:53 -0500
Message-Id: <20220616062554.57266-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616062554.57266-1-samuel@sholland.org>
References: <20220616062554.57266-1-samuel@sholland.org>
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
[Samuel: split binding and implementation patches]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 sound/soc/sunxi/sun50i-codec-analog.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index a41e25ad0aaf..699a5a318875 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -117,8 +117,13 @@
 #define SUN50I_ADDA_HS_MBIAS_CTRL_MMICBIASEN	7
 
 #define SUN50I_ADDA_JACK_MIC_CTRL	0x1d
+#define SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN	6
 #define SUN50I_ADDA_JACK_MIC_CTRL_HMICBIASEN	5
 
+struct sun50i_codec_analog {
+	bool	internal_bias_resistor;
+};
+
 /* mixer controls */
 static const struct snd_kcontrol_new sun50i_a64_codec_mixer_controls[] = {
 	SOC_DAPM_DOUBLE_R("Mic1 Playback Switch",
@@ -471,6 +476,18 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 	{ "EARPIECE", NULL, "Earpiece Amp" },
 };
 
+static int sun50i_a64_codec_probe(struct snd_soc_component *component)
+{
+	struct sun50i_codec_analog *codec = snd_soc_component_get_drvdata(component);
+
+	regmap_update_bits(component->regmap, SUN50I_ADDA_JACK_MIC_CTRL,
+			   BIT(SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN),
+			   codec->internal_bias_resistor <<
+				SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN);
+
+	return 0;
+}
+
 static int sun50i_a64_codec_suspend(struct snd_soc_component *component)
 {
 	return regmap_update_bits(component->regmap, SUN50I_ADDA_HP_CTRL,
@@ -491,6 +508,7 @@ static const struct snd_soc_component_driver sun50i_codec_analog_cmpnt_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(sun50i_a64_codec_widgets),
 	.dapm_routes		= sun50i_a64_codec_routes,
 	.num_dapm_routes	= ARRAY_SIZE(sun50i_a64_codec_routes),
+	.probe			= sun50i_a64_codec_probe,
 	.suspend		= sun50i_a64_codec_suspend,
 	.resume			= sun50i_a64_codec_resume,
 };
@@ -505,9 +523,20 @@ MODULE_DEVICE_TABLE(of, sun50i_codec_analog_of_match);
 
 static int sun50i_codec_analog_probe(struct platform_device *pdev)
 {
+	struct sun50i_codec_analog *codec;
 	struct regmap *regmap;
 	void __iomem *base;
 
+	codec = devm_kzalloc(&pdev->dev, sizeof(*codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, codec);
+
+	codec->internal_bias_resistor =
+		device_property_read_bool(&pdev->dev,
+					  "allwinner,internal-bias-resistor");
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "Failed to map the registers\n");
-- 
2.35.1

