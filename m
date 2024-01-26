Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D221083D961
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 12:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401D5852;
	Fri, 26 Jan 2024 12:32:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401D5852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706268748;
	bh=TN0XrQV2h/QTnlDKi6o2lGP7iDmvEvgx0po8yYmRfmI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aZs0u8ZK/AaW9L2SZGirE/uLfSJGYXKNBmx1lhmY+4pSX72dIRrbPEyHlh0quXLvf
	 gACgSlEd/KlsJLqoy14RpXW3ZNOE72RjGHB8ozOiCPUtVmc2sGEy83lIAzrTsfB7wR
	 YeDncfx3w4rq7QYXuws1T1lkNz7bzDbI0Q4Nc7bw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 884A6F80587; Fri, 26 Jan 2024 12:31:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DCEF805BA;
	Fri, 26 Jan 2024 12:31:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2599F80494; Fri, 26 Jan 2024 12:30:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 339A0F8025F
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 12:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 339A0F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=T/rY5rft
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QAq09q023770;
	Fri, 26 Jan 2024 05:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=0
	aT+NkSik14EJ6htlwQSwNMMDFmIeJnn5EUHgh1et3s=; b=T/rY5rftda/ip2nJ1
	+6fKOqYJ0UZ5tLhhXep70xWRo9EyHVjW1FPEUxpj5NCVEkxljTYCtFl6dJ3hs8jc
	YB5DlF9SsISFGM6cmrmiVP1AlUsu8n/DQBQT4duQykNiC2/dLYjNvOTU9isKwkG1
	MginvXXmEv7HAEMazev2NJg05WKaecp4IWIwcMkM8JwE0/rZufkp1HNaVDKxSCqE
	By0+UjL3uzU9te9RZI3cblHR1OQQdBUIl0Kv1p2dCRguvt5sVUk/v+wPAJA8MHjg
	oW5YDoEf2/0WwdCo9JKRPRCsNyKeX0K0nMrmU5zwvZs0sYa5W+zFGu+fKhYPOLw3
	tS0rQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9unnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 05:30:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 11:30:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 26 Jan 2024 11:30:17 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (LONNG2L6RQ3.ad.cirrus.com
 [198.90.238.116])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E6984820243;
	Fri, 26 Jan 2024 11:30:16 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/4] Support HP Models without _DSD
Date: Fri, 26 Jan 2024 11:30:03 +0000
Message-ID: <20240126113007.4084-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lGKmo7_SMIXhX6X4S-eR_EDqP3JGrQP-
X-Proofpoint-ORIG-GUID: lGKmo7_SMIXhX6X4S-eR_EDqP3JGrQP-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3JQQFLUBF3VJN36YIF2C6BQAN567Q26W
X-Message-ID-Hash: 3JQQFLUBF3VJN36YIF2C6BQAN567Q26W
X-MailFrom: prvs=8755fd102d=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JQQFLUBF3VJN36YIF2C6BQAN567Q26W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Quirks and driver properties for Dell models.
Driver properties are required since these models do not have _DSD.
Some models require special handing for Speaker ID and cannot use
the configuration table to add properties.
Also fix an issue for Channel Index property, when set through the
configuration table, to use the same method as when loading _DSD
properties. This is needed for laptops with 4 amps where the
channels do not alternate.

Stefan Binding (4):
  ALSA: hda: cs35l41: Set Channel Index correctly when system is missing
    _DSD
  ALSA: hda: cs35l41: Support additional HP Envy Models
  ALSA: hda: cs35l41: Support HP models without _DSD using dual Speaker
    ID
  ALSA: hda/realtek: Add quirks for various HP ENVY models

 sound/pci/hda/cs35l41_hda_property.c | 90 +++++++++++++++++++++++-----
 sound/pci/hda/patch_realtek.c        | 40 +++++++++++++
 2 files changed, 114 insertions(+), 16 deletions(-)

-- 
2.34.1

