Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C12639E99B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:29:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF08A167D;
	Tue,  8 Jun 2021 00:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF08A167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104950;
	bh=4zpVMDLKl3dwc4LNkoXulrUL82/g8FhtJ8w0V61ZCpg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNv9MXieJOOCYI1qyUdKQRf/FPEX8XcMG+XaO4iFHHjgQf7rSt3/PqRkqiIRuBaC/
	 IBH9utuwTilmFDgibeW94iOgGPCcZpkMcqdxoBfhwNQwCFXs02szf4bUc90ND9+Cm0
	 GL2nhdoQV5OP0ryvChJGXGBbQ/L3/7xjqfZN82TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 780E5F80520;
	Tue,  8 Jun 2021 00:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992BBF80508; Tue,  8 Jun 2021 00:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45B84F804DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B84F804DF
IronPort-SDR: 3ZtEM2X8JQCSj8D8c0VygJwrmIMdlgorgG+G4922BoFyuBTMgxLzODa5/a4F6wuX7RYoiJC83g
 RsB/9S+HC89g==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268581956"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="268581956"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:14 -0700
IronPort-SDR: Vzj01OQohu4cWJaYEi5vEDbhACQ6381H8oj11jJAaKIxUVpJrlfgvMNy3NouKBA5FmQO5W66Am
 0nWxqeGdNXJg==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449271017"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/15] ASoC: rt5682-sdw: set regcache_cache_only false before
 reading RT5682_DEVICE_ID
Date: Mon,  7 Jun 2021 17:22:37 -0500
Message-Id: <20210607222239.582139-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

RT5682_DEVICE_ID is a volatile register, we can not read it in cache
only mode.

Fixes: 03f6fc6de919 ("ASoC: rt5682: Add the soundwire support")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 529a85fd0a00..54873730bec5 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -400,6 +400,11 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	if (rt5682->first_hw_init) {
+		regcache_cache_only(rt5682->regmap, false);
+		regcache_cache_bypass(rt5682->regmap, true);
+	}
+
 	while (loop > 0) {
 		regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
 		if (val == DEVICE_ID)
@@ -415,11 +420,6 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 		goto err_nodev;
 	}
 
-	if (rt5682->first_hw_init) {
-		regcache_cache_only(rt5682->regmap, false);
-		regcache_cache_bypass(rt5682->regmap, true);
-	}
-
 	rt5682_calibrate(rt5682);
 
 	if (rt5682->first_hw_init) {
-- 
2.25.1

