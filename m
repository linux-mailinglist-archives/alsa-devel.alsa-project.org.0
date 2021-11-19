Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5AC456DCF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 11:51:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F4017B9;
	Fri, 19 Nov 2021 11:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F4017B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637319103;
	bh=8smRVfD0Ggh6aT5Gw2FcV3uCXL36mUAN95fpRK/xpdw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xi0s/5kG7HUzueJ7avthsHE9ZVtPMtacfSOflclbf5zRKGSUHoYmRubnleefgphYM
	 7PsLTWZuG9J9XGzYflZJQ4ji7r+FiBzdFdhPgITgf8MYwIOky1QOomt5HnVn7rSfmw
	 xpEXoFfl5XjAVlB9/3wbPk+6q9EA3bZMNmWVFZkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A44E7F8028B;
	Fri, 19 Nov 2021 11:50:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7F83F80272; Fri, 19 Nov 2021 11:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB474F80217
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 11:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB474F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="vs2g62Hs"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ63puU028232;
 Fri, 19 Nov 2021 11:49:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=FJTdF7AHag0JWwHMFiygmObAOJE6OAA0u6xWqdj9p7s=;
 b=vs2g62HsUBxVjXGPYomg/X3Fo7ojwGSRj1ZQYdw75tCTB3b+7x6z7sSm4yC1nFLhyZk9
 GiWyIADhPF5suHtyegKlHpS3u+aGnADVh69OvLtNRBihEi3yI5f1lcbaNztd0grUKv/0
 EV64RfRS30llmVa3s02FCpsVDcarr1ve9lRVp+pzp3OYootY/CnkgFb+VbUrWzXQho8+
 FTe2CDoELrSNI4kFTdcA/G7s3rGbym0ER+kLwLNes977g0N3xVmcDJGDFz1PeCDxEhhG
 s+h65mLXrS1mYTeowGgACwZnnliWOQ0DzXvSmVCbYKVQNXt9ZyemFNY/ObSAGYAn7z9i Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce6b1hqjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 11:49:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27D5410002A;
 Fri, 19 Nov 2021 11:49:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 87EB92248C2;
 Fri, 19 Nov 2021 11:49:45 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 11:49:45
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/3] ASoC: stm32: add pm runtime support
Date: Fri, 19 Nov 2021 11:47:49 +0100
Message-ID: <20211119104752.13564-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
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

Enable support of pm runtime on STM32 SPDIFRX, I2S and DFSDM drivers
to allow power state monitoring.

Changes in v2:
- Move pm runtime enabling before component registration

Olivier Moysan (3):
  ASoC: stm32: i2s: add pm_runtime support
  ASoC: stm32: dfsdm: add pm_runtime support for audio
  ASoC: stm32: spdifrx: add pm_runtime support

 sound/soc/stm/stm32_adfsdm.c  | 5 ++++-
 sound/soc/stm/stm32_i2s.c     | 4 ++++
 sound/soc/stm/stm32_spdifrx.c | 4 ++++
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.17.1

