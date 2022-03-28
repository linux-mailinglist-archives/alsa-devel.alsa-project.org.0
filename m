Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079594E9601
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 13:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 806481877;
	Mon, 28 Mar 2022 13:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 806481877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648468684;
	bh=boLkLkGFHaNv6/qXO4K2ItJ62FWCjIKY9ruWrx2tOgU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oiNQ06B9h1k7/ya2MUZiYT9PI/C0bj87EWVXMctLT4DkmfP+5EdF+L5Hz4zAJxss/
	 bNCRIYS43rVY0wsdb6u8dlTBBY7HdNPExX1dhKAv5gmHiHR6kUEnH3JKXFPnviBArb
	 +DopZ2K5zxF6NKHPi2K962cSIADIbgCxp2/+JBOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE2D3F80517;
	Mon, 28 Mar 2022 13:56:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A239F80517; Mon, 28 Mar 2022 13:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 005ECF80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 13:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 005ECF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PiT97eDf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S89QbQ026189;
 Mon, 28 Mar 2022 06:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kiEn5VB/Wb3y2dfI5i5h5/iriKd0jxYjh1fSYi+iKpY=;
 b=PiT97eDfVAnl0usbap+IcaF4OW+fu5EIWTWETUMjIl8ZQ/4WYgj83hryH3/GqZngCww9
 s0ILdFmQs4TM3iX7Sh1d62/31JTcdTfTwcTBTHYRwOHF5pGl2jTgByimqZAeBZrzq1jc
 P9+fpyYyVDa10Rc6BKJvBVwFxvfhhqlXXNY1B4HHantMjc6y8nolaBnQVUQsDYHX4/Yd
 nzPgUVtOHhBDL1Oxz3aEPI9Zw3OThImwjVkDGiph9IGUcLO/E289dybiZYre+qU7Zoft
 8w/iPqWn0KrHOkNcf/624MxMAjVRaUIqJTyzDR6erNv0wJE7IfRyhXVurKlFQgrYaCvy 7w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3f1y8pad75-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 06:56:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 12:56:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 12:56:16 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.244])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4825DB1A;
 Mon, 28 Mar 2022 11:56:16 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/6] ALSA: hda/cs8409: Fix Full Scale Volume setting for
 all variants
Date: Mon, 28 Mar 2022 12:56:11 +0100
Message-ID: <20220328115614.15761-4-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328115614.15761-1-vitalyr@opensource.cirrus.com>
References: <20220328115614.15761-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tuZjagM1IgitpamjA_PzWHWUYu2Wg-On
X-Proofpoint-ORIG-GUID: tuZjagM1IgitpamjA_PzWHWUYu2Wg-On
X-Proofpoint-Spam-Reason: safe
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

All current variants (Bullseye/Warlock/Cyborg) should be using
reduced volume (-6dB) for better speaker protection.

Refactor to make more explicit the meaning and setting of
Full Scale Volume setting to avoid future confusion.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Changes in v2:
Add patch description in commit message.

---
 sound/pci/hda/patch_cs8409.c | 29 ++++++++++++++++-------------
 sound/pci/hda/patch_cs8409.h |  3 +++
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 1411e3845f16..163ff3b3092a 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -733,6 +733,7 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 		{ 0x130A, 0x00 },
 		{ 0x130F, 0x00 },
 	};
+	int fsv_old, fsv_new;
 
 	/* Bring CS42L42 out of Reset */
 	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
@@ -749,8 +750,13 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_bulk_read(cs42l42, irq_regs, ARRAY_SIZE(irq_regs));
 
-	if (cs42l42->full_scale_vol)
-		cs8409_i2c_write(cs42l42, 0x2001, 0x01);
+	fsv_old = cs8409_i2c_read(cs42l42, 0x2001);
+	if (cs42l42->full_scale_vol == CS42L42_FULL_SCALE_VOL_0DB)
+		fsv_new = fsv_old & ~CS42L42_FULL_SCALE_VOL_MASK;
+	else
+		fsv_new = fsv_old & CS42L42_FULL_SCALE_VOL_MASK;
+	if (fsv_new != fsv_old)
+		cs8409_i2c_write(cs42l42, 0x2001, fsv_new);
 
 	/* we have to explicitly allow unsol event handling even during the
 	 * resume phase so that the jack event is processed properly
@@ -997,21 +1003,15 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * Additionally set HSBIAS_SENSE_EN and Full Scale volume for some variants.
 		 */
 		switch (codec->fixup_id) {
-		case CS8409_WARLOCK:
-			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
-			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 1;
-			break;
-		case CS8409_BULLSEYE:
-			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
-			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 0;
-			break;
 		case CS8409_CYBORG:
 			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x00a0;
-			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 1;
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
+				CS42L42_FULL_SCALE_VOL_MINUS6DB;
 			break;
 		default:
-			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0003;
-			spec->scodecs[CS8409_CODEC0]->full_scale_vol = 1;
+			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
+				CS42L42_FULL_SCALE_VOL_MINUS6DB;
 			break;
 		}
 
@@ -1222,6 +1222,9 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		cs8409_fix_caps(codec, DOLPHIN_LO_PIN_NID);
 		cs8409_fix_caps(codec, DOLPHIN_AMIC_PIN_NID);
 
+		spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_MINUS6DB;
+		spec->scodecs[CS8409_CODEC1]->full_scale_vol = CS42L42_FULL_SCALE_VOL_MINUS6DB;
+
 		break;
 	case HDA_FIXUP_ACT_PROBE:
 		/* Fix Sample Rate to 48kHz */
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index d0b725c7285b..8e846f292cd0 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -235,6 +235,9 @@ enum cs8409_coefficient_index_registers {
 #define CS42L42_I2C_SLEEP_US			(2000)
 #define CS42L42_PDN_TIMEOUT_US			(250000)
 #define CS42L42_PDN_SLEEP_US			(2000)
+#define CS42L42_FULL_SCALE_VOL_MASK		(2)
+#define CS42L42_FULL_SCALE_VOL_0DB		(1)
+#define CS42L42_FULL_SCALE_VOL_MINUS6DB		(0)
 
 /* Dell BULLSEYE / WARLOCK / CYBORG Specific Definitions */
 
-- 
2.25.1

