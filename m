Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A64E483A7E0
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 12:31:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1AF3E7;
	Wed, 24 Jan 2024 12:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1AF3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706095898;
	bh=kV/sxm1U0+3xpgRr2Rkrcgch+1wluHu/zLwXJZP8viE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=buYagDzodVGgY7fIZN59TIVmrbd3x2W02zdoOapa4mGqAyqFwfDYqX8TSJJzYJsnb
	 pqmHgPX3cA0sEDOIFwR9NDjdod71tCdcWE5uHvwTAqoIK21nFCn1+KiB0ym9of+nve
	 77tLi8Lz3kFwnEizW/LmCsU5nk3wFmXj5U8nyjeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25460F805C4; Wed, 24 Jan 2024 12:30:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD33F8057A;
	Wed, 24 Jan 2024 12:30:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B5EDF802BE; Wed, 24 Jan 2024 12:26:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F04B0F80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 12:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04B0F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mMlvmbJs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O5ABQp018377;
	Wed, 24 Jan 2024 05:26:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=n
	5r0vO0PazysdxJ9oNYTV9c+7VMZDjyUxc5PUe3ztBE=; b=mMlvmbJsTn/xyJx+1
	Yh51sHFkK+56IgiIngJDJ/7ZFjU30Borj7BrF5jmEf4nZUV+s9saHkxz6vB6g9AL
	AxkZOhELxBREfMWcMwO4Z2xWtwkXsEXoKceXAKSFgp6Vx7lJeWDt6yE0K+DyJRMm
	IgW+HjJNl1qyvTfu1QGemaL0QaL6Ve0vmXavG7Y59wEq+wVZnFEeGQaiQE/i1l8j
	zzZ4bCeP4MVT57PeZdThPJXNtswrzxdJCz0yJYCn12roYKGKoBmMMRLAc1WDpg0p
	s/UTjdFWq9jnhq2QDKkgwxkt09K2M0ryBOc6b0cdlmQdUsvQZwmm8k9K/bDuztQ0
	cBY8Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhgqah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 05:26:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 11:26:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 11:26:07 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.251.117])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 82E1B820243;
	Wed, 24 Jan 2024 11:26:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <soyer@irl.hu>, <shenghao-ding@ti.com>
CC: <perex@perex.cz>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 0/2] ALSA: hda: Move component binding support into separate
 library
Date: Wed, 24 Jan 2024 11:26:05 +0000
Message-ID: <20240124112607.77614-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: twIJfo5xVnJV5rQPc3hZTj21K2X2vnK1
X-Proofpoint-GUID: twIJfo5xVnJV5rQPc3hZTj21K2X2vnK1
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UHPJ3U4HNAISFNN5FU7ICZVZOILIUICN
X-Message-ID-Hash: UHPJ3U4HNAISFNN5FU7ICZVZOILIUICN
X-MailFrom: prvs=875330d341=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHPJ3U4HNAISFNN5FU7ICZVZOILIUICN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cirrus Logic amplifiers are currently paired with Realtek HDA codecs.
But they could be used with other codecs. To prepare for this, these two
patches move the manager side of the component binding out of the Realtek
driver into a library module.

The first patch tweaks the CS35L41 code so that it is not hardcoded to
CS35L41, and changes the TAS2781 handling so that it re-uses that code
instead of having a near-identical copy of it.

Can someone please test that these two patches don't break TAS2781?
I have checked that they should work in theory but I don't have hardware
to test on.

Richard Fitzgerald (2):
  ALSA: hda: realtek: Re-work CS35L41 fixups to re-use for other amps
  ALSA: hda: realtek: Move hda_component implementation to module

 MAINTAINERS                   |   1 +
 sound/pci/hda/Kconfig         |   4 +
 sound/pci/hda/Makefile        |   2 +
 sound/pci/hda/hda_component.c | 169 ++++++++++++++++++++++++++
 sound/pci/hda/hda_component.h |  59 +++++++++
 sound/pci/hda/patch_realtek.c | 217 ++++------------------------------
 6 files changed, 261 insertions(+), 191 deletions(-)
 create mode 100644 sound/pci/hda/hda_component.c

-- 
2.30.2

