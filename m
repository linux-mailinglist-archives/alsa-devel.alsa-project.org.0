Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC9889CEE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 12:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93BFB1945;
	Mon, 25 Mar 2024 12:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93BFB1945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711366346;
	bh=MJQZPFsYuoWMOOKpqEWdDBSguutaxNezVILCQTDO434=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nqQ1D3yvm482RJxqJMAd2adnSMR38xRZnrutatTEYoAhIh/Nzib9XALpOYw571oi/
	 wCMVtN3ShQFYCDZmpllhbi8K5ZAsOXN6KxqOwV/Yo3EeB3u7ev3t+S+IdqXd72bFTb
	 LavRZxL2FFDZwS0JdpFh2Vimbf+cq4BuKtrS2D2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E760F80589; Mon, 25 Mar 2024 12:31:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B6ABF80589;
	Mon, 25 Mar 2024 12:31:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 375A1F80564; Mon, 25 Mar 2024 12:31:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C710F80093
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 12:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C710F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BvWMcMW0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P4qkf3007553;
	Mon, 25 Mar 2024 06:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=B
	GcWn7Vy3IP2SJ0lUTxgCUyOMlOORhPAToSh6yl/wik=; b=BvWMcMW0AFEJbcVpl
	N/H3iWdtmnkhlCD4K2IRAP4UwGO8uJQoagQlEmJIVyhs6yaIAeWRH4LtmhHSo/Sh
	x9HdataaQPk8HITz0EOvgZf9jwd/gluc+ewVc1kWkOAmf2u6HUoGDKC35l7EAlLe
	NPkRCV492Ylcl4BRzWRUgmxMRcIUTvHCaPcaNsjsPgIR44E/4BixNZLkKNF/XlL7
	5lzpoFtjhtatZVDmFQf9SHCamPD/k4HMQ+xE3ncl6PnMVlDb7Uej6SlK4eyjxuS5
	A78XYmMZFUnBimhddr1nseKug06ZneLBeZHTkoQB9HuCAkutqVs3CFHilqWyeZLL
	ptorA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyb6v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:31:29 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 11:31:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 25 Mar 2024 11:31:27 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2DEC7820241;
	Mon, 25 Mar 2024 11:31:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 0/5] ALSA: cirrus: Tidy up of firmware control read/write
Date: Mon, 25 Mar 2024 11:31:22 +0000
Message-ID: <20240325113127.112783-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eEuzHHeve88IErOHMGl7VLKzH3MtdUFP
X-Proofpoint-GUID: eEuzHHeve88IErOHMGl7VLKzH3MtdUFP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LSUSDGKYXQZXCUQIDUKHEFLKHUYUCQI2
X-Message-ID-Hash: LSUSDGKYXQZXCUQIDUKHEFLKHUYUCQI2
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSUSDGKYXQZXCUQIDUKHEFLKHUYUCQI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This set of patches factors out some repeated code to clean up
firmware control read/write functions, and removes some redundant
control notification code.

Simon Trimmer (5):
  firmware: cs_dsp: Add locked wrappers for coeff read and write
  ASoC: wm_adsp: Use cs_dsp_coeff_lock_and_[read|write]_ctrl()
  ALSA: hda: hda_cs_dsp_ctl: Use
    cs_dsp_coeff_lock_and_[read|write]_ctrl()
  ASoC: wm_adsp: Remove notification of driver write
  ALSA: hda: hda_cs_dsp_ctl: Remove notification of driver write

 drivers/firmware/cirrus/cs_dsp.c       | 54 ++++++++++++++++++++++++++
 include/linux/firmware/cirrus/cs_dsp.h |  4 ++
 sound/pci/hda/hda_cs_dsp_ctl.c         | 22 +----------
 sound/soc/codecs/wm_adsp.c             | 32 ++++-----------
 4 files changed, 67 insertions(+), 45 deletions(-)

-- 
2.39.2

