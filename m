Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7178225A3C1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 05:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E9717B9;
	Wed,  2 Sep 2020 05:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E9717B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599015936;
	bh=hagcKcLRa2aSAj26hDePR792qXZ56u6eyook9AvGge0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBX0HZH4G00HdfmodpIl5xdYkN6MoNzhZ0Sx240+9RBjrEOClgtvtcxqfgOUUlK0Z
	 gG5QRtbfZnBIA+WOrxpVcaTfCHj80lkpc3B61ecz4TjvbqQvZSmapo4RoIPznEq6Ng
	 Yt2ieeBSitQQlKTcfKHr1NbM9jTNkSVutPOOHX/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE8E4F80317;
	Wed,  2 Sep 2020 05:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7058CF802D2; Wed,  2 Sep 2020 05:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CC6BF80276
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 05:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC6BF80276
IronPort-SDR: a9a9HhruDom6R4NhEUJsaZYbnOfHZQMWhlnsoaiuKUpMP5lUtja76MtxXQ+UV5oCTy+OEGgq/e
 G2DrFRReuvyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156570759"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="156570759"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:59:59 -0700
IronPort-SDR: rcN5K088Nt+PHXwuEobRqiOjwrhP7Ui2uAlCwbs5vFNhaKDCvU+840R4QObVqBbi7K4KQwwrUp
 Za/1Gxszdwkw==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="283588096"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:59:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 05/10] soundwire: bus: update multi-link definition with hw
 sync details
Date: Tue,  1 Sep 2020 23:05:51 +0800
Message-Id: <20200901150556.19432-6-yung-chuan.liao@linux.intel.com>
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

Hardware-based synchronization is typically required when the
bus->multi_link flag is set.

On Intel platforms, when the Cadence IP is configured in 'Multi Master
Mode', the hardware synchronization is required even when a stream
only uses a single segment. The existing code only deal with hardware
synchronization when a stream uses more than one segment so to remain
backwards compatible we add a configuration threshold. For Intel cases
this threshold will be set to one, other platforms may be able to use
the SSP-based sync in those cases.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 76052f12c9f7..9adbe4fd7980 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -827,6 +827,11 @@ struct sdw_master_ops {
  * @multi_link: Store bus property that indicates if multi links
  * are supported. This flag is populated by drivers after reading
  * appropriate firmware (ACPI/DT).
+ * @hw_sync_min_links: Number of links used by a stream above which
+ * hardware-based synchronization is required. This value is only
+ * meaningful if multi_link is set. If set to 1, hardware-based
+ * synchronization will be used even if a stream only uses a single
+ * SoundWire segment.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -850,6 +855,7 @@ struct sdw_bus {
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
 	bool multi_link;
+	int hw_sync_min_links;
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-- 
2.17.1

