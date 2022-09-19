Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004145BD423
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C182161E;
	Mon, 19 Sep 2022 19:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C182161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663609983;
	bh=grC3JO/QhhKE8hi6QZ/jj64Nuz3BhMdMj/nvoJJ91hs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aiRWuzlQ97x8qzbaVbwTgKLjzZNgxRv4WeakSECvIXehjFOtKTcEhxkQj5+fvc141
	 gJnxoT2d4II8MwkG1mJMn1gGel/0oi/E2khbQ8JuUbjukSjORD2qHCdAePwnDoT3us
	 xuJxbNV93GANEBVSGI8lfEgRBS2HrcLm18PyjE04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A56F80539;
	Mon, 19 Sep 2022 19:51:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13AE2F80551; Mon, 19 Sep 2022 19:51:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 607E4F800C9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 607E4F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dFzTkXd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609853; x=1695145853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grC3JO/QhhKE8hi6QZ/jj64Nuz3BhMdMj/nvoJJ91hs=;
 b=dFzTkXd0IMnB9aSpxf92hvMzSwufYQuGGHSLCi2eneoOeF1v6KB4sSnI
 UoW5hPTwbeTpb1wtmxrbL1WBsa/JpKrXwyu5Jn0V4AwgCVN84pd7aG4Yd
 ZVyNBV65RiiadROiLWlmhe9DKx00iKVK7FHkpHsTRj3wpLjHFs9WzjjWp
 5Zy5bQk1zAO+M6uTW+XnqYnJ8ZelnqtbAwqCsRLO/FQ+M0tVE3E9u8KDx
 WLejwfssSu+rN2V91tehnwFcrxL0nC137j34BKutLFg2c1/m9QN72v7bZ
 XP1bCPdz7LhUqXDbgPeQQWkzJiP1lewxI3LAnnbQeQRPVU+GwpEWU/+KQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498695"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498695"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658388"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 03/11] soundwire: intel: move DAI registration and debugfs
 init earlier
Date: Tue, 20 Sep 2022 01:57:13 +0800
Message-Id: <20220919175721.354679-4-yung-chuan.liao@linux.intel.com>
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

These two steps can and should be done before starting up the clock
and the bus operation. This is a first step before re-grouping
functionality in well-defined callbacks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index a6fe91f2d964..d7852cc7dd96 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1393,6 +1393,15 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 
 	intel_pdi_ch_update(sdw);
 
+	/* Register DAIs */
+	ret = intel_register_dai(sdw);
+	if (ret) {
+		dev_err(dev, "DAI registration failed: %d\n", ret);
+		goto err_init;
+	}
+
+	intel_debugfs_init(sdw);
+
 	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
 		dev_err(dev, "cannot enable interrupts\n");
@@ -1428,15 +1437,6 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	sdw_cdns_check_self_clearing_bits(cdns, __func__,
 					  true, INTEL_MASTER_RESET_ITERATIONS);
 
-	/* Register DAIs */
-	ret = intel_register_dai(sdw);
-	if (ret) {
-		dev_err(dev, "DAI registration failed: %d\n", ret);
-		goto err_interrupt;
-	}
-
-	intel_debugfs_init(sdw);
-
 	/* Enable runtime PM */
 	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME)) {
 		pm_runtime_set_autosuspend_delay(dev,
-- 
2.25.1

