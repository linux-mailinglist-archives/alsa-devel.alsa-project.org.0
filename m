Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC135E25C0
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D905D168B;
	Wed, 23 Oct 2019 23:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D905D168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571867388;
	bh=wk/O6FTcAxsh+9PEkVl0eRctnMJwPi9xDltLBLQSXOY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpR7D+5JTT1iIZ8vE4uohuD5rMTALfm9YOiyLulPcU0LjXX3Itge3UzhQU/t8cewv
	 pSvAIkWUve9rJNHLJQuzICwMfsL3tWvHUrzgZaV9vG9h1v9OhXXDKI3nd/Cg4Df2oZ
	 DkbOAxM3R3Q9NewQUzq4HgZzf7xW9hYn0nqYTGN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45B2EF80612;
	Wed, 23 Oct 2019 23:46:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88857F805FD; Wed, 23 Oct 2019 23:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E1CF80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E1CF80274
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="196908138"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by fmsmga008.fm.intel.com with ESMTP; 23 Oct 2019 14:46:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:45:46 -0500
Message-Id: <20191023214601.883-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023214601.883-1-pierre-louis.bossart@linux.intel.com>
References: <20191023214601.883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 03/18] soundwire: bus: add PM/no-PM versions of
	read/write functions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for pm_runtime with the appropriate error checks for
sdw_write/read functions, e.g. when pm_runtime is not supported.

Also expose internal functions without pm_runtime support, which are
required to perform any sort of suspend/resume operation, as well as
any enumeration tasks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 68 +++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 903aee258800..7f431677f152 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -317,6 +317,46 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 	return 0;
 }
 
+/*
+ * Read/Write IO functions.
+ * no_pm versions can only be called by the bus, e.g. while enumerating or
+ * handling suspend-resume sequences.
+ * all clients need to use the pm versions
+ */
+
+static int
+sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+{
+	struct sdw_msg msg;
+	int ret;
+
+	ret = sdw_fill_msg(&msg, slave, addr, count,
+			   slave->dev_num, SDW_MSG_FLAG_READ, val);
+	if (ret < 0)
+		return ret;
+
+	return sdw_transfer(slave->bus, &msg);
+}
+
+static int
+sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+{
+	struct sdw_msg msg;
+	int ret;
+
+	ret = sdw_fill_msg(&msg, slave, addr, count,
+			   slave->dev_num, SDW_MSG_FLAG_WRITE, val);
+	if (ret < 0)
+		return ret;
+
+	return sdw_transfer(slave->bus, &msg);
+}
+
+int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
+{
+	return sdw_nwrite_no_pm(slave, addr, 1, &value);
+}
+
 /**
  * sdw_nread() - Read "n" contiguous SDW Slave registers
  * @slave: SDW Slave
@@ -326,19 +366,17 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
  */
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
-	struct sdw_msg msg;
 	int ret;
 
-	ret = sdw_fill_msg(&msg, slave, addr, count,
-			   slave->dev_num, SDW_MSG_FLAG_READ, val);
-	if (ret < 0)
-		return ret;
-
 	ret = pm_runtime_get_sync(slave->bus->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(slave->bus->dev);
 		return ret;
+	}
+
+	ret = sdw_nread_no_pm(slave, addr, count, val);
 
-	ret = sdw_transfer(slave->bus, &msg);
+	pm_runtime_mark_last_busy(slave->bus->dev);
 	pm_runtime_put(slave->bus->dev);
 
 	return ret;
@@ -354,19 +392,17 @@ EXPORT_SYMBOL(sdw_nread);
  */
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
-	struct sdw_msg msg;
 	int ret;
 
-	ret = sdw_fill_msg(&msg, slave, addr, count,
-			   slave->dev_num, SDW_MSG_FLAG_WRITE, val);
-	if (ret < 0)
-		return ret;
-
 	ret = pm_runtime_get_sync(slave->bus->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(slave->bus->dev);
 		return ret;
+	}
+
+	ret = sdw_nwrite_no_pm(slave, addr, count, val);
 
-	ret = sdw_transfer(slave->bus, &msg);
+	pm_runtime_mark_last_busy(slave->bus->dev);
 	pm_runtime_put(slave->bus->dev);
 
 	return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
