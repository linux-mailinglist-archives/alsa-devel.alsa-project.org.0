Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D49272A9049
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 08:27:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 682BC1657;
	Fri,  6 Nov 2020 08:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 682BC1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604647664;
	bh=aRUGIph0YXi4UygsMpt/2q4qan/PSku/b/cmikDsL1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXPlymMHU0aYspIegpEoKa8+5X1NdZOziNYo+gWjhpoBwhQb+0t2Z8DPaX6ziWkjN
	 RP/w2SUzQGRnVILH6KoQOXyTuQmz89WucUg0X8DcrN+F3YRW09EugBkEP2RvljOR8m
	 40we3c7JGlZZswixGJHRo/q+tE789y3bVESSzumg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7881AF80234;
	Fri,  6 Nov 2020 08:25:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84B3AF80127; Fri,  6 Nov 2020 08:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0FD6F80127
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 08:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0FD6F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jTy5jcOb"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A67PCIo113999;
 Fri, 6 Nov 2020 01:25:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604647512;
 bh=hLwB0yvkAbuu0K6BFv8KsojiE7ulcNHaTe6oYEqmcH0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jTy5jcObWR3qtm0B2UZeYMVT2EfpbuL68z0h693r/Jc6nazRwaNNTadk/63GCNVFJ
 Qi8r8WhYZzVohtN1gdr7OdePlmeaHEfb+OoktbSmcaZByUitISQ7oVhXOKq8/IVnbs
 FdAdguVzCL40n7BMsto1RZUvzk/iW+dpyOgLhYkg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A67PC3s087850
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 01:25:12 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 01:25:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 01:25:12 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A67P8Su113537;
 Fri, 6 Nov 2020 01:25:10 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/4] ASoC: ti: davinci-mcasp: Use
 platform_get_irq_byname_optional
Date: Fri, 6 Nov 2020 09:25:48 +0200
Message-ID: <20201106072551.689-2-peter.ujfalusi@ti.com>
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

Depending on the integration of McASP either the 'common' or the
'rx' and 'tx' or only the 'tx' interrupt number is valid, provided.

By switching to platform_get_irq_byname_optional() we can clean up the
bootlog from messages like:

davinci-mcasp 2ba0000.mcasp: IRQ common not found

The irq number == 0 is not valid, fix the check at the same time.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 31488593c4f1..91238fe92edb 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2202,8 +2202,8 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 
 	mcasp->dev = &pdev->dev;
 
-	irq = platform_get_irq_byname(pdev, "common");
-	if (irq >= 0) {
+	irq = platform_get_irq_byname_optional(pdev, "common");
+	if (irq > 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_common",
 					  dev_name(&pdev->dev));
 		if (!irq_name) {
@@ -2223,8 +2223,8 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		mcasp->irq_request[SNDRV_PCM_STREAM_CAPTURE] = ROVRN;
 	}
 
-	irq = platform_get_irq_byname(pdev, "rx");
-	if (irq >= 0) {
+	irq = platform_get_irq_byname_optional(pdev, "rx");
+	if (irq > 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_rx",
 					  dev_name(&pdev->dev));
 		if (!irq_name) {
@@ -2242,8 +2242,8 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		mcasp->irq_request[SNDRV_PCM_STREAM_CAPTURE] = ROVRN;
 	}
 
-	irq = platform_get_irq_byname(pdev, "tx");
-	if (irq >= 0) {
+	irq = platform_get_irq_byname_optional(pdev, "tx");
+	if (irq > 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_tx",
 					  dev_name(&pdev->dev));
 		if (!irq_name) {
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

