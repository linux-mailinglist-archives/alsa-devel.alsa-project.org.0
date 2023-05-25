Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B96710DD2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 16:01:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E83B3E7;
	Thu, 25 May 2023 16:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E83B3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685023315;
	bh=O6JACBOybLFKiDCKUHXpkKR022gig8ragcTiQpzMQbQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZRx5XSEh6puVPerxDEQgVXKZAkwgItieNJeHkXQBfMioYSAzoTWyWNFpynBjJleKS
	 O/sORqCuQE1RpbDtnWi+GHuK76lBd5u3LPP+JJ6ir+X+hVC98Lot4j3YlCM+3KWm1D
	 S62DoTxqytagDWZE/FnHsyoYjc/Q5Z1tLHCbzx5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42205F80549; Thu, 25 May 2023 16:00:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0BFF80548;
	Thu, 25 May 2023 16:00:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A88E2F8026A; Thu, 25 May 2023 16:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCA01F800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 16:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA01F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LjovRqGn
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PBPhU2006105;
	Thu, 25 May 2023 09:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=I3l9dEf9Pxrt0iwsB+1r4Bv1ieTEMmtO3O+2uHhuyLc=;
 b=LjovRqGnqJBLgMnsb+RmNOQD7sbuLvL4avbkpPfOwJbdERZBaGjUvGtiuPgtqZ5t6KKm
 d1eH3bbHQloTje/fWpecbdxj+j2mD8PR+0A/nH8K769/KosJ7ggQHkInoptc7X72OQO8
 Uwn/rCh54gQhiim3/i5EHxYBpJwgrlwU4Ep57jPssb7bG8/SsG2mqoRczVbyJtgND40n
 TR99g+ARvkSgw3BZgFUA0/DCOPovexzFmvsKOcq3hpGXbFbDQHkGHxtZDdaNh+5V6JEb
 9utSVcSszXSf2Qo0jKOsWJLRfkQel16f30PTGbEBmjop/0PEM8wdDSKSwFIe7Qe2XCE9 nQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm6wbf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 09:00:05 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 09:00:03 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 09:00:03 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.43])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2591945;
	Thu, 25 May 2023 14:00:03 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 1/3] ALSA: hda: cs35l41: Clean up Firmware Load
 Controls
Date: Thu, 25 May 2023 14:59:53 +0100
Message-ID: <20230525135955.2108140-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525135955.2108140-1-sbinding@opensource.cirrus.com>
References: <20230525135955.2108140-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SDkSKi_mbC0gP72s9JAp318146wTbO-a
X-Proofpoint-GUID: SDkSKi_mbC0gP72s9JAp318146wTbO-a
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5BTXPSJCYUCXTV6CKAYSOPX4SC4256GX
X-Message-ID-Hash: 5BTXPSJCYUCXTV6CKAYSOPX4SC4256GX
X-MailFrom: prvs=0509245bd3=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BTXPSJCYUCXTV6CKAYSOPX4SC4256GX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Ensure Firmware Load control and Firmware Type control
returns 1 when the value changes.

Remove fw_mutex from firmware load control put, since it is
unnecessary, and prevents any possibility of mutex inversion.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index b5210abb5141f..d100189e15b83 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -835,34 +835,26 @@ static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
 	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
-	unsigned int ret = 0;
-
-	mutex_lock(&cs35l41->fw_mutex);
 
 	if (cs35l41->request_fw_load == ucontrol->value.integer.value[0])
-		goto err;
+		return 0;
 
 	if (cs35l41->fw_request_ongoing) {
 		dev_dbg(cs35l41->dev, "Existing request not complete\n");
-		ret = -EBUSY;
-		goto err;
+		return -EBUSY;
 	}
 
 	/* Check if playback is ongoing when initial request is made */
 	if (cs35l41->playback_started) {
 		dev_err(cs35l41->dev, "Cannot Load/Unload firmware during Playback\n");
-		ret = -EBUSY;
-		goto err;
+		return -EBUSY;
 	}
 
 	cs35l41->fw_request_ongoing = true;
 	cs35l41->request_fw_load = ucontrol->value.integer.value[0];
 	schedule_work(&cs35l41->fw_load_work);
 
-err:
-	mutex_unlock(&cs35l41->fw_mutex);
-
-	return ret;
+	return 1;
 }
 
 static int cs35l41_fw_type_ctl_get(struct snd_kcontrol *kcontrol,
@@ -881,8 +873,12 @@ static int cs35l41_fw_type_ctl_put(struct snd_kcontrol *kcontrol,
 	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
 
 	if (ucontrol->value.enumerated.item[0] < HDA_CS_DSP_NUM_FW) {
-		cs35l41->firmware_type = ucontrol->value.enumerated.item[0];
-		return 0;
+		if (cs35l41->firmware_type != ucontrol->value.enumerated.item[0]) {
+			cs35l41->firmware_type = ucontrol->value.enumerated.item[0];
+			return 1;
+		} else {
+			return 0;
+		}
 	}
 
 	return -EINVAL;
-- 
2.34.1

