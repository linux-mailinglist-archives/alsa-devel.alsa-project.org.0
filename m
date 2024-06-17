Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5390B4ED
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 17:45:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F36F5847;
	Mon, 17 Jun 2024 17:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F36F5847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718639121;
	bh=5EBDDBE1vnWBgN770hldZP0JQKfpjmzXK7XyfzJtl+c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CcZtwaahZyd1GdWqFWY/02klYR+jQabZ/WixF4EZF350gUp/E6xoWzMR+l6kdxKJm
	 q2xAUrRCvTQc9wzSMtoNFtQaIKmIphADlWeRREIbnwESqH9aXm00/65YC9LMGKkWsv
	 uJd6qYJzc4MHv3B11JKGdh386IQdalnUc706m43s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 791E6F80656; Mon, 17 Jun 2024 17:43:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE2CCF80649;
	Mon, 17 Jun 2024 17:43:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E43F8023A; Mon, 17 Jun 2024 17:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A548AF80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 17:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A548AF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fyewrraM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45HFYCxq023861;
	Mon, 17 Jun 2024 10:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=X91mzxfXMCn2bJmd
	FzbP55B/9zkijFCsomFlIi3vsw4=; b=fyewrraMYY0/Dq9nZjlT2y7t1Y1pe0Xr
	oCowargM2HLrfEGT3BZ3NA0YQ6vQRsCLJdSIRXdRyq9bA/s9mnVhKsgm+Y9vtmB9
	bFl0FZSYLh+n3Dpew5u5wiVE+eYv1fJC4cxql6PmjjHexml6MlWALH66gWcXWia8
	sqalZkMJIXG+hN90KicIfhktQ3Me15rxLwz08ZJdKiC0OfM8HLl22+mQ/GCe4T5H
	zbgllvYRaXOVqtE06iN+NddkYajV+0inAojsP/HtKD/WnccXQtB3vzk66FaSmbis
	F/a5ErFe19MW5kOS9/RTa3+kKzwBUKrjpVXKuPMocEDtq5z+JpqT5Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cjt0f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 10:43:12 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 16:42:55 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 17 Jun 2024 16:42:55 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CCF43820248;
	Mon, 17 Jun 2024 15:42:54 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH v3 0/4] ALSA: hda: Improvements to hda_component
Date: Mon, 17 Jun 2024 16:41:01 +0100
Message-ID: <20240617154105.108635-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gySmoCg_5vijXd0aN3iIlPqZ_KDUeChw
X-Proofpoint-ORIG-GUID: gySmoCg_5vijXd0aN3iIlPqZ_KDUeChw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JFCCJNKFYOVEYDVP5JGNLONBWREFIOET
X-Message-ID-Hash: JFCCJNKFYOVEYDVP5JGNLONBWREFIOET
X-MailFrom: prvs=389839efd0=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFCCJNKFYOVEYDVP5JGNLONBWREFIOET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series of patches moves duplicated members from the
instanced component structures into a new parent structure and
introduces locking so that consumers of the interface do not use
stale data.

Changes in v3:
 - These Fixes separated from this series to make them easier
   to manage:
   https://lore.kernel.org/all/20240613133713.75550-1-simont@opensource.cirrus.com/

Simon Trimmer (4):
  ALSA: hda: hda_component: Introduce component parent structure
  ALSA: hda: hda_component: Change codecs to use component parent structure
  ALSA: hda: hda_component: Move codec field into the parent
  ALSA: hda: hda_component: Protect shared data with a mutex

 sound/pci/hda/cs35l41_hda.c     | 43 +++++++++++--------
 sound/pci/hda/cs35l56_hda.c     | 25 ++++++-----
 sound/pci/hda/hda_component.c   | 75 ++++++++++++++++++++-------------
 sound/pci/hda/hda_component.h   | 48 ++++++++++++++-------
 sound/pci/hda/patch_realtek.c   | 17 ++++----
 sound/pci/hda/tas2781_hda_i2c.c | 33 ++++++++-------
 6 files changed, 141 insertions(+), 100 deletions(-)

-- 
2.34.1
