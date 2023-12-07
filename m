Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A0809565
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30B7BC0;
	Thu,  7 Dec 2023 23:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30B7BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988344;
	bh=uiyA/2gfS2gL3oHUJD4rZf2zZF4q2znJkQE1RjzObzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iYuBiHcGaeVzKg3cQPr1qSQDqT3A2LZES1pX/fixtaRS940NgEqRSXcuwQgCZxk1y
	 fqFGzpMP27ukXRg7CeYcDjHWDPoveekNfPe/CV0eVc4pGT+uvCIYx9AxkwSOr5gA8z
	 xpzTqbvY3SBVpFzESIQvtkWozUDLuFifY0uJGHhg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A603F8068A; Thu,  7 Dec 2023 23:30:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81CA3F80656;
	Thu,  7 Dec 2023 23:30:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9070F8061A; Thu,  7 Dec 2023 23:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90330F802BE
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90330F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BXJdbNv1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988220; x=1733524220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uiyA/2gfS2gL3oHUJD4rZf2zZF4q2znJkQE1RjzObzE=;
  b=BXJdbNv1t9homC3GYc558atsShDnRgy/PppLlV775opCMRhcbgg57HbG
   ASLenOLWPlcq8DZvPEPNOLAQichdArpo+r4FpcaJxOfMGm3UdekX7bMbo
   mRuupmAxrfUGddaVOPv9CfIMiJMYbWWOfkCMM97nMlvrnGubB1XXWi4Wv
   xroB6PhJmB0HaqCm4oocSJKfuLq6fWI2u3YUQX5qwZzmqoLhWzM11DIGb
   gnRVrvlVM5n1T0RK22r23OkyCnwmiFf4RoUPx1N6BnyQLxi2IH5I56Sun
   4LwMTqjeLZFs3cpK36UHXGE2OJ3dMLRJQ+zMpGkRxqL5TlylEgZzqbhuO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516645"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516645"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307487"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307487"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
Date: Thu,  7 Dec 2023 16:29:36 -0600
Message-Id: <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HAAIYMBOJDJ7RYHNMB5DNFHI2DKHI34Y
X-Message-ID-Hash: HAAIYMBOJDJ7RYHNMB5DNFHI2DKHI34Y
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAAIYMBOJDJ7RYHNMB5DNFHI2DKHI34Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a convenience pointer to the 'sdw_bus' structure. BPT is a
dedicated stream which will typically not be handled by DAIs or
dailinks. Since there's only one BPT stream per link, storing the
pointer at the link level seems rather natural.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index e54c5bbd2b91..8db0cd7d0d89 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -965,6 +965,7 @@ struct sdw_master_ops {
  * @stream_refcount: number of streams currently using this bus
  * @btp_stream_refcount: number of BTP streams currently using this bus (should
  * be zero or one, multiple streams per link is not supported).
+ * @bpt_stream: pointer stored for convenience.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -996,6 +997,7 @@ struct sdw_bus {
 	int hw_sync_min_links;
 	int stream_refcount;
 	int bpt_stream_refcount;
+	struct sdw_stream_runtime *bpt_stream;
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-- 
2.39.2

