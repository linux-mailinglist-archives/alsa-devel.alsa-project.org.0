Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F557286243
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 17:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F5616E1;
	Wed,  7 Oct 2020 17:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F5616E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602085054;
	bh=mr/jhF3aVq48I9MsVXve7uNBHxiQYe1xF8sSALvNvGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kO4678VHAynaSktGWALaUAoDXmI/5KNfhrFVW5wynZRRPf96k0xQfLvOThSOgyxcf
	 k8xKN26VP+mkPH5MLJTNUhor+GZPbRn3KeUYe9LfVdPhAJBNeXVzggawSL2w/oojN1
	 O8GETOHI3W4pplekoxWn3pVwvkEkrVaGqlrliezI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32425F8020B;
	Wed,  7 Oct 2020 17:35:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2496AF80216; Wed,  7 Oct 2020 17:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7112F8016A
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 17:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7112F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="vGjCrBwS"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097FWFoq023619; Wed, 7 Oct 2020 17:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FPikfaz/iiTGQi5nWBHbRB8G4mXCShpRHE2r00v/p/k=;
 b=vGjCrBwSR4FcoKznqjDzzOSVKUXfCHvk188gSI2CKZoS/eSEydLL+fYhyprRyLFLLuVD
 c77/MrC2p9Hc2VGH6lhSl6Z7/EAdXko/TNMJjutwOBxoGGvmGAwl47vvrdcH0/wYtTXT
 XEhFcgVJ1A6vCeJC4pqU4k9SiHL+K/GR/x1g2C7SN3+hQyg7qmEwHFWWnM3O1TDjSs6X
 AV432KRVOXrg/vrKf/F4CeXZF3hmFmoucPD8AnYZRfLj/TECMSwaF9k5U06sQySwbsaZ
 vyzbyrjPIDRcLEVxCbcToT4i3dThv1zUWpvlVYubEdih3wAfR2JZBpoqiAyOajw8bXiV qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjwfh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 17:35:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE8CA100034;
 Wed,  7 Oct 2020 17:35:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB1C22B8A24;
 Wed,  7 Oct 2020 17:35:14 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 17:35:14
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Subject: [PATCH 1/2] ASoC: stm32: dfsdm: change rate limits
Date: Wed, 7 Oct 2020 17:34:58 +0200
Message-ID: <20201007153459.22155-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201007153459.22155-1-olivier.moysan@st.com>
References: <20201007153459.22155-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_09:2020-10-06,
 2020-10-07 signatures=0
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

The DFSDM can support a larger rate range than currently
supported in driver.
Increase rate upper limit to 48kHz and allow all rates
in the range 8kHz to 48kHz.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_adfsdm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index ec27c13af04f..c4031988f981 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -47,9 +47,6 @@ static const struct snd_pcm_hardware stm32_adfsdm_pcm_hw = {
 		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_PAUSE,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
 
-	.rate_min = 8000,
-	.rate_max = 32000,
-
 	.channels_min = 1,
 	.channels_max = 1,
 
@@ -143,8 +140,9 @@ static const struct snd_soc_dai_driver stm32_adfsdm_dai = {
 		    .channels_max = 1,
 		    .formats = SNDRV_PCM_FMTBIT_S16_LE |
 			       SNDRV_PCM_FMTBIT_S32_LE,
-		    .rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
-			      SNDRV_PCM_RATE_32000),
+		    .rates = SNDRV_PCM_RATE_CONTINUOUS,
+		    .rate_min = 8000,
+		    .rate_max = 48000,
 		    },
 	.ops = &stm32_adfsdm_dai_ops,
 };
-- 
2.17.1

