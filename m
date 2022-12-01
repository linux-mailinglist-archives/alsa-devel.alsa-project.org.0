Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7867063F20C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:51:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A360167D;
	Thu,  1 Dec 2022 14:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A360167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669902703;
	bh=jM/9Aq+0jCfh9mMtJMWa4jKQ1kN4ZBi45RfHWxP9sQ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y/6XSRE0Bjh4XLykMdYjbu896hI3xoxBgyHqHjztMGx3Lh6/sJmF9+6eiHtw/9JC8
	 bDihIYxk+w/Io4QiatAiEOy2x3Q/ASk6pU5grqAJiMnT6NuABri45YRovSuHK8pHCU
	 Ss7RtLkUU0xG/Zp3vREOpf8dZXmHU1ud21eCtF1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D269F805BF;
	Thu,  1 Dec 2022 14:48:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DF42F805BB; Thu,  1 Dec 2022 14:48:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_32,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE92DF805B5
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 14:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE92DF805B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HNvqyFZ5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B17UFFc025878; Thu, 1 Dec 2022 07:48:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=gmXNj8zROSVD1MbqgWwzVfwby4Ly7Y38b4HHl5SlK/M=;
 b=HNvqyFZ5xufUCGcBuZv+RTCI7Q7LfQBvVhxoWS9srOdqaIUsN8uwtqujfejiqIlYzDer
 Mnt1p4Sm2W2vBzmDDguh65cLYqOMkBwYZUttzobqld7zXo5MHVUaSdXemzqJDyppM04z
 qbkawUNs8UZ8Qh1clict2RR4DxHln87qUtWmNRaXmb+AH3iH3Sz3pdqTFpnQXSCrAAeL
 AY/7XaqYyI82Qv7S2XXpB9jCdoaWY4J0gSCCzyhkhgw6HIQL/VuHx03uKHgVBR0iIYEk
 bxlLDGenJ/ne20poNxo0gFszX0lzY7eQAV4GVPVuCZIV39ahbLAluc0CoL8cCrospcJg XA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k75rhqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 07:48:48 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 1 Dec
 2022 07:48:45 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 1 Dec 2022 07:48:45 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C8FFBB10;
 Thu,  1 Dec 2022 13:48:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] soundwire: cadence: Fix oversized FIFO size define
Date: Thu, 1 Dec 2022 13:48:42 +0000
Message-ID: <20221201134845.4055907-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eEq9QWAMdEGspgc6f2zCYtGcS6UNNH_c
X-Proofpoint-GUID: eEq9QWAMdEGspgc6f2zCYtGcS6UNNH_c
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

As determined by experimentation and asking a hardware person, the FIFO
in the Cadence IP is actually only 8 entries long, not 32. This is fixed
in patch #1.

As a bonus, patches #2 and #3 fix two other things I noticed while
debugging this.

Richard Fitzgerald (3):
  soundwire: cadence: Don't overflow the command FIFOs
  soundwire: cadence: Remove wasted space in response_buf
  soundwire: cadence: Drain the RX FIFO after an IO timeout

 drivers/soundwire/cadence_master.c | 45 +++++++++++++++++++-----------
 drivers/soundwire/cadence_master.h |  2 +-
 2 files changed, 29 insertions(+), 18 deletions(-)

-- 
2.30.2

