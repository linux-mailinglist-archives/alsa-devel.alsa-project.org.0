Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B90137AD84
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 20:00:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2621118A2;
	Tue, 11 May 2021 19:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2621118A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620756013;
	bh=7kGm6bPdwLYT9JkiKYbzQPCV5OWkXMk0KW5F2hv5zQo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=czm6pxkOX2+Kkd8zFsuY8H4pCXzGPsspQn0wOVg/XkGpa4JaOxXKIrx2O8Bh0mwux
	 vObBDiP/cr2JTklP6X+DFTr/tDzSU8gw1HGV71ClXbmJQTvyTdBkhFBMMH10k5lpt/
	 kVUl3m794L8TpP4BgjEIgI7zlL7ySrtEE722h3ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34065F804AA;
	Tue, 11 May 2021 19:57:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDE98F804A9; Tue, 11 May 2021 19:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 429FFF80163
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 19:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 429FFF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ekb7Du9l"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BHuh4x032740; Tue, 11 May 2021 12:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=23wyHMvDSdhhS7KGwhveKjb11ZbmbTSXQmTCvSbjnu0=;
 b=Ekb7Du9lLeSdQWD/1v+WF/oJJc3sNUvRpgj89M9V4II5tQ5fL2ctfvY04ZNNyIJ3oUl8
 hqwmZTw+z71oKM2dQ6dMhiyqU7dFmAcOHmw2jWmuZmRqsy7j97+syezQpQBr2jOpK23D
 +YDOayEen3RtE4GggG4CDcqCseEm0rEBp7EMzyQ/d5A+TZjCSNCTuqJceUtjzwdcZVNq
 ttg4kEGZwrdsL/lwXNl4fH2Jlkxg6BuH+scGc82oldfj1OS4PDXxK7luoyoRcJBWJRIz
 CouOqTh3Wru7lEvF7sdFrgGXPjRtFO7dz8EcVHLV9aoY72XR64HEHoE0ld17WE1fgi0u RA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38f4x19vvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 12:57:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 18:57:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 18:57:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D296611CD;
 Tue, 11 May 2021 17:57:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: cs42l73: Add missing regmap use_single config
Date: Tue, 11 May 2021 18:57:15 +0100
Message-ID: <20210511175718.15416-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210511175718.15416-1-ckeepax@opensource.cirrus.com>
References: <20210511175718.15416-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: b_XwuywhKJ_2ic_UD7QSKvoX8X185VqD
X-Proofpoint-ORIG-GUID: b_XwuywhKJ_2ic_UD7QSKvoX8X185VqD
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=878 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110121
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com,
 david.rhodes@cirrus.com
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

This device requires single register transactions, this will
definely cause problems with the new device ID parsing which uses
regmap_bulk_read but might also show up in the cache sync sometimes.
Add the missing flags to the regmap_config.

Fixes: 26495252fe0d ("ASoC: cs42l73: Minor error paths fixups")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l73.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index da5d77a5f55bb..018463f34e127 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1269,6 +1269,9 @@ static const struct regmap_config cs42l73_regmap = {
 	.volatile_reg = cs42l73_volatile_register,
 	.readable_reg = cs42l73_readable_register,
 	.cache_type = REGCACHE_RBTREE,
+
+	.use_single_read = true,
+	.use_single_write = true,
 };
 
 static int cs42l73_i2c_probe(struct i2c_client *i2c_client,
-- 
2.11.0

