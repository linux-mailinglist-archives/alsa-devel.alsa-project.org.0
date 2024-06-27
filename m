Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C18591A8E7
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCA8C21A3;
	Thu, 27 Jun 2024 16:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCA8C21A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719497731;
	bh=OQ0U4kjpqazjir74iOIxPPwvSKrOayMnsLvpYVcMIPs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R/TuUJl/Dv0c2f6+cPmbfQZRQ/puBb4EXFSrnvHuWR2YM/I/xKlKDCsuFvcirr1uD
	 /VQ2S5sZjeuscluhLzsod7JOjx37RGEo2PfmsRAZHEg4utvVXt78vyfRMJc1OxTRuf
	 PffPv6yOX7w6uA6ffX8ThOH59GcUEKF5kYgBX7TI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2927BF805B3; Thu, 27 Jun 2024 16:14:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DEB5F805DA;
	Thu, 27 Jun 2024 16:14:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59C91F804D6; Thu, 27 Jun 2024 16:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F3CFF80154
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F3CFF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=a4XRwywB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45RCpZV9009358;
	Thu, 27 Jun 2024 09:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=MCVtrJtn2IVRVV12
	a/GpV1qk2cW+zeuMidMKP6Eg6FY=; b=a4XRwywBjRsYPB+vFcyH9JdsCtezXVLj
	IZG11DhzbmBA2dV35iuUtvHOQjCyYnH/RVnRv1J4Sf1es73e2sCpaNFezWTY01jf
	o0BdUHnEnAS73LSl4Fzbn6lUkIZNfYVkb7ZWXWI8Fru3u2/Ye99GeAf/yNcrAnAz
	lkkRyjuYsWURoTh+FiVtmw25r/yOc/PF3NXDSX8Ud/Kz7+YG58oo/y+ALXzXLTEm
	isn2ojniBagL2GrOgr8xRBgvnQvoO9VLTEnAN/UcuVZZgA+KqQg1QReN/iHsJ0/w
	GSdzvz3pu0IW7v37B7I1VApuaMf8KOXbtjqyQDllpYN5nNBewwqbrA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 400nbds7rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 09:14:34 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 15:14:32 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 27 Jun 2024 15:14:32 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 54B3C820270;
	Thu, 27 Jun 2024 14:14:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 0/4] firmware: cs_dsp: Add check to prevent overrunning the
 firmware file
Date: Thu, 27 Jun 2024 15:14:28 +0100
Message-ID: <20240627141432.93056-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NqvQZcRcVTqnG_vpKPiSt7_IRLYcV8ql
X-Proofpoint-GUID: NqvQZcRcVTqnG_vpKPiSt7_IRLYcV8ql
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IRTIS7AAOOAKHGTXFGQAH6FWC56BACH3
X-Message-ID-Hash: IRTIS7AAOOAKHGTXFGQAH6FWC56BACH3
X-MailFrom: prvs=3908a169f9=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRTIS7AAOOAKHGTXFGQAH6FWC56BACH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series fixes various missing length checks when processing
variable-length data from the firmware file. These could have
caused overrunning the end of firmware file buffer, or wild
pointer accesses.

Richard Fitzgerald (4):
  firmware: cs_dsp: Fix overflow checking of wmfw header
  firmware: cs_dsp: Return error if block header overflows file
  firmware: cs_dsp: Validate payload length before processing block
  firmware: cs_dsp: Prevent buffer overrun when processing V2 alg
    headers

 drivers/firmware/cirrus/cs_dsp.c | 223 ++++++++++++++++++++++---------
 1 file changed, 160 insertions(+), 63 deletions(-)

-- 
2.39.2

