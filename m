Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3108939F2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:03:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1D0210C;
	Mon,  1 Apr 2024 12:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1D0210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711965813;
	bh=ytbdk9ATzNhhptJAmaMI5iRZMHBSQ9fDPjieda0njLI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H7plIxyN6NxR0/Ja205CJdiqRyhchjL5kFdRfTDWRaFDXdgrDn3aRQeiCfuIeLEut
	 sE4D2NJ3EFSFd82IYV4QxfKuYeT0T6YbrrxxYekCw/v8NcVPHS/doU2I+3jebTUiit
	 P76y9aGKPUWgHpZL5yTtuqjxpDzOO294hb2ZkeOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B5D5F805E8; Mon,  1 Apr 2024 12:02:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CF91F805F0;
	Mon,  1 Apr 2024 12:02:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC715F805A0; Mon,  1 Apr 2024 12:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EEC3F80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EEC3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o2zjf41l
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4315mEb1029960;
	Mon, 1 Apr 2024 05:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=x
	mumbNjNL9Qc9iJkPT+r1AH89MXCDyiepBXJF4K8ti8=; b=o2zjf41l+aGw7EYV0
	4IrKW9iF/eROtep8mj4l8XHO4n0soMbiXmH+zEOLwERRQkJrXnDfpEmIIVVpcOY/
	X5jCN+San3zn4IuX0lvS0raKEOfLsnxOz+XlR7F1zb2d8u/9GcGrevmJfawtm9+C
	xn94iGoYDZ8nhAJfWqAZX8ok+k5t1MMt+sBnpjGQSaaeTycr1u8j7HuKTraz2/xj
	wR4Qw1oxyz+vaKRmYBBSo/WfDqZaLeSBYv0x3O9MAAPCnLL0GJ+dDSnwhSrKmhg4
	tp2e+AbiUm6IQhADbaGExzcPseZH08TA/S81wftn8MsI0jDfiHAEaZQ6IHPXBhqy
	bmSQQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x6g4xhtw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 05:02:12 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Apr 2024
 11:02:10 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Mon, 1 Apr 2024 11:02:10 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2BA06820243;
	Mon,  1 Apr 2024 10:02:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 0/3] ASoC: Use snd_ctl_find_id_mixer() instead of
 open-coding
Date: Mon, 1 Apr 2024 10:02:07 +0000
Message-ID: <20240401100210.61277-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XbtUwJK1_38cS2DG-I7g7nom_euyCzv2
X-Proofpoint-GUID: XbtUwJK1_38cS2DG-I7g7nom_euyCzv2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: RKQSUWAMHLCLLIK74JMEDTC3NUZ6U3EY
X-Message-ID-Hash: RKQSUWAMHLCLLIK74JMEDTC3NUZ6U3EY
X-MailFrom: prvs=1821bd3749=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKQSUWAMHLCLLIK74JMEDTC3NUZ6U3EY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The first two patches change snd_soc_card_get_kcontrol() to use the
core snd_ctl_find_id_mixer() functionality instead of open-coding its
own list walk.

The last patch adds a KUnit test for this, which was tested on the
original and modified code.

Changes in V2:
Only change is in the KUnit test (patch #3) to make the const strings
more consty.

Richard Fitzgerald (3):
  ALSA: control: Introduce snd_ctl_find_id_mixer_locked()
  ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of open-coding
  ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol

 include/sound/control.h   |  23 +++++
 sound/soc/Kconfig         |   8 ++
 sound/soc/Makefile        |   4 +
 sound/soc/soc-card-test.c | 184 ++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-card.c      |  21 +----
 5 files changed, 223 insertions(+), 17 deletions(-)
 create mode 100644 sound/soc/soc-card-test.c

-- 
2.39.2

