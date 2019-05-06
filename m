Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF5814A1B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 14:45:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7522F1879;
	Mon,  6 May 2019 14:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7522F1879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557146735;
	bh=nTJmptloWB/z6dGpOBq3/8O2mlbtgwCgDxjovh4pDng=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aQuw+6MdWYtg3nbKu564bza6pJ7glWAOBPfvksvLOPGwnyC8mMiUyiMruzLlBZU+8
	 VxdVMpCaYPxCVWQzezB5DIZ9wK7NY5YlAXtiDXR+h0/IrgVxSaqFClfUyGPymK11EW
	 P3LQKqxEljYhmL1kLlKa/0pAl3B3QTE6rpN0NQjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5120BF89723;
	Mon,  6 May 2019 14:44:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C5CEF89701; Mon,  6 May 2019 14:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB8E4F89673
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 14:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB8E4F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="eH544rpH"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46CaCNt024824; Mon, 6 May 2019 14:44:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=HcUcOaTSxNRSHfChXOh8afB0SuVIe92QW4amRAQNihQ=;
 b=eH544rpHGPR9xBm7uk7Y71brxiGS03XZC82Xzr0sDpVNMbckNm9W1fb3J+w0yqNfxVDo
 m8UoN3ybLtOnyVJLZotVpPzRt/EZlI2JX8I3jp5RJ2ghtggMrbgU2vlKAGn/kV8BW0Jc
 jzVgYkzBSwl9AvnLby0Y35tn0N0RIqsSAEBH3cR99C5lg/3xjYAG/kACAQmE9W+006uf
 wRxrkzlz42TAlJCCSdaWr4AhIod6bNMEL9Zf2QubC4JBnFAiPzltp5bEkkOv2CsR7aMU
 ivlmA74IfYDVqpw4b6mhSj81KSg3MtwkLkJZfhBj855OGSRjm7OOBfUEjO4ReFDW/Nel Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s94cd9a95-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 14:44:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 000A938;
 Mon,  6 May 2019 12:44:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B431A2583;
 Mon,  6 May 2019 12:44:10 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019
 14:44:10 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019 14:44:10
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 6 May 2019 14:44:03 +0200
Message-ID: <1557146646-18150-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_08:, , signatures=0
Cc: benjamin.gaignard@st.com
Subject: [alsa-devel] [PATCH 0/3] ASoC: stm32: spdifrx: add some features
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

Update and add some features in STM32 SPDIFRX driver.
- pdate pcm hardware constraints
- change trace level on iec control
- add management of identification registers

Olivier Moysan (3):
  ASoC: stm32: spdifrx: update pcm hardware constraints
  ASoC: stm32: spdifrx: change trace level on iec control
  ASoC: stm32: spdifrx: manage identification registers

 sound/soc/stm/stm32_spdifrx.c | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
