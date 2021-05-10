Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA674378CA4
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A4416E2;
	Mon, 10 May 2021 15:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A4416E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652603;
	bh=bkdAd+cRbTXglInEvNYnZOiNLvY5q780gBpuM+rFjcc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IYEgp3227k765KCQLG0YPOHmOQV8PPLVNe5aXVGbYKlBU3ykz8rxFVgS5pw4Ou3j+
	 FHueOb5Q5Y5H1BbfUYkr5WeymhIlo/dPxTDjVS17faLLASKJLVlPgutL01osWBTy6L
	 pt3ywDvQ96NskQJ4i4AIpMikNHBeUzWQzHO68vEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3872F8027B;
	Mon, 10 May 2021 15:14:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2162F804A9; Mon, 10 May 2021 15:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 717F9F80240
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 717F9F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ccqQehHx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADDl49002119; Mon, 10 May 2021 08:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=tQ2oR7hqoATBSzTidVbnDzFBTAtg7iw2LpmB6WOJXJk=;
 b=ccqQehHxXypmv2/UuZZXYw2NORhyjw4nEE3pstCzPPe1cqLBj3oIlJuaGXNvQv9IKrYl
 TM50N32vMgc3AjeECIHnWX0sYqUnlG+OofgMEoyjNBNxwzqMErOwnOgKmycXv2v+MW0V
 HooSDElWFHoeJKcfUs7Hb8W/5SRbMwcddG/wHVnLh1HYIYiUBGjBhxbxzBFWwhqWXlBy
 n7bjMO/+fRDroX5zuJ1ELwHHQ/pzQxPxRS0Fg4hXHuK8/M2NJjgB2rz0jLTBRncQQ+ke
 W6LqH27xoFO4Pg+hCK0u+BIrna0RE3mB98+N5zOMEV/98229Iw5DeGUUWpOZtdaLqZ4W vw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4r60v-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B4B5F11D7;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 01/10] ASoC: cirrus: Add helper function for reading the
 device ID
Date: Mon, 10 May 2021 14:13:48 +0100
Message-ID: <20210510131357.17170-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: CsZQVDbzha1DrAYF5kNFtx7p18nrQXPX
X-Proofpoint-ORIG-GUID: CsZQVDbzha1DrAYF5kNFtx7p18nrQXPX
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100092
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

Many of the older Cirrus devices share very similar code for reading the
device ID, and frequently this code is generating cppcheck warnings such
as:

sound/soc/codecs/cs42l42.c:1886:6: style: Variable 'ret' is reassigned
a value before the old one has been used. [redundantAssignment]
 ret = regmap_read(cs42l42->regmap, CS42L42_DEVID_CD, &reg);

Add a small helper function that older Cirrus devices can use to read
the device ID, which should help correct these issues.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cirrus_legacy.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 sound/soc/codecs/cirrus_legacy.h

diff --git a/sound/soc/codecs/cirrus_legacy.h b/sound/soc/codecs/cirrus_legacy.h
new file mode 100644
index 0000000000000..87c6fd79290d4
--- /dev/null
+++ b/sound/soc/codecs/cirrus_legacy.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Some small helpers for older Cirrus Logic parts.
+ *
+ * Copyright (C) 2021 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+static inline int cirrus_read_device_id(struct regmap *regmap, unsigned int reg)
+{
+	u8 devid[3];
+	int ret;
+
+	ret = regmap_bulk_read(regmap, reg, devid, ARRAY_SIZE(devid));
+	if (ret < 0)
+		return ret;
+
+	return ((devid[0] & 0xFF) << 12) |
+	       ((devid[1] & 0xFF) <<  4) |
+	       ((devid[2] & 0xF0) >>  4);
+}
-- 
2.11.0

