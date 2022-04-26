Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA0510CEF
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 01:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852CC182B;
	Wed, 27 Apr 2022 01:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852CC182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651017496;
	bh=7EUtCKwJmlibbavHY3Ddf0LnLTbd6D1YbMdZzySp9tA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aol9ZK9IvbEzzd244kzWva6EIWJ7tMK/PbrQqU06NA5p/hvQHgzD32LhFRXK6DQfP
	 iza9TnYJJmE5uPIvdq4jjcGSTNuYOGkPpKG3saabNBmZfsNVOD1uLLhsXOGR+dvSD+
	 +9kfp58tlg8K8WNKPfE6zGbcDPg2mp9KDAKPOQ78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4159F80171;
	Wed, 27 Apr 2022 01:56:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A22E8F804FE; Wed, 27 Apr 2022 01:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC4C2F8014B
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 01:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC4C2F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bWkMOeLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651017401; x=1682553401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7EUtCKwJmlibbavHY3Ddf0LnLTbd6D1YbMdZzySp9tA=;
 b=bWkMOeLw8KoR/NcUEE2zX6W8u5K/fxS7AnFfH7K9qdRhBvCrMw00aXi7
 xDOFTbALzR2XsBveaeXAM37xBkD50H0ncYhDyCJdP9bdBhQRqO6QE5kJj
 XMdc7Huy/F7FT1CtyBzbcSsOPT0ssUctekN87J+1t/xIudo/DQSR3LOTh
 Z0aOpxGbJRAd0NiTyXlqQf+0ntD1OyAo6vhUcGnRlsyhVL65I5v1b5W93
 Gt5GGhE9MCW9y+Xpv57DILy3uSZ7ozvdjPpu+ad+W9Em+5r3CmbbeylB1
 5kUNAaRAQIBZVOyh+npqsknCbuD12dUepKMwQaF11yN4x0tYVKZ2pu+z+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290908845"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="290908845"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="730515030"
Received: from htamura-mobl2.gar.corp.intel.com (HELO bard-pc.domain.name)
 ([10.252.185.30])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 16:56:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/5] soundwire: bus: use pm_runtime_resume_and_get()
Date: Wed, 27 Apr 2022 07:56:20 +0800
Message-Id: <20220426235623.4253-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
References: <20220426235623.4253-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
pm_runtime_put_noidle() pattern.

No functional changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 354d3f89366f..193bf87866f6 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -536,11 +536,9 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(&slave->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_noidle(&slave->dev);
+	ret = pm_runtime_resume_and_get(&slave->dev);
+	if (ret < 0 && ret != -EACCES)
 		return ret;
-	}
 
 	ret = sdw_nread_no_pm(slave, addr, count, val);
 
@@ -562,11 +560,9 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(&slave->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_noidle(&slave->dev);
+	ret = pm_runtime_resume_and_get(&slave->dev);
+	if (ret < 0 && ret != -EACCES)
 		return ret;
-	}
 
 	ret = sdw_nwrite_no_pm(slave, addr, count, val);
 
@@ -1506,10 +1502,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
-	ret = pm_runtime_get_sync(&slave->dev);
+	ret = pm_runtime_resume_and_get(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
-		pm_runtime_put_noidle(&slave->dev);
 		return ret;
 	}
 
-- 
2.25.1

