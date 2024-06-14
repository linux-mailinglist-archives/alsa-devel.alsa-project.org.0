Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FEE90C349
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 07:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A48E868;
	Tue, 18 Jun 2024 07:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A48E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718690200;
	bh=w7D4H6haG4wr9/zSA8Ls/XStp8bmY84epC3dKNvwTuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lSCtR8NyQNCFxFhIHSWxMTZW4m1pEXRJeDE6UDD1W4WGZ1fbGw90ymniHIrNf9pBX
	 pblnbun91vAot0Ian6VkErzALofx32FcHtdvcSE7fRs6OiBIERy4Hg0/nlA7ol+7Vk
	 eBg3UzLIIMa+r6PTVxG/YzBzUPB6ddC1ccIOIU9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C79EBF805B0; Tue, 18 Jun 2024 07:56:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 660A6F805C5;
	Tue, 18 Jun 2024 07:56:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F79DF80448; Fri, 14 Jun 2024 18:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E60B1F800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60B1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=nB3blrQ8
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebdfe26242so26958481fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382962;
 x=1718987762; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy3GGlbh3G2vnmNyR+RwO5HO4iCoGtDW9R/i+yrCC54=;
        b=nB3blrQ8ol5rFCoZeah0NXICvEIf9y/7SgULgaAVIijLTWx0tUGzzoS5/dVT1ktLvZ
         w7iMZYPOZL2m9wj4AMtPp8gYb4CnN/eI0fB4r4PjPUvlR/CBC0FD5K8eHDH62zAWkqe3
         sVJu9WMiDmgNXX5N8EifZQWi9Mim9dKX3psUOXfWoiUxUa2vMSloJrNPXbY6XRxANWKF
         VOiwpBdwN93+s/1pidXljjZAFGAUat+L2ZkpXBI3igT5leijo3iL6v1rlkSz6v6QA2E2
         mpOrOMnWFVJGugdN47VEPs1gA57rHLMQqwRMDTY+gq7D9vweJgiTfJv4+2QrsJ5VZq87
         F3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382962; x=1718987762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sy3GGlbh3G2vnmNyR+RwO5HO4iCoGtDW9R/i+yrCC54=;
        b=hv/J8TNnEilznuMMEGbGtDDMZg/uSXd+n9SsuOu7TGfQfars59afr8FZliP1uHjwzE
         po+slFlX8J5mGN6cFkbsK/pestT3zNyOZctbtiuGEwf0tJlVIRn3U+wjwrDd0pG0+GgX
         ZKKWu1rEKc6WSW7J7ddcw63SXSiqNJsA/OgdAmQlnyMKzRBsAGpWK/LDg4TaV5A6bNoC
         0sbZe6LPopPAZA9u+GmPTB523aCappJ07AGPcXdY9Ee1CjPjOhAdalZSONFGTo3qnJGi
         bSqrRVNLZRPbxGTfH7BX0iqJr2zaDqxO47FlswsN7VNtW+Ba3jO7Tu5tleABP2kFsWVS
         BByw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIiLjfXZgWd+0InSTqYbu11nWA3tTMuufl4xof+mo4ZTNT6IUdj2d6JOVH1q3j+P+fMetLHqBjAKJQa8E/BETInidXOa1IOpmm928=
X-Gm-Message-State: AOJu0YwU/7MFXP1dmNKRiGEMWWahq5ISu7BVaXIHwa285COhVyH2lt9R
	aC90jz6RgwuZQB97L82++RkvR/phVmFF290UGI7kKxXQy56h2uXFX6GpcPlnPmE=
X-Google-Smtp-Source: 
 AGHT+IGObyo93x6mViEfQkk8dvpSrxYPk4M/l+DCC0LbAFJwHdY+8GEZYaPp5jt0ycxMk4ErP7bBog==
X-Received: by 2002:a05:651c:153:b0:2ec:19a6:d5c8 with SMTP id
 38308e7fff4ca-2ec19a6da8emr14442551fa.12.1718382962310;
        Fri, 14 Jun 2024 09:36:02 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:36:02 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/4] ARM: lpc32xx: Add pl08x virtual dma channels for spi
 and i2s
Date: Fri, 14 Jun 2024 18:34:51 +0200
Message-Id: <20240614163500.386747-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PUPPUVF7NDCZF7A4NNC4O3LN55ABXI4Z
X-Message-ID-Hash: PUPPUVF7NDCZF7A4NNC4O3LN55ABXI4Z
X-Mailman-Approved-At: Tue, 18 Jun 2024 05:28:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUPPUVF7NDCZF7A4NNC4O3LN55ABXI4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some of the signals are multiplexed, multiplexer configured at a signal
request.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v3:
- Split previous commit for separate subsystems
- Add pl08x virtual dma channels for i2s1
- Add dma mux handling, required when requesting tx dma signal for i2s1

 arch/arm/mach-lpc32xx/phy3250.c | 111 +++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 5371bfaed799..2ec0411964f9 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -9,14 +9,18 @@
  */
 
 #include <linux/amba/pl08x.h>
