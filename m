Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2EE2EF587
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315721715;
	Fri,  8 Jan 2021 17:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315721715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610122130;
	bh=tvAX3/2+xWsdlbqynAkPKd/pHdKxIJ6d0DeH1249BVg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hk9QA8RbBAVKmTbRwoj9zg86ekfElkGu/qXxhpwoYL/Zag/hOxoHndTEWW6uYA1e1
	 pwls6G2HoP4vp2n88coX5vvDrvT7DZ+TywVlxdXek4CC98eajy4QTaJW6OuAuyVhWW
	 hYe8Ua3o7DEBPEoEcbrZvoa8MrNDGHiu1hwSCYyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD9D1F804EB;
	Fri,  8 Jan 2021 17:05:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C4F0F804CC; Fri,  8 Jan 2021 17:05:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0CFEF800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CFEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="eoS6vRyt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 108G2EoZ011561; Fri, 8 Jan 2021 10:05:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=627cyMSOyeSzZ7/Nq+d6A7Mp3C4WbFQei8V0n6bIm60=;
 b=eoS6vRythwrqRcbrJrEBUWfYn/UNWAMCivNJSRovifGKPFGkKMmw9zgL4OO1Pe2G1NiR
 TqID91IfmBNy1Tmfnrni+Rb5m2O7eVvEbRbRVHnDCUm5B8qNQbYj3gzThostEu33kWYD
 7t2/MQDQwmvCN8Le75mL4AX8yWWDAyLkV9P4looci6+liLdNTmyC4ATBG8cs7Gw2I1fX
 r7v5CaPNF7mJS/Nh7nKsVXGjev6SKCxW4FGz/gvrbYd9fZBXo0zfIyIwZeODuQWo4cxQ
 WoHJg4nfmmfom4aOE9wBjor6OJi5oDILe+Sx7SQ3TJDbk98XNEusZV2zA38aSctXZyNd 3Q== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35wqjka90t-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Jan 2021 10:05:09 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 8 Jan 2021
 16:05:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 8 Jan 2021 16:05:09 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.226])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B206811CB;
 Fri,  8 Jan 2021 16:05:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>,
 <f.fainelli@gmail.com>
Subject: [PATCH v4 5/6] ASoC: madera: Export clock config defines to
 dt-bindings
Date: Fri, 8 Jan 2021 16:05:00 +0000
Message-ID: <20210108160501.7638-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108160501.7638-1-rf@opensource.cirrus.com>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080091
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

Move the defines for clock/fll IDs and sources into the dt-bindings
header so that they can be used by machine driver dts files.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/dt-bindings/sound/madera.h | 60 ++++++++++++++++++++++++++++++
 sound/soc/codecs/madera.h          | 56 +---------------------------
 2 files changed, 61 insertions(+), 55 deletions(-)

diff --git a/include/dt-bindings/sound/madera.h b/include/dt-bindings/sound/madera.h
index d0096d5eb0da..5c5fc1bfe6f9 100644
--- a/include/dt-bindings/sound/madera.h
+++ b/include/dt-bindings/sound/madera.h
@@ -22,4 +22,64 @@
 #define CS47L35_DMIC_REF_MICBIAS2A	2
 #define CS47L35_DMIC_REF_MICBIAS2B	3
 
+/* FLL IDs */
+#define MADERA_FLL1_REFCLK		1
+#define MADERA_FLL2_REFCLK		2
+#define MADERA_FLL3_REFCLK		3
+#define MADERA_FLLAO_REFCLK		4
+#define MADERA_FLL1_SYNCCLK		5
+#define MADERA_FLL2_SYNCCLK		6
+#define MADERA_FLL3_SYNCCLK		7
+#define MADERA_FLLAO_SYNCCLK		8
+
+/* FLL input source pin IDs */
+#define MADERA_FLL_SRC_NONE		-1
+#define MADERA_FLL_SRC_MCLK1		0
+#define MADERA_FLL_SRC_MCLK2		1
+#define MADERA_FLL_SRC_MCLK3		2
+#define MADERA_FLL_SRC_SLIMCLK		3
+#define MADERA_FLL_SRC_FLL1		4
+#define MADERA_FLL_SRC_FLL2		5
+#define MADERA_FLL_SRC_AIF1BCLK		8
+#define MADERA_FLL_SRC_AIF2BCLK		9
+#define MADERA_FLL_SRC_AIF3BCLK		10
+#define MADERA_FLL_SRC_AIF4BCLK		11
+#define MADERA_FLL_SRC_AIF1LRCLK	12
+#define MADERA_FLL_SRC_AIF2LRCLK	13
+#define MADERA_FLL_SRC_AIF3LRCLK	14
+#define MADERA_FLL_SRC_AIF4LRCLK	15
+
+/* SYSCLK IDs */
+#define MADERA_CLK_SYSCLK_1		1
+#define MADERA_CLK_ASYNCCLK_1		2
+#define MADERA_CLK_OPCLK		3
+#define MADERA_CLK_ASYNC_OPCLK		4
+#define MADERA_CLK_SYSCLK_2		5
+#define MADERA_CLK_SYSCLK_3		6
+#define MADERA_CLK_ASYNCCLK_2		7
+#define MADERA_CLK_DSPCLK		8
+#define MADERA_CLK_OUTCLK		9
+
+/* SYSCLK source IDs */
+#define MADERA_CLK_SRC_MCLK1		0x0
+#define MADERA_CLK_SRC_MCLK2		0x1
+#define MADERA_CLK_SRC_MCLK3		0x2
+#define MADERA_CLK_SRC_FLL1		0x4
+#define MADERA_CLK_SRC_FLL2		0x5
+#define MADERA_CLK_SRC_FLL3		0x6
+#define MADERA_CLK_SRC_FLLAO_HI		0x7
+#define MADERA_CLK_SRC_FLL1_DIV6	0x7
+#define MADERA_CLK_SRC_AIF1BCLK		0x8
+#define MADERA_CLK_SRC_AIF2BCLK		0x9
+#define MADERA_CLK_SRC_AIF3BCLK		0xA
+#define MADERA_CLK_SRC_AIF4BCLK		0xB
+#define MADERA_CLK_SRC_FLLAO		0xF
+
+/* OPCLK source IDs */
+#define MADERA_OUTCLK_SYSCLK		0
+#define MADERA_OUTCLK_ASYNCCLK		1
+#define MADERA_OUTCLK_MCLK1		4
+#define MADERA_OUTCLK_MCLK2		5
+#define MADERA_OUTCLK_MCLK3		6
+
 #endif
diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index e0c0be59e2ef..1f4ea15648c5 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -9,67 +9,13 @@
 #ifndef ASOC_MADERA_H
 #define ASOC_MADERA_H
 
+#include <dt-bindings/sound/madera.h>
 #include <linux/completion.h>
 #include <sound/soc.h>
 #include <sound/madera-pdata.h>
 
 #include "wm_adsp.h"
 
-#define MADERA_FLL1_REFCLK		1
-#define MADERA_FLL2_REFCLK		2
-#define MADERA_FLL3_REFCLK		3
-#define MADERA_FLLAO_REFCLK		4
-#define MADERA_FLL1_SYNCCLK		5
-#define MADERA_FLL2_SYNCCLK		6
-#define MADERA_FLL3_SYNCCLK		7
-#define MADERA_FLLAO_SYNCCLK		8
-
-#define MADERA_FLL_SRC_NONE		-1
-#define MADERA_FLL_SRC_MCLK1		0
-#define MADERA_FLL_SRC_MCLK2		1
-#define MADERA_FLL_SRC_MCLK3		2
-#define MADERA_FLL_SRC_SLIMCLK		3
-#define MADERA_FLL_SRC_FLL1		4
-#define MADERA_FLL_SRC_FLL2		5
-#define MADERA_FLL_SRC_AIF1BCLK		8
-#define MADERA_FLL_SRC_AIF2BCLK		9
-#define MADERA_FLL_SRC_AIF3BCLK		10
-#define MADERA_FLL_SRC_AIF4BCLK		11
-#define MADERA_FLL_SRC_AIF1LRCLK	12
-#define MADERA_FLL_SRC_AIF2LRCLK	13
-#define MADERA_FLL_SRC_AIF3LRCLK	14
-#define MADERA_FLL_SRC_AIF4LRCLK	15
-
-#define MADERA_CLK_SYSCLK_1		1
-#define MADERA_CLK_ASYNCCLK_1		2
-#define MADERA_CLK_OPCLK		3
-#define MADERA_CLK_ASYNC_OPCLK		4
-#define MADERA_CLK_SYSCLK_2		5
-#define MADERA_CLK_SYSCLK_3		6
-#define MADERA_CLK_ASYNCCLK_2		7
-#define MADERA_CLK_DSPCLK		8
-#define MADERA_CLK_OUTCLK		9
-
-#define MADERA_CLK_SRC_MCLK1		0x0
-#define MADERA_CLK_SRC_MCLK2		0x1
-#define MADERA_CLK_SRC_MCLK3		0x2
-#define MADERA_CLK_SRC_FLL1		0x4
-#define MADERA_CLK_SRC_FLL2		0x5
-#define MADERA_CLK_SRC_FLL3		0x6
-#define MADERA_CLK_SRC_FLLAO_HI		0x7
-#define MADERA_CLK_SRC_FLL1_DIV6	0x7
-#define MADERA_CLK_SRC_AIF1BCLK		0x8
-#define MADERA_CLK_SRC_AIF2BCLK		0x9
-#define MADERA_CLK_SRC_AIF3BCLK		0xA
-#define MADERA_CLK_SRC_AIF4BCLK		0xB
-#define MADERA_CLK_SRC_FLLAO		0xF
-
-#define MADERA_OUTCLK_SYSCLK		0
-#define MADERA_OUTCLK_ASYNCCLK		1
-#define MADERA_OUTCLK_MCLK1		4
-#define MADERA_OUTCLK_MCLK2		5
-#define MADERA_OUTCLK_MCLK3		6
-
 #define MADERA_MIXER_VOL_MASK		0x00FE
 #define MADERA_MIXER_VOL_SHIFT		1
 #define MADERA_MIXER_VOL_WIDTH		7
-- 
2.20.1

