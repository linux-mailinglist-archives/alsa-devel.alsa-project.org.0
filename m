Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5923D6604
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 19:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0215173A;
	Mon, 26 Jul 2021 19:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0215173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627321784;
	bh=YU3WdsFVb0TwNRHpB2wNlwuA+UhsMEawmkpjJWKWmIM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ElUi5N5NqyvKw8PDXuPGp2gYVgLvypnawg/K5gLCcvuvyt+4kpQ7sXsotBVDIaGEC
	 qgwF5J+W8y6Z+a/HumB/ijVxF/ExC1eBIRBfIJVVj40j7g90PBCSg3CM7p45LoO12B
	 +YQy9N0TZjt8/xsVfF5woWsauVjDnfpNLZlIqHd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A2FFF8020D;
	Mon, 26 Jul 2021 19:48:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE0BEF8025A; Mon, 26 Jul 2021 19:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B16BCF80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 19:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B16BCF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Z9e1QYcm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYcP012545; 
 Mon, 26 Jul 2021 12:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8pSBGfgJ/nBC52HcUY+Q/EOMjuHRhWatj/yyeT8OEoM=;
 b=Z9e1QYcmlCduGLsKqZkmeSjrhrSXQKZ3bVbEqeahrKu0Ks99HP0+usZjr3T91VA6x+F+
 B5q7y2oeX0sQGwqfo3PPuGAA7w7hXtrL7zGZnZEFL1jH84k4QUXbAbdhSNXYuyvpwEsj
 dw4wahrlunZaasoYQlZVR1ZQ7EdBzBzH1aV8ECZDuJidnkYE0qYdPSjkJKJQYE3JclCX
 ZOcq/71h8QLWKpsxakCOEBNcMKxkmjZ9mCYhhozHslEKtXyxBKTgnZcZ4TCzylsrVWV6
 otkaPdtpqDbvvQ/XcAqVISv1x6beMPutmBLYY/B5dAa+nUsY0NDZVKSRDMkcXtyzZ7Ku Cw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhgum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 12:48:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:01 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 439FB45D;
 Mon, 26 Jul 2021 17:47:01 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 06/27] ALSA: hda/cs8409: Disable unnecessary Ring Sense for
 Cyborg/Warlock/Bullseye
Date: Mon, 26 Jul 2021 18:46:19 +0100
Message-ID: <20210726174640.6390-7-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lnfAB6NkG-eq8WfA5RDCRPy1-FoHY93q
X-Proofpoint-ORIG-GUID: lnfAB6NkG-eq8WfA5RDCRPy1-FoHY93q
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260103
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Also remove unnecessary repeated register writes.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409-tables.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 91b6a5b2824a..07d3ae28c105 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -153,11 +153,9 @@ const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
 	{ 0x1121, 0xF3 },
 	{ 0x1103, 0x20 },
 	{ 0x1105, 0x00 },
-	{ 0x1112, 0xC0 },
+	{ 0x1112, 0x00 },
 	{ 0x1113, 0x80 },
 	{ 0x1C03, 0xC0 },
-	{ 0x1105, 0x00 },
-	{ 0x1112, 0xC0 },
 	{ 0x1101, 0x02 },
 	{ 0x1316, 0xff },
 	{ 0x1317, 0xff },
-- 
2.25.1

