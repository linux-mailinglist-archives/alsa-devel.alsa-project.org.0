Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66F7DF2E0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00FE5850;
	Thu,  2 Nov 2023 13:51:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00FE5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929567;
	bh=2Jk5sSELW2UtGc8oy2c3BEUMoFErB30cR8Wv/CjzPcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JjezNzKNNLylbOz2B1j//kiFPBgGVO2F0H4C74UKNGTyrHIwX+u63nNH0iNeaHtF5
	 ywMH/LjHkTtvUshdgvRjdcMj8oCcRshFzmrPkfooo1rc7ZcNnFiPwratmyOvBqhTh/
	 l4DL8dIqpR6qVMpFJFe9Fzlx3G6NdIZ9v+sBM46Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17F2FF8062F; Thu,  2 Nov 2023 13:47:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A70DEF80623;
	Thu,  2 Nov 2023 13:47:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76945F805FB; Thu,  2 Nov 2023 13:47:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEFABF8020D
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEFABF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LBtpJd30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929235; x=1730465235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Jk5sSELW2UtGc8oy2c3BEUMoFErB30cR8Wv/CjzPcE=;
  b=LBtpJd30j7mwm2YKBAmg9hCRuz/5qPD3zu3n9n7vaBiIBSboiCVk8rGk
   yWEA/rjkNWOF6yJ/2MX/MptvxwAJG5Ko3pHU3KnyDUBTENCNoxL1S+AGe
   gufyajTv6H1zK92qdE3oUeG/VDr0WGmUDvjJ1rUYDWRaMpiaSybazO3KM
   WlEo3vpiNh0OLS5Oevf4f/zmiW0spUM5/pRrDRS3oXB2O5Qw/8Kr4kyxv
   O7w/l4BqvKFCdGERl5sx5FtBlvfcO/0WN/ChKmukDN6dArVIJUrkDX+Xp
   qqbdOgCmpCd7JcTmJVlfxkGl7GCeKrYvbCdUB+nq3yuLWXsNqk0BQCZyO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343494"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343494"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454744"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454744"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:10 -0700
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
Subject: [PATCH 05/17] ASoC: Intel: avs: i2s_test: Add proper id_table
Date: Thu,  2 Nov 2023 13:47:00 +0100
Message-Id: <20231102124712.2549327-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DXBHUDICV376GEZDFNW53S2MYADJCF37
X-Message-ID-Hash: DXBHUDICV376GEZDFNW53S2MYADJCF37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXBHUDICV376GEZDFNW53S2MYADJCF37/>
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
 sound/soc/intel/avs/boards/i2s_test.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 3d03e1eed3a9..28f254eb0d03 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -185,15 +185,23 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_i2s_test_driver_ids[] = {
+	{
+		.name = "avs_i2s_test",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_i2s_test_driver_ids);
+
 static struct platform_driver avs_i2s_test_driver = {
 	.probe = avs_i2s_test_probe,
 	.driver = {
 		.name = "avs_i2s_test",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_i2s_test_driver_ids,
 };
 
 module_platform_driver(avs_i2s_test_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_i2s_test");
-- 
2.34.1

