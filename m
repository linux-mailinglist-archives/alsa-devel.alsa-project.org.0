Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA792CF60
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 12:38:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B813886F;
	Wed, 10 Jul 2024 12:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B813886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720607922;
	bh=mHqoaOo6vsNTWza139+cMFxxRor+QUsYLvnzvaHB6dw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L1mOKh8PwyY/sr4/rsI4OHbTd3ghZxkKMz6YQDDIU+vBx9uZXFrTN+puFGMJEAP9r
	 nCJhfEGgU/AK++IQE83YXn9rYCMszJ/aJO2ZoeMgJgVUZ4FYHvLItPjfZEHxnUusKg
	 EX4+a20NQYkLHF+6hhgcFeHRc2PxKoBN5UnqX470=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54FFEF80568; Wed, 10 Jul 2024 12:38:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D549EF805A0;
	Wed, 10 Jul 2024 12:38:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BC74F80508; Wed, 10 Jul 2024 12:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5A55F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 12:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A55F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ig25FVnK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46A4s4Gm006601;
	Wed, 10 Jul 2024 05:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=031IosrvEc4DNF6O
	PahvA9Nf6RargcvRdAHSyE4m7aE=; b=Ig25FVnKbYjrpbif4gv0NYTbcg4+tbPC
	U6YSBKYRcIyFK/BRu3Mb7Xf/tBPHyYF3D6uVF7LpDedy+p2xYFqy6gboaCwxqrn2
	rArgdpRiIZf565aL8YRbkTcNZTbyjdsrSfZeBxSMMgkbEu5YVwQ0u6WP2pMa+Asw
	WdN+dfsejKMtCh8yPVSR1zDMcyHswaTKUlIxdeO4QhD0a8yyW9mPYxg1oIGEMjJK
	CL4Jf1vvr2en4L8y+6Ls81anTp7xjY8k0Pmkg6UHI30N3VzcjiidGfkvkD5OZTH8
	9lRtnEh3iwQY0GP5ljHtWGI480UHBhv+Cr/ZS+buLvsgqbVZNc9C2g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 409c9a8h0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 05:36:42 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 11:36:40 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Jul 2024 11:36:40 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5C36A820244;
	Wed, 10 Jul 2024 10:36:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH v2 0/4] firmware: cs_dsp: Some small coding improvements
Date: Wed, 10 Jul 2024 11:36:36 +0100
Message-ID: <20240710103640.78197-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1I28NVJP8x8VC6P58Xs8YtvxDg7l40wl
X-Proofpoint-GUID: 1I28NVJP8x8VC6P58Xs8YtvxDg7l40wl
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NJIBCO3WP7JBSMNLX7GPLT6A5PUVUWU6
X-Message-ID-Hash: NJIBCO3WP7JBSMNLX7GPLT6A5PUVUWU6
X-MailFrom: prvs=4921fba11f=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJIBCO3WP7JBSMNLX7GPLT6A5PUVUWU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit series that makes some small improvements to code and the
kernel log messages.

---
Changes since V1:
- Replaced commit #3 with one that keeps the wmfw format version
  message on its own line instead of merging it into the INFO text
  message.
- Commit #4 rebased onto the new #3

Richard Fitzgerald (4):
  firmware: cs_dsp: Don't allocate temporary buffer for info text
  firmware: cs_dsp: Make wmfw and bin filename arguments const char *
  firmware: cs_dsp: Clarify wmfw format version log message
  firmware: cs_dsp: Rename fw_ver to wmfw_ver

 drivers/firmware/cirrus/cs_dsp.c       | 68 +++++++++-----------------
 include/linux/firmware/cirrus/cs_dsp.h | 10 ++--
 sound/soc/codecs/wm_adsp.c             |  2 +-
 3 files changed, 29 insertions(+), 51 deletions(-)

-- 
2.39.2

