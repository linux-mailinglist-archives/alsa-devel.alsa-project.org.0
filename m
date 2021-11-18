Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21864557A3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 10:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C5BD17A7;
	Thu, 18 Nov 2021 10:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C5BD17A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637226177;
	bh=X1RnIhAdr3Rv0gj2tQJITXc/vJHuC2OsWG+WQXG9h9s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UkxDFhIuN0ccB/0ENs6Jd+q+Wkce2zgyZ8vKD/cRk+L2KZNBgpvyE1GmNsy6iP7kj
	 77OHFAwbh8t8+nUu/vtr8fsjaCnbfwbCJnZQF7m3hBMtBPovMLlNW9KGu9/kQGlNnH
	 Sza+u6hiyva8r9nIXpEdDye1qJ2y5JXPo/TBw+ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB7E4F80272;
	Thu, 18 Nov 2021 10:01:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F624F804C1; Thu, 18 Nov 2021 10:01:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FDEBF8026D
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 10:01:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FDEBF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="5qpkOgjK"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI8mxR7025138;
 Thu, 18 Nov 2021 10:01:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=wPMmfQr15kVXKrsLCFwgNO3KB7Sm952Qq+p67H38BUc=;
 b=5qpkOgjKX8rzkFOsVm8vR2CxTzAtt+J6xwGubHmhWDDgPzi5LgXO+frcuOYrDdyEYu5v
 X4lcgqroLrM7E9Lny7tr238HxmPq9q2TF2CXTC6tjuFt8xh1xysX9jUAbYPDLMYJnRmg
 lSOX6vZpes8zV0LcoK6Qjs5ws0213JQP5N27omlKFV1jStnQs5c/kWAGx89o71jo+h3b
 zS190HCY9+OKFzSCmJPpkrzhuGx/fCcxsmYFv8vlZT23+Js0vOKNRxu6brAUAIKSFcjH
 AUDTjp64AUgqXZ+mEJ7GHYh1mExEPOSHEv4S5nqPha8V11pe6JxatkVAQ2Nlgg4HNLcM 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ccxyppu8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 10:01:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15B3C10002A;
 Thu, 18 Nov 2021 10:01:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC66A21A234;
 Thu, 18 Nov 2021 10:01:26 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 18 Nov 2021 10:01:26
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/3] ASoC: stm32: add pm runtime support
Date: Thu, 18 Nov 2021 10:00:32 +0100
Message-ID: <20211118090035.5331-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_04,2021-11-17_01,2020-04-07_01
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

Olivier Moysan (3):
  ASoC: stm32: i2s: add pm_runtime support
  ASoC: stm32: dfsdm: add pm_runtime support for audio
  ASoC: stm32: spdifrx: add pm_runtime support

 sound/soc/stm/stm32_adfsdm.c  | 11 ++++++++---
 sound/soc/stm/stm32_i2s.c     |  4 ++++
 sound/soc/stm/stm32_spdifrx.c |  4 ++++
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.17.1

