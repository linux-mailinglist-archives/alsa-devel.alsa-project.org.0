Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5157DF2DA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:52:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F3A6DF6;
	Thu,  2 Nov 2023 13:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F3A6DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929520;
	bh=SJW6lBx399mcw2ZSYof4RhJVNWp96jmaEq/tXtC7eHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HoxVMjdhRzcHWN/m2et3PWw6BS1U/mRvXvaUFUZtbTCakxmO3I8DZIawdalEFAhAn
	 +/ZcvBCemoZae7t5oNNLsH+/49BQDrOWpcetSh7k/ptO0wDAOEACXRvQt8DNob3a5+
	 hUnbyBYBULAR3PQxXp/4KcbCiIerzZYyZNsWSV8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20D9EF8060A; Thu,  2 Nov 2023 13:47:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD15F80603;
	Thu,  2 Nov 2023 13:47:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2482F805D5; Thu,  2 Nov 2023 13:47:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 302C7F805AC
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302C7F805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e0ouZI+N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929253; x=1730465253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SJW6lBx399mcw2ZSYof4RhJVNWp96jmaEq/tXtC7eHI=;
  b=e0ouZI+N7Znop+64V4cusKwem/+gsPCjPHf0aQSklXh0k/UZ347tIuxg
   quPfbZsbkFTVGNVAreLddoTrk7bFpPRbQBrS/2jSFaqELNP/7Av2xSE0F
   5msfexIPMMqhT5YUnjc/dIwiKz1p6iwowI+2XS7GoE9U+Z0qVj+IDOF9/
   01KndtJi2IyVoJV3lxTcbbwXBP4eMoUupQu3i0hv9u87kU4ZxRvb+sW2Y
   3rcvLJ9NMlJ3FXQWcMeFCjwQ8h880QjrBF8D/phCnu/RhoiMXQdnlA57+
   KGt1Kyf/97RW64f5+6AS3h6b+sQ3Wb8F9c78Bg+TlRMPeMvdYhWOeZYbP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343557"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343557"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454789"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454789"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:28 -0700
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
Subject: [PATCH 14/17] ASoC: Intel: avs: rt5514: Add proper id_table
Date: Thu,  2 Nov 2023 13:47:09 +0100
Message-Id: <20231102124712.2549327-15-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D5GF5AZVTEIX7QTNWW2IU75GHKGDUAXH
X-Message-ID-Hash: D5GF5AZVTEIX7QTNWW2IU75GHKGDUAXH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5GF5AZVTEIX7QTNWW2IU75GHKGDUAXH/>
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
 sound/soc/intel/avs/boards/rt5514.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index ad486a52e5e3..60105f453ae2 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -173,15 +173,23 @@ static int avs_rt5514_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_rt5514_driver_ids[] = {
+	{
+		.name = "avs_rt5514",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt5514_driver_ids);
+
 static struct platform_driver avs_rt5514_driver = {
 	.probe = avs_rt5514_probe,
 	.driver = {
 		.name = "avs_rt5514",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_rt5514_driver_ids,
 };
 
 module_platform_driver(avs_rt5514_driver);
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt5514");
-- 
2.34.1

