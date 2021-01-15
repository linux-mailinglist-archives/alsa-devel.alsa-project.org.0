Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BBC2F7248
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 06:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5D3179E;
	Fri, 15 Jan 2021 06:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5D3179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610689179;
	bh=7UUScoDG6HtTKK3D9RmvcMg+7AfbrVDSuUnfys/ewwA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gU4w7V99kqdst3oDBklzPRxUERp/1X9JRZat/a0Gd2gJDt4TZRzzqobLkqH6yET3J
	 FZwQnl6SbPTM2XdnuktnkWYg2s8CG++K24L8z767M5atrfQxNgv675tDYcZwyllmI9
	 4s6mI0uEkyUrwV1YbQ3xluKSo4oa+E/wOIpLwLCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F7A5F8026B;
	Fri, 15 Jan 2021 06:37:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B90EF8029B; Fri, 15 Jan 2021 06:37:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECA56F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA56F80113
IronPort-SDR: fKwTp407d9vPOf2ZOQjTrG+sIVsD9kQKEEOTl6I5DzU2gsFW3mPAFxIjItxdittHNAeNbbCwBA
 9+s/clItMIvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240046281"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="240046281"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:41 -0800
IronPort-SDR: g0hzGoynIz+FAkoIGrwwCuXmSbhF3yQ5TnAYMEaf90rJ3Vq1dBiWDddkCmaKD9z/u5JOLbAn9B
 P+deQjwnk49w==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382542427"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:38 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/5] soundwire: use consistent format for Slave devID logs
Date: Fri, 15 Jan 2021 13:37:34 +0800
Message-Id: <20210115053738.22630-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
References: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

We mix decimal and hexadecimal values, this leads to confusions in
dmesg logs and bug reports. Let's add a 0x prefix for all hexadecimal
values and a format when more than 4 bits are used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c   |  5 ++---
 drivers/soundwire/slave.c | 10 ++++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d1e8c3a54976..3cc006bfae71 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -679,9 +679,8 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 	id->class_id = SDW_CLASS_ID(addr);
 
 	dev_dbg(bus->dev,
-		"SDW Slave class_id %x, part_id %x, mfg_id %x, unique_id %x, version %x\n",
-				id->class_id, id->part_id, id->mfg_id,
-				id->unique_id, id->sdw_version);
+		"SDW Slave class_id 0x%02x, mfg_id 0x%04x, part_id 0x%04x, unique_id 0x%x, version 0x%x\n",
+		id->class_id, id->mfg_id, id->part_id, id->unique_id, id->sdw_version);
 }
 
 static int sdw_program_device_num(struct sdw_bus *bus)
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index a08f4081c1c4..180f38bd003b 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -163,15 +163,13 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
 
 			if (id.unique_id != id2.unique_id) {
 				dev_dbg(bus->dev,
-					"Valid unique IDs %x %x for Slave mfg %x part %d\n",
-					id.unique_id, id2.unique_id,
-					id.mfg_id, id.part_id);
+					"Valid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
+					id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
 				ignore_unique_id = false;
 			} else {
 				dev_err(bus->dev,
-					"Invalid unique IDs %x %x for Slave mfg %x part %d\n",
-					id.unique_id, id2.unique_id,
-					id.mfg_id, id.part_id);
+					"Invalid unique IDs 0x%x 0x%x for Slave mfg_id 0x%04x, part_id 0x%04x\n",
+					id.unique_id, id2.unique_id, id.mfg_id, id.part_id);
 				return -ENODEV;
 			}
 		}
-- 
2.17.1

