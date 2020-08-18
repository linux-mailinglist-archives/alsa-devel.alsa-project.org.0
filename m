Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134F2487F5
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2B3E1764;
	Tue, 18 Aug 2020 16:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2B3E1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761696;
	bh=z0PGberT7TpiGUgc5f6vF6KL8RbYnpdFd9BHf/0kQKU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJJp+EI4rEthm3fMwbU1v0MDodOVRI6JVdOTFwWleBjffvrHpbg4nx+T2ZRlE26qw
	 puF0fEJugphIN+16zlxdEfZndwjf/DA4t3pDPWMRxjjMlu+VWer5ZRKyKzqhCCesES
	 obxtGm84y8kXJ2TiKtEa+qOSGmHDTmXWC8WUmij8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3663F80315;
	Tue, 18 Aug 2020 16:35:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC5FCF80308; Tue, 18 Aug 2020 16:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9984DF802FB
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9984DF802FB
IronPort-SDR: 2sCgjOXMo83+c936BsysWtJ5gy2DKvOdSi9952WLU6EHSNH9qnQkaKAzYaoPvioeSDTN2RSIhw
 ttKxLzm8negg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223562"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223562"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:46 -0700
IronPort-SDR: twSiAiudEPC6ZAJzPOolKp8o4ELzJfqYKN2EkbCkXbi4EVJoKO3ywPtM5zQb+HtXCpMxrIBBC3
 XYfn0uFXjoTA==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830696"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 08/11] soundwire: stream: enable hw_sync as needed by hardware
Date: Tue, 18 Aug 2020 10:41:17 +0800
Message-Id: <20200818024120.20721-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
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

Use platform-specific information to decide when to use hw_sync, not
only a number of links > 1.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 37290a799023..e4cf484f5905 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -689,9 +689,9 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 
 	/*
 	 * Set the multi_link flag only when both the hardware supports
-	 * and there is a stream handled by multiple masters
+	 * and hardware-based sync is required
 	 */
-	multi_link = bus->multi_link && (m_rt_count > 1);
+	multi_link = bus->multi_link && (m_rt_count >= bus->hw_sync_min_links);
 
 	if (multi_link)
 		ret = sdw_transfer_defer(bus, wr_msg, &bus->defer_msg);
@@ -760,13 +760,16 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 	const struct sdw_master_ops *ops;
 	struct sdw_bus *bus;
 	bool multi_link = false;
+	int m_rt_count;
 	int ret = 0;
 
+	m_rt_count = stream->m_rt_count;
+
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		bus = m_rt->bus;
 		ops = bus->ops;
 
-		if (bus->multi_link) {
+		if (bus->multi_link && m_rt_count >= bus->hw_sync_min_links) {
 			multi_link = true;
 			mutex_lock(&bus->msg_lock);
 		}
@@ -787,7 +790,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 		 * synchronized across all Masters and happens later as a
 		 * part of post_bank_switch ops.
 		 */
-		ret = sdw_bank_switch(bus, stream->m_rt_count);
+		ret = sdw_bank_switch(bus, m_rt_count);
 		if (ret < 0) {
 			dev_err(bus->dev, "Bank switch failed: %d\n", ret);
 			goto error;
@@ -813,7 +816,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 					ret);
 				goto error;
 			}
-		} else if (bus->multi_link && stream->m_rt_count > 1) {
+		} else if (multi_link) {
 			dev_err(bus->dev,
 				"Post bank switch ops not implemented\n");
 			goto error;
@@ -831,7 +834,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 			goto error;
 		}
 
-		if (bus->multi_link)
+		if (multi_link)
 			mutex_unlock(&bus->msg_lock);
 	}
 
-- 
2.17.1

