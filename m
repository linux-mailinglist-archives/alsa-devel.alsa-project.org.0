Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64030FDFC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D0D01674;
	Thu,  4 Feb 2021 21:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D0D01674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612470029;
	bh=e6rmhtf6kfJQWlkTOhYs4JMqZL7PoJvKdDqxZ4G6Too=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/eAGLYhFD2DFpDD2OU2O818jK+PjiOV0EodoPViuOKLVgyHGl+HLGLroSjg6GOdM
	 6BnvQ73kUjSaubM3OJGK0oYu31TKBjhVaXxXePL8qijrqzmGVboB4cX9T7t/MEpqT/
	 4KVpbIy1Rc8hF36tSIrkNpU4QxSFDJfTW0W9fPp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 521FAF80264;
	Thu,  4 Feb 2021 21:18:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F69EF8025B; Thu,  4 Feb 2021 21:18:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB169F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB169F80139
IronPort-SDR: klQ/+9353/n8vPGJtry2H9QhWH2ah+LmZhb0HogIteZrKQc63GIrkacQI/cPY0HHNUdI5E+bva
 LOvN3S++KtfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="177817714"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="177817714"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:57 -0800
IronPort-SDR: mqNV+CLKkRu4egG4DptV19XzOWDiGcKibKrFYAHgb3+JQuRjsAfEeaA2SNlP7VeYwpn0FHxE0H
 Ry+ZCVCOeuVg==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="373011148"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:56 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 3/4] ASoC: rt5682-sdw: cancel_work_sync() in .remove and
 .suspend
Date: Thu,  4 Feb 2021 14:17:38 -0600
Message-Id: <20210204201739.25206-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204201739.25206-1-pierre-louis.bossart@linux.intel.com>
References: <20210204201739.25206-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Follow pattern from other drivers and use cancel_work_sync() for both
.remove() and .suspend().

Fixes: 03f6fc6de919 ('ASoC: rt5682: Add the soundwire support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 69f046bba67a..b49f1e16125d 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -710,7 +710,7 @@ static int rt5682_sdw_remove(struct sdw_slave *slave)
 	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
 
 	if (rt5682 && rt5682->hw_init)
-		cancel_delayed_work(&rt5682->jack_detect_work);
+		cancel_delayed_work_sync(&rt5682->jack_detect_work);
 
 	return 0;
 }
@@ -728,6 +728,8 @@ static int __maybe_unused rt5682_dev_suspend(struct device *dev)
 	if (!rt5682->hw_init)
 		return 0;
 
+	cancel_delayed_work_sync(&rt5682->jack_detect_work);
+
 	regcache_cache_only(rt5682->regmap, true);
 	regcache_mark_dirty(rt5682->regmap);
 
-- 
2.25.1

