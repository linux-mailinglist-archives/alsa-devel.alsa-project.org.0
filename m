Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F2769B2B0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 19:54:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B76BFC1;
	Fri, 17 Feb 2023 19:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B76BFC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676660099;
	bh=Q5hsqtVJQ9n34L8DMPg2sQrFO5BnKVPvo4Qi6lbUX8w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qP4EtqdALDezWtQyzi6Aw0bqAjr+fYK0DltFCTMSbA2EF0D0pxkrISMCabnmXzW1y
	 U7PvfTncjFPnx8R+BIRFXVlWjal5Eck3l3fsq1j9KlSPEApKLyBU+EitzzELxRlpTg
	 2AY3S7lLsaDiZEW65QeGyVzdeIDBnO0kO1GuTJn8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71529F80527;
	Fri, 17 Feb 2023 19:53:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 884D6F80529; Fri, 17 Feb 2023 19:53:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EFEBF800E4
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 19:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EFEBF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YrxtQiPX
Received: by mail-wm1-x32b.google.com with SMTP id f19so1619652wml.3
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 10:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfIONDg+O2l728W8A/aybDWdqbMjXKRnoq5DkHutY6w=;
        b=YrxtQiPX9M3C+lD2QeuVTpsDV5P7zs4BnzO+hhD0Av8dAOJEIkWlWw2d7N0vZqSq5o
         aG4od0chT1ahVBLC3KBnr5w1E6vvccTyVE9/pbkECuBTcG6Q9W6CpXYn22K4fuTRPfFW
         SIrFO3ZUU9efFhBT875hujS5eEFrPQRe98imv00AS3YPiWXEvY1biHX9fpmMteIPJeJ9
         kurfJvTNIA3ZBGcQUObRGq01RWjVU1E1Wrvta8cqMQVmyiL5Lk9wFjoHfiBxDyzb9vGx
         dfyNLy2d+BW+BOkYSzVkpTbyXyvoPfQ+hF/Mj3jSLwNm6zd5i2s3oghxvMmKLd8tWz/h
         STUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfIONDg+O2l728W8A/aybDWdqbMjXKRnoq5DkHutY6w=;
        b=sqJgoJRL6idW6wCFOPyGvhAEld97u0UmThLrpucyn3uFFw2N5km3+GghD6Q5mLlHBh
         9KfobkoOn8jXi0J9YiRjWlo8Wjh5/Jx5Zpnis24J52UrDAWi1eSzYerM4XR0iyipJI64
         tL7XekpAOKEh7Or73V7NpdL72OzYh67qfPOp+Wm1uVyvC7Rr6EFgAPR96jnDWypXxMlN
         9xFOtQI6wRXxLlhqjssiA8ASq+jkPVuHd8h9bJEZnWBTt/H/myqdVZAzeQxjgVZ3bfIS
         ZcOGMnaej49b2NVeJINd1IobdqI5iB9HjJuf2fvauMYcLYqGh6S8ZKTEMd3MFuspvKwX
         kgUQ==
X-Gm-Message-State: AO0yUKUmXBqULJToAB1ji3JdthBogPjP9QY1EZ4eQ4EVRBEfv1GYmyeN
	8DeiBn+SKhX4YwNPHK06SVw=
X-Google-Smtp-Source: 
 AK7set++oN2hA/FfTXPb0kTH6fMsVlvXGOL4SRHfrT9+iz9dKfCI1C9tK2rzna4D4Mh66rSyISTt6A==
X-Received: by 2002:a05:600c:998:b0:3e2:20c7:6544 with SMTP id
 w24-20020a05600c099800b003e220c76544mr2458262wmp.19.1676659979332;
        Fri, 17 Feb 2023 10:52:59 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d8bd:e692:c27f:c09d])
        by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003db0ad636d1sm2964514wms.28.2023.02.17.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:52:58 -0800 (PST)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a07g044: Update IRQ numbers for
 SSI channels
Date: Fri, 17 Feb 2023 18:52:24 +0000
Message-Id: <20230217185225.43310-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2ASXSIR2NUPIHBK4LOXVG3FGKFZN2QWD
X-Message-ID-Hash: 2ASXSIR2NUPIHBK4LOXVG3FGKFZN2QWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ASXSIR2NUPIHBK4LOXVG3FGKFZN2QWD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

>From R01UH0914EJ0120 Rev.1.20 HW manual the interrupt numbers for SSI
channels have been updated,

SPI 329 - SSIF0 is now marked as reserved
SPI 333 - SSIF1 is now marked as reserved
SPI 335 - SSIF2 is now marked as reserved
SPI 336 - SSIF2 is now marked as reserved
SPI 341 - SSIF3 is now marked as reserved

This patch drops the above IRQs from SoC DTSI.

Fixes: 92a341315afc9 ("arm64: dts: renesas: r9a07g044: Add SSI support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi Geert,

As this is is a fixes patch and we are still waiting for [0] to be merged
shall do the same for V2L SoC?

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230131223529.11905-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 68bd70210d08..9945dcf38031 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -184,9 +184,8 @@ ssi0: ssi@10049c00 {
 			reg = <0 0x10049c00 0 0x400>;
 			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+				     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
 			clocks = <&cpg CPG_MOD SOC_PREFIX(SSI0_PCLK2)>,
 				 <&cpg CPG_MOD SOC_PREFIX(SSI0_PCLK_SFR)>,
 				 <&audio_clk1>, <&audio_clk2>;
@@ -205,9 +204,8 @@ ssi1: ssi@1004a000 {
 			reg = <0 0x1004a000 0 0x400>;
 			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 331 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+				     <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
 			clocks = <&cpg CPG_MOD SOC_PREFIX(SSI1_PCLK2)>,
 				 <&cpg CPG_MOD SOC_PREFIX(SSI1_PCLK_SFR)>,
 				 <&audio_clk1>, <&audio_clk2>;
@@ -225,10 +223,8 @@ ssi2: ssi@1004a400 {
 				     "renesas,rz-ssi";
 			reg = <0 0x1004a400 0 0x400>;
 			interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 335 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 336 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 337 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+			interrupt-names = "int_req", "dma_rt";
 			clocks = <&cpg CPG_MOD SOC_PREFIX(SSI2_PCLK2)>,
 				 <&cpg CPG_MOD SOC_PREFIX(SSI2_PCLK_SFR)>,
 				 <&audio_clk1>, <&audio_clk2>;
@@ -247,9 +243,8 @@ ssi3: ssi@1004a800 {
 			reg = <0 0x1004a800 0 0x400>;
 			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 339 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 341 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+				     <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
 			clocks = <&cpg CPG_MOD SOC_PREFIX(SSI3_PCLK2)>,
 				 <&cpg CPG_MOD SOC_PREFIX(SSI3_PCLK_SFR)>,
 				 <&audio_clk1>, <&audio_clk2>;
-- 
2.25.1

