Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBAC2A8E36
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 05:17:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF6A1694;
	Fri,  6 Nov 2020 05:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF6A1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604636274;
	bh=4vDUTQqTaRR7hqtpCZ/x1vcxmQpo+uOgGl7Za6wnubA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NOY0hvZ24NhfvUDtZwOKwI+sOk4Sb65WGBtRM69FjLZOm1Yc+YWLdTTbMV1rSo/W1
	 YHwB4CgzFhGM1aOjurDdo3dmMFeoXTo8+ZJogu+AQUXekghsz+6+h1NIZUPVufbGdL
	 QxLLBdxwyXUN9LGx6RFAg6MjAQuCbw1fQOym1P70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E4BF804C3;
	Fri,  6 Nov 2020 05:15:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42CDBF80276; Fri,  6 Nov 2020 05:15:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF55F80232
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 05:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF55F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="fsD9q8Pn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iyp+K1zT"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63BA858054C;
 Thu,  5 Nov 2020 23:15:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 05 Nov 2020 23:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=O2ch6PxeaPKIY
 rDAylcvcJjLc0v52L8vH5z7zkCbnsg=; b=fsD9q8Pn07uGpNuUr+WVZh4abxCea
 1lSnBcoqWbA11xAc/Bb8eRb0N/cnZziUFMqolwc15OGT/yNaRHH7KKZpoUyHN200
 IF09nRfdgntRfjWkEizix78Fy1o1U0jEyIsbsiShMakaOFXfsQUQsYEa4ZYwdlJo
 K4yici/JrFIz72o1EYniityHLgt9kJIQOkk96CLlX+DfgY3aNjqq06pDuzOCaIQx
 G/Ypv4+Cy+X9A+7f1d1j3bqewzRvGDbHAf24pibwZLgGAY+AT2d6e+kFOgHMMhv+
 UfmTpSMpkIsgrEOV+J80XbEWHbJYW9p8OAvQ23iC3f3SibVVxR7Pot5Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=O2ch6PxeaPKIYrDAylcvcJjLc0v52L8vH5z7zkCbnsg=; b=iyp+K1zT
 PQ72Tu5onYkq2cxrJTmVOJgRbxTt9CzR+BRfb9hx61nf5O/Mwr9O0WvCY3YLfqAF
 f4PYYBiuxVfxVHWPkBOb0hLKm6JqEeJ+9z9GZ6Zu7sQpyd+tvro0WiFP2sC8xHQM
 XnBlX1g8FiqwebttDt71Gn85CBSTufJBsd3SOM+X6CFf1iPTk0Do4DeT1tdAuQnB
 Td8ISHTNQ2fApRXp9aoWyiyTfToF7Avz/a8sN1n+Ac+X/AruxFktpVKAmQhKL1H1
 FUaKgNpt7+JakdbYREeLnKCpH1DaLGoAs0sqgUmFAtMezjzk3EVrvM6nD+0ozfC7
 pVUmSzTmgKGmhg==
X-ME-Sender: <xms:082kXxcEditjmRih2AYfXris7xDAddEszpiANu1C_bmvfYBP1RSulQ>
 <xme:082kX_ODFojCE3tQKc7-Stc6cjLWKd04qWjM0dKEeA22RFPBFH2iUVJS2HhkbRjmu
 DRObvb7ie2s_WHduQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtkedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:082kX6jYhoGUMgVRBn88b3CPiYuR5wkjsN5zk2NR7SU9AqTZN3q6Hw>
 <xmx:082kX6-b1PxgJdwhjGTcImygNsMIPOan1kpgeA3IE8sOcbgMNozlGw>
 <xmx:082kX9tH_S2fB-9b6Un7Tem3KJOdXbG0mTaHinX3G0f9JlTZPtk8mg>
 <xmx:082kXzIGlCO4k-pUkH4BqY_l9dPisFMuC_L4kFx5GbM2gn1F3fZ-gA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CD1A3060057;
 Thu,  5 Nov 2020 23:15:14 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/7] ARM: dts: sun8i-a33: Allow using multiple codec DAIs
Date: Thu,  5 Nov 2020 22:15:08 -0600
Message-Id: <20201106041513.38481-3-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201106041513.38481-1-samuel@sholland.org>
References: <20201106041513.38481-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Increase #sound-dai-cells on the digital codec to allow using the other
DAIs provided by the codec for AIF2 and AIF3.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm/boot/dts/sun8i-a33.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index c458f5fb124f..0b38f9f35074 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -198,7 +198,7 @@ simple-audio-card,cpu {
 		};
 
 		link_codec: simple-audio-card,codec {
-			sound-dai = <&codec>;
+			sound-dai = <&codec 0>;
 		};
 	};
 
@@ -238,7 +238,7 @@ dai: dai@1c22c00 {
 		};
 
 		codec: codec@1c22e00 {
-			#sound-dai-cells = <0>;
+			#sound-dai-cells = <1>;
 			compatible = "allwinner,sun8i-a33-codec";
 			reg = <0x01c22e00 0x400>;
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.2

