Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7C491DF66
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:35:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931DB2BFE;
	Mon,  1 Jul 2024 14:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931DB2BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837317;
	bh=p5CJPkIQTWB8uzvXru7xjOtLt2s3gbP3ldoTOznVVpY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FqidwuCOAq8fyG/sDXm7+lUf8T9MpVAQRAg3hRReWzF5ZXCQ1tORee+WQYJiJHsvW
	 ut6eliafGPSOo0cF62GWyK5WzSOBqlaFaWKv4utVRlBFgL7dUsHPmbQ/lVEmPmaq+h
	 O3PjjFCO2bPZFX0UDdi9KwcAYtM6Pj28v4Cg4Yyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDFECF89A2C; Mon,  1 Jul 2024 14:23:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C765F89A57;
	Mon,  1 Jul 2024 14:23:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77403F80423; Thu, 27 Jun 2024 17:04:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E379F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E379F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1q4bsUcS
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a724b4f1218so697069966b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500680;
 x=1720105480; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kKU0V25b+NdpL5Nxb/CadexmGEKpxevd8xM2vqH8ko=;
        b=1q4bsUcSzTto9KXmzBHRZyKoWxrvSHp4Qi3tVfbj/3pXYeZIfNz5m+gyqH77a9vjRV
         DGALk3mvZ0mq1Cm6HcgxMO1mO2irU4rCV9R3SDRqkBzcyFz8KwcYgEUkmDr8q63EaUcQ
         LPmeb0ELHZurtjBWQx1p4teDVZeG6yFRS4VQrii2AClsAnHaSV2ypu5GC2VC5TSqQRub
         53VBzwlM7GTGw5oCFU6lBfborpXbQ7+Q8vP2UoAVfIa0roGJLYC7u98ol9xztvHsLY0x
         6m6m1/qSFiBlI6YeOUekgWUR2S/PWGFOEKoQgTDUsA6esGNXK6IOfcREo++6nu/Fzsb7
         WoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500680; x=1720105480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kKU0V25b+NdpL5Nxb/CadexmGEKpxevd8xM2vqH8ko=;
        b=KZLOgJILyVW/MgVmG6XypE/89DH+wrzOUFOkOSofM61ylBdYCb6NhbeoNQrv+jSoWQ
         F9dFgG3TfrWMz2me1TDC6LUJHtQN1MiuBDZYAJiysZexLY0zZfGgNOQwox7HUzjWve7h
         gaEtgG/XEm5QlehDsTOd/1crcJjM64pe7YJgd5ggJQpEthyNFcr8uecker7W3ukZoGgQ
         yacLoEMaB3Ykgh81gDNz41mCfKOnwMzEl9kOwNqBTa2LOYTJI+RUA020B1UkN4Is3BnL
         hfHP06MS0wcODg+2o3fUMkI4yQIvTnrCJzcsMTRKNuCPglqYKQIgVpQz9q5vj1USrXeJ
         6hLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5sPqnjaVaJhJSNrPF2VwlN3GNxY3ly5pdB+5XQ76cDFUAI2ttei85x2Cq4q13cMjxofG2+Ch+7zrZvoCYUNj0Wbjg3kDU3vC3I/s=
X-Gm-Message-State: AOJu0YxUdZm/pVmouCFxX8pQWYhxhOezzlqZe8z5sY8O4BNsAZ2HIdYy
	HNIXRlfjjFxgeHmmwaNNPvoi8s+0HespIe5Zz76HEgjTq0uePwmlOo7Z1F8kIRc=
X-Google-Smtp-Source: 
 AGHT+IEDRv7diooeJV6LJXwf0EjCsVi9YKqxuCA0IYC1Rui0S1k3Zcq9kDuWbuWeuGO8t2Iv/ci0ng==
X-Received: by 2002:a17:906:d509:b0:a6f:5192:6f4d with SMTP id
 a640c23a62f3a-a7242c4dfd3mr693613366b.8.1719500679193;
        Thu, 27 Jun 2024 08:04:39 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:04:38 -0700 (PDT)
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
Subject: [Patch v5 10/12] mtd: rawnand: lpx32xx: Request DMA channels using DT
 entries
Date: Thu, 27 Jun 2024 17:00:28 +0200
Message-Id: <20240627150046.258795-11-piotr.wojtaszczyk@timesys.com>
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
Message-ID-Hash: CQB75IDCBV226UXAGBVBC3T4HT4OKCVP
X-Message-ID-Hash: CQB75IDCBV226UXAGBVBC3T4HT4OKCVP
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQB75IDCBV226UXAGBVBC3T4HT4OKCVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move away from pl08x platform data towards device tree.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Added fallback dma channel request for backward compatibility with DMA with
  platform data instead DT

Changes for v4:
- This patch is new in v4

 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 +++++++++++++++-----------
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 +++++++++++++++-----------
 2 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 677fcb03f9be..92cebe871bb4 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -574,18 +574,22 @@ static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
 	dma_cap_mask_t mask;
 
-	if (!host->pdata || !host->pdata->dma_filter) {
-		dev_err(mtd->dev.parent, "no DMA platform data\n");
-		return -ENOENT;
-	}
-
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-	host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter,
-					     "nand-mlc");
+	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
 	if (!host->dma_chan) {
-		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
-		return -EBUSY;
+		/* fallback to request using platform data */
+		if (!host->pdata || !host->pdata->dma_filter) {
+			dev_err(mtd->dev.parent, "no DMA platform data\n");
+			return -ENOENT;
+		}
+
+		dma_cap_zero(mask);
+		dma_cap_set(DMA_SLAVE, mask);
+		host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter, "nand-mlc");
+
+		if (!host->dma_chan) {
+			dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+			return -EBUSY;
+		}
 	}
 
 	/*
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 1c5fa855b9f2..3b7e3d259785 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -721,18 +721,22 @@ static int lpc32xx_nand_dma_setup(struct lpc32xx_nand_host *host)
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
 	dma_cap_mask_t mask;
 
-	if (!host->pdata || !host->pdata->dma_filter) {
-		dev_err(mtd->dev.parent, "no DMA platform data\n");
-		return -ENOENT;
-	}
-
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-	host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter,
-					     "nand-slc");
+	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
 	if (!host->dma_chan) {
-		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
-		return -EBUSY;
+		/* fallback to request using platform data */
+		if (!host->pdata || !host->pdata->dma_filter) {
+			dev_err(mtd->dev.parent, "no DMA platform data\n");
+			return -ENOENT;
+		}
+
+		dma_cap_zero(mask);
+		dma_cap_set(DMA_SLAVE, mask);
+		host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter, "nand-slc");
+
+		if (!host->dma_chan) {
+			dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+			return -EBUSY;
+		}
 	}
 
 	return 0;
-- 
2.25.1

