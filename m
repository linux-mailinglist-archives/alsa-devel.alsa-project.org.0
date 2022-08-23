Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75259D037
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 06:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC1B1650;
	Tue, 23 Aug 2022 06:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC1B1650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661230100;
	bh=IPnnb0fU/qVJlOwgD1izgy0CaO2aldoMjVq4ZHg4Azw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUkFZk+RM2ecL1cHGdqYkZ8w9yXdvixP2WGAdZfHNJ+hbYuaPFRErHTruVzLmz92p
	 5T8CL/sjml4rklRgXk8tQDRk2kgfZ21PxJOW2sGJNWYSkhQmRsHxYmIUon3srMbzjW
	 4yJ6iKpTIv2jdX4UwVIUhLq5Pw55T//u6t3ZZ2WQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C88F8020D;
	Tue, 23 Aug 2022 06:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02F8DF800A7; Tue, 23 Aug 2022 06:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4743DF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4743DF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B2YrrBln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661230007; x=1692766007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IPnnb0fU/qVJlOwgD1izgy0CaO2aldoMjVq4ZHg4Azw=;
 b=B2YrrBlnDebNss3+jigfBoSB2pHWPjBI+lvIr6SB6iHykwHM64DYYTgp
 Tp6iXO5QLIU/GJzS54err37AxsPF1GsNU13sGWKDUrGm2h6Vn6/XNsY8J
 u9bjKmGZKgkHMbUwyZTBa9KbQ1t9sEB9oLWL6CIu6/37Ca3tDEtpn79Aj
 ZJ+8Hd2Dr//zJPMldhfUKJoh+QVbFaZxwVL2f+JsYmvAI3+avPT0nFAU7
 5hVxH6tL/h6bKhJPnC20k7VHwC18AaaX5SOvAwVbnY8iGtkBQ9vBPqiRh
 49g8zHg4+8nynuyTw8PU5LXuQfTMcJojhoM7Ap3qzGY2/+H9/VOx/ZqTA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="319629721"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="319629721"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:46:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="669855093"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:46:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/3] soundwire: bus: rename sdw_ida as sdw_bus_ida
Date: Tue, 23 Aug 2022 12:50:02 +0800
Message-Id: <20220823045004.2670658-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
References: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
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

To avoid confusions with follow-up patches using a IDA mechanism for
peripheral 'device number' allocation, rename sdw_ida as sdw_bus_ida.

Pure rename, no functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 8d4000664fa3..37638c20c804 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -11,11 +11,11 @@
 #include "bus.h"
 #include "sysfs_local.h"
 
-static DEFINE_IDA(sdw_ida);
+static DEFINE_IDA(sdw_bus_ida);
 
 static int sdw_get_id(struct sdw_bus *bus)
 {
-	int rc = ida_alloc(&sdw_ida, GFP_KERNEL);
+	int rc = ida_alloc(&sdw_bus_ida, GFP_KERNEL);
 
 	if (rc < 0)
 		return rc;
@@ -179,7 +179,7 @@ void sdw_bus_master_delete(struct sdw_bus *bus)
 	sdw_master_device_del(bus);
 
 	sdw_bus_debugfs_exit(bus);
-	ida_free(&sdw_ida, bus->id);
+	ida_free(&sdw_bus_ida, bus->id);
 }
 EXPORT_SYMBOL(sdw_bus_master_delete);
 
-- 
2.25.1

