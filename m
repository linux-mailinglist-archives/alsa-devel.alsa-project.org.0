Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD237A79B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 15:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23D817BE;
	Tue, 11 May 2021 15:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23D817BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620739883;
	bh=WxjLtmXJSU7M3ucuta+uwMYydNkbzG1ZJ2R3mbIM1QA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BUpP5wv47rmDmMcxjhrXsU35+MIBg23r6xiA84IrvlneYGSiGtiXERyIwUUkFDQi9
	 Kpmj3Z2JK6ZuWuPGWN+cqyjuIU6TlQSm37BGus5KLI+o65NTBXuPcp7gFCnn4OVJT4
	 191kZuaxU3IAONydCKtbtnU1fuFc/q1DpbZXfSc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F2C0F8016B;
	Tue, 11 May 2021 15:29:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23914F80163; Tue, 11 May 2021 15:29:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DF8BF80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 15:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DF8BF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Nqy5mVmT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BDQoux022683; Tue, 11 May 2021 08:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=bzqrVrM9xmJqVMzON06i42Dfv5kRx48381tnaoZJZNo=;
 b=Nqy5mVmT1iXyXnG1c/w3i0CMrqgBVypsQl0w4kkXvr0nOuKDWqNQ+t3bpplGHsio64BC
 ZXZ4Dj2WWIj13/AVmyuScXoXCLapQM2X+D+I7Oa2IoeBqolaTrENdf8ncP3l5ZsBYWkK
 q0pNyl/61sBK4tO5ZzLHBM2t51UjtYHHW6LAbEksnEzLTOR25+YfYtjjPyfC8v+kG/oR
 A9zrdGnECIuzAR2fkMV9rSxTkX+WANDUu057aOsL8j4jGhvLCIWbDSJF+OtF0MqyV40f
 st0uK9nPIEJErLWYWN+0Wkh2ZlWLAwC+N8gSNHQP/7a58IUaSmKuhz/cVJqLdvuQ9N8/ yA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4sjyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 08:29:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 14:29:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 14:29:00 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0ACD311CF;
 Tue, 11 May 2021 13:29:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs42l42: Regmap must use_single_read/write
Date: Tue, 11 May 2021 14:28:55 +0100
Message-ID: <20210511132855.27159-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XcBi5beSO0DhnWP_9TGAh6jYrGzhXj7f
X-Proofpoint-ORIG-GUID: XcBi5beSO0DhnWP_9TGAh6jYrGzhXj7f
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=575
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110103
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

cs42l42 does not support standard burst transfers so the use_single_read
and use_single_write flags must be set in the regmap config.

Because of this bug, the patch:

commit 0a0eb567e1d4 ("ASoC: cs42l42: Minor error paths fixups")

broke cs42l42 probe() because without the use_single_* flags it causes
regmap to issue a burst read.

However, the missing use_single_* could cause problems anyway because the
regmap cache can attempt burst transfers if these flags are not set.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index d7fb6b38fd7c..e4b058a1d6af 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -400,6 +400,9 @@ static const struct regmap_config cs42l42_regmap = {
 	.reg_defaults = cs42l42_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(cs42l42_reg_defaults),
 	.cache_type = REGCACHE_RBTREE,
+
+	.use_single_read = true,
+	.use_single_write = true,
 };
 
 static DECLARE_TLV_DB_SCALE(adc_tlv, -9600, 100, false);
-- 
2.20.1

