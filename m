Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6A736F4BC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 06:02:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A191697;
	Fri, 30 Apr 2021 06:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A191697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619755343;
	bh=qHeHYuQaEKV6b9/7gYDj1hBPgMZnnRmSCgweDMnxOfc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RklbqYsuojpWqRTOxciG91Hl4qKYmorz4+dOarGm82uYGgsx02aoI4b9caxLDTvO5
	 6gaudjg+uZK3MRlLpJYgDmqNUkSY6xv4JEEvSfhCTQyWdNU7UA53dZRnJhbJrVrvjb
	 B9Y6Hb2Ip9bTLcH7oKvmM3GdnfeIMWVeKxe+XMLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BDE4F804AC;
	Fri, 30 Apr 2021 05:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D39F80423; Fri, 30 Apr 2021 05:59:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27334F80171
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 05:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27334F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="iN9a7vIL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sOXQAydO"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4BD66580992;
 Thu, 29 Apr 2021 23:59:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 29 Apr 2021 23:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Dvnv9iv8lzVpm
 qWT03DWw0xg+FDgyNq03CXrBpobr4A=; b=iN9a7vILYCv2Fvivk8mLoQyWk/o/2
 Khlb5w1GtcwdTXsyAHxg6uAuyzm8W0xDbduM/SVD2SbmP7Buq5qJNP6gfCVrz8Oz
 5vR6nknDeSwroH0ytq1IgDLgyCk2o/N9JR4NHkhP9N1JtwYhfXpQYt9y0lav9ykh
 AYkzo3FLdD5TKSD6cal7U1Jiw3sotuCp+VQzwPjQ+PMibZln5Fw01lvVtjgtYGTg
 UIzpTyjWa9AHmLL0sRqlu88y38Ep6L7bLy6KcNdA7LhfNKrN0J2sGuHyJ0+MriBo
 1kwF3DD+z8oInnRsAh2yAWNVYjH7sjqQBSx9+b/DFK3+RzAL90U9YzgVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Dvnv9iv8lzVpmqWT03DWw0xg+FDgyNq03CXrBpobr4A=; b=sOXQAydO
 qXR9AA28GrFCHff/YKFq2XmgLTvFzaPntlAHAjWnW2v3eGobJZNwzU84c0Xmafn9
 I5/a5oZ3aiG7/Pn6CMgYEj2VmKxo9+EDj8tkpIVjk/cfGnrPYryGGVQVH0YiekdO
 nZ8VM7wpjOvoQGGdZS46gZus3LVWTAoed/U+O3TOLlSQh4eSTf0FOGHzVh1tYFHn
 LJLGSh/qh2HWKTsAlYrBpezteWqog2NZcLNLhkvmbmfMr5TjWqz5BaWBwesrQQfA
 iuH9LCvE5MK3FXX9R8ncxGBN9iYgAgiQDLBVNp0PMNLj98hhKXPVJ+koZYhKDeec
 Z6UoZ64X7YEWMg==
X-ME-Sender: <xms:ioCLYIflwHzWijrSrn93dil_CaRz_nvSKYSdoAXe8D6ELi2i4Qj1cA>
 <xme:ioCLYKMgw14CUp3AOGTUy_R9hE4jaA1kVPP02xzkiN2OBYjcVlTz_qbELpFdvbnAV
 fCWS79U8c6OEYwirA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:ioCLYJivCxDwNpP8ZL6MZ1PMQSsu3LNjdmYmmXC0K2_3EGlR9CXEaw>
 <xmx:ioCLYN-_v0nubECS9P8tzMB9Wiou-95U0gHIIz8K_hnKQnR3n3H70A>
 <xmx:ioCLYEvQ3ixC-Y8qhn6kH50ycHmTxwkNpMlyQN5FDc9HfPIipu96Jg>
 <xmx:ioCLYGKWUOfSBd0zppeZwx6ujj3Ex9O1l9VN60lWot15Qa2hlWsReQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 23:59:05 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 5/7] arm64: dts: allwinner: a64: Allow multiple DAI links
Date: Thu, 29 Apr 2021 22:58:57 -0500
Message-Id: <20210430035859.3487-6-samuel@sholland.org>
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

simple-audio-card supports either a single DAI link at the top level, or
subnodes with one or more DAI links. To use the secondary AIFs on the
codec, we need to add additional DAI links to the same sound card, so we
need to use the other binding.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index a583355a3128..5734b4825f64 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -131,12 +131,10 @@ psci {
 	};
 
 	sound: sound {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "sun50i-a64-audio";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&cpudai>;
-		simple-audio-card,bitclock-master = <&cpudai>;
-		simple-audio-card,mclk-fs = <128>;
 		simple-audio-card,aux-devs = <&codec_analog>;
 		simple-audio-card,routing =
 				"Left DAC", "DACL",
@@ -145,12 +143,19 @@ sound: sound {
 				"ADCR", "Right ADC";
 		status = "disabled";
 
-		cpudai: simple-audio-card,cpu {
-			sound-dai = <&dai>;
-		};
+		simple-audio-card,dai-link@0 {
+			format = "i2s";
+			frame-master = <&link0_cpu>;
+			bitclock-master = <&link0_cpu>;
+			mclk-fs = <128>;
 
-		link_codec: simple-audio-card,codec {
-			sound-dai = <&codec 0>;
+			link0_cpu: cpu {
+				sound-dai = <&dai>;
+			};
+
+			link0_codec: codec {
+				sound-dai = <&codec 0>;
+			};
 		};
 	};
 
-- 
2.26.3

