Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ECB3E1944
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 18:13:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D8516BB;
	Thu,  5 Aug 2021 18:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D8516BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628180027;
	bh=xrkpguWyZHyKlzzHiIG/lJMg7hMIxsLZ9Lt6/GG2ReU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5fCE6lNBtlsD7WO7soZknXWdy7it4XOWc3zKCFjJ2jjFjOSemW4MhJ/ZSSlkuyeJ
	 vLJYziNNmKSt/93tVm4a5hqAw9A+msUqaexqNfbnQkFKQ85PIC022aRN7Pn2Zct/SL
	 j/K0wJ+PjlGixP++T5dRGuNsBlrg+vUfijU2PV+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 878AAF804ED;
	Thu,  5 Aug 2021 18:11:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 764C3F804E6; Thu,  5 Aug 2021 18:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734C5F8032D
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 18:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734C5F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bRCXiuhZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 175EPV3b027692; 
 Thu, 5 Aug 2021 11:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BgSkYgjyAhG7rLZdW0I+adkP4TYCDWsj5RMlEyx3YLg=;
 b=bRCXiuhZHqlxorm8aHg4ERUa9fdMvSL6odOAiX8bO1Il+jpXVC0nQnIH/76qIRcmYmP0
 JX1k+DhXfu+5PCOJDlH2I81yERoEbJJA44B8lD+wVg8PWAPpjhYAYYyUlQ1Wai0CAZSM
 avpKV04nh2zIc3x0VyleNPLcH5jit5tZaO4/6NByJQgK+qjNghakl+3Dk8gJDoVz+eRR
 br/ujKuPF7h7kX7gfw3xZVMEyWVJQu0v5QZ5ixeDRwsDn2qS2EVIn3xSwyHDNJQMeA+l
 rAw2ErJwl2pzXVFt2QOeWWbLmUUb4IY/BNZFwtPPoOHzNgNbTlSY2bgFw9EntKxMKBbP 4Q== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a8c61rku5-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 05 Aug 2021 11:11:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 5 Aug
 2021 17:11:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 5 Aug 2021 17:11:15 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.37])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EC8E546E;
 Thu,  5 Aug 2021 16:11:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 5/8] ASoC: cs42l42: Add PLL configuration for 44.1kHz/16-bit
Date: Thu, 5 Aug 2021 17:11:08 +0100
Message-ID: <20210805161111.10410-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805161111.10410-1-rf@opensource.cirrus.com>
References: <20210805161111.10410-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: L2EKy52Z9vromiEx5Ebu5prVTIxmyS-i
X-Proofpoint-ORIG-GUID: L2EKy52Z9vromiEx5Ebu5prVTIxmyS-i
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050099
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

44.1kHz 16-bit standard I2S gives a SCLK of 1.4112 MHz. Add
a PLL configuration for this.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 99c022be94a6..6895f2fe9eb0 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -586,6 +586,7 @@ struct cs42l42_pll_params {
  * Table 4-5 from the Datasheet
  */
 static const struct cs42l42_pll_params pll_ratio_table[] = {
+	{ 1411200, 0, 1, 0x00, 0x80, 0x000000, 0x03, 0x10, 11289600, 128, 2},
 	{ 1536000, 0, 1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125, 2},
 	{ 2304000, 0, 1, 0x00, 0x55, 0xC00000, 0x02, 0x10, 12288000,  85, 2},
 	{ 2400000, 0, 1, 0x00, 0x50, 0x000000, 0x03, 0x10, 12000000,  80, 2},
-- 
2.11.0

