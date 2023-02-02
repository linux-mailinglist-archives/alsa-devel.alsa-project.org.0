Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC76882EC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 16:44:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B96EBC;
	Thu,  2 Feb 2023 16:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B96EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675352644;
	bh=Dy1I5r8MsHQkrIjQo/4D6tmPyJ5K5IesevuANxMtkZU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Kljpr2QUa5cA7UVJB6bZoQiuaQ93gFxcyK3/IYJwK3AesgmgJFZnNdOnp3Hf7dEBs
	 9wNHahEKyyvu6TxeL9TProHz8jfPg7IzsEgxgTRfcITnc84P7Ec+Lzs1Dy9oxqhx4A
	 4ic9Q2vGcmojMQjuES8uJlB+SpkhuDAKPzJdn53k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60112F80544;
	Thu,  2 Feb 2023 16:42:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BB67F804E2; Thu,  2 Feb 2023 16:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4B1EF80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 16:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B1EF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=L26ceYX7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3128sUna006230; Thu, 2 Feb 2023 09:42:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=xMHV4CLWUb6PJcec7V3W92cUq1tvU/om/xhGtlKhqIA=;
 b=L26ceYX7gAK7obVwfsL0dtxJ/AmXLFjAQC4P94IQZvIU2Ew25J/p8ULb6WUiRRhxUyn2
 pdiJcKyZKU/J1udfHVnNBD0848Lxn9B/A3MuQwccBnXN7fV3K3lFmwu1Ctgo722WQIpB
 Pe5g4cursqi/woFf4XnGG5NeDsCfur+FWEIQ0/kwMU1s8501ICBvcDSWLYV/N7ONW959
 VGcosf7Dngq6tQrtRLL2OyjGuMUJnLwIOyMkTt0CHm2QEOtXu99DcqVv5GwhE2cm0z4r
 XKQi4Z7QGuoXIE9WuH49ZwKZxh+FVFldj5jlYxKfvN5WY3oVZEB8XCDYXzhnKWKpXchV QQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nfqvj1qk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 09:42:14 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 2 Feb
 2023 09:42:12 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Thu, 2 Feb 2023 09:42:12 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 157A32A1;
 Thu,  2 Feb 2023 15:42:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH 0/2] soundwire: bus: Prevent infinite loop in
 sdw_ch_mask_to_ch()
Date: Thu, 2 Feb 2023 15:42:10 +0000
Message-ID: <20230202154212.1098736-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: diV5BAf5ozNS9-SugnjdEbV_Sq1BrcxD
X-Proofpoint-ORIG-GUID: diV5BAf5ozNS9-SugnjdEbV_Sq1BrcxD
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

sdw_ch_mask_to_ch() would loop forever if bit 31 of the mask was set.
The entire function is unnecessary because the existing standard
function hweight32() already does the same thing, and hweight32() is
safe. But the change has been made in two steps.

Richard Fitzgerald (2):
  soundwire: bus: Prevent infinite loop in sdw_ch_mask_to_ch()
  soundwire: bandwidth allocation: Use hweight32() to calculate set bits

 drivers/soundwire/bus.h                          | 11 -----------
 drivers/soundwire/generic_bandwidth_allocation.c |  3 ++-
 2 files changed, 2 insertions(+), 12 deletions(-)

-- 
2.30.2

