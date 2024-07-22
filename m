Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1AD938D73
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 12:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B18BDE85;
	Mon, 22 Jul 2024 12:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B18BDE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721644007;
	bh=Qt0pSfpOd9uBkWnkfYjYMjZywxeQf5V5kpxLyx3iwfg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KnZgn6wIXGP6aa3ZKuwNX1wCOA0ajbPLRagD4YXw7/JzOT0C2bsXZOY/PTDrq0s8j
	 VOtmLCK1waqJzKZPYwq1kM0mPb5inlcikoW2CKoXWwpY+HGb9DqLDDg9YW7/8GioEx
	 MOJ8oyX/hlGKyt7qlkyLVTeXIEdC00XjKNmYrK4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1B02F805B3; Mon, 22 Jul 2024 12:26:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4648EF8058C;
	Mon, 22 Jul 2024 12:26:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E210F80482; Mon, 22 Jul 2024 12:26:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 777ACF8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 12:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 777ACF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=frEjqQuf
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46M5A0s1002661;
	Mon, 22 Jul 2024 05:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=NHn1bBqpfkzxeBeN
	JeFDRk0oJyJI0hodEFZvCSqHS6E=; b=frEjqQufTCfJuNryIQXIsq3e2oj+MCZ9
	L3QMz6NFmRCvYdpOiVPtmmhxtoIKmvm06EX3kBzldWrw2V1UF+w29ZTOBeE6DNJk
	o2Lei9T1WiDOUef61QJqmQ70tUbSg5Sm1Bdz+uQx4cURGOT8dZKC1DOiWydUmKLk
	FdXWafUjUIAVk/8gBm709CpeySkJ2RsTnlgPxd4HqbvPDlxlZztRKEU5am544iYO
	7LEoF+RQdlkwr3jLgqF8iHeAaMMPzCwuPIbQcFa9/OyC3qytFPY3YnrNLws91yFK
	Zf0puyYHTUTmzbx63IqWPKTEVKrRf5OcnyyqphTx1vyByEqVXe2L5w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40g9nj1n5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 05:26:02 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 11:26:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 22 Jul 2024 11:26:00 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 612FD820244;
	Mon, 22 Jul 2024 10:26:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <stable@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH for-6.10 0/2] ASoC: cs35l56: Set correct upper volume limit
Date: Mon, 22 Jul 2024 11:25:58 +0100
Message-ID: <20240722102600.37931-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rue46z4JOrwXlG0dj2kdX8dkwPrQ1xQq
X-Proofpoint-ORIG-GUID: rue46z4JOrwXlG0dj2kdX8dkwPrQ1xQq
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: E3WWCQDBQFNU2G6ZQLHH3ZOSJ2NPVW6E
X-Message-ID-Hash: E3WWCQDBQFNU2G6ZQLHH3ZOSJ2NPVW6E
X-MailFrom: prvs=493343e571=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3WWCQDBQFNU2G6ZQLHH3ZOSJ2NPVW6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Patch series to limit the upper range of the CS35L56 volume control to
+12 dB.

These commits were not marked 'Fixes' because they were thought to be only
a cosmetic issue. The user could reduce the volume to a usable value.

But for some complex audio topologies with SOF Audio DSP + CS42L43 +
multiple CS35L56 it has turned out to be not obvious to the user what the
problem actually is and what to do to fix it. As support for these
topologies went into 6.10 we would like this series to be applied to 6.10.

Richard Fitzgerald (2):
  ASoC: cs35l56: Use header defines for Speaker Volume control
    definition
  ASoC: cs35l56: Limit Speaker Volume to +12dB maximum

 include/sound/cs35l56.h    | 2 +-
 sound/soc/codecs/cs35l56.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.2

