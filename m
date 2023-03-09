Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B826B1AD7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 06:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64DC18AA;
	Thu,  9 Mar 2023 06:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64DC18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678340197;
	bh=h4Z7o2fU92HDfcLA/HWUmcnZgpdErsjzQ5HEffu/E6A=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B9hygTq0xp1kEM9FwlNsMwZ/MppmJk+HR+hIV4I5kPpTcubwnXx1t/ecK73VroShB
	 3/La10zTabuBorBuPALnvMjhpQkrwst+uYC+E4czHp4NDHj6OoK6SYuOf1R+CU3tp8
	 7PjxW0k8wBcMHnTOe0QKOQ7h+5PW1O+iJPGgd+7c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF52EF80236;
	Thu,  9 Mar 2023 06:35:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 184F0F8042F; Thu,  9 Mar 2023 06:35:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3492DF80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 06:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3492DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VB17D/lS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678340133; x=1709876133;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h4Z7o2fU92HDfcLA/HWUmcnZgpdErsjzQ5HEffu/E6A=;
  b=VB17D/lS/kzihPA18lGibkaOgzaPGOWI6sW7XgwlJ7cUyXSvJwGG5SYt
   0ToCuB4JozrAQxXsKIPUl0beuqFPjw8m6d2rexpCLMtFYujOA53JSTipr
   ehsYV1howaSCXb1A0l3BtAm69qThK9zQYsPcXa3Acdv3OtCQluRbaVsn9
   2Mlb8UB0cGZVzovMmR/7tdgMuZ1E9xO+l2vysJuEJeDJ2KUuw6aOoJkly
   fflApI4r8L7ngeavSs9SH1xq0ZP1JpXSb7TO2f5bZQUWt9atbesL8mkm2
   bp3DFpa4KoDYG6xkkeMldWR5iZ5vTKveA155bvuJcqkUdbxY4Z8lGvSU+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335061911"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400";
   d="scan'208";a="335061911"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 21:35:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746177909"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400";
   d="scan'208";a="746177909"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 21:35:19 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: stream: uniquify dev_err() logs
Date: Thu,  9 Mar 2023 13:49:05 +0800
Message-Id: <20230309054905.21507-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6VXZPSTCD7IPNS6STLVFGDVVX2Y7JUZX
X-Message-ID-Hash: 6VXZPSTCD7IPNS6STLVFGDVVX2Y7JUZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VXZPSTCD7IPNS6STLVFGDVVX2Y7JUZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There are a couple of duplicate logs which makes harder than needed to
follow the error flows. Add __func__ or make the log unique.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 2e39587ed1de..dd09855caac9 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
+		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
 		goto restore_params;
 	}
 
@@ -1477,7 +1477,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d\n", ret);
+			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
 			return ret;
 		}
 
@@ -1497,7 +1497,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
+		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
 		return ret;
 	}
 
@@ -1567,14 +1567,14 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d\n", ret);
+			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
 			return ret;
 		}
 	}
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		pr_err("Bank switch failed: %d\n", ret);
+		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
 		return ret;
 	}
 
@@ -1664,7 +1664,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d\n", ret);
+			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
 			return ret;
 		}
 	}
@@ -1893,7 +1893,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 
 	m_rt = sdw_master_rt_alloc(bus, stream);
 	if (!m_rt) {
-		dev_err(bus->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
+		dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
+			__func__, stream->name);
 		ret = -ENOMEM;
 		goto unlock;
 	}
@@ -2012,7 +2013,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 */
 	m_rt = sdw_master_rt_alloc(slave->bus, stream);
 	if (!m_rt) {
-		dev_err(&slave->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
+		dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
+			__func__, stream->name);
 		ret = -ENOMEM;
 		goto unlock;
 	}
-- 
2.25.1

