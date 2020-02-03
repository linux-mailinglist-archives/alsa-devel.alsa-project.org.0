Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439A1503ED
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 11:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41951682;
	Mon,  3 Feb 2020 11:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41951682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580724645;
	bh=HSqkYdgEwHRJJO5nwwbCNMZ7I8UBUtVvxXUZJMOmVQ0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ApCFGPVv7NI5t4QceSXh8wq45UUDU0CLz1K3ctlHqNLq3J2rh4bhNlib/ch/GUFgx
	 HB35br+zOA104W7D2OTjWSwU3B8Fs2slff1BtJLK0SzudbyLxEuQuoWpt5sfl7epUq
	 k4ActaOoeTQyAYpix6A3iaP3TAUDUzYTgyD6yJOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 219ECF800B8;
	Mon,  3 Feb 2020 11:09:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D49AF80148; Mon,  3 Feb 2020 11:09:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56E42F80051
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 11:08:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56E42F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="GHPTUpU7"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013A7laG019683; Mon, 3 Feb 2020 11:08:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+4sb3dxn9Wm1UXCadNBKjHSse+85wiCwWOp50/uIgYk=;
 b=GHPTUpU7vWN8TA0QE+qyk7CUOKxWDYcSA1qrfaYorG8q4wKKfYPX90r8nJiV7zrwUBwF
 fSC1ATigccIeEonEyDk51oKNrCsqjZKM2aSr6t3cIDYSWTKtHab9VPjkAUcvr4R/aTPv
 WfKLrhVp7yVrUJvdVFKJWXixmVqk3m8V86WfldlJScUizvxUK68Uy9mII67LbER2Lii9
 EPtas/rc+SVGKFuwppF2G0cJPi8LIPkC37Jr10WbJI/L3b7bvRDKACpVkuoQoHSRm2T/
 6CLWZF8YKAhcWC612OdeNsEJRP1YICChZsgl+gHCSeF8IY/d6csRg0buL+gXnh9Oq30i MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xvybdrs6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 11:08:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BA6D10002A;
 Mon,  3 Feb 2020 11:08:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A28A92BE22D;
 Mon,  3 Feb 2020 11:08:48 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 3 Feb 2020 11:08:47 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:08 +0100
Message-ID: <20200203100814.22944-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_02:2020-02-02,
 2020-02-03 signatures=0
Subject: [alsa-devel] [PATCH 0/6] ASoC: stm32: improve error management on
	probe
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

Improve management of error on probe for STM32 SAI, SPDIFRX and I2S drivers.
- Handle errors when the driver fails to get a reset controller.
- Do not print an error trace when deferring probe.

Olivier Moysan (6):
  ASoC: stm32: sai: manage error when getting reset controller
  ASoC: stm32: spdifrx: manage error when getting reset controller
  ASoC: stm32: i2s: manage error when getting reset controller
  ASoC: stm32: sai: improve error management on probe deferral
  ASoC: stm32: spdifrx: improve error management on probe deferral
  ASoC: stm32: i2s: improve error management on probe deferral

 sound/soc/stm/stm32_i2s.c     | 39 +++++++++++++++++++++++++----------
 sound/soc/stm/stm32_sai.c     | 26 ++++++++++++++++-------
 sound/soc/stm/stm32_sai_sub.c | 11 +++++++---
 sound/soc/stm/stm32_spdifrx.c | 29 ++++++++++++++++++--------
 4 files changed, 74 insertions(+), 31 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
