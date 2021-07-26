Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C13D666D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:07:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71DB21893;
	Mon, 26 Jul 2021 20:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71DB21893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627322859;
	bh=VoFnwiCiIJs8QMrIz9Exw0NfGe0b91ZLPDdSZT5J1yA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYUX7yzVmPid3QlTFKTWdiEXDBdFHDEM0FFSgTNE6NerW7XxhMh1l8uDEFL4F9q8P
	 lEMkS0o+419htI/5byXpSGi3WbTXk6xNrZxEmHYBkDtdj7OQSIHdiG4OgJFBTNzLmX
	 WMLh/u6rxlrOOsuqxYJ0Zklo34m4eDismxJkIJEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE6FF8025A;
	Mon, 26 Jul 2021 20:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7098AF8051F; Mon, 26 Jul 2021 20:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF393F8025E
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF393F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="S/rL+4Uk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYd6012545; 
 Mon, 26 Jul 2021 13:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=HcdLcTkyvqEoCBs0sD2aNtCbWRUiRKRDZFgwgTeHTRs=;
 b=S/rL+4UkYkiM684v7Z2eFWJTP6pVx458I+F9sk9yKtPHEoDsSnmOCxmVjVklV2ub6juQ
 P1GVIPQ4+HZzVAXSv9GqJCFFXp+cp7cYnRu62sqrnCiqdyGwUKTie3yZcIOZk1V4ALwN
 7RXFiz3TYErcTWja/c8PurBiSLw+AjKQEELjJ2gDlQ0M/msykbgiqjhJnDMfc1s6qB8z
 DOqbaXUEe25dE7hxV+H3YOkMLg1IpJhc2tKM2jcr97kVCfTf8FcFDNt2qLlvt6Uycq8d
 t+CCEfDBaBLC2bOQseR+bMRvS5DfdyRXAhFcFbAuiB2F/uiFm3M7ck6QbvV/o6Im6Ldu iQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhhav-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:03:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:06 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7DD732BA;
 Mon, 26 Jul 2021 17:47:06 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 11/27] ALSA: hda/cs8409: Prevent I2C access during suspend time
Date: Mon, 26 Jul 2021 18:46:24 +0100
Message-ID: <20210726174640.6390-12-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kqeljUQx4mzTBJAE_oPR0RUbJDkMP9PW
X-Proofpoint-ORIG-GUID: kqeljUQx4mzTBJAE_oPR0RUbJDkMP9PW
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260105
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 14 ++++++++++++++
 sound/pci/hda/patch_cs8409.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 4ad832f5c4ba..0b13bcecd778 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -127,9 +127,13 @@ static int cs8409_i2c_wait_complete(struct hda_codec *codec)
 static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, unsigned int i2c_reg,
 			   unsigned int paged)
 {
+	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
 	unsigned int read_data;
 
+	if (spec->cs42l42_suspended)
+		return -EPERM;
+
 	cs8409_enable_i2c_clock(codec, 1);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
 
@@ -172,8 +176,12 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, unsigned int i2c_reg,
 			    unsigned int i2c_data, unsigned int paged)
 {
+	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
 
+	if (spec->cs42l42_suspended)
+		return -EPERM;
+
 	cs8409_enable_i2c_clock(codec, 1);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
 
@@ -371,6 +379,8 @@ static void cs8409_cs42l42_reset(struct hda_codec *codec)
 	/* wait ~10ms */
 	usleep_range(10000, 15000);
 
+	spec->cs42l42_suspended = 0;
+
 	mutex_lock(&spec->cs8409_i2c_mux);
 
 	/* Clear interrupts, by reading interrupt status registers */
@@ -594,6 +604,9 @@ static int cs8409_suspend(struct hda_codec *codec)
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe, 1);
 	mutex_unlock(&spec->cs8409_i2c_mux);
+
+	spec->cs42l42_suspended = 1;
+
 	/* Assert CS42L42 RTS# line */
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
 
@@ -759,6 +772,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 
 		spec->cs42l42_hp_jack_in = 0;
 		spec->cs42l42_mic_jack_in = 0;
+		spec->cs42l42_suspended = 1;
 
 		/* Basic initial sequence for specific hw configuration */
 		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 1d3ce28415fa..0f2084b6ec8e 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -269,6 +269,7 @@ struct cs8409_spec {
 	unsigned int cs42l42_hp_jack_in:1;
 	unsigned int cs42l42_mic_jack_in:1;
 	unsigned int cs42l42_volume_init:1;
+	unsigned int cs42l42_suspended:1;
 	char cs42l42_hp_volume[CS42L42_HP_CH];
 	char cs42l42_hs_mic_volume[CS42L42_HS_MIC_CH];
 
-- 
2.25.1

