Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3A91DF63
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:34:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFB12C12;
	Mon,  1 Jul 2024 14:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFB12C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837264;
	bh=hz9vMGQkJCRjJHzyKADPoZQ1+W9Qq2q+0aeL6AyIwwE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LGjRDfyQJauMUBm/YX7PEf/ebJCFlp8aKCGJM0xNH48cvV3oVcaPgeXbc37zinqS+
	 kzSbkQDdu7027OnCh4ydxpsONx0Adch2eEb83ZvEZy5xu8JeEius4IfREhIML0fZR5
	 vp9MlFN00Q4pnGh+NUV05zW9uybjv1p4m/MYOYsM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61A40F899F6; Mon,  1 Jul 2024 14:23:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F750F899E8;
	Mon,  1 Jul 2024 14:23:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFC67F80423; Thu, 27 Jun 2024 17:03:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29589F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29589F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1zc0iP22
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a72420e84feso734208366b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500623;
 x=1720105423; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HK3YnwUakD5I0BhgcE6EqxKNTh3E2b909JJ6LJOQWzo=;
        b=1zc0iP22CfO5rm72ANjLXqezqiw7xMKcbwKmlShlmg0fJeI0DMdKfFmauN71KCqLX7
         H74YQ76WNwRS4CqQhxljDeRLM4cGJPYIOuLyM6WFR2GrUbfoHJEV1K433cQYet/ANOGE
         86rbSwf0qitezOIx5xtdeS7y5zK22H/EN4ifLApIfiMjNBjqCWkbOipRMIRz9gss/SQC
         0esUwv99H0miHA1Atl5nHk/U+LzstzYFt7QZnBMK5L8jz+/PPaSPZXnbQ4nxaxHLTZyK
         SFAtDwkODeuq1hUfkbDbag8bmpwqf4INcsdWqanPcL73UrJ0ZLCkyNecWoPoYHK945qv
         6tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500623; x=1720105423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HK3YnwUakD5I0BhgcE6EqxKNTh3E2b909JJ6LJOQWzo=;
        b=c14XFw0DmxicxoShfys4iaIZtWUvPSV3eNM8qxuS2bg0h3craHLms6WZg2km03oQtx
         lw7S+34y73APibrPv49rblNhoLalYy/EbQ0/pp41e1GNO0zMMI30wnf+Yh33HGhPkQcX
         hfLXrASGL+NvIwsWV8c1a3IXCktmoGjo6H/1pDJDasmx/8OjY9TfmQ6WpHL4M53vOThM
         rM1Qj0hWB9x2H64nuW8c5CgRy/LQGHWKDPCmbcjBVcFNUsPPkJ2vaDhd0w75L7WrNckH
         OU4hVkzcMtPvrnESK6XJv5JpGVTLc9yxq5lhiZ0axXuxrzALgpzpdkqPqVlFCMqEfl/A
         0l2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF8xV1mLDupB/Dm/8jVVOkj3tMVSj27UbZuNdqQQdPFf2XSHovtpPH4wEXUuxxcQYCO9uO0NF7K+88zFc/iT4f/sZm36/PhqUHqL0=
X-Gm-Message-State: AOJu0YyeN87I2NFSXs2h5v5Q2izEydL8KAAvKkwzQ2gB7DqP/19jY+kQ
	IAppLC/jU2jZW3lrNWD1mvHfP/d2Y1/l+pYfGS1/oWhphih8FrAivIN4A0XjXsA=
X-Google-Smtp-Source: 
 AGHT+IEAPzD6OW6I5gXrK5R5rKDBnBfIPb8ujVS2DyQUrkTnzInDvDleYelSt4/XGlIg6GkZNz/Tdg==
X-Received: by 2002:a17:907:d386:b0:a72:8d4f:6720 with SMTP id
 a640c23a62f3a-a728d4f6df3mr385836766b.69.1719500620657;
        Thu, 27 Jun 2024 08:03:40 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:03:40 -0700 (PDT)
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
Subject: [Patch v5 07/12] clk: lpc32xx: initialize regmap using parent syscon
Date: Thu, 27 Jun 2024 17:00:25 +0200
Message-Id: <20240627150046.258795-8-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LSZWT7F3ES3PZPUKIOBCSBZIVSLUWZJO
X-Message-ID-Hash: LSZWT7F3ES3PZPUKIOBCSBZIVSLUWZJO
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSZWT7F3ES3PZPUKIOBCSBZIVSLUWZJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This allows to share the regmap with other simple-mfd devices like
nxp,lpc32xx-dmamux

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Add fallback regmap for previous simple-bus DT entry

Changes for v4:
- This patch is new in v4

 drivers/clk/Kconfig           |  1 +
 drivers/clk/nxp/clk-lpc32xx.c | 26 +++++++++++++++-----------
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3e9099504fad..85ef57d5cccf 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -346,6 +346,7 @@ config COMMON_CLK_LOONGSON2
 config COMMON_CLK_NXP
 	def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
 	select REGMAP_MMIO if ARCH_LPC32XX
+	select MFD_SYSCON if ARCH_LPC32XX
 	select MFD_SYSCON if ARCH_LPC18XX
 	help
 	  Support for clock providers on NXP platforms.
diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index d0f870eff0d6..b8de7f66d1b5 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
+#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/lpc32xx-clock.h>
@@ -1511,18 +1512,21 @@ static void __init lpc32xx_clk_init(struct device_node *np)
 		return;
 	}
 
-	base = of_iomap(np, 0);
-	if (!base) {
-		pr_err("failed to map system control block registers\n");
-		return;
-	}
-
-	clk_regmap = regmap_init_mmio(NULL, base, &lpc32xx_scb_regmap_config);
+	clk_regmap = syscon_node_to_regmap(np->parent);
 	if (IS_ERR(clk_regmap)) {
-		pr_err("failed to regmap system control block: %ld\n",
-			PTR_ERR(clk_regmap));
-		iounmap(base);
-		return;
+		/* fallback to mmio if syscon fails */
+		base = of_iomap(np, 0);
+		if (!base) {
+			pr_err("failed to map system control block registers\n");
+			return;
+		}
+		clk_regmap = regmap_init_mmio(NULL, base, &lpc32xx_scb_regmap_config);
+		if (IS_ERR(clk_regmap)) {
+			pr_err("failed to regmap system control block: %ld\n",
+			       PTR_ERR(clk_regmap));
+			iounmap(base);
+			return;
+		}
 	}
 
 	/*
-- 
2.25.1

