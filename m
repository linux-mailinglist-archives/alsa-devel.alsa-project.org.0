Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D156389BCF8
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 12:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20E0B22AB;
	Mon,  8 Apr 2024 12:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20E0B22AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712571900;
	bh=Ud0GI2flSvHcXw7VWyujx4h4/Y6ogZjhOy0fklopGM8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oemOAM2080GR6O6n5a9qbxi5rCGyMdycuT4wSExe7rJgnwvd7zXm9eiRCDy5uv7Wm
	 MS9o5aIuZvZxzXLlWvRpibuvAX53kVlRUPOFKrtdquWl0tcadQyIAYrUqd9AqfHCn4
	 jCLOLpbTberVu00a+nGkSTaijlK8NGPppLUDu0Ms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77E57F805C7; Mon,  8 Apr 2024 12:24:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 288E6F8059F;
	Mon,  8 Apr 2024 12:24:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC81AF800C9; Mon,  8 Apr 2024 12:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B2A5F800C9
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 12:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2A5F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nd7vMODY
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4385o0CU020277;
	Mon, 8 Apr 2024 05:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=S
	r7C9ozK7GY64+rWeoWTEytRlN75UgieuR9uJAm3Bpg=; b=nd7vMODYwFhmoPd/n
	S+8tQkjyghOADqycT/Ql8dJZmI8aCqSpW+czmpdXFVA6A41kDuXRaOpJf0uOdBOc
	nOrutklC/IYisxvYFiDJAQOWRpzx/cpUQli94/rCkJfDJOOPDla87cqLpVR4jW9f
	ETRN+5KGcytFHyjMbCyDSgRfMTPXRCHo+SqGmP5SYYv13D5SthsgvQohDsjPtj8k
	MmK9sHO9Rey2T8vRqyhyb2aPngY/BEgMedOa/YkQ3yqu+s2CRofUFG3DW39mDhLb
	m2YjU+u0kQdG4uadsYTrflchULb6XIc8Gb4Be5GszBdk2akZ5s26KxJYrnDQQZ+o
	Bo16w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xb2tjhp0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 05:24:18 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Apr 2024
 11:24:16 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Mon, 8 Apr 2024 11:24:16 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 25413820242;
	Mon,  8 Apr 2024 10:18:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 0/4] ASoC: cs35l56: Fixes to handling of ASP1 config registers
Date: Mon, 8 Apr 2024 11:17:59 +0100
Message-ID: <20240408101803.43183-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WqCasWKkO3re0xRWNkShxb2S27Q2THeC
X-Proofpoint-GUID: WqCasWKkO3re0xRWNkShxb2S27Q2THeC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IUHXFWPWRNJPQOMVNX3ILEPVZ5YXGB5H
X-Message-ID-Hash: IUHXFWPWRNJPQOMVNX3ILEPVZ5YXGB5H
X-MailFrom: prvs=182810dd8d=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUHXFWPWRNJPQOMVNX3ILEPVZ5YXGB5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This chain fixes some problems with some previous patches for handling
the ASP1 config registers. The root of the problem is that the ownership
of these registers can be either with the firmware or the driver, and that
the chip has to be soft-reset after downloading the firmware.

This chain adds and uses a regmap_read_bypassed() function so that the
driver can leave the regmap in cache-only until the chip has rebooted,
but still poll a register to detect when the chip has rebooted.

Richard Fitzgerald (4):
  regmap: Add regmap_read_bypassed()
  ALSA: hda: cs35l56: Exit cache-only after
    cs35l56_wait_for_firmware_boot()
  ASoC: cs35l56: Fix unintended bus access while resetting amp
  ASoC: cs35l56: Prevent overwriting firmware ASP config

 drivers/base/regmap/regmap.c      | 37 ++++++++++++++
 include/linux/regmap.h            |  8 +++
 include/sound/cs35l56.h           |  2 +
 sound/pci/hda/cs35l56_hda.c       |  4 ++
 sound/soc/codecs/cs35l56-sdw.c    |  2 -
 sound/soc/codecs/cs35l56-shared.c | 83 ++++++++++++++++++++-----------
 sound/soc/codecs/cs35l56.c        | 26 +++++++++-
 7 files changed, 130 insertions(+), 32 deletions(-)

-- 
2.39.2

