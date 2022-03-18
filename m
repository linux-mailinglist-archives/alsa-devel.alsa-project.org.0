Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B8C4DDD6D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 16:58:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299A018B9;
	Fri, 18 Mar 2022 16:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299A018B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647619125;
	bh=NP3jmYskwdqG5db1d5JllzXo6sWDhUEqYa+2tlgl7fw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRjWrR3xLucgUvQxS68cLyB6OJYnxa2xBk5af3tA+4p3yBTemgsm5/pH8MZngfFA8
	 +hXlw0q6BvFBcmdlabDtICngbng70TBia44kgbJPgtFaLMP70/zif5Yzuc6cS8Ly9N
	 Lp8NBBb+dNswAL5AULARtPJJS5RFku8fW8xLwtQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE5FFF8052D;
	Fri, 18 Mar 2022 16:56:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 532FBF8052E; Fri, 18 Mar 2022 16:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACE09F80271
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 16:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE09F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="My0J3LaK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22I7cSuF022149;
 Fri, 18 Mar 2022 10:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=3klzixPaUORRG4vi7yBDbGgciraqNg82f+RLAgzmDXc=;
 b=My0J3LaKZlm2eCD7ddrt/KWPn0zkesz74M27JkFLXbuJoz8jRXhBL0c3EKO+cu+ANWd/
 B38v6lsDlW5CVz5EqjYBxEoSYvzO4vxSYlRmi5Fo7xXT6mhtxiWb/FtW0cfaxdGuqvt8
 cMEO6JMZaZg60pTTvumvRCPLm0URkklHYc0wfr2SmTwQusSbi/zlVzIylc/cSgaHBO9y
 Cnp4NhoJYW4KR9yvulGbY8KW5PpqJHe+PjnVeA3lS0Nzvyv0hjJrleKTCkay7g7nEntM
 KQH3Px1oICUCzPslyXfYXbofEsERmndebHvxKynzdoizko9kUPAzT7tjKpCZRdWZDmvX 2g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3et642ee6v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Mar 2022 10:55:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Mar
 2022 15:55:55 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 18 Mar 2022 15:55:55 +0000
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.229])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F3ACCB1A;
 Fri, 18 Mar 2022 15:55:54 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/6] ALSA: hda/cs8409: Disable HSBIAS_SENSE_EN for Cyborg
Date: Fri, 18 Mar 2022 15:55:51 +0000
Message-ID: <20220318155552.24751-6-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318155552.24751-1-vitalyr@opensource.cirrus.com>
References: <20220318155552.24751-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: x6h7dbTqd5is0AMPVkWxPNxMK9qMbRG5
X-Proofpoint-ORIG-GUID: x6h7dbTqd5is0AMPVkWxPNxMK9qMbRG5
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

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 85da4a5e84a8..343fabc4387d 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -913,13 +913,13 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	}
 
 	switch (codec->fixup_id) {
-		case CS8409_CYBORG:
-		case CS8409_WARLOCK_MLK_DUAL_MIC:
-			/* DMIC1_MO=00b, DMIC1/2_SR=1 */
-			cs8409_vendor_coef_set(codec, CS8409_DMIC_CFG, 0x0003);
-			break;
-		default:
-			break;
+	case CS8409_CYBORG:
+	case CS8409_WARLOCK_MLK_DUAL_MIC:
+		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
+		cs8409_vendor_coef_set(codec, CS8409_DMIC_CFG, 0x0003);
+		break;
+	default:
+		break;
 	}
 
 	cs42l42_resume(cs42l42);
@@ -1005,15 +1005,8 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		cs8409_fix_caps(codec, CS8409_CS42L42_HP_PIN_NID);
 		cs8409_fix_caps(codec, CS8409_CS42L42_AMIC_PIN_NID);
 
-		/* Set TIP_SENSE_EN for analog front-end of tip sense.
-		 * Additionally set HSBIAS_SENSE_EN and Full Scale volume for some variants.
-		 */
+		/* Set HSBIAS_SENSE_EN and Full Scale volume for some variants. */
 		switch (codec->fixup_id) {
-		case CS8409_CYBORG:
-			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x00a0;
-			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
-				CS42L42_FULL_SCALE_VOL_MINUS6DB;
-			break;
 		case CS8409_WARLOCK_MLK:
 		case CS8409_WARLOCK_MLK_DUAL_MIC:
 			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
-- 
2.25.1

