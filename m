Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 960217BB610
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 13:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D73E844;
	Fri,  6 Oct 2023 13:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D73E844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696590764;
	bh=C2H9a8UG4yX3g7AroRdH8iPaLUTyHezlmLmP1ldzXl8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CqJOCKuxuERvu2BICYdxG/AUUlYdi+HB4djSnZCMB14sjYQcbnOCAPhhgTsiZZ5N/
	 s+K2d65N/1lQ+32ON65JRMUb22vpVOaRTbqurzlWbwV7OC9GJLrkfIwvEM+4ucc4OY
	 Ck5gYUNOn5ose6Upq5LfN8s2s+WHkNoM4qRzMeK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F76FF8057C; Fri,  6 Oct 2023 13:11:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1128F80579;
	Fri,  6 Oct 2023 13:11:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D684F80310; Fri,  6 Oct 2023 13:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DFB9F8047D
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 13:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DFB9F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oCTI88om
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3965fxcd025983;
	Fri, 6 Oct 2023 06:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=c
	bDIOHk1TYtJQuis+jBuSG2cu07UQYOZQb2kDXNYLS0=; b=oCTI88omBaPp0KeCo
	eJXs71e5vjap34eZTUoiY4rWfub2tdnYvqSvRol7cmI1luo+Ik8rUw5jnuML8ar+
	tVV4El61EGTT4SjRjhY8JXzE/wgLYS6ZCI8Upgwl9okZbcJkhtlbhTUgchVOupPb
	7o9gXDHbE4rpe/rkVM/Em/XfKeDjv+OSoXY1SazcYT/1BSmwXCcHJ7pJe32kdRlQ
	OThfRuz1x2YsFGUhZflPkxtB0kb1rhEfysyKlEPvEyFF5S5sCTX9MPP+olOYop5r
	jPdf3e2pTUE/x+KjgL8Td4Is/mTjWmOxTfUo6mi85AmF1b2yFoMBGM2pDU2jI16h
	fRicA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3th2dtbmxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 06:10:44 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 6 Oct
 2023 12:10:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 6 Oct 2023 12:10:42 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E6D7D11AA;
	Fri,  6 Oct 2023 11:10:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 0/4] ASoC: cs35l56: Update hibernate/wake sequences and enable
 hibernation
Date: Fri, 6 Oct 2023 12:10:35 +0100
Message-ID: <20231006111039.101914-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -jK31S8zeRlMnfxWOtMwC7ZGvMZ_jtZy
X-Proofpoint-GUID: -jK31S8zeRlMnfxWOtMwC7ZGvMZ_jtZy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5YCZKICF6QG3RSZ2GB4TRTEWBQMUYWZS
X-Message-ID-Hash: 5YCZKICF6QG3RSZ2GB4TRTEWBQMUYWZS
X-MailFrom: prvs=5643372036=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YCZKICF6QG3RSZ2GB4TRTEWBQMUYWZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update the hibernate and wake command sequences to meet the latest
datasheet specification and enable hibernation for I2C and SPI control
interfaces.

Richard Fitzgerald (1):
  ASoC: cs35l56: Enable low-power hibernation mode on SPI

Simon Trimmer (3):
  ASoC: cs35l56: Change hibernate sequence to use allow auto hibernate
  ASoC: cs35l56: Wake transactions need to be issued twice
  ASoC: cs35l56: Enable low-power hibernation mode on i2c

 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-i2c.c    |  1 +
 sound/soc/codecs/cs35l56-shared.c | 66 +++++++++++++++++++------------
 sound/soc/codecs/cs35l56-spi.c    |  1 +
 4 files changed, 43 insertions(+), 26 deletions(-)

-- 
2.30.2

