Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6979EBED
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 17:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436349F6;
	Wed, 13 Sep 2023 17:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436349F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694617325;
	bh=qsJkUGtFTBIdHhfbfjeyiEWXVlma/JbvLXxRT2Oku7I=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U4TiCCwvP0LEPK47uv7Iy5sgvbaJeydhqoZSMeqarX2sdYhuga/04n3Sed6awjHqp
	 1UCeTNT0H/lgH4Xjma/obe5jkixfd4sQlnvfW7v2/C+0sqFRFCVFBDbf0X6yJKjMnn
	 GN6vw0Uh6EKWNqZkewOxieVGHCIkQ/zfZciYqXNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C933F8059F; Wed, 13 Sep 2023 17:00:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B002F801F5;
	Wed, 13 Sep 2023 17:00:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76D24F8055A; Wed, 13 Sep 2023 17:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0079CF8047D
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 17:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0079CF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fDrm011e
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CMxBYr012824;
	Wed, 13 Sep 2023 10:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=C
	2aOQUnst1sSvwyVTyYjTBnLEp5Xj6haYIZlFfs9Kyg=; b=fDrm011es/4gR/YmM
	SZZZwb4pgxzbui3FEXV2+d0bqASSQvR4obfUVf8BhkPzVCtNxyToQRyoqlJNbaMr
	ukbGIqfBJRfSJdRvOZS9yoVVtvzQYVfgpat9495aUR+n0au6im1V0A8hQSkL2bj7
	VkR3jyLx0MpZ6laq75UUdaabDji5J16LNSKxE0+zCS1UDaV87Rd4taQV9CPZxuTB
	px09dRwRc/1yy6weJY/33FYaB7JiExjed2eY+4TiEiyIrbg2rMg3s/eaoI7mITNu
	t8+qwBOY2TBZwfo5hwd28+IVVfb21uvN4YEV8P1adA/RTI/cV+ZohvV/f+ph/xWp
	Q/5Fw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7u125n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 10:00:22 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 13 Sep
 2023 16:00:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 13 Sep 2023 16:00:20 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.120])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D249C15B9;
	Wed, 13 Sep 2023 15:00:19 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Uday M Bhat <uday.m.bhat@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/3] ASoC: cs42l42: Fix handling of hard reset
Date: Wed, 13 Sep 2023 16:00:09 +0100
Message-ID: <20230913150012.604775-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8iOFmS7J4x_emYUOqk3LNtz3skRREkJV
X-Proofpoint-ORIG-GUID: 8iOFmS7J4x_emYUOqk3LNtz3skRREkJV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NK5RPAL4F7MWDECNZDADAQMQWSDDNLRN
X-Message-ID-Hash: NK5RPAL4F7MWDECNZDADAQMQWSDDNLRN
X-MailFrom: prvs=4620b17109=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NK5RPAL4F7MWDECNZDADAQMQWSDDNLRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These patches fix 3 problems with hard reset:
1. Ensure a minimum reset pulse width
2. Deal with ACPI overriding the requested default GPIO state
3. Avoid a race condition when hard-resetting a SoundWire peripheral
   that is already enumerated

Richard Fitzgerald (3):
  ASoC: cs42l42: Ensure a reset pulse meets minimum pulse width.
  ASoC: cs42l42: Don't rely on GPIOD_OUT_LOW to set RESET initially low
  ASoC: cs42l42: Avoid stale SoundWire ATTACH after hard reset

 sound/soc/codecs/cs42l42-sdw.c | 20 ++++++++++++++++++++
 sound/soc/codecs/cs42l42.c     | 21 ++++++++++++++++++++-
 sound/soc/codecs/cs42l42.h     |  1 +
 3 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.34.1

