Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8F552155
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09EC293A;
	Mon, 20 Jun 2022 17:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09EC293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739606;
	bh=MG2QOqgmPA4v6RrHU3OlIycBVEmVIDyoBQpgRSfHhrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBuaHWM4e4xFQaGYs8p2SVJt8+A6xEdqcPozKDWLXf+XsrDml3yoVxzcWMD+Z4UPq
	 xJpwjdoLkJFzi9NcAxZog1iqafWGfq8sT1UjWpC0CdW/X2l2B+x9xg1Od0h0a3e/oZ
	 4/+W7hlW7jHqGScLa9NlhDK2h4+G7a2N+pLmrYBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C67F896CC;
	Mon, 20 Jun 2022 17:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42D92F8026A; Sat, 18 Jun 2022 14:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D30B6F804AE
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30B6F804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="DDJ6xBBb"
Received: by mail-wr1-x436.google.com with SMTP id c21so8820464wrb.1
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hvr7KGApLNCGFBglHD3dnfCRd3yjQwODkG+M5NRKmQI=;
 b=DDJ6xBBbhzIGoPiqSpo5MnWPGVLzU4ERv8vLSiBnnPAynNwKjWM49EcnFIFQEkgm/l
 doK52smtoMBCAMnt3+oFGMyw4xhf6W+5pMee3IBtco7DlzBypqqFxGPePkxlqPEw5tri
 SDLBm2agXeKviAcJotwY5RL1uBwFcjHga0K6SkH6mQCE6NwwTJxpZV0bQ6udBQCQ8t5X
 /ugUETlZEHQBi+kUxi5RSWCIVIQtoVjqwtn8FqK1wrZYFA5exI/WKKix1Zp5xujFsjOq
 WhKYuvAAICTLiFyGacSvPtjx9GD78ZZmFV4S8UwSg41UB0EBKvQ+vCEP9thO5HxmtSKW
 MnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvr7KGApLNCGFBglHD3dnfCRd3yjQwODkG+M5NRKmQI=;
 b=NN5feCWUPeal/CjWJr0Idp/UKEL7NyCk+qxwqdSluV0P+VXSuM3C6+/QXiLj+XRMfX
 bqDn2rnz+LQ/FB124nqGL8caKWnB6sqWX+emYIKfQitYxZOJ19/IMBlDFEJQWXGGLR3p
 d3XRmzLbTbsKx7I4raIQkexlom/df5kdZm2EuJjGMr41y0yG/K7HKKDrN1R9HglDIL/n
 wYq9OQZg91jnrxBpc4T9GNakFVXOoZtx+dYCE4yer102ewcLwWQI+kP8d1TYRoqOM7K/
 BUmN+sM4XYJ1gGzRP/SKNyuGyxfUqq+RgYaHGc2tUDNvZW4jULnIAWou6ZmYzG9SUOGj
 3U0w==
X-Gm-Message-State: AJIora9U1jVwYTYBBb5udZhnUStvUOYCHHwWoP3EZuV5x0mLAiA/4Khr
 7orUjIJDQo6lfLFCr38X8AJCfQ==
X-Google-Smtp-Source: AGRyM1sRT/G1/Zc62fYFm4YsukPkHZCuylsLgzzu2NtDF1otkPHXpMjCG/oHMIlIy5/3wMzfMLCUWA==
X-Received: by 2002:a05:6000:147:b0:214:7d6e:cb1d with SMTP id
 r7-20020a056000014700b002147d6ecb1dmr13471356wrx.650.1655555545465; 
 Sat, 18 Jun 2022 05:32:25 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:24 -0700 (PDT)
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
Subject: [PATCH 14/14] riscv: dts: canaan: build all devicetress if SOC_CANAAN
Date: Sat, 18 Jun 2022 13:30:36 +0100
Message-Id: <20220618123035.563070-15-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:47 +0200
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

Testing & checking the Canaan devicetrees is inconvenient as only the
devicetree corresponding to SOC_CANAAN_K210_DTB_BUILTIN will be built.
Change the Makefile so that all devicetrees are built by default if
SOC_CANAAN but only the one specified by SOC_CANAAN_K210_DTB_BUILTIN
gets built as an object.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I don't have any Canaan hardware, but I build tested it and the log
looked correct with arch/riscv/boot/dts/canaan/k210_generic.dtb.o
getting successfully built.
---
 arch/riscv/boot/dts/canaan/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index c61b08ac8554..befe4eb7527b 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,3 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-- 
2.36.1

