Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF787DF2B9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:49:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51976886;
	Thu,  2 Nov 2023 13:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51976886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929346;
	bh=pvx2Tsy/xYO/RWmsBHWxJQY1Zl9TLuaqfX0Rk0bqjOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vKFgn1ctGkuR5ELol4oHslQ+3vq/yayy+1kyC2qtkaQ8XAvdsSTK419g6JqcOLXsK
	 IHL7+QVFSUm2+ZogsS939J7I0EguD+Bk4RMQsbhEKgIJIhw/8HZlpIUzveLs/fd7nV
	 haXRQwSJwvuEKX/uJOIRccy1BxJqJKFS1Zm/Irjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A30AF8057D; Thu,  2 Nov 2023 13:47:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EED03F80425;
	Thu,  2 Nov 2023 13:47:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF1DF8003C; Thu,  2 Nov 2023 13:47:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66771F8003C
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66771F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iSYaZj+V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929230; x=1730465230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvx2Tsy/xYO/RWmsBHWxJQY1Zl9TLuaqfX0Rk0bqjOM=;
  b=iSYaZj+VIGzIfzuWelglZLH7sPgfSJhKTYM2Ok97QzkeR+ddVlegDS6J
   Lh4A7f5qG8VykGMaxjZmEZsawKjEFin8DH3lFf4SaimZE0RypPpPwZKs2
   BgfcuMm1v1fkJKvcGTU9cF7DRNpFZVkMhttfpq4aoRXv+1qe1/tVXljl/
   Tz7JSx0U5KSK6WPbUkp/jEfuQsCz5mGhpWgoYE3ASx2F69SUWycyP+D95
   Ws6rMFBhSEgUDtvKljV2CMFpFoV68MU2aXwKS9653iqxfHmKVQ3EjX++q
   gP4vOnKxBYD/zj6atGN8ugE8KZ0ZHT1WKk/oRFqcS5PxeU6kxXo8BMAWK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343473"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343473"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454725"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454725"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:02 -0700
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
Subject: [PATCH 01/17] ASoC: Intel: avs: da7219: Add proper id_table
Date: Thu,  2 Nov 2023 13:46:56 +0100
Message-Id: <20231102124712.2549327-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TW5DIRTAWYF4G5R6ND5XKGMYWEMXZB26
X-Message-ID-Hash: TW5DIRTAWYF4G5R6ND5XKGMYWEMXZB26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TW5DIRTAWYF4G5R6ND5XKGMYWEMXZB26/>
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
 sound/soc/intel/avs/boards/da7219.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 6060894954df..c018f84fe025 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -277,16 +277,24 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_da7219_driver_ids[] = {
+	{
+		.name = "avs_da7219",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_da7219_driver_ids);
+
 static struct platform_driver avs_da7219_driver = {
 	.probe = avs_da7219_probe,
 	.driver = {
 		.name = "avs_da7219",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_da7219_driver_ids,
 };
 
 module_platform_driver(avs_da7219_driver);
 
 MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_da7219");
-- 
2.34.1

