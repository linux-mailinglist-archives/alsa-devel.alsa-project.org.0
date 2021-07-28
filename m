Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118E3D8FD9
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 15:56:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C3A81FC3;
	Wed, 28 Jul 2021 15:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C3A81FC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627480570;
	bh=96l3VcaXSj/SYQJ2JMHPfrDmLaAg13Um1VQ4qSPDBEQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/cz2pZ7fmM0A+lHtjYyRrX04stu9DGCK2lcGzYWfpfmsAHZ8hdp/hD+dCOIkMp4q
	 eexLzlz8YUhLeiJxyLRSY5PipLcRGTI2rPSSJ9xfk6MKU97VUNCJk6UwDC0a6LbbFL
	 r5ULnLswea5qT90ff9oeu6T3trdk6Cq5Ya8oXock=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE83BF805E5;
	Wed, 28 Jul 2021 15:45:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD6EF805A0; Wed, 28 Jul 2021 15:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDDF3F804FC
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 15:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDDF3F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lzOB0E2T"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S5XUr3014335; 
 Wed, 28 Jul 2021 08:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=5vyRKpHWzUCIxKnuzL8uynmnpCsZb66b8Ukt92ISVS0=;
 b=lzOB0E2TqNLBRmaCuTjmrKmJ8s3ZK1Q5fFvr1kaskUm4GwlsEJg0opOgfzFzmczvgcA6
 2LUJ3g9R7zINGtjULtn7LV/HXoNglDHjbf637cYqgoQP0OlJr3a3rR6oPiMfKBm8dD1C
 0uS6EUP7PKUmt8M5oUo7Lqdhnt8Z8ew1lbMFkFr9FmfnamRa5zTj9UJgdGeM1UI25vDe
 XKY5+nvn87rK91cSxrk8LaOUJQe3dp0/l+YYR5M1TjeCfei3eDgfWnxsx1TFXcSnQiRx
 ziqYYteK42rZthu+XdX1ZSAt8ZyuJAzSPmbJnWmZsBOiJqFHe9Ru1BPmtE+0tWAnOEwp Tg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a30q20fx9-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 08:44:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 14:44:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 14:44:38 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E3DF846E;
 Wed, 28 Jul 2021 13:44:37 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 25/27] ALSA: hda/cs8409: Remove unnecessary delays
Date: Wed, 28 Jul 2021 14:44:06 +0100
Message-ID: <20210728134408.369396-26-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
References: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KUQgfGSsemspQDaebE0JBlq8oVSEp-hb
X-Proofpoint-GUID: KUQgfGSsemspQDaebE0JBlq8oVSEp-hb
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

Since delays when starting jack detection after initialization
have been reduced/removed, it is necessary to add back in an extra
20ms delay after the init sequence to allow the CS42L42 to power up
correctly.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Changes in v2:
- No changes

---
 sound/pci/hda/patch_cs8409.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 422381913bc6..1e48337b782b 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -520,12 +520,10 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
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
@@ -632,6 +630,7 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 
 	/* Initialize CS42L42 companion codec */
 	cs8409_i2c_bulk_write(cs42l42, cs42l42->init_seq, cs42l42->init_seq_num);
+	usleep_range(20000, 25000);
 
 	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_bulk_read(cs42l42, irq_regs, ARRAY_SIZE(irq_regs));
@@ -899,7 +898,6 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * Run immediately after init.
 		 */
 		cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
-		usleep_range(100000, 150000);
 		break;
 	default:
 		break;
@@ -1094,10 +1092,8 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
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

