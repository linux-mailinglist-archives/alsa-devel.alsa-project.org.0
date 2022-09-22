Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7715E5F35
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 12:01:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB347201;
	Thu, 22 Sep 2022 12:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB347201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663840901;
	bh=jc9vTvocTrqMZ7/9JSBkxOHqISkl2gUH8z46p1oMd48=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K7yQYqGcCoZ5r84jaNw3h0OErY4/ii9Pnh+yurM3zJGEAFzGTbWVj2NFeomKWltE4
	 T6ztkA6cVXmYjAnqDYXuR6F/oSRC0jfAJY4om3ETvQf9cyunU9VQrgrVNPRGFS99O5
	 ZTjLQEz6dpNX4KHfOHGHH6a6h9jPTE07XVOvgo1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6C5F80107;
	Thu, 22 Sep 2022 12:00:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9701EF80538; Thu, 22 Sep 2022 12:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A3C3F8020D
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 12:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A3C3F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MFaGIjAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663840844; x=1695376844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jc9vTvocTrqMZ7/9JSBkxOHqISkl2gUH8z46p1oMd48=;
 b=MFaGIjAtd6vX96xMEIAFsrbrz1Ezizv2SQMu0D8D3/4QCdaX80h2iKuz
 4P0K6uBQhvLIO/A5pkMm1P03StGpEvKt97HfPOIOFnl2f4OHTwn9m1ibO
 mSUFZ9A9hUwMZ6/VX27YjQ/14R0v0rNzBONovwgLobw1hVd1Zq7ulolE1
 l2OYyBR5Dyi2/bSVt06LqXqqX/kDQD6ihi0jFKeuF0wQOv8qFEkf5WyPL
 9ttmbB8NXEo/ZOOKyF6Tx3bvhmG+5pkFeu7a+qQXMm0U4vnxUb9dqi1E5
 pKw4Du5pLI8L/nrt3vtMDb8qFJHi1ZHZoNqbm/3aNTqp8NIqQCVYNx0Vl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300240825"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="300240825"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:00:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="745323846"
Received: from icostanz-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.251.210.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 03:00:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: intel-dsp-config: add missing RaptorLake PCI IDs
Date: Thu, 22 Sep 2022 12:00:14 +0200
Message-Id: <20220922100014.27080-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

These two missed IDs need to be added for dynamic selection of drivers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 1997ffc16663a..b9eb3208f2888 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -455,6 +455,16 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x51cb,
 	},
+	/* RaptorLake-M */
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51ce,
+	},
+	/* RaptorLake-PX */
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = 0x51cf,
+	},
 #endif
 
 };
-- 
2.34.1

