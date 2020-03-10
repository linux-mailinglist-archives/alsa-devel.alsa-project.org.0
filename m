Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F421803AF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 17:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0435B167D;
	Tue, 10 Mar 2020 17:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0435B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583858325;
	bh=jfiwWO8cE6YFj4r/UOjdudca4wOIxuuFKrvLd8Uonq4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SW8cu5IPgvWqdQUTxt4NkFvQpVePrHLvXXxZH47pzGlBpBws0t5wYghRzhRgDuoFp
	 iAAcRFaNl+8teeNr3QV2q9sGNIIDQNu0h1wbhuA9aYaH3CWoBmt2kbkfHWjkDlzDjD
	 W9ig3pDmhKSRDWKiFvzxVHJwpxyFYf4op86PLHoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D96E5F8028D;
	Tue, 10 Mar 2020 17:35:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 228E0F8028B; Tue, 10 Mar 2020 17:35:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6AA8F8020C
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 17:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6AA8F8020C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 09:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; d="scan'208";a="388985491"
Received: from djdickof-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.192.103])
 by orsmga004.jf.intel.com with ESMTP; 10 Mar 2020 09:35:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: rt5682-sdw: fix 'defined but not used' pm functions
Date: Tue, 10 Mar 2020 11:35:09 -0500
Message-Id: <20200310163509.14466-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
References: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Oder Chiou <oder_chiou@realtek.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
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

Gcc reports the following warnings:

sound/soc/codecs/rt5682-sdw.c:286:12: warning: 'rt5682_dev_resume'
defined but not used [-Wunused-function]
 static int rt5682_dev_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~

sound/soc/codecs/rt5682-sdw.c:273:12: warning: 'rt5682_dev_suspend'
defined but not used [-Wunused-function]
 static int rt5682_dev_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~

Fix by adding maybe_unused as done for other SoundWire codecs

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 03f6fc6de9192f ('ASoC: rt5682: Add the soundwire support')
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index fc31d04b5203..e456bdd15207 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -270,7 +270,7 @@ static const struct sdw_device_id rt5682_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt5682_id);
 
-static int rt5682_dev_suspend(struct device *dev)
+static int __maybe_unused rt5682_dev_suspend(struct device *dev)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
 
@@ -283,7 +283,7 @@ static int rt5682_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int rt5682_dev_resume(struct device *dev)
+static int __maybe_unused rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-- 
2.20.1

