Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA216903F58
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 16:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2927A4D;
	Tue, 11 Jun 2024 16:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2927A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718117926;
	bh=ZJ8VbXXP3AnC9ZNMxMjSv7o2Xkso7k3k+k/EYi1Nzb8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AXEUNGrBVk9LKpcU7M58m+EZxV04f1SM3iyXz01heZqWNC0183Vy9E26zxU6yWFIf
	 J0JLbAy28Af31Dl6hG/08xbVRpVSdoVCt3Z5xa15WHmUYltsfz4uKh5gLNDaL7ZxEI
	 73g7AmWlgE5MeFAPlM76FXdKF2lXb8w5z1bDM/RE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB1E8F805BA; Tue, 11 Jun 2024 16:58:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 359EEF805A0;
	Tue, 11 Jun 2024 16:58:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10E07F8057A; Tue, 11 Jun 2024 16:58:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F19DDF800D0
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 16:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F19DDF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=giY8PTxh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45B4nj4Q024536;
	Tue, 11 Jun 2024 09:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=oYYo0l6rNzLFOjdE
	5P7hh94k5PnFvUYyGvEk2R4YEGk=; b=giY8PTxhW5cDjDTp3G41gB1EAx3SaAUp
	1z0cb4eOk+V1z6xdt7FSpxluVBmcp3SQWqRPFlC8kYp8Oae+Mn4tcM+B0yBzz9AU
	50mMXvEQ3mEPA3uJaoK53OyN5XKuSHQSUAhhMqq8LbRurBkVk0Urfq6RD3T4QMMF
	TxlkmeUJMLwrvqo9M6ssDUoMxaCH6mrLV2HRiNnlkxPLBDRrxi1lV4Q+sMVcKjfb
	7H7JfANQFYmom/BPirkLv6O/ESQxQ+eFuqnJpvzGG2kr0p9Nlyeo5btkm3yXNwbf
	xAZSIVv7REiWIk5MJgJp+NuwjS2x9XdQqhOPDHloIyf6uSiy6E6qMw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ymkqhtyr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 09:58:00 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 15:57:46 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 11 Jun 2024 15:57:46 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0FF41820244;
	Tue, 11 Jun 2024 14:57:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI is
 hooked up
Date: Tue, 11 Jun 2024 15:57:46 +0100
Message-ID: <20240611145746.1454663-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TnZIrOfp0w8piWcQDKrmvTq4zw0Qm3Pv
X-Proofpoint-ORIG-GUID: TnZIrOfp0w8piWcQDKrmvTq4zw0Qm3Pv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LQS7VX3NUWMERCXIVE5W46D3WRM6YKNY
X-Message-ID-Hash: LQS7VX3NUWMERCXIVE5W46D3WRM6YKNY
X-MailFrom: prvs=3892a76c90=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQS7VX3NUWMERCXIVE5W46D3WRM6YKNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the ASP1 DAI is hooked up by the machine driver the ASP TX mixer
sources should be initialized to disconnected.

The silicon default is for the mixer source registers to default to
a collection of monitoring sources. The problem with this is that it
causes the DAPM graph to initialize with the capture path connected
to a valid source widget, even though nothing setup a path. When the
ASP DAI is connected as a codec-to-codec link this will cause the other
codec to power-up even though nothing is using it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: dfd2ffb37399 ("ASoC: cs35l56: Prevent overwriting firmware ASP config")
---
 sound/soc/codecs/cs35l56-shared.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 8af89a263594..30497152e02a 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -215,6 +215,10 @@ static const struct reg_sequence cs35l56_asp1_defaults[] = {
 	REG_SEQ0(CS35L56_ASP1_FRAME_CONTROL5,	0x00020100),
 	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL1,	0x00000018),
 	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL5,	0x00000018),
+	REG_SEQ0(CS35L56_ASP1TX1_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX2_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX3_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX4_INPUT,		0x00000000),
 };
 
 /*
-- 
2.39.2

