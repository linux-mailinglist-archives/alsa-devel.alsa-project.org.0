Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F521CA76B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 11:45:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30C23186D;
	Fri,  8 May 2020 11:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30C23186D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588931101;
	bh=gmQzogdZd8scWd5ZrKYSQ27dgV1JWn275EeLUDdB0pQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVfZQ2OJnSQ97+AlfJdASYOhBC7+M6o1B2WQdv34h6MfZwM5N0V59fBP/kyRHqwqE
	 UmzvMnVRusBGNZ4HQF/okB+SD5QffMhXaJxbN6rurabGOL6sgp86A1lr496VDbbBep
	 pzLjfxemgk4XD6y+B4tirzDZJDr+J8IClnw76eRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D43F802A7;
	Fri,  8 May 2020 11:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04672F8025F; Fri,  8 May 2020 11:42:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4356F8023E;
 Fri,  8 May 2020 11:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4356F8023E
IronPort-SDR: 4FRzu/c4X9Eu+O6R4wt49j04QKQ4rDtKLjdOpWYr5mpuVkmU2v4C+7oGMNWugtc4thF+TXkiep
 sh/AJ2ELrvdQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 02:42:16 -0700
IronPort-SDR: Hu5VMuhblxlC0wVNQ4b50Iwr5ZfAUENs8992xhbcfP892QLd2PYeiCPoTuStkogKeZRfJ7yaWr
 kjhnuNZ8Lalw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; d="scan'208";a="435619142"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.34.170])
 by orsmga005.jf.intel.com with ESMTP; 08 May 2020 02:42:15 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] soundwire: intel: (cosmetic) remove multiple
 superfluous "else" statements
Date: Fri,  8 May 2020 02:30:46 +0200
Message-Id: <20200508003046.23162-3-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508003046.23162-1-guennadi.liakhovetski@linux.intel.com>
References: <20200508003046.23162-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

No need for an "else" after a "return" statement. Remove multiple such
occurrences in Intel-specific code.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 8 ++++++--
 drivers/soundwire/intel_init.c     | 4 +++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index ecd357d1..9ea8753 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -407,7 +407,9 @@ void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
 	if (nack) {
 		dev_err_ratelimited(cdns->dev, "Msg NACKed for Slave %d\n", msg->dev_num);
 		return SDW_CMD_FAIL;
-	} else if (no_ack) {
+	}
+
+	if (no_ack) {
 		dev_dbg_ratelimited(cdns->dev, "Msg ignored for Slave %d\n", msg->dev_num);
 		return SDW_CMD_IGNORED;
 	}
@@ -520,7 +522,9 @@ void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
 		dev_err_ratelimited(cdns->dev,
 				    "SCP_addrpage NACKed for Slave %d\n", msg->dev_num);
 		return SDW_CMD_FAIL;
-	} else if (no_ack) {
+	}
+
+	if (no_ack) {
 		dev_dbg_ratelimited(cdns->dev,
 				    "SCP_addrpage ignored for Slave %d\n", msg->dev_num);
 		return SDW_CMD_IGNORED;
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 4b76940..d5d4279 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -86,7 +86,9 @@ static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
 		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
 			count, SDW_MAX_LINKS);
 		return NULL;
-	} else if (!count) {
+	}
+
+	if (!count) {
 		dev_warn(&adev->dev, "No SoundWire links detected\n");
 		return NULL;
 	}
-- 
1.9.3

