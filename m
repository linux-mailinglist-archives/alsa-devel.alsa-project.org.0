Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E569B2B5
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 19:55:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D6EFC8;
	Fri, 17 Feb 2023 19:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D6EFC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676660116;
	bh=078NR60TIBwo53TIeqhq3CI9BaMfwjyJvN0FyeiT96U=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G3tNmKRoHZgVVXjPVYsW3C5xEawl1LNan3APkBTGFs8rV+w4mIgYyNurlWR4uPun+
	 oEjEYRUtDobOoRR0Mx9dxbGw3aA1ieAXsusI3cdWmRv74ev8xxfa6EXIFlYu4Kztkh
	 fw/YNrkoN9ObZpw6edT9ndobfR+g0D26cFMXyBwg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDC9BF80533;
	Fri, 17 Feb 2023 19:53:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 240EFF8052D; Fri, 17 Feb 2023 19:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67AD9F80171
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 19:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67AD9F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jBbUGhXu
Received: by mail-wr1-x42d.google.com with SMTP id a12so2025292wro.7
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 10:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuYdi9JDEfUk3bSVOxhib3+XS2kP3hKiS/trU9amA0Y=;
        b=jBbUGhXuPutU68xy8v1/tTsH0FNkiWcyXEw0HRthPl4z3nkGFqNw+kj5VJ7Wh9Q584
         CIu6EA9SF2weK+TuPLhmITSGD3rWzVwFmy7XYY3YGKls9yoDKsBPPLv/VFcFViTGQ/ig
         KCFgVY4rEeesYCejYw+zVbjhqijsiAohmzZeKk+1VKP9eXTPzaYvsHGH8y8XVbVikxrj
         GLED2JiK1fhLGqY2ujnZyPnMkH+kzM7Bnt6RuCmxKBM/Mg9s3l3yqKcFB9Hga2l5ICR1
         P+T8w0OicRCBtXvTBGvWuGpzL0W7dpN5artCkgvfoQD2s11ogxjcxPnazs4at/hr60V9
         dCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuYdi9JDEfUk3bSVOxhib3+XS2kP3hKiS/trU9amA0Y=;
        b=LmOm3pbhEkXETfNwfdOvBCJrG+4SXzyU0tUj9FKmdimglDpOyrRlggB8ZeUDvj84hh
         WXesOzLxm6Nngp86naguFvZVheWpRwOk5mGOr04yY3HEPkLfD8m3s84FuhgedyMGsXmh
         JkQ6BMD+X6g+KlYm2mcRaAsDWyLBXi6BSWeRXevZ6EsjnqJEbwHiLE0l/AH/QQfZEHjq
         kmTuGysI75symYTw+mud1NPvzhK4fETHW2qrVpLOt5i8X3qYLmAy5O6lJXbj9UDQ3miK
         k92coF5gOoQ+FXJGrhGIfbdfi6Nz7HnNYUDF+oPxPn5sCpFQBII2kdSoMZAHhH/8Py05
         IOVw==
X-Gm-Message-State: AO0yUKVqICzGphkHZ986XIw7JDPgltwc0hhYHN7MwloXVUdjNPboEFqA
	DUBKeXg4Orl2tbHb6A6DWwo=
X-Google-Smtp-Source: 
 AK7set8PNytjo88R/CSuQUpQ6yNfiv2mI4cAeSeVkEQxv9w+c+gUg8tywgNqdnVB1ce+k+fDvDn5Tg==
X-Received: by 2002:adf:f646:0:b0:2c6:e87f:f19 with SMTP id
 x6-20020adff646000000b002c6e87f0f19mr2032734wrp.57.1676659980387;
        Fri, 17 Feb 2023 10:53:00 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d8bd:e692:c27f:c09d])
        by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003db0ad636d1sm2964514wms.28.2023.02.17.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:52:59 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r9a07g043: Update IRQ numbers for
 SSI channels
Date: Fri, 17 Feb 2023 18:52:25 +0000
Message-Id: <20230217185225.43310-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GM7L7EHCMMMTBYQOYIW5K523YFGQVAQN
X-Message-ID-Hash: GM7L7EHCMMMTBYQOYIW5K523YFGQVAQN
X-MailFrom: prabhakar.csengg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GM7L7EHCMMMTBYQOYIW5K523YFGQVAQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

>From R01UH0968EJ0100 Rev.1.00 HW manual the interrupt numbers for SSI
channels have been updated,

SPI 329 - SSIF0 is now marked as reserved
SPI 333 - SSIF1 is now marked as reserved
SPI 335 - SSIF2 is now marked as reserved
SPI 336 - SSIF2 is now marked as reserved
SPI 341 - SSIF3 is now marked as reserved

This patch drops the above IRQs from SoC DTSI.

Fixes: 559f2b0708c70 ("arm64: dts: renesas: r9a07g043: Add SSI{1,2,3} nodes and fillup the SSI0 stub node")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index c8a83e42c4f3..a9700654b421 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -80,9 +80,8 @@ ssi0: ssi@10049c00 {
 			reg = <0 0x10049c00 0 0x400>;
 			interrupts = <SOC_PERIPHERAL_IRQ(326) IRQ_TYPE_LEVEL_HIGH>,
 				     <SOC_PERIPHERAL_IRQ(327) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(328) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(329) IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+				     <SOC_PERIPHERAL_IRQ(328) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
 			clocks = <&cpg CPG_MOD R9A07G043_SSI0_PCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SSI0_PCLK_SFR>,
 				 <&audio_clk1>, <&audio_clk2>;
@@ -101,9 +100,8 @@ ssi1: ssi@1004a000 {
 			reg = <0 0x1004a000 0 0x400>;
 			interrupts = <SOC_PERIPHERAL_IRQ(330) IRQ_TYPE_LEVEL_HIGH>,
 				     <SOC_PERIPHERAL_IRQ(331) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(332) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(333) IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+				     <SOC_PERIPHERAL_IRQ(332) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
 			clocks = <&cpg CPG_MOD R9A07G043_SSI1_PCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SSI1_PCLK_SFR>,
 				 <&audio_clk1>, <&audio_clk2>;
@@ -121,10 +119,8 @@ ssi2: ssi@1004a400 {
 				     "renesas,rz-ssi";
 			reg = <0 0x1004a400 0 0x400>;
 			interrupts = <SOC_PERIPHERAL_IRQ(334) IRQ_TYPE_LEVEL_HIGH>,
-				     <SOC_PERIPHERAL_IRQ(335) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(336) IRQ_TYPE_EDGE_RISING>,
 				     <SOC_PERIPHERAL_IRQ(337) IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+			interrupt-names = "int_req", "dma_rt";
 			clocks = <&cpg CPG_MOD R9A07G043_SSI2_PCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SSI2_PCLK_SFR>,
 				 <&audio_clk1>, <&audio_clk2>;
@@ -143,9 +139,8 @@ ssi3: ssi@1004a800 {
 			reg = <0 0x1004a800 0 0x400>;
 			interrupts = <SOC_PERIPHERAL_IRQ(338) IRQ_TYPE_LEVEL_HIGH>,
 				     <SOC_PERIPHERAL_IRQ(339) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(340) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(341) IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+				     <SOC_PERIPHERAL_IRQ(340) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
 			clocks = <&cpg CPG_MOD R9A07G043_SSI3_PCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SSI3_PCLK_SFR>,
 				 <&audio_clk1>, <&audio_clk2>;
-- 
2.25.1

