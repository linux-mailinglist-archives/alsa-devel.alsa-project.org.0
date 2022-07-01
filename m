Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A513356539F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210861750;
	Mon,  4 Jul 2022 13:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210861750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934492;
	bh=GQBZkYsOARLee0LoWUcB5KK1izgdhhT3qdxeMqPT9Js=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fPA6PmqlUW22z0zZdhfev+97Nz6dVrvRu205tdmwb93/l/X9MrPXaS0EsJUW583PV
	 DatPN0MRSRnLXc8Gs4r1DRGzC1+t57DMUnChulIPlVKHaODI1RcrQj4RIjmi+k9uHU
	 pZTbKmAdgHBLcbJLdrcA2ztUL7a2aLVnGxMuRJQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44854F80632;
	Mon,  4 Jul 2022 13:23:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E147F80256; Fri,  1 Jul 2022 21:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9286F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9286F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dj44/KsD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D1CCB831A9;
 Fri,  1 Jul 2022 19:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4551FC3411E;
 Fri,  1 Jul 2022 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656703493;
 bh=GQBZkYsOARLee0LoWUcB5KK1izgdhhT3qdxeMqPT9Js=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dj44/KsDsj9XCsKlI0DYZVNdzzBwOR1+6l6nZKtgV32waooME0H55JVPqqGngOxeZ
 /haG+mvmWd90gDOODN5oXUN7hxE9/mfPigkQIAvxorJzI+EOLFq6dXA8IfenN9E7ou
 qFyHheDQXzI2/FKBLNevZzeurvxUzMKf2Qoe/MvGXtX4flvYEznJ32IgT+mVFJyjzY
 R0SogVpw8kQHqYI3+tSQn9bKIwIkZbQvIe+vgZOs3Wy0CZDseklj+i7W8Qn3YyxVJq
 PbxRL5tzIljlVA4aAb2mHKmQHgucMAvRIqcKAPEJ9KzAB4ylsbWQMQhaQ3F/RWVI03
 NqiPFta0VCoPQ==
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
Subject: [PATCH v4 13/14] riscv: dts: canaan: add specific compatible for
 kd233's LCD
Date: Fri,  1 Jul 2022 20:22:59 +0100
Message-Id: <20220701192300.2293643-14-conor@kernel.org>
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

Add the recently introduced compatible for the LCD on the Canaan KD233.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 4a540158f287..b0cd0105a5bd 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -127,7 +127,7 @@ &spi0 {
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
 
 	panel@0 {
-		compatible = "ilitek,ili9341";
+		compatible = "canaan,kd233-tft", "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 		spi-max-frequency = <10000000>;
-- 
2.37.0

