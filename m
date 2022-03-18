Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB86E4DDD6F
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 16:59:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F1AF187B;
	Fri, 18 Mar 2022 16:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F1AF187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647619144;
	bh=BJhQr9VBhQIJduXi1eRvMrC970yKBqiPrsYgUH6kc5w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tvftgig7H6gxbJGT+bjvi5SRYzEaSxI/dJBDPUA5EIAwSgIhJJ75oEVtL0DiD6P6p
	 wtUJCL6/W1H+23nzenKYkZrlXl73nQHg/tkmp6WjnAPXyzg2W4/U58+Qm9jehSYWVJ
	 MU064Zo/Fxq3T3L+WbXTeK7armVsLcSDCIhALvFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42021F80279;
	Fri, 18 Mar 2022 16:56:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 577FDF80279; Fri, 18 Mar 2022 16:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9AA7F80279
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 16:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9AA7F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OfDhq2Uu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22I7cSuE022149;
 Fri, 18 Mar 2022 10:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Z9kbc2iZs4zHIK+C/HKRIGquRTDVsrdl0296zsGzzOg=;
 b=OfDhq2UuAsSMS8v4kTct+EjJaLdgNU6iRLMJlJiFIbJd8agqCxSbx4QYIREphGuPaGIH
 vUQ5TgpBr6Iks3vU17dZamNJ4fsE7H4oqagRp3HEiA0wC9wUXEdFkEk3+Uh6CfX1/COK
 V9zScwUF8qWCDRMn+QaqNF8xHT84m9Iub7M3sQRIRHkw+rc/23TA7v1X/aKzoK8nwzdI
 7Wk61vgGRz7zb2p5Zst2VHwJXaURlBblRwlKY8nguWaLbvM+Una4XbWi5QGgQU/+hHDf
 fSINfYkTjY5Zi6QbtyYbRg8BlXZf3rUDbRw6jYQcdoG7s5pLrDZNxiszsSfBLho42Xb5 VA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3et642ee6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Mar 2022 10:55:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Mar
 2022 15:55:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 18 Mar 2022 15:55:54 +0000
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.229])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 42F7711D1;
 Fri, 18 Mar 2022 15:55:54 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/6] ALSA: hda/cs8409: Fix Full Scale Volume setting for all
 variants
Date: Fri, 18 Mar 2022 15:55:49 +0000
Message-ID: <20220318155552.24751-4-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318155552.24751-1-vitalyr@opensource.cirrus.com>
References: <20220318155552.24751-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GqtRrS6FuqPrHbfwJNsY6mrjoWHzYnEo
X-Proofpoint-ORIG-GUID: GqtRrS6FuqPrHbfwJNsY6mrjoWHzYnEo
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

Also make more explicit meaning and setting of Full Scale Volume
setting to avoid future confusion.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
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