+#include <linux/amba/pl022.h>
 #include <linux/mtd/lpc32xx_mlc.h>
 #include <linux/mtd/lpc32xx_slc.h>
 #include <linux/of_platform.h>
+#include <linux/spinlock.h>
 
 #include <asm/mach/arch.h>
 #include "common.h"
 #include "lpc32xx.h"
 
+static DEFINE_SPINLOCK(lpc32xx_pl08x_lock);
+
 static struct pl08x_channel_data pl08x_slave_channels[] = {
 	{
 		.bus_id = "nand-slc",
@@ -30,11 +34,97 @@ static struct pl08x_channel_data pl08x_slave_channels[] = {
 		.max_signal = 12,
 		.periph_buses = PL08X_AHB1,
 	},
+	{
+		.bus_id = "i2s0-tx",
+		.min_signal = 13,
+		.max_signal = 13,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s0-rx",
+		.min_signal = 0,
+		.max_signal = 0,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s1-tx",
+		.min_signal = 10,
+		.max_signal = 10,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s1-rx",
+		.min_signal = 2,
+		.max_signal = 2,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp0-tx",
+		.min_signal = 15,
+		.max_signal = 15,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp0-rx",
+		.min_signal = 14,
+		.max_signal = 14,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp1-tx",
+		.min_signal = 11,
+		.max_signal = 11,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp1-rx",
+		.min_signal = 3,
+		.max_signal = 3,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+};
+
+struct lpc32xx_pl08x_mux {
+	int signal;
+	void __iomem *addr;
+	int bit;
+};
+
+/* From LPC32x0 User manual "3.2.1 DMA request signals" */
+static const struct lpc32xx_pl08x_mux dma_mux[] = {
+	{3, LPC32XX_CLKPWR_SSP_CLK_CTRL, 5},
+	{10, LPC32XX_CLKPWR_I2S_CLK_CTRL, 4},
+	{11, LPC32XX_CLKPWR_SSP_CLK_CTRL, 4},
+	{14, LPC32XX_CLKPWR_SSP_CLK_CTRL, 3},
+	{15, LPC32XX_CLKPWR_SSP_CLK_CTRL, 2},
 };
 
 static int pl08x_get_signal(const struct pl08x_channel_data *cd)
 {
-	return cd->min_signal;
+	const int signal = cd->min_signal;
+	unsigned long flags;
+	int i, tmp;
+
+	/* Set corresponding dma mux bit if muxed */
+	for (i = 0; i < ARRAY_SIZE(dma_mux); i++) {
+		if (dma_mux[i].signal == signal) {
+			spin_lock_irqsave(&lpc32xx_pl08x_lock, flags);
+			tmp = __raw_readl(dma_mux[i].addr);
+			if (cd->muxval)
+				tmp |= BIT(dma_mux[i].bit);
+			else
+				tmp &= ~BIT(dma_mux[i].bit);
+			__raw_writel(tmp, dma_mux[i].addr);
+			spin_unlock_irqrestore(&lpc32xx_pl08x_lock, flags);
+			break;
+		}
+	}
+	return signal;
 }
 
 static void pl08x_put_signal(const struct pl08x_channel_data *cd, int ch)
@@ -61,12 +151,31 @@ static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
 	.dma_filter = pl08x_filter_id,
 };
 
+static struct pl022_ssp_controller lpc32xx_ssp_data[] = {
+	{
+		.bus_id = 0,
+		.enable_dma = 0,
+		.dma_filter = pl08x_filter_id,
+		.dma_tx_param = "ssp0-tx",
+		.dma_rx_param = "ssp0-rx",
+	},
+	{
+		.bus_id = 1,
+		.enable_dma = 0,
+		.dma_filter = pl08x_filter_id,
+		.dma_tx_param = "ssp1-tx",
+		.dma_rx_param = "ssp1-rx",
+	}
+};
+
 static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
 	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
 		       &lpc32xx_slc_data),
 	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
 		       &lpc32xx_mlc_data),
+	OF_DEV_AUXDATA("arm,pl022", 0x20084000, NULL, &lpc32xx_ssp_data[0]),
+	OF_DEV_AUXDATA("arm,pl022", 0x2008c000, NULL, &lpc32xx_ssp_data[1]),
 	{ }
 };
 
-- 
2.25.1

