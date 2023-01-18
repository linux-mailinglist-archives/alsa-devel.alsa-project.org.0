Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC167227D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:07:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F2E676F;
	Wed, 18 Jan 2023 17:06:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F2E676F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058027;
	bh=NGJIxez0hX5y1kWh4U8jctHG3HciDy9GdtO4craFfag=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZYXEBqI6K1gIRu3eX7ZHu1L+7YdgXTZMm6RhazUYvQS4gt6HJzo4jG8UVS9lEEko2
	 XmHoP4z8rKOKV5wL4ksjBCS1W2ojDRkNJbrFeL2pv9CYmI1C77fT15SNPBamdVt5Bs
	 UfAwrCj4GwtqErm0HbjyRCF/6sv3NvY63l1nX9nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2039FF80558;
	Wed, 18 Jan 2023 17:05:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F6FF80551; Wed, 18 Jan 2023 17:05:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E43DF80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E43DF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=letUPSPx
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IEEjl9023722; Wed, 18 Jan 2023 10:05:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=TubZNWDH/zWXtSwzOFhswLR3JQxQo2D9s8O6hcO+0V4=;
 b=letUPSPxqdfsIp8ZZBevx0WFZ3Ifg5H8vlu7ipN2qVVT8pZCTqJL53mumnEg3N7Tlcc3
 YoVJT/CJcTsuvUfjJcn5EBGujKCM1ZNM8kNW1lyjbP3zIdI1tLpwtLMsX46eD16BVX3s
 UVUFRItS2ZvE5iJqUH78lNcKqh8shj6n/vL3PFW+vrLFZ/JhaRi4pzdcX3qf/qgn6//V
 TGhiXlhHs2+8ohep2SKfzm808EiI/Ch+c685r2CvMQ3v6io83IXwlJdIfAc8uOD+Ndfn
 jZbngziWhDzrAKepUEFXogCOyWP/oil3/uUnVDwKK8uW1mcPCkBimyg9BebdKMAJ0U7k cA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n3spx6vk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 10:05:00 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 18 Jan
 2023 10:04:57 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.7 via Frontend Transport; Wed, 18 Jan 2023 10:04:57 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DD5B411CA;
 Wed, 18 Jan 2023 16:04:56 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 0/8] ASoC: cs42l42: Add Soundwire support
Date: Wed, 18 Jan 2023 16:04:44 +0000
Message-ID: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Dvqzp6B2ec0kf04P6WmVhfG2McbCgK_L
X-Proofpoint-ORIG-GUID: Dvqzp6B2ec0kf04P6WmVhfG2McbCgK_L
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
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The CS42L42 has a Soundwire interface for control and audio. This
chain of patches adds support for this.

Patches #1 .. #5 split out various changes to the existing code that
are needed for adding Soundwire. These are mostly around clocking and
supporting the separate probe and enumeration stages in Soundwire.

Patches #6 .. #8 actually adds the Soundwire handling.

Changes since v1:
- fixes for various review comments from v1
- add support for wakeup from clock stop using hardware interrupts
- use port_prep callback to prepare/deprepare codec

Richard Fitzgerald (6):
  ASoC: cs42l42: Add SOFT_RESET_REBOOT register
  ASoC: cs42l42: Ensure MCLKint is a multiple of the sample rate
  ASoC: cs42l42: Separate ASP config from PLL config
  ASoC: cs42l42: Export some functions for Soundwire
  ASoC: cs42l42: Add Soundwire support
  ASoC: cs42l42: Don't set idle_bias_on

Stefan Binding (2):
  soundwire: stream: Add specific prep/deprep commands to port_prep
    callback
  ASoC: cs42l42: Wait for debounce interval after resume

 drivers/soundwire/stream.c     |   4 +-
 include/linux/soundwire/sdw.h  |   8 +-
 include/sound/cs42l42.h        |   5 +
 sound/soc/codecs/Kconfig       |   8 +
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/cs42l42-sdw.c | 603 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs42l42.c     | 127 ++++---
 sound/soc/codecs/cs42l42.h     |   9 +-
 8 files changed, 716 insertions(+), 50 deletions(-)
 create mode 100644 sound/soc/codecs/cs42l42-sdw.c

-- 
2.34.1

