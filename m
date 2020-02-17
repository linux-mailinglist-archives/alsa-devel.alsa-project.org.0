Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC5160B60
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:04:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E19116C9;
	Mon, 17 Feb 2020 08:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E19116C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581923045;
	bh=wys8E+ycObcM4Jz8Sj3NUWDGanAujRxzwmcmpBBMIcI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dR5O3PfjCFVIVQhZQ9BhBIzHhFRX1Mb6VGLPAiNJz4DktZ2D2xTpV9HTNveZUVOwO
	 Y8yFI7A2JbTUdKPEGu8NZbjzCzxekRlFtbrR9hhRDDz+JTbtauYBxPpl2hVEWcgqau
	 GC9jEsvEsHn2pHcMofDRikJUJsf5C5kEUzqIxsFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15102F803F5;
	Mon, 17 Feb 2020 07:44:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49DF2F802C4; Mon, 17 Feb 2020 07:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA63FF802C3
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA63FF802C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="o5RHFFEc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lv+tb6Pw"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E7C0157AF;
 Mon, 17 Feb 2020 01:43:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=PQjuU/7i+IoL5
 dNdicbT4GMUQyfOGIb+JuDpBZY3tgY=; b=o5RHFFEcGx1gcJVKBXvtEKwBAEgXx
 yjWM+T7B2xxJ8B7KlLbh9WvXHiCj4Vrgh+Agw37Ta9ffLl+jll2d52c3FNh4HKCQ
 1X6y/VX9JNCJcq90HOgED4pzNs+0liSxZVdoVIuCb4xXiTG4rtkwpCdFBLfRyCjT
 PUWNdrq0jYeiwBqrQzRUnGm0ioACzQSBpiq8tYVXmT9jzM86zhUYaTeuZbokiVqN
 F7T00fGur5Ovc0bLF1CEHNd06jUKNj1UNHS/YqyUsjmCZsAJuqeJHV3Bnwuehefj
 9ItOyIvV+FG1TUEVLE4oSLfBu/IKxgkjxFySPkYBslZwpx+3crzG847dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=PQjuU/7i+IoL5dNdicbT4GMUQyfOGIb+JuDpBZY3tgY=; b=lv+tb6Pw
 0t0VCpmbz4qCBjEuCOmDhPLS3T+7gsXV9eaTreClhGWoXHtiiJRlGdQbIlg6eRth
 fitqIL3oJzbUZ11WS8zZd+TFKY/Fdob1fm/I03d7DtgiLXPy6heZ/NqpNZKd85ef
 u0ITT0pOL/94WLP+/sNvG6cKXBPptd96ch6c60Vf7jbaHCi2KCmAN3WVK2M+4MkF
 6wMh8J2nqLY4ViV7WOteGg2HlvJ9hglRDmEGqVMDpb2tObVoGHZihmFIaPFCDaEU
 WBeHcCC3y5kSLhGgPO3YqAq5/VWCT6M1vv24CZik7XRsqBQfgJmRyvMWPFPR9nal
 pPNT4nIhTCBqxQ==
X-ME-Sender: <xms:_jVKXs9UyIrfMVHxcl5IO8K-CUZQ7p4px4zloF21P9ajCkIXWmtCqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedvjeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:_jVKXnE8xKc2_Yb_Zh4NIrHdYQmg5sXyjz_RhsPan5g5EyM3NnkKdw>
 <xmx:_jVKXrRDmmz4gUnhLrwzMdp3GZ7RYcf3P9lsYFHRImVHZNEGkYB2lA>
 <xmx:_jVKXvk2M-QZT4c50aNMGDRRZBoH1OQG0yRQcuzDZeoHd4-PgJZlSg>
 <xmx:_jVKXsvBeuXTX8l3BFNPnGiML5GG4lXmzUX6hFTyEVC16XjhXVrdCw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 337253280062;
 Mon, 17 Feb 2020 01:43:10 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:48 -0600
Message-Id: <20200217064250.15516-33-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 32/34] arm64: dts: allwinner: a64: Allow
	using multiple codec DAIs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The generic ASoC OF code supports a sound-dai-cells value of 0 or 1 with
no impact to the driver. Bump sound-dai-cells to 1 to allow using the
secondary DAIs in the codec.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 5b688687a2b2..a7470f2ab975 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -176,7 +176,7 @@ cpudai: simple-audio-card,cpu {
 		};
 
 		link_codec: simple-audio-card,codec {
-			sound-dai = <&codec>;
+			sound-dai = <&codec 0>;
 		};
 	};
 
@@ -801,7 +801,7 @@ dai: dai@1c22c00 {
 		};
 
 		codec: codec@1c22e00 {
-			#sound-dai-cells = <0>;
+			#sound-dai-cells = <1>;
 			compatible = "allwinner,sun50i-a64-codec";
 			reg = <0x01c22e00 0x600>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
