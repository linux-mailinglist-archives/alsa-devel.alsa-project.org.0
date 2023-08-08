Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B8773F75
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 18:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860CF827;
	Tue,  8 Aug 2023 18:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860CF827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691513292;
	bh=rbWjrtxDzkVskWl6tenQwonf/WwTSR6se6XMs6EjGK8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mF794rJe4W22Q0vQZmpvJBU4hDDfY/l7FntZ1P+1M7q8mpp7PZIj2xSAknH3QaMYb
	 kUzDRoY4yq9ziCzoxdLS73I+M0uUIOJeRtL8K2hsXFRzMm9AW7pxDhup2yV/vGlwn2
	 rUph5cxnUmnVfVZdq181XqxuiQiGjkznKD07bl+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0696BF80549; Tue,  8 Aug 2023 18:47:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 330ECF80154;
	Tue,  8 Aug 2023 18:47:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C18F80549; Tue,  8 Aug 2023 18:47:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80FF3F80154
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 18:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80FF3F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RP+OZ7bC
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378F5h5d030864;
	Tue, 8 Aug 2023 11:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=0
	0xMZj8YEMZyIQgL/8c62+rl+WEaMsRlVV3Zm+qzXig=; b=RP+OZ7bC5HlblkKe7
	wSKnvWn+gVxn3/PIrGwj+ylSXo360j7dk0V9tPTLD5NCjghwySKH0zllN4kHffhn
	z8qnfd/UsdujbmysnfJ8m8oAqcjJivYsxVA3Xue93WQE6tSb/Z5vc6RAvIku0N9m
	KLi3HZBqunSfGsd8NOV9ub4uSZSHrHZ3cPEz+JxXXs3pyIePZG7lE3bGraE7IdKn
	ooKODhlYFZsjYt4lgjiXJYjHYnpY6EIuLezH1zcjiWMpEGeXe2iAGjILs3vi70Xc
	xvI7BFACmbJxfz2YfhxCgqmBW2alX4HRPg2YfxEmny/Gxx55ExNUUdkwlOr9BH4k
	6G+0A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s9juhtucq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 11:47:06 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 17:47:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 17:47:04 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.220])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5519D3563;
	Tue,  8 Aug 2023 16:47:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 0/5] ASoC: cs35l56: Bugfixes
Date: Tue, 8 Aug 2023 17:46:57 +0100
Message-ID: <20230808164702.21272-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZN6SGbbi5zjDOJx6-lRfFQNe1AU16ndT
X-Proofpoint-ORIG-GUID: ZN6SGbbi5zjDOJx6-lRfFQNe1AU16ndT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PVX6J2GNB6PVBO2VGLP6MNYLAWFRCFQN
X-Message-ID-Hash: PVX6J2GNB6PVBO2VGLP6MNYLAWFRCFQN
X-MailFrom: prvs=3584a5a98c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVX6J2GNB6PVBO2VGLP6MNYLAWFRCFQN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Miscellaneous bugfixes for the cs35l56 codec driver.

Richard Fitzgerald (3):
  ASoC: cs35l56: Avoid uninitialized variable in
    cs35l56_set_asp_slot_positions()
  ASoC: cs35l56: Don't rely on GPIOD_OUT_LOW to set RESET initially low
  ASoC: cs35l56: Wait for control port ready during system-resume

Simon Trimmer (2):
  ASoC: wm_adsp: Expose the DSP power down actions as
    wm_adsp_power_down()
  ASoC: cs35l56: Call wm_adsp_power_down() before reloading firmware

 sound/soc/codecs/cs35l56.c | 33 +++++++++++++++++----------------
 sound/soc/codecs/wm_adsp.c |  8 +++++++-
 sound/soc/codecs/wm_adsp.h |  1 +
 3 files changed, 25 insertions(+), 17 deletions(-)

-- 
2.30.2

