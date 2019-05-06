Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D2814A5C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 14:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A32F1862;
	Mon,  6 May 2019 14:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A32F1862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557147376;
	bh=WOuvtwhjRlG5Y0xn6osR9JZpuKgUPN/Pb7V6OUUJirQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NpaJzzy+xYrU04ncippCdSplVC6/k1XrGQcAUCbXnmXBmeh1wXSIfyHKuffjy/oJf
	 w6Q1Ycsx4RcCE26Ei7C2+aI9jDYFdMADBhCkSbcXnk6a5JPbOVDcCCQf7ydBFscLxm
	 vK/jtq9nXiP8dA/Kfc/L8GCrkJI6kap24ivZM2X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A21F896E6;
	Mon,  6 May 2019 14:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B7D4F896F0; Mon,  6 May 2019 14:54:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32061F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 14:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32061F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="W+ZH91T5"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46CkfHF028690; Mon, 6 May 2019 14:54:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Bf6BzLVHhrobFAhDVUpC7IRGuKGCU+Zv3v7QzNgJX+k=;
 b=W+ZH91T5+ZGLRYnRD4nkR6mwLJwoXbL04P8RegkOVeLaIEksSqhvT2TWZYDvJ61WucbC
 tctaEe9QZRej1RWsIo/G41WfaNWImrm0M0MPIGhQJlLGz7l8Znpn6osUwofkK14W6Yb4
 e12z6hMarMWTiVxgUmNlVXf29dqzs3kEmrK/+luKXRrGDi/d0cjUZY9we1s5L8IjV7R7
 xwblMQ9lpU/lFsEv5XOl2e5DyM63kzx6hmYhXApxc+PR6iEwnPfEDtMNjE6yytKZvlPU
 0x3SwjZPrNg7pR0DQNsFcPRNBNTy/1elMSwXg/vIY08sLXGcAd98az+7uibUhYrVFbUX gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s94bvhbp1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 14:54:26 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5B7A31;
 Mon,  6 May 2019 12:54:24 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 805B425B8;
 Mon,  6 May 2019 12:54:24 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019
 14:54:24 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019 14:54:23
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 6 May 2019 14:54:10 +0200
Message-ID: <1557147252-18679-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_08:, , signatures=0
Cc: benjamin.gaignard@st.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: stm32: i2s: add some features
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

Update and add some features in STM32 I2S driver.
- update pcm hardware constraints
- add management of identification registers

Olivier Moysan (2):
  ASoC: stm32: i2s: update pcm hardware constraints
  ASoC: stm32: i2s: manage identification registers

 sound/soc/stm/stm32_i2s.c | 63 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
