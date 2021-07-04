Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A83BAD9C
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Jul 2021 17:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DE716A2;
	Sun,  4 Jul 2021 17:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DE716A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625411161;
	bh=kXzO3QksjToydUzcnoqOUriPRBXc1hbUrHyWb+j3gYc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h37j+B54tQG9rdYzEx3lPbSkk8FUoZhrevj2SVxZa4Ep2O5M5DJdrYnpGGPAJtYen
	 QPR4Mo+H3ICvwFluKDcJA5WoctzKLpqZ1sYJBjgi1W8IE7WsM/21e0djpFB8ciiNXz
	 8msdkwGwQr+lL2nTMmLT6UGuHzEZFnkRUIyV3Itg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF4CDF804FC;
	Sun,  4 Jul 2021 17:02:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C6DF804FB; Sun,  4 Jul 2021 17:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 914C9F804E1
 for <alsa-devel@alsa-project.org>; Sun,  4 Jul 2021 17:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914C9F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XRsE2Guq"
Received: by mail-lf1-x12a.google.com with SMTP id n14so27694008lfu.8
 for <alsa-devel@alsa-project.org>; Sun, 04 Jul 2021 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aMFV9aMPXhkidl0Shg2y0S/3JmD1x6u1AFTNBB2LV50=;
 b=XRsE2GuqHLNjYcPKFh4G+usOFtZXGs6OxXyN8MvG2q/55q7d7ccdXJbSclCVuT8Wpl
 ylNX+W0PcV0u3lC17mGlGMf9F/q4zxEyfjGJVUziyIo9vtSzCfCvCYcGPSrpj6+OsUNO
 ESsJTQWBlqF/N2fz3dqfJNe4XnEPW9EikWhAwWxCd6PVJ89GoFe1gZL3pfyVz+2ZTgli
 URC+mS85voT0c/qfxlXCTBUCy+Q97Ar6P93NWZ8YWzkF13IQ0DEs+G4xGG6BtTwmzEed
 bETJFzUTRzsl9aJ17oH/keK42+Kyc9BSK9ib2LLT2eEfLMPzHWCKwZqqBblYFCes1KhK
 WIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aMFV9aMPXhkidl0Shg2y0S/3JmD1x6u1AFTNBB2LV50=;
 b=U0eEUjCovg7bH+x24jf15NLfbgO4MbdCo8nyhaf7tx3HwJn+AryVuszj7jy6VAYs9N
 cTCVvN9o2oJ4XPL0mquI/LYSEVj8S2pf3TBobLISp0IjJIRESV4jhnhViGmZqPu6Hyvc
 coGKzLWq0FkMrjKGXrkrYsPZEFUct4qaAhxUiUmjHLTzfR9VUAVkgVgJeNoHzM6ZE+MM
 P+iAk660DnQiwnNpX0rSHw9of89DW4Au6VdXR2sHIELuA8EodNpbXTrdKxYb2n4XIyp9
 Uj23kPnK0jJVzH2kBPC4WwtaKp+PTIhICzhiFHGQ/7ievdy+3qC1re6wnzeuD/A5txFD
 HvPg==
X-Gm-Message-State: AOAM531/c+bxVqve3NGdrbEaB7v38cnA5RuYjkr98Y/RHOG64v3vFhIa
 BLygk/p+jC+oSuiW16UwcU0=
X-Google-Smtp-Source: ABdhPJwO99spGf6BMeG90kmpkwBFy8BTyxCt0IOaDm2fPRF7mSJiXycpHL33FtQvNKitomPB4uPVZA==
X-Received: by 2002:ac2:5f62:: with SMTP id c2mr6238988lfc.156.1625410958698; 
 Sun, 04 Jul 2021 08:02:38 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 08:02:37 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH 3/5] ASoC: ti: davinci-mcasp: Add support for the OMAP4
 version of McASP
Date: Sun,  4 Jul 2021 18:04:48 +0300
Message-Id: <20210704150450.20106-4-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
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
index e56a22c28467..f453728d2afc 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1788,6 +1788,12 @@ static struct davinci_mcasp_pdata dra7_mcasp_pdata = {
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
@@ -1805,6 +1811,10 @@ static const struct of_device_id mcasp_dt_ids[] = {
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
@@ -2344,10 +2354,17 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 
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
@@ -2412,7 +2429,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
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

