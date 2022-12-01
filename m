Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1763F250
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 15:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D35F176B;
	Thu,  1 Dec 2022 15:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D35F176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669903809;
	bh=Ye4emmO4moZ3ovMZM/NotvlSbT+YnnvVAyPlH8PS70Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kJ+fJLZr/8IJItmboEQgC4ZuzyW/yVYzMACR/OmWl7geDY6ktf+gRP0F7Z6H9mOXo
	 7dEa9nZxn0YR0bBFKcJMCP1Wap+0I0v+xdj6pHRaGiVMr8s8tJzMAou7c1XZTa07AV
	 ymol6VCoIbLWjnrQm4Y/18FQKSiSk0/ZhAOPFO2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0608FF80118;
	Thu,  1 Dec 2022 15:08:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C23D2F80563; Thu,  1 Dec 2022 15:08:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78F94F80166
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 15:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F94F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PIMUZJ1P"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B15l1wq016609; Thu, 1 Dec 2022 08:08:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=OAeXJUG9JxNW9ViIVVYNmzT5WW5f5Y+/yMr6G1/gMN0=;
 b=PIMUZJ1PsXKYvd14axMh2bifD7D0i1fy9v8+5E95NI7pFBtk87lMs6QAgNbESYOpGQSQ
 G5AY7SNg0jpawSmncV3pDva/2imXOHH0YZ8zsyleujZzNiRtlVZdmcc0wzQNMBPUygS+
 Juut3u2uybJy8AFu2nwybHHadJJ1WZoKa7H0g96vgtfOKDqkVwtTAXUYKxh4lUYDAAR6
 IvTu0bbyfzgugVUmkK/7bj5w8LtoEoYgyD+TVW7ZHxI3F/fNb2R657n6OMldHYKABj9L
 ezdIP1BKTGZvPQzLTg/6fTHRihMVUJyUJu895ziKLOiQFAiDWgbm1xI8t2a0EY3HXYgG pA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k75rjwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 08:08:15 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 1 Dec
 2022 08:08:13 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 1 Dec 2022 08:08:13 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2482DB10;
 Thu,  1 Dec 2022 14:08:13 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/2] soundwire: Remove redundant zeroing of page registers
Date: Thu, 1 Dec 2022 14:08:11 +0000
Message-ID: <20221201140813.4062146-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: v_PsVJysNjyRP6paHQlVdnfdSQ0y3tEG
X-Proofpoint-GUID: v_PsVJysNjyRP6paHQlVdnfdSQ0y3tEG
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

