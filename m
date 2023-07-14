Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9603475391B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 12:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3E9AE73;
	Fri, 14 Jul 2023 12:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3E9AE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689332385;
	bh=Gt1bM8Q/FD2VIOVF2wWpS3Dslq5MDz04LTOzsoLpYFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C+dJ8LG1Cew+yEncZN5QrhpkJBbz7ey48UO18OQO1O58NobKFpw8xn6vElBjqVspb
	 2e9yDTlx+dqWfovyZ0uE0e5+wlIFuvtzlSp7/g6HEQndIPVG7VZ353j2NyOGVJ/q3e
	 ABakVEQwsN005vVIE6Z0U5EUPS52EFEreVD849ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8AEEF805F9; Fri, 14 Jul 2023 12:56:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D96F805F3;
	Fri, 14 Jul 2023 12:56:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62029F805CB; Fri, 14 Jul 2023 12:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD2D2F80236
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 12:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2D2F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZtgRlVKI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689332141; x=1720868141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gt1bM8Q/FD2VIOVF2wWpS3Dslq5MDz04LTOzsoLpYFY=;
  b=ZtgRlVKI8rOwX4FAwU2YXBwDWRbNNnWtQt+uKo1Mklpj+WOf2cGF6iGf
   L0iZWGS301ie3H/dinpYJ15M9hp7PNw3Tjf+cMsxLCG1VGt2mmdSAMx4C
   ICYkBzuLdHk6GRUo6GXAGAJZv5rKsmwQ3Bw4QR/zoFq6AZ86HJsqBpihw
   fT5nV7qZLEn3qMdK0cpRlxRtMVHh37pR1gcLdTILC++731LjM9K1lY7e6
   T6nMcybOVOjmIuU6Z6m8LTvTBzSKs0+Elw7WoYklEbfi4r1DUgaMNskM1
   onQNW8wlXkFRnVteW+iffXDeCS2HZCWrydG0IstjMjfEf2shQbe6dpRaz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364321238"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="364321238"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 03:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722365600"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="722365600"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2023 03:55:36 -0700
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
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 12/15] ASoC: Intel: avs: Convert to PCI device IDs defines
Date: Fri, 14 Jul 2023 20:56:12 +0200
Message-Id: <20230714185615.370597-13-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XFCHA5KN4HOUF2RUPB5XODF755DUGDWP
X-Message-ID-Hash: XFCHA5KN4HOUF2RUPB5XODF755DUGDWP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFCHA5KN4HOUF2RUPB5XODF755DUGDWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header. Adjust AVS_MACH_ENTRY() macro,
so device ID can be provided in short form.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/board_selection.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 60f8fb0bff95..b32e02940e30 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -263,14 +263,14 @@ struct avs_acpi_boards {
 };
 
 #define AVS_MACH_ENTRY(_id, _mach) \
-	{ .id = (_id), .machs = (_mach), }
+	{ .id = PCI_DEVICE_ID_INTEL_##_id, .machs = (_mach), }
 
 /* supported I2S boards per platform */
 static const struct avs_acpi_boards i2s_boards[] = {
-	AVS_MACH_ENTRY(0x9d70, avs_skl_i2s_machines), /* SKL */
-	AVS_MACH_ENTRY(0x9d71, avs_kbl_i2s_machines), /* KBL */
-	AVS_MACH_ENTRY(0x5a98, avs_apl_i2s_machines), /* APL */
-	AVS_MACH_ENTRY(0x3198, avs_gml_i2s_machines), /* GML */
+	AVS_MACH_ENTRY(HDA_SKL_LP, avs_skl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_KBL_LP, avs_kbl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_APL, avs_apl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_GML, avs_gml_i2s_machines),
 	{},
 };
 
-- 
2.34.1

