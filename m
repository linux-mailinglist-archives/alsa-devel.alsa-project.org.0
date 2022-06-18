Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C67552142
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C94312912;
	Mon, 20 Jun 2022 17:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C94312912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739493;
	bh=WH4AKCyep79uKTotb/UVx1BZGFzLl9KWeSg5reru01s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGVIKrhYTl3w6r2FzJOUHlRPCqcc9R3Rp6pz6tExv5orYL3UgtyQHs+xQH7AkCsJt
	 wTyy3OB0c42DhoUsqC+6Kt1/jrfIUdiqy46pr8I5wkogXTtnBuv0DGGeRxHVsBRkQH
	 Iu3HwL0GJspol89MQz0s60iK+tAnmUeIoZlG8Wyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D3B1F80CB5;
	Mon, 20 Jun 2022 17:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1642FF8052F; Sat, 18 Jun 2022 14:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D9FF800C7
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D9FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="aHjW5Vki"
Received: by mail-wm1-x330.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so3550119wml.2
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yCkvd1rq89W/6SrEihtrV93zPOh8bp4EvU/AesUDp5c=;
 b=aHjW5VkiLOJuMraDAkim12MSrvxYtcnkUa+6XugCv/phW+l8JDcGEqmFOjtiPLghjo
 iDjWHIMizesLDejsxE38i+OtY7WWj3x11BBfb0BRUdXpK4pu3MkmLgAa5dvPF4Y79U7L
 UBw2DK7UQ4hfNaYZxuStYUEYkp5i7TbAmelLvl2Ui/7w8TkzozVKIQaX5ZY57N429Zl0
 xgWDMpxIW3ayHXhWUHqQjQuXwVBfy/ElkaLVd2hLdCEkKi4zy0N/eTrZ8OwQ4dltk65u
 J4kCuiGGXyE3akVz8UzRk2HQ3opmwMzKwoXk0plpXwMqySPXygB+SYToa/Kb5HF8Q3nD
 BP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yCkvd1rq89W/6SrEihtrV93zPOh8bp4EvU/AesUDp5c=;
 b=HhBm9jIlRoRwgIz1yOEW5h5uX/wxmO393VP+bUuNGRbLUKkSof0ZdPMMtWH+Cm30e9
 akSkp/pLNsbnOi2ofyczGWWvnn5ialwUxW8Y6Vik0hFzhQ2gUmygkxpUIO9TrwpX1XWw
 wnZj+Zm0AtmPvJ88ULbiL5/E7OIY1HT5NCV30lEvRIj0BuK6/ldQ5SjETPy9Jiqs6Nb3
 REiaV+5yQZsuEBc3BZms3Qoo2VkJm65w96s8AhJ6EFSrZI/GvUtl6RLY6aPpjKyY3BOQ
 of8hcZoI0utUbssWFPP2U5to3N3GndhokvJbkwVet18Epr44OoZOkDlqeSD639aLgDZF
 Vrcw==
X-Gm-Message-State: AJIora9m3K+XRFmj4RfzY1JoJ28S/rJ2qFHUF2zj8GZrnOcjsfVBd4+S
 HpyqP+5FdudRG5WIdQ0f6Wgo9A==
X-Google-Smtp-Source: AGRyM1s4BntBiZAtPtsynxF7uq+efiHJQnjp6f4ztefKsZzCsrAEC1MDiI+wsPar7tnOzz3WAfpCIg==
X-Received: by 2002:a05:600c:1906:b0:39c:8573:f330 with SMTP id
 j6-20020a05600c190600b0039c8573f330mr15063952wmq.5.1655555533520; 
 Sat, 18 Jun 2022 05:32:13 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:12 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 08/14] riscv: dts: canaan: add a specific compatible for
 k210's dma
Date: Sat, 18 Jun 2022 13:30:30 +0100
Message-Id: <20220618123035.563070-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:46 +0200
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
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

From: Conor Dooley <conor.dooley@microchip.com>

The DMAC on the k210 has a non standard interrupt configuration, which
leads to dtbs_check warnings:

k210_generic.dtb: dma-controller@50000000: interrupts: [[27], [28], [29], [30], [31], [32]] is too long
From schema: linux/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml

Update the binding to use a custom compatible to avoid the warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 287ea6eebe47..314f6da5d7f6 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -135,7 +135,7 @@ gpio0: gpio-controller@38001000 {
 		};
 
 		dmac0: dma-controller@50000000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x50000000 0x1000>;
 			interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
 			#dma-cells = <1>;
-- 
2.36.1

