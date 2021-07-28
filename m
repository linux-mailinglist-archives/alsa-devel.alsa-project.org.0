Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B373D8F7D
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 15:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E67D18B9;
	Wed, 28 Jul 2021 15:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E67D18B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627480070;
	bh=Z1irmq4q5G5vjS64pklMlsVZHEtAiirWsPISQ/SIvQg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k95+IJixsCgsBtwXbwTiDDGmLxb9Qr4tRCFWS9eiujREOQib4Bg/nin+hLmhyiM3U
	 YEOJ0tcSdu1wq4Dvpm0ZlvCugzb8AIJu9IzgeysfQGfVat9MecPgsmxbMLZyIpQSeb
	 iWSh9XH7oNJOvaSz9xL0hvd1L57BO4zzCY2rO1hU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D347AF8051B;
	Wed, 28 Jul 2021 15:44:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78C23F80253; Wed, 28 Jul 2021 15:44:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3951BF8025A
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 15:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3951BF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d9pnkH+7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S5XUql014335; 
 Wed, 28 Jul 2021 08:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7vkQIoBquMVVKjTnWMLcfqhODSdY1nfkUHZ8S3dlJNU=;
 b=d9pnkH+7ffix3IWdWH010Ic8bKdngFB2dA+SCbqaeTvLP6NkyBQo6wyGilY4jibb0aYC
 vh9B5hnM0RUAfofGWA4+HnV+SFMIhhez0FBD+UC7yk8ce7uFCqin04tljGkCQoANOoQm
 ZnujysMtaxHE6BZ1wvmUqvdP1pFzZeskXpVnw7FSwkajM5DkTxb1+kuTooRopYI3Dnvi
 OjkZCwxiWgLbBRiSPbMIVNp3APcaAZcxy0AvjgwpENpRkdQI3YO2OGWUCFJjyUuAeKDA
 nT7xF4SJOE4jg15oAJoprXuj0OBNb+NVpm1JrSBMSdbTxneyQEbglcsGQ494MICSbPeI 8A== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a30q20fx9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 08:44:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 14:44:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 14:44:31 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B64482BA;
 Wed, 28 Jul 2021 13:44:30 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 04/27] ALSA: hda/cs8409: Mask all CS42L42 interrupts on
 initialization
Date: Wed, 28 Jul 2021 14:43:45 +0100
Message-ID: <20210728134408.369396-5-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
References: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Zcjs7wkf_Pl7XmigpfZXZF_1GOEyjkCJ
X-Proofpoint-GUID: Zcjs7wkf_Pl7XmigpfZXZF_1GOEyjkCJ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280077
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

Changes in v2:
- No changes

---
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

