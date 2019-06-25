Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8FE55395
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 17:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2BA015F2;
	Tue, 25 Jun 2019 17:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2BA015F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561477165;
	bh=o10cSTN13KKSkILqvZlObn6o4gafH7wWhToOcZogJ4A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DUlYbg6L4/zl32qK2EfDKdTMPB81wnScxdmmpySwdQP/+pmTIcVIRGZ9VjzrK+eTm
	 jMeDtfJ5FVx7Lg8p00YUZlwJkO3XOnwWXC1lcHlmkJI+mLlOf5CSTEVFu1uDcAyzLf
	 IQquSuT1xURp9lFjKtHD+6lddQHq4z72n6HPdJ5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50441F896F0;
	Tue, 25 Jun 2019 17:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EE68F896F9; Tue, 25 Jun 2019 17:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8AEBF8071F
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 17:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8AEBF8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="P8BXfDeC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PFJX9J022918; Tue, 25 Jun 2019 10:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=LqWzjX27bDhmDUHYuzxfLvoXbxs0MOGrHACShTKR1d0=;
 b=P8BXfDeC/8G7GOOdO26LBpA3pMO9ks45/qPqvu2h+rdJKxUe1wVo/SkyrozsEL2lFtVs
 rzD//ezdq7f+MCxC5OEYb+wDvp07p5SowajDjgismSEElxJe99ceo1V1SFrwjLojXdcf
 IW8xQDvkyN2xfOJ/ooCJBdsIrM9KUG1o/wBomomgCbIzcfHJB9Tz6xoFNT17YrVu4jFx
 r7M9ETHY2nId1h4CMxsHYe1pcU1SldQcPS/lXdqiTFtUXHanQORHlQ9JOOExtWkbN7xG
 90f/Vm+0iPKB+V1dEK0hjZR/wumksCrCXaR4ISapumzNWlO+wEGyVX3p7v7rxUVUX+ja mw== 
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2dd0a-1;
 Tue, 25 Jun 2019 10:37:28 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
 by mail4.cirrus.com (Postfix) with ESMTP id 3C5B5611C8AF;
 Tue, 25 Jun 2019 10:37:29 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 25 Jun
 2019 16:37:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 25 Jun 2019 16:37:27 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3C1E744;
 Tue, 25 Jun 2019 16:37:27 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Tue, 25 Jun 2019 16:37:27 +0100
Message-ID: <20190625153727.28060-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=621 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250117
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: madera: Update SPDX headers
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

The madera driver was merged too late to catch Thomas Gleixner's cleanup
of the SPDX headers tree wide. Update the headers to match what was done
in that patch.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/dt-bindings/sound/madera.h | 6 +-----
 include/sound/madera-pdata.h       | 6 +-----
 sound/soc/codecs/cs47l35.c         | 6 +-----
 sound/soc/codecs/cs47l85.c         | 6 +-----
 sound/soc/codecs/cs47l90.c         | 6 +-----
 sound/soc/codecs/madera.c          | 6 +-----
 sound/soc/codecs/madera.h          | 6 +-----
 7 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/include/dt-bindings/sound/madera.h b/include/dt-bindings/sound/madera.h
index 9ff4eae5259b0..d0096d5eb0dab 100644
--- a/include/dt-bindings/sound/madera.h
+++ b/include/dt-bindings/sound/madera.h
@@ -1,13 +1,9 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Device Tree defines for Madera codecs
  *
  * Copyright (C) 2016-2017 Cirrus Logic, Inc. and
  *                         Cirrus Logic International Semiconductor Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef DT_BINDINGS_SOUND_MADERA_H
diff --git a/include/sound/madera-pdata.h b/include/sound/madera-pdata.h
index 441decefb7f34..e3060f48f1081 100644
--- a/include/sound/madera-pdata.h
+++ b/include/sound/madera-pdata.h
@@ -1,13 +1,9 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Platform data for Madera codec driver
  *
  * Copyright (C) 2016-2019 Cirrus Logic, Inc. and
  *                         Cirrus Logic International Semiconductor Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef MADERA_CODEC_PDATA_H
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index 02f193dadd41a..511d0d6fa962a 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // ALSA SoC Audio driver for CS47L35 codec
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/delay.h>
 #include <linux/device.h>
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 4c4bae6e2c57e..32fe7ffb75268 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // ALSA SoC Audio driver for CS47L85 codec
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 83c4e4628bdea..c4ecb0e6911af 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // ALSA SoC Audio driver for CS47L90 codec
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 6146c7a070cb3..1b1be19a2f991 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -1,14 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // Cirrus Logic Madera class codecs common support
 //
 // Copyright (C) 2015-2019 Cirrus Logic, Inc. and
 //                         Cirrus Logic International Semiconductor Ltd.
 //
-// This program is free software; you can redistribute it and/or modify
-// it under the terms of the GNU General Public License as published by the
-// Free Software Foundation; version 2.
-//
 
 #include <linux/delay.h>
 #include <linux/gcd.h>
diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index aa2db156582b9..0af66f2807708 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -1,13 +1,9 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Cirrus Logic Madera class codecs common support
  *
  * Copyright (C) 2015-2018 Cirrus Logic, Inc. and
  *                         Cirrus Logic International Semiconductor Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2.
  */
 
 #ifndef ASOC_MADERA_H
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
