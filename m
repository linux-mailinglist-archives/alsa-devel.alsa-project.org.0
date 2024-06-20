Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39C91DEFF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C64E23D3;
	Mon,  1 Jul 2024 14:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C64E23D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836531;
	bh=lL5HxCJiZymjowcOr7xVA2M7Te/xs6i3j2oxZgMh+rs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fjI8WnDDoYKgFgD2iHHEr1uvS/JiDsltWCWjBP4RW+S2UPnjMIE5Sybl3zPBEmM6y
	 OFgrpTFUrLkflJ8AB6tUlzeMivYTG2REEiPdmvQFkE71MGOYQBSat6YvOStFKc4fiD
	 tcGK46iIIgv5ZnSB7oqOWtovVXujzg8aMZ3f91zI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C8CFF806D2; Mon,  1 Jul 2024 14:20:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E000F806CA;
	Mon,  1 Jul 2024 14:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 759EAF8023A; Thu, 20 Jun 2024 19:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3F50F80266
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 19:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F50F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=25raIcO/
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57d07673185so1098848a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906235;
 x=1719511035; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UP/GNN9hhxz4nMUGrLaNfWrPk3mVaVMWtBi9huNJxPk=;
        b=25raIcO/uGAgg3FtFHQKGIGmzo1JmlOMnyXZH1E5oPYs7eNtUfbmnH4WQCtmSbRrUm
         XtnVTkWsvtxu882lo3iwAQVE+TAXvSfErcThr3uYfH8UIBI8VrTXuoAwdizkUEmA+p/3
         OiP/VPKjgK5wZ5eMrgJ5xK7vDaGwt+C+FoaPrSTiCx8xezMHACNm+VqKFPVDUlOKYCKl
         ElNO7L3Xy/ll7eDmm5IboohWPKFgkoF05KybQZ2cdtMWANFnwJ3IN/aZ41wIVUiwcwhu
         50YnGpjo40C9U59I1KpnQqkFHZanuDlsmOD8nAIGD1/2WfCdAcON3qqGz2fegcBacPyL
         Pyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906235; x=1719511035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP/GNN9hhxz4nMUGrLaNfWrPk3mVaVMWtBi9huNJxPk=;
        b=mA/PwjT+xClYxiyiiV60COX2zlPIKyYmrRnMOCEZv9kaN+YwAIC0tVNCjSuZTd3Cln
         kNBV30q88O0heKja+DY7bXwnSyaeWMaZm7BVuqqnHvmjV9PM08lKX6LyUI8XiJ4tDNDB
         N4pVEp444YRv2FqLFB5KKaS/fQ7OP/BFW9BP1B3zn/Sn3PgGcd9IPLv0Xoq5Hhap49Q0
         9IM0a7OnRfI8Sy+5xUDeGSDxsdyiVlGvyi7FipO1b2R8hSGFyOH3nKG0Pt9VfJ5daCLu
         JcffDUPJdocjvIjrNoQaQJaAOvtjQb6gYEIR+oBsnjpHshRBVU9zPo8Je1GmkO5FcP19
         DL3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcO0EaPANYhqxrCWttFxxflfyqI2paBA824Qbq0nrxp/tEyIAgYWcF1L4RtVBany3Vem/t9K0lPuZRdgcW7rtoJfxEdXbZxQnHAN8=
X-Gm-Message-State: AOJu0Yysa358QsRBCrn9UnXFWYvpS6NOlwNQapQCCWDchUCeankHxNbj
	rM5dSHq1yTqP5mIKuMqveDaFdOkf8lqBZpN7XfCwIVd2VZ1DmdSyrUEwayRCp7M=
X-Google-Smtp-Source: 
 AGHT+IHwzCxasTWecNI2BQg/1Mqv76qvz0pqMMUj9hgHTBodTuDhBkY00q2aX9YgUG43J9U17WwHFQ==
X-Received: by 2002:a17:906:a09:b0:a6e:f7bf:712e with SMTP id
 a640c23a62f3a-a6fab618973mr379689666b.27.1718906235388;
        Thu, 20 Jun 2024 10:57:15 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:14 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 00/10] Add audio support for LPC32XX CPUs
Date: Thu, 20 Jun 2024 19:56:31 +0200
Message-Id: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N2WJ62JZ5RNBUNQJ3VHYCZKTRKOXGRHV
X-Message-ID-Hash: N2WJ62JZ5RNBUNQJ3VHYCZKTRKOXGRHV
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2WJ62JZ5RNBUNQJ3VHYCZKTRKOXGRHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This pach set is to bring back audio to machines with a LPC32XX CPU.
The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
The support was dropped due to lack of interest from mainaeners.

Piotr Wojtaszczyk (10):
  dt-bindings: dma: pl08x: Add dma-cells description
  dt-bindings: dma: Add lpc32xx DMA mux binding
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Add missing dma and i2s properties
  clk: lpc32xx: initialize regmap using parent syscon
  dmaengine: Add dma router for pl08x in LPC32XX SoC
  ARM: lpc32xx: Remove pl08x platform data in favor for device tree
  mtd: rawnand: lpx32xx: Request DMA channels using DT entries
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
  i2x: pnx: Use threaded irq to fix warning from del_timer_sync()

 .../devicetree/bindings/dma/arm-pl08x.yaml    |   7 +
 .../bindings/dma/nxp,lpc3220-dmamux.yaml      |  56 +++
 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  73 ++++
 MAINTAINERS                                   |  21 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |  53 ++-
 arch/arm/mach-lpc32xx/phy3250.c               |  54 ---
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/nxp/clk-lpc32xx.c                 |  10 +-
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/lpc32xx-dmamux.c                  | 195 +++++++++
 drivers/i2c/busses/i2c-pnx.c                  |   4 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |  10 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |  10 +-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 376 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  73 ++++
 19 files changed, 954 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 drivers/dma/lpc32xx-dmamux.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1

