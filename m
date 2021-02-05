Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F8310967
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 11:46:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9E315E4;
	Fri,  5 Feb 2021 11:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9E315E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612521971;
	bh=AbSw9VK+o3aBt5b5CQOOXnEHGwekDS4UjXTeBSUwXwU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XqOTgaDNIVD/IcdKnCaAttRJOLlTd3F8f70vWWOYnPSdQhSmLIptrxgRARfSk0aZe
	 3Lx9sB75qNWnqGg0bSnwumaInCG6mAGERy5S2HCauEWdagKjBerTem6/ElhGMy4TLB
	 ZKYnDijvrJsM+pqRj3UuQUYqDCJ8G1K2+5lFSNmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFC9EF801DB;
	Fri,  5 Feb 2021 11:44:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6930BF8015A; Fri,  5 Feb 2021 11:44:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D20F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 11:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D20F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="Q/wOwdSO"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115Ac85R026438; Fri, 5 Feb 2021 11:44:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=BuMCGD8sDkpe/8V/Cj88u52ylQufeUc03qiQXLfMh1w=;
 b=Q/wOwdSOSrDXElDNZUOOcyzgRN3O2ATyE81NToSsi5pGAgY3zQyHfLykJMZofFLkahmu
 4TTQCAwHi6GIJiLgJYUZSqJJpxvfiKj15mERXHrCIYUtKv1gw8JYxFyqrWsih5QMEXS4
 KtEMYRWj4T6t/6F15izo/C53HjhSY/dwV5IF+aWPlc+Qar5jA0XJPCCGEjIfT8aHfoqc
 Y3YM5+vn4IOrF32747Act68NRJRoJFEFt44lvRUbT+TggzDcaIDswFHgaSxVj56+EM66
 wO2oqwavrxAhqJK7R+f7w4IR/egMI9+toko1sPsPBAGjsbOE0ZLJ/MJrESsH/xxyBwmj 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0fse4qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 11:44:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4ED8A10002A;
 Fri,  5 Feb 2021 11:44:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 988DD2298CD;
 Fri,  5 Feb 2021 11:44:20 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 11:44:20
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@st.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@st.com>, "Rob
 Herring" <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [RESEND PATCH 0/2] ASoC: stm32: i2s: add master clock provider
Date: Fri, 5 Feb 2021 11:44:02 +0100
Message-ID: <20210205104404.18786-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Olivier Moysan <olivier.moysan@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Add master clock generation support in STM32 I2S driver.
Resend of patch https://lkml.org/lkml/2020/9/11/264

Olivier Moysan (2):
  ASoC: dt-bindings: add mclk provider support to stm32 i2s
  ASoC: stm32: i2s: add master clock provider

 .../bindings/sound/st,stm32-i2s.yaml          |   4 +
 sound/soc/stm/stm32_i2s.c                     | 310 +++++++++++++++---
 2 files changed, 270 insertions(+), 44 deletions(-)

-- 
2.17.1

