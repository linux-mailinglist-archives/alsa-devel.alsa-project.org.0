Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6247561FA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 13:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB52E7D;
	Mon, 17 Jul 2023 13:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB52E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689594527;
	bh=UOOBboRnoIn8mVvP0YxfVCBDeGLPBTS7tfhdQxOuA4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UdpDGDdWscfxoI5w34DHiOMqrdl3M5wxxYTKSkrhb0lgx/QDyo//dTc23WqTp02Li
	 e93zmJlX3AFfwu9CZ5SVK8T+dgX/CqQyHwwiTNnMBT6kfy91E+KC6zN2Ei6lm3B+Bc
	 dk9bf6TC7/N2LMotTdn5SdcA7wSCzb+3cpSyS3oY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74294F805D7; Mon, 17 Jul 2023 13:46:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE17BF805C9;
	Mon, 17 Jul 2023 13:46:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 823B6F8057C; Mon, 17 Jul 2023 13:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5058F80494
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5058F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UrkMG4VD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689594332; x=1721130332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UOOBboRnoIn8mVvP0YxfVCBDeGLPBTS7tfhdQxOuA4M=;
  b=UrkMG4VDxDiqpVTUpWA9lOFohz9h744JfEvHqNySpGMKyvIi5mQwyKZV
   X0qnGgg4yXvn6KMfCuqnlT0JWmIJ7qMPOYAK1Dk4PEaVWhKVm1C19rzNY
   E2wsZ66Jdln+vVXC7f4dGdMhc71JgQVWp875T4bp4PjdQz94lDexo46y4
   RrWsv9Tgt/o7aA3XVSMK5Fxgd/mOTaJTVKEGbH+LnhA7eV2ulA8grGaSH
   ZhK/JkFYEYd6ygv/xenBb9DuTwqiOTN2xDqob8LG2JkeOFYE0Lj/1krDo
   LsOwwXx9OytBeLYNXQICaK+oNvKRbSLN9VUKgeaMtxLmveZk7W+7I55JT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="363372775"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="363372775"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969856489"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="969856489"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 04:45:27 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 03/15] ASoC: SOF: Remove unused Broxton PCI ID
Date: Mon, 17 Jul 2023 13:44:59 +0200
Message-Id: <20230717114511.484999-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G7SICNMEFQFHAGVH6HIWIBAQ3LSPDVTX
X-Message-ID-Hash: G7SICNMEFQFHAGVH6HIWIBAQ3LSPDVTX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7SICNMEFQFHAGVH6HIWIBAQ3LSPDVTX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current code references 0x1a98 which is BXT-M (not -T as it is
commented) and it's an RVP, BXT-M B0 to be specific. From what we know
no BXT is available on market.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/hda/intel-dsp-config.c  | 7 -------
 sound/soc/sof/intel/pci-apl.c | 2 --
 2 files changed, 9 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 317bdf6dcbef..5cee995f7a42 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -53,13 +53,6 @@ static const struct config_entry config_table[] = {
 		.device = 0x119a,
 	},
 #endif
-/* Broxton-T */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
-	{
-		.flags = FLAG_SOF,
-		.device = 0x1a98,
-	},
-#endif
 /*
  * Apollolake (Broxton-P)
  * the legacy HDAudio driver is used except on Up Squared (SOF) and
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 69cad5a6bc72..bc3ad64baec5 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -87,8 +87,6 @@ static const struct sof_dev_desc glk_desc = {
 static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0x5a98), /* BXT-P (ApolloLake) */
 		.driver_data = (unsigned long)&bxt_desc},
-	{ PCI_DEVICE(0x8086, 0x1a98),/* BXT-T */
-		.driver_data = (unsigned long)&bxt_desc},
 	{ PCI_DEVICE(0x8086, 0x3198), /* GeminiLake */
 		.driver_data = (unsigned long)&glk_desc},
 	{ 0, }
-- 
2.34.1

