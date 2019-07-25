Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0174937
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 10:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE81C1AD4;
	Thu, 25 Jul 2019 10:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE81C1AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564043809;
	bh=Qh095k3ycYJdOP3yoJ7zRa+IMc0NvNDGcbcsf3M3lfI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SCIwN96NGt7jP1xyUpH4/DTrQQAcKmyhk5OWYDB3HxSuZpp4/FLrn/Xk3822AFHdO
	 v+HUdv9H9zmBmDBkLiXZ8AkRV4vJBCUx5kmAVrBXFHSj6hU99ZpLl5dNJY7KqCtHa+
	 kyK+J/SAmoGwzqrw4e3MFND806D94GPR+8qEj3Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B971EF80483;
	Thu, 25 Jul 2019 10:34:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 460FDF80481; Thu, 25 Jul 2019 10:34:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8D5EF80392
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 10:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D5EF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BGKQ8ndK"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6P8YOep025632;
 Thu, 25 Jul 2019 03:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564043664;
 bh=C2J/l+/BXBo5t2RdjhXMw0AfBEDGOmzqeCAjFcYO8U8=;
 h=From:To:CC:Subject:Date;
 b=BGKQ8ndKvvVE2wtuVX+wTywea3BEtQw1M3RwhSxkebuvKTo8IV0LCm4Zom/3HXXTO
 JkF2G0v8kTw1/04C71SsDkDyqvmdONJvha79ZqwLlMA+zLymtdqUiFu/HViuVUaNpK
 psRmOz5OuLm8nRsWmaN2NumB860+9PQhQ/1OJ7qw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6P8YONV114953
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 03:34:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 03:34:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 03:34:24 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6P8YMgT061626;
 Thu, 25 Jul 2019 03:34:22 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 25 Jul 2019 11:34:23 +0300
Message-ID: <20190725083423.7321-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, misael.lopez@ti.com, jsarha@ti.com
Subject: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Fix clk PDIR handling
	for i2s master mode
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

When running McASP as master capture alone will not record any audio unless
a parallel playback stream is running. As soon as the playback stops the
captured data is going to be silent again.

In McASP master mode we need to set the PDIR for the clock pins and fix
the mcasp_set_axr_pdir() to skip the bits in the PDIR registers above
AMUTE.

This went unnoticed as most of the boards uses McASP as slave and neither
of these issues are visible (audible) in those setups.

Fixes: 2302be4126f52 ("ASoC: davinci-mcasp: Update PDIR (pin direction) register handling")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 09ba3d3c70a0..6a87455d7c42 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -195,7 +195,7 @@ static inline void mcasp_set_axr_pdir(struct davinci_mcasp *mcasp, bool enable)
 {
 	u32 bit;
 
-	for_each_set_bit(bit, &mcasp->pdir, PIN_BIT_AFSR) {
+	for_each_set_bit(bit, &mcasp->pdir, PIN_BIT_AMUTE) {
 		if (enable)
 			mcasp_set_bits(mcasp, DAVINCI_MCASP_PDIR_REG, BIT(bit));
 		else
@@ -223,6 +223,7 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 	if (mcasp_is_synchronous(mcasp)) {
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
+		mcasp_set_clk_pdir(mcasp, true);
 	}
 
 	/* Activate serializer(s) */
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
