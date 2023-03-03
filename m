Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3052D6A98E9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 14:53:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 849C3DEC;
	Fri,  3 Mar 2023 14:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 849C3DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677851585;
	bh=fr1TX/muqSKhj7unvsuELKJ9mleoeebLhIbGPOllTKo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dbWQIyPlszzKUNbyaEvseBq6Ju5ShhY/eDkcBWHp8PHLn3kUPS1thwljNxb4IBxjT
	 5uA3W5Qi6J/78VXjIQKjJhDsfCeovSdRiSTJgarhBCIEkY/H0RVyB6sBTEbQ66vaf7
	 pHNL5Lctpnonx1X4NQAeVjkJ6IMwMJF8qepYk54Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 936CDF80553;
	Fri,  3 Mar 2023 14:50:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C73CF80542; Fri,  3 Mar 2023 14:50:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D0A4F80533
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 14:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0A4F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cEbkN7wQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677851442; x=1709387442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fr1TX/muqSKhj7unvsuELKJ9mleoeebLhIbGPOllTKo=;
  b=cEbkN7wQRQXxPqRU5Ple+NGGaANHhArPV5VQOXRjQe/m6ZAn2wKE2uLP
   OKQH0UGxVjnGD2hjslbq8X3zjdY8RxCTN+oZSI2UpVZ/0fPyowL0nrM0B
   svi1Etnz+pYD8+rmt7eUcrUEM/uD8pkeyAQumjrt2bLEE+1h/zwk697ty
   dcVJGtescTLqWU7QHFO9x4UYlCRqNoGYNb2MxsXFqhy2N2LgriUbOwkpT
   0/MN2lSp/TovIJuPhDc1Tv6hV6mmukBrgbZEhW0DpYyzb2rwYYvzIb8Qv
   BFzt41wuIIEDgUpLO/26LeMQ7q01uG6gQrOZuvsUMIvFPtpvMDgQ+Ajbt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336564466"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="336564466"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 05:49:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668660744"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400";
   d="scan'208";a="668660744"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 05:49:28 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: Intel: avs: ssm4567: Remove nau8825 bits
Date: Fri,  3 Mar 2023 14:48:53 +0100
Message-Id: <20230303134854.2277146-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303134854.2277146-1-amadeuszx.slawinski@linux.intel.com>
References: <20230303134854.2277146-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GZ4G55OH4JADGCLTMEGLOV7GWWE2L7BK
X-Message-ID-Hash: GZ4G55OH4JADGCLTMEGLOV7GWWE2L7BK
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZ4G55OH4JADGCLTMEGLOV7GWWE2L7BK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Some of the nau8825 clock control got into the ssm4567, remove it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/ssm4567.c | 31 ----------------------------
 1 file changed, 31 deletions(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index c5db69612762..2b7f5ad92aca 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -15,7 +15,6 @@
 #include <sound/soc-acpi.h>
 #include "../../../codecs/nau8825.h"
 
-#define SKL_NUVOTON_CODEC_DAI	"nau8825-hifi"
 #define SKL_SSM_CODEC_DAI	"ssm4567-hifi"
 
 static struct snd_soc_codec_conf card_codec_conf[] = {
@@ -34,41 +33,11 @@ static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Speaker"),
 };
 
-static int
-platform_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *control, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct snd_soc_dai *codec_dai;
-	int ret;
-
-	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
-	if (!codec_dai) {
-		dev_err(card->dev, "Codec dai not found\n");
-		return -EINVAL;
-	}
-
-	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_MCLK, 24000000,
-					     SND_SOC_CLOCK_IN);
-		if (ret < 0)
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-	} else {
-		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
-		if (ret < 0)
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-	}
-
-	return ret;
-}
-
 static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_SPK("Left Speaker", NULL),
 	SND_SOC_DAPM_SPK("Right Speaker", NULL),
 	SND_SOC_DAPM_SPK("DP1", NULL),
 	SND_SOC_DAPM_SPK("DP2", NULL),
-	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0, platform_clock_control,
-			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route card_base_routes[] = {
-- 
2.34.1

