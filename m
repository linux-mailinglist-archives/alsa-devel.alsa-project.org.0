Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13245C367E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 15:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9670D166C;
	Tue,  1 Oct 2019 15:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9670D166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569938344;
	bh=T+6ROgxCzVDqKUKdJ51PM99PTJvLgmdwLdCDQiySLAQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UGcnZyZZkkDTrl9xSjHI8w/0iDUvBpgmHbJNDHhCz4vu4X9i+9dYDDyey9ZBMnyBP
	 hJWiw97BRBAPWRcos695vRtONTM9y3ZvCuT7cepcixTw4lNNZwFqx1+bTCJYRaSTiH
	 lDZtB1rsYeR5OBWM4P5x6LHxqMO0ibDyokuZx088=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0FE1F805F9;
	Tue,  1 Oct 2019 15:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE082F805E1; Tue,  1 Oct 2019 15:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A192F800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 15:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A192F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aySFEMav"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x91DiR6c023810; Tue, 1 Oct 2019 08:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=CL3vpONu1NKS2D1P/HloRhEPYcfdgY85PikU4hpldnA=;
 b=aySFEMavOE1uzI34xy6+qVCuaTw9OS6ZWI07bHCNG+nguUVQslWWDsEFAApLsIAiJYmv
 2Z+09MzyW7UMAMrnjK9HODPV7ojNMidA7T68BV12CNAGoIp1zwfB6FFjNoDoyCebvFR/
 sDCFS8FcNf4fXkHAhTAUNVkrY+AibS/gEdgSGqiGU8hDuI4ODjHRFJNzT5NCANVtdnzG
 IUKONuWEo9ta5gKVXnvtrA7A49LaZUVRcPUTjExEcHc4Y9xPFm7J7aZsk9hO0CTYVcMz
 XNns50GH611IRVEvYUpIW5KWFWSWwljqay9oW+96KvBnBygt3pwDWg3nHKpB+BLHHCib Fw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2va4x4nd61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 01 Oct 2019 08:57:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 1 Oct
 2019 14:57:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 1 Oct 2019 14:57:00 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE3D22B3;
 Tue,  1 Oct 2019 13:57:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Tue, 1 Oct 2019 14:57:00 +0100
Message-ID: <20191001135700.31017-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=717
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 suspectscore=1 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910010125
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: madera: Add support for using MCLK3
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

Some Madera CODECs have a third MCLK pin allow this to be sourced for
the FLLs and system clocks.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/madera.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index 1f3e8e230cf25..6d8938a3fb647 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -27,6 +27,7 @@
 #define MADERA_FLL_SRC_NONE		-1
 #define MADERA_FLL_SRC_MCLK1		0
 #define MADERA_FLL_SRC_MCLK2		1
+#define MADERA_FLL_SRC_MCLK3		2
 #define MADERA_FLL_SRC_SLIMCLK		3
 #define MADERA_FLL_SRC_FLL1		4
 #define MADERA_FLL_SRC_FLL2		5
@@ -51,6 +52,7 @@
 
 #define MADERA_CLK_SRC_MCLK1		0x0
 #define MADERA_CLK_SRC_MCLK2		0x1
+#define MADERA_CLK_SRC_MCLK3		0x2
 #define MADERA_CLK_SRC_FLL1		0x4
 #define MADERA_CLK_SRC_FLL2		0x5
 #define MADERA_CLK_SRC_FLL3		0x6
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
