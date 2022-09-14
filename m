Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AF55B87E5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 14:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99C9118B4;
	Wed, 14 Sep 2022 14:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99C9118B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663157511;
	bh=FucALLIKB8Ltzr47LIwM1epJP9LuvxX4RXJebUqtsvs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OTkqkKXYm+5giWhODxj48nnvVZORI38fqVNM0qxvWr/1yNe8jwOycm+xsnJDYTFlT
	 R3Rnvglcv4DJw74TZyO9RCv3EG0PbUDn7i/GXur/05mhQoL7RVOMtRzAge5yDhKu86
	 UZ4gpBA5zKR5hNIvJoaOinIUPBOYxEaS6GLG89mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEC6F8008E;
	Wed, 14 Sep 2022 14:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37282F801D8; Wed, 14 Sep 2022 14:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30716F801D8
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 14:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30716F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="l+Z6LGJp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EBk1kU005558;
 Wed, 14 Sep 2022 07:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=EOARaYc2S+ew884K44tVuUsKMHmr9kDDFDJICHbqRuw=;
 b=l+Z6LGJpyrg6aGFoytXcWMNHV4l4ajfAbdv/CL93dNCO6ob5A9oQVZq+vAIOgzItD+oS
 59geBN7k4dnoT9/EFdZct9vl4eHAWLWESvu1Zrp4tgcBKRxiqbDpsqCRbbWTYel+y1rN
 rowk806DNZX1htXImHzhub6RTRLZiL1UNw61TbwFMKyZCf2oG6JLx0HLlUhRUvrVh4FN
 UpiBfN9x1OWZNKC5jei3kcKmrdAipmIOekZJ+3+0mpvmvjK3AocoEDdJFOeiLXLLrnQ+
 N2Er75hWTuaeUtmaaZLAeswph1GALO3Vb+hcHnm1h6o0QVT+i9dB/huK9KVJazwWRuxR QQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jjy05gy54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 07:09:58 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 14 Sep
 2022 07:09:56 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Wed, 14 Sep 2022 07:09:56 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 76B6B468;
 Wed, 14 Sep 2022 12:09:49 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH v3 0/5] soundwire: Fixes for spurious and missing UNATTACH
Date: Wed, 14 Sep 2022 13:09:44 +0100
Message-ID: <20220914120949.747951-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iKkd_DNj7wn3UYxCoMjXCKVBSqaTZNhp
X-Proofpoint-ORIG-GUID: iKkd_DNj7wn3UYxCoMjXCKVBSqaTZNhp
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

Tested with 4 peripherals on 1 bus, and 8 peripherals on 2 buses.

CHANGES SINCE V2:
#4 Add a comment explaining why INTMASK isn't cleared when going around
   the update_status loop.

#5 Leave the existing error handling in sdw_program_device_num(),
   instead of suppressing the error return.
   Add a comment in sdw_handle_slave_status() explaining why the error
   is ignored.
   Re-word the explanation of why sdw_handle_slave_status() must only return
   early if it programmed a device ID.

Richard Fitzgerald (4):
  soundwire: bus: Don't lose unattach notifications
  soundwire: bus: Don't re-enumerate before status is UNATTACHED
  soundwire: cadence: Fix lost ATTACHED interrupts when enumerating
  soundwire: bus: Don't exit early if no device IDs were programmed

Simon Trimmer (1):
  soundwire: cadence: fix updating slave status when a bus has multiple
    peripherals

 drivers/soundwire/bus.c            | 44 +++++++++++++---
 drivers/soundwire/cadence_master.c | 80 ++++++++++++++++--------------
 2 files changed, 80 insertions(+), 44 deletions(-)

-- 
2.30.2

