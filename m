Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248B487A1F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 17:07:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E037F17DA;
	Fri,  7 Jan 2022 17:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E037F17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641571677;
	bh=qcgxyM/M86pC78VSKykOD8PQbKHPVYipdfRDP09tDqs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZVfL6Qu5uLX9k8zg2nq5sECTLzYOuDHLOzJtEVLhZ7kjv0KXYgb0f+rIMZ6kXHoOF
	 ScYmaxW25e55SB7wB5wOcsQB3pxjiw0CM4grIDg2ahiDdHRv4BCy5ZOY5jasjlre20
	 ZWRWtb06S7S15PNcg1i1JkkWTX1WCRYfOVTb+GJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E8CCF80082;
	Fri,  7 Jan 2022 17:06:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85FF5F8025D; Fri,  7 Jan 2022 17:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D635F800AE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 17:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D635F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="olG8vwsE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207Fo5en008257;
 Fri, 7 Jan 2022 10:06:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=AZHvETci1n4kMyjiI/bOuQF4OLFyYHQKnRu4S0irYFs=;
 b=olG8vwsEcPNMSK3tSB1JJXTYjUE+NrjP0EwdqJEZDnjWODmsxIi46VYZNj9eRXvTS5to
 tR66+UazjYHQSrPvhYa9WXpthmQjYNwsGbXTphra8wmnfqwJf36/XMWlvjvkFPs1TZ73
 07mGXNvF3EdaWOr6iSdbN5PZIDto6vI4n0R5HsPnaP3zprHtMGC4Ig0YR4egKvCNfhQ2
 I3lksVUGghi8GNtZkjGeDNEAsaMd1QlP/dRSvpN4bxjq0T2izQlYXEwnJQ9+TkjLJJ/A
 Pz8sLHrM0kjL4DvJecragpyqT7rUqG6v9HKNpi/i0gBkHLJb+bSBoxPm9pt2kwqGth67 bA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dergng0n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 07 Jan 2022 10:06:39 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 7 Jan
 2022 16:06:37 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 7 Jan 2022 16:06:37 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E605B2A9;
 Fri,  7 Jan 2022 16:06:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/2] Add low power hibernation support to cs35l41
Date: Fri, 7 Jan 2022 16:06:34 +0000
Message-ID: <20220107160636.6555-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 7xccvbLp4fFnrv5ejlmM7n3yv1ycpRtz
X-Proofpoint-ORIG-GUID: 7xccvbLp4fFnrv5ejlmM7n3yv1ycpRtz
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch series adds support for the low power hibernation feature
on cs35l41. This allows the DSP memory to be retained whilst the
device enters a very low power state.

These patches will cause some very minor conflicts with Lucas's
currently outstanding work on the HDA version of cs35l41.  Whilst
things will still build (well now I fixed my silly mistake), this
patch adds a test key function his code will now have to call.

It looks like Lucas's patch might get a respin based on the comments
from Andy, in which case I guess we can pull the small change into the
next version of it. But either way these patches are not urgent so I
am happy if they sit around until Lucas's stuff is merged too.

Thanks,
Charles

Charles Keepax (2):
  ASoC: cs35l41: Update handling of test key registers
  ASoC: cs35l41: Add support for hibernate memory retention mode

 include/sound/cs35l41.h        |   7 ++
 sound/soc/codecs/cs35l41-i2c.c |   1 +
 sound/soc/codecs/cs35l41-lib.c |  73 +++++++------
 sound/soc/codecs/cs35l41-spi.c |   1 +
 sound/soc/codecs/cs35l41.c     | 233 +++++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/cs35l41.h     |   4 +
 6 files changed, 268 insertions(+), 51 deletions(-)

-- 
2.11.0

