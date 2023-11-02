Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EEB7DF2DE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A58086F;
	Thu,  2 Nov 2023 13:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A58086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929560;
	bh=ZMR0u26l/9HghG3YmtKLFwtVnwlS/1lbLbL2kC6YwyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qQL0uc5l6pa58pj+ysB7nt0KujJC7b1edrGfXR77atrswDuzxwN3AtM1fqU28d9dV
	 +RvWZYb7lnVidc/e/lnWNpVrE4I1yVS+hax/ihMnsh38WCnMRzWkW21BbLEIgXHHLG
	 9xNAgk5BqPkjbwDMZA2jWtLyj59Mcn5k2Zi+1WxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA54F80624; Thu,  2 Nov 2023 13:47:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15316F8061C;
	Thu,  2 Nov 2023 13:47:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D238F805EF; Thu,  2 Nov 2023 13:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18F23F805D6
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F23F805D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e0YyOfbT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929258; x=1730465258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZMR0u26l/9HghG3YmtKLFwtVnwlS/1lbLbL2kC6YwyY=;
  b=e0YyOfbTim6cP+OB/pTfBIZoPLjFh6ibSrxJLS2bZr3UnK7oU5rX2is0
   hiQ6d+h3/B7AhdyLwi1pt/Ucprc13Nu2qq8S4gw3qrJYJ9nf1VvRUZiFw
   I0zuvpRZcmKmaCnSDjI751r5jbtqpyRx7XHMDSwK5dgHLRH7QQv4Rv1Od
   bnyuzLn1+z8zCnjt9fubJDqni/xXPgqPhO/tsnd0DqEkcvocQS7DoMDG/
   WED3TXIJ9CzD65v4sONcPB79Rq2yEdRQeRDnJP1AWzSLbX7Lm8bcbNtic
   Dci358PJ9pxxDHF43ImisEACc3ofnFTeRyyO1UqT5aQOPtFGyKQWFILC8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343585"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343585"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454805"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454805"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:34 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 17/17] ASoC: Intel: avs: ssm4567: Add proper id_table
Date: Thu,  2 Nov 2023 13:47:12 +0100
Message-Id: <20231102124712.2549327-18-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 37LFZUCQG4NJVAIAALQC6YRH2TRAIP2V
X-Message-ID-Hash: 37LFZUCQG4NJVAIAALQC6YRH2TRAIP2V
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37LFZUCQG4NJVAIAALQC6YRH2TRAIP2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add id_table and use it instead of alias to load module.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/ssm4567.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 6bcab9deae5c..4a0e136835ff 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -181,15 +181,23 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_ssm4567_driver_ids[] = {
+	{
+		.name = "avs_ssm4567",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_ssm4567_driver_ids);
+
 static struct platform_driver avs_ssm4567_driver = {
 	.probe = avs_ssm4567_probe,
 	.driver = {
 		.name = "avs_ssm4567",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_ssm4567_driver_ids,
 };
 
 module_platform_driver(avs_ssm4567_driver)
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_ssm4567");
-- 
2.34.1

