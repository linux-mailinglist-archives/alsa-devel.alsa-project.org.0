Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106F294018
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 17:59:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA4C61735;
	Tue, 20 Oct 2020 17:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA4C61735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603209552;
	bh=SnBqgpY4QnFP+kVp2Kly+AsXH5CAEdZoEldOFPMg+r4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CpgkIplNOwU2IP5lSfOy8DOHCDQpoy0UpTZaBdULMBtMWyGK3APKkabJsO2efAECt
	 AhtVnDsFYco/ZJnje+q3y43p4t2kk8fbBIO+A7pASm0i6xXVKbVEX6JtD7krMAG682
	 KWbWGCpLLmlVwLK6QhZyoIcTRGosmgQSe30KnPNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDCC7F80289;
	Tue, 20 Oct 2020 17:57:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1F27F8024A; Tue, 20 Oct 2020 17:57:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1F7DF8011E
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 17:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1F7DF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="inGVilx2"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KFfsqI008231; Tue, 20 Oct 2020 17:57:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AJvF9/JFTz1FhLaB94FzcVX/0E99nQwQ1rJ9Dmzl8T8=;
 b=inGVilx2xfegbyLNBtrtH2fDigZLIwQrjxRWmkApuhXPBVlqbO6G/bksC+F5E9biDUyl
 ytw3iyLz++e4gE2yuPFFYresuANV4zFdiBw2v9qAKgI7qVRwXeItMKX+mSJ8q1b15ws6
 TPhT4iPKcEaJY7leOslJ7RN3eE0irv7kL50DJru4VXmDfBGDK4RdzdRm9zgE2tWDRPJk
 N3JJmMiff75nUG1UoSSavTBfATEK+9gYPLosNtFW/G8pEcLbDYpxzi0ORbLfW0gzspPR
 MnyEkq3PKj2iFdV4jsViHeFr9YWMLi7pGWd2a5cVngBxXy33xL6uFzTXU+FhwgvNZ991 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcwuuw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:57:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E095100034;
 Tue, 20 Oct 2020 17:57:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6905A206291;
 Tue, 20 Oct 2020 17:57:14 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 17:57:13
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <olivier.moysan@st.com>
Subject: [PATCH v2 1/2] dt-bindings: stm32: dfsdm: update audio properties
Date: Tue, 20 Oct 2020 17:57:08 +0200
Message-ID: <20201020155709.2621-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020155709.2621-1-olivier.moysan@st.com>
References: <20201020155709.2621-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE2.st.com
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

- Add missing compatible property in audio node.
- Remove obsolete "st,stm32-dfsdm-pdm" compatible.
- Remove useless comment in adc io-channels description.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index d61bc011e820..6f2398cdc82d 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -199,8 +199,6 @@ patternProperties:
               description:
                 From common IIO binding. Used to pipe external sigma delta
                 modulator or internal ADC output to DFSDM channel.
-                This is not required for "st,stm32-dfsdm-pdm" compatibility as
-                PDM microphone is binded in Audio DT node.
 
           required:
             - io-channels
@@ -235,6 +233,10 @@ patternProperties:
               description: child node
 
               properties:
+                compatible:
+                  enum:
+                    - st,stm32h7-dfsdm-dai
+
                 "#sound-dai-cells":
                   const: 0
 
@@ -244,6 +246,7 @@ patternProperties:
                     modulator or internal ADC output to DFSDM channel.
 
               required:
+                - compatible
                 - "#sound-dai-cells"
                 - io-channels
 
-- 
2.17.1

