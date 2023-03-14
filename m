Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC16B87C6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:44:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C28D1494;
	Tue, 14 Mar 2023 02:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C28D1494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758258;
	bh=2J/lbv6Wvy/4qm3q1nHlORWUYNqsoXkS5u9Wi+zdC3Q=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ei1S7MUVus1wA5P6rleQgCV4lnjTTJncj+UMeXtWSaAeprH2CAY0GfbQv1GjacEXP
	 lWo1pqioVM6/kyqpU0qjsCYUYfWOuER4uN9Tk+P5KEyk9QHUQFssR8tJ7f0n5VJ/SR
	 i9h6ue9Gd7tKTAvxQYy1skqbglg1M0vr8M4gHbQU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D61CF80579;
	Tue, 14 Mar 2023 02:41:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A147F80552; Tue, 14 Mar 2023 02:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C234EF80534
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C234EF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MicChFg+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758087; x=1710294087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2J/lbv6Wvy/4qm3q1nHlORWUYNqsoXkS5u9Wi+zdC3Q=;
  b=MicChFg+rn04+NAp/SGG7zPdqBvgPKxDfPXG94/1Y6MeExI+5j10xChP
   4rcOWlioLe1S2PVB+QwZh/5Ox1jY8LjIsb+yvlLOW42nnffOrfHANWJfm
   n79qW02BKQJwJEdOiW9CbLi1+NSrwGox8LVEc70BJygmPpbvaNDeXwwMY
   JfvNhiqEiqYP1L2t4++XVDRqH1RiCCQGyWezGMjkApwb2ss50F0KPF7T5
   cRdvtTxmSrMX2c0oI96Ofq/h15Qu0iAMyR7VJW9OmJrN3H/xQC+DNZEaF
   0V5lUFCxsjLjo5/uAVU4NOgSoJi0ROhnd+ntpAsH/TZevtiF6KYq6h3pw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949258"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949258"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327439"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327439"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 07/16] soundwire: intel: use indirection before moving bus
 start/stop sequences
Date: Tue, 14 Mar 2023 09:54:01 +0800
Message-Id: <20230314015410.487311-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MY6HH3QY7IEZVDU2FNCVTRZVSF27EM3U
X-Message-ID-Hash: MY6HH3QY7IEZVDU2FNCVTRZVSF27EM3U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MY6HH3QY7IEZVDU2FNCVTRZVSF27EM3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There was no benefit to using the existing abstraction, but since we
are going to move the code make sure we do use the ops.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 902934cbb27b..8395a20e5739 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1311,13 +1311,13 @@ static int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
 		return ret;
 	}
 
-	ret = intel_link_power_down(sdw);
+	ret = sdw_intel_link_power_down(sdw);
 	if (ret) {
 		dev_err(dev, "%s: Link power down failed: %d\n", __func__, ret);
 		return ret;
 	}
 
-	intel_shim_wake(sdw, wake_enable);
+	sdw_intel_shim_wake(sdw, wake_enable);
 
 	return 0;
 }
-- 
2.25.1

