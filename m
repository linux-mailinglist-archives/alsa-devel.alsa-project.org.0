Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BD456DCE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 11:51:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A1BD17B0;
	Fri, 19 Nov 2021 11:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A1BD17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637319081;
	bh=g2c0CrUyge+FGMYrGa1yaOjK1W5Bj4VL+K7a2rE1uuo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arYacf0QzsO0vBpmtq7OYYH/4sNsUw3Pu3/jlsZHqh811og9kjINMANmiLkmFy+Ly
	 XwKjHm/FyiZYLYAcoIwTQ6lV0R4/1GpNcWW6o7jNF+iYZL6RqooCmI5N0z3uUN6/n9
	 GeZzuKhfHMSzBw3MUNLztOtS689YvnCtc1I/LoU0=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A80F800FA;
	Fri, 19 Nov 2021 11:50:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 712F2F8027D; Fri, 19 Nov 2021 11:49:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D5BDF8012E
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 11:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D5BDF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="MDPnfFrl"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ9dFv5001984;
 Fri, 19 Nov 2021 11:49:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=xyqfWAf7yUmLO3g8n/gJdqZwt+K7c4XpPoDS7K1AxAE=;
 b=MDPnfFrlCRzeZaJfUUNIOzLrVBW8EGPLLnWtPaapQbMaXAh3i0roy1/LyQ9WGvC5R9B0
 wF0R+TrMcF4xxemcfBncJpZ5p3VvYHyUKvXZMGkp3DZV+Buy+ga2DGYhqfKFjyo6YGAU
 d1FWip6IGOc9jQZrq4HT/XQ15Gtv8ak9JthyvvCqwUN5y7dU6ualmYuwguwfVQqztHBS
 zeaOP49dOKKcNCVq2Y5UCSD35L10/mU9QU5bG23POryZS5xkOaAL8bSHceU+025kHTmM
 0CpymtGiC6N2Eiww3Gh5eY0fokZoKPweBE51dvwQNvq+TdBTw/+yTOEmVXyV57zH/RJX vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce1knb038-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 11:49:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B32C10002A;
 Fri, 19 Nov 2021 11:49:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F927205B4A;
 Fri, 19 Nov 2021 11:49:48 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 11:49:47
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/3] ASoC: stm32: spdifrx: add pm_runtime support
Date: Fri, 19 Nov 2021 11:47:52 +0100
Message-ID: <20211119104752.13564-4-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119104752.13564-1-olivier.moysan@foss.st.com>
References: <20211119104752.13564-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_08,2021-11-17_01,2020-04-07_01
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

Enable support of pm_runtime on STM32 SPDIFRX driver to allow
SPDIFRX power state monitoring.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 48145f553588..a9ccdc2c5867 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -955,6 +956,7 @@ static int stm32_spdifrx_remove(struct platform_device *pdev)
 
 	snd_dmaengine_pcm_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
@@ -1010,6 +1012,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	udelay(2);
 	reset_control_deassert(rst);
 
+	pm_runtime_enable(&pdev->dev);
+
 	pcm_config = &stm32_spdifrx_pcm_config;
 	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
 	if (ret) {
-- 
2.17.1

