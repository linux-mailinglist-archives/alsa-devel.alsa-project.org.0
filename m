Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB08925779
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 11:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2DE01605;
	Wed,  3 Jul 2024 11:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2DE01605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720000564;
	bh=MH4RcLU2Ew8c5WvQKy9K80s3b4in5J9rOvq2ovT09vk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zg0uOeHqQx9ZE0LnTbit4rmlQrj6K16e5Yjm75VbedcRa1Q+ZZK++TVlmJdBum7iQ
	 kIdu/wZx0FD7tLI9zk+Cb6Ybd7Axak3wVEf2QdThd8Lq5biweljHrNENCSVYxoXNW/
	 H7MOK7xxaG1mrDt78/wKt0mLkKZV04YedK/IOxxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A78ACF805BD; Wed,  3 Jul 2024 11:55:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FAACF8014C;
	Wed,  3 Jul 2024 11:55:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7E5CF80301; Wed,  3 Jul 2024 11:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01866F8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 11:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01866F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lTnWTbo9
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4636JLf5030004;
	Wed, 3 Jul 2024 04:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=7oWiVqhXfjhbUu+v
	MkJ6zhF4ivh4BhAtnUWD0CW582M=; b=lTnWTbo9wC0ILLcN2CesPxbgZ9AUsx5v
	cRMpPTtvD7vrdpbMF2+LqC130r+xuDHQn9CD10g5ON9sMLsEcF5unaH2bUoMpt7R
	JC+5W1jvLOiryqj+DvKdeVkGUBCq112CIxwhZ4Zy8Hux61OLG6R+J35akgq29KLm
	4iKwebyPxZklLgRAh+IgmUIGLnl+d37PGZ1C+rzo2KgmxkYp96le7cL13gu4aLMJ
	WwRx4sAOm/Lf9iw1O5Zc2szV/T/jpeEwTA7BGMy/o3pSPzKPTzoPSMvjUVEpITyu
	gGoTVW4Sh6tRglCnvv7AmYvcbGz2/laEIH6ICtkAsFCsX++DhjNXMg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 402fnxcq1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 04:55:20 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 10:55:18 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 3 Jul 2024 10:55:18 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E92AD820244;
	Wed,  3 Jul 2024 09:55:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: cs35l56: Set correct upper volume limit
Date: Wed, 3 Jul 2024 10:55:15 +0100
Message-ID: <20240703095517.208077-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bVRau-DgwfoTpCBdeRbG4rn1oi8FBUrq
X-Proofpoint-ORIG-GUID: bVRau-DgwfoTpCBdeRbG4rn1oi8FBUrq
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: U7FICNOQDDI5N6YMGCNA42PQQFEHMJVW
X-Message-ID-Hash: U7FICNOQDDI5N6YMGCNA42PQQFEHMJVW
X-MailFrom: prvs=4914b47104=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7FICNOQDDI5N6YMGCNA42PQQFEHMJVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These two commits set the upper limit of the Speaker Volume control
to +12dB instead of +100dB.

This should have been a simple 1-line change to the #define in the
header file, but only the HDA cs35l56 driver is using this define.
The ASoC cs35l56 driver was using hardcoded numbers instead of the
header defines.

So the first commit changes the ASoC driver to use the #defined
constants. The second commit corrects the value of the constant.

Richard Fitzgerald (2):
  ASoC: cs35l56: Use header defines for Speaker Volume control
    definition
  ASoC: cs35l56: Limit Speaker Volume to +12dB maximum

 include/sound/cs35l56.h    | 2 +-
 sound/soc/codecs/cs35l56.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.2

