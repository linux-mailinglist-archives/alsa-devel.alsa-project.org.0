Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 057CD8174EC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 16:14:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95266BC0;
	Mon, 18 Dec 2023 16:14:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95266BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702912471;
	bh=BKencx6p5wq+oJ8mtou/Z5l8HtUvZi9466/cAxa7tr4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SP306Gxn9wdhyT4/iFQfUjvEopIGq/In6aPlAg9woxN+93ON59DxNkxqjNBRVxIlg
	 Z4KQGXJJ2NkFna4qSuBTUDtpq6CrsMPaVkM9vz+k0KXn27TeDG78G7C7nrPmDeu3Dt
	 IurTRZ+CnEX85MLebsf44SMN9nmtMEmxIV/PsrLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16360F80601; Mon, 18 Dec 2023 16:13:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F2CF80617;
	Mon, 18 Dec 2023 16:13:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC66FF805D5; Mon, 18 Dec 2023 16:13:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F401F804DA
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 16:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F401F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Wm6IcXzh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BI8qL59016655;
	Mon, 18 Dec 2023 09:12:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=d
	unokV4spakSd7d2fILB4jcGfewzshlj//5mWZatk7M=; b=Wm6IcXzhaol1k7S4B
	avshHTAzPuA76hwx7sT3P1kSLTONNHDHniT+rrul14emGe5Mp7/SlUu95MoG3bcu
	RT7/K59DyhU3YqZ+jul+hE14wRncxEgdJVg9zyr+Y+ae3f/Vzz9hcZEayurhfOvw
	5ELOCVzGo2oQD1hGcc1jtiTf4ZJCncLHBT67z57vbSEWfYw/Qcn7KDDJyVLd/MGg
	lAJZ6ym9ytk18WOJpUfXnwNzXn00+kefq5O22sXkGA3yE8K2h8dcGjGKMMKnW+Xu
	CHMiDRimLoSvJz3NZzojwYyRHKByzGtuDiD7BPanVd0YwsHWnHWVEUt/LbGIME9U
	1zpdg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3v196natsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 09:12:48 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 15:12:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Mon, 18 Dec 2023 15:12:47 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.77])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E471615A0;
	Mon, 18 Dec 2023 15:12:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/7] Add support for various laptops using CS35L41 HDA
 without _DSD
Date: Mon, 18 Dec 2023 15:12:14 +0000
Message-ID: <20231218151221.388745-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QpRVrcYfWWlre1f6BRHgOCDEVys8zboe
X-Proofpoint-GUID: QpRVrcYfWWlre1f6BRHgOCDEVys8zboe
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WQPIW5XI66ADEIJRXK3OIKSOIEOALHFZ
X-Message-ID-Hash: WQPIW5XI66ADEIJRXK3OIKSOIEOALHFZ
X-MailFrom: prvs=7716b2c674=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQPIW5XI66ADEIJRXK3OIKSOIEOALHFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS35L41 HDA driver requires various system defined properties to configure
the driver for an individual system. For some laptops, these properties are
missing in the BIOS. To be able to support these laptops, there is a mechanism
in the driver to get this configuration from a lookup table, to be able to add
or patch _DSD as necessary.

However this mechanism currently only allows for laptops to be patched one at
a time, however, in the case where there are many laptops which need to be
configured generically, a generic function has been added, with an additional
lookup table to the individual laptops, indexed by SSID.

To support laptops using SPI without _DSD, an additional workaround is needed
to be able to support the SPI Chip Select GPIOs whose resources are defined
inside the _CRS for the Speaker ACPI Node. This workaround only works for
SPI laptops which contain up to 2 amps, since the SPI controller would not
allow more than 2 amps to be instantiated without the cs-gpios entry in
_DSD.

These patches add support for various ASUS laptops without _DSD, but the
framework added here allows for support for more laptops in the future
for other manufacturers. Support for laptops without _DSD from other
manufacturers is coming in the future.

Note: for systems which use modified _DSD to emulate the missing _DSD,
these patches are incompatible, and the modified _DSD must be removed in
order for the support through this framework to work for those laptops.

Stefan Binding (7):
  ALSA: hda: cs35l41: Add config table to support many laptops without
    _DSD
  ALSA: hda: cs35l41: Support additional ASUS ROG 2023 models
  ALSA: hda/realtek: Add quirks for ASUS ROG 2023 models
  ALSA: hda: cs35l41: Support additional ASUS Zenbook 2022 Models
  ALSA: hda/realtek: Add quirks for ASUS Zenbook 2022 Models
  ALSA: hda: cs35l41: Support additional ASUS Zenbook 2023 Models
  ALSA: hda/realtek: Add quirks for ASUS Zenbook 2023 Models

 sound/pci/hda/cs35l41_hda.c          |   2 +
 sound/pci/hda/cs35l41_hda.h          |   5 +-
 sound/pci/hda/cs35l41_hda_property.c | 362 ++++++++++++++++++++++++---
 sound/pci/hda/patch_realtek.c        |  39 ++-
 4 files changed, 353 insertions(+), 55 deletions(-)

-- 
2.34.1

