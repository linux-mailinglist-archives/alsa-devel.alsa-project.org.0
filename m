Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5F91DF16
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:25:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CC26211B;
	Mon,  1 Jul 2024 14:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CC26211B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836708;
	bh=6sE8+DXCGSp6H4fp7z/fe9qbBtCAiv4r4DBp6uCAyRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AZp1scZPdai/DNFtYxZyqt2pfWo3GiM2jFRWWHeEze9p+bUCPk5j+QWymTOB3eSz6
	 YAs8ollUoFv66BUsZHMZRGcjrvPkwvOA3qGr3Va/iSk0hkGVz0eQJL/HFWrBAD1Qd+
	 29bO2RK1ZI60RpNLAwzzBpecTB9JQEQi1OV3HGMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F15FF8961D; Mon,  1 Jul 2024 14:20:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF4BF8961D;
	Mon,  1 Jul 2024 14:20:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 476A3F8023A; Thu, 20 Jun 2024 20:00:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92EA4F801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 20:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EA4F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BCvcTYAC
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52c8c0d73d3so1270769e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906428;
 x=1719511228; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVPBRJfKHWyc96AOmdAfEJ3BssO+zu7Jq4tEfUKaFJs=;
        b=BCvcTYAC73MHQ5DunpEskIgN4dCW7nqeRvixNOEja0EdGhXt7/nuhjc28e/SiiQASw
         /08E9BOFmQr85KkNMVaF8m+GffetPhoI5RLcGQ/2gzprzkE0zIBcgbpk4RLbzGPa63Xf
         6gI3+G8HlFP2N45ZVr/mqx8VbU7nf4sAM7ZBSh7d5ZD2MZiuUdEwnmsGHsJw8rD3rmbv
         dboCW9a766BIVK5KZk1F6/A87uJLtan8zbO83+B1wYyQcsu7q04WCDlxq8vAeEU+xdlD
         U9mLI8uEEh7G1OGU687YbyNB4t3qjMR+99YGCJnfbRgtUAeZ5d8sFG2mwq6aJmI1FE7G
         yeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906428; x=1719511228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVPBRJfKHWyc96AOmdAfEJ3BssO+zu7Jq4tEfUKaFJs=;
        b=gXT0Gr5QZUygbA/q0v/xe65IIHgCdBEZO8Qk4+la/nWnPk/3JsVAlvVOxnKd0rZ+wi
         d1E45ljzIvesGHQF3O+mVeXtjjSik7/4oObD4iD2XxMuHZrRKeoAfYlZPpDjD44WLGqC
         jH63skAO/6thQi3Q/mt3e6yDUxDRAa3RpMeMWmk4jgfEZhGucvpEuNnZ04SWH4ZZ2bn0
         8GU/RHdlP3Sv5EJY5BlyX2cnEBjka/OX+E4uytFJR6S4ve7xuzKCrrWGLMuS9/hImn9T
         q/hQz/oe0ydITV9zSI1uiN7FMBoxFs7ZzY/Yss2v+Wu5DXdo1MejcdcssvHn5P72M/1i
         NuKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWogOKL8kvpN4btV+XKbP1u5ak2Q4jvD8RvxHODBkYaVgOIr23SlKpKE91GCOmLyeBWhzvv/Bk8QiVJvum5mMMWifrAastXi2zXAwE=
X-Gm-Message-State: AOJu0YwUq6w6G7HbPZ1Hg6TYSDy/PJjcRbI+v4I8g6ALU9V8jeuoDReB
	UWw9ux2z90/jIryEAoisxSEF7uZSWPqGfQYVDmvX56YukDbz7wm1uGGMA7/A9xAqta+pZFl0gMu
	wFHk=
X-Google-Smtp-Source: 
 AGHT+IFVaUnSlA61/1PdUe+3ctCyCQUmvx5dNR8/UMkHsGGn+PNCWFlaBmoRzTkawVAPhFlr29t8ZQ==
X-Received: by 2002:ac2:4466:0:b0:52b:f2ab:1303 with SMTP id
 2adb3069b0e04-52ccaa5bd8dmr3307793e87.28.1718906428467;
        Thu, 20 Jun 2024 11:00:28 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:00:28 -0700 (PDT)
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
Subject: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels using DT
 entries
Date: Thu, 20 Jun 2024 19:56:39 +0200
Message-Id: <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VMYHOFMIXIVVQ7P4DVLPOESA2LYKC6FP
X-Message-ID-Hash: VMYHOFMIXIVVQ7P4DVLPOESA2LYKC6FP
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMYHOFMIXIVVQ7P4DVLPOESA2LYKC6FP/>
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
Changes for v4:
- This patch is new in v4

 drivers/mtd/nand/raw/lpc32xx_mlc.c | 10 +---------
 drivers/mtd/nand/raw/lpc32xx_slc.c | 10 +---------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 677fcb03f9be..e504e3c5af11 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -574,15 +574,7 @@ static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
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
 		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
 		return -EBUSY;
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 1c5fa855b9f2..f83a31411bde 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -721,15 +721,7 @@ static int lpc32xx_nand_dma_setup(struct lpc32xx_nand_host *host)
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
 		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
 		return -EBUSY;
-- 
2.25.1

