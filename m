Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9245565383
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E50F175A;
	Mon,  4 Jul 2022 13:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E50F175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934271;
	bh=ABl99Pf7KZ2KKUBtpKGFwkY/7SVWARcB3L2yMkO+Sf0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EO3VoC/MQUZHBosFnNvv3j3m82I2nm8f5C/v2obkLFCgWqjWHx5LwkaUKwVGdOSQm
	 A/ab8r9p8ZjXGINmvHkbqw4law/cTYYLw0joKrOPTFZSW0+SNIGbP5MFr4ngeIq01U
	 L1nYFK5yHeqqSb8bDAgNWOZh8+8UXKfiKczswoKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4274DF805EF;
	Mon,  4 Jul 2022 13:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6E32F80107; Fri,  1 Jul 2022 21:23:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D29D1F80152
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D29D1F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rb1/6QxL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34C46B8311E;
 Fri,  1 Jul 2022 19:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53007C341D0;
 Fri,  1 Jul 2022 19:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656703427;
 bh=ABl99Pf7KZ2KKUBtpKGFwkY/7SVWARcB3L2yMkO+Sf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rb1/6QxLQE0iQWjMcgp3oaobq91X8xcQfNJH65P7tcP0CkzSHHwL0vOwga9t33s6d
 Lw1QljftZtjWErzFxaehBkoH35ki7QTO55YvNbkkFrV/t4VRSvcuRA0QN/kE/UulrA
 AUd29msUfQRF8klwlW3F9IEOO28tiPI6jfFaF3A/SfvPv8zwLjMxAn2hk1yiscEnGk
 7QTYCYFZ3adI3olruWC4WG4z7jRaKSj9/Xrcgeplj4LymH2nhu7j/E8cfIjw7fhQbr
 jGQdcsEcLElSBAlN1ARNQ0OWFqc2INpmuFT2LK9Kfff/GpkykqWPJa0c5iUKChwUVM
 0bKg2MGWFoztg==
From: Conor Dooley <conor@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 02/14] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Date: Fri,  1 Jul 2022 20:22:48 +0100
Message-Id: <20220701192300.2293643-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
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

The Canaan KD233 development board has a built in LCD.
Add a specific compatible for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index c5571391ca28..99e0cb9440cf 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -24,6 +24,7 @@ properties:
           - adafruit,yx240qv29
           # ili9341 240*320 Color on stm32f429-disco board
           - st,sf-tc240t-9370-t
+          - canaan,kd233-tft
       - const: ilitek,ili9341
 
   reg: true
-- 
2.37.0

