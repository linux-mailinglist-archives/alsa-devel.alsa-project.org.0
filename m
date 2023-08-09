Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D47776287
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 16:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F4CF84A;
	Wed,  9 Aug 2023 16:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F4CF84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691591526;
	bh=8eiF3cQZuEIaFPBWqZEM2B64L9EiDETpEAKAuw3qDgg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GBhB1WHbl/Jzy3Me5tXKYLFHvTzh7Ve2kvAJPj6bHk0SFSmVshmooXGS+w/99YmE3
	 XWplH2JWE4UsFFfFptDbeS3qM1hv2qihgQpb5REba7Op8KzvsUS2yAuwbIMaMXeV0p
	 FtsjZV1VJ7QF8SQ59MCnfGgvLwZFoiokygaYqDhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAA7DF8055C; Wed,  9 Aug 2023 16:30:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13380F80553;
	Wed,  9 Aug 2023 16:30:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 201B9F8016E; Wed,  9 Aug 2023 16:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B063DF80134
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 16:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B063DF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nAA8Q7Jy
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 379BTo35016955;
	Wed, 9 Aug 2023 09:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=k
	7oicC2W1gL8Y9MV0xUCduzjQFCzOeObtNzsPJBcSFc=; b=nAA8Q7JyG5x0C8N2l
	NIORZ2OoYlPaghZLCb9cbTkko5IQldDkrQs3YofBf/hZwErl9W9PSiWXblDEv2jO
	1tChXocPfuT8mIfvQHGwq0vSLj/MFMl7Y2eTpGoc++uUX/y/jGeQT8Q7qqduZLF5
	Dq23c5cRt7MjrGGOgI1IUXJGdFZH5VkIqhSoSC8/vWDOx7caRb9VpdZChEgZZMFi
	0biptMMkuXhL5CrovZs1MOnX87MsF6hfW26zJB4/HruNRZImL+pwhQFT6PH35WUG
	FnOiUMqZAaqbzFIqdb9RPe/1AHYWFYyo17Z78NosOFoiPhD2ZBIu8LemPGC2vwKe
	K4BLg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vtahxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 09:30:06 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 15:30:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 9 Aug 2023 15:30:04 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.31])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7CAB4475;
	Wed,  9 Aug 2023 14:30:04 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/2] Add HP G11 Quirks and update Dell Oasis Quirks
Date: Wed, 9 Aug 2023 15:29:55 +0100
Message-ID: <20230809142957.675933-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rk6lFwNG1gEdRCmKSDGAqy8gw-WSps0Z
X-Proofpoint-ORIG-GUID: rk6lFwNG1gEdRCmKSDGAqy8gw-WSps0Z
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KH4UUFZU52ERASCLE5I6RDOA6ASQMDAA
X-Message-ID-Hash: KH4UUFZU52ERASCLE5I6RDOA6ASQMDAA
X-MailFrom: prvs=3585fcd417=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KH4UUFZU52ERASCLE5I6RDOA6ASQMDAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add quirks to support HP G11 using CS35l41 HDA, using both SPI and I2C.
One older HP laptop has an SSID removed.
In addition, all Dell Oasis laptops using CS35L41 have been switch to
use SPI, with one SSID removed.

Changes from v1:
- Add fixes tags

Stefan Binding (2):
  ALSA: hda/realtek: Add quirks for HP G11 Laptops
  ALSA: hda/realtek: Switch Dell Oasis models to use SPI

 sound/pci/hda/patch_realtek.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.34.1

