Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B926249A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 03:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C59CD170F;
	Wed,  9 Sep 2020 03:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C59CD170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599615808;
	bh=pKEx+ah+IYZ8/lJQCAp/1OshIjqo2pXUF201tyLEf2g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wk60axNsv9wr/F927mW0or6t1x4/bOtV2Ky3aXpfEdjAnb4T7STD43WIrmu1BWIM4
	 daoEvVW1pV/N5nDOITa+8EugEwjX/19mbonTrP556QbyGOg8ILwZ97z6ogl8hhT/D6
	 5ro63xGqI/gamHHReXWf+IYVZSmch9XjICGStLxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B19DDF802EB;
	Wed,  9 Sep 2020 03:39:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79BD7F802E2; Wed,  9 Sep 2020 03:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD73F8021C
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD73F8021C
IronPort-SDR: g7RE1VYfAJhYG9evYrbZs3ft/8o5fnlbZs/Qnriw9YOT3JW5hZ3slWy4c+DWKZfUuwIq18PpXL
 lEj6M6qpiYgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222458469"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="222458469"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:20 -0700
IronPort-SDR: 2Cjzn6LLgBB1at3OexRotIdOKNihHUHrIkcNjzsIWQ3ZxUl7HrdH7Abad1U+Hq+elZ5BrW1BOf
 rNlGltVS5uEw==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="449018106"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/7] soundwire: bus: use quirk to filter out invalid parity
 errors
Date: Tue,  8 Sep 2020 21:45:18 +0800
Message-Id: <20200908134521.6781-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
References: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
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

If a Slave device reports with a quirk that its initial parity check
may be incorrect, filter it but keep the parity checks active in
steady state.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 8 +++++++-
 include/linux/soundwire/sdw.h | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 30b0bed16630..09185e5cfd70 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1362,6 +1362,8 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	unsigned long port;
 	bool slave_notify = false;
 	u8 buf, buf2[2], _buf, _buf2[2];
+	bool parity_check;
+	bool parity_quirk;
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
@@ -1394,7 +1396,11 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 * interrupt
 		 */
 		if (buf & SDW_SCP_INT1_PARITY) {
-			if (slave->prop.scp_int1_mask & SDW_SCP_INT1_PARITY)
+			parity_check = slave->prop.scp_int1_mask & SDW_SCP_INT1_PARITY;
+			parity_quirk = !slave->first_interrupt_done &&
+				(slave->prop.quirks & SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY);
+
+			if (parity_check && !parity_quirk)
 				dev_err(&slave->dev, "Parity error detected\n");
 			clear |= SDW_SCP_INT1_PARITY;
 		}
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2b93a8ef7fad..790823d2d33b 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -358,6 +358,7 @@ struct sdw_dpn_prop {
  * @src_dpn_prop: Source Data Port N properties
  * @sink_dpn_prop: Sink Data Port N properties
  * @scp_int1_mask: SCP_INT1_MASK desired settings
+ * @quirks: bitmask identifying deltas from the MIPI specification
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -380,8 +381,11 @@ struct sdw_slave_prop {
 	struct sdw_dpn_prop *src_dpn_prop;
 	struct sdw_dpn_prop *sink_dpn_prop;
 	u8 scp_int1_mask;
+	u32 quirks;
 };
 
+#define SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY	BIT(0)
+
 /**
  * struct sdw_master_prop - Master properties
  * @revision: MIPI spec version of the implementation
-- 
2.17.1

