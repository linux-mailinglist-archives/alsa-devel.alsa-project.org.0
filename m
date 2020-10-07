Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD548286240
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 17:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A0216C1;
	Wed,  7 Oct 2020 17:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A0216C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602085045;
	bh=GgEDbXArPgjKb5DN0oBXBqjwyqVIPBsaqwNUAIO7gjU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EHqp8mGq62BDlIDFFsslW99KEWOot91SWpQbAaNdlEh9WsxWj5obOnuVXfezAldIp
	 eMAHWR1RpxXuPDegwO2uyV/U1nrg9SBEhqe1u7FCjcrMhzfhYI4jUbqr9jKku8yTuj
	 HOPmc/KIKK/GIZbALOnbywzXHWCdKKKFyUGbroUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F39C1F8016B;
	Wed,  7 Oct 2020 17:35:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45C50F8019D; Wed,  7 Oct 2020 17:35:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D80FF80090
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 17:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D80FF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="QEiEP/KU"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097FVuqo020404; Wed, 7 Oct 2020 17:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qd5+/AbCEM53HLfce4bWxYU4BP8hENng6CU0MTPn/10=;
 b=QEiEP/KU/gXmc696cLJr57K5wtltvdCI/HuHDPhlWieLmRFl0Rv1g7ddwfYroDYmsDGO
 xGYqi7jomW49c0+bxV1WlOcdxj213+v1SkIhM1nN2i2rla2ZP/Jc0OLX/OFsx5VtRSba
 gCT6WvduasmA/i6E2+1BOJ0h2lXYJvBHCnOPRHbzXuDVSSCuu3b9/6hvftQ/SFvcZa73
 lRAgIhzTa6doCmEGSJYz8ifqZGrd71OI4TGiAZEEbYIxUePZSmahVgO0ZsEX77c4VIfB
 26xcjMkKWmiy2uGFibu4FU659OwWChvdR+02oUb5ZUBm/yqVODYms2bp+tN6lfp+4R0Q qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tk5pre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 17:35:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DE8810002A;
 Wed,  7 Oct 2020 17:35:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C75692B8A27;
 Wed,  7 Oct 2020 17:35:13 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 17:35:13
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Subject: [PATCH 0/2] ASoC: stm32: dfsdm: change rate limits
Date: Wed, 7 Oct 2020 17:34:57 +0200
Message-ID: <20201007153459.22155-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE2.st.com
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

Widening of the supported rate range in the STM32 DFSDM driver.
The rates were previously limited to 8kHz, 16kHz and 32kHz.
Allow rate capture in the whole range 8kHz-48kHz as there is no hardware
limitation to support it.
Actual sample resolution is dependent on audio rate and DFSDM configuration. 
Add a trace to allow simple check of sample resolution.

Olivier Moysan (2):
  ASoC: stm32: dfsdm: change rate limits
  ASoC: stm32: dfsdm: add actual resolution trace

 drivers/iio/adc/stm32-dfsdm-adc.c | 4 ++++
 drivers/iio/adc/stm32-dfsdm.h     | 2 ++
 sound/soc/stm/stm32_adfsdm.c      | 8 +++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.17.1

