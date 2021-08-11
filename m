Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E60EF3E9879
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6C61ACC;
	Wed, 11 Aug 2021 21:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6C61ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628709371;
	bh=cWmy66G9oPvt1IioiMZXvM6LyPs7ZzTcw349xxAJWyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QTmWvRyQ1cCH8HTiXoMLOcAaUol+eaRJOrsGHvhmGS51x7Xx++n3JBNz6BYmoK9Pt
	 dGTjJ5A33dX1OFaeAhQ/+AWLZdybW+Nh+niDpkQb2mnao3adUITXsKab8rSiWINe11
	 W8BAjmlbvMkP2vJwfcOPRF5ojrJ+4zc6BoYu1nIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A50BF80518;
	Wed, 11 Aug 2021 21:12:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 188ACF804F2; Wed, 11 Aug 2021 21:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9686AF804B0
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 21:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9686AF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ab7ToA32"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B9hd05013981; 
 Wed, 11 Aug 2021 14:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=tAGn6pVi9o1qiLueUKyeFz8u0HK0oeRoruIzeE+wL8k=;
 b=ab7ToA32u/5HdCb7atyoE95I00O0l+3eMo5bFX4U2dCFZ2AKlibotv0rlw2/Ii/d+/SR
 FTV05w3RLfTfVeLvZRfKjffu/DShuP2R1Y66M/ra84RMAw/ElPz+s34vH6okyLPYkAFq
 8SrjhITFGTr600uaOw27qkn7uTFJ54Wc4IstAEGeshpwkUWtHk88uud4KnjAjXjoCPxt
 qDA9bZf0gcQYvMR/AbiF93+4XG8Hi/DQ7vsoji3HEyH4mckc9ObZufSUYAl+0hjJuM3h
 YC3uIGkgmXrrV+NXvttLsrDCI9ac/GWzYCrSsQy/xAxzP1KfqA+EUGhmfkT2PprBFJu1 zA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3acc5ngpgw-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 14:12:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:32 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 98CBB45D;
 Wed, 11 Aug 2021 18:57:32 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 25/27] ALSA: hda/cs8409: Remove unnecessary delays
Date: Wed, 11 Aug 2021 19:56:52 +0100
Message-ID: <20210811185654.6837-26-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Fps13D_fBALcbtnv7soQyb5kmhrWW5oh
X-Proofpoint-GUID: Fps13D_fBALcbtnv7soQyb5kmhrWW5oh
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=982 mlxscore=0 lowpriorityscore=0
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

Since delays when starting jack detection after initialization
have been reduced/removed, it is necessary to add back in an extra
20ms delay after the init sequence to allow the CS42L42 to power up
correctly.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 9f6c51a5835a..b528c8353b3c 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -541,12 +541,10 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
 	cs8409_i2c_write(cs42l42, 0x1b74, 0x07);
 	cs8409_i2c_write(cs42l42, 0x131b, 0xFD);
 	cs8409_i2c_write(cs42l42, 0x1120, 0x80);
-	/* Wait ~110ms*/
-	usleep_range(110000, 200000);
+	/* Wait ~100us*/
+	usleep_range(100, 200);
 	cs8409_i2c_write(cs42l42, 0x111f, 0x77);
 	cs8409_i2c_write(cs42l42, 0x1120, 0xc0);
-	/* Wait ~10ms */
-	usleep_range(10000, 25000);
 }
 
 static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
@@ -653,6 +651,7 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 
 	/* Initialize CS42L42 companion codec */
 	cs8409_i2c_bulk_write(cs42l42, cs42l42->init_seq, cs42l42->init_seq_num);
+	usleep_range(20000, 25000);
 
 	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_bulk_read(cs42l42, irq_regs, ARRAY_SIZE(irq_regs));
@@ -927,7 +926,6 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * Run immediately after init.
 		 */
 		cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
-		usleep_range(100000, 150000);
 		break;
 	default:
 		break;
@@ -1122,10 +1120,8 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		 * been already plugged in.
 		 * Run immediately after init.
 		 */
-		for (i = 0; i < spec->num_scodecs; i++) {
+		for (i = 0; i < spec->num_scodecs; i++)
 			cs42l42_run_jack_detect(spec->scodecs[i]);
-			usleep_range(100000, 150000);
-		}
 
 		break;
 	default:
-- 
2.25.1

