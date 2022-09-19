Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEEF5BD42B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:54:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E171E8;
	Mon, 19 Sep 2022 19:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E171E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663610048;
	bh=081EPmTS3y815iiCscPub7rqoLD2JH0w0KdPzW1+ikI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWpEdItTmjy7uHJC8m0LxbDkbMaor1nC7MHdqVIYWUTkZbXNSWUo68pUAi+maU9A0
	 oDXNeKepCEELNAWCxuN7yWimKq65rj7aNG/8POKMk4Yj0tQerSWlmhkgGTG5Y42YkS
	 j+kBzEslusZ1fLf2Rq/UIKoI6Z7y4H8FJst1P+CA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D6C6F80571;
	Mon, 19 Sep 2022 19:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BA3DF80559; Mon, 19 Sep 2022 19:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A8AF8053C
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A8AF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LQrwNUtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609859; x=1695145859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=081EPmTS3y815iiCscPub7rqoLD2JH0w0KdPzW1+ikI=;
 b=LQrwNUtIBcTWH1NddjHYCcZhnvYGL3n+BMu0SU2P8ycxI3bgKigfOwYz
 3HF34sf33tdZig4v2NiaW0VENqRxfb+QxMqF+PJ+5p3J7tE0BQRhzVNjA
 kllBB07kXnVaOZtHYjd3Au3N+B3T44EiBRTZ1cQJ1ezZDmB9CRTOpJ91B
 QEvCtlyioOZ6bgiWCSalJ17H0pD9EODmYUEw3oN/NcEMj9QrwN1y5f/vU
 hKM2aUarVHKfyN6s5f92ZhXH7l//dnaVgki05idQ27Ugp7KVQ+y01ADkz
 RvSGVVcrCoMdIbND2NeFSr2RuvRT5yiTczuDLBJEMl4Ch4+1QocuiuKyU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498820"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498820"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658548"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 09/11] soundwire: intel: introduce intel_shim_check_wake()
 helper
Date: Tue, 20 Sep 2022 01:57:19 +0800
Message-Id: <20220919175721.354679-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
References: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add new helper before code partitioning in order to avoid direct read
from specific register. No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 66aab02b9323..2ca924622153 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -344,6 +344,17 @@ static void intel_shim_init(struct sdw_intel *sdw)
 	usleep_range(10, 15);
 }
 
+static int intel_shim_check_wake(struct sdw_intel *sdw)
+{
+	void __iomem *shim;
+	u16 wake_sts;
+
+	shim = sdw->link_res->shim;
+	wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
+
+	return wake_sts & BIT(sdw->instance);
+}
+
 static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 {
 	void __iomem *shim = sdw->link_res->shim;
@@ -1491,8 +1502,6 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
 	struct device *dev = &auxdev->dev;
 	struct sdw_intel *sdw;
 	struct sdw_bus *bus;
-	void __iomem *shim;
-	u16 wake_sts;
 
 	sdw = auxiliary_get_drvdata(auxdev);
 	bus = &sdw->cdns.bus;
@@ -1503,10 +1512,7 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
 		return 0;
 	}
 
-	shim = sdw->link_res->shim;
-	wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
-
-	if (!(wake_sts & BIT(sdw->instance)))
+	if (!intel_shim_check_wake(sdw))
 		return 0;
 
 	/* disable WAKEEN interrupt ASAP to prevent interrupt flood */
-- 
2.25.1

