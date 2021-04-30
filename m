Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347C36F4BD
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 06:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE8416AE;
	Fri, 30 Apr 2021 06:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE8416AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619755373;
	bh=YJmUKp1y5MOSZgUou1lQJatVduAkx6bfD+iWjii90E0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWmnkO7vIMLTpaG2P8EfcoD8WNDeLfBcYyF1IMlDtsWdrPZfar6wFVPxM7ncrRTrJ
	 Z/mxfc+IC8PNtsAB6awBwhH7x+hc9Pe74lq57f7Un/cZ955PxvSfRU++o4b/yFYUbc
	 JkyV36li2TavQJgO2N+MEJ0zZKKoroXXKgKxGek0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79068F804AE;
	Fri, 30 Apr 2021 05:59:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E2E4F80171; Fri, 30 Apr 2021 05:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5705DF80218
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 05:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5705DF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="a5VCO5oH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="a3t3wL6L"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 809F6580991;
 Thu, 29 Apr 2021 23:59:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 29 Apr 2021 23:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pw3UViUjMVgmZ
 bCu3Ja0rB/pgHOsIsfcqpXmNDlOmSI=; b=a5VCO5oHhRMhi9ChsSAySrkudBfSd
 0eOPTSTDwyEILVhDRxNt9KwGQI9bzarLWMiU2LJGzUBHuUmJGQ2JBv7MXmQpNx15
 TnGflFX4XTBeQOWSXsuJvQbkddwCW98iveBdn1bcCsJJfia9zXkbD0SXSs4MBly1
 2YAXyYiphU6nn4it7+ZIbf5F+YurYl+KKpToeVjhtH8YFRFkB8l1Oa44pE/K2lOj
 sWXPRIYr5PnaRn8MBcijTblGiCv85WFZhBpsGKjg4MqDmk8SgfxlyW9C5Dh6o8JL
 KzxLfYK3T2KzO5rfnwnr+TAp1U+8TzOK90eeHbLP70H06g6GUdhf7jKOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pw3UViUjMVgmZbCu3Ja0rB/pgHOsIsfcqpXmNDlOmSI=; b=a3t3wL6L
 TSTdfVhubUu+hKlDxFV6KYcsDtsalT2NJOpsOvwGiTDHvDzZNXlww1gXFP2AZ3Pb
 SNEOg2ZwOXek1JkcqMYKdk4tZmahQYNrja8uw8Jj13Pg+8h8UkNt67LhRHjNOGng
 5uxN1cX2GkSsGpEOSilhZPf23TLD4lDvbFEjkVRNgGB/j/ipVrrd5iS/3ntekM8x
 V27x8tl41lOd2HqJjnYIb1VE/F64ng/mdUnhDNIAot/mf7Dkn2BNb/ymWma68zeh
 131aeEXxiyugWYeLdeGoo67wRfcu8i6BUpJKmbOo60XpjnLwTz/kyjp6683HUEmm
 BQrkkoKZCf2bxg==
X-ME-Sender: <xms:iYCLYHayzEGFDqL4O3hjhxbCXN8q6czJK6eLIhTffnjo6isyAeyFHg>
 <xme:iYCLYGYcPA1ek0OCP0xDDHZXcu09z4cyzFPUTjWCAGVSdu0wEQSvwuZPsWib5lRyu
 1gO94nf67yLiirZMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:iYCLYJ8ThD3C2MteHxqF8Jz3aU4Cg7bOsawyOJ5TDB9Dxo0V3Y2Gmw>
 <xmx:iYCLYNqgVBioghOvaVmPYXTmIQ5m4BsqWQ9ipa0xcRwzkaBHmI3M3A>
 <xmx:iYCLYCodyPUIXMhOWshNPe0DQn8Nk4mpxATKfJFRoF-OLUQLzZi_OA>
 <xmx:iYCLYB2sm5ZMAo3FIhIHY5XrdXGMLYztKyR0s2F5AH0ZrTaCywqSAw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 23:59:04 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 4/7] arm64: dts: allwinner: a64: Add pinmux nodes for
 AIF2/AIF3
Date: Thu, 29 Apr 2021 22:58:56 -0500
Message-Id: <20210430035859.3487-5-samuel@sholland.org>
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

Now that the sun8i-codec driver supports AIF2 and AIF3, boards can use
them in DAI links. Add the necessary pinmux nodes.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 3061031780de..a583355a3128 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -658,6 +658,18 @@ pio: pinctrl@1c20800 {
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
2.26.3

