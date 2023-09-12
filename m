Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A076779D65E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287FDBC0;
	Tue, 12 Sep 2023 18:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287FDBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536393;
	bh=tycC9AGdQXo3Ifaa6oqoeNi8V2IPYdShOqBPxXefK+s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fJkcyCN03TL8bWJ/xnbOM8jX7KoKddR55NnMf4YlSutWtH15Y5SBEdWgjZKaBroFi
	 llgrXeSJtg5TvZ0WjMAJm7u6vLnMCT1OqK1xjsjeKVa9hgbtEG31i/ziE+bQ41Be+E
	 O7ppuRzslqNiIPPgzZg5I1yqhKVz5T8V8nFzIcnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3E3AF80549; Tue, 12 Sep 2023 18:32:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C3FCF80431;
	Tue, 12 Sep 2023 18:32:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E01AF80549; Tue, 12 Sep 2023 18:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B374F80425
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B374F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o/iE9Cum
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CFSmv7002448;
	Tue, 12 Sep 2023 11:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=Y
	zq9Xw4dTcc5E2TJ7dbQo9WUoZ24uQ0OYS9i7lTvOIE=; b=o/iE9Cum2iFUEYrLR
	KjePNT74rq72mj66a4QBGI2U7JYIBOm/Z8FRWkM0sNRZw28mE9epAptvjy3JITKI
	IJvADMAXIrOmyvmGXQg1a3BW7nhPYkkBLsaOtEMIgCbFhIk9GOgLyYkoPhbVjyoN
	QkpkQNPjk5FtgsksT2r58iNDyI8r9WL73+PAv52CngHXpzZKDUa3S1bFtV6DcoDX
	+KZicOPf9yamOqfWuq9cDB0zT1KT59/UcHm7Qyx8Y4g2/Z/rFXo/4j2BIc1LMX2n
	krPN09BFmVfP4iyFpZfTTuVg8X80DuCw3QkcIFp/fg+BHYEpTD5in4alZfP0O09N
	DDxRg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t0p3xkxda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:32:10 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 12 Sep
 2023 17:32:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 12 Sep 2023 17:32:08 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E5B9815B4;
	Tue, 12 Sep 2023 16:32:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 0/4] ASoC: cs35l56: Use PCI SSID to select specific firmware
Date: Tue, 12 Sep 2023 17:32:03 +0100
Message-ID: <20230912163207.3498161-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SBbUJ2GtAPPLx8gAMzW7KuSaoCNZSC6r
X-Proofpoint-GUID: SBbUJ2GtAPPLx8gAMzW7KuSaoCNZSC6r
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EFCKJNJZPLUMMHZQSGNUUJRATPJGBVPC
X-Message-ID-Hash: EFCKJNJZPLUMMHZQSGNUUJRATPJGBVPC
X-MailFrom: prvs=4619193f72=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFCKJNJZPLUMMHZQSGNUUJRATPJGBVPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The PCI device registers contain a subsystem ID (SSID), that is
separate from the silicon ID. The PCI specification defines it thus:

"They provide a mechanism for board vendors to distiguish their
 boards from one another even thought the boards may have the same
 PCI controller on them."

This allows the driver for the silicon part to apply board-speficic
settings based on this SSID.

The CS35L56 driver uses this to select the correct firmware file for
the board. The actual ID is part of the PCI register set of the
host audio interface so this set of patches includes extracting the
SSID from the Intel audio controller and passing it to the machine
driver and then to ASoC components. Other PCI audio controllers
will have the same SSID registers, so can use the same mechanism to
pass the SSID.

Richard Fitzgerald (4):
  ASoC: soc-card: Add storage for PCI SSID
  ASoC: SOF: Pass PCI SSID to machine driver
  ASoC: Intel: sof_sdw: Copy PCI SSID to struct snd_soc_card
  ASoC: cs35l56: Use PCI SSID as the firmware UID

 include/sound/soc-acpi.h         |  7 ++++++
 include/sound/soc-card.h         | 37 ++++++++++++++++++++++++++++++++
 include/sound/soc.h              | 11 ++++++++++
 include/sound/sof.h              |  8 +++++++
 sound/soc/codecs/cs35l56.c       | 11 ++++++++++
 sound/soc/intel/boards/sof_sdw.c |  6 ++++++
 sound/soc/sof/sof-audio.c        |  7 ++++++
 sound/soc/sof/sof-pci-dev.c      |  8 +++++++
 8 files changed, 95 insertions(+)

-- 
2.30.2

