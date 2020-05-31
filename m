Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9E1E9BFA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 05:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A72A16F7;
	Mon,  1 Jun 2020 05:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A72A16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590981285;
	bh=VjsboYmKUx/0vqrTDWqzDAYuf1hfxPMNY3RDCjCCs+0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ekx0PhhyfXQdFGu5ewgc8ByCWTYwow4ybZ+UoJr7H47BU+jUCE9g9FT6/3eODSJWS
	 tsyb9+elwHMP/zTt4tyqbo2L9QsV659S06CQR4kWcqDZtDpgY0wPmABpgwCcROU9Rn
	 /NN3WNdJWCHtWgx2w0LgkuDO71Z8yjvsrhKC+sgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06969F801ED;
	Mon,  1 Jun 2020 05:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E653F801EC; Mon,  1 Jun 2020 05:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 875D3F800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 05:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 875D3F800B8
IronPort-SDR: V443KRaaQJPhKmzw1anSr+baSuB8kx6BR9YblSnKwOsGsSc+yh7gKr1nmN9Qe630Hca4puh7Dj
 QtZPRpbgN0NA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 20:12:46 -0700
IronPort-SDR: NW4Fbl4SM5gX2PDB1WKlalXclQeVn0a5hiPCQUpJPcwYF75cIYEdWt4/+e7D+w/x8zNY4DSELw
 pTz84bSS3R1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="293041317"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 31 May 2020 20:12:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: bus: clock_stop: don't deal with UNATTACHED Slave
 devices
Date: Sun, 31 May 2020 23:18:06 +0800
Message-Id: <20200531151806.25951-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

We don't need to do anything for the slave if it is unattached during
clock stop prepare and exit sequences.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 2289c2ac8c5a..405335fb790a 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -863,13 +863,13 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		if (!slave->dev_num)
 			continue;
 
-		/* Identify if Slave(s) are available on Bus */
-		is_slave = true;
-
 		if (slave->status != SDW_SLAVE_ATTACHED &&
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
+		/* Identify if Slave(s) are available on Bus */
+		is_slave = true;
+
 		slave_mode = sdw_get_clk_stop_mode(slave);
 		slave->curr_clk_stop_mode = slave_mode;
 
@@ -900,6 +900,10 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 			return ret;
 	}
 
+	/* Don't need to inform slaves if there is no slave attached */
+	if (!is_slave)
+		return ret;
+
 	/* Inform slaves that prep is done */
 	list_for_each_entry(slave, &bus->slaves, node) {
 		if (!slave->dev_num)
@@ -985,13 +989,13 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		if (!slave->dev_num)
 			continue;
 
-		/* Identify if Slave(s) are available on Bus */
-		is_slave = true;
-
 		if (slave->status != SDW_SLAVE_ATTACHED &&
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
+		/* Identify if Slave(s) are available on Bus */
+		is_slave = true;
+
 		mode = slave->curr_clk_stop_mode;
 
 		if (mode == SDW_CLK_STOP_MODE1) {
@@ -1016,6 +1020,13 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 	if (is_slave && !simple_clk_stop)
 		sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
 
+	/*
+	 * Don't need to call slave callback function if there is no slave
+	 * attached
+	 */
+	if (!is_slave)
+		return 0;
+
 	list_for_each_entry(slave, &bus->slaves, node) {
 		if (!slave->dev_num)
 			continue;
-- 
2.17.1

