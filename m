Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0078C70D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5057C74C;
	Tue, 29 Aug 2023 16:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5057C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318488;
	bh=x/M6ySU5jIZDMw4cSAlNzXgk2cE4qlTHPmrb3jfWZnE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EXFzp6kvsT995Fw/aTfN72epR+IRPDNaZafIalnUsykmTzcE07hWcQJFODTeCl3zq
	 LTY59AEhfLNd0jsUzQ8tbhHzjixmhvt7gK/Zi9SE/r5MAwco3DuikBjfK/yTyIiRah
	 W/QpE9JpQJHbcC4P8V432lC/nbcJKcpldo25GlWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1580F8023B; Tue, 29 Aug 2023 16:13:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1760DF80155;
	Tue, 29 Aug 2023 16:13:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF113F80249; Mon, 28 Aug 2023 19:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B72CF80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B72CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=e4tXq7cF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37SFnRVL031069;
	Mon, 28 Aug 2023 12:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=u
	ykMzcWp3pYiVsOXdian8GV2w7tbBQSBO6upZ3H11QM=; b=e4tXq7cFDwRi/L7J6
	DZ+HPtyZaysTuPBEF61BIjA/rpHTi5TeJoN0/IvIAKBmoxf4VzQQNfu1LSsF3zGw
	N8Zv2eTTgJhf56S9HzxJliQ4hVRB+vFrq3oxbxfFZg6IGLgwgYRNV+csg/u8uXbp
	wGrCgbibwzVu+Jb82UWdu3n2uO0p7RmxdsvmYte3Wodus0eaDiZtOuoBU5/Q4Eux
	rDCdOOofZ/HKSc/g0Xzofj7JaFQ8cYD/5/RaOlmAq0NkY0wH8EaY9wpexfBDd1w9
	H2Y2yz99lpOkU1eQLOI2V64xB18sK/dhdz5Mj+0yF1fjizthn/zVpI0vZ8pfNoOg
	ow9yg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj2185-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 12:05:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 18:05:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 18:05:41 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 03AB03561;
	Mon, 28 Aug 2023 17:05:38 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <RicardoRivera-Matosricardo.rivera-matos@cirrus.com>,
        Vlad Karpovich
	<vkarpovi@opensource.cirrus.com>
Subject: [PATCH 1/7] ASoC: cs35l45: Add support for Chip ID 0x35A460
Date: Mon, 28 Aug 2023 12:05:19 -0500
Message-ID: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aQpetfLelSSChLiugsOYyd42XXhBaNpc
X-Proofpoint-GUID: aQpetfLelSSChLiugsOYyd42XXhBaNpc
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4604b61042=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YY7X4ZXDDIL7OUUFSIPKLSUECUMP4MPI
X-Message-ID-Hash: YY7X4ZXDDIL7OUUFSIPKLSUECUMP4MPI
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YY7X4ZXDDIL7OUUFSIPKLSUECUMP4MPI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 0x35A460 chip is a different variant of the cs35l45.

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 8f480df7f29a..7f116ae97acd 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1078,6 +1078,7 @@ static int cs35l45_initialize(struct cs35l45_private *cs35l45)
 
 	switch (dev_id[0]) {
 	case 0x35A450:
+	case 0x35A460:
 		break;
 	default:
 		dev_err(cs35l45->dev, "Bad DEVID 0x%x\n", dev_id[0]);
-- 
2.25.1

