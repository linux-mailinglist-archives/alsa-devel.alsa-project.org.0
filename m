Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA426C4136
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 04:41:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855A8825;
	Wed, 22 Mar 2023 04:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855A8825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679456510;
	bh=RJz7FcUe9hColoZIPnIl1BZwjUCTD5+hSuVxXnTu59g=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lok0Femb9diVIlG4bo7eQ47i9Jgcp+wIO0ZKpp6WC2klsM2gdb6tMPfW/S1TjDd19
	 aF+zEa59UWFg9+t2+bpHIey4gPb9I3htst3ZSVFSWCxXyq2w9kmYgAK9HBeQhPM0by
	 8mIJORyhCy3uo6bzm2ufgqcP7ZKsJIysEOjhP5jA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97E52F80254;
	Wed, 22 Mar 2023 04:40:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E79E9F80482; Wed, 22 Mar 2023 04:40:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6CF5F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 04:40:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6CF5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O+WX4I1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679456449; x=1710992449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RJz7FcUe9hColoZIPnIl1BZwjUCTD5+hSuVxXnTu59g=;
  b=O+WX4I1DnYzqlaeZt6ehDDAMAHRatwBXpyS4kGoBHRsQ9ebnv89b7nN0
   jdwmht4H8TGXIuqf9hTSjSe2f4+w68slnjLCOA8Kuu++efnlvOqxssNLK
   RP3UJOSmcM2HgT9BBBCpiMnza8eFTc+eTmEyR0n4JnNO1c+2uC4tsbsQ+
   1R1QHB8Aq7YWdKN16IJANmJ1MaXImDOcFmYc4S67vO5Zs9oYg9Hn8uFb8
   XxtLUwDn5y4BlbXselDCYvvnReAVeNdB3au5MVVa4dbfeagNbll8UgwQS
   9VcQwwQ85al2rk2qHBA5sPh/1kKhTlxlh9Uk6gEMZ+Ytjis1vUVgS3xaU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404002937"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="404002937"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 20:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792377967"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="792377967"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 20:40:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/2] soundwire: stream: remove bus->dev from logs on
 multiple buses
Date: Wed, 22 Mar 2023 11:55:23 +0800
Message-Id: <20230322035524.1509029-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322035524.1509029-1-yung-chuan.liao@linux.intel.com>
References: <20230322035524.1509029-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y3WITODAJY3HTF2DJM72ZKWNDXA5J5LG
X-Message-ID-Hash: Y3WITODAJY3HTF2DJM72ZKWNDXA5J5LG
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3WITODAJY3HTF2DJM72ZKWNDXA5J5LG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

A stream may depend on multiple managers/buses, e.g. for the multiple
amplifier case. It's incorrect to use bus->dev in this case.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 136b6850a3f0..f903394ff2cf 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
+		pr_err("Bank switch failed: %d\n", ret);
 		goto restore_params;
 	}
 
@@ -1497,7 +1497,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
+		pr_err("Bank switch failed: %d\n", ret);
 		return ret;
 	}
 
-- 
2.25.1

