Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED236F4BB
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 06:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A36E41692;
	Fri, 30 Apr 2021 06:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A36E41692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619755331;
	bh=xMomNsg+8OAGUeAWTzCkSKx3+2ZwbIRqqq5oxuupSYI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nrT7HFbWbExK5CJWW3BHbpRtHjBDMQzkrt5TEW/I+IzB2exsy15Iom3tgnp2G0Ycc
	 35SsOkBlnyBBCuLhf09/b6o+xt2G9IVkE1dz0W7JW98KabeSr2/ECzK9+ZqVkTqafa
	 XOg07hq3b7riGrKOt5PEqUSkSyDioeKPK8EUumfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B093AF8049C;
	Fri, 30 Apr 2021 05:59:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70D1CF80424; Fri, 30 Apr 2021 05:59:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 312D3F8016C
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 05:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 312D3F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="mwhWdCoC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aUa78juR"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2B29C58098D;
 Thu, 29 Apr 2021 23:59:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 29 Apr 2021 23:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YEbs+BEOpZZ9t
 yyMXl71FJjFgn9WB+c04wCg6ag0Rvw=; b=mwhWdCoCl3MndYHXi27nvSPk0dLwm
 MdUmLmtyQbwiOFlcZthor1CEDhVe+DprZVFETGUGYgMQZ9G2MV3lhtM2ALR55q7y
 Mx/fWiunekWkvrraCHYwq3vmBnVp30TeVncN66auczu1276vaxq3Eyf+YFTb7Sy7
 2FkwTXYJyLvXjj7i00Y0OXn913WYmFfRBHmlsvZKPgJIRO606CaXZw2AGBmb3CSi
 MRhOIhhgrvDSd34PNeyCgMiIFnSrfCDe2dREEOMVv357srd/uhw4EpMD07TgGvuK
 Uqft9pJd4DmZTRrdJv2IjgS2oTtRBG6b3bSTeiBKPQfidPcX7FtuC/8jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YEbs+BEOpZZ9tyyMXl71FJjFgn9WB+c04wCg6ag0Rvw=; b=aUa78juR
 a4PEBRA0HCTJrO3VnQ4hFrPy8kmc1qzWgZvBgSrO5eEKxNchd3q8btzJP8NFqFI7
 0Ge3YQ2P6pxt1qabFb+cM/2tbFcyLUgAINKC7strtI6SIFGN2m5e6as/SsQ2AFvZ
 ammTvqKWSWd268ToStlE9FojagaBwQdeLG7ong5B2g2J48S+JCBFIZ1RB7zeVMBX
 VtVIF6L8U4GvcZtb4VBrmYi+CcFXFPnUi1V8FXTU6Fn/xXUNdW5IRZbrYVj6K5g7
 FEWaKnUaTR9aZstlwhm4ixwfAmwtqLsg+b4x8u8MljtNeqeVU/kSCz4DQfwBt5P0
 6sXsnL0TdJj53w==
X-ME-Sender: <xms:iICLYFC4DGRDR4OfYPnNE9eCsm93YVU9WO0lOI8zSAKCOuxCqLvdQQ>
 <xme:iICLYDh2uJh33Xzj28H106iK9ivFdQcNSA8hGcFlksa8-NlA4wJwOsVfaN59XLW-7
 EvBC9Kc0sLskq30Dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:iICLYAn-wEMfa2-65sN4U6Lly0q17Ji9_S5fqyJFkYuROyQK2I9b2w>
 <xmx:iICLYPyrl4DxNC_9jf73jkoGliK6IRrQGcafdKFzOiK1Su9wStArgw>
 <xmx:iICLYKRmrFUffT2y3wn6ZMayIJ5tg1OpOAA8kd5vuM9_3YkIiPIP0A>
 <xmx:iICLYL_DH2GKYt9HLxSavJw9uDA0DtNP5H9hhM6gbxCVSRvEXqkjIQ>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 23:59:03 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/7] ARM: dts: sun8i-a33: Allow using multiple codec DAIs
Date: Thu, 29 Apr 2021 22:58:54 -0500
Message-Id: <20210430035859.3487-3-samuel@sholland.org>
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

Increase #sound-dai-cells on the digital codec to allow using the other
DAIs provided by the codec for AIF2 and AIF3.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm/boot/dts/sun8i-a33.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 7344c37107c6..2beddbb3c518 100644
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
2.26.3

