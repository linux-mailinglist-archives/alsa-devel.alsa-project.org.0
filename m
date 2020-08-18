Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598372492BE
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 04:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0732C17E5;
	Wed, 19 Aug 2020 04:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0732C17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597802768;
	bh=Xgkfj7VG6KeZ6L6nzd1Rd7CGM+fxkruumGX5SRJQxBo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drFhJ3551lgd9k4/xiVjcllP9SrzlJ18si5fjnAKCH60ufXZlDITh4ZmkXeD9KR1l
	 Lje0JX0wXiX4XgCR4WHMI+DFKEQ0GMxwtpVVwIhP0FhZBUmbW1eC7iakmru5alqUUz
	 6hzzq0ZTmefzwlXz2uRwqV4B0eYMuyZaONeRgcUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89F3BF802FD;
	Wed, 19 Aug 2020 04:01:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 938FAF802FD; Wed, 19 Aug 2020 04:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4807FF802DC
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 04:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4807FF802DC
IronPort-SDR: I8+DzHHnlKCqISJZQMK9QXqjOzXxDBrI7e6uBUsxJScL1cSywZvoM/2dWFJw4qdHL87fLL3ew7
 nnnY6WiWDPjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239865564"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="239865564"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:01:08 -0700
IronPort-SDR: SIAdkWuIIxsqZe7/XmKD4G1JW/5hilC1/KKHBGsR64o3mDAWXgaBfCEO3k4qW0n/cStSf/QsC5
 DB0OSGc1aAsg==
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="279565140"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:01:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 6/7] soundwire: bus: export broadcast read/write capability
 for tests
Date: Tue, 18 Aug 2020 22:06:55 +0800
Message-Id: <20200818140656.29014-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
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

Provide prototype and export symbol to enable tests. The bus lock is
handled externally to avoid conflicts e.g. between kernel-generated
traffic and test traffic.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 56 +++++++++++++++++++++++++++++++++++------
 drivers/soundwire/bus.h |  4 +++
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 869290a8db40..2e08e8f8b9aa 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -255,6 +255,21 @@ static int sdw_reset_page(struct sdw_bus *bus, u16 dev_num)
 	return ret;
 }
 
+static int sdw_transfer_unlocked(struct sdw_bus *bus, struct sdw_msg *msg)
+{
+	int ret;
+
+	ret = do_transfer(bus, msg);
+	if (ret != 0 && ret != -ENODATA)
+		dev_err(bus->dev, "trf on Slave %d failed:%d\n",
+			msg->dev_num, ret);
+
+	if (msg->page)
+		sdw_reset_page(bus, msg->dev_num);
+
+	return ret;
+}
+
 /**
  * sdw_transfer() - Synchronous transfer message to a SDW Slave device
  * @bus: SDW bus
@@ -266,13 +281,7 @@ int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
 
 	mutex_lock(&bus->msg_lock);
 
-	ret = do_transfer(bus, msg);
-	if (ret != 0 && ret != -ENODATA)
-		dev_err(bus->dev, "trf on Slave %d failed:%d\n",
-			msg->dev_num, ret);
-
-	if (msg->page)
-		sdw_reset_page(bus, msg->dev_num);
+	ret = sdw_transfer_unlocked(bus, msg);
 
 	mutex_unlock(&bus->msg_lock);
 
@@ -428,6 +437,39 @@ sdw_bwrite_no_pm(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value)
 	return sdw_transfer(bus, &msg);
 }
 
+int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr)
+{
+	struct sdw_msg msg;
+	u8 buf;
+	int ret;
+
+	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
+			   SDW_MSG_FLAG_READ, &buf);
+	if (ret)
+		return ret;
+
+	ret = sdw_transfer_unlocked(bus, &msg);
+	if (ret < 0)
+		return ret;
+
+	return buf;
+}
+EXPORT_SYMBOL(sdw_bread_no_pm_unlocked);
+
+int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value)
+{
+	struct sdw_msg msg;
+	int ret;
+
+	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
+			   SDW_MSG_FLAG_WRITE, &value);
+	if (ret)
+		return ret;
+
+	return sdw_transfer_unlocked(bus, &msg);
+}
+EXPORT_SYMBOL(sdw_bwrite_no_pm_unlocked);
+
 static int
 sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
 {
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 82484f741168..c53345fbc4c7 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -168,6 +168,10 @@ sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 	return sdw_write(slave, addr, tmp);
 }
 
+/* broadcast read/write for tests */
+int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr);
+int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value);
+
 /*
  * At the moment we only track Master-initiated hw_reset.
  * Additional fields can be added as needed
-- 
2.17.1

