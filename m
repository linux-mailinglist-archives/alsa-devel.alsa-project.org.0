Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA25BD426
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31162163D;
	Mon, 19 Sep 2022 19:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31162163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663610014;
	bh=ysMlpOvB+Aq5Jze0gGbEnYMmySseBub88xxP7dnnXTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qsZpDrme8dVIPSawIH8gyHVf+8OHMgfSbG5j3pGXikZRTlZkvm6U6OONG3cI5c1+8
	 54qT1D2nivjfv3t1Kqh/3kAlFq102G86pQW0HbVaGxghnz1tMppSgaJzYmiWwB87Hz
	 uSvtnZ3eaYmfdhI2F6hlcjBOnH6MppMMzyeKkRhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D106F8055C;
	Mon, 19 Sep 2022 19:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B15F8F80551; Mon, 19 Sep 2022 19:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C7FF803DD
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C7FF803DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZppOZ0Yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609854; x=1695145854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysMlpOvB+Aq5Jze0gGbEnYMmySseBub88xxP7dnnXTo=;
 b=ZppOZ0Ylf1MWGt9dZauWKu/7x4Lz0mzbnywSv464BIwm8wKGAWM0e50w
 8GxZ8S1ozEOiyQrrgYUQLKs+599MOy3FhuuOj/SgGR3ybUocvBhfhYwCF
 bBzvD+csJC+7GJx0iXZ16YGCXPAy5L5EvHzf8H/N0/Q7JMm1IDvyw7zTS
 dtgW7R8WttPh9n9QMF/I5ug76s4ZdHP4BTmEmSeUjWkRpnVktu/8FdnE3
 5N1GnpXIVK1lvPP8s9VUZll8ZuDShdaPyOkE/1dH3EMVqEdJ1dWMscIZT
 6737aFq2KK7vaDQG2ygX71HSRWym5/n+d0XRKlqlal5ye5fXEnx++PF6f w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498732"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498732"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658427"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 05/11] soundwire: intel: remove clock_stop parameter in
 intel_shim_init()
Date: Tue, 20 Sep 2022 01:57:15 +0800
Message-Id: <20220919175721.354679-6-yung-chuan.liao@linux.intel.com>
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

Simplify signature before further code reshuffling.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 676de04c5070..2d828d98e153 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -391,7 +391,7 @@ static void intel_shim_master_ip_to_glue(struct sdw_intel *sdw)
 	/* at this point Integration Glue has full control of the I/Os */
 }
 
-static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
+static int intel_shim_init(struct sdw_intel *sdw)
 {
 	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
@@ -1277,14 +1277,10 @@ static struct sdw_master_ops sdw_intel_ops = {
 
 static int intel_init(struct sdw_intel *sdw)
 {
-	bool clock_stop;
-
 	/* Initialize shim and controller */
 	intel_link_power_up(sdw);
 
-	clock_stop = sdw_cdns_is_clock_stop(&sdw->cdns);
-
-	intel_shim_init(sdw, clock_stop);
+	intel_shim_init(sdw);
 
 	return 0;
 }
-- 
2.25.1

