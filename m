Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED407DF2D2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC3B829;
	Thu,  2 Nov 2023 13:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC3B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929483;
	bh=xValfF4gzdEVDSQ3x1QuNQY2nw9XNZbWfDc7OIw4BdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nSm/R869MzS0yGNj5uryyfr1S+UJdF5xUcz0F+Qcgqi98TKUSh6Q8YSu/JcRU6X7U
	 1QzsUd6pfCLMd9l1mFAjzjkXXyFKpYrURyyEJBL83BqO8bxAccgIkgQ3r6AZKVXjCo
	 Mh/g1Q/mO0JIpghxOf44NzmSKFNe29jQJ0kuG3oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACEBFF805F4; Thu,  2 Nov 2023 13:47:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE70F805D6;
	Thu,  2 Nov 2023 13:47:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF8E8F805BB; Thu,  2 Nov 2023 13:47:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AE26F80580
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE26F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T+eoQUzL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929249; x=1730465249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xValfF4gzdEVDSQ3x1QuNQY2nw9XNZbWfDc7OIw4BdA=;
  b=T+eoQUzLwJnnHZvME3pX2xVttxpbxnBN++F+qbb781Oe/OO4vFW7zvPe
   ri8oJ5Z8mUxtMj2BPFPjpSjI00ETe45eLAiIZbuVIZFPIL6b059fa+vbw
   gCnlL3LA3zc3M44s42XbI6+7D7cU3SpEH1h/2Hy2QP0rf2Fp0r468uAvf
   m04e2iqRVbwr+frm03qsaaazr2vGD79AtH1vonUSlEqeMCH0l45HfFrIr
   7zQk5ZNN4A9SzD153WCyIH8KhKr2d2Rc5e4zGSwCDO8BunfCBw2i4B9Zo
   vKaM5+BUBulQdKtY9h8ww9rrWavsujVAPSjzI5QjY8x6voy7pq4gq7nw7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343540"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343540"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454779"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454779"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:24 -0700
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
Subject: [PATCH 12/17] ASoC: Intel: avs: rt286: Add proper id_table
Date: Thu,  2 Nov 2023 13:47:07 +0100
Message-Id: <20231102124712.2549327-13-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TA5IT3SQHA5Q2JOH57DC2MFJAHMUFLCL
X-Message-ID-Hash: TA5IT3SQHA5Q2JOH57DC2MFJAHMUFLCL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TA5IT3SQHA5Q2JOH57DC2MFJAHMUFLCL/>
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
 sound/soc/intel/avs/boards/rt286.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 131237471e3e..28d7d86b1cc9 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -228,15 +228,23 @@ static int avs_rt286_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_rt286_driver_ids[] = {
+	{
+		.name = "avs_rt286",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt286_driver_ids);
+
 static struct platform_driver avs_rt286_driver = {
 	.probe = avs_rt286_probe,
 	.driver = {
 		.name = "avs_rt286",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_rt286_driver_ids,
 };
 
 module_platform_driver(avs_rt286_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt286");
-- 
2.34.1

