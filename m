Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70889FBFD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 17:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C0D22AB;
	Wed, 10 Apr 2024 17:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C0D22AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712764394;
	bh=o3DwarwxHTtJLxyfU+gS+zpcTq9MIyicGXOtcRLg83A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ieiu6M5GGtyx1EwNVwbSvosj7/3KypA8qWG64fM1DKYCY1NMk/82eA3cgcKF0TgwF
	 J3y4/f0JVbP2TRZHFkghVeFMVEGZwRU2pBI3N0x+j497nRWc2b2b9+FkFfUQOUjsSu
	 G/uzsgRKJwW6+AnIQurrw+yapKkWxYd11EfWGKm0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBFD8F805A9; Wed, 10 Apr 2024 17:52:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07EBCF805A0;
	Wed, 10 Apr 2024 17:52:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0685F8055C; Wed, 10 Apr 2024 17:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D201AF8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 17:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D201AF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YmxNtdYN
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43A5bInW024942;
	Wed, 10 Apr 2024 10:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=V
	XTXJ3r/zRmgxQbCkoh4V/VZtDv9E0bD/1zpmkcNfkc=; b=YmxNtdYNu5Nm2t9qx
	osz/9fzsyoOOtktaHGrmlTSzKd5bt4UTdrh8/NHZNRG6Nkhau5awM043P8KCwTVl
	AYKBf+1+tyGL+wfh+sEtBhTcS1c22Z4l8uX8kfDv2E/PlLfCBjkvydgkncvxhcUM
	XvMc/V6SU8vJHZwwj/3c/aP2vb2+iGS2o347w0lID/7COll8ZLB3COsYohId0TOY
	3AY7jnRGbJ1TI05BaTVc5yJjUegrdM/LdjDDcP1i6/KrMvbvGl+0aFTrdBOhOMXe
	TJe+RQ2I/yUSKPLaEQPKqF6B8y2qxlKPgEjmmfh8ZCfeyc6a9BtAKf2Di7tyFUYz
	GeVGg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xb2tjnhdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 10:52:26 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Apr
 2024 16:52:25 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Apr 2024 16:52:25 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (SHANCC79D24.ad.cirrus.com
 [198.61.64.86])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3B07382024A;
	Wed, 10 Apr 2024 15:52:25 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/7] Add features, fixes and laptops for CS35L41 HDA
Date: Wed, 10 Apr 2024 16:52:16 +0100
Message-ID: <20240410155223.7164-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eg55F8S-Epr8R_fKhq1YLKT9zIl0ZUpX
X-Proofpoint-GUID: eg55F8S-Epr8R_fKhq1YLKT9zIl0ZUpX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DPUSPP3FKSENR2BI4TZ2XR6KFLOZA5ER
X-Message-ID-Hash: DPUSPP3FKSENR2BI4TZ2XR6KFLOZA5ER
X-MailFrom: prvs=1830201b57=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPUSPP3FKSENR2BI4TZ2XR6KFLOZA5ER/>
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

