Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107B36948AC
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 15:52:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C7C2828;
	Mon, 13 Feb 2023 15:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C7C2828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676299927;
	bh=5g8b7W+4haDPD74OWYbD5M1k4On/z/ehHK2lgVdRwDA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SWmyJYlOzi+JCRd6/VpN+1a7w5thczzs27UYlGbzXQQzQQd7ZuPkwBst61Os+JGpN
	 j+b4qp4RWtclVupWmAeOWMBOyZ5ebtaz4ZxJQozuR2TQSn3anGFmO9WlGQ2wtkmBI4
	 BL0li85/Tf4n9dWC1lI/gaKhBLhuzVZ+rzrReNdQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B04F0F8051F;
	Mon, 13 Feb 2023 15:50:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F235AF804DA; Mon, 13 Feb 2023 15:50:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 259DEF800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 15:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259DEF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CODnYzQ+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31D5UX5C028354;
	Mon, 13 Feb 2023 08:50:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=RFBJEatO/vsWNkGO54aXwHGrOOAWKM+ZNa81J3Z8pYQ=;
 b=CODnYzQ+wQhw60eQ/0MnEQP89Fxg3p4Bik0h6GNNDgAD9/HkN1tOIDiVVgWuTLPUBsWO
 KAj6n5IVvXRrCAEvGTyASfilcWhobNLHxz5bL2huG+rWcnREM4hKZH2JU1SNfZrleAiD
 xRx5Olbe9mHegeklMoURCGHFgI+4vWp9Mz4481o/5k/WF0h9xqFPcayHHY4XEntu77oE
 Jb8llVou1PxtNJU0X7t7xSkFD1QzCFm+1j3eXgGgPaYuJUKRCGEdYA1IZHow/k9QSUsG
 DOf5WEDSK53la+/XrJ8tWvQl4NDsTKiONRCtK3eqMnS036ei/0vs++hbFRChG+LbPvnr /g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3np9a72amh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 08:50:13 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 13 Feb
 2023 08:50:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Mon, 13 Feb 2023 08:50:10 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AF00EB0E;
	Mon, 13 Feb 2023 14:50:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/3] Fixes and Improvements for CS35L41 HDA
Date: Mon, 13 Feb 2023 14:50:05 +0000
Message-ID: <20230213145008.1215849-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zEjz3ARui3DbGe9xsOdn2PJLUMSlCXvz
X-Proofpoint-ORIG-GUID: zEjz3ARui3DbGe9xsOdn2PJLUMSlCXvz
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VMTDVOCHMDWEHKDYSTY3GY47LS7WBXR6
X-Message-ID-Hash: VMTDVOCHMDWEHKDYSTY3GY47LS7WBXR6
X-MailFrom: prvs=7408c1a398=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMTDVOCHMDWEHKDYSTY3GY47LS7WBXR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes issue in calibration, where return codes were misinterpreted.
Enable High Pass filter to reduce pops and clicks.
Add improvement to ensure firmware and tuning files are always loaded
together. This ensure the firmware is alsways running with valid
coefficients.

Stefan Binding (2):
  ALSA: hda: cs35l41: Ensure firmware/tuning pairs are always loaded
  ALSA: hda: cs35l41: Enable Amp High Pass Filter

Vitaly Rodionov (1):
  ALSA: hda: cs35l41: Correct error condition handling

 sound/pci/hda/cs35l41_hda.c    | 109 ++++++++++++++++-----------------
 sound/pci/hda/hda_cs_dsp_ctl.c |   4 +-
 2 files changed, 56 insertions(+), 57 deletions(-)

-- 
2.34.1

