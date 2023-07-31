Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A4769D73
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2295F82A;
	Mon, 31 Jul 2023 18:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2295F82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822765;
	bh=K/EwlJSno/B6oU05nONp0qDj4l/4FXlHsv3sVYQrheg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jh1fJJqpKdtGtDpOLGpq5zdHd5G66smFD7CZc0h2Hh2dSrjdkF5i9AfaPFhavx+8A
	 0VTRhWg+9CzWpu2EkX9m8agAlV6hkWEq+ps/56yRPjpSESG09w7eHu80fsbgUH21c+
	 ND4WDUmOGfa7eIG0mLeJesP8H9nXc/Qj3JJnlo+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9391F8055B; Mon, 31 Jul 2023 18:57:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F02F8025A;
	Mon, 31 Jul 2023 18:57:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8731F80544; Mon, 31 Jul 2023 18:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E01C7F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01C7F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WejIqFMA
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJJ017071;
	Mon, 31 Jul 2023 11:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=7tXYtuHPujqaVHNe1XUnRwtzdST6xCvteK767YL3cjc=; b=
	WejIqFMAROEQlAOXVyi1lqXeaNMgfmBqJXKhpNwtVcwr4zPSjSjQ6xO8PsyeHmNl
	+SG5J4Ux85UvpCZRHN8OL6Di8RufFUclI7+3k219Mjhl3gLNEOT7sD7qIze9QFMg
	A+ciAKy/vMbnKLTvWDNFks2Cf2t0XFRJgpfbNvJUcRbQL/wMgXNWyZzItTt6kVZz
	DWQ4wF0oR4i1yzfAWP15sB8Ul59vSZawA0/4ZSAzRdeglm7rjjpNqtWEMbyaav0t
	TZNkZ2PoLYnKBBMR8TpTQxqceGfXs5NOKt+kph/JNARNMgheJRQWl/Bk3aAYLCis
	gWEyjlXbYSJs01U5i0dGIg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:32 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Mon, 31 Jul 2023 17:57:30 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 013A7475;
	Mon, 31 Jul 2023 16:57:29 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 1/9] ALSA: hda/cs35l56: Complete firmware reboot before
 calling cs_dsp_run()
Date: Mon, 31 Jul 2023 17:57:18 +0100
Message-ID: <20230731165726.7940-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 25uoaoNGsvz6CN9TtIiilzY2EMDVF4nX
X-Proofpoint-ORIG-GUID: 25uoaoNGsvz6CN9TtIiilzY2EMDVF4nX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HV33TYWIGBKORWHQ2J3FTYVCALUMVW3H
X-Message-ID-Hash: HV33TYWIGBKORWHQ2J3FTYVCALUMVW3H
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HV33TYWIGBKORWHQ2J3FTYVCALUMVW3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the call to cs_dsp_run() in cs35l56_hda_fw_load() so that it
is after the CS35L56 has been reset/reinit'd and the regmap
cache has been synced.

cs_dsp_run() syncs up ALSA control cache values with the DSP memory
so this must not be done until the firmware has reinitialized.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 4c3279f61b94..c3acda2daeeb 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -562,12 +562,6 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (coeff_filename)
 		dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
 
-	ret = cs_dsp_run(&cs35l56->cs_dsp);
-	if (ret) {
-		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
-		goto err;
-	}
-
 	if (cs35l56->base.secured) {
 		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
 		if (ret)
@@ -591,6 +585,11 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	regmap_clear_bits(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS,
 			  CS35L56_FIRMWARE_MISSING);
 	cs35l56->base.fw_patched = true;
+
+	ret = cs_dsp_run(&cs35l56->cs_dsp);
+	if (ret)
+		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
+
 err:
 	pm_runtime_put(cs35l56->base.dev);
 	mutex_unlock(&cs35l56->base.irq_lock);
-- 
2.30.2

