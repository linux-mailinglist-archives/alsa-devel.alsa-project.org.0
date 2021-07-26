Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A433D66A3
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:20:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D6E1A9D;
	Mon, 26 Jul 2021 20:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D6E1A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627323647;
	bh=O9UzRKSSFFNBnHHrDIeGN0MRcFv7WziGOWT1qLt5XuU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fx2J0HlJm/XqgqAk4S4xAOutUY0TXcbScdIaCoP3J3nVN4Urv6H5COzimi5eVuCwf
	 pPuwcRtvA0mgtF82+QSGKs75vLAX5fIfoIcFoBcNJ3rjc277xUjoDv3kZuxdsLPWyf
	 hd73e0vh+ON8Vew4wfb367nyZExLzSpuYtSZ7Ui0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCF7F8025E;
	Mon, 26 Jul 2021 20:18:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 373EBF804E1; Mon, 26 Jul 2021 20:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BD04F802A9
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BD04F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qizCJVLq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q9Xco6002242; 
 Mon, 26 Jul 2021 13:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=diC5kyXxdegeDWrfgx1Lak2o+oyWLDuZvcF/p/V6L/M=;
 b=qizCJVLqZOMy2MpAANQ8h4oZzRWE9k4diR4d30f6+yIdpaKX49mUquT4iAu4Vz+K0SKM
 oXTB+CvBBKXNAPh0UcEdCe2KKBdyPAnA7QzOrv2Ux2feG1HrM3yiud4f7/u5+6jDPpA1
 ngPiZW5AEFPhbWc6UBsQMVGaK3GyQ7rfIE69PE/uNHtk8yDo/aieHl7pBKu/wZceLZNq
 shY5UNC3F2Md3AcRNsQ2Z2L8FS1Gdz2fab99z1s43Sv83qvXrBPz3cNP3IxMVsMUtFsO
 Yy/Rx6ZHI6wgVJCfXQQ6kB4YumeFq7XHdPE+K3GI9/kOd9Ee4FKklYaFGf+NOr1QWMvM UA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a1th2rhbh-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:18:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:12 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 630922BA;
 Mon, 26 Jul 2021 17:47:12 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 26/27] ALSA: hda/cs8409: Follow correct CS42L42 power down
 sequence for suspend
Date: Mon, 26 Jul 2021 18:46:39 +0100
Message-ID: <20210726174640.6390-27-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Hg0IzW0EBIttTjNSXIVjKdRWYD-3R1zQ
X-Proofpoint-GUID: Hg0IzW0EBIttTjNSXIVjKdRWYD-3R1zQ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107260105
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
 sound/pci/hda/patch_cs8409.c | 23 ++++++++++++++++++++++-
 sound/pci/hda/patch_cs8409.h |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 54780b008547..64e3e0884e28 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <sound/core.h>
 #include <linux/mutex.h>
+#include <linux/iopoll.h>
 
 #include "patch_cs8409.h"
 
@@ -195,6 +196,7 @@ static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr)
 	read_data = cs8409_vendor_coef_get(codec, CS8409_I2C_QREAD);
 
 	mutex_unlock(&spec->i2c_mux);
+
 	return read_data & 0x0ff;
 
 error:
@@ -651,9 +653,28 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
 {
 	struct hda_codec *codec = cs42l42->codec;
 	unsigned int gpio_data;
+	int reg_cdc_status = 0;
+	const struct cs8409_i2c_param cs42l42_pwr_down_seq[] = {
+		{ 0x2301, 0x3F },
+		{ 0x2302, 0x3F },
+		{ 0x2303, 0x3F },
+		{ 0x2001, 0x0F },
+		{ 0x2A01, 0x00 },
+		{ 0x1207, 0x00 },
+		{ 0x1101, 0xFE },
+		{ 0x1102, 0x8C },
+		{ 0x1101, 0xFF },
+	};
+
+	cs8409_i2c_bulk_write(cs42l42, cs42l42_pwr_down_seq, ARRAY_SIZE(cs42l42_pwr_down_seq));
+
+	if (read_poll_timeout(cs8409_i2c_read, reg_cdc_status,
+			(reg_cdc_status & 0x1), CS42L42_PDN_SLEEP_US, CS42L42_PDN_TIMEOUT_US,
+			true, cs42l42, 0x1308) < 0)
+		codec_warn(codec, "Timeout waiting for PDN_DONE for CS42L42\n");
 
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
-	cs8409_i2c_write(cs42l42, 0x1101, 0xfe);
+	cs8409_i2c_write(cs42l42, 0x1102, 0x9C);
 	cs42l42->suspended = 1;
 	cs42l42->last_page = 0;
 
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 71dbbd8e2f3b..09987daa9cbf 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -233,6 +233,8 @@ enum cs8409_coefficient_index_registers {
 #define CS42L42_JACK_REMOVED			(0x00)
 #define CS42L42_I2C_TIMEOUT_US			(20000)
 #define CS42L42_I2C_SLEEP_US			(2000)
+#define CS42L42_PDN_TIMEOUT_US			(250000)
+#define CS42L42_PDN_SLEEP_US			(2000)
 
 /* Dell BULLSEYE / WARLOCK / CYBORG Specific Definitions */
 
-- 
2.25.1

