Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C633C7CEC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:26:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D07C16AA;
	Wed, 14 Jul 2021 05:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D07C16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233202;
	bh=a0ydB4wokGEMVx2zs0Ec7Ag9mzfhxn5iOL2mOrCz/d4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmIE4kik3LBOE0cHn/uVX0Nk++ev4Q+XCtvBjTWy9Vtcp0stsOMDD9/8gNA0HCxd1
	 DFVBsIrZDaitcLSIklchj7QNifR9ILKl4ScUJjVcrO8f2NP0kGOz3ypMZ4v+M4HeoH
	 ey07Fe1etMbafHlunJsvIwEr5JDvzxOQ5t1Ucz50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F66F80508;
	Wed, 14 Jul 2021 05:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 415A5F804FA; Wed, 14 Jul 2021 05:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28ED5F804DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28ED5F804DF
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086455"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086455"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818184"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 07/10] soundwire: bus: squelch error returned by mockup devices
Date: Wed, 14 Jul 2021 11:22:06 +0800
Message-Id: <20210714032209.11284-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

All read and writes from/to SoundWire mockup devices will return
-ENODATA/Command_Ignored, this patch forces a Command_OK result to let
the bus perform the required configurations, e.g. for the Data Ports,
which will only have an effect on the Master side.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 278a4fbdb88d..baa236cb5484 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -390,7 +390,10 @@ sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 	if (ret < 0)
 		return ret;
 
-	return sdw_transfer(slave->bus, &msg);
+	ret = sdw_transfer(slave->bus, &msg);
+	if (slave->is_mockup_device)
+		ret = 0;
+	return ret;
 }
 
 static int
@@ -404,7 +407,10 @@ sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 	if (ret < 0)
 		return ret;
 
-	return sdw_transfer(slave->bus, &msg);
+	ret = sdw_transfer(slave->bus, &msg);
+	if (slave->is_mockup_device)
+		ret = 0;
+	return ret;
 }
 
 int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
-- 
2.17.1

