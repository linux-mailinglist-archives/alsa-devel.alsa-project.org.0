Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40444938D75
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 12:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5930E68;
	Mon, 22 Jul 2024 12:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5930E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721644044;
	bh=6gdU2fmMO6+JPa+BiXzX0RbGUv4MbfaoUPguX4GuUbI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eLURpONnp5j4MCFldYqLY8P0TeH/fb9pIEUnYxEycyyfrs6Wjta/iCsq1aETmAmMe
	 syfmpOnViOf7Nt227y990bZK63yB9JYOHPeWp0mIcgON/F/nbvXLJ2STExoSma2GoS
	 ENDFGVoDsXaY2n2U8H6y5jCcImMVCI/JZBgtqGfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E2AAF805ED; Mon, 22 Jul 2024 12:26:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45FD7F805F2;
	Mon, 22 Jul 2024 12:26:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63228F801F5; Mon, 22 Jul 2024 12:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDF07F800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 12:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF07F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NuPROmPI
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46M5A0s2002661;
	Mon, 22 Jul 2024 05:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zoiEcBfFoEgPlNbPS6G/rOEgVbzOOa72EhD7b8AV0HM=; b=
	NuPROmPIzS5r/knNX2tOKztmTtBC3RCC8V0G/JxsiaYW6znhr84oXDc+mIjNzEp5
	CqLg1sBTeB3jBxBQuOkQ5cfdTh/q6BWksulDxzBdJcZV/RqZV1cLhBSGdPA3tdlw
	AnLiJEobbKdX4IrQIR1JU75MR0SEuRZtS3xJ3RxqZRN5p37CDEIN++ttR2EFPtCw
	DqS5SISBafOJ7lExWTW6hft8dAT/7seDWVBMsUkKj7tBhDE9pWAXb7yNtisdGkwb
	yGi/aahzBSo0TQwKR1ix/W+3/l85Dmk6xKunAwCBKvZpvj6uEwSL1lpPEpLhU4T4
	uuKBSpVnyEyE8ZbSvIy2lQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40g9nj1n5j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 05:26:02 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 11:26:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 22 Jul 2024 11:26:00 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 752D182024B;
	Mon, 22 Jul 2024 10:26:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <stable@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH for-6.10 2/2] ASoC: cs35l56: Limit Speaker Volume to +12dB
 maximum
Date: Mon, 22 Jul 2024 11:26:00 +0100
Message-ID: <20240722102600.37931-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240722102600.37931-1-rf@opensource.cirrus.com>
References: <20240722102600.37931-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uGiP9Yo0JC-j2A6scPWUyaoS8f9o2EDb
X-Proofpoint-ORIG-GUID: uGiP9Yo0JC-j2A6scPWUyaoS8f9o2EDb
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4DYR6B4FKUKDBIPLHQP4XAZKFPOYVOBD
X-Message-ID-Hash: 4DYR6B4FKUKDBIPLHQP4XAZKFPOYVOBD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DYR6B4FKUKDBIPLHQP4XAZKFPOYVOBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ Upstream commit 244389bd42870640c4b5ef672a360da329b579ed ]

Change CS35L56_MAIN_RENDER_USER_VOLUME_MAX to 48, to limit the maximum
value of the Speaker Volume control to +12dB. The minimum value is
unchanged so that the default 0dB has the same integer control value.

The original maximum of 400 (+100dB) was the largest value that can be
mathematically handled by the DSP. The actual maximum amplification is
+12dB.

Backport Note:
Identical to upstream commit. This was originally thought to be only a
cosmetic issue (the user can simply reduce the volume) but for some complex
audio topologies with SOF Audio DSP + CS42L43 + multiple CS35L56 it has 
turned out to be not obvious to the user what the problem actually is and
what to do to fix it. As support for these topologies went into 6.10 we
would like this commit to be backported into 6.10.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://patch.msgid.link/20240703095517.208077-3-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/cs35l56.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 1a3c6f66f620..dc627ebf01df 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -209,7 +209,7 @@
 
 /* CS35L56_MAIN_RENDER_USER_VOLUME */
 #define CS35L56_MAIN_RENDER_USER_VOLUME_MIN		-400
-#define CS35L56_MAIN_RENDER_USER_VOLUME_MAX		400
+#define CS35L56_MAIN_RENDER_USER_VOLUME_MAX		48
 #define CS35L56_MAIN_RENDER_USER_VOLUME_MASK		0x0000FFC0
 #define CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT		6
 #define CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT		9
-- 
2.39.2

