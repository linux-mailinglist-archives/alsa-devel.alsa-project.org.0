Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD663DBC16
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35DD41F0C;
	Fri, 30 Jul 2021 17:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35DD41F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627658525;
	bh=MgFexWTudBMqmbAliQ5G3DDZl8OAYEmeJFKnn/UQzi4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qat/SZbwlxPZk/j6hadunxDrvPqLAqyhnO+BlLzcbvodapYI5EyD9W8+zq48eAcb0
	 MIY+FSsB+jtaburHNR/mxGxAIUBgkn/nHs+maP6ZZGeGSTdyNtubRB7PkkZCIcvVn6
	 eXx22zZtHG6YsZkHJo9fc+HtPHkImf04uEWXz8Gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10318F8051A;
	Fri, 30 Jul 2021 17:19:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75225F80518; Fri, 30 Jul 2021 17:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AFBAF8025E
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFBAF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mEyNJ4Yc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UELBKZ004490; 
 Fri, 30 Jul 2021 10:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=K8OUVtkx5MXW4mcNUh8AurLTfJooQUkcdQjXzfU28n8=;
 b=mEyNJ4Yc+BNqcouwbkMid8c44Nta4I/3I8MudF3H7eAV7TPhwxi83Ta1t1OjUU7iNrl8
 4k7NTqSKps00WSionNfNX7mN8Nng55/SU6dN1uIPZZJNAWXmUn52pRAng6ELttEj592p
 NUf2Rp4efqM+E/moQoZ2Runk/JyuS3ArgobWzVjWQWULBwk3Qg/CYVjUqkcOwkwu2yKf
 eCldjWAG48WHCUQDc81XWnSuaOW15AMPIlVk1/r73Gr1DZxcPMJUHBqqyr8+o2sgaUnx
 JpsPsHMBIvwSMX5INGfcXnxVq8My/QDWI4s6xQApHlhJ4kpCu8L0pVj/XXFQyAE3LYnO 2w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a41wd181m-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:19:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:19:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:19:07 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6FAF946E;
 Fri, 30 Jul 2021 15:19:07 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 04/27] ALSA: hda/cs8409: Mask all CS42L42 interrupts on
 initialization
Date: Fri, 30 Jul 2021 16:18:21 +0100
Message-ID: <20210730151844.7873-5-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
References: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: a4WeqlZ1UxEqyI4eoutObzZxJRyIGkOJ
X-Proofpoint-ORIG-GUID: a4WeqlZ1UxEqyI4eoutObzZxJRyIGkOJ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300102
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

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

 sound/pci/hda/patch_cs8409-tables.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 5766433325a9..91b6a5b2824a 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -159,6 +159,18 @@ const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
 	{ 0x1105, 0x00 },
 	{ 0x1112, 0xC0 },
 	{ 0x1101, 0x02 },
+	{ 0x1316, 0xff },
+	{ 0x1317, 0xff },
+	{ 0x1318, 0xff },
+	{ 0x1319, 0xff },
+	{ 0x131a, 0xff },
+	{ 0x131b, 0xff },
+	{ 0x131c, 0xff },
+	{ 0x131e, 0xff },
+	{ 0x131f, 0xff },
+	{ 0x1320, 0xff },
+	{ 0x1b79, 0xff },
+	{ 0x1b7a, 0xff },
 	{} /* Terminator */
 };
 
-- 
2.25.1

