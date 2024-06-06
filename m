Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B2A8FE787
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38736AE8;
	Thu,  6 Jun 2024 15:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38736AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717680018;
	bh=Tp6wP+IiUzNwJhS8uTGND8lmdrlCNCVC1Ss82iqyxQ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mRrX63cr9vweLt0uBylrwZKSs8f3B88XT3iaXCsH74sdzuV0yOtTZ2AWTYwLG7ZnG
	 f1xRopBJxlihQ8o7/u6yiUUh4utGjiy59YejgqBZv4X89lsjF6XLkQwNGjddnPveQ4
	 8zPTq7AspxH3uv94KuereSsPjAP490mwifqBdve4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3600BF805AA; Thu,  6 Jun 2024 15:19:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEECF804FF;
	Thu,  6 Jun 2024 15:19:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81ABDF802DB; Thu,  6 Jun 2024 15:19:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6052F800FA
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6052F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ku281UW2
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4564ueAa021615;
	Thu, 6 Jun 2024 08:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GUbMaD2PpQP+ANm8Yi6q+kmBfu7Q89wlNpJCsxvENus=; b=
	Ku281UW2JZgc+74MvOBpt1kzoc4KBoj2KMzcu7EyZSAlRXZtJwM15L/14uCWF1TT
	pNasOfmTWE0cc4ktgwO95hy31jKlnW4E0f+q5trfshKQDNT6CU0JxcL4g95/wPfJ
	tBA4YFcsv7ee9AcilUfShSH0F/Ngh7jul3bOO0Yy7T07pYaQl/Bz1vXQl++CqPlQ
	iNDKMFgj3ycTMnEuwHMVHlGGmCj8MG6mhtYSoTAt0JDM5lB/Prf/LKKR6NR2sBED
	XFP/YTPSjDWnpBPaSPxJdEOpB3R0XZEQsOJGgg/v/PWngsn3e+hHhA9gCPYetTdY
	UqB9sbfy2Li2Z44DKbfCLQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hn5xp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 08:03:59 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 14:03:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 6 Jun 2024 14:03:57 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.44])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5EDD4820259;
	Thu,  6 Jun 2024 13:03:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 3/4] ALSA: hda/realtek: Support Lenovo Thinkbook 16P Gen 5
Date: Thu, 6 Jun 2024 14:03:50 +0100
Message-ID: <20240606130351.333495-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606130351.333495-1-sbinding@opensource.cirrus.com>
References: <20240606130351.333495-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 583GiSrnpYDsCigqm-WQwWhFCSyubJ1c
X-Proofpoint-ORIG-GUID: 583GiSrnpYDsCigqm-WQwWhFCSyubJ1c
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DWE2JVCJKGEN2IRUBVXOPEIOXCCGIOQZ
X-Message-ID-Hash: DWE2JVCJKGEN2IRUBVXOPEIOXCCGIOQZ
X-MailFrom: prvs=388799c159=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWE2JVCJKGEN2IRUBVXOPEIOXCCGIOQZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for this laptop, which uses CS35L41 HDA amps.
The laptop does not contain valid _DSD for these amps, so requires
entries into the CS35L41 configuration table to function correctly.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aa76d1c88589..6cb258978666 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10544,6 +10544,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38d2, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38d7, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x38F9, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38FA, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
-- 
2.34.1

