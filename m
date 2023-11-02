Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666DB7DF2C9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 13:50:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF857A4D;
	Thu,  2 Nov 2023 13:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF857A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698929420;
	bh=s5Tgqm5Ke6cfCMbynqvLX7TRjId+ANbr1kFf4zGCERA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OyyGCfGtXVWB553UWxxk7qddwlwCK/hJHa7gzTPSXarzuesfMSJtv39ZkSOtmFIqK
	 jBo4WbSNKQTQ1TU1kZ84CoRcV4H71mcq7oMEzEk5cQVedRybhmgkKUlR+ECbs7F4J+
	 bC0jUGZPDe7ctMEHF2JxKyhv+cV4jQGe4fPA9ezU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69FA2F805C2; Thu,  2 Nov 2023 13:47:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E805F805C2;
	Thu,  2 Nov 2023 13:47:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 857B6F80494; Thu,  2 Nov 2023 13:47:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34C26F80290
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 13:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34C26F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sq+q0HN3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929241; x=1730465241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s5Tgqm5Ke6cfCMbynqvLX7TRjId+ANbr1kFf4zGCERA=;
  b=Sq+q0HN3GyjSAgZxdLh9AmfrFDtPuZU7EJ/ELBAx68UBw04z2wibkjd0
   waHXkqexuRpWHMMd2XSE7o5najo2//MY0MSzShx6xpi/5zauAl37XCmqr
   A/CZJFJRR3jprUnNoRkEVMQPz4ZukSb9i7TJNSrhdrW0oGv9sPv0qqaw/
   YA6y3VthOPd2RcUSzdwUFD4aVvVEjyZ14vMRaPkqvtlBVVJhKKtQBx3ob
   kFw/+ZzWKc7XDRj33p38RoGgsvaxslb+sJccLYCX7LmHbXs0Y5ZwgQ5lZ
   f+nF0n2LJ2T4SibmEitMmNhoD4eddFVMJxF3L5C5jolFPCN/CnRhmL3CD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343515"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="7343515"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 05:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454762"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200";
   d="scan'208";a="1008454762"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:16 -0700
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
Subject: [PATCH 08/17] ASoC: Intel: avs: max98927: Add proper id_table
Date: Thu,  2 Nov 2023 13:47:03 +0100
Message-Id: <20231102124712.2549327-9-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PIL3DKZWTPRQJAYLVJKMUPWXMZZ6T6EE
X-Message-ID-Hash: PIL3DKZWTPRQJAYLVJKMUPWXMZZ6T6EE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIL3DKZWTPRQJAYLVJKMUPWXMZZ6T6EE/>
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
 sound/soc/intel/avs/boards/max98927.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index fb0175f37d61..86dd2b228df3 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -189,15 +189,23 @@ static int avs_max98927_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct platform_device_id avs_max98927_driver_ids[] = {
+	{
+		.name = "avs_max98927",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_max98927_driver_ids);
+
 static struct platform_driver avs_max98927_driver = {
 	.probe = avs_max98927_probe,
 	.driver = {
 		.name = "avs_max98927",
 		.pm = &snd_soc_pm_ops,
 	},
+	.id_table = avs_max98927_driver_ids,
 };
 
 module_platform_driver(avs_max98927_driver)
 
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_max98927");
-- 
2.34.1

