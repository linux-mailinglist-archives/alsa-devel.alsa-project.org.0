Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CED6197B2
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 14:23:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB271697;
	Fri,  4 Nov 2022 14:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB271697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667568206;
	bh=WndZy37xOe3aVBLTVIE48KZ8X7BZ9SOXr6PWvdPY3Kg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=epNWcxGZxhYJW/rUmXUdioG2cGAe5gpXDXZ6akuSAPsUVX+7JZB5oU981FbaeJpWN
	 3dmtjsUKOclMfsr+hZHNZxoE44TfMNjarGWbT3eZXSCOiQtBWa4HBH+TJAecuez9t1
	 aAdZPGltIq65X1g5fPxmnTJbGp+4GzBG/omFL1GY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23A55F801D5;
	Fri,  4 Nov 2022 14:22:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA898F801D5; Fri,  4 Nov 2022 14:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EACEFF801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 14:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EACEFF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="m7O9pLOW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A47mkSU006593; Fri, 4 Nov 2022 08:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=4pgVcvB8mbH5TGlS6atFEpzhB/zYR1p6PQrBMN0cqpE=;
 b=m7O9pLOWTcFuu6yfVu0TBrpSPnpyV5nGCEPlWXY+A6eUxmkUKaq8P4oW9GTnlCU5PfPo
 99wsOpMfcjIcoAQc/K4GQoio40pd36kZ02TTyQYKPQapZP+WAdQhgNlyjXU84hWaklJg
 lCTUuUMbmalrzTa1cbpjMd2fe3bIPAIVVGx6+eHgUBrPQ5RjYJT++odIQ0SS2z2jAp1V
 9DgOGgShqkCldavHwxUF85puRRIzjJ7lyn7DfJV7Xd9Xg3Zt1lXOZbJh0oMu0kOzpX/C
 Gw/FiOw9vbjmm2Z+t5DMBwjgW8BeSv75ACYeizuLLJJlyl5/U3wpe1Z5yEXvuBC2Ldqj 3Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kmpgcgt98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 08:22:21 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Fri, 4 Nov
 2022 08:22:20 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Fri, 4 Nov 2022 08:22:20 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.97])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CEFF946C;
 Fri,  4 Nov 2022 13:22:19 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
Date: Fri, 4 Nov 2022 13:22:13 +0000
Message-ID: <20221104132213.121847-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fWI2S9PPXl7eF3HV6NjbLqkcIhYbmdIQ
X-Proofpoint-GUID: fWI2S9PPXl7eF3HV6NjbLqkcIhYbmdIQ
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, bcousson@baylibre.com,
 misael.lopez@ti.com
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

The DAI tx_mask and rx_mask are set by snd_soc_dai_set_tdm_slot()
and used by later code that depends on the TDM settings. So
__soc_pcm_open() should not be obliterating those mask values.

The code in __soc_pcm_hw_params() uses these masks to calculate the
active channels so that only the AIF_IN/AIF_OUT widgets for the
active TDM slots are enabled. The zeroing of the masks in
__soc_pcm_open() disables this functionality so all AIF widgets
were enabled even for channels that are not assigned to a TDM slot.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2e5894d73789 ("ASoC: pcm: Add support for DAI multicodec")
---
 sound/soc/soc-pcm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d8e4677f3002..493f003273d0 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -822,11 +822,6 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_startup(dai, substream);
 		if (ret < 0)
 			goto err;
-
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			dai->tx_mask = 0;
-		else
-			dai->rx_mask = 0;
 	}
 
 	/* Dynamic PCM DAI links compat checks use dynamic capabilities */
-- 
2.30.2

