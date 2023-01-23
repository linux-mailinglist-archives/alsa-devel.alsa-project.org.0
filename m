Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8E678233
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3E4983A;
	Mon, 23 Jan 2023 17:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3E4983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674492699;
	bh=zqSr7sLBWMaG66a5DCNVRWx7XolcA+9TxO5OXQLe0DQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EclOhOJ1F98BDnYkvAxTRfMZCzbnTbNWcACoQYfGWAvgC/Tw60uK6DQ38SYwDM9Ux
	 rgvFCjPGNLA8BAqR50AVyKA9RMqiEC5LIvVyUHc/eqso6vDuULZ6GvF52lqyqcMzMI
	 KQFuHhppZnnelMxA2yssDAP6vZ9CQdVkv2rE5Izw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3366F80542;
	Mon, 23 Jan 2023 17:50:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16D50F80542; Mon, 23 Jan 2023 17:50:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 928FAF801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 928FAF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hBFPFsym
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30N91JmA009174; Mon, 23 Jan 2023 10:49:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=EEhuc1uSnv3B2TkErgB0IZM1Fy5T36RVXG2x8hfUnXE=;
 b=hBFPFsymmu3H+/BHZj3a529128yyGXpK8EB+hgapYnvSQKMhHyJqLf5KrYRjcCeZqjU7
 em+qzvG0wW0CKavGbkXclYwnxJUEFawB9BDF0/apmiikl7VOgSu1FmR1ZJOU9mX8muQQ
 PDe+7w3pTHh0fUySXP0MWWgqwTGHEfYqPve9Q9C4RJig9U2rnVK7uTRRzgESpGcOznZJ
 4JCQ0o6UMEsmZLYrolRfmg0Id+HTUv/kGVsH+2je397tmFhgWqZNGhaJLIjy68aMaf+8
 d5X1t4vjxlJl9hh+17iOfYshunl7WFKys8HJ1fcGLv1XrJiUdejOvmnJsEHLwYSpDKQt 2w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n8dbsknrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:49:51 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 23 Jan
 2023 10:49:49 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Mon, 23 Jan 2023 10:49:49 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 460382C5;
 Mon, 23 Jan 2023 16:49:49 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH v2 0/2] soundwire: Remove redundant zeroing of page registers
Date: Mon, 23 Jan 2023 16:49:47 +0000
Message-ID: <20230123164949.245898-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: G-ubMUt4tlVURYgmRyjxWCcoLjCi4wnn
X-Proofpoint-GUID: G-ubMUt4tlVURYgmRyjxWCcoLjCi4wnn
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Writing zero to the page registers after each message transaction can add
up to a lot of overhead for codecs that need to transfer large amount of
data - for example a firmware download.

There's no spec reason I can see for this zeroing. The page registers are
only used for a paged address. The bus code uses a non-paged address for
registers in page 0. It always writes the page registers at the start of
a paged transaction.

If this zeroing was a workaround for anything, let me know and I will
re-implement the zeroing as a quirk that can be enabled only when it is
necessary.

Changes since v1:
- Reworded the commit message to patch #1:
  - say that this is for devices that support paging
  - mention bit 15 as the paging flag
  - split a long sentence into two sentences.

No code changes.

Richard Fitzgerald (2):
  soundwire: bus: Don't zero page registers after every transaction
  soundwire: bus: Remove unused reset_page_addr() callback

 drivers/soundwire/bus.c             | 23 -----------------------
 drivers/soundwire/cadence_master.c  | 14 --------------
 drivers/soundwire/cadence_master.h  |  3 ---
 drivers/soundwire/intel_auxdevice.c |  1 -
 include/linux/soundwire/sdw.h       |  3 ---
 5 files changed, 44 deletions(-)

-- 
2.30.2

