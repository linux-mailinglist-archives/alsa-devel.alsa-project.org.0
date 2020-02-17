Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92621160B5E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:03:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399B116DC;
	Mon, 17 Feb 2020 08:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399B116DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581923005;
	bh=2p1z52Fkjp0nFliS2dEWRVTmYCOSmHsPwj3BFtvqAjo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JP55ZXviPQXRGhVIuwK+xqqKIzcUQCZrjrdKNHkEInCPxtzqPGAb3OYfFwlbnQnvt
	 43MNS11+v12BNkdoB2q80Y8lKy8oLvMhjVo6gd9NKcZBIlqgimbOLNbmjuguaX4ggm
	 P/x34sUUyV9uQ3NSDFsXC1z2QJHAbLFG9aCwCpRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B06E5F803D6;
	Mon, 17 Feb 2020 07:44:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B3F3F802C4; Mon, 17 Feb 2020 07:43:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17362F802D2
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17362F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="KkPIDrxN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AwV6073b"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 26FD9586D;
 Mon, 17 Feb 2020 01:43:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=WMkmsxGWAZAP4
 sWxF/e88HgunxucfP1/cWpmUNmh5DM=; b=KkPIDrxNZh4osC8sxcoD0YDsGt3oq
 /RjE7PpItQWjbLhHMTu3857HawDyzwt5XuMovwHEiO1nTn3Hgd2RvdBkU/3ZNLUw
 znz4TyERmOdQDs74YhXWDFh8B2Lbm8Q7O51flkV+2A5AyL859V/FrmA6E630et3J
 c/2SiHjfTAskw04WkQWlcnpOrgqLYsbjV9ItPlsq2nZeWksKtRBxXCnp7oder1AZ
 xbElMkJ7GJKzBBldygXlyyHcD9W6Bifl7eSYuVErBV+HU9aR9m0ssKXbvU0bzNUe
 LTm00tC596xrRDYlQtET1c5kOsZu76dlLIq2q9iy/C2TWmC0oG8ZrGQ3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=WMkmsxGWAZAP4sWxF/e88HgunxucfP1/cWpmUNmh5DM=; b=AwV6073b
 vssgZIpuBnh8D8Vau4Kf6hmBmrQvGuk4vlQMRT6DKP4+TscL61EmqX29S1+c3rL9
 ALjTDE/6ke0UJakfYmk47quOtX5QLrpLigt+tt/anFm1dnotyRIj6N+Jz6SmrfLB
 8U3rdPZl3zQk+E+rcs1svZOvSrO/tcu0H9fgTLA/WV7NPdNTMpdyepVqGoqG//nz
 AbWSHaEkpz66Iia0Gz5mIyRPcJqg0ev7zaJDtGxhmzqZmR6PNBzXF00OpBiZN/Oe
 qoqPbT8c/PtLr4fZJrzK4w8cC3UOhqNRWu6PWhufTaFDvFvX46rukNiCLzSGQstS
 hhxejdzcK/sjSA==
X-ME-Sender: <xms:ADZKXo5OmVddj7BEv-6VAgmFPFzSLxOs7GAwM6SVI483Pm2ukR6Ovg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedvjeenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:ADZKXuz5Epqh8939N10zNHgP3h0R3QNNnLKnuwG4__k5Jn7OOaq2dQ>
 <xmx:ADZKXlCCWgxpotqBH2iSdRaes-VwQP3HjkCYiC3zPKmesX9yk9_CwA>
 <xmx:ADZKXvMrACIXbY9ZCR1dTSoy5XJImO1Ki0wlkWyHQXLJUPeaLRU7rw>
 <xmx:ADZKXrHrJOSeRSxGMfAZAK40icIVBotqIHPJ_ya6FZqPN0zwPVh2fw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 660FB3280059;
 Mon, 17 Feb 2020 01:43:11 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:50 -0600
Message-Id: <20200217064250.15516-35-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
Subject: [alsa-devel] [RFC PATCH 34/34] arm64: dts: allwinner: a64: Add
	pinmux for AIF2/AIF3
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

Now that the codec driver supports AIF2 and AIF3,
boards can use them in DAI links.

Add the pinmux nodes.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 78353893c3b9..ee09a2dd6f69 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -605,6 +605,18 @@ pio: pinctrl@1c20800 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			aif2_pins: aif2-pins {
+				pins = "PB4", "PB5", "PB6", "PB7";
+				function = "aif2";
+			};
+
+			/omit-if-no-ref/
+			aif3_pins: aif3-pins {
+				pins = "PG10", "PG11", "PG12", "PG13";
+				function = "aif3";
+			};
+
 			csi_pins: csi-pins {
 				pins = "PE0", "PE2", "PE3", "PE4", "PE5", "PE6",
 				       "PE7", "PE8", "PE9", "PE10", "PE11";
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
