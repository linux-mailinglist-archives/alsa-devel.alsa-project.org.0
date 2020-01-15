Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4813B67F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 01:16:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421E217C5;
	Wed, 15 Jan 2020 01:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421E217C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579047408;
	bh=R3FSio+zsLHQH7d5kUxEwVW2lb6vmsZ1BPy2mpKBD1I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mkxHkIx2c7T18WYkhC9+rMZqukOVAID64LzZUseZytyzOMAjaemWZ+t/B2DASpztd
	 26Jn/1mDhpxDiEwiaxlHJYxsV2allsowSJ7MXkU5+gNu1kknf0IS2gPTxCV04IzOgZ
	 mE0JJEMiSsc5pPNlJx7mgZm5CWhA8xWNXoQyK4G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8CFF802DF;
	Wed, 15 Jan 2020 01:10:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AEFBF802C3; Wed, 15 Jan 2020 01:10:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A92BDF80299
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 01:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A92BDF80299
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 16:09:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="273468595"
Received: from emkilgox-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.0.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2020 16:09:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 14 Jan 2020 18:08:42 -0600
Message-Id: <20200115000844.14695-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115000844.14695-1-pierre-louis.bossart@linux.intel.com>
References: <20200115000844.14695-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 08/10] soundwire: bus: fix io error when
	processing alert event
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

From: Rander Wang <rander.wang@intel.com>

There are two types of io errors when processing alert event.

a) the Master detects an ALERT status for e.g. a jack event and
invokes the implementation-defined function in the Slave driver to
check the jack status. At this time the codec is just suspended, so io
registers can't be accessed.

b) when waking up from clock stop mode1 state, where the bus needs a
complete re-enumeration, Slave registers can't be accessed until the
enumeration is complete.

This patch resumes the Slave device and waits for initialization
complete when processing slave alert event, so that registers on the
Slave can be accessed without timeouts or io errors.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 33bb273454cf..23bc24c8e9d1 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -890,12 +890,19 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
+	ret = pm_runtime_get_sync(&slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
+		pm_runtime_put_noidle(slave->bus->dev);
+		return ret;
+	}
+
 	/* Read Instat 1, Instat 2 and Instat 3 registers */
 	ret = sdw_read(slave, SDW_SCP_INT1);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
 			"SDW_SCP_INT1 read failed:%d\n", ret);
-		return ret;
+		goto io_err;
 	}
 	buf = ret;
 
@@ -903,7 +910,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
 			"SDW_SCP_INT2/3 read failed:%d\n", ret);
-		return ret;
+		goto io_err;
 	}
 
 	do {
@@ -983,7 +990,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_SCP_INT1 write failed:%d\n", ret);
-			return ret;
+			goto io_err;
 		}
 
 		/*
@@ -994,7 +1001,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_SCP_INT1 read failed:%d\n", ret);
-			return ret;
+			goto io_err;
 		}
 		_buf = ret;
 
@@ -1002,7 +1009,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_SCP_INT2/3 read failed:%d\n", ret);
-			return ret;
+			goto io_err;
 		}
 
 		/* Make sure no interrupts are pending */
@@ -1023,6 +1030,10 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
 		dev_warn(slave->bus->dev, "Reached MAX_RETRY on alert read\n");
 
+io_err:
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
