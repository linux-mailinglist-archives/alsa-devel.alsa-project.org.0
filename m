Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D10392A8E3F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 05:19:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7413816A0;
	Fri,  6 Nov 2020 05:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7413816A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604636385;
	bh=YUiQBZ439eznnInI3TPpb9RZfcUW4CLmseLP/WeurPM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t6lsmyrdM7QYAAxYlIVogMxUehVQ8P6ckPIsO5y/+j73JhtQ56WcysobKQLqisomB
	 5JXip0txwsL9Rnr+kU8C9J3z73JbYXvKyz53hoMUlX7iRbNp9dC3Fqkf+x32k7Ulr+
	 2c3xLWmEpNkXNuAWlx4Vq2Nphfj8HfMpp7OGUvSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BA06F804FF;
	Fri,  6 Nov 2020 05:15:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C551F80256; Fri,  6 Nov 2020 05:15:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2DC1F80256
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 05:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2DC1F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="X5DpYmVA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IXc+T9of"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E583580550;
 Thu,  5 Nov 2020 23:15:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 05 Nov 2020 23:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ECNH1N3X+tK1E
 zurzCRoTQKYBerkPVc0kdRDCQ8PRWo=; b=X5DpYmVA/yyQxcvEx4hYEi700qy0y
 U2Nu3bE7EESqvyFkCLoGCflWR50wid9QwdcuMb1y1qP19ImeP7PYhvojODGtvbc0
 9HTHcKW8s9NGNmtnchl0Opibo1ONFhyjcha5qWWOuny82lMb38Ukhmz08oDGZnsj
 aUQ0zyz9IiftmD1xEv7/E1UykwD9tPd5XEaawCuN+Q3VLU2KyyZj15MnRmpCbTJ7
 mxkwew9lCjwZwmVbGVo5yXyqesi1zE/A8cQRv/AdT9tleNy3J8qF5fd4fHMtzW2E
 EIIf/SmatOyDEuHR9M+I4cJ7or8Df5n722F4NXpBRcLsnoWe2eN6DfeZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ECNH1N3X+tK1EzurzCRoTQKYBerkPVc0kdRDCQ8PRWo=; b=IXc+T9of
 KUa9EQ7L8EvlETwjCYm698mLQlnXSt+VaKBe+Ry5iXOfohW6Qdu48RXypoiSqOZd
 MxpnDk96pjMOEva/sHuhCoP06+JdFq4eZThmCjX6whY+4zc6DluLD4yNA3+sGCet
 puqkpNgJSSEw7QPAWBs/HQ7eX3qocXEQncCqQSJ8PwrT1p0wZ0ZpIpSF7AiuJVT9
 4grqYaQLSO1bG5BA8p6TAJsZ4FntUveF0utw7DF7umcrKY3qLKcSBVls6aE+LGo/
 GYT0HrIOfAuFeQrjobmMviPWGAd+gR2yOK8PZNaUw9WCo09tRfGFbRW46o2YGeaI
 Q/PbbSbEV/0txQ==
X-ME-Sender: <xms:1c2kXyzBtoUW2GNGUL28PO88opfA0oyawo8OfYxQQIinyePpHUFCAA>
 <xme:1c2kX-Tj46TbsMQw3awPQ4o-qBd1soW-zWuKizG_Lo9JHWkdQQEutsZtQ26-jfOzs
 9r3K_y04QdtTS2E6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtkedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:1c2kX0U4V7n_XqKNoSLff0PMPrPaaU5QB7J4AZvCg-wj_V3xzW8QkQ>
 <xmx:1c2kX4hfMEF9p7ixVuF_zuP8PM6o9LxjMWXBCeKCUTlsNlcNu_BN2A>
 <xmx:1c2kX0ChEHXU_dFVnnNqlst8tnJPX520XvXhFC89prK1edVulVJxEg>
 <xmx:1s2kX44D4nveAPacTRjRyAcJES-SzRRie2FZrC0cKm-tPNIrX3WC3g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25CCB3060062;
 Thu,  5 Nov 2020 23:15:17 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 7/7] arm64: dts: allwinner: pinephone: Set audio card name
Date: Thu,  5 Nov 2020 22:15:13 -0600
Message-Id: <20201106041513.38481-8-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201106041513.38481-1-samuel@sholland.org>
References: <20201106041513.38481-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, phone-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Add the "PinePhone" name to the sound card: this will make
upstreaming an ALSA UCM config easier as we can use a unique name.

It also avoids an issue where the default card name is truncated.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
[Samuel: Split out change, updated commit message]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 6125910d29db..fca6310df6c3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -386,6 +386,7 @@ &reg_rtc_ldo {
 
 &sound {
 	status = "okay";
+	simple-audio-card,name = "PinePhone";
 	simple-audio-card,aux-devs = <&codec_analog>, <&speaker_amp>;
 	simple-audio-card,widgets = "Microphone", "Headset Microphone",
 				    "Microphone", "Internal Microphone",
-- 
2.26.2

