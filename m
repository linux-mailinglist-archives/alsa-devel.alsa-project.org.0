Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4E720A44
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EFF884A;
	Fri,  2 Jun 2023 22:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EFF884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737666;
	bh=4A35xjWsuBxwMXk+KLiyyAYSdWjZ5AaodTGErFz3BhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CTzwhrGfNjahqFe+mmPdq0mkB1GqSqdQrPxGWaw4JgJHqtUG14wEgT6n03HLhB0v5
	 mBLLPiWxNieeAoPrhFORhoCjKsQrwHbpTzvKww/M4osdfGnyT3Q/Ej+RGOPhRwQ2Xf
	 O+HTIhWQhqaDy+qYU4yEBCE9ejROXyNTbQP4HoRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 703E6F80616; Fri,  2 Jun 2023 22:24:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57389F8060C;
	Fri,  2 Jun 2023 22:24:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CC8DF805F0; Fri,  2 Jun 2023 22:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96FBDF800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96FBDF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VCXMfQN+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737393; x=1717273393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4A35xjWsuBxwMXk+KLiyyAYSdWjZ5AaodTGErFz3BhE=;
  b=VCXMfQN+o6oYTXvSnEPpBjNZOgvZpgtRT9+nZr7+rzLMu/tGAT3VB1ow
   W0alYjPPBb8ZdC2MLvzk3szmVcQQI7fJAUfbIi+itJr2KCrvdIoPsZFIa
   iNgkUBk3LhVZJP4jXkECQ/2Y/yTyg4UEFLkVs6p4Mlvze8JnswpMXfVYH
   34dmmQBygncY+BmsQXr93oEqUyFrkiIktq3e0mgZqmCO5ht8w9bUFlMrM
   Qt9EI8n44zxOd/KPYVdKgKmdBTu15VYdno78Lg/0FCGYndT1mlVwrHlcH
   LuY8vSROvxTKAzu1PMNOP5q7XsSbhI/L/upnZ+JU3W4e1R59iRA9AYLps
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811283"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811283"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020030"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020030"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 18/28] ASoC: Intel: sof-sdw: add Dell SKU 0B34
Date: Fri,  2 Jun 2023 15:22:15 -0500
Message-Id: <20230602202225.249209-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4RREWTJVGIAVMXHBQ7TRNEVW6UOYUXWJ
X-Message-ID-Hash: 4RREWTJVGIAVMXHBQ7TRNEVW6UOYUXWJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RREWTJVGIAVMXHBQ7TRNEVW6UOYUXWJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This device has no 3.5mm jack, only a single amplifier and mic codec.

Closes: https://github.com/thesofproject/linux/issues/4399
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 582f8e908e8c..50e672caccb3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -376,6 +376,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B34"),
+		},
+		/* No Jack */
+		.driver_data = (void *)SOF_SDW_TGL_HDMI,
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.37.2

