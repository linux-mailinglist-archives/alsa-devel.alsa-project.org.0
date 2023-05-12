Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E66D700C3B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 17:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50038AE9;
	Fri, 12 May 2023 17:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50038AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683906372;
	bh=PEMlyPCMv43bUQJfYLHY+p3u6WcZal0We6z13iRDgfQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BAzOaroNopOcvehsgHyTIkPo72GzAMO2c5mHq22p2ngh+DwYo41IJucHpt9CUCSoh
	 9ic79fFqWs10SwL0qqsoDOT4oRSV8uKLodsyvPmSG28vFuFgLUpjOlCFAFoGpVNzeY
	 pfSwlXGzKNL/mhFhTeA/2ODFbNKW90uFQP1GZ1FU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 886FAF8052E; Fri, 12 May 2023 17:45:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0272EF8032D;
	Fri, 12 May 2023 17:45:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 694D6F8052E; Fri, 12 May 2023 17:45:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 63E2CF8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 17:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E2CF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SIak9g6X
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C79TgU025224;
	Fri, 12 May 2023 10:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=lHXOEPzMmJpJJtctAXslEAt0yDKA0rBMd/g/d9oHa9c=;
 b=SIak9g6XNPnadXfBl9K131O9WwUp5Ivm7WhJTVxkOoRqRQAzvFSLOwYBYc36uXzRz2cE
 atdW3jebRNoRws3NZ7PSNYtGDoFVsSwlEWZ9Za91RJuOVtKTpmh16/4BMUR2qUR6aCrR
 LH7+NH7EaLj1uUJDqeWKTQj52AZ4ixeQCUeTHJAAB9sHwW9+x30fzGGe+aE3fRgomiG6
 zf+lLxPlHY11RniohngNxmiUdg33FvS88wReoIjvYWBu2e/yONw363qZheeJdazPn5vF
 88sISdl4GJmTyQyIbIK72uCS3umhG5Qe1wAIuFuIOU+Ms/jqgQ0KPx6x7yWsa1wM1MHP Nw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46nsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 10:45:12 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 10:45:03 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 10:45:03 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 166BA11A8;
	Fri, 12 May 2023 15:45:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Lucas Tanure
	<tanureal@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH RESEND] MAINTAINERS: Remove self from Cirrus Codec drivers
Date: Fri, 12 May 2023 16:45:03 +0100
Message-ID: <20230512154503.741718-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0eFYYzEpGnPGz0_MovsstmxeMKVBtcI0
X-Proofpoint-GUID: 0eFYYzEpGnPGz0_MovsstmxeMKVBtcI0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5EZRFMXNX456R4BS2FFOPUVGQQPA4PRZ
X-Message-ID-Hash: 5EZRFMXNX456R4BS2FFOPUVGQQPA4PRZ
X-MailFrom: prvs=04962df89c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5EZRFMXNX456R4BS2FFOPUVGQQPA4PRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lucas Tanure <tanureal@opensource.cirrus.com>

I'm leaving Cirrus Logic, and will no longer have access to
hardware and documentation necessary to be effective in a
maintainership role.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c919c282f599..5c37070138f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4923,7 +4923,6 @@ F:	drivers/media/cec/i2c/ch7322.c
 CIRRUS LOGIC AUDIO CODEC DRIVERS
 M:	James Schulman <james.schulman@cirrus.com>
 M:	David Rhodes <david.rhodes@cirrus.com>
-M:	Lucas Tanure <tanureal@opensource.cirrus.com>
 M:	Richard Fitzgerald <rf@opensource.cirrus.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	patches@opensource.cirrus.com
-- 
2.30.2

