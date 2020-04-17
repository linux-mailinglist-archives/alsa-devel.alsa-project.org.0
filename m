Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D551ADFB7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 16:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449AD1666;
	Fri, 17 Apr 2020 16:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449AD1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587133461;
	bh=j4czl+3DlUGeAquZ+sxAU3nsitvll1kXI87ADfVSxRo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uslou/Jo01f88yQsoCY/rU5JZMqAK4CvUl//4mt1JHZ6wSs/dAI1FTC9R+kwPlwAm
	 shqunagaM1YC0lvCjF+0VT3yny8+lwtsohV3Npz0EldnKYMfMbciaBp/6X5BsCLjYQ
	 MPg5W950v1mjDwb7NHsZ05TA6JgIC/uUWUWaYCAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66770F800AB;
	Fri, 17 Apr 2020 16:22:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1553F80245; Fri, 17 Apr 2020 16:22:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D18E1F800AB
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 16:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D18E1F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="mpgY49qi"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HELjsg018688; Fri, 17 Apr 2020 16:22:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1N4ow54NPmupUQR/g8Mm19WWT06UoLJJN1BbF2J/gJE=;
 b=mpgY49qihD/pmvYqgPzolURf1kuNsS1fs+JsiqEsi15JOR3j0uBqpTxW5mJiUIMQvgjD
 XSNY1fAEb08ojxakT8BwmP/Rxvg0uDDtm0eQt7m5z1eF9nU01qItWNer41sNqpjiqqfD
 j5P34Qq5ImYaVCVxOO/LswVoX4ipSpF/igpkbwRVpeLKj9mp3dJ1UeES6gTU5tBhY6T7
 1HwCIviGcyiL7/+HXTFQmqGxZsPDSeONpzvkVs3ISZ2pBuSXbbgxw8xoFQ0o9l88rKIH
 kE3WQTMIPjbFl+Ha5ZFfmzkxtR44rM81k9Pff5szWBjf4batrUn6i1eAnj2pSThrVhOY Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn8s9yhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 16:22:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F565100038;
 Fri, 17 Apr 2020 16:22:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFA832BC7B8;
 Fri, 17 Apr 2020 16:22:27 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 17 Apr 2020 16:22:26 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>
Subject: [PATCH] ASoC: stm32: sai: fix sai probe
Date: Fri, 17 Apr 2020 16:21:22 +0200
Message-ID: <20200417142122.10212-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_06:2020-04-17,
 2020-04-17 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

pcm config must be set before snd_dmaengine_pcm_register() call.

Fixes: 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 34a7c3d6fb91..41f01c3e639e 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1547,6 +1547,9 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
+		conf = &stm32_sai_pcm_config_spdif;
+
 	ret = snd_dmaengine_pcm_register(&pdev->dev, conf, 0);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
@@ -1556,15 +1559,10 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-	if (ret) {
+	if (ret)
 		snd_dmaengine_pcm_unregister(&pdev->dev);
-		return ret;
-	}
-
-	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
-		conf = &stm32_sai_pcm_config_spdif;
 
-	return 0;
+	return ret;
 }
 
 static int stm32_sai_sub_remove(struct platform_device *pdev)
-- 
2.17.1

