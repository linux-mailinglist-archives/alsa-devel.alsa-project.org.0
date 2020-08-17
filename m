Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240A247CB9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 05:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C998E170C;
	Tue, 18 Aug 2020 05:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C998E170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597721163;
	bh=p2r1eF8KRXyXU+ruPjhakCWpOtCCxbFeppGzM1/MH08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rAFzifEOjMqK+92aomil2ajuK4vqx/dYh96Mfy6IHuRy5L16QcNZ8iJjYbezG+XCR
	 ABcTMytJugdIsOUF6VrcuKwD36yu1XfGyplygGgvJ6Gs6UNA2FNQXL851OajE9wn22
	 XwdTLi6JC6fyQTYMpMpSOd6v5qpTEgPuz8LQwmv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEF0EF802C2;
	Tue, 18 Aug 2020 05:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF87F8029A; Tue, 18 Aug 2020 05:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 547EAF800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 05:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 547EAF800D3
IronPort-SDR: NJx0uapbEjJib3rxXwh5O7Hx0oJfxIurEANmpWqMarT1EDkWWu9nK24Y+s17UHD1IenhfgDZvp
 aK7QPt3O4+9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152242998"
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="152242998"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:21 -0700
IronPort-SDR: QFetKkvHaQvpm7iSf9CEQnJI06T6FgQrV57YPu6g+hy6JJ0WTHh9VGGnsQtqcGtrrLb2MWJN/Z
 Cc5US3OUp/xw==
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="441084543"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 02/12] soundwire: intel: reset pm_runtime status during
 system resume
Date: Mon, 17 Aug 2020 23:29:13 +0800
Message-Id: <20200817152923.3259-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
References: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
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

The system resume does the entire bus re-initialization and brings it
to full-power. If the device was pm_runtime suspended, there is no
need to run the pm_runtime resume sequence after the system runtime.

Follow the documentation from runtime_pm.rst, and conditionally
disable, set_active and re-enable the device on system resume.

Note that pm_runtime_suspended() is used instead of
pm_runtime_status_suspended() so that we can deal with the case where
pm_runtime is disabled.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 85a0bb6af4fe..0e21bae3cd19 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1434,6 +1434,12 @@ static int intel_suspend(struct device *dev)
 		return 0;
 	}
 
+	if (pm_runtime_suspended(dev)) {
+		dev_dbg(dev, "%s: pm_runtime status: suspended\n", __func__);
+
+		return 0;
+	}
+
 	ret = sdw_cdns_enable_interrupt(cdns, false);
 	if (ret < 0) {
 		dev_err(dev, "cannot disable interrupts on suspend\n");
@@ -1494,6 +1500,16 @@ static int intel_resume(struct device *dev)
 		return 0;
 	}
 
+	if (pm_runtime_suspended(dev)) {
+		dev_dbg(dev, "%s: pm_runtime status was suspended, forcing active\n", __func__);
+
+		/* follow required sequence from runtime_pm.rst */
+		pm_runtime_disable(dev);
+		pm_runtime_set_active(dev);
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_enable(dev);
+	}
+
 	ret = intel_init(sdw);
 	if (ret) {
 		dev_err(dev, "%s failed: %d", __func__, ret);
-- 
2.17.1

