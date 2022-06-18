Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD6552145
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C377B28F9;
	Mon, 20 Jun 2022 17:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C377B28F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739541;
	bh=r2lowgE4PsbLlnEwC75THulp/vCvT1CIchZYN9iMmtA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYQkPGYwRjn2KnnpaZlKREQBzcGnXMSfOFs59MIHk7Y+TUBViPFy0cKj+bcq3j33M
	 ga4tyoxpB4dJwZZMIJ+eI7TTi38VK16ANquclJmOJYcAMRlIueDqWviP1/ieiZ9JpD
	 v6Q6IZ4VrGO0v4Ar1/7PY+Vyx+0e0UyvG84q72yE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7796F89671;
	Mon, 20 Jun 2022 17:08:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CD84F8052F; Sat, 18 Jun 2022 14:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A09B2F804BC
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A09B2F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="dM4LDKg5"
Received: by mail-wr1-x430.google.com with SMTP id w17so8782635wrg.7
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qmSWtWUd+mMy8ZYoZTgQjYDztLIGNDdvta+tk149+dY=;
 b=dM4LDKg5XtY0Inv2LgZSsQ50IPuzGfCzEsvHlFQ/2NLIm/6++fbLLGSB9koJgwMTjp
 07IF9XMy4P4HaeMA1yfSnaPY3CYXQ+u0Kv6ZrDa4GjATk93Wx2p5DeaQw29BenmArCiz
 I6simFjZ6ZTWhMpFS4z5vR9LZUvOOE+DqLAunuoSePBDY5dNABj/iCXgooJ7JUM1Gx2w
 oJTVRWFtg+XkkdFP3+9IwXZt69jucggKlNwGuChB7WxmXKdl5k9lj8f8ITLIpfckoFQS
 YaBPUVjvUVp7mpO9D9wZzFoEi6tceysbIOAoKo4R7lpk7QqiW4+Bkh5CqE2X/nDML5P4
 Wj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qmSWtWUd+mMy8ZYoZTgQjYDztLIGNDdvta+tk149+dY=;
 b=EH+mjFS5cezPxrb1fX+FKHslEUAHmaghH7QaQKNCz21r1su5+4c32A4kyPsUj3EMZg
 uNJ7FltkK3DusEBsql/8v19B60QfnzTiCUXTtTnOWSqy7B7YhN82o7GCCC203gBDFaZK
 5VAqo/8A2xFBegsIFS701MkFOiGB2pSWvN9FDHRr5iMLlFA/Y++oWzY/9GSI41w7GenW
 xFrOWWllrvrEFokle15PIcXD1IGT720xguXRnfY+YmtnDhkFAS6nfEt44X4G8sbRPjl+
 LFm2XdaZ7BCBgVWt8kMF4H7EgNa7qwZzSC+3O3jvRJx8mwenr4ydoJhShmXGoANz/lgO
 FO7g==
X-Gm-Message-State: AJIora+gSZbEF+O3bl7TUUIzXt+qfTmIATOtCZHM4mMgGotRMGlZcS8Y
 hQxIcaU7M51kkdWgSq/iudXYbw==
X-Google-Smtp-Source: AGRyM1sfPQ5XTH8REWSlcNVbh+KVLu6pjXz8b6gchhSbSGxDuCamFh0CMH0mba5q/rzWCUN22eIJUA==
X-Received: by 2002:a05:6000:1b03:b0:210:3372:2bd9 with SMTP id
 f3-20020a0560001b0300b0021033722bd9mr14215037wrz.704.1655555531747; 
 Sat, 18 Jun 2022 05:32:11 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:11 -0700 (PDT)
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
Subject: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Date: Sat, 18 Jun 2022 13:30:29 +0100
Message-Id: <20220618123035.563070-8-mail@conchuod.ie>
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

The k210 memory node has a compatible string that does not match with
any driver or dt-binding & has several non standard properties.
Replace the reg names with a comment and delete the rest.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..287ea6eebe47 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
-		compatible = "canaan,k210-sram";
 		reg = <0x80000000 0x400000>,
 		      <0x80400000 0x200000>,
 		      <0x80600000 0x200000>;
-		reg-names = "sram0", "sram1", "aisram";
-		clocks = <&sysclk K210_CLK_SRAM0>,
-			 <&sysclk K210_CLK_SRAM1>,
-			 <&sysclk K210_CLK_AI>;
-		clock-names = "sram0", "sram1", "aisram";
 	};
 
 	clocks {
-- 
2.36.1

