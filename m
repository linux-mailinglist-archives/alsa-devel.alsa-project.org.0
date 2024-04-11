Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD38A128C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 13:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE5C2999;
	Thu, 11 Apr 2024 13:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE5C2999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712833744;
	bh=WE8aywv2td/MvVlWuBGjcgFxzQ9HR5GV4fL9GHl1Cv4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K2AcXqQ7gKiQ7/yCem5lJ4WQC6ODf13pWMuqnfZDpja76/LJhhOcaVDJu3W87yRzD
	 o9/Sm2Kl08SPZImNFrqmSkoajYdlsCpPlFmdaBGcsRoF5ExhHUPyKwe4enF6Ag7N00
	 gSBgz8GhVIAaNkpXn3u+2oaLzX/Wd5bVCgDl/vC4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1BA4F80588; Thu, 11 Apr 2024 13:08:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A1D1F805A0;
	Thu, 11 Apr 2024 13:08:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F931F80571; Thu, 11 Apr 2024 13:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E9D4F80130
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 13:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E9D4F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XjEhkZhK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43B5naJw004518;
	Thu, 11 Apr 2024 06:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=D
	79Rez7PJvpW2Si1z9kjEMVDWCn6Rpz4/F1YmXAVE5Y=; b=XjEhkZhKgHMaXOKGr
	4JmoAIVU+K5067DtGmDB1CW45w6yyJbPloZSbfzu34XIN+b3lfw37A0ILiNHBFCS
	6QrIVvCpRIuok7+b3D8oeSbib4JJeZBFyuPYW8fkXhyWzo1NfmhS24mlUSlESI7q
	ftCuDr5q7SwxVMusqBDtIsxPmko/KXM4z2ejcgQdpqwF0DaNSD1+MJwlsDmjvqIQ
	+frhfpzT2Nkhf0LCEJwOWDQDCEM5MJ03Ca4lUfeJJ5xQA5RL5nUi3AxsqwbtJYOn
	iMY5t9nrkyveRfMc1u15L8AOjRjmyZs7Yn4LDNy+ZHLpU+pNb23p86zfEmd0ViH0
	Pc8eg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xb2tjq7m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 06:08:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 12:08:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Thu, 11 Apr 2024 12:08:15 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.64.140])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3BC72820243;
	Thu, 11 Apr 2024 11:08:15 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/7] Add features, fixes and laptops for CS35L41 HDA
Date: Thu, 11 Apr 2024 12:08:06 +0100
Message-ID: <20240411110813.330483-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: a7_A5NFC7fRfi96eSrHxvNddiHitxgPP
X-Proofpoint-GUID: a7_A5NFC7fRfi96eSrHxvNddiHitxgPP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JV75UWZCCFKEPN5M36BTXFX6OGZRHJ3D
X-Message-ID-Hash: JV75UWZCCFKEPN5M36BTXFX6OGZRHJ3D
X-MailFrom: prvs=1831d0461d=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JV75UWZCCFKEPN5M36BTXFX6OGZRHJ3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This chain adds a number of improvements for CS35L41, including a new
firmware loading feature, as well as some additional cleanup.

Patch 1 adds support for a new firmware tuning file which is used to set
special tuning parameters used by the firmware. The HP Omen laptop added
in patches 2 and 3 use such a feature.

Patch 4 changes the DSP1RX5/6 Source used by the firmware to depend on
the boost type. A similar change in the ASoC driver will be needed later.

Patches 5 and 6 are cleanup patches, with the first of those re-using
cs-amp-lib for calibration which as added for CS35L56 drivers, ensuring
that all laptops are using the correct calibration values.

Patch 7 fixes a small error in the CS35L41 Property table for the
Lenovo Legion slim 7 16ARHA7.

Changes since v1:
- Fixed print statements based on warnings from kernel test robot

Richard Fitzgerald (1):
  ALSA: hda: cs35l41: Remove redundant argument to
    cs35l41_request_firmware_file()

Stefan Binding (6):
  ALSA: hda: cs35l41: Set the max PCM Gain using tuning setting
  ALSA: hda: cs35l41: Support HP Omen models without _DSD
  ALSA: hda/realtek: Add quirks for HP Omen models using CS35L41
  ALSA: hda: cs35l41: Update DSP1RX5/6 Sources for DSP config
  ALSA: hda: cs35l41: Use shared cs-amp-lib to apply calibration
  ALSA: hda: cs35l41: Remove Speaker ID for Lenovo Legion slim 7 16ARHA7

 include/sound/cs35l41.h              |   5 +
 sound/pci/hda/Kconfig                |   2 +
 sound/pci/hda/cs35l41_hda.c          | 347 +++++++++++++++++++--------
 sound/pci/hda/cs35l41_hda.h          |   6 +
 sound/pci/hda/cs35l41_hda_property.c |   8 +-
 sound/pci/hda/patch_realtek.c        |   4 +
 6 files changed, 265 insertions(+), 107 deletions(-)

-- 
2.34.1

