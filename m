Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6142487E2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:39:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB4B1779;
	Tue, 18 Aug 2020 16:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB4B1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761581;
	bh=hagcKcLRa2aSAj26hDePR792qXZ56u6eyook9AvGge0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GC9iXIyraoTk6i7/EdVR+T49sIJKlKGpZgt3geYIPfYTFagW91yYAnj2/iJ0QTEka
	 NsX/+3vyHOmZsvsfm0+1YG/hQejlwvOkiYZo4n8kK3J4fmpoZfh7HCoBXrALzz/QU1
	 YH6jPV4ofOrYsHhbYD+E3QMysg+NzjwBN6x/a8aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3E95F802E8;
	Tue, 18 Aug 2020 16:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78537F802E3; Tue, 18 Aug 2020 16:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2D64F80273
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D64F80273
IronPort-SDR: A5j8BYJd4i8/u1ix21NWcLcCgUOiwyoWqnqwyn0qbbWwc3X9lgvF9IOaWTBNHE4fkgp9Gdcjew
 ZMwjtlqGKDCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223509"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223509"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:35 -0700
IronPort-SDR: bVvdkknJA7bew7unweNqBq/BQ40Wtel/+Vm/lilbQhrFnelOxHyOfDvOHewpfnWcvaerzbrdZj
 IOZP6Q6YFEpg==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830550"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 05/11] soundwire: bus: update multi-link definition with hw
 sync details
Date: Tue, 18 Aug 2020 10:41:14 +0800
Message-Id: <20200818024120.20721-6-yung-chuan.liao@linux.intel.com>
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

