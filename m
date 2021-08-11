Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDCB3E987C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F054A1AF4;
	Wed, 11 Aug 2021 21:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F054A1AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628709422;
	bh=Nuk1aKBi+GTQ7DuAmoh82X60PrEN24BDu2jlbEXMcRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zl9YS2XzDPNJS/YfWxP4UvkzVEBUhHzjVcuKFPrfLx76aItvHaAMd7jXSUcxdiDBM
	 G2x5lt4MIRX3VensaQPPeSCIv5n7gWv1h5qRVKBjwWwk6sdyVioTCwPtSjO5vxmCHa
	 keHqmc08h8UkQePhAKzxpkFm0H/jOifM6CSmD+UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9351EF8051F;
	Wed, 11 Aug 2021 21:13:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A121F80511; Wed, 11 Aug 2021 21:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C0BF800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 21:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C0BF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="M6nVjcCv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B9hd02013981; 
 Wed, 11 Aug 2021 14:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Dq0oAn1cMIbGfVXOudW2sRnTXcb2n86CQUdvFbyDZpM=;
 b=M6nVjcCvCUrXNIB7thQoshdfccjsom5bnpMUIrTyDsmszpfTX4AF1hlmZzlXI3XxYZvh
 M6oMtW8cwHioqOIrhnK8N0szsaqQn/k2rBL2rjGueRnGTo3PePzvZOIPQjbj61YxMfiY
 cvhvMJ/vTWNIlZtjqNfeGHgUev/nMChU50hGt5BIcLsZOJaeK9wspkKZg8bwTnaF9Cvj
 1zNsB7e0RSDMZ+oda6PXqr4+ksF3utstJjYyQqdnxbr16IUmVGtHV7PlwZ0ux6vaIeBE
 tdl5LvshOBnbDBFPRNpuRm/vTrG2+sLN6Eu/LmrVmpcypq0B2CeWAAeiPSduUS2LQ5/r JQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3acc5ngpgw-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 14:12:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:32 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C061946E;
 Wed, 11 Aug 2021 18:57:31 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 22/27] ALSA: hda/cs8409: Enable Full Scale Volume for Line
 Out Codec on Dolphin
Date: Wed, 11 Aug 2021 19:56:49 +0100
Message-ID: <20210811185654.6837-23-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nuwXTraLZNKbDV1wsAtNKD_e1PlM_-Bs
X-Proofpoint-GUID: nuwXTraLZNKbDV1wsAtNKD_e1PlM_-Bs
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110132
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

Headphones codec will keep reduced maximum volume.
Line Out codec will have increased maximum volume.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409-tables.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 6453a7ec3856..a39b2c20f61c 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -300,10 +300,10 @@ static const struct cs8409_i2c_param dolphin_c0_init_reg_seq[] = {
 	{ 0x2901, 0x01 },
 	{ 0x1101, 0x0A },
 	{ 0x1102, 0x84 },
+	{ 0x2001, 0x03 },
 	{ 0x2301, 0x00 },
 	{ 0x2303, 0x00 },
 	{ 0x2302, 0x3f },
-	{ 0x2001, 0x03 },
 	{ 0x1B75, 0xB6 },
 	{ 0x1B73, 0xC2 },
 	{ 0x1129, 0x01 },
@@ -356,10 +356,10 @@ static const struct cs8409_i2c_param dolphin_c1_init_reg_seq[] = {
 	{ 0x2901, 0x00 },
 	{ 0x1101, 0x0E },
 	{ 0x1102, 0x84 },
+	{ 0x2001, 0x01 },
 	{ 0x2301, 0x00 },
 	{ 0x2303, 0x00 },
 	{ 0x2302, 0x3f },
-	{ 0x2001, 0x03 },
 	{ 0x1B75, 0xB6 },
 	{ 0x1B73, 0xC2 },
 	{ 0x1129, 0x01 },
-- 
2.25.1

