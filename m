Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885C3297A0
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:13:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D8D16C5;
	Tue,  2 Mar 2021 10:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D8D16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676411;
	bh=VWaISLBMGmXjCJiLAn15tAf5haSoI3FsT+kdMLptSMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=InBNw3BFfsjkt6yRJm4g7uwOqwq92W5rSqr8evW9SGifFxWzmdtf0bUobF6dtQGdc
	 KdRMGabA2GR0jDUlpqV+F0YqkSFoCmcPbM8rnLOHi2jK8RzwUXOpl7C1natQF93wE1
	 1Ibx3XNzjuzufX2KmvNMBwLUAQ/1FatzYqa8SuXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB1BF80088;
	Tue,  2 Mar 2021 10:11:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 413C1F8032B; Tue,  2 Mar 2021 10:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ACB9F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ACB9F80088
IronPort-SDR: 1mhHp3DdyGOOb8Sk8/9HApffRrkSqgjLx2DeKGsezNCm/bd2J6TO762cdn0zZnkm5O4XOkzh67
 l9cvAqOcMc+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158717"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:36 -0800
IronPort-SDR: n6rOxNeDk1fm2YpeOv7OWrCG3cuj95pZ2h5aet+R9VvYX6DPRZJEJJBpfyX3CSj64yp5wyVWgA
 g3Kdi3K7SNBw==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262265"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:34 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 02/11] soundwire: bus: test read status
Date: Tue,  2 Mar 2021 17:11:13 +0800
Message-Id: <20210302091122.13952-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
References: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

In the existing code we may read a negative error value but still mask
it and write it back.

Make sure all reads are tested and errors not propagated further.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 46885429928a..129e2afbe98e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -875,8 +875,12 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
 		if (wake_en)
 			val |= SDW_SCP_SYSTEMCTRL_WAKE_UP_EN;
 	} else {
-		val = sdw_read_no_pm(slave, SDW_SCP_SYSTEMCTRL);
-
+		ret = sdw_read_no_pm(slave, SDW_SCP_SYSTEMCTRL);
+		if (ret < 0) {
+			dev_err(&slave->dev, "SDW_SCP_SYSTEMCTRL read failed:%d\n", ret);
+			return ret;
+		}
+		val = ret;
 		val &= ~(SDW_SCP_SYSTEMCTRL_CLK_STP_PREP);
 	}
 
@@ -895,8 +899,12 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 	int val;
 
 	do {
-		val = sdw_bread_no_pm(bus, dev_num, SDW_SCP_STAT) &
-			SDW_SCP_STAT_CLK_STP_NF;
+		val = sdw_bread_no_pm(bus, dev_num, SDW_SCP_STAT);
+		if (val < 0) {
+			dev_err(bus->dev, "SDW_SCP_STAT bread failed:%d\n", val);
+			return val;
+		}
+		val &= SDW_SCP_STAT_CLK_STP_NF;
 		if (!val) {
 			dev_info(bus->dev, "clock stop prep/de-prep done slave:%d",
 				 dev_num);
-- 
2.17.1

