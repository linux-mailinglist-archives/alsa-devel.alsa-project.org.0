Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0B85E07D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:06:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5473CA4A;
	Wed, 21 Feb 2024 16:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5473CA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708527971;
	bh=o0VHwBur7YDYr4Uh94axW4ZBNdf1MG7SOeDF2lLNNYA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SUAHhbpGTpJ65t+vpYqcbGxuGK/VfC18Hj7BmFlDSAv9A3RfpWM9nhZR+keI5mKON
	 678SQW4zPvQW2EcIUYSm0DPt2RqriCSuZnRr6VI0OiOjEhtEeWJM/HTP5Yo2HdDIc8
	 V2INiZCRwA/VgcuxdM4fUxOtWsnD32mvCuBx9uY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7242FF805CA; Wed, 21 Feb 2024 16:05:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C72F8057F;
	Wed, 21 Feb 2024 16:05:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF113F80578; Wed, 21 Feb 2024 16:05:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 826A0F8019B
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 826A0F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=E8hxy5Qq
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41LCUQsE011338;
	Wed, 21 Feb 2024 09:05:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=9
	LszOJrKtOt+zOe37M1iiqx1CmUj75Si8zBC5ZDgvGE=; b=E8hxy5Qq3G5MRNH36
	ocJ9eXz/dfx5TYX2MiwAE3p9wie8RLMP7hXX7a6ST2E38zkD9ZVwWZsjxPbvjJiQ
	9xFZ4mE3zrwTrTMq5hxI0l86R8LJKC5VbiD5+9vwEz1wPxx81e7fd81X8fKGPtZP
	QUy16NQayMU7/R3kyKnS3tQeO3L0i3nbAw7dhUHaQtIWaZlGBJs0ZZwjLKFSHgSP
	ifqjqIvytclXCbk3svDtVFi8c1ClNLTMPQ3MSvOC6z4sktg6Z0GvikFo38yfr9/o
	gwH74OYwhIfYNQ9WPUtDdBD6IHTsK1ZCsbgkapyJhIBxwfAQPJ+gP+DcTQ3Mgq4R
	8Mtaw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205h4tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 09:05:08 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 15:05:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 15:05:07 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 131A4820241;
	Wed, 21 Feb 2024 15:05:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 0/9] ALSA: cs35l56: Apply calibration from EFI
Date: Wed, 21 Feb 2024 15:04:58 +0000
Message-ID: <20240221150507.1039979-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GC49faqhZ8lw-AhLJf2EQ9AmyM9oYTyw
X-Proofpoint-GUID: GC49faqhZ8lw-AhLJf2EQ9AmyM9oYTyw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NOIZMO3QIRBRDUWAM4UTFSBI5WYV32FU
X-Message-ID-Hash: NOIZMO3QIRBRDUWAM4UTFSBI5WYV32FU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NOIZMO3QIRBRDUWAM4UTFSBI5WYV32FU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Factory calibration of the speakers stores the calibration information
into an EFI variable.

This set of patches adds support for applying speaker calibration
data from that EFI variable.

Patch #1 and #2 are bugfixes that are prerequisites.

The HDA patches #7 and #8 depend on the ASoC patches.

Patch #9 is a KUnit test for the new cs-amp-lib library.

Richard Fitzgerald (8):
  ASoC: wm_adsp: Fix missing mutex_lock in wm_adsp_write_ctl()
  ASoC: wm_adsp: Add wm_adsp_start() and wm_adsp_stop()
  ASoC: cs-amp-lib: Add helpers for factory calibration data
  ASoC: cs35l56: Add helper functions for amp calibration
  ASoC: cs35l56: Apply amp calibration from EFI data
  ALSA: hda: hda_cs_dsp_ctl: Add helper function to write calibration
  ALSA: hda: cs35l56: Apply amp calibration from EFI data
  ASoC: cs-amp-lib: Add KUnit test for calibration helpers

Simon Trimmer (1):
  ALSA: hda: hda_cs_dsp_ctl: Only call notify when a control has been
    added to a card

 include/sound/cs-amp-lib.h         |  66 +++
 include/sound/cs35l56.h            |  10 +
 sound/pci/hda/Kconfig              |   2 +
 sound/pci/hda/cs35l56_hda.c        |  36 +-
 sound/pci/hda/hda_cs_dsp_ctl.c     |  52 ++-
 sound/pci/hda/hda_cs_dsp_ctl.h     |   4 +
 sound/soc/codecs/Kconfig           |  18 +
 sound/soc/codecs/Makefile          |   4 +
 sound/soc/codecs/cs-amp-lib-test.c | 709 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs-amp-lib.c      | 270 +++++++++++
 sound/soc/codecs/cs35l56-sdw.c     |  20 +
 sound/soc/codecs/cs35l56-shared.c  |  83 ++++
 sound/soc/codecs/cs35l56.c         |  43 +-
 sound/soc/codecs/wm_adsp.c         |  30 +-
 sound/soc/codecs/wm_adsp.h         |   2 +
 15 files changed, 1328 insertions(+), 21 deletions(-)
 create mode 100644 include/sound/cs-amp-lib.h
 create mode 100644 sound/soc/codecs/cs-amp-lib-test.c
 create mode 100644 sound/soc/codecs/cs-amp-lib.c

-- 
2.30.2

