Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970D85E07E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A05783E;
	Wed, 21 Feb 2024 16:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A05783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708527982;
	bh=UyKUyA0qy67u/z9olIiAbwtiRO0bhToCby8jmDX8fYg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GyfUVtcCEMBInqUGgO52RuN50azDigG6cAynISzBFJ9VQzlaytolM8bGNjdF/LRo8
	 aCPfkqCOIambqp8M2YXERmQWZ0IZNW4FpNnihjdvjMVopUfsNb344pa8lXWYpaL+7F
	 r6KcKAYQDEpDx2F8dPdqUFa/tw5txZ4oJAeNIl88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E274DF805B5; Wed, 21 Feb 2024 16:05:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 327DAF805AA;
	Wed, 21 Feb 2024 16:05:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76467F80578; Wed, 21 Feb 2024 16:05:23 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F117F8047D
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F117F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mzO4ha5z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41LCUQsF011338;
	Wed, 21 Feb 2024 09:05:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=GPX9S1rm9Vg8m5o14NSvRKfN2x1/7W0W6eYoN9/iRhQ=; b=
	mzO4ha5zy8nyIjrVN2bdR++IumITPnNQBE1Rnu3EWPYm4e2Iy8sKD53722eVlyVR
	CZWirtpVIqTH/GAsp35DtOPAhssdnG5gTzLXQDILZNOPQIZklk7fMMXytYm5eZDX
	Fn3Hftjs4a1RwPjmCyjbz+nKbvV0ZipvI1qDpfT3OHjAQTzj2SAw1NyPE/Ha5aCP
	e0StsRlVcPDXsQq0BR+vdqvpkLzrKy9U8vTkk25G4ygO30YJujQtvVPUwAIf55K1
	yrhD3/4NcZZCtkR5BepZIyJSTm9RHHQkH/4ihWtQT2pzPduVWE4bguQ5xLarHwPo
	8VPu8g8aTlwkHOmufmr5CQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205h4tk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 09:05:09 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 15:05:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 15:05:07 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 248E0820249;
	Wed, 21 Feb 2024 15:05:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 2/9] ALSA: hda: hda_cs_dsp_ctl: Only call notify when a
 control has been added to a card
Date: Wed, 21 Feb 2024 15:05:00 +0000
Message-ID: <20240221150507.1039979-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240221150507.1039979-1-rf@opensource.cirrus.com>
References: <20240221150507.1039979-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dLqKW47PULXLedpvlwNu-fXJ16-lFzlY
X-Proofpoint-GUID: dLqKW47PULXLedpvlwNu-fXJ16-lFzlY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4IUBT2FIDJXPE4ICBDVHYJK7UHXDAE3G
X-Message-ID-Hash: 4IUBT2FIDJXPE4ICBDVHYJK7UHXDAE3G
X-MailFrom: prvs=97814b2c7f=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IUBT2FIDJXPE4ICBDVHYJK7UHXDAE3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

There is a window of time where the cs_dsp_coeff_ctl has been created
but has not been registered as a control with ALSA.

The hda_cs_dsp_write_ctl() helper function can be used update the cs_dsp
coefficient before it has been registered, but it should only call
snd_ctl_notify() once the control is associated with a card.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e414b05e724f ("ALSA: hda: hda_cs_dsp_ctl: Add apis to write the controls directly")
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 463ca06036bf..0f5fdd44721c 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -224,9 +224,10 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 	if (ret == 0 || (cs_ctl->flags & WMFW_CTL_FLAG_SYS))
 		return 0;
 
+	/* Notify when a control has been added to a card */
 	ctl = cs_ctl->priv;
-
-	snd_ctl_notify(ctl->card, SNDRV_CTL_EVENT_MASK_VALUE, &ctl->kctl->id);
+	if (ctl && ctl->kctl)
+		snd_ctl_notify(ctl->card, SNDRV_CTL_EVENT_MASK_VALUE, &ctl->kctl->id);
 
 	return 0;
 }
-- 
2.30.2

