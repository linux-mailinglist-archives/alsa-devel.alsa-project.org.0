Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F5157D1B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE7C1678;
	Mon, 10 Feb 2020 15:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE7C1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581343922;
	bh=Hbi9MFsJo7XXReAqzscA2NMTjsf/YLcaiapYtWlNWZQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J6AqVsnCDuCU576LdSPEgLXAEobxeHJKBG1Pzv1Kwglb0euoVqsJ2KHBkhHYQNHa7
	 EnCisrHDn38BivAmtMbWju5h+YHQ2yOt3VG1ES1xDdPB7llVAQ2IsuoztaDOx+3Fy0
	 SvTUWA4AH+ksRN9/62q5Cafxa+QrbPlEbeda5fQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41BABF800FD;
	Mon, 10 Feb 2020 15:10:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B90CF80257; Mon, 10 Feb 2020 15:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92387F8014F
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92387F8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Jjf4x7jB"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AE9qS7042987;
 Mon, 10 Feb 2020 08:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581343792;
 bh=cm293yHji6PGrvvbZmsqRYdQgRahNZOXOB0OOj4pUzk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Jjf4x7jB9mKlKlThxl++zJo3uAduPnn0LzaUydPDopY7bJDl6CP/DrXgHx4mvrmuX
 WLrE5m4akaWo2bw7DUEAxOvkufLWUFeCWglhLebeB2DiLukqosNZpIuXFSxTX6Y5sD
 lEry0BdK9QZBQhYn5+I6ar/vnIuIwEq3eZ3R+2ck=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AE9qcP122649;
 Mon, 10 Feb 2020 08:09:52 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 08:09:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 08:09:52 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AE9lrv046182;
 Mon, 10 Feb 2020 08:09:51 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 10 Feb 2020 16:09:50 +0200
Message-ID: <20200210140950.11090-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210140950.11090-1-peter.ujfalusi@ti.com>
References: <20200210140950.11090-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/2] ASoC: ti: davinci-mcasp: Add support for
	platforms using UDMA
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

k3 devices including am654 and j721e are using UDMA

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/Kconfig         | 4 +++-
 sound/soc/ti/davinci-mcasp.c | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index bf85a160a523..c5408c129f34 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "Audio support for Texas Instruments SoCs"
-depends on DMA_OMAP || TI_EDMA || COMPILE_TEST
+depends on DMA_OMAP || TI_EDMA || TI_K3_UDMA || COMPILE_TEST
 
 config SND_SOC_TI_EDMA_PCM
 	tristate
@@ -28,6 +28,7 @@ config SND_SOC_DAVINCI_MCASP
 	tristate "Multichannel Audio Serial Port (McASP) support"
 	select SND_SOC_TI_EDMA_PCM
 	select SND_SOC_TI_SDMA_PCM
+	select SND_SOC_TI_UDMA_PCM
 	help
 	  Say Y or M here if you want to have support for McASP IP found in
 	  various Texas Instruments SoCs like:
@@ -35,6 +36,7 @@ config SND_SOC_DAVINCI_MCASP
 	  - Sitara line of SoCs (AM335x, AM438x, etc)
 	  - DRA7x devices
 	  - Keystone devices
+	  - K3 devices (am654, j721e)
 
 config SND_SOC_DAVINCI_VCIF
 	tristate "daVinci Voice Interface (VCIF) support"
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index e1e937eb1dc1..d9c3a3210a24 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -38,6 +38,7 @@
 
 #include "edma-pcm.h"
 #include "sdma-pcm.h"
+#include "udma-pcm.h"
 #include "davinci-mcasp.h"
 
 #define MCASP_MAX_AFIFO_DEPTH	64
@@ -1875,6 +1876,7 @@ static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
 enum {
 	PCM_EDMA,
 	PCM_SDMA,
+	PCM_UDMA,
 };
 static const char *sdma_prefix = "ti,omap";
 
@@ -1912,6 +1914,8 @@ static int davinci_mcasp_get_dma_type(struct davinci_mcasp *mcasp)
 	dev_dbg(mcasp->dev, "DMA controller compatible = \"%s\"\n", tmp);
 	if (!strncmp(tmp, sdma_prefix, strlen(sdma_prefix)))
 		return PCM_SDMA;
+	else if (strstr(tmp, "udmap"))
+		return PCM_UDMA;
 
 	return PCM_EDMA;
 }
@@ -2371,6 +2375,9 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	case PCM_SDMA:
 		ret = sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
 		break;
+	case PCM_UDMA:
+		ret = udma_pcm_platform_register(&pdev->dev);
+		break;
 	default:
 		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
 	case -EPROBE_DEFER:
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
