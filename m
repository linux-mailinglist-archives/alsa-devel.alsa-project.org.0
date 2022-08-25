Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF115A1053
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5A7826;
	Thu, 25 Aug 2022 14:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5A7826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661430232;
	bh=cHaIIvYilp5uYUZxVHDLR05X6+wPkpv35CWfSpxOlTk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n8sXYOXrx+QOWmv/KNTohPeOthgeaFn/S6kUgFixQ7n5e8lly4EDnBVGm9dwBtpY6
	 JcJ4spVz28ZBkvVeJrk/UoXdk3eTjJsOGkKj5oW8E1MRlZokynJh1xAfXhwiVkk95e
	 ovMEzvYrVktktrNPuDwYxZ4iKAvbAalN9hZ/AkpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD418F80245;
	Thu, 25 Aug 2022 14:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8FB4F80245; Thu, 25 Aug 2022 14:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE5B6F800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 14:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE5B6F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="n2qwHtVQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P5j0L6027893;
 Thu, 25 Aug 2022 07:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=CCuFAyZiovrExMERfDLIiYXf9KCPSBvRWYj4Qh4iCWI=;
 b=n2qwHtVQQmRZXhmfDj4HXAjBTuuVxpJP0nqLsEOiUnfSzD7/YuEvEq0iaWrhqex85Nbn
 KU3pCbJMNsN4u59jwtIGrfeNXO+CHWwqC0e0WZwxPOSrLQADz7uzu5KajDpLamZ8A58+
 1KViPkML6o1IyY934aUvy9UnZ/drTa7An7b1gA8cw2GUKpmyqLVV0Zu64lulr5RkwDEJ
 j0lrPU0ToDUGfAgETarp1hSE7PV7dvxZGiFapjcB1ZDwhhT8/wG9vlre4SLU8Rm+x0OE
 kh8kX4WRji6mrdmhcB2VdvpNMSF4E73U97RMFFkIINnObgfX1VwlXB2i7QOD95iAreSp NA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3j4dgmbu3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 07:22:43 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 25 Aug
 2022 07:22:41 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 25 Aug 2022 07:22:41 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 87C0A45D;
 Thu, 25 Aug 2022 12:22:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH 0/3] soundwire: Fixes for spurious and missing UNATTACH
Date: Thu, 25 Aug 2022 13:22:38 +0100
Message-ID: <20220825122241.273090-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PZHXXUkqqiQPa5ZAvhvNqKoIVYP3RT6F
X-Proofpoint-GUID: PZHXXUkqqiQPa5ZAvhvNqKoIVYP3RT6F
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The bus and cadence code has several bugs that cause UNATTACH notifications
to either be sent spuriously or to be missed.

These can be seen occasionally with a single peripheral on the bus, but are
much more frequent with multiple peripherals, where several peripherals
could change state and report in consecutive PINGs.

The root of all of these bugs seems to be a code design flaw that assumed
every PING status change would be handled separately. However, PINGs are
handled by a workqueue function and there is no guarantee when that function
will be scheduled to run or how much CPU time it will receive. PINGs will
continue while the work function is handling a snapshot of a previous PING
so the code must take account that (a) status could change during the
work function and (b) there can be a backlog of changes before the IRQ work
function runs again.

Richard Fitzgerald (2):
  soundwire: bus: Don't lose unattach notifications
  soundwire: bus: Fix lost UNATTACH when re-enumerating

Simon Trimmer (1):
  soundwire: cadence: fix updating slave status when a bus has multiple
    peripherals

 drivers/soundwire/bus.c            | 44 +++++++++++++++------
 drivers/soundwire/cadence_master.c | 63 +++++++++++++-----------------
 2 files changed, 59 insertions(+), 48 deletions(-)

-- 
2.30.2

