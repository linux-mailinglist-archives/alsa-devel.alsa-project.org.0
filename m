Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 333DA5529D6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 05:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D57EF28A3;
	Tue, 21 Jun 2022 05:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D57EF28A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655783822;
	bh=DLWNmQvIF92xOjQn1z0rUlz9f/3DH4cseJqtYPZjOfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rYYappCvQg1A0JnNo7RbQw2pwTJa+mx/sREuzhlvFk8mWpL/gX9d0uUARqU1Cq7/S
	 CsZoc+l7gpgwUwFPu5usrBgjYDPNXtUS+nkCJ7Crjd4FkysgeyJSPxFWHpnnN5FlwL
	 qN7lihqhiPYpTyCpE2qRveaBI7NVv4NxJcOdRQNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 238E8F80543;
	Tue, 21 Jun 2022 05:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F13F80534; Tue, 21 Jun 2022 05:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC20FF80155
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 05:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC20FF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="ioG//c2U"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R01ZE/sK"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B37FF32009AC;
 Mon, 20 Jun 2022 23:55:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 20 Jun 2022 23:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655783704; x=1655870104; bh=VR
 hWQHBguZsw8yrrHV1JpbZv0bAlRhTVvnAV7jTHX4w=; b=ioG//c2UFTlNLdI6/f
 mw7nqozZ1TMUk2nmIHpEr+9y9Bo6Rfzf0ID3Xu+BdCnTYFWY+c9aJtXBrFUTQY/H
 S0Jhp9ZMwQ4xW8gROGew+J0wA9KWfcT9oxKv+O3EKKAOUDqxpP07T7VLdf64b+Ab
 iIxA14zIyFihRKwqSEKj73UalCRUAXABAdcBxfEz6Q7pBFdOUjNe9FkVHqNWwMiW
 dl970xPjvSTco3SWbu280o8vQSg4NrF7lZzquRECJJnjaXW/DwANGbYQSmK696BR
 GlcLyYOBm3krFTFWYGdeo7oNtkWlJ6+0jMhqiPHxdGApVRENc5vtg/bNukR9QZFO
 /QHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655783704; x=1655870104; bh=VRhWQHBguZsw8
 yrrHV1JpbZv0bAlRhTVvnAV7jTHX4w=; b=R01ZE/sKfHaJ7Q35qldycLrEjPmgt
 Qu2gjuea1qgnrSVVtuR5k8BUAqdaHBfMS0i4XUdnDL5YenSivR+UB++YCXDazeaO
 5r1VBtzLLSOLbuCHYu9q+boLgfAkIHplzAMZvMFeX96P28w8qqI37eOA449kfA8g
 ulowo6ZfTlVtJbJe5tL1g9ENP3ELadZ3WNZfP4xf3z99Vgfi+MLTL++4An/eDxP+
 78yYx090yJsxxpOFSftb3BdwODjzSJV3B/IZjKou/GyldCZFd6p9tD+N46w5Xm4Y
 PcqLa+NxFIT89EQ3QRRIya6HxVcE8q5ghNqWMf7T2y3+MEhGIozM+2q4g==
X-ME-Sender: <xms:GEGxYsiBnbERuAyHXmBtTjSMwysllg0dWLYA4Bk1cgxM53LTezhcBQ>
 <xme:GEGxYlAOAH9uqScfS04cSV00HkWjDXBCwLoedJyWznPauQ6ih310Fvz8_pbar6VSI
 hgPd2b2CxtRFDahsw>
X-ME-Received: <xmr:GEGxYkFQAqnFGK_2GFmGU9VwCyQIPMaMHOepMIilCQSQfN21s3tjqwdIrCi5nRsF4k61njE2aO0xCXf2219a6YvqnORcTtjt-gkrCGTjFeDEjFn2RzxUwTKR8Aaescq0OwrkNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:GEGxYtT95agFMh9NGGXxhwWPvTCQFVGb_X8gj6RI-Czhj1z8K6k9wg>
 <xmx:GEGxYpxPrZ8qixAG9_ue4WURFz4HlpqlQadis23HwkFUTdnHLhSTJg>
 <xmx:GEGxYr6pB9-HN4w8idgpE5IYSt8RyeqnutLXuGg_I-t8AkPH6Y46jA>
 <xmx:GEGxYuKI6EVTipbaj696Y4FEoDfqx2YwpteO_KEjEe8DrmbN2q31og>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 23:55:03 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: pinephone: Enable internal HMIC
 bias
Date: Mon, 20 Jun 2022 22:54:52 -0500
Message-Id: <20220621035452.60272-4-samuel@sholland.org>
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

Revisions 1.0 and 1.1 of the PinePhone mainboard do not have an external
resistor connecting HBIAS to MIC2P. Enable the internal resistor to
provide the necessary headeset microphone bias.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts
index fb65319a3bd3..219f720b8b7d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts
@@ -10,6 +10,10 @@ / {
 	compatible = "pine64,pinephone-1.0", "pine64,pinephone", "allwinner,sun50i-a64";
 };
 
+&codec_analog {
+	allwinner,internal-bias-resistor;
+};
+
 &sgm3140 {
 	enable-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
 	flash-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
index 5e59d3752178..723af64a9cee 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts
@@ -29,6 +29,10 @@ &backlight {
 	default-brightness-level = <400>;
 };
 
+&codec_analog {
+	allwinner,internal-bias-resistor;
+};
+
 &sgm3140 {
 	enable-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
 	flash-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
-- 
2.35.1

