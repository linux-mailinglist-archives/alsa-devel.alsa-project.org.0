Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE44769D70
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3492E1E7;
	Mon, 31 Jul 2023 18:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3492E1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822739;
	bh=pIPOtKHM50ooWnt8FmWmzcj1jyvmBNdIoHNXxa4eZKQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MxH/uQNzWhN2wdrrKN2t7AYASEBuXGfuX5ujhKRbLgpiJhi65TNq0QeQxDQnUs+FY
	 Kh+JZhxwqpYAameK+zWqk6vYLYf2t9lOk+eZkIDVpserlee+i6RqUdQHKJ5fpfEop5
	 dlVrn+p7fbL4Uc/P9Ke+Q5vkDW0QbE2RpWHp4TLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795F8F80557; Mon, 31 Jul 2023 18:57:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B50F80535;
	Mon, 31 Jul 2023 18:57:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B6EF80535; Mon, 31 Jul 2023 18:57:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BC407F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC407F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MojlI1S3
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36VEwHWb032490;
	Mon, 31 Jul 2023 11:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=D
	pc3VbtcgH5dw2bWcYGHp9VKyHItpm8FBtHXtotTc7Q=; b=MojlI1S3wPIbyJ55f
	49XlhCZuOfQGuaxFAp0kHUVxb8Nb97wV1mS95+8frqoBDjAkl80nKdOkEAna6Laz
	mk6FD/mk/cp0YqsEX89vfqlrbOJPSxZoVKw3tOz7PqL4jcGADkRM/fsXAGroguiU
	0qxNIcrjtvpjM+HtPa3unJOVjz95VoEe+25oJJ2pOm6uQ+Tfzo0Rd+P/kvrnQE9d
	dfv3o4kWevy+l/cfDlVGAhFNVXFfkQSNaNmmaBz/JyzA2E9w6Mhe2xHq1gB6oy67
	+/kqAs7MAdpfUGl6d0i4Yk8L/y96TVIk8jCZTBBSZg0xWdRypm6Vpn3Hpsg6wU2p
	KfCZw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s4y6jsqap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:31 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Mon, 31 Jul 2023 17:57:29 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A3E4D45D;
	Mon, 31 Jul 2023 16:57:29 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 0/9] ALSA: hda/cs35l56: Various bugfixes
Date: Mon, 31 Jul 2023 17:57:17 +0100
Message-ID: <20230731165726.7940-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PWwIvLfDyaxyiRD9TvkGHVEfMWz1iJpP
X-Proofpoint-ORIG-GUID: PWwIvLfDyaxyiRD9TvkGHVEfMWz1iJpP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DAIZ2HSRLTERNDVCFKCQ4YZ4K6BZSKPA
X-Message-ID-Hash: DAIZ2HSRLTERNDVCFKCQ4YZ4K6BZSKPA
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAIZ2HSRLTERNDVCFKCQ4YZ4K6BZSKPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A collection of various bugfixes to the cs35l56 driver.

Richard Fitzgerald (9):
  ALSA: hda/cs35l56: Complete firmware reboot before calling
    cs_dsp_run()
  ALSA: hda/cs35l56: Do not mark cache dirty after REINIT
  ALSA: hda/cs35l56: Call cs_dsp_power_down() before reloading firmware
  ALSA: hda/cs35l56: Always power-up and start cs_dsp
  ALSA: hda/cs35l56: Call cs_dsp_power_down() before calling
    cs_dsp_remove()
  ALSA: hda/cs35l56: cs_dsp_power_down() on cs35l56_hda_fw_load() error
    path
  ALSA: hda/cs35l56: Do not download firmware over existing RAM firmware
  ALSA: hda/cs35l56: Fail if .bin not found and firmware not patched
  ALSA: hda/cs35l56: Reject I2C alias addresses

 sound/pci/hda/cs35l56_hda.c | 91 ++++++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 26 deletions(-)

-- 
2.30.2

