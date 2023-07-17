Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E7756200
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 13:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C396DFA;
	Mon, 17 Jul 2023 13:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C396DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689594550;
	bh=j//TrXXHNXrhUqDD9T+gen6H5BoDir0XYkENmSPZ2rY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PCdeMG60dehOxyGoALlw+3wC0ehuKtidfj51/qgjp+DWIoHTlp3Um/3SB1ymYJ81T
	 43iz539NvsT6YyaUJRJ7Fj4ld5Tmy90ijeM9ltFioWm7fYNDENnM7AzLt4j4QmptqP
	 tkfGqQsK8/pwNFk1Z5FMxpUAkz2MbX93CiAXzvCI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7057F80553; Mon, 17 Jul 2023 13:46:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B37A5F80553;
	Mon, 17 Jul 2023 13:46:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 059D6F80588; Mon, 17 Jul 2023 13:45:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B685F80568
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B685F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=clFDFmPs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689594349; x=1721130349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j//TrXXHNXrhUqDD9T+gen6H5BoDir0XYkENmSPZ2rY=;
  b=clFDFmPsKC2PhXepG1B5w7lr04bGMydJherIHi0RyIsOVS4X/c674uSE
   HV3nT8F80dBOotNTr+DT+xpE9cOJOxkUZH8QEWktfb6z+TtmBAS4gKwqV
   G+FobfHbKtGK646dPSBdjtwsmHKnvahkJjEUNf0B4+dyZUDq5KNT7wLnG
   lIMSx53u7fT+ZNGlGKRgA6bOsT2wK9uWyvqvurbFmMuAjo2uwHN+uZaVo
   WvfaYi+nZcihJXwWehdHjCHOZ/t2Mdf5K6T47Rj9x1Y9oUhbjiQCaLjiC
   W8SywUewnRW1LJELdKBQm0W5wG6C3kxiu7R2U5y8d52rRegtnDh8Soupz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="363372889"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="363372889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="969856519"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200";
   d="scan'208";a="969856519"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 04:45:44 -0700
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
Subject: [PATCH v4 08/15] ASoC: Intel: Skylake: Use global PCI match macro
Date: Mon, 17 Jul 2023 13:45:04 +0200
Message-Id: <20230717114511.484999-9-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JRGBHWQOR7ZCVFW7T6HZD6ZKFDKB2UXQ
X-Message-ID-Hash: JRGBHWQOR7ZCVFW7T6HZD6ZKFDKB2UXQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRGBHWQOR7ZCVFW7T6HZD6ZKFDKB2UXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using local macro to match PCI device, use global one. As
Apollolake is Broxton-P successor that made it to the market, be precise
and use APL shortcut. IS_CFL() macro is dropped as it is unused.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hda_codec.h         | 3 ---
 sound/soc/intel/skylake/skl-pcm.c | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index bbb7805e85d8..5497dc9c396a 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -18,9 +18,6 @@
 #include <sound/hda_verbs.h>
 #include <sound/hda_regmap.h>
 
-#define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
-#define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
-
 /*
  * Structures
  */
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index a4209d88b0c6..ac3dc8c63c26 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -13,6 +13,7 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/delay.h>
+#include <sound/hdaudio.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "skl.h"
@@ -152,7 +153,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	 * The recommended SDxFMT programming sequence for BXT
 	 * platforms is to couple the stream before writing the format
 	 */
-	if (IS_BXT(skl->pci)) {
+	if (HDA_CONTROLLER_IS_APL(skl->pci)) {
 		snd_hdac_ext_stream_decouple(bus, stream, false);
 		err = snd_hdac_stream_setup(hdac_stream(stream));
 		snd_hdac_ext_stream_decouple(bus, stream, true);
-- 
2.34.1

