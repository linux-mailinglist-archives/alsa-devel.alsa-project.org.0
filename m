Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D8552128
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3B6728DC;
	Mon, 20 Jun 2022 17:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3B6728DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739397;
	bh=SS0L4/SmUigtqlDgQOGwHotGC/L4Q/Fk8rn2k46jjfg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bhzBUl+Kg8ZG07DN5ip4+0zJ4Lesa1COhh85BvM/iBon1oh5w9/JmTeIUrhsOmtdk
	 gLrmZua4EDZF4u9AasARry8aFfTvVEnHzQn1zcwfZCPP99YzliL4zDXqYBxHBe3vP1
	 iScXURE+Ox5WxQCU/eRSq6+2DxoQUGLFMl/Vo95w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CDADF80CC3;
	Mon, 20 Jun 2022 17:08:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 619A6F804BC; Sat, 18 Jun 2022 14:32:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EC80F8024C
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EC80F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="S2mJhG/E"
Received: by mail-wr1-x436.google.com with SMTP id c21so8820464wrb.1
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxrfrrOtT2Oa/bD+7FBstHMfLsi5+SmAhxAWzjAkyZ0=;
 b=S2mJhG/EP2bvAoovp3+1EX915fqgCN7s5TTHRtk6gjrtEqOI/5G9b2iqkP8Hp2fPJT
 Xv7w9JM5mIzSBmUBnG5veKqEPc/MaxIruLrav0YlVhnIQlMG/M+wTnbgpcN0tcmr+tr2
 or89IY4gglZ6yWfGfoA+jfJEq4JsK9dvMaD2rRItnHWPYoJkG7IkTqJN1pM8cYB5TpdM
 9bGqfIt5FOQFRPbbNCxOn37acP1sIBQPp6tl26reXViVZmDuywOt0O5V9tWi+koaQg4c
 DJEmvefmmDhAvEMjrhz9P1n7uaAObdu8xiUcENoorbn9u8vIjZNy1IW7RHROc+mSnsUJ
 yKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxrfrrOtT2Oa/bD+7FBstHMfLsi5+SmAhxAWzjAkyZ0=;
 b=QuoYIARFl/BXTKKXy3uAkD9iW+Gn3YB7U/xYjdF1lJddaqzkYZh+xuqEzx19yBMNPW
 h5faXdtCoTaIt5QINrjfE4qMROhrU8fovxD9tNFmmR2sbBkMYKPG/HR6a0q/nkr8WfWu
 cNpmcIsTrBBsWpDdH57ZVspwg1Koz2EF1JZ+pzeYhwsLXcu6DMMuWhi51pZmYNCU6S9H
 iiOmr9psUjrQ+EOJtbmBfxleZ9k3+VBZ56VdqIjCs1R4V7teX28f8+9y/kzmnGWE1+1h
 HtMBaDCuTutAa4xGV0UKbJmpkfgWBXUb3ze98MuiDtADwGI3/s97ctt3w9fwis7rg9sW
 mM2w==
X-Gm-Message-State: AJIora/orNV3N7ctjVSUK4taBLp0TsFkEztjbMofC/RK4YUwATLg0WeD
 oELsPy3fxiwa4RmWSrRdg7z8ig==
X-Google-Smtp-Source: AGRyM1vo09vBquhwF3XuUkIoGOLL2MXJBKKEyvgcE2QTAi/5UKplOA45WdH+tRLIApC05LNQOZn4qQ==
X-Received: by 2002:adf:fd0f:0:b0:210:32d7:4cb5 with SMTP id
 e15-20020adffd0f000000b0021032d74cb5mr13971427wrr.565.1655555519244; 
 Sat, 18 Jun 2022 05:31:59 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:31:58 -0700 (PDT)
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
Subject: [PATCH 00/14] Canaan devicetree fixes
Date: Sat, 18 Jun 2022 13:30:22 +0100
Message-Id: <20220618123035.563070-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
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

Hey all,
This series should rid us of dtbs_check errors for the RISC-V Canaan k210
based boards (well, unless you enable W=1 but that's another days work).
I *DO NOT* have any Canaan hardware so I have not tested any of this in
anger. I based the series on next-20220617.

For the bindings, I am never sure about which of {unevaluated,additional}
Properties is correct to use, but the if statements in the binding didn't
work with additional so I used unevaluated...

@Mark, for your two bindings I was not sure about the properties that I
made depend on the compatible, but I looked in tree and was not able to
find other users to contradict what's in the Canaan devicetrees nor did
I get that much help from their docs.

@Rob, yesterday's removal of ilitek,ili9341.txt is moved to ths series
since I was editing the dt-schema binding here anyway.

Finally, @Palmer:
This + Atul's stuff + the sifive dts watchdog patch will get us sorted
in terms of dtbs_check errors. To make keeping it that way a little
easier, I changed the Canaan devicetree Makefile so that it would build
all of the devicetrees in the directory if SOC_CANAAN. Hopefully someone
with a device can test it - but my build log *looked* fine but that's
not exactly sufficient.

Thanks,
Conor.

Conor Dooley (14):
  dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
  dt-bindings: display: panel: allow ilitek,ili9341 in isolation
  ASoC: dt-bindings: convert designware-i2s to dt-schema
  dt-bindings: dma: add Canaan k210 to Synopsys DesignWare DMA
  dt-bindings: timer: add Canaan k210 to Synopsys DesignWare timer
  spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width for dwc-ssi
  riscv: dts: canaan: fix the k210's memory node
  riscv: dts: canaan: add a specific compatible for k210's dma
  riscv: dts: canaan: add a specific compatible for k210's timers
  riscv: dts: canaan: fix mmc node names
  riscv: dts: canaan: fix kd233 display spi frequency
  riscv: dts: canaan: use custom compatible for k210 i2s
  riscv: dts: canaan: remove spi-max-frequency from controllers
  riscv: dts: canaan: build all devicetress if SOC_CANAAN

 .../bindings/display/ilitek,ili9341.txt       | 27 ------
 .../display/panel/ilitek,ili9341.yaml         | 60 ++++++++----
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 +++++--
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 93 +++++++++++++++++++
 .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 +++++++---
 .../bindings/timer/snps,dw-apb-timer.yaml     | 28 ++++--
 arch/riscv/boot/dts/canaan/Makefile           | 10 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  4 +-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 25 ++---
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 14 files changed, 239 insertions(+), 134 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml


base-commit: 07dc787be2316e243a16a33d0a9b734cd9365bd3
-- 
2.36.1

