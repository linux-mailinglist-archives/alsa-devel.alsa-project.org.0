Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7C6692E8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 10:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4B658A8A;
	Fri, 13 Jan 2023 10:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4B658A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673602148;
	bh=Msf7Ux2UBgkRWznDZIyNsLYT/We1sSSckwpIyVPyhL0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DPMC+9G0VXaftFlF+40VPy+bIelZ9d8JtImWoO1gCBxaPHN7bIOIRT80eJ7jTeEXl
	 uYHIYrHE4K5/ommJ/roCVvr2iFzHXalCUoyEtyxRz4SA1uWzID3JaiUKjLSV5ABegY
	 m6i4Z7C2PdA/4QV77HXdtSo0SHpbcj6gpQjPNLrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67044F804D2;
	Fri, 13 Jan 2023 10:27:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05906F80425; Fri, 13 Jan 2023 10:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C07FEF802E8
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:27:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C07FEF802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bZAa35aq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673602046; x=1705138046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Msf7Ux2UBgkRWznDZIyNsLYT/We1sSSckwpIyVPyhL0=;
 b=bZAa35aqt0Tpd7kpbGlVzvbn9GZx0jsrgLgouwD3WIqy+2ajZZjU0aPU
 N2DbMPefkaiJ5GQiUQezxOhk3B/c/0UfWwUzBYRdlyaMnlrmwi9fTT7hY
 MPNGZWcOreWDMeSZngn6NNRusG2ghdg29Nuu728F+Sp+eU75xLmvsT54x
 i4eIGwi6Mp/AFwPACoARVbfSoIq/QHJ3zBSxvgp91hHRkymv0jFLXT0zE
 ouAqtrzUXUVBXwabd1HPeC1CzPzk/tPGFKdvCEVjaDypJq3uPjLPCZIGa
 zwf1vg8dXOMQQp7SF0tu0Jk5FTTkkr3yv+IdFMgORVx8fdqAWy3xjz2j3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351189435"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="351189435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608116087"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="608116087"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/5] soundwire: stream: uniquify dev_err() logs
Date: Fri, 13 Jan 2023 17:35:28 +0800
Message-Id: <20230113093532.3872113-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113093532.3872113-1-yung-chuan.liao@linux.intel.com>
References: <20230113093532.3872113-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There are a couple of duplicate logs which makes harder than needed to
follow the error flows. Add __func__ or make the log unique.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index df3b36670df4..e0eae0b98267 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
+		dev_err(bus->dev, "do_bank_switch failed: %d\n", ret);
 		goto restore_params;
 	}
 
@@ -1477,7 +1477,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d\n", ret);
+			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
 			return ret;
 		}
 
@@ -1567,7 +1567,7 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d\n", ret);
+			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
 			return ret;
 		}
 	}
@@ -1664,7 +1664,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d\n", ret);
+			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
 			return ret;
 		}
 	}
@@ -1893,7 +1893,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 
 	m_rt = sdw_master_rt_alloc(bus, stream);
 	if (!m_rt) {
-		dev_err(bus->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
+		dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
+			__func__, stream->name);
 		ret = -ENOMEM;
 		goto unlock;
 	}
@@ -2012,7 +2013,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 */
 	m_rt = sdw_master_rt_alloc(slave->bus, stream);
 	if (!m_rt) {
-		dev_err(&slave->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
+		dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
+			__func__, stream->name);
 		ret = -ENOMEM;
 		goto unlock;
 	}
-- 
2.25.1

