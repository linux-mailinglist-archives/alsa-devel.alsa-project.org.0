Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C10BB565380
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:30:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F65E1744;
	Mon,  4 Jul 2022 13:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F65E1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934239;
	bh=1bpO1iUTJJ3kstbZPucPenalfy/kzfO3W/0wHPIy6SE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vVpZP3oXbtvZ+E7zm9NCAZI6c0NomL+yVYLBDSq57/NIpmf0pLfbJRt0B6MppYCAB
	 SyFBr77/OK7zBcUMS3OnmsK1X6J7Jk7+uhSwDPaouUlcu4QgbiCcRHgWnwFJMYSAlB
	 KU1piXBcY2twFdvmJ8Q/g6Acdr/oecqA2/YKQ9eY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B40AF805E7;
	Mon,  4 Jul 2022 13:23:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9158FF80256; Fri,  1 Jul 2022 21:23:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F46DF800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F46DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L80dVd7D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 03BDCB825D9;
 Fri,  1 Jul 2022 19:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E296C3411E;
 Fri,  1 Jul 2022 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656703415;
 bh=1bpO1iUTJJ3kstbZPucPenalfy/kzfO3W/0wHPIy6SE=;
 h=From:To:Cc:Subject:Date:From;
 b=L80dVd7DLxVj0PBdm4QrguFAY5Dka9xMqyiKuVhhxISMH28ztUmvV676wTasz/GGE
 93fD1Ywn8nHe7VIZ0brY7idrgj8PGh43uwUHH3cPHT9qejrldyiONBwZziOt/wXrg2
 9gq7suTL5oS7ZZROPB+H3xxzde/iiqIM83VP3pubs0Zpg4y/Hln1mdKbp6sskj2H23
 XWV6TBiC4/jAnRq49vGTsdgIh9Sz7zVocUiFd9liYu09bAy8wDLWcMqKk260ZSYM/5
 bYOYh3wR+zxti3VdhBFfQok7lwZo28PHObt50NLSNXID1uhtb2SVl/CsHwqYSDUmu+
 3MDm/1i2KDwIQ==
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
Subject: [PATCH v4 00/14] Canaan devicetree fixes
Date: Fri,  1 Jul 2022 20:22:46 +0100
Message-Id: <20220701192300.2293643-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
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

Hey all,
This series should rid us of dtbs_check errors for the RISC-V Canaan k210
based boards. To make keeping it that way a little easier, I changed the
Canaan devicetree Makefile so that it would build all of the devicetrees
in the directory if SOC_CANAAN.

I *DO NOT* have any Canaan hardware so I have not tested any of this in
action. Since I sent v1, I tried to buy some since it's cheap - but could
out of the limited stockists none seemed to want to deliver to Ireland :(
I based the series on next-20220617.

Thanks,
Conor.

Changes since v3:
- dts: drop the bogus "regs" property pointed out by Niklas
- dma/timer: add Serge's reviews (and expand on the dma interrupt
  description)
- dts: add Niklas' T-b where I felt it was suitable. lmk if you think it
  applies more broadly
- spi: drop the applied spi dt-binding change. Thanks Mark.

Changes since v2:
- i2s: added clocks maxItems
- dma: unconditionally extended the interrupts & dropped canaan
  compatible
- timer: as per Sergey, split the timer dts nodes in 2 & drop the
  binding patch
- ili9341: add a canaan specific compatible to the binding and dts

Changes since v1:
- I added a new dt node & compatible for the SRAM memory controller due
  Damien's wish to preserve the inter-op with U-Boot.
- The dw-apb-ssi binding now uses the default rx/tx widths
- A new patch fixes bus {ranges,reg} warnings
- Rearranged the patches in a slightly more logical order


Conor Dooley (14):
  dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
  dt-bindings: display: ili9341: document canaan kd233's lcd
  ASoC: dt-bindings: convert designware-i2s to dt-schema
  dt-bindings: dma: dw-axi-dmac: extend the number of interrupts
  dt-bindings: memory-controllers: add canaan k210 sram controller
  riscv: dts: canaan: fix the k210's memory node
  riscv: dts: canaan: fix the k210's timer nodes
  riscv: dts: canaan: fix mmc node names
  riscv: dts: canaan: fix kd233 display spi frequency
  riscv: dts: canaan: use custom compatible for k210 i2s
  riscv: dts: canaan: remove spi-max-frequency from controllers
  riscv: dts: canaan: fix bus {ranges,reg} warnings
  riscv: dts: canaan: add specific compatible for kd233's LCD
  riscv: dts: canaan: build all devicetress if SOC_CANAAN

 .../bindings/display/ilitek,ili9341.txt       | 27 ------
 .../display/panel/ilitek,ili9341.yaml         | 49 +++++++---
 .../bindings/dma/snps,dw-axi-dmac.yaml        |  7 +-
 .../memory-controllers/canaan,k210-sram.yaml  | 52 ++++++++++
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 94 +++++++++++++++++++
 arch/riscv/boot/dts/canaan/Makefile           | 10 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  6 +-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 73 +++++++++-----
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 13 files changed, 253 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml


base-commit: 6cc11d2a1759275b856e464265823d94aabd5eaf
-- 
2.37.0

