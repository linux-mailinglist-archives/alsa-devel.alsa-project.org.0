Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48D294017
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 17:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DE416E2;
	Tue, 20 Oct 2020 17:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DE416E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603209548;
	bh=Jq8+JtdE7YyzE2mzd0q0wZfO3Ul6gOf5pA7JBr9fZ1E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PcMOCIsotlhfZqCSC8lVUYbga2P0GLNkEKYXbp0bApDxxJh8QwbiscWGQ9NVVEu8e
	 b+6sUyOV199urj84nHmRBXD1YCDMWyKSKIExQ/xhXrPkACc6brOfWBkwaIp2GpHcVo
	 UtILuBbQv+R8jXCCAmVKFtSag4GK/CnWgOd9vY/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62603F8024A;
	Tue, 20 Oct 2020 17:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0137EF80252; Tue, 20 Oct 2020 17:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C0BF80228
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 17:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C0BF80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="tSwotTfT"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KFfsqH008231; Tue, 20 Oct 2020 17:57:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vxVcS0wL2dmaUGtZbYgULMDICAzdzq2c+2XOgarz2W8=;
 b=tSwotTfTGzp0UfKKaB1HYz9zhyFIEMvXk0/ssAnHzRK+LOHI19fiimx69WyRWlMICUAy
 Wo/P3c1f+2gcH1cH8RY4Q/DQXDqInf17gTxzmFToN4alTF2f9oVsf8NHy8EVb9f3apvz
 rWEAn3mKh4y/ZWU2sGc4CRv4h/9xJkO58xI0wfaCRBhBvimJlhhY8B5KF0p+kE9ISYR9
 IXIsI+hxUy1hX0QuNS7/dnnSJqYNz5LpoxAZoys1cKVQLHSPFO044Ol6n+Pk8tfK+2NC
 x2ULDjdMqr5yEYnbJ2xw+KEATp0kc3Eq0cMKnu8yHxLVxWAGItQlU51t1T3pdBOakj0b YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcwuuw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:57:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3188410002A;
 Tue, 20 Oct 2020 17:57:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD477206290;
 Tue, 20 Oct 2020 17:57:13 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 17:57:13
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <olivier.moysan@st.com>
Subject: [PATCH v2 0/2] dt-bindings: stm32: convert audio dfsdm to json-schema
Date: Tue, 20 Oct 2020 17:57:07 +0200
Message-ID: <20201020155709.2621-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_08:2020-10-20,
 2020-10-20 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org,
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

Some audio properties documented in st,stm32-adfsdm.txt are already documented
in Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml bindings.
Move remaining properties from st,stm32-adfsdm.txt to st,stm32-dfsdm-adc.yaml,
and remove st,stm32-adfsdm.txt.

Changes in v2:
- Complete st,stm32-dfsdm-adc.yaml rather than converting st,stm32-adfsdm.txt

Olivier Moysan (2):
  dt-bindings: stm32: dfsdm: update audio properties
  dt-bindings: stm32: dfsdm: remove stm32-adfsdm.txt binding

 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |  7 ++-
 .../bindings/sound/st,stm32-adfsdm.txt        | 63 -------------------
 2 files changed, 5 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt

-- 
2.17.1

