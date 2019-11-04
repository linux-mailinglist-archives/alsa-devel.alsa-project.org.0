Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E6EE170
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:40:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E3B1789;
	Mon,  4 Nov 2019 14:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E3B1789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874804;
	bh=1Heg9ux/Q4R5oNljmEMPraDVoAAX20a6IIOxjpjRzlA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SlCdQazVOVj4ukjpYMnFeaQIK2fopwhCW0RaoglZP79EHX/KeHX9Jhxq9dAv+0zz6
	 zO/7wlmOldz5gujQh8rKAlCjxw0w0py2Lct/IAgGz9yRJUq/2mu5Z6aGcObA1wcxpe
	 ZQdG92wgB0ZkZVINC/JbWSyC7tzSysKtOyTR1Cj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C19CF804FE;
	Mon,  4 Nov 2019 14:37:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62AE5F8048D; Mon,  4 Nov 2019 14:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E835CF80321
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E835CF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="MRlR2bfv"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA4DWFkJ026453; Mon, 4 Nov 2019 14:37:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=0V0+n6EoG5ZZ+IdpLsOxLEtGg4+FYYg6VUMRseHZqHA=;
 b=MRlR2bfvQfp6TmzTJF+TAOFdz7iv72iApjX1BtIml+gWAdhk6XTdhD5zMwAGlWJn7hiX
 72UnCam408Cz3k86Sv/6Df6UmeXtjiQTeCRxKGJMKJ0rAzRPuIFznZ0ivwESy9yDBJUD
 6WHkjeIAnKqOqsl2s79PQbqLg+RiaU2K9BglSVceDVFx7HykUvbMsjVgTpgNtL4REiSc
 LeGoYL3b7+3oeUNsdWMVjNhPBDxOlAaJyibOnJo0Yg67CVkpH7C8j+9f/wHfBRmPn/7q
 1NycHLFlHspA50/WNl2EZ+FGz2bCxW4Dd+L3nMHohxAZip2sbdKxUu+PEI3F769J0Rma hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w10f19mg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Nov 2019 14:37:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 496CB100042;
 Mon,  4 Nov 2019 14:37:06 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C5C12FF5DB;
 Mon,  4 Nov 2019 14:37:06 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019
 14:37:06 +0100
Received: from localhost (10.201.21.218) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019 14:37:05
 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 4 Nov 2019 14:36:54 +0100
Message-ID: <20191104133654.28750-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.218]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-04_08:2019-11-04,2019-11-04 signatures=0
Cc: benjamin.gaignard@st.com
Subject: [alsa-devel] [PATCH] ASoC: stm32: sai: add restriction on mmap
	support
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

Do not support mmap in S/PDIF mode. In S/PDIF mode
the buffer has to be copied, to allow the channel status
bits insertion.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai_sub.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index a4060813bc74..48e629ac2d88 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1218,6 +1218,16 @@ static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/* No support of mmap in S/PDIF mode */
+static const struct snd_pcm_hardware stm32_sai_pcm_hw_spdif = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED,
+	.buffer_bytes_max = 8 * PAGE_SIZE,
+	.period_bytes_min = 1024,
+	.period_bytes_max = PAGE_SIZE,
+	.periods_min = 2,
+	.periods_max = 8,
+};
+
 static const struct snd_pcm_hardware stm32_sai_pcm_hw = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_MMAP,
 	.buffer_bytes_max = 8 * PAGE_SIZE,
@@ -1270,7 +1280,7 @@ static const struct snd_dmaengine_pcm_config stm32_sai_pcm_config = {
 };
 
 static const struct snd_dmaengine_pcm_config stm32_sai_pcm_config_spdif = {
-	.pcm_hardware = &stm32_sai_pcm_hw,
+	.pcm_hardware = &stm32_sai_pcm_hw_spdif,
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 	.process = stm32_sai_pcm_process_spdif,
 };
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
