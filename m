Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA17D858D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37359823;
	Thu, 26 Oct 2023 17:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37359823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698332834;
	bh=MEhN2Si2/Oagqxuuq5w2D22SEWnFIemuGqoAmnQ1v6Q=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I88zaBR24rMQCKV4Bq1Y3Z1tybdxWRtNL4BR9yor2nTooNp4w66t0u1cZHH21yTow
	 +4XI2ePYV1i67KiJAz0m4bXDfp8nodS1yLaOZj7o/SEYXXs7QYXAj+GS48l91ZMwRk
	 htreYYOTQ951pPYfqaUF556RhRhBwz9RsMAWmJpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E877CF80152; Thu, 26 Oct 2023 17:06:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7470F80557;
	Thu, 26 Oct 2023 17:06:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17F47F8028D; Thu, 26 Oct 2023 17:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 660E4F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 660E4F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jrV7jYJA
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39Q5GUrd011654;
	Thu, 26 Oct 2023 10:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=6
	OqnnMnxJr4U6WGGgQd0My1SNKbdKPtvtXT6+Ya2O+w=; b=jrV7jYJA47WRNbE0z
	2BY5jlstA3CBlsRUt0M7HJK+kqW2d5enPocIEVmQzQ/OXDUkhTOI4RTkmbLe5/Y+
	Q1Vn3uWbxHdLO4UrU+Njig4NwZ4Zf16WdL0Upi8y2WvbYmPGs1SZqbIlU+5465fW
	KPL5bKr3HNYkpcEkE7HNVPTdT+FQIqy5kAvpeE9rEAz+tcddriRDIG3UaAf5Y0of
	JcDD0I43BGMoevqtN1lOI+jg82mBQAQvsCYATLAv5ltchrcNAG3QfJUfoZzGRsfj
	iVfzF5xSTKiDnmWnBtPFmYvXUsKJLrS1mM3Ah5gWigHGDq81/0RKQ2YCgYPLlzk4
	LS5/A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tvc1x94k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:06:09 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 26 Oct
 2023 16:06:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 26 Oct 2023 16:06:07 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.177])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1C75E2A1;
	Thu, 26 Oct 2023 15:06:07 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Mark
 Brown" <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/8] System Suspend fixes and improvements for CS35L41 HDA
Date: Thu, 26 Oct 2023 16:05:50 +0100
Message-ID: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CwLOw8q_guIXhoM-B7Ilyqhyfv-NQ2Rm
X-Proofpoint-ORIG-GUID: CwLOw8q_guIXhoM-B7Ilyqhyfv-NQ2Rm
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6WIG5QT4JMT3W2CFC2OJ6XJ2EDD7SREI
X-Message-ID-Hash: 6WIG5QT4JMT3W2CFC2OJ6XJ2EDD7SREI
X-MailFrom: prvs=56633e4941=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WIG5QT4JMT3W2CFC2OJ6XJ2EDD7SREI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a report of a single laptop which uses CS35L41 HDA having an
issue with System Suspend. This particular laptop uses S3 (Deep) Sleep.
The reported issue states that when the laptop resumes from a system
suspend, audio no longer works.

The root cause of this issue is due to the CS35L41 being returned to us
in an unexpected state after a suspend/resume cycle.
When the driver resumes, it expects the parts to have been reset, which
leads to issues with audio and firmware loading.

To prevent this issue, and the possibility of similar issues, patches
2-5 force the driver to reset during probe, system suspend, and system
resume, which ensures that the part is always in the correct state.
Patches 6-8 are improvements in the suspend and firmware loading code,
which makes it easier to detect issues in the future, as well as
simplifiying the suspend code.

Patch 1 is a fix for an incorrect configuration for the HP Zbook Fury
17, which is the laptop which had the original issue.

Stefan Binding (8):
  ALSA: hda: cs35l41: Use reset label to get GPIO for HP Zbook Fury 17
    G9
  ALSA: hda: cs35l41: Assert reset before system suspend
  ALSA: hda: cs35l41: Assert Reset prior to de-asserting in probe and
    system resume
  ALSA: hda: cs35l41: Run boot process during resume callbacks
  ALSA: hda: cs35l41: Force a software reset after hardware reset
  ALSA: hda: cs35l41: Do not unload firmware before reset in system
    suspend
  ALSA: hda: cs35l41: Check CSPL state after loading firmware
  ASoC: cs35l41: Detect CSPL errors when sending CSPL commands

 include/sound/cs35l41.h              |   3 +
 sound/pci/hda/cs35l41_hda.c          | 170 +++++++++++++++++----------
 sound/pci/hda/cs35l41_hda_property.c |  11 +-
 sound/soc/codecs/cs35l41-lib.c       |   6 +
 4 files changed, 124 insertions(+), 66 deletions(-)

-- 
2.34.1

