Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE8708492
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 17:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213A77F8;
	Thu, 18 May 2023 17:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213A77F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684422285;
	bh=tcvSipVqqnQmUN806QDFnZX96J/L+ccfWQtuorEpkOw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sjOYbJHO8TMIDTObqKEJOGjgJvXQgSwqsJufvcjkkRCiNTntxVyGq85PSO5wWeYLm
	 KhcQ4bAEjMJwvsiIp/asSui7jXVvPt7yQE6rxYjS19daQlb4ZuxdTOyNvFhShk0ocj
	 SMvm3DNy+RAbBzXGtXuwOJDO14XJJfSfSnUDM+O0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1022AF80551; Thu, 18 May 2023 17:03:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78363F80551;
	Thu, 18 May 2023 17:03:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F172BF80431; Thu, 18 May 2023 17:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E144F8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 17:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E144F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=J4z8R9BI
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34IBl9Gj018534;
	Thu, 18 May 2023 10:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=PzbNKkrCmjMmdURz8o4J0PDSkAM+7W10ivnlAga8Xug=;
 b=J4z8R9BIpvmUQiZdzpZYv0TyUDhrh/Nnly/TVJkFE23i/YkS5Mb1E3SC+tOgQdGgZgyA
 9R6Me61XXI3AJXWI5Ruziw2k+KYMby8QCuzEbkEDZ14P7Kc85zOnlzyaakBgvhjNivsG
 O9gIZcyd+qFDF7BwYPtXXBs3/weHSYUd//56FQ/JjHSSD0fp/kwR616LkkHoxCfHhRmo
 T3cB4JmsHkXG66H9C9DygZBIZYrlfJjkRL2A7bVuyFUKkasXvEYxJbUB358Oue/e/vSx
 NtHfkh2W84HgNuT6mK7d+h1NlNTYfJ9R0Ysau5WplNx4u4mvqSdNGLfbMi5WBrhfrH4M Mg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qngq1ghum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:02:51 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 18 May
 2023 10:02:50 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 18 May 2023 10:02:50 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1C51A11AA;
	Thu, 18 May 2023 15:02:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 0/3] ASoC: cs35l56: Bugfixes and efficiency improvement
Date: Thu, 18 May 2023 16:02:47 +0100
Message-ID: <20230518150250.1121006-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Gomk2pLzyO6OLFycpvAZ3G1YC6WQa618
X-Proofpoint-ORIG-GUID: Gomk2pLzyO6OLFycpvAZ3G1YC6WQa618
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LEM5GDG2A7V4DAMVVJM53S2UD6D3UZHR
X-Message-ID-Hash: LEM5GDG2A7V4DAMVVJM53S2UD6D3UZHR
X-MailFrom: prvs=05023014f4=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEM5GDG2A7V4DAMVVJM53S2UD6D3UZHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

First two patches are bugfixes.
Third patch skips the overhead of rebooting the amp after applying
firmware files when we know that it isn't necessary.

Simon Trimmer (3):
  ASoC: cs35l56: Move DSP part string generation so that it is done only
    once
  ASoC: cs35l56: sdw_write_no_pm() should be performed under a
    pm_runtime request
  ASoC: cs35l56: In secure mode skip SHUTDOWN and RESET around fw
    download

 include/sound/cs35l56.h    |  1 +
 sound/soc/codecs/cs35l56.c | 65 +++++++++++++++++++++++++++-----------
 2 files changed, 47 insertions(+), 19 deletions(-)

-- 
2.30.2

