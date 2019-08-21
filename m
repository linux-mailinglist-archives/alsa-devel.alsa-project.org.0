Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20D98534
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 22:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745781654;
	Wed, 21 Aug 2019 22:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745781654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566418143;
	bh=gHHisvVqV0RCCfmjlT2IznVqIOHkM8T8+M4u8gw5zhs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYrJLVbbo4xCMjSz1b52FWh6j5UgemaIz/oVq2sJfhjBM8fgE5za++mcM82FJbcl9
	 DFN+EqRIrrclX4gn41JVYeSZFkTGFKSRWE+dhncTC+5fSXfq886KMkqwZSyfutb29p
	 Au7zjACLSMZEcWLpK6EylJGSS45qSXENihL1jrZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F4CAF8036A;
	Wed, 21 Aug 2019 22:05:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAA94F8036B; Wed, 21 Aug 2019 22:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72AB7F80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 22:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72AB7F80157
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 13:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="196069747"
Received: from smasango-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.100])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2019 13:05:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 15:05:12 -0500
Message-Id: <20190821200521.17283-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821200521.17283-1-pierre-louis.bossart@linux.intel.com>
References: <20190821200521.17283-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 02/11] soundwire: remove DAI_ID_RANGE
	definitions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is no reason to reserve a range of DAI IDs for SoundWire. This
is not scalable and it's better to let the ASoC core allocate the
dai->id when registering a component.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c     | 2 --
 include/linux/soundwire/sdw.h | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c95222f18c75..d5563cfc6549 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -952,8 +952,6 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 			dais[i].capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
 		}
 
-		dais[i].id = SDW_DAI_ID_RANGE_START + i;
-
 		if (pcm)
 			dais[i].ops = &intel_pcm_dai_ops;
 		else
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index be9fe08d4e9c..db974003fe13 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -40,9 +40,6 @@ struct sdw_slave;
 
 #define SDW_VALID_PORT_RANGE(n)		((n) <= 14 && (n) >= 1)
 
-#define SDW_DAI_ID_RANGE_START		100
-#define SDW_DAI_ID_RANGE_END		200
-
 enum {
 	SDW_PORT_DIRN_SINK = 0,
 	SDW_PORT_DIRN_SOURCE,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
