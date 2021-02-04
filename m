Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F9230FDF9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAEF8166F;
	Thu,  4 Feb 2021 21:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAEF8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612469989;
	bh=rcZDC9h2cWdLce3U1RMxbCMz8i2tYOL1tpWxJpVMPmU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TVO4DDG0x2IrqKp1ycITH4rsj60XqIzUA4+BbHsLoOqIC1O+gt8Rn25M6kNrNBCp1
	 g9eWp6Il/8zV3Se0uT+UAFakdfdEFbAszmHmZAdIZG5opyXfU23y/I/RmxkeVZLMHk
	 +ui8M3zdr0AR8+CSXqPDQ2LyqIp5S/LMVBIlMhsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87FDCF80254;
	Thu,  4 Feb 2021 21:18:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 547B6F8025B; Thu,  4 Feb 2021 21:18:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBD13F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBD13F80152
IronPort-SDR: 6G66KOu9hZstWo+ecTSIoddGD39IZwxTswHecWrfuker48hsVgqJR4RqAb/FyBlfuHflMQ8WbC
 VauUrk6D+y9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="177817701"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="177817701"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:54 -0800
IronPort-SDR: 33WhEIIwgkeEnHKwwztnYV4GFNL5k4cL4ZAKsiIp7WBcrzn3m9FoLFMFvmi4W6fy1bEFccMBZ5
 06mnpUrEkX8A==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="373011121"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/4] ASoC: rt700-sdw: use cancel_work_sync() in .remove as
 well as .suspend
Date: Thu,  4 Feb 2021 14:17:36 -0600
Message-Id: <20210204201739.25206-2-pierre-louis.bossart@linux.intel.com>
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

Make sure the workqueues are not running after the .remove() callback,
which can lead to timeout errors.

A previous fix to use cancel_work_sync was applied for the suspend
case but the remove case is missing

Fixes: 5f2df2a4583b ('ASoC: rt700: wait for the delayed work to finish when the system suspends')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/codecs/rt700-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index ce9255b881d4..4001612dfd73 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -462,8 +462,8 @@ static int rt700_sdw_remove(struct sdw_slave *slave)
 	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
 
 	if (rt700 && rt700->hw_init) {
-		cancel_delayed_work(&rt700->jack_detect_work);
-		cancel_delayed_work(&rt700->jack_btn_check_work);
+		cancel_delayed_work_sync(&rt700->jack_detect_work);
+		cancel_delayed_work_sync(&rt700->jack_btn_check_work);
 	}
 
 	return 0;
-- 
2.25.1

