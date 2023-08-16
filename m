Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7677E6F2
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EA6E91;
	Wed, 16 Aug 2023 18:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EA6E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692204632;
	bh=iB+cvwKNRKFYIGd8CB8jQ5YjZQ7SYM2n+aS/hnNfIns=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=upNKvrO82E/lcabWphhU8tWGhDhYH6x9fvqJ1zcryqWSFfoMmdcSy4gW6AXltQ03n
	 8/bn9SpVxjpue5azPxCKT1KTR1DrwJ1k1Y2QxNpYi9uIJv4FYAY6SpUuot22TJskE7
	 9vxwIl3MUodW05lUnpnerTGEjdgj1W28uGvDCoz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA26F80536; Wed, 16 Aug 2023 18:49:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CD7CF8016A;
	Wed, 16 Aug 2023 18:49:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA1AAF80254; Wed, 16 Aug 2023 18:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA201F800D1
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA201F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cEvcaHkS
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37GGbfku011492;
	Wed, 16 Aug 2023 11:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=L
	Qm5pyqjCHNodjZHHsVTjh/X9KbRW9yz771dpk1szQQ=; b=cEvcaHkSs62mRPptP
	nImOwZhw/eBhtwrQF9xS4lCP1qn3V/lNNl9mRZ5Xs0tztE6Rp+mm08DcxLdphfM9
	WOtjAMHut39Y036xoscDOhU4rSj8PhB8nwgDHPH8lhGZHRYwWsJOOkAdLBC9NQ/C
	fx75rbnOYeKMl9T60ogeKn44i8PYDZSySDi/gjOoKWmY387BxMKl6vCR5qP1ais7
	IaBBOThxp3Re6nEDKJymYmcD07Eg+TJqMDY+zUIUMk9Qs3UJQfLIBctuvPJ7ifq2
	XiTAcIdoCWd9Vx+8yOtWmNy8bmSfs2ceVe2+k/ftYqbNogkxK7bS4F5Gi4L97/bb
	Xwe6w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3se6uhmdw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 11:49:10 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 16 Aug
 2023 17:49:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 16 Aug 2023 17:49:08 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.68])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8FF503578;
	Wed, 16 Aug 2023 16:49:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 0/2] ASoC: cs35l56: Update ACPI HID and property
Date: Wed, 16 Aug 2023 17:49:04 +0100
Message-ID: <20230816164906.42-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mgpguMEEgnmgvjTHO3mfI7_ZA4zKQhsh
X-Proofpoint-ORIG-GUID: mgpguMEEgnmgvjTHO3mfI7_ZA4zKQhsh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: S6MZ57PVCZASYQ4L45K6WYW7PR4HTHAU
X-Message-ID-Hash: S6MZ57PVCZASYQ4L45K6WYW7PR4HTHAU
X-MailFrom: prvs=35925e949a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6MZ57PVCZASYQ4L45K6WYW7PR4HTHAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These two patches add an ACPI HID and update the way the platform-
specific firmware identifier is extracted from the ACPI.

Maciej Strozek (1):
  ASoC: cs35l56: Read firmware uuid from a device property instead of
    _SUB

Simon Trimmer (1):
  ASoC: cs35l56: Add an ACPI match table

 sound/soc/codecs/cs35l56-i2c.c |  9 +++++++++
 sound/soc/codecs/cs35l56-spi.c |  9 +++++++++
 sound/soc/codecs/cs35l56.c     | 31 ++++++++++++++-----------------
 3 files changed, 32 insertions(+), 17 deletions(-)

-- 
2.30.2

