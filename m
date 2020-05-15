Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB21D5B5B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 23:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7941671;
	Fri, 15 May 2020 23:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7941671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589577556;
	bh=Sos/JW/LvIAXJ5kLbN+8sdMq/9iDcR+trkVJ4BiwfEY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZXosxbcXDcRHkQS4BclvDxgMsEid87tMEoqeMOO46TVdOXX+oeXJ2gCd1gRAtrv+
	 ebRTcXtwZOdpH2loDAKitGDehpk30hrFqSk72p3XedWd3O/qHLFceUPL1jkjwtbRKO
	 9HWjNa9SkemeGBYZVJxubRVT5hDaax+tRD0wCV3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93119F80299;
	Fri, 15 May 2020 23:16:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C37EF8027D; Fri, 15 May 2020 23:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF051F80255
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 23:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF051F80255
IronPort-SDR: 7zOoI8asPtOW1bHWarHfWR8LVcXDcSerVT/bk3z3W2Dabq+msONUGgePpyQeUfViSdnIaiKFaC
 A4bgFawApwTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 14:15:50 -0700
IronPort-SDR: KXCsgGR7HdDHAMPlDIm+PFrXk7jbiPyt7gBWASzbg+DpKM4nxrHvUaROdx6EUAgNK3VnD7t7s5
 fzN7aQvM3ODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="438454507"
Received: from btchambe-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.66.225])
 by orsmga005.jf.intel.com with ESMTP; 15 May 2020 14:15:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: codecs: rt1308-sdw: remove duplicate allocation
Date: Fri, 15 May 2020 16:15:31 -0500
Message-Id: <20200515211531.11416-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515211531.11416-1-pierre-louis.bossart@linux.intel.com>
References: <20200515211531.11416-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Shuming Fan <shumingf@realtek.com>
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

The .read_prop callback is supposed to be called by the SoundWire core
only. Calling it again from this driver results in an additional
memory allocation for no good reason.

Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Shuming Fan <shumingf@realtek.com>
Cc: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 91cc5a15c211..b0ba0d2acbdd 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -178,10 +178,6 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt1308->hw_init)
 		return 0;
 
-	ret = rt1308_read_prop(slave);
-	if (ret < 0)
-		goto _io_init_err_;
-
 	if (rt1308->first_hw_init) {
 		regcache_cache_only(rt1308->regmap, false);
 		regcache_cache_bypass(rt1308->regmap, true);
@@ -282,7 +278,6 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 
-_io_init_err_:
 	return ret;
 }
 
-- 
2.20.1

