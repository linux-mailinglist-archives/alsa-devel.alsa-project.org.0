Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A48B5E16
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 17:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 486A5820;
	Mon, 29 Apr 2024 17:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 486A5820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714405784;
	bh=R25+vm62+Ne8uiOdiOfEZlbX4DfhAhHpc4l0dOcBfxY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TifHdaWDtjdJC4bnJJd7PtQU4Eke3af3vO0BPccGqrZKuKJ6HPNwJRtgAH4hUoOmT
	 M+vAXOGTPvrkxdp5WXssNMFe+Uy9wy4r8MjIJJwOCf1nCmW88jU0ayMNm8x5dzNrC2
	 sFdE2WfJ3N22i0MLTxUvP4akaIsS99kf5QRgNNeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4EADF805A8; Mon, 29 Apr 2024 17:49:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2E4F8057E;
	Mon, 29 Apr 2024 17:49:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E8E2F80548; Mon, 29 Apr 2024 17:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BB30F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 17:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BB30F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cDOcxxid
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43T6w4ko002816;
	Mon, 29 Apr 2024 10:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=9
	Z+InM3fGAIBxOq1qrvLElfhG+iCwLb2LgUarZtzndg=; b=cDOcxxidzkxxjOt5M
	11bdj7m5rDHIVLMxFkB8THi62G5cbFL8edirJQ3WCNfYaeWz2V1+kRbL/ZDQj7w/
	l3P5w1cvABbQlqMWhSS/uryoYvCIH/zTGpTQbuQZK95b78T4flBRA58rgH6PsMJe
	tW/bpXiuoHmzGzn6cIZvBOakzEDh3ZqZpefuDOyd9Eq5U3x3aclWg48ZYuPLd1Bv
	g7cSblqrBjHI1wgnQOhp1R8BvtLFdSQ+BAHJW5TVWrZu6JSYQSrU6pVI+Rj5N1mX
	/OEa6NChESpErmE2x1dvV+N/sS23clr5ZrfzbLGlipKTt3Ft950VjdPB0L3W7myL
	yTUaw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xrwsjj2yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 10:48:57 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 16:48:56 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 29 Apr 2024 16:48:55 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.65.105])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AB8D282024A;
	Mon, 29 Apr 2024 15:48:55 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] ALSA: hda: cs35l41: Ignore errors when configuring
 interrupts to allow laptops with bad ACPI to play audio
Date: Mon, 29 Apr 2024 16:48:51 +0100
Message-ID: <20240429154853.9393-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WkX4U-jiJGlRsx0YqXNZ_OE5832k4UuM
X-Proofpoint-GUID: WkX4U-jiJGlRsx0YqXNZ_OE5832k4UuM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2JPZDP2TKSYQZ2RKZCD4SXC5RP7LHEQ6
X-Message-ID-Hash: 2JPZDP2TKSYQZ2RKZCD4SXC5RP7LHEQ6
X-MailFrom: prvs=284996dae7=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JPZDP2TKSYQZ2RKZCD4SXC5RP7LHEQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some laptops have a bad _CRS defined for its interrupt.
This errors out inside the driver probe for CS35L41 HDA.
However, there is no fix in software for this bad configuration,
and it is unlikely to get a new BIOS, therefore it is better to
allow the laptop to continue probe, instead of erroring out inside
the probe. The interrupt is only used for Error Detection and
recovery, without the interrupt the driver will continue to function,
but errors will not be detected, and recovery will require a reboot.

Also add support for ASUS ROG 2024 laptops.
These laptops were released without _DSD, so need to be added into
the CS35L41 config table. Quirks for these laptops already exist.

Stefan Binding (2):
  ALSA: hda: cs35l41: Ignore errors when configuring IRQs
  ALSA: hda: cs35l41: Add support for ASUS ROG 2024 Laptops

 sound/pci/hda/cs35l41_hda.c          | 69 +++++++++++++++++++---------
 sound/pci/hda/cs35l41_hda_property.c | 10 ++++
 2 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.34.1

