Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F337A4665
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 11:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB8C741;
	Mon, 18 Sep 2023 11:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB8C741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695030812;
	bh=9S68Btn9g/0RkNzUHTrKwcpTkNfab3QVtRX2qe80Qzo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R5tVTki8469LLCf6MgyZR5hmZzYFDYuCzJkJbkxC+2SRLgdyfTN52X2pP1mPc241T
	 ecscTJ+7M/QNLNbeuuknGoGGvZyEcZ/rNXeRZVn8LM4wtAIpDmO26gAPm84f1jeGcY
	 cpIB76xGQE9DpvF9i3kdPh7M2v/osr28siCpliGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FC99F80558; Mon, 18 Sep 2023 11:51:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F1DBF80558;
	Mon, 18 Sep 2023 11:51:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DEAAF8025A; Mon, 18 Sep 2023 11:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B6A6F80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 11:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B6A6F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gfd3uiuO
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38I6K0DO017792;
	Mon, 18 Sep 2023 04:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=O
	ekxzRcVaZo051lSiRKtMaMlNmQuGAT/oxmqstQ4suc=; b=gfd3uiuOnWYePPdhl
	bCXvCzRs1/ROHAIha7pMHyteS/I6mlruBwTeyXRtpgxlgeLKNQXE907/VaAk7CTM
	OvccVfFLSL6ymPd2HLqjpBw4h/OvRDxRspctV1f6eS8Bsh3zqt1DY45BbCt9LTLV
	DDUNDmkS9RMMTCDYMHs3kO3z222qocZOR3MO4XY3ReiEFxVr3odd8f8qSK+XQltL
	w+xDCkMRPKVx8rLyc+NeplW8p3G0LWGRm+tWZiW/aqlU9ldAvZmjOcurFg+ZfwiF
	F/ashZ07xeRG3U1oZ2LVtRdILoWjjPyJHWfuFAxt5WyfSmhUNcL5bjuyc7SDXHcZ
	SplWQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry256c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 04:51:35 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 18 Sep
 2023 10:51:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 18 Sep 2023 10:51:33 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.90.238.137])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9DE0611AA;
	Mon, 18 Sep 2023 09:51:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 0/2] ALSA: hda: cs35l56: Handle speaker id GPIOs
Date: Mon, 18 Sep 2023 10:51:27 +0100
Message-ID: <20230918095129.440-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lvXNau_bsidQSZVhdqEAskyfFpke2A4r
X-Proofpoint-ORIG-GUID: lvXNau_bsidQSZVhdqEAskyfFpke2A4r
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OO3XEVRYFJAK6MT6AW4SB2XY3NPDNAHW
X-Message-ID-Hash: OO3XEVRYFJAK6MT6AW4SB2XY3NPDNAHW
X-MailFrom: prvs=462534807c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OO3XEVRYFJAK6MT6AW4SB2XY3NPDNAHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some manufacturers use multiple sources of speakers. Motherboard
GPIOs are set to indicate which type of speaker is fitted so that
the correct tunings can be loaded. Patch #1 adds support for this
and patch #2 adds a KUnit test for the new code.

Richard Fitzgerald (2):
  ALSA: hda: cs35l56: Add support for speaker id
  ALSA: hda: cirrus_scodec: Add KUnit test

 MAINTAINERS                        |   1 +
 sound/pci/hda/Kconfig              |  17 ++
 sound/pci/hda/Makefile             |   4 +
 sound/pci/hda/cirrus_scodec.c      |  73 ++++++
 sound/pci/hda/cirrus_scodec.h      |  13 +
 sound/pci/hda/cirrus_scodec_test.c | 370 +++++++++++++++++++++++++++++
 sound/pci/hda/cs35l56_hda.c        |  24 +-
 7 files changed, 501 insertions(+), 1 deletion(-)
 create mode 100644 sound/pci/hda/cirrus_scodec.c
 create mode 100644 sound/pci/hda/cirrus_scodec.h
 create mode 100644 sound/pci/hda/cirrus_scodec_test.c

-- 
2.30.2

