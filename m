Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 384EC91DF55
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2062BDC;
	Mon,  1 Jul 2024 14:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2062BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837150;
	bh=7o3IDq7dMnCJpDffLvbMK0yGcnevSZjTsnurFpsaims=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CsvhWlRFvntRx4leg202x3uH0CUl3yjHlZGb9UfETFwy2v9TfU753zATVWeqnBSGU
	 X1Z8Q3RV37AuKt72kQBdz172Zu2OdYFmlOHW9ITTQE8ore5ZlAt86ziFjGVz/SYsiq
	 o/K8BigmmTIdfr5wV+zZQEwpuJAhBubGpAZBY/FQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6185F80735; Mon,  1 Jul 2024 14:23:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A31DAF8072A;
	Mon,  1 Jul 2024 14:23:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3C08F80423; Thu, 27 Jun 2024 17:01:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACDE1F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACDE1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=06sTh3A3
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57d4ee2aaabso2069689a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500464;
 x=1720105264; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y7Vm7BbdgByjIx2Tu22DX4H6N9MAc4rl5R9/LnNe7E=;
        b=06sTh3A3Brj4JV1HLolkcE7sB86oqVvxva1D6xOnyqvLt4AJdIyg2WzhzySD8zC40O
         Ly9hhsQtcQ2g+IYa9FKMjPujuL6YGvcK1fYuX47vgpGaEVDphtcgDI1D3ufmn92w2AMZ
         1LzS+ZHl9EsluRuC9c0DE5X/1CoUIV+2ic0cM/KBPNx1cfKPVugz2cucFry8cRkvRsg3
         p7OjZ0X7cDYCC6e0vgjRLP5J81C1zJe4vHYadCGBunBZ7HjNl5h0a23QDOtmElKEPy5G
         QPIPeQ9n3hQDUPfsM6OeHKyT6xU2Bfpx2874cMeRgIXOdao+K4ewsjJDn3KOUESEukh/
         bdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500464; x=1720105264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y7Vm7BbdgByjIx2Tu22DX4H6N9MAc4rl5R9/LnNe7E=;
        b=bVz8QMy029WwPGI/w7Z3+HWmmdI7nzZE/6lC6q02pwHaicDl+6dmzgw5EkIRtWSAxn
         0XZSibdQWI6WOfwETFUfx9yHJoKwPToSEIx6Aytgmk4/utZjrxHfJPj37SSfZkovWEg6
         lo/ovUtiqWo1EN3+XXpCf87o4DqkTewRn4DCoXk/9BU6RseqVekY8xSMPoZv5XeqXXzh
         p8y1csMTCvlAoGC7+WlIAYnDtmPdvWYxaIbaK6lpOait50H/lRwuzxV2IGkYv4fQuK39
         1mOPSNESqh24hd6cCtnrSqPxNuSTfLvp9aWZ/gF8z1UMw2IsewOmfwaueREJ2N2DJ4Lf
         dyjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxVBPOiHU6CJBi6GYDjs0eD71wAE77/Mf/ikrk7/Q3+4yge7eeaPtEog+f3iazacEMOWg6ing/RBk4zVVFhS+9GbipHk65BnkQU8s=
X-Gm-Message-State: AOJu0YxQVTZUG2j4ovD+Nlg6AxgtekmV9ESr7EpSouv2Z/CtLJulKpM+
	gTbPaFTqyFGrHYg/chXffTmXWRCvrpyd6wSQDIFGPSbyysi/PtP6iBbu6U6oIFg=
X-Google-Smtp-Source: 
 AGHT+IFg9G5Qjr/NcWh7E3bulgGsi4BkD4axF+tIY1ZpcMPEHOlYWD36DNqKEQ2BHT5YOG2H3Pk0zw==
X-Received: by 2002:a17:906:c2d5:b0:a6f:b9d3:343a with SMTP id
 a640c23a62f3a-a7245df6b0dmr710793766b.71.1719500464181;
        Thu, 27 Jun 2024 08:01:04 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:01:03 -0700 (PDT)
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
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
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
Subject: [Patch v5 00/12] Add audio support for LPC32XX CPUs
Date: Thu, 27 Jun 2024 17:00:18 +0200
Message-Id: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZS3SWJFC6QCQ6HWVKXZMLJQ7VURWBPCQ
X-Message-ID-Hash: ZS3SWJFC6QCQ6HWVKXZMLJQ7VURWBPCQ
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZS3SWJFC6QCQ6HWVKXZMLJQ7VURWBPCQ/>
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

Piotr Wojtaszczyk (12):
  dt-bindings: dma: pl08x: Add dma-cells description
  dt-bindings: dma: Add lpc32xx DMA mux binding
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Use simple-mfd for clock control block
  ARM: dts: lpc32xx: Add missing dma properties
  ARM: dts: lpc32xx: Add missing i2s properties
  clk: lpc32xx: initialize regmap using parent syscon
  dmaengine: Add dma router for pl08x in LPC32XX SoC
  ARM: lpc32xx: Remove pl08x platform data in favor for device tree
  mtd: rawnand: lpx32xx: Request DMA channels using DT entries
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
  i2x: pnx: Fix potential deadlock warning from del_timer_sync() call in
    isr

 .../devicetree/bindings/dma/arm-pl08x.yaml    |   7 +
 .../bindings/dma/nxp,lpc3220-dmamux.yaml      |  49 +++
 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  73 ++++
 MAINTAINERS                                   |  20 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |  53 ++-
 arch/arm/mach-lpc32xx/phy3250.c               |  54 ---
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/nxp/clk-lpc32xx.c                 |  26 +-
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/lpc32xx-dmamux.c                  | 195 +++++++++
 drivers/i2c/busses/i2c-pnx.c                  |  48 +--
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |  26 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |  26 +-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 375 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  72 ++++
 19 files changed, 993 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 drivers/dma/lpc32xx-dmamux.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1

