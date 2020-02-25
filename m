Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4616EC08
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 18:03:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD641694;
	Tue, 25 Feb 2020 18:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD641694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582650229;
	bh=d0H4a88uBP+uNePCtnR90QVlW7u2ykcgv38xBNeaZ3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvZJABaNJdfRn81pNC3feZTAiq4NKYCcT9E3wBd7cQbMrd/xIPR0BY9lDaSHK2J1p
	 eK0ks64qlSw6CWymFo9rVYmEqNWJ6LbUepvBQpLjveYhdBLzmNVVqTzH/Bjk0l8kou
	 BVgvbt/fynNOZBVQjMo/UsfokKYWL0AAt1NzFAUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2503F8027D;
	Tue, 25 Feb 2020 18:01:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19F1EF80277; Tue, 25 Feb 2020 18:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66222F8013E
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 18:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66222F8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 09:00:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="317139651"
Received: from sorin-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.45.43])
 by orsmga001.jf.intel.com with ESMTP; 25 Feb 2020 09:00:56 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] soundwire: cadence: remove useless prototypes
Date: Tue, 25 Feb 2020 11:00:39 -0600
Message-Id: <20200225170041.23644-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225170041.23644-1-pierre-louis.bossart@linux.intel.com>
References: <20200225170041.23644-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

These prototypes are no longer used, remove.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 001457cbe5ad..2de1b2493ffc 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -148,20 +148,12 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state);
 void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
 #endif
 
-int sdw_cdns_get_stream(struct sdw_cdns *cdns,
-			struct sdw_cdns_streams *stream,
-			u32 ch, u32 dir);
 struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw_cdns *cdns,
 					struct sdw_cdns_streams *stream,
 					u32 ch, u32 dir, int dai_id);
 void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 			    u32 ch, u32 dir, struct sdw_cdns_pdi *pdi);
 
-int sdw_cdns_pcm_set_stream(struct snd_soc_dai *dai,
-			    void *stream, int direction);
-int sdw_cdns_pdm_set_stream(struct snd_soc_dai *dai,
-			    void *stream, int direction);
-
 enum sdw_command_response
 cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num);
 
-- 
2.20.1

