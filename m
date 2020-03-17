Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F671188A84
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 17:38:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8BE117EB;
	Tue, 17 Mar 2020 17:37:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8BE117EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584463129;
	bh=Yj9komwek2gVBp2Ua2QwDYmTc0xHBiarNLIJPiFt42A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bYwfDl0bmVyXXiyDYHhDe57kh9dLP6ZkMO2fdROw3ne9/fuMDWf23+KHv2VJ7i4Pp
	 1j6bhPcF9P4bIbGjsYgX9TbOFGBWETkWdNA4qCv8kohoUzpwfYt7J3VHMI63MbYVwI
	 SczaMIrso2toDeSVcptRcRGaMm7/sRMp7IVPotME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA0BF8028F;
	Tue, 17 Mar 2020 17:36:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF34FF8023E; Tue, 17 Mar 2020 17:34:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F70CF80217
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 17:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F70CF80217
IronPort-SDR: KpG0QfIhqsIybk4BcMd+npJTADLI86/jiNnC/aU0TuxtYGyWp5c5PuIw33P4GkNV+SAluvo/He
 atdyO3ab5u5Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 09:34:11 -0700
IronPort-SDR: HfGZo9IC1x0XMh5tBiB9ez3SqHRVhsCAphril7G9KQzu9A/dyvY96WPaL4gpeUrMPFNO2Ns/4d
 wnHf3NAkWHhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; d="scan'208";a="244533120"
Received: from aavila-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.36.39])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 09:34:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/17] soundwire: cadence: simplifiy cdns_init()
Date: Tue, 17 Mar 2020 11:33:14 -0500
Message-Id: <20200317163329.25501-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
References: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

There is no need for the clock_stop_exit argument with the latest
implementation

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 12 +-----------
 drivers/soundwire/cadence_master.h |  2 +-
 drivers/soundwire/intel.c          |  2 +-
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index a1a889d1d7dc..941809ea00a8 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1018,22 +1018,12 @@ static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
  * sdw_cdns_init() - Cadence initialization
  * @cdns: Cadence instance
  */
-int sdw_cdns_init(struct sdw_cdns *cdns, bool clock_stop_exit)
+int sdw_cdns_init(struct sdw_cdns *cdns)
 {
 	struct sdw_bus *bus = &cdns->bus;
 	struct sdw_master_prop *prop = &bus->prop;
 	u32 val;
 	int divider;
-	int ret;
-
-	if (clock_stop_exit) {
-		ret = cdns_clear_bit(cdns, CDNS_MCP_CONTROL,
-				     CDNS_MCP_CONTROL_CLK_STOP_CLR);
-		if (ret < 0) {
-			dev_err(cdns->dev, "Couldn't exit from clock stop\n");
-			return ret;
-		}
-	}
 
 	/* Set clock divider */
 	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 2de1b2493ffc..44e802bba702 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -138,7 +138,7 @@ extern struct sdw_master_ops sdw_cdns_master_ops;
 irqreturn_t sdw_cdns_irq(int irq, void *dev_id);
 irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
 
-int sdw_cdns_init(struct sdw_cdns *cdns, bool clock_stop_exit);
+int sdw_cdns_init(struct sdw_cdns *cdns);
 int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 		      struct sdw_cdns_stream_config config);
 int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index a327669c757b..3c83e76c6bf9 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1077,7 +1077,7 @@ static int intel_init(struct sdw_intel *sdw)
 	intel_link_power_up(sdw);
 	intel_shim_init(sdw);
 
-	return sdw_cdns_init(&sdw->cdns, false);
+	return sdw_cdns_init(&sdw->cdns);
 }
 
 /*
-- 
2.20.1

