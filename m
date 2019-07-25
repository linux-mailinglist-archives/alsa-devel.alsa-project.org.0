Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C886C74935
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 10:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 350F51AC0;
	Thu, 25 Jul 2019 10:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 350F51AC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564043764;
	bh=aH9TAaGilCTcDEyn7O6X2YtOHGpkMvzcgFP14gCPfr8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q5oHmfWRGcJCY1x5RNydOKgdcDZad+rBTpl3pew0v95WcnRS/jQ8th7rApt165P2q
	 6vB29uga5yCQaDpC/bjjdUoPw9sOfQQmdO63sl2/JCTEwQ2sTd/5rk/uTv6uYdbRJ2
	 UAZSSEuTyFRFYllO0o8H0I/qo6gx6SQ2Kuu8gH9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE83FF8044C;
	Thu, 25 Jul 2019 10:34:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37BE4F8044B; Thu, 25 Jul 2019 10:34:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 250C8F800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 10:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 250C8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NvUepNvC"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6P8YDeA121465;
 Thu, 25 Jul 2019 03:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564043653;
 bh=6QbH4yWm8oBtAtvQYInpM7Wl2+geD9zSJ7h+vlIZy4M=;
 h=From:To:CC:Subject:Date;
 b=NvUepNvCQAZlDItZdCVKhhKQDo8gqTp9UPS2dmWxu6XsXOPGODcLu/rIet/U2EwTc
 +Ep6u6Tomso7l9fWlClSWH2m4BaljQNjnRR7g1kuVHpy9woT3D6vJ83U6j8H3iQ4AO
 qAfxpk94atgj47J/+YXLzE9Jecjni/TMio0FPp5s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6P8YDep073310
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Jul 2019 03:34:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 03:34:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 03:34:12 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6P8YAum061353;
 Thu, 25 Jul 2019 03:34:11 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 25 Jul 2019 11:34:11 +0300
Message-ID: <20190725083411.7211-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, misael.lopez@ti.com, jsarha@ti.com
Subject: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Add support for
	RIGHT_J format
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

The formater unit's rotation needs to be programmed differently for right
aligned bus format to have the data moved to the correct place.

Take the opportunity and simplify the formater unit setup code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 43 ++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index ac59b509ead5..09ba3d3c70a0 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -465,6 +465,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		/* FS need to be inverted */
 		inv_fs = true;
 		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_LEFT_J:
 		/* configure a full-word SYNC pulse (LRCLK) */
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, FSXDUR);
@@ -758,34 +759,28 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
 				       int sample_width)
 {
 	u32 fmt;
-	u32 tx_rotate = (sample_width / 4) & 0x7;
+	u32 tx_rotate, rx_rotate, slot_width;
 	u32 mask = (1ULL << sample_width) - 1;
-	u32 slot_width = sample_width;
-
-	/*
-	 * For captured data we should not rotate, inversion and masking is
-	 * enoguh to get the data to the right position:
-	 * Format	  data from bus		after reverse (XRBUF)
-	 * S16_LE:	|LSB|MSB|xxx|xxx|	|xxx|xxx|MSB|LSB|
-	 * S24_3LE:	|LSB|DAT|MSB|xxx|	|xxx|MSB|DAT|LSB|
-	 * S24_LE:	|LSB|DAT|MSB|xxx|	|xxx|MSB|DAT|LSB|
-	 * S32_LE:	|LSB|DAT|DAT|MSB|	|MSB|DAT|DAT|LSB|
-	 */
-	u32 rx_rotate = 0;
 
+	if (mcasp->slot_width)
+		slot_width = mcasp->slot_width;
+	else
+		slot_width = sample_width;
 	/*
-	 * Setting the tdm slot width either with set_clkdiv() or
-	 * set_tdm_slot() allows us to for example send 32 bits per
-	 * channel to the codec, while only 16 of them carry audio
-	 * payload.
+	 * TX rotation:
+	 * right aligned formats: rotate w/ slot_width
+	 * left aligned formats: rotate w/ sample_width
+	 *
+	 * RX rotation:
+	 * right aligned formats: no rotation needed
+	 * left aligned formats: rotate w/ (slot_width - sample_width)
 	 */
-	if (mcasp->slot_width) {
-		/*
-		 * When we have more bclk then it is needed for the
-		 * data, we need to use the rotation to move the
-		 * received samples to have correct alignment.
-		 */
-		slot_width = mcasp->slot_width;
+	if ((mcasp->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) ==
+	    SND_SOC_DAIFMT_RIGHT_J) {
+		tx_rotate = (slot_width / 4) & 0x7;
+		rx_rotate = 0;
+	} else {
+		tx_rotate = (sample_width / 4) & 0x7;
 		rx_rotate = (slot_width - sample_width) / 4;
 	}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
