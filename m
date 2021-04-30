Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A102736F4BF
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 06:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C27169C;
	Fri, 30 Apr 2021 06:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C27169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619755390;
	bh=VBuqNMNTD8H/yNwK+YKOoNifgMpUiV7TT9QRoP5Sb6I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZhcOFSDsqBH8GNpmg61l135ZiiNC6crqyBEyXzvH0QpLckLkKNFeyDg2Ko/l+lh9
	 PYGgc5dSXpFGTr7SLJjFHtecMydoyGez+mPRwGobvzKuivArQ9kVoGAEe3TcJ234vw
	 OiWISJK26xZed/Z0NsVr746Q4NFTl1YCjRQ6GD50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 933E3F804BD;
	Fri, 30 Apr 2021 05:59:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A5CDF80218; Fri, 30 Apr 2021 05:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6378F80165
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 05:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6378F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="VPwR4moS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hYSzl8kl"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D057A580990;
 Thu, 29 Apr 2021 23:59:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 29 Apr 2021 23:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RUx5Bh9JwrJMb
 9tpHuRajgEQACMYEpqxwh8iy6v4q6E=; b=VPwR4moS+55tLIU7rUu1eYMhHQUrB
 VhaXgIAPoivFrfefbVwS4G0BQhxWkNa/fHp9LHbdvkOxMFlWAWukS41SmkSiFgoR
 FiiltpafefMas09qEaOXfAvLcy9uwebDoHM1NkuDmsU5CNdW3eKCH7GSyiSVZe3v
 /gDZZPihoYDqs99gU3tMPfX43istLsOEj9MbAd6NKVZkptUxrwe1JxfTBl5QxcnD
 TWlyY3Sofs5IoMU5tGuhBwxxVomN1MGxdJeRSn/M1wE6lnriPUXbiIuGyqX3ZkKj
 oyvnmtyvi0FBYy1Vf3Em4oiIEagmtcrGvcVYSWr7yfd1gcysr0YysOmfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RUx5Bh9JwrJMb9tpHuRajgEQACMYEpqxwh8iy6v4q6E=; b=hYSzl8kl
 a28QWqUiWgt77I09KUIxuc9LpBbWHgRiW3ymSKVAWMJ0EI1WAjF1NEiZ+NaXd3Uf
 Yf0TC55Q4n+T7Kfcb7O5qlJGGItm4+LQm6pvjHSTLVfS4Rh7VB62/AASMHUedvnz
 i8yg1kU6xYrP1653b8OcP5n0sBE0PnNbk7goGzvsdEWZwgEA9Y/jBHTssmI+ShMS
 VBy87utB+E8uusIfMGCcwNxgBaIpys+KVjeezZiir2pe2rS78Zd8diB+PnvS66Vi
 REsUxgEiqNm0L4dPA0GMgd0q5hH1Kd06Mz8FX6upIBIRe3kwpw4cXcFURJxFP8Lc
 N52EyJZHCP5RrQ==
X-ME-Sender: <xms:iICLYAelwpJBf8NV0P0jwh7exVjcYUHLigm78NmENxmT5ROarrWWmg>
 <xme:iICLYCOqjtl6GVBocJBMo9aqPjQcrm65xpCrfQPZUjKJlFXw81LXENEWC6PBUXhJ2
 YO7LeShPiVxp38A0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:iICLYBg7PvjnSnjYP9cmlgTt1NvvsbNLZR05nkBOlp5eyaUJwDYY2g>
 <xmx:iICLYF8lmir8qwKk0ZMcEBD1sGyc11Gdlckk5Rr_tnYnyLBOCPYawA>
 <xmx:iICLYMsHDbORc5Aurjc8YMrGzAj2CWlZ3VamdS96C4Ook5huCaovTg>
 <xmx:iICLYOJbj7ExozQAMxPtosmlm6IJg-mWP4xWolJGOgTFt0rh_Z-xcA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 23:59:04 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/7] arm64: dts: allwinner: a64: Allow using multiple codec
 DAIs
Date: Thu, 29 Apr 2021 22:58:55 -0500
Message-Id: <20210430035859.3487-4-samuel@sholland.org>
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
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 57786fc120c3..3061031780de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -150,7 +150,7 @@ cpudai: simple-audio-card,cpu {
 		};
 
 		link_codec: simple-audio-card,codec {
-			sound-dai = <&codec>;
+			sound-dai = <&codec 0>;
 		};
 	};
 
@@ -878,7 +878,7 @@ dai: dai@1c22c00 {
 		};
 
 		codec: codec@1c22e00 {
-			#sound-dai-cells = <0>;
+			#sound-dai-cells = <1>;
 			compatible = "allwinner,sun50i-a64-codec",
 				     "allwinner,sun8i-a33-codec";
 			reg = <0x01c22e00 0x600>;
-- 
2.26.3

