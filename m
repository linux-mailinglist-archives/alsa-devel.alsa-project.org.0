Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8FF7DF2C1
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:49:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79BCC850;
	Thu,  2 Nov 2023 13:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79BCC850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929389;
	bh=CIymP4g4pLFXIZ5O3229NLCZFEilr9Tc3XyWgkrTnhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bnCRD4h9qmtVbtrUfszTqRDhj+qgZuWf1b+8nt01zbiPMB4sUCoctXR4CXNhHLxju
	 TctJvhWqiWl3Q9NieF/yYSUAxLvesE8/446WE4LbcwC3vVNDviL6U0/KBPZokvq7oq
	 OY/dqWAFZ5uyrHznkbWoEc3i0VXAeESeARO0Rl8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23433F805BF; Thu,  2 Nov 2023 13:47:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A4E8F805B0;
	Thu,  2 Nov 2023 13:47:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F34F80537; Thu,  2 Nov 2023 13:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0D7EF80290
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D7EF80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gcmemGYA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929231; x=1730465231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIymP4g4pLFXIZ5O3229NLCZFEilr9Tc3XyWgkrTnhA=;
  b=gcmemGYAKgb8bZulAaNPkaHiYKveFoUtJ979TUv5qEcunVSV5/AW8rvC
   30WCXgchRAQzmR9Bkmi6APROB6Z+pm2d3ZpOteSp17T478t6buXJToA3f
   p865AEuKb8KpBnW6KwdReYn9PV9J7KcYeunyRQJ1KEVAu4CoTwghCACZP
   JmxAWva3fKSYDswxCAX70Bj49x62GXJ8btUwP+8pXxFKsYXCPQQlMwxYB
   vJLTSrBznVKpyNwJeTpa920oCazqc8U9he1f2lU+UuSRizJGv5P0lQ/ck
   1b23sDs2MF9yUScz9yDLR6qkvFizEB5NotV8g7wGv6AnlzVwf1UjWU5NU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343479"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343479"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454728"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454728"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:04 -0700
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
Subject: [PATCH 02/17] ASoC: Intel: avs: dmic: Add proper id_table
Date: Thu,  2 Nov 2023 13:46:57 +0100
Message-Id: <20231102124712.2549327-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L7WDWNZ57M6JNBIKEQCRAV6NCZV7UHX2
X-Message-ID-Hash: L7WDWNZ57M6JNBIKEQCRAV6NCZV7UHX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7WDWNZ57M6JNBIKEQCRAV6NCZV7UHX2/>
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
 sound/soc/intel/avs/boards/dmic.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index c270646faf86..ba2bc7f689eb 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -77,15 +77,23 @@ static int avs_dmic_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_dmic_driver_ids[] = {
+	{
+		.name = "avs_dmic",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_dmic_driver_ids);
+
 static struct platform_driver avs_dmic_driver = {
 	.probe = avs_dmic_probe,
 	.driver = {
 		.name = "avs_dmic",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_dmic_driver_ids,
 };
 
 module_platform_driver(avs_dmic_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_dmic");
-- 
2.34.1

