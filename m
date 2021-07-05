Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB003BC338
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06DF116FB;
	Mon,  5 Jul 2021 21:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06DF116FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625514211;
	bh=/ReaHfwIGJD6sQuocNt0pUwq6a+0OOj6mszgqEmHIeg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tiolj7nYtLz3YOlVVuEcccs2ieT1X4p25xtAjHbgpSp5NgRq/H2/vu7xPZrEID7as
	 v2uVJp5YB6nQfyRri4kA2dQhUJcP5ZSoaOFIKApVAbDYuqPadW3LeW7ZOS46Q0U/0d
	 yQlRwwE9bL8saZUHNnDK0JUq0UnlTBQNluoZcyec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2068CF804F2;
	Mon,  5 Jul 2021 21:40:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E7A0F804E4; Mon,  5 Jul 2021 21:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D37FF8025C
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D37FF8025C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uevef/jx"
Received: by mail-lj1-x22f.google.com with SMTP id w11so26045771ljh.0
 for <alsa-devel@alsa-project.org>; Mon, 05 Jul 2021 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Of8Vz+AlX9OJfwp1F1M1cBJeQ7g9UEr/Kf9uzSlhTsA=;
 b=uevef/jxFwawTS1dkrJ17zLsjRlPBa3IJneGPZxnDTr+DdAOWdECBnDWII+1YEEHkh
 +92qew6vPXky3Ytnxcu8RniKkeTxnKDbyQbktuc7VxtTy7aDYirMHas49owcFTcqQhp4
 jZfHKf1IoZk9xvlOA6I34KjFSj8tv2c3O3sHZYTDCHQt5Cdy0g283sWR1nkkMsKR28L6
 BE9i4yB9LTl85HItm2rhKjoFNZnKjiLldrkVqZsSAL4Y0Mn7uksVevOMj+Mkdnqo0DYG
 qALEwLe53R5cXWKzUuv2D8op64/5uz8z2sg/kxeAYSKuAGYGh15HnZZAdBAMU20qBscF
 OwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Of8Vz+AlX9OJfwp1F1M1cBJeQ7g9UEr/Kf9uzSlhTsA=;
 b=pYNFqnFdMMsdeBai57MsU/VwKSokrdznd7hp1In8Jt6bPjG45wGrkjTzkHFVb3lb12
 q7D2pjM8d9XY9aYGR6Er+LmLjUyKNEs8YoBd6Vh/GjlFGirjtNhy8Jn0GsPy2HQg2VTC
 wwUv4FkXuQUkViHGlwVYNJwNpydHVN3DsXdOT6PLT1h8Gl1r7mMhKb4WBhlVpoUIsoqe
 JVd7gn8dqmkSQVGM7xje68eVRVr9rtLp3A9QeanjLHE/gYts/Nol1giawhhQHxhZGcAF
 FxlU4QzITqXDJh875pIg5HCYx2cFCa8QFpONsHBqA82GUUt3fw+u7ZlX61X3U+CM9cu8
 Z5Tw==
X-Gm-Message-State: AOAM532ok3GW1hLNwV/eKeyAbeNt3uKnIlg9bamLb2+Kxm9k7rWfZS/E
 /XWHoN2hjKfepsXXd6g5+zk=
X-Google-Smtp-Source: ABdhPJzoRpbY9jPi2xgrW7OHuDXYvKKdgUsA72NLPLjMgiMjHdTPI5WDbSt9JYiy2eLOx9JWWVDiAg==
X-Received: by 2002:a2e:9d59:: with SMTP id y25mr12171169ljj.399.1625514034643; 
 Mon, 05 Jul 2021 12:40:34 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 12:40:34 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH v2 3/5] ASoC: ti: davinci-mcasp: Add support for the OMAP4
 version of McASP
Date: Mon,  5 Jul 2021 22:42:47 +0300
Message-Id: <20210705194249.2385-4-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com
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

From: Peter Ujfalusi <peter.ujfalusi@ti.com>

There is a single McASP on OMAP4 (and OMAP5) which is configured to only
support DIT playback mode on a single serializer.

Add 0x200 offset to DAT port address as the TRM suggests it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 include/linux/platform_data/davinci_asp.h |  1 +
 sound/soc/ti/Kconfig                      |  1 +
 sound/soc/ti/davinci-mcasp.c              | 26 ++++++++++++++++++++---
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/linux/platform_data/davinci_asp.h b/include/linux/platform_data/davinci_asp.h
index 5d1fb0d78a22..76b13ef67562 100644
--- a/include/linux/platform_data/davinci_asp.h
+++ b/include/linux/platform_data/davinci_asp.h
@@ -96,6 +96,7 @@ enum {
 	MCASP_VERSION_2,	/* DA8xx/OMAPL1x */
 	MCASP_VERSION_3,        /* TI81xx/AM33xx */
 	MCASP_VERSION_4,	/* DRA7xxx */
+	MCASP_VERSION_OMAP,	/* OMAP4/5 */
 };
 
 enum mcbsp_clk_input_pin {
diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 698d7bc84dcf..1d9fe3fca193 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_DAVINCI_MCASP
 	  various Texas Instruments SoCs like:
 	  - daVinci devices
 	  - Sitara line of SoCs (AM335x, AM438x, etc)
+	  - OMAP4
 	  - DRA7x devices
 	  - Keystone devices
 	  - K3 devices (am654, j721e)
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 64ec6d485834..56a19eeec5c7 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1794,6 +1794,12 @@ static struct davinci_mcasp_pdata dra7_mcasp_pdata = {
 	.version = MCASP_VERSION_4,
 };
 
+static struct davinci_mcasp_pdata omap_mcasp_pdata = {
+	.tx_dma_offset = 0x200,
+	.rx_dma_offset = 0,
+	.version = MCASP_VERSION_OMAP,
+};
+
 static const struct of_device_id mcasp_dt_ids[] = {
 	{
 		.compatible = "ti,dm646x-mcasp-audio",
@@ -1811,6 +1817,10 @@ static const struct of_device_id mcasp_dt_ids[] = {
 		.compatible = "ti,dra7-mcasp-audio",
 		.data = &dra7_mcasp_pdata,
 	},
+	{
+		.compatible = "ti,omap4-mcasp-audio",
+		.data = &omap_mcasp_pdata,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mcasp_dt_ids);
@@ -2350,10 +2360,17 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 
 	dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
 	dma_data->filter_data = "tx";
-	if (dat)
+	if (dat) {
 		dma_data->addr = dat->start;
-	else
+		/*
+		 * According to the TRM there should be 0x200 offset added to
+		 * the DAT port address
+		 */
+		if (mcasp->version == MCASP_VERSION_OMAP)
+			dma_data->addr += davinci_mcasp_txdma_offset(mcasp->pdata);
+	} else {
 		dma_data->addr = mem->start + davinci_mcasp_txdma_offset(mcasp->pdata);
+	}
 
 
 	/* RX is not valid in DIT mode */
@@ -2418,7 +2435,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		ret = edma_pcm_platform_register(&pdev->dev);
 		break;
 	case PCM_SDMA:
-		ret = sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
+		if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE)
+			ret = sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
+		else
+			ret = sdma_pcm_platform_register(&pdev->dev, "tx", NULL);
 		break;
 	case PCM_UDMA:
 		ret = udma_pcm_platform_register(&pdev->dev);
-- 
2.32.0

