Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0281662DDC4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 15:18:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB1416C7;
	Thu, 17 Nov 2022 15:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB1416C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668694712;
	bh=DivBrh1knm07fQhGcg7hgDZo++XNwmFETbJAcY+qXSo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GdFvKH1hv0YD5OGyZL/D63Yegane7QM/85HvAA3JCeFjaMun/v6mSAU/l4LPl+Spl
	 IVm+YH63nvEmtASHZwjEr2NNew9Q3DevcnaPYXaKIaKAlYv6oSXsCHsThPH/CfrEnZ
	 NYtll0zk3rYldN0rmt3IyoNoXYjktzWpoan5AoM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0325EF800B5;
	Thu, 17 Nov 2022 15:17:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F36BF8051D; Thu, 17 Nov 2022 15:17:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 184CDF800B5
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 15:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 184CDF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OLvFHa3m"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AHEHLJX006137; Thu, 17 Nov 2022 08:17:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=9yEHp/egchWRfHPnT1xfyvIZ2mplZmfmfcqa1wi4iyI=;
 b=OLvFHa3mhy1anDktf9WTk24BAR4+pwMUMpySk914z0E4QI9xTislS7qibaipa7fOx/ZS
 ovPCwnGSmAMK1/N4DR2RKVRR4RIBLnJQh0Tjp4f2VmRPkPWRDA/sV8t0zQWxWNfFBDAU
 LNg+/vkH0KDlJDXDJrFsdXVSavhFWNzvA91mTvCS/x02c2myIrmsnGpgLocsICtizs3+
 IjeIVrVFXaG+AzSIqb/0uzmDvpKf5mbx6Ct7Bn8yZGJ/wSxr3xKWc+QYsLcE0qnXmDiq
 ilOwDxgc0QmxafVGX21ABvIbkL7fhZ1hl7mIgppSXzFjPVg8tlvpjO27cUdvH7n0GjpI WA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kv73yk9j9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 08:17:30 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 17 Nov
 2022 08:17:27 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 17 Nov 2022 08:17:27 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA1D3478;
 Thu, 17 Nov 2022 14:17:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v2 0/4] Minor SoundWire clean ups
Date: Thu, 17 Nov 2022 14:17:23 +0000
Message-ID: <20221117141727.3031503-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dOSossOFU5T-aHQuMsYooKw9VR_n5awR
X-Proofpoint-GUID: dOSossOFU5T-aHQuMsYooKw9VR_n5awR
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

Just some minor tidy ups and preparation for starting to upstream some
Cirrus SoundWire devices. The first three patches are pretty trivial,
the last patch which moves the remaining core over to using the no_pm
functions could probably use some careful review.

Changes since v1:
 - Update commit message on the debugfs to more explicitly mention the
   PM runtime reference, rather than implying the PM would turn on/off
   each time.
 - Added some reviewed by's

Thanks,
Charles

Charles Keepax (3):
  soundwire: Provide build stubs for common functions
  soundwire: debugfs: Switch to sdw_read_no_pm
  soundwire: stream: Move remaining register accesses over to no_pm

Simon Trimmer (1):
  soundwire: bus: export sdw_nwrite_no_pm and sdw_nread_no_pm functions

 drivers/soundwire/bus.c       | 10 ++--
 drivers/soundwire/debugfs.c   | 11 +++-
 drivers/soundwire/stream.c    | 30 +++++------
 include/linux/soundwire/sdw.h | 94 +++++++++++++++++++++++++++++++----
 4 files changed, 114 insertions(+), 31 deletions(-)

-- 
2.30.2

