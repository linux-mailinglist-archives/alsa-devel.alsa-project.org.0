Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF02A9048
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 08:27:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB6C7167F;
	Fri,  6 Nov 2020 08:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB6C7167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604647624;
	bh=wOM38mMsJPPuSlrdu5/bfaSYTHkjZRMJiVaS5t4fo6s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFwGJEhmal4822rbFFEOtT2Dvdt0/cPd9JxlBHAnU1k93gb+gGM3BiEkZC49fzZXH
	 CZsZja+RZfF3LUZHYkdeOmBkmqpuzc8gVTVCqe68Qg/uLCjk/jWZjRYRqpOUw7hqLz
	 4yrz29x2bfEm0S3THboIjCwiEO5UzDcEC2xd77AI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE9A7F804B4;
	Fri,  6 Nov 2020 08:25:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF032F8023E; Fri,  6 Nov 2020 08:25:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 005ADF80234
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 08:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 005ADF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LIYIs/3x"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A67PEgP114009;
 Fri, 6 Nov 2020 01:25:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604647514;
 bh=nZGpdeErZ/Fnrtnyt8YoiWMnSoc5EUa5TDtXCuJ0jFU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=LIYIs/3xYdspuhVVT5zF2qbbdyHCdpvEkc0neWHLV7texcY6kr5DIrfyCfnSQooJT
 NU+kI8VT5Dg3BF/6i5yVCNyeTcYQllonavPq1wkwnfTThsVSNv5qW1mr8Vk+8HufcM
 mPU0W7R2HFNYFwzkNotb+5yKC+JcGr8+nf1/FkRY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A67PEj2055934
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 01:25:14 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 01:25:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 01:25:14 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A67P8Sv113537;
 Fri, 6 Nov 2020 01:25:12 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/4] ASoC: ti: davinci-mcasp: Remove legacy dma_request parsing
Date: Fri, 6 Nov 2020 09:25:49 +0200
Message-ID: <20201106072551.689-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201106072551.689-1-peter.ujfalusi@ti.com>
References: <20201106072551.689-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nm@ti.com, tony@atomide.com, alsa-devel@alsa-project.org,
 tomi.valkeinen@ti.com
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

The legacy dma_request (which was holding the DMA request number) is no
longer in use for a long time.
All legacy platforms has been converted to dma_slave_map.

Remove it along with the DT parsing to get tx_dma_channel and
rx_dma_channel.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 57 ++----------------------------------
 1 file changed, 3 insertions(+), 54 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 91238fe92edb..19120bdf747a 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -94,7 +94,6 @@ struct davinci_mcasp {
 	u8	bclk_div;
 	int	streams;
 	u32	irq_request[2];
-	int	dma_request[2];
 
 	int	sysclk_freq;
 	bool	bclk_master;
@@ -1755,7 +1754,6 @@ static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
 	struct davinci_mcasp_pdata *pdata = NULL;
 	const struct of_device_id *match =
 			of_match_device(mcasp_dt_ids, &pdev->dev);
-	struct of_phandle_args dma_spec;
 
 	const u32 *of_serial_dir32;
 	u32 val;
@@ -1810,31 +1808,6 @@ static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
 		pdata->serial_dir = of_serial_dir;
 	}
 
-	ret = of_property_match_string(np, "dma-names", "tx");
-	if (ret < 0)
-		goto nodata;
-
-	ret = of_parse_phandle_with_args(np, "dmas", "#dma-cells", ret,
-					 &dma_spec);
-	if (ret < 0)
-		goto nodata;
-
-	pdata->tx_dma_channel = dma_spec.args[0];
-
-	/* RX is not valid in DIT mode */
-	if (pdata->op_mode != DAVINCI_MCASP_DIT_MODE) {
-		ret = of_property_match_string(np, "dma-names", "rx");
-		if (ret < 0)
-			goto nodata;
-
-		ret = of_parse_phandle_with_args(np, "dmas", "#dma-cells", ret,
-						 &dma_spec);
-		if (ret < 0)
-			goto nodata;
-
-		pdata->rx_dma_channel = dma_spec.args[0];
-	}
-
 	ret = of_property_read_u32(np, "tx-num-evt", &val);
 	if (ret >= 0)
 		pdata->txnumevt = val;
@@ -2127,11 +2100,10 @@ static void davinci_mcasp_get_dt_params(struct davinci_mcasp *mcasp)
 static int davinci_mcasp_probe(struct platform_device *pdev)
 {
 	struct snd_dmaengine_dai_dma_data *dma_data;
-	struct resource *mem, *res, *dat;
+	struct resource *mem, *dat;
 	struct davinci_mcasp_pdata *pdata;
 	struct davinci_mcasp *mcasp;
 	char *irq_name;
-	int *dma;
 	int irq;
 	int ret;
 
@@ -2266,45 +2238,22 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		mcasp->dat_port = true;
 
 	dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
+	dma_data->filter_data = "tx";
 	if (dat)
 		dma_data->addr = dat->start;
 	else
 		dma_data->addr = mem->start + davinci_mcasp_txdma_offset(pdata);
 
-	dma = &mcasp->dma_request[SNDRV_PCM_STREAM_PLAYBACK];
-	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
-	if (res)
-		*dma = res->start;
-	else
-		*dma = pdata->tx_dma_channel;
-
-	/* dmaengine filter data for DT and non-DT boot */
-	if (pdev->dev.of_node)
-		dma_data->filter_data = "tx";
-	else
-		dma_data->filter_data = dma;
 
 	/* RX is not valid in DIT mode */
 	if (mcasp->op_mode != DAVINCI_MCASP_DIT_MODE) {
 		dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+		dma_data->filter_data = "rx";
 		if (dat)
 			dma_data->addr = dat->start;
 		else
 			dma_data->addr =
 				mem->start + davinci_mcasp_rxdma_offset(pdata);
-
-		dma = &mcasp->dma_request[SNDRV_PCM_STREAM_CAPTURE];
-		res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
-		if (res)
-			*dma = res->start;
-		else
-			*dma = pdata->rx_dma_channel;
-
-		/* dmaengine filter data for DT and non-DT boot */
-		if (pdev->dev.of_node)
-			dma_data->filter_data = "rx";
-		else
-			dma_data->filter_data = dma;
 	}
 
 	if (mcasp->version < MCASP_VERSION_3) {
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

