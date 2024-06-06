Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6048FE7C8
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:30:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F290ADEC;
	Thu,  6 Jun 2024 15:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F290ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717680631;
	bh=ri0OOOZWNRWsh9jBgHeTZuU2Qt1Eq8KklkhcUpeO8/E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=awg7nt7GmlzaORnYeegEQeLmw4ymqN+Pui3F6fqmv+d42rf0bS31Y5So6rJZcUtIb
	 nzwJ/AQGpv7F++Eyq2oBQbN5/zh9l6V30nI9A6Pk0zVuSYMdXZxG/I2A1gkVC6/LyG
	 Lx4bmlI7W+gczywyNHFBYlyNPm6dWejI4RAdp6Rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C5C9F80589; Thu,  6 Jun 2024 15:29:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B8FF80589;
	Thu,  6 Jun 2024 15:29:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A3EEF804B2; Thu,  6 Jun 2024 15:29:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1580EF80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1580EF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ni+GTbJJ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4564ueAZ021615;
	Thu, 6 Jun 2024 08:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ITJde61E7SQb6Vol
	mPyc4UokVhSx5f60rcqehJhVu64=; b=ni+GTbJJ3hwFOk/GR43llLiiLeXLD0N9
	66x3+YSV1ou4v+gAuO4i89htcg+Ja8tXLEm2l/8d1ytiNabnWLtZ7ti16PHShSs0
	QJjUGZ3E3CTMtQ4abHvZfOAnfaHFZS2sZEf38dhZPcHiRF5pm3LUtDRT3qvVwz/b
	z5DpeA85zxduJZkYXcoDdUuvdlajCLqc8W68W4TmOMpPY3uSaO3J9OMP3WYG1ady
	MXaZHw5JkdNlEfgOESKQs2HVhHYS7VUg2057avmSiAD03EzOvGNOGS/vBrq6ccD+
	szR4PXRWVXdO0kb5syPbltXfa+F3p2zDqwE1XtH1/UbXx9pblSnTMw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hn5xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 08:03:58 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 14:03:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 6 Jun 2024 14:03:57 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.44])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B6ACF820249;
	Thu,  6 Jun 2024 13:03:56 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/4] Add support for Lenovo Thinkbooks
Date: Thu, 6 Jun 2024 14:03:47 +0100
Message-ID: <20240606130351.333495-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: N30JcssQ8WSJj6oXqXQV0dPfca5Q4bqG
X-Proofpoint-ORIG-GUID: N30JcssQ8WSJj6oXqXQV0dPfca5Q4bqG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 76B22J6BNZDJU3K7LDAL3WZFDFSZHK2K
X-Message-ID-Hash: 76B22J6BNZDJU3K7LDAL3WZFDFSZHK2K
X-MailFrom: prvs=388799c159=sbinding@opensource.cirrus.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These laptops do not contain _DSD required to support CS35L41 HDA.
To workaround this, add support for these laptops into the configuration
table in cs35l41_hda_property.c.
Also add the required entries into patch_realtek for this SSID.

Stefan Binding (4):
  ALSA: hda: cs35l41: Support Lenovo Thinkbook 16P Gen 5
  ALSA: hda: cs35l41: Support Lenovo Thinkbook 13x Gen 4
  ALSA: hda/realtek: Support Lenovo Thinkbook 16P Gen 5
  ALSA: hda/realtek: Support Lenovo Thinkbook 13x Gen 4

 sound/pci/hda/cs35l41_hda_property.c | 8 ++++++++
 sound/pci/hda/patch_realtek.c        | 4 ++++
 2 files changed, 12 insertions(+)

-- 
2.34.1

