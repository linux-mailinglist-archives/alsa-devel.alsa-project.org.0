Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4E3D8FB3
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 15:54:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E03E1F7F;
	Wed, 28 Jul 2021 15:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E03E1F7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627480477;
	bh=EMgCcOa6l2LVnOtwyeiJsNQ5qjhh1j7h9ylWi5R4L1o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjtYxaVEAibsnhJJYKv8rRUU5SVVfuK5ONbBM00Ew2UwLe7/MPgfk5v110AjYZJuK
	 WTnf0Uo6Md3Tvr1CVvC0PbIt+ooDc5XK1V+b0+sJpcaTo+Uj7rlOg0veizgVezXIKu
	 Cm4ltcQFpq3b5zglTVbwCEH0CJzkDhGzwAEIqoJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA68F805C4;
	Wed, 28 Jul 2021 15:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5A6F805A1; Wed, 28 Jul 2021 15:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790B6F804FB
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 15:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790B6F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZZiB5pV9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S5XUr2014335; 
 Wed, 28 Jul 2021 08:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zYqzRWTxUJuaEiFkrwIy5RZBXmZV8qi+Ef/364pMMpU=;
 b=ZZiB5pV9l74VfDEhU98bNq0t+++BPKeFvT18ov1/oe1j183Q7INJyLeKVTKUDRiI1iCi
 g0npLzXdi6/ygpDsIQC35ZZ/WxuTHUknHEuoRAv777JtW8ON0hE4Zfy4nHyRqQw3H4ZB
 DFQLGyEcFVIDJyJ/bve5f7LDS8JkQ/IEdYUgtzFPwKWwYLF+BskC+xhCaVZMs/MsnW08
 wB20t92eRnXl5E46S44TBFr4vYuwprJQyZvt5+yJofSOv1HqcYCcSg0F50vu81facskQ
 17L4ARt3uAGBMwrHVH6GFXJcfUEE3rjCYMvDv2LZXZSlJD8MhM4CPoxiG77Mg8lRQYdx 3g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a30q20fx9-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 08:44:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 14:44:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 14:44:37 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DEEC445D;
 Wed, 28 Jul 2021 13:44:36 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 22/27] ALSA: hda/cs8409: Enable Full Scale Volume for Line
 Out Codec on Dolphin
Date: Wed, 28 Jul 2021 14:44:03 +0100
Message-ID: <20210728134408.369396-23-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
References: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: n6jDMYegU_eaHDOIcR052O6-aMHok-dC
X-Proofpoint-GUID: n6jDMYegU_eaHDOIcR052O6-aMHok-dC
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

Headphones codec will keep reduced maximum volume.
Line Out codec will have increased maximum volume.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Changes in v2:
- No changes

---
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

