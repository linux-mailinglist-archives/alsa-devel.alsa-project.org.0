Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF4A36F4B9
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 06:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2443A1696;
	Fri, 30 Apr 2021 06:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2443A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619755290;
	bh=/RDylhT/XJYqnJZm3kZZ/5bijvEmGIHxI4Cq7+Vb7sw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LzJNreMFIqUjefQa/dJ7X2LZLbzur6XE7vaJstDK96fHR+N00TyroN4WR/qT/knp1
	 dX5Y2jktbq9J1JfuGKABJKi12HGmdChwcx/LWZOp4DHA4UD0/i39b1R63MklIQEDLR
	 CqXf0AwpeF/g85GUFXq1KhDThimagSp/LDKH0n0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F9DF80423;
	Fri, 30 Apr 2021 05:59:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DEDF80423; Fri, 30 Apr 2021 05:59:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FFCDF80224
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 05:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FFCDF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Xwz5L2eW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eLXcISbW"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 70A4258098B;
 Thu, 29 Apr 2021 23:59:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Apr 2021 23:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bZ5Jq/1+ZthwK
 TvuIq15eH/CIV4N1NBK/xFYSqK20FA=; b=Xwz5L2eWhQfh9qWryMixZTGZUdZ/o
 AGvrmkXe4K4YnKORZBkoH7+V0ID0bBnqmGYsW+qDt125V2ffHDqyUsjYOnGNFgVe
 rljCEEgfDZdv2w1JxG8IC9Pyv6gV7zydAN9EpwwagqpwK1NWEU2PpyvJxvtPhpyu
 MKmi/RW6ARObfgn/guPWgfh3BYOw+8X45s0vzVECdBfwxXtZ/7cs81p0zYjT2w8q
 JQh10HhthUdcxdU4JND7TzsRcUvJJwfvtpABUQTG1mtB0ws2cQN9OiS7zD97vQjs
 kYwmTvoKkCCrW/hlJOA1wYCkLmZi9a5j71qMNn+LEpHWfjKDKXCO6o8JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bZ5Jq/1+ZthwKTvuIq15eH/CIV4N1NBK/xFYSqK20FA=; b=eLXcISbW
 lqCxdLxiK35V7QEUswLanJaWpAts4+9v+C9YhiWuVa6K+6f0h3QEMQQXXD2CUuka
 qupXy9+9naEkHfAM61ib6Bzj9c8gR84FXEjoX2VMvsYq3uLgZMfIThPMf95f7786
 HJFn3bwtwtq7EP3saeyqFVn4x2b6R0zjCtQ0A3ZmGdNyy/OQKchdn4VXeE3RArhX
 WBVcRIAZa0bSIFbd14l2WXjXcSHtXZYZ1ONarTYSVuVOYUIYf27eYuhpaMzYdN4q
 4dnxu76YaKS5QLsr92EgGDuEDfIxAUA3XR+Hoa6/1j10P8E88mm9c9WGpLeVRK3z
 TgazJ3g/4CEtAw==
X-ME-Sender: <xms:ioCLYBtDIL-CzTkiCnXpubSfs9V5wVgPo2rp-nFz-zl_a94y9l90tA>
 <xme:ioCLYKfw4Ovz3sJ8P-iGg5wEtwI2flECUQX7-Iw9VnX0UiuBXq6zQNrna8x04Mw8F
 wEw8IhuiHOk4Nz0-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:ioCLYEzZUCreVqubBWe-m2CPEX39QTJQPqOJhkB_qTLYXD8uqNeVfA>
 <xmx:ioCLYIM5miYotec4ZLSG3O6obBHYQS3LFajdOXZ7VA9A7wIsv_4aKg>
 <xmx:ioCLYB_zXdqpP4LK9VFXPL0CL8R0OYgAR_KpV2XvSlZtDO_sPrOyzg>
 <xmx:i4CLYAbBDE5SiXHTqYUCRWhVeYLeripbCiuChjUL5AX-qnIJndKGag>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 23:59:06 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 6/7] arm64: dts: allwinner: pinephone: Add support for
 Bluetooth audio
Date: Thu, 29 Apr 2021 22:58:58 -0500
Message-Id: <20210430035859.3487-7-samuel@sholland.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430035859.3487-1-samuel@sholland.org>
References: <20210430035859.3487-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
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

The PinePhone has a Bluetooth chip with its PCM interface connected to
AIF3. Add the DAI link so headeset audio can be routed in hardware.

Even though the link is 16 bit PCM, configuring the link a 32-bit slot
is required for compatibility with AIF2, which also uses a 32-bit slot,
and which shares clock dividers with AIF3. Using equal clock frequencies
allows the modem and headset to be used at the same time.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 9f69d489a81d..51cbfdc12936 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -25,6 +25,11 @@ backlight: backlight {
 		/* Backlight configuration differs per PinePhone revision. */
 	};
 
+	bt_sco_codec: bt-sco-codec {
+		#sound-dai-cells = <1>;
+		compatible = "linux,bt-sco";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -91,6 +96,8 @@ vibrator {
 };
 
 &codec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&aif3_pins>;
 	status = "okay";
 };
 
@@ -447,6 +454,23 @@ &sound {
 			"MIC1", "Internal Microphone",
 			"Headset Microphone", "HBIAS",
 			"MIC2", "Headset Microphone";
+
+	simple-audio-card,dai-link@2 {
+		format = "dsp_a";
+		frame-master = <&link2_codec>;
+		bitclock-master = <&link2_codec>;
+		bitclock-inversion;
+
+		link2_cpu: cpu {
+			sound-dai = <&bt_sco_codec 0>;
+		};
+
+		link2_codec: codec {
+			sound-dai = <&codec 2>;
+			dai-tdm-slot-num = <1>;
+			dai-tdm-slot-width = <32>;
+		};
+	};
 };
 
 &uart0 {
-- 
2.26.3

