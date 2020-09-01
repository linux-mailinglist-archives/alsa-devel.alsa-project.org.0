Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1825A3C7
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 05:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A3317B9;
	Wed,  2 Sep 2020 05:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A3317B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599015996;
	bh=z0PGberT7TpiGUgc5f6vF6KL8RbYnpdFd9BHf/0kQKU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y40+m7wjvHKK41/IACZ10xHCFZV3vyTE68raT7Qh7NCh9kjDSZDJGtFYJne2BbKYv
	 hegSQzyHeP1SdU2CzBqwjenV58hjFdT/4xItUvhO8UOXa9DTLbaHL8Pi0aq3iVDwVm
	 fzKpbt1IPdCZty2i7KkoxoGJubu0z07pfInOneE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFF28F8032A;
	Wed,  2 Sep 2020 05:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB88BF802A1; Wed,  2 Sep 2020 05:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D19D5F802BC
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 05:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D19D5F802BC
IronPort-SDR: aFS6UB09nxKMHol/t9bR7rSgXiq0fFoMdFYhuRz9wF/CrEz0sUC9iSvRTzhK6YCvSjksR3vbsk
 OhyymMu8++Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156570781"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="156570781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 20:00:07 -0700
IronPort-SDR: M96i8wad03eC41a30IwMqxvxvOik1H0Dma+3krLueXM9s4XH3wcCkbXmNILBVavy/CG5/wtrUe
 zp5Fu8A+3L0Q==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="283588189"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 20:00:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 07/10] soundwire: stream: enable hw_sync as needed by
 hardware
Date: Tue,  1 Sep 2020 23:05:53 +0800
Message-Id: <20200901150556.19432-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901150556.19432-1-yung-chuan.liao@linux.intel.com>
References: <20200901150556.19432-1-yung-chuan.liao@linux.intel.com>
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

